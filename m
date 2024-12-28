Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D82C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6AC44FC0E;
	Fri, 28 Feb 2025 16:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJH6BsG-aNzx; Fri, 28 Feb 2025 16:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92FE4F1DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B92FE4F1DB;
	Fri, 28 Feb 2025 16:46:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04474711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EB2A42D6F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5fb5Ex5j5_6 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B56E4255D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B56E4255D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8014B80584; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 10:56:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 342fefa6d29588014226108e6a2c8b68384fb692
X-Git-Newrev: 61a0d5cb21e777fb4b2aa49edc626ef95140ce7d
X-Patchwork-Hint: ignore
Message-Id: <20250228162949.8014B80584@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hiawatha: remove
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=61a0d5cb21e777fb4b2aa49edc626ef95140ce7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We wanted to update hiawatha from 11.2 to the latest version 11.6, but
since its version 11.5, building with -DENABLE_TLS=OFF is broken. The
upstream project is also kind of dead/weird:

- The Gitlab repo at https://gitlab.com/hsleisink/hiawatha does not
  have real commit history, just one commit per release

- There is no bug tracker for the project, nor any mailing list to
  contact the author and report a bug

- The upstream website at https://hiawatha.leisink.net/support states
  "Due to lack of interest in this project, I no longer actively
  support and promote Hiawatha. I still use Hiawatha a lot myself, so
  development will continue, but likely very slow. New versions will
  still be released via this website.

Since I was the one who introduced this package, and nobody else seems
to use it, let's drop it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy               |  8 ++++++
 DEVELOPERS                     |  1 -
 package/Config.in              |  1 -
 package/hiawatha/Config.in     | 37 -------------------------
 package/hiawatha/hiawatha.hash |  3 ---
 package/hiawatha/hiawatha.mk   | 61 ------------------------------------------
 6 files changed, 8 insertions(+), 103 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8e037d9170..ed74bf15c2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_HIAWATHA
+	bool "hiwatha has been removed"
+	select BR2_LEGACY
+	help
+	  This package is no longer maintained upstream, has no bug
+	  tracker, and the latest versions cause build
+	  failures. Therefore, it has been removed.
+
 config BR2_PACKAGE_MONGODB
 	bool "mongodb has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f2abab2ef3..820a216735 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3149,7 +3149,6 @@ F:	package/genromfs/
 F:	package/getent/
 F:	package/gnu-efi/
 F:	package/heirloom-mailx/
-F:	package/hiawatha/
 F:	package/igh-ethercat/
 F:	package/intltool/
 F:	package/jh71xx-tools/
diff --git a/package/Config.in b/package/Config.in
index 2211408c42..814101458d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2488,7 +2488,6 @@ endif
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
 	source "package/haproxy/Config.in"
-	source "package/hiawatha/Config.in"
 	source "package/hostapd/Config.in"
 	source "package/hplip/Config.in"
 	source "package/htpdate/Config.in"
diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
deleted file mode 100644
index 8bcee3f098..0000000000
--- a/package/hiawatha/Config.in
+++ /dev/null
@@ -1,37 +0,0 @@
-comment "hiawatha needs a toolchain w/ threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-config BR2_PACKAGE_HIAWATHA
-	bool "hiawatha"
-	# needs fork()
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_ZLIB
-	help
-	  Hiawatha is a webserver for Unix and has been built with
-	  security in mind. This resulted in a highly secure
-	  webserver, in both code and features.
-
-	  This webserver runs on Linux, BSD, MacOS X and
-	  Windows. Although it can run any kind of CGI / FastCGI
-	  application, it has been optimized for usage with PHP. Most
-	  well known PHP frameworks and CMS applications have been
-	  tested with Hiawatha and ran without a problem. Hiawatha
-	  supports many web and HTTP features such as CGI/FastCGI,
-	  HTTP authentication, virtual host support, request
-	  pipelining, keep alive connections, URL rewriting and many
-	  more.
-
-	  https://hiawatha.leisink.net/
-
-if BR2_PACKAGE_HIAWATHA
-
-config BR2_PACKAGE_HIAWATHA_SSL
-	bool "hiawatha TLS support"
-
-endif
diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
deleted file mode 100644
index 1ee94ee69a..0000000000
--- a/package/hiawatha/hiawatha.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  99c64f76927f93469f062ab76b74eb79a397ea4be12da86bf746b2bb57cf1bc5  hiawatha-11.2.tar.gz
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
deleted file mode 100644
index 4c94f0067e..0000000000
--- a/package/hiawatha/hiawatha.mk
+++ /dev/null
@@ -1,61 +0,0 @@
-################################################################################
-#
-# hiawatha
-#
-################################################################################
-
-HIAWATHA_VERSION = 11.2
-HIAWATHA_SITE = https://hiawatha.leisink.net/files
-HIAWATHA_DEPENDENCIES = zlib
-HIAWATHA_LICENSE = GPL-2.0
-HIAWATHA_LICENSE_FILES = LICENSE
-HIAWATHA_CPE_ID_VENDOR = hiawatha-webserver
-
-# Disable system mbedtls as hiawatha needs mbedtls 3.x
-HIAWATHA_CONF_OPTS = \
-	-DINSTALL_MBEDTLS_HEADERS=OFF \
-	-DUSE_SYSTEM_MBEDTLS=OFF \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
-	-DENABLE_TOOLKIT=OFF \
-	-DCONFIG_DIR=/etc/hiawatha \
-	-DLOG_DIR=/var/log \
-	-DPID_DIR=/var/run \
-	-DWEBROOT_DIR=/var/www/hiawatha \
-	-DWORK_DIR=/var/lib/hiawatha
-
-define HIAWATHA_MBEDTLS_DISABLE_ASM
-	$(SED) '/^#define MBEDTLS_AESNI_C/d' \
-		$(@D)/mbedtls/include/mbedtls/mbedtls_config.h
-	$(SED) '/^#define MBEDTLS_HAVE_ASM/d' \
-		$(@D)/mbedtls/include/mbedtls/mbedtls_config.h
-	$(SED) '/^#define MBEDTLS_PADLOCK_C/d' \
-		$(@D)/mbedtls/include/mbedtls/mbedtls_config.h
-endef
-
-# ARM in thumb mode breaks debugging with asm optimizations
-# Microblaze asm optimizations are broken in general
-# MIPS R6 asm is not yet supported
-ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),yy)
-HIAWATHA_POST_CONFIGURE_HOOKS += HIAWATHA_MBEDTLS_DISABLE_ASM
-else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
-HIAWATHA_POST_CONFIGURE_HOOKS += HIAWATHA_MBEDTLS_DISABLE_ASM
-endif
-
-ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
-HIAWATHA_CONF_OPTS += -DENABLE_TLS=ON
-else
-HIAWATHA_CONF_OPTS += -DENABLE_TLS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
-HIAWATHA_DEPENDENCIES += libxcrypt
-endif
-
-ifeq ($(BR2_PACKAGE_LIBXSLT),y)
-HIAWATHA_CONF_OPTS += -DENABLE_XSLT=ON
-HIAWATHA_DEPENDENCIES += libxslt
-else
-HIAWATHA_CONF_OPTS += -DENABLE_XSLT=OFF
-endif
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
