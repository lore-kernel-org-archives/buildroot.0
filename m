Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63864C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 04:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 053534098C;
	Fri, 11 Mar 2022 04:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALTmYzpNVjeI; Fri, 11 Mar 2022 04:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21766403C7;
	Fri, 11 Mar 2022 04:48:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFEDE1BF3A7
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 04:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD4F6405AE
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 04:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mgqkpP-FeURn for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 04:48:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4E5740424
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 04:48:20 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id e3so7034192pjm.5
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q47vrHCOPDTLDy0557idTVNZUmq4vX5OPSHwVzg6mmo=;
 b=JHlvYP1Yl83QRr3igM4qR6xGo3Ud+LqF4d1yulgqA1ZTnvzOgmb+DlUfjCQl5L7/EU
 +anbMrS1MmGKqmjTp4SkZJ6LGzvffh4bohPFp5sKvBCYwBrHEo6W6P22fAjRc/uGsKJI
 2drbX5zJUBaSYVrUtn6QZb2S9d2D7V6iAqFpAUgsCLJFODIB22ut6TJLzLHqvG4KYSDU
 Ai45Nl1/9eXnpQ41aKPtHhWZilgBNRyYFgUuvUaCPIz3jNOu914l3fh1Wao+ZqoQUJwh
 Ngc9O4Zc7jBMg6415FQg5jO+7wpXLfQSwPuyCVCq6WYEeynXiSXp3SNFjVI+I8Tuve1D
 SM/g==
X-Gm-Message-State: AOAM533ClZXIYBAyNSrS/He0ThguLqtSBia6cNYkxkCeigSI5gA4J2yZ
 J86HMaJJ9tkfW+v/S5axLPdsmskJAy4=
X-Google-Smtp-Source: ABdhPJxOXqqmOkjdwULNUvtCSOEqaOFGK0EI7PMRUu2qfkSdZRJ7FcBGfmf0pdUWitiCwrimE88UrQ==
X-Received: by 2002:a17:90b:3c5:b0:1bf:9766:2ed2 with SMTP id
 go5-20020a17090b03c500b001bf97662ed2mr16301076pjb.165.1646974099845; 
 Thu, 10 Mar 2022 20:48:19 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a17090a8d8400b001bc386dc44bsm11195832pjo.23.2022.03.10.20.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 20:48:19 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 20:48:16 -0800
Message-Id: <20220311044816.3222673-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package/nerdctl: new package
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tian Yuanhao <tianyuanhao3@163.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

nerdctl is a CLI for containerd (package docker-containerd) which is drop-in
compatible with the Docker Daemon CLI.

This allows using the lighter weight containerd daemon directly, instead of via
the additional docker daemon. It also implements rootless mode.

https://github.com/containerd/nerdctl

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1:

 - pkg-golang does not support main.go at root of project
 - https://bugs.busybox.net/show_bug.cgi?id=13651
 - override the build command instead

v2:

 - bump to 0.8.0
 - go now works fine with /. targets, remove command override
 - docker-containerd was renamed to containerd

v3:

 - bump to version 0.17.1 from 0.8.0
 - add correct build targets

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in            |  1 +
 package/nerdctl/Config.in    | 24 ++++++++++++++++++++++++
 package/nerdctl/nerdctl.hash |  3 +++
 package/nerdctl/nerdctl.mk   | 20 ++++++++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 package/nerdctl/Config.in
 create mode 100644 package/nerdctl/nerdctl.hash
 create mode 100644 package/nerdctl/nerdctl.mk

diff --git a/package/Config.in b/package/Config.in
index 0d5d763180..8f68c464db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2554,6 +2554,7 @@ menu "System tools"
 	source "package/monit/Config.in"
 	source "package/multipath-tools/Config.in"
 	source "package/ncdu/Config.in"
+	source "package/nerdctl/Config.in"
 	source "package/netifrc/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
diff --git a/package/nerdctl/Config.in b/package/nerdctl/Config.in
new file mode 100644
index 0000000000..51a2919d9d
--- /dev/null
+++ b/package/nerdctl/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_NERDCTL
+	bool "nerdctl"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd
+	depends on BR2_USE_MMU # util-linux
+	select BR2_PACKAGE_CONTAINERD # containerd runtime dependency
+	select BR2_PACKAGE_RUNC # containerd runtime dependency
+	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES # containerd
+	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT # containerd
+	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT # containerd
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT # containerd
+	help
+	  Docker-compatible CLI for containerd, controlling runc.
+
+	  https://github.com/containerd/nerdctl
+
+comment "nerdctl needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/nerdctl/nerdctl.hash b/package/nerdctl/nerdctl.hash
new file mode 100644
index 0000000000..a31b12b26d
--- /dev/null
+++ b/package/nerdctl/nerdctl.hash
@@ -0,0 +1,3 @@
+# Computed locally
+sha256  be41804ef139a3f92b774edc8439678e56b44033d7ab3fcf4389f0865c1fe069  nerdctl-0.17.1.tar.gz
+sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/nerdctl/nerdctl.mk b/package/nerdctl/nerdctl.mk
new file mode 100644
index 0000000000..3f3c04aa11
--- /dev/null
+++ b/package/nerdctl/nerdctl.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# nerdctl
+#
+################################################################################
+
+NERDCTL_VERSION = 0.17.1
+NERDCTL_SITE = $(call github,containerd,nerdctl,v$(NERDCTL_VERSION))
+
+NERDCTL_LICENSE = Apache-2.0
+NERDCTL_LICENSE_FILES = LICENSE
+
+NERDCTL_GOMOD = github.com/containerd/nerdctl
+
+NERDCTL_LDFLAGS = \
+	-X $(NERDCTL_GOMOD)/pkg/version.Version=$(NERDCTL_VERSION)
+
+NERDCTL_BUILD_TARGETS = cmd/nerdctl
+
+$(eval $(golang-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
