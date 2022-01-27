Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED802C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 04:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 582B840B35;
	Thu, 27 Jan 2022 04:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FT4w5AE-DgjU; Thu, 27 Jan 2022 04:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51FB740B29;
	Thu, 27 Jan 2022 04:02:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A14521BF32A
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 04:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89FBC401D5
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 04:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pIaQsCYcQDmf for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 04:02:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6C34401BE
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 04:02:53 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id c9so1377961plg.11
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T/zXhNmPok2n3dhWL5x6rhIojFHNgD9jK6whvvCwd3Q=;
 b=33nWsCNiwTI3VCvvXMrDzNcbiDqq/ZQkRc7q/2HmZJ0XEtp3Y+xrC9+qVqxsJ/JTVe
 n57bLmAYLMiIOdNf9BEo7/5NQOb4Cw1W30V35KLHHpLVR32WuxXur/++UjwhvMrY7Jlr
 til7/S5RlM0qBbFuGA0QEL29m5EYxBQwK+WSPj6yHI6YfRCMa2OFJ5j+QUnDRnqENEqR
 IUdVeXbmkbGTCbnrDW/sFKo5aOyu/5uH69Yu5JToBaKAuM9YZkEzG5eq2fsCL0QONAoa
 LtnutIiZUUN+bjYAEaSe/g7d+eovVLD/4FBKx8aH+Oznxw8sQA4ivmthP2EZMsiZIJ0d
 1EpQ==
X-Gm-Message-State: AOAM5321R/EH9I4kEUlPAr0f+cUNtpquzGDc/C7l1ib0+OBnSn8ClJ9h
 rBZiqMdyvhrZRiH4+IJRrD2aeu4KIlYLEA==
X-Google-Smtp-Source: ABdhPJxuMtuO01Wxe9JrxKRcNlst45wgEJkd/e+kqX79N1eo2bG8a8C4vrE3D9ZnfV2Z2n9uHasaYg==
X-Received: by 2002:a17:902:f693:: with SMTP id
 l19mr1799757plg.146.1643256172800; 
 Wed, 26 Jan 2022 20:02:52 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 pj5sm681379pjb.0.2022.01.26.20.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 20:02:52 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 20:02:49 -0800
Message-Id: <20220127040250.128604-1-christian@paral.in>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/runc: add host package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds support for building runc as a host package.

The bin name and gomod have to be specified as the pkg-golang infrastructure
assumes the bin name will be "host-runc" on default.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in.host      | 1 +
 package/runc/Config.in.host | 8 ++++++++
 package/runc/runc.mk        | 8 ++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 package/runc/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 341e24926b..2ce015eacf 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -81,6 +81,7 @@ menu "Host utilities"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
+	source "package/runc/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
diff --git a/package/runc/Config.in.host b/package/runc/Config.in.host
new file mode 100644
index 0000000000..ce0dd518a6
--- /dev/null
+++ b/package/runc/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_RUNC
+	bool "host runc"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	help
+	  runC is a CLI tool for spawning and running containers
+	  according to the OCP specification.
+
+	  https://github.com/opencontainers/runc
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index c4e45a00a9..932bf39eea 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -10,6 +10,8 @@ RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 RUNC_CPE_ID_VENDOR = linuxfoundation
 
+RUNC_GOMOD = github.com/opencontainers/runc
+
 RUNC_LDFLAGS = -X main.version=$(RUNC_VERSION)
 RUNC_TAGS = cgo static_build
 
@@ -23,4 +25,10 @@ RUNC_TAGS += seccomp
 RUNC_DEPENDENCIES += libseccomp host-pkgconf
 endif
 
+HOST_RUNC_BIN_NAME = runc
+HOST_RUNC_LDFLAGS = $(RUNC_LDFLAGS)
+HOST_RUNC_TAGS = $(RUNC_TAGS)
+HOST_RUNC_INSTALL_BINS = $(HOST_RUNC_BIN_NAME)
+
 $(eval $(golang-package))
+$(eval $(host-golang-package))
-- 
2.35.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
