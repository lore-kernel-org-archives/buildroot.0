Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E32C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60009612EA;
	Thu, 19 May 2022 14:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abnpHOb641Ya; Thu, 19 May 2022 14:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4726C612EF;
	Thu, 19 May 2022 14:05:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1635A1BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04603612EB
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKz6M4B3Hce1 for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:05:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B29E612E4
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:05:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j24so7357441wrb.1
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/VQQlFStfc3eMgyuXFMcZL+3takX1ZJtc5g4FaLJ+Y=;
 b=3IWCbD0vV0C3dZOSx/QDSzofIRyZMf++H6ZVwfwpzRyPzrsI5gxcL6H6CeKG87FyCJ
 OiurbFuzM+ReWhT8F0FjLGc275X6AVK6pYvKJ55YwAFBYdUvcihVpkD09zP4h/JhSQ7X
 z/UBLsajiVLFT3SzyizCckqjKsdImhdJqbTcOrhvbhfmBrgWXuwOlWVh62JwfgABePT9
 bjsZ9jOqlLjO3/wodzmi7BnOMh/8wP+YjAPNA4D7ygTjNkoFV7NBHUPod1djERFIAXT7
 otCx2i9ZHCPfqSiTrDOdWyR8CDL9HQdCxdSKCuB2uaGcflWRLxQArEEexjO58mobsKGW
 MNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/VQQlFStfc3eMgyuXFMcZL+3takX1ZJtc5g4FaLJ+Y=;
 b=NRPbFebMKhobmIe5j8zC1rBZqEMBfv3AirXPHNq60q260kn77RqWm/2DmTv3ERhi0F
 yu5t88TelTLILitv8x2pzNychsYjMBjUHWDx6Hww/IFA0CK6aKW5iOD40L0GcveUPB+k
 v5iTXaeoxIQ+yAhF62IYcaOHr7kfRvbX6tUgH4Ft47dB4lLRtVqQkBHt+0DHGn5iNzXc
 4iBFwfCIFDjxaDfEeTkYE58N9u6pXenbeogvWAGQWT5N2ObIwXCcqHEbzceN76AF0Gth
 yrmkKRyjQJsscxKlwNAymfGAb7HtzUq9l/ckiWWQPhWJ8DzTvhivVuwiDAPC1deSdEGI
 gcLg==
X-Gm-Message-State: AOAM533YsSys8LdIdKMf5wF3LWxeshqC4kxikdCdluZsmyrGsAVgKI1H
 jkO0u18t6ux62fT/Mm1nvJK2NguHTv3csQ==
X-Google-Smtp-Source: ABdhPJyKFD5LURhLld7AePtcc2xqW1MsXvlad/42/7IBLOmuUYExqcY2NXl84wCuMioJyppPS76BTw==
X-Received: by 2002:a5d:6802:0:b0:20e:5e12:cb67 with SMTP id
 w2-20020a5d6802000000b0020e5e12cb67mr4221832wru.61.1652969102251; 
 Thu, 19 May 2022 07:05:02 -0700 (PDT)
Received: from nitra.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 d8-20020adfa348000000b0020c5253d8e6sm5017155wrb.50.2022.05.19.07.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:05:01 -0700 (PDT)
From: Nicolas Tran <nicolas.tran@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:04:53 +0200
Message-Id: <20220519140453.1546982-1-nicolas.tran@smile.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rust-coreutils: new package
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

rust-coreutils is a package from the Github project
uutils/coreutils containing the equivalent of
the GNU coreutils basic shell commands integrated
in Rust language.
It can be convinient for purposes of Rust-written systems as
it runs in a stable version of Rust.

The package has been checked with correct formatting and
without typos:
$ ./utils/check-package package/rust-coreutils/*

Tests have been run to ensure toolchain compatibilities:
$ ./utils/test-pkg package/rust-coreutils
  bootlin-armv5-uclibc [1/6]: SKIPPED
   bootlin-armv7-glibc [2/6]: OK
 bootlin-armv7m-uclibc [3/6]: SKIPPED
   bootlin-x86-64-musl [4/6]: OK
    br-arm-full-static [5/6]: SKIPPED
          sourcery-arm [6/6]: OK

Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
---
 package/Config.in                          |  2 +-
 package/rust-coreutils/Config.in           | 17 +++++++++++++++++
 package/rust-coreutils/rust-coreutils.hash |  3 +++
 package/rust-coreutils/rust-coreutils.mk   | 12 ++++++++++++
 4 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 package/rust-coreutils/Config.in
 create mode 100644 package/rust-coreutils/rust-coreutils.hash
 create mode 100644 package/rust-coreutils/rust-coreutils.mk

diff --git a/package/Config.in b/package/Config.in
index 8892134133..94f92b35b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1,5 +1,4 @@
 menu "Target packages"
-
 	source "package/busybox/Config.in"
 	source "package/skeleton/Config.in"
 	source "package/skeleton-custom/Config.in"
@@ -2579,6 +2578,7 @@ menu "System tools"
 	source "package/rauc/Config.in"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
+	source "package/rust-coreutils/Config.in"
 	source "package/s390-tools/Config.in"
 	source "package/s6/Config.in"
 	source "package/s6-linux-init/Config.in"
diff --git a/package/rust-coreutils/Config.in b/package/rust-coreutils/Config.in
new file mode 100644
index 0000000000..af6e870709
--- /dev/null
+++ b/package/rust-coreutils/Config.in
@@ -0,0 +1,17 @@
+################################################################################
+#
+# rust-coreutils
+#
+################################################################################
+
+config BR2_PACKAGE_RUST_COREUTILS
+	bool "rust-coreutils"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  rust-coreutils is a package from the Github project
+	  uutils/coreutils containing the equivalent of
+	  the GNU coreutils basic shell commands integrated
+	  in Rust language.
+
+	  https://github.com/uutils/coreutils
diff --git a/package/rust-coreutils/rust-coreutils.hash b/package/rust-coreutils/rust-coreutils.hash
new file mode 100644
index 0000000000..065de0eec5
--- /dev/null
+++ b/package/rust-coreutils/rust-coreutils.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  7cd05ebde1302a27e7a26430efc7d522b86e3d8f22ad606275a1a96485424e46  rust-coreutils-0.0.13.tar.gz
+sha256  a836eb3360d0e80f6a1620495543ad2a4e20e4cf72af89ff528fccf9e63be81e  LICENSE
diff --git a/package/rust-coreutils/rust-coreutils.mk b/package/rust-coreutils/rust-coreutils.mk
new file mode 100644
index 0000000000..1296db0ff2
--- /dev/null
+++ b/package/rust-coreutils/rust-coreutils.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# rust-coreutils
+#
+################################################################################
+
+RUST_COREUTILS_VERSION = 0.0.13
+RUST_COREUTILS_SITE = $(call github,uutils,coreutils,$(RUST_COREUTILS_VERSION))
+RUST_COREUTILS_LICENSE = MIT
+RUST_COREUTILS_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
