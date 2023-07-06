Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1BDEB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 19:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CF24415A0;
	Thu,  6 Jul 2023 19:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CF24415A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQiAw4YMEAA6; Thu,  6 Jul 2023 19:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04A82415AE;
	Thu,  6 Jul 2023 19:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04A82415AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 833E41BF4E6
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A230822BE
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A230822BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0uVZD6MRxcU for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 19:19:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DC458229D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DC458229D
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 19:19:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 086B5A4C0946
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 21:19:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34628)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qHUVU-0006Qs-23
 for buildroot@buildroot.org; Thu, 06 Jul 2023 21:19:12 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 21:19:11 +0200
Message-Id: <20230706191912.3008144-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688671153;
 bh=UpAdUK7q5JM2URzsbZN3G53ufS647hZlqorwXwee9Ag=;
 h=From:To:Subject:Date:From;
 b=jHJMCU0u9qtABH0ES8/kzrv5Lh5T9DYfY/uUx+unn12p74cojShzCDRgkgQb6KlPZ
 LU2uTfiDR46eJFdDOGyttBvsPz0Nawx95alsC4PQ9ynBNyIjsgayzOtFoOe4XiXKxO
 0eXcarrJ4k41mxQWQA5STivFlQLFeadiFCxntn26rSke2yTolAAqCumErRG5bwKuVr
 wJ6bXK+ji7XLB3BQCo5D4V1kRT4ogOL7F70NaZpfaJBX0KDDkKgThYBBVqkTFYvw3i
 JfHi6XfMvz4xG0gV8nPtv4Xh77CGGy6DJgZl0T8dzjVZUW9/QGCQmlASC/qro+C95D
 r8wH9RJwJMnRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=jHJMCU0u
Subject: [Buildroot] [PATCH 1/2] package/ocf-linux: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/88b/88b5d14b315af1669fff04f8c11c321cc4c107c7/

The package seems to be unmainted, asking for support of kernels >= 5.6
a year ago was unanswered:
https://sourceforge.net/p/ocf-linux/mailman/message/37662698/

This patch follow Thomas' suggestion to remove the package:
https://lists.buildroot.org/pipermail/buildroot/2022-November/654688.html

Remove the virtual package cryptodev which is not needed anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                           | 14 ++++++
 package/Config.in                          |  2 +-
 package/cryptodev-linux/Config.in          | 14 ++++++
 package/cryptodev-linux/cryptodev-linux.mk |  2 -
 package/cryptodev/Config.in                | 50 ----------------------
 package/cryptodev/cryptodev.mk             |  7 ---
 package/libopenssl/libopenssl.mk           |  6 +--
 package/ocf-linux/ocf-linux.hash           |  2 -
 package/ocf-linux/ocf-linux.mk             | 26 -----------
 package/openswan/openswan.mk               |  3 --
 10 files changed, 32 insertions(+), 94 deletions(-)
 create mode 100644 package/cryptodev-linux/Config.in
 delete mode 100644 package/cryptodev/Config.in
 delete mode 100644 package/cryptodev/cryptodev.mk
 delete mode 100644 package/ocf-linux/ocf-linux.hash
 delete mode 100644 package/ocf-linux/ocf-linux.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index d3a67aba83..5b4a55aac1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,20 @@ endif
 
 comment "Legacy options removed in 2023.08"
 
+config BR2_PACKAGE_CRYPTODEV
+	bool "cryptodev virtual package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_CRYPTODEV_LINUX if !BR2_microblaze
+	help
+	  This virtual package is not needed anymore due to the removal
+	  of ocf-linux.
+
+config BR2_PACKAGE_OCF_LINUX
+	bool "ocf-linux has been removed"
+	select BR2_LEGACY
+	help
+	  ocf-linux is incompatible with newer kernels.
+
 config BR2_BINUTILS_VERSION_2_37_X
 	bool "binutils 2.37.x has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index bff090a661..3abbce72a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1474,7 +1474,7 @@ menu "Crypto"
 	source "package/beecrypt/Config.in"
 	source "package/botan/Config.in"
 	source "package/ca-certificates/Config.in"
-	source "package/cryptodev/Config.in"
+	source "package/cryptodev-linux/Config.in"
 	source "package/cryptopp/Config.in"
 	source "package/gcr/Config.in"
 	source "package/gnutls/Config.in"
diff --git a/package/cryptodev-linux/Config.in b/package/cryptodev-linux/Config.in
new file mode 100644
index 0000000000..89964ab058
--- /dev/null
+++ b/package/cryptodev-linux/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_CRYPTODEV_LINUX
+	bool "cryptodev-linux"
+	depends on !BR2_microblaze
+	depends on BR2_LINUX_KERNEL
+	help
+	  Cryptodev-linux is a device that allows access to Linux kernel
+	  cryptographic drivers; thus allowing userspace applications
+	  to take advantage of hardware accelerators.
+
+	  http://cryptodev-linux.org/index.html
+
+comment "cryptodev-linux needs a Linux kernel to be built"
+	depends on !BR2_microblaze
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index d0c3bc5218..5a9e6ad233 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -11,8 +11,6 @@ CRYPTODEV_LINUX_LICENSE = GPL-2.0+
 CRYPTODEV_LINUX_LICENSE_FILES = COPYING
 CRYPTODEV_LINUX_CPE_ID_VENDOR = cryptodev-linux
 
-CRYPTODEV_LINUX_PROVIDES = cryptodev
-
 define CRYPTODEV_LINUX_MODULE_GEN_VERSION_H
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) version.h
 endef
