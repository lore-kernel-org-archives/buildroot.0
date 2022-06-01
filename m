Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0251DC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4D964154F;
	Tue,  7 Jun 2022 19:23:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CuUcaUkkPk83; Tue,  7 Jun 2022 19:23:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 757E54151A;
	Tue,  7 Jun 2022 19:23:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C12C61BF9B4
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E73384074
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A0v9329Yv-xO for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0DA683FEB
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A442186E22; Tue,  7 Jun 2022 19:04:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 22:43:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd018f78de99ea78633694dba011f155849dde32
X-Git-Newrev: 4bb884a3c61c6b71e33f69453a90eb2a367f64b7
X-Patchwork-Hint: ignore
Message-Id: <20220607190457.A442186E22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolftpm: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4bb884a3c61c6b71e33f69453a90eb2a367f64b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wolfTPM is an open-source TPM 2.0 stack with backward API compatibility,
designed for embedded use. It is highly portable, and has native support
for Linux. wolfTPM has a compact code size with low resource usage.

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
[Thomas:
 - Fix ordering in the DEVELOPERS file, use full name
 - Add missing !BR2_STATIC_LIBS dependency
 - Use "select" and not "select on"
 - Make sure wolftpm-config script gets post-processed by using
   <pkg>_CONFIG_SCRIPTS
 - Add missing --with-wolfcrypt option.
 - Rename WOLFTPM_CONFIG_RPATH to WOLFTPM_TOUCH_CONFIG_RPATH and use
   mkdir -p to make the hook re-executable]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/wolftpm/Config.in    | 16 ++++++++++++++++
 package/wolftpm/wolftpm.hash |  2 ++
 package/wolftpm/wolftpm.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fe840f33f5..7bc0e0632c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -729,6 +729,9 @@ F:	package/s6/
 F:	package/skalibs/
 F:	support/testing/tests/boot/test_edk2.py
 
+N:	Dimitar Tomov <dimi@tpm.dev>
+F:	package/wolftpm/
+
 N:	Dimitrios Siganos <dimitris@siganos.org>
 F:	package/wireless-regdb/
 
diff --git a/package/Config.in b/package/Config.in
index 4ab61713e0..8f1a7d4e9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1433,6 +1433,7 @@ menu "Crypto"
 	source "package/trousers/Config.in"
 	source "package/ustream-ssl/Config.in"
 	source "package/wolfssl/Config.in"
+	source "package/wolftpm/Config.in"
 endmenu
 
 menu "Database"
diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
new file mode 100644
index 0000000000..0fe094f277
--- /dev/null
+++ b/package/wolftpm/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_WOLFTPM
+	bool "wolftpm"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_WOLFSSL
+	select BR2_PACKAGE_WOLFSSL_ALL
+	help
+	  wolfTPM is a portable, open-source TPM 2.0 stack with
+	  backward API compatibility, designed for embedded use.
+	  No external dependencies, compact code size with low
+	  resource usage.
+
+	  https://www.wolfssl.com/
+
+comment "wolftpm needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
new file mode 100644
index 0000000000..6dbf143ffe
--- /dev/null
+++ b/package/wolftpm/wolftpm.hash
@@ -0,0 +1,2 @@
+# Hash from https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.3.1.tar.gz
+sha256  f0d7c095491ac2cc9e44aa4ac3c22febf15942ef080431d8b43a9d0312ca6567  wolftpm-2.3.1.tar.gz
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
new file mode 100644
index 0000000000..ea01eaad6b
--- /dev/null
+++ b/package/wolftpm/wolftpm.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# wolftpm
+#
+################################################################################
+
+WOLFTPM_VERSION = 2.3.1
+WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
+WOLFTPM_INSTALL_STAGING = YES
+WOLFTPM_LICENSE = GPL-2.0+
+WOLFTPM_LICENSE_FILES = LICENSE
+WOLFTPM_CPE_ID_VENDOR = wolfssl
+WOLFTPM_DEPENDENCIES = host-pkgconf
+WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
+
+# wolfTPM's source code is released without a configure script,
+# therefore we need autoreconf
+WOLFTPM_AUTORECONF = YES
+
+WOLFTPM_CONF_OPTS = \
+	--disable-examples \
+	--enable-devtpm \
+	--with-wolfcrypt=$(STAGING_DIR)/usr
+
+# Fix for missing config.rpath in the codebase
+define WOLFTPM_TOUCH_CONFIG_RPATH
+	mkdir -p $(@D)/build-aux
+	touch $(@D)/build-aux/config.rpath
+endef
+WOLFTPM_PRE_CONFIGURE_HOOKS += WOLFTPM_TOUCH_CONFIG_RPATH
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
