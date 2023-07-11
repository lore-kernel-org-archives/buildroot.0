Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2E0EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3229A4049F;
	Tue, 11 Jul 2023 21:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3229A4049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QpjIp9Vxbefp; Tue, 11 Jul 2023 21:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D2D041512;
	Tue, 11 Jul 2023 21:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D2D041512
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5BA11BF32D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD71483A3F
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD71483A3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6dur8rkBKxar for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:47:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 798CD83410
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 798CD83410
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6582086E57; Tue, 11 Jul 2023 21:47:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 23:47:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d2a51dc8de7fc1072e1f7b1923d45d4f4694175
X-Git-Newrev: 8ebfce3c70df968fb5c3b9f5c1f9ba5f904cf630
X-Patchwork-Hint: ignore
Message-Id: <20230711214758.6582086E57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ocf-linux: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ebfce3c70df968fb5c3b9f5c1f9ba5f904cf630
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/88b/88b5d14b315af1669fff04f8c11c321cc4c107c7/

The package seems to be unmaintainted, asking for support of kernels
>= 5.6 a year ago was unanswered:
https://sourceforge.net/p/ocf-linux/mailman/message/37662698/

This patch follow Thomas' suggestion to remove the package:
https://lists.buildroot.org/pipermail/buildroot/2022-November/654688.html

Remove the virtual package cryptodev which is not needed anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                           |  6 ++++
 package/Config.in                          |  2 +-
 package/cryptodev-linux/Config.in          | 14 +++++++++
 package/cryptodev-linux/cryptodev-linux.mk |  2 --
 package/cryptodev/Config.in                | 50 ------------------------------
 package/cryptodev/cryptodev.mk             |  7 -----
 package/libopenssl/libopenssl.mk           |  6 ++--
 package/ocf-linux/ocf-linux.hash           |  2 --
 package/ocf-linux/ocf-linux.mk             | 26 ----------------
 package/openswan/openswan.mk               |  3 --
 10 files changed, 24 insertions(+), 94 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7184d0a8b9..9cf138f429 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,6 +152,12 @@ config BR2_PACKAGE_LIBASPLIB
 	help
 	  libasplib is no longer needed.
 
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
index c9d5c9ccaa..e6ed56a811 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1473,7 +1473,7 @@ menu "Crypto"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