diff --git a/package/cryptodev/Config.in b/package/cryptodev/Config.in
deleted file mode 100644
index d1e64498a8..0000000000
--- a/package/cryptodev/Config.in
+++ /dev/null
@@ -1,50 +0,0 @@
-comment "cryptodev needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
-
-config BR2_PACKAGE_CRYPTODEV
-	bool "cryptodev"
-	depends on BR2_LINUX_KERNEL
-	help
-	  Select the desired cryptodev implementation.
-
-if BR2_PACKAGE_CRYPTODEV
-
-choice
-	prompt "cryptodev variant"
-	default BR2_PACKAGE_CRYPTODEV_LINUX if !BR2_microblaze
-	help
-	  Select the cryptodev implementation.
-
-config BR2_PACKAGE_CRYPTODEV_LINUX
-	bool "cryptodev-linux"
-	depends on !BR2_microblaze
-	select BR2_PACKAGE_HAS_CRYPTODEV
-	help
-	  Cryptodev-linux is a device that allows access to Linux kernel
-	  cryptographic drivers; thus allowing userspace applications
-	  to take advantage of hardware accelerators.
-
-	  http://cryptodev-linux.org/index.html
-
-config BR2_PACKAGE_OCF_LINUX
-	bool "ocf-linux"
-	select BR2_PACKAGE_HAS_CRYPTODEV
-	help
-	  OCF-Linux is a Linux port of the OpenBSD/FreeBSD Cryptographic
-	  Framework (OCF). This port aims to bring full asynchronous
-	  HW/SW crypto acceleration to the Linux kernel and applications
-	  running under Linux.
-
-	  http://ocf-linux.sourceforge.net/
-
-endchoice
-
-config BR2_PACKAGE_HAS_CRYPTODEV
-	bool
-
-config BR2_PACKAGE_PROVIDES_CRYPTODEV
-	string
-	default "cryptodev-linux" if BR2_PACKAGE_CRYPTODEV_LINUX
-	default "ocf-linux"       if BR2_PACKAGE_OCF_LINUX
-
-endif
diff --git a/package/cryptodev/cryptodev.mk b/package/cryptodev/cryptodev.mk
deleted file mode 100644
index 969d1bd17a..0000000000
--- a/package/cryptodev/cryptodev.mk
+++ /dev/null
@@ -1,7 +0,0 @@
-################################################################################
-#
-# cryptodev
-#
-################################################################################
-
-$(eval $(virtual-package))
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 178979f43b..cd3ba3df30 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -29,8 +29,8 @@ ifeq ($(BR2_USE_MMU),)
 LIBOPENSSL_CFLAGS += -DHAVE_FORK=0 -DOPENSSL_NO_MADVISE
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_CRYPTODEV),y)
-LIBOPENSSL_DEPENDENCIES += cryptodev
+ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
+LIBOPENSSL_DEPENDENCIES += cryptodev-linux
 endif
 
 # fixes the following build failures:
@@ -76,7 +76,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_TOOLCHAIN_HAS_LIBATOMIC),-latomic) \
 			$(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
 			$(if $(BR2_STATIC_LIBS),no-shared,shared) \
-			$(if $(BR2_PACKAGE_HAS_CRYPTODEV),enable-devcryptoeng) \
+			$(if $(BR2_PACKAGE_CRYPTODEV_LINUX),enable-devcryptoeng) \
 			no-rc5 \
 			enable-camellia \
 			no-tests \
diff --git a/package/ocf-linux/ocf-linux.hash b/package/ocf-linux/ocf-linux.hash
deleted file mode 100644
index 747bbcab56..0000000000
--- a/package/ocf-linux/ocf-linux.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed:
-sha256  3d7984754d58ced5695889744caf1e18a53f5d2e35ed40cc04d3595e59b7431f  ocf-linux-20171122.tar.gz
diff --git a/package/ocf-linux/ocf-linux.mk b/package/ocf-linux/ocf-linux.mk
deleted file mode 100644
index 52169eda4f..0000000000
--- a/package/ocf-linux/ocf-linux.mk
+++ /dev/null
@@ -1,26 +0,0 @@
-################################################################################
-#
-# ocf-linux
-#
-################################################################################
-
-OCF_LINUX_VERSION = 20171122
-OCF_LINUX_SITE = http://downloads.sourceforge.net/project/ocf-linux/ocf-linux/$(OCF_LINUX_VERSION)
-OCF_LINUX_INSTALL_STAGING = YES
-
-OCF_LINUX_PROVIDES = cryptodev
-
-OCF_LINUX_MODULE_SUBDIRS = ocf
-OCF_LINUX_MODULE_MAKE_OPTS = \
-	CONFIG_OCF_OCF=m \
-	CONFIG_OCF_CRYPTOSOFT=m \
-	CONFIG_OCF_BENCH=m \
-	CONFIG_OCF_OCFNULL=m
-
-define OCF_LINUX_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
-		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
-endef
-
-$(eval $(kernel-module))
-$(eval $(generic-package))
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index bb56e4516c..4c6a779f0d 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -25,9 +25,6 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENSWAN_DEPENDENCIES += openssl
 OPENSWAN_MAKE_OPTS += HAVE_OPENSSL=true
-ifeq ($(BR2_PACKAGE_OCF_LINUX),y)
-OPENSWAN_MAKE_OPTS += HAVE_OCF=true
-endif
 endif
 
 define OPENSWAN_BUILD_CMDS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
