Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E098C433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 08:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A02B3843E1;
	Thu, 19 May 2022 08:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Et6ScCXLnJRY; Thu, 19 May 2022 08:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0224843DF;
	Thu, 19 May 2022 08:28:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 875FD1BF426
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 08:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7584F4057C
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 08:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-AP31O2Exod for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 08:28:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECC8C400DA
 for <buildroot@buildroot.org>; Thu, 19 May 2022 08:28:19 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso530735wmn.4
 for <buildroot@buildroot.org>; Thu, 19 May 2022 01:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Mvx7OEsuJjuFEVAhUr0noKRiQiJxD3s/SwS01C0O70=;
 b=OjqmU+jgHEBYXUyUlku4Drfr/lhJc9tZ49/4XQe/VSYWxLLh77Usf48DWL6nk1xt83
 Ev9Bz/f9ay/+1B5mCqw9JgAZV5t4N9HM62gSv5u86nL+fzzcQWQ5AVxGjrMvOr2EGuCV
 aPxih7way38AWQgtIXP+SjcYs7doos1lzv0EbRRxU8E4TGlNfWF1OqpG8bVlP/R1rtCy
 qKhM1P/gTVP1JZPdWIk+5PD4dXX4aH0XrVzqtTmX6g3kV9ZZ/o5LHI6m/ql66q51H5fi
 t8xMt0tZQos/7w4BGQj6t25TiRqrhMrQm7a35j5PbRYraoUCZvfw9v1T+dJmIagn4wl8
 Hrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Mvx7OEsuJjuFEVAhUr0noKRiQiJxD3s/SwS01C0O70=;
 b=kc+8G4p5h/DNZCqpTB6znK0n38bzCnU2b1fYQ+j9OttCliis6Rq+WfLFLGaKLTUEgX
 qan1abUMWYtQExVKLKEKIKGKeQQLSbLp5vRzXgadxKuYCB2IJdJPy7O1AxNDVRilohVX
 hsvuQEkz/RXZ31fTfP7Ve/xmdE9YdZLWjFHUvoI+UgDPl3uygZLli9ItB0RaEQAwwSp4
 ncnfvBbDjctIe0k2CWfxvGxavYyXvRNdDjKq6PvNP1MwEisosmx7Cl9PFtgVfGDLyWIW
 BY5VWAJctx7K/cWZivGik8CSB+CSXtDEZM6+Bc/WYeNgt6WVtiZaZC5Ta+/SGkUGb70y
 Hdlg==
X-Gm-Message-State: AOAM531pZ/Fbbi2NRrCMBx4kNMmrIGpJ+RIZ8KqZErHPqjZx5fVZ+9oG
 r5OOnvm6YkGoo/CSXFGLNVGECSEezRrayw==
X-Google-Smtp-Source: ABdhPJzlrIwQPAxoB7pcQR2qb9Iio2ABhiAqOX199q6yGBCySrW8Di0QG5e+vDTVVRN+XpfatfZmPA==
X-Received: by 2002:a05:600c:1e13:b0:394:5cdd:e8e6 with SMTP id
 ay19-20020a05600c1e1300b003945cdde8e6mr3159580wmb.108.1652948897866; 
 Thu, 19 May 2022 01:28:17 -0700 (PDT)
Received: from nitra.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a5d64c1000000b0020c5253d927sm4284244wri.115.2022.05.19.01.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 01:28:17 -0700 (PDT)
From: Nicolas Tran <nicolas.tran@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 10:28:00 +0200
Message-Id: <20220519082800.926607-1-nicolas.tran@smile.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/hyperfine: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Nicolas Tran <nicolas.tran@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

hyperfine is a benchmark tool written in Rust. It evaluates
execution time of a command passed in arguments and make
a relative comparison if multiple arguments are used at the
same time.
It can be convinient for purposes of Rust-written systems as
it runs in a stable version of Rust.

The package has been checked with correct formatting and
without typos:
./utils/check-package package/hyperfine/*

A CI test was run on gitlab.com to verify toolchain compatibilities.

Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
---
test-pkg config:
BR2_PACKAGE_HYPERFINE=y
---
 package/Config.in                |  1 +
 package/hyperfine/Config.in      | 11 +++++++++++
 package/hyperfine/hyperfine.hash |  4 ++++
 package/hyperfine/hyperfine.mk   | 12 ++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/hyperfine/Config.in
 create mode 100644 package/hyperfine/hyperfine.hash
 create mode 100644 package/hyperfine/hyperfine.mk

diff --git a/package/Config.in b/package/Config.in
index 8892134133..4875f98a8d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -104,6 +104,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/fwts/Config.in"
 	source "package/gdb/Config.in"
 	source "package/google-breakpad/Config.in"
+	source "package/hyperfine/Config.in"
 	source "package/iozone/Config.in"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
diff --git a/package/hyperfine/Config.in b/package/hyperfine/Config.in
new file mode 100644
index 0000000000..4a67a071c3
--- /dev/null
+++ b/package/hyperfine/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HYPERFINE
+	bool "hyperfine"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  hyperfine is a benchmark tool written in Rust. It evaluates 
+	  execution time of a command passed in arguments and make 
+	  a relative comparison if multiple arguments are used at the 
+	  same time.
+
+	  https://github.com/sharkdp/hyperfine
diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
new file mode 100644
index 0000000000..50cc7694b3
--- /dev/null
+++ b/package/hyperfine/hyperfine.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  28fcd72c556b4ca2150577217a4d7d51907b7e00ff86b764943d068202a92ace  hyperfine-1.14.0.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
+sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.mk b/package/hyperfine/hyperfine.mk
new file mode 100644
index 0000000000..62246f002e
--- /dev/null
+++ b/package/hyperfine/hyperfine.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# hyperfine
+#
+################################################################################
+
+HYPERFINE_VERSION = 1.14.0
+HYPERFINE_SITE = $(call github,sharkdp,hyperfine,v$(HYPERFINE_VERSION))
+HYPERFINE_LICENSE = Apache-2.0 or MIT
+HYPERFINE_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(cargo-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
