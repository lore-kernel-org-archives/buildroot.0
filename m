Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99308C54E49
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 22:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F7998179A;
	Sun, 10 Mar 2024 22:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6JXV9P4gBlh; Sun, 10 Mar 2024 22:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46624817FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46624817FF;
	Sun, 10 Mar 2024 22:17:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 513B01BF28B
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2837C40106
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTNGuwnaV-pS for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 22:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0741440105
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0741440105
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 22:17:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3C21819F0; Sun, 10 Mar 2024 22:17:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 22:58:04 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5d99b844a1b2484cd10585e16b13dac6c7d8e05d
X-Git-Newrev: b28d522e4e09f2d3f8dc98b7a78e8882296af0ac
X-Patchwork-Hint: ignore
Message-Id: <20240310221720.E3C21819F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/clamav: bump
 version to 1.0.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b28d522e4e09f2d3f8dc98b7a78e8882296af0ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Removed patch which was applied upstream.
License files were moved to COPYING/

Updated license hash of COPYING.lzma due to upstream commit
https://github.com/Cisco-Talos/clamav/commit/6b3b8b2e9ddcfd61c88a4b61e0d4e10fcb996ce6#diff-216b7167897f75c13c7fcfa08956f8f9269af0927024c7e14201683b94ebad8f
which made no changes to the license text.

Switched build system to cmake, reworked various dependencies.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-use-backtrace-if-using-uClibc-without-ba.patch |  36 -------
 package/clamav/Config.in                           |   7 ++
 package/clamav/clamav.hash                         |  26 +++---
 package/clamav/clamav.mk                           | 103 +++++++--------------
 4 files changed, 56 insertions(+), 116 deletions(-)

diff --git a/package/clamav/0001-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch b/package/clamav/0001-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch
deleted file mode 100644
index d4be5c7b29..0000000000
--- a/package/clamav/0001-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 053bac34b9f0f947c58fcdf80ac03d5a6b05aa12 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Mon, 7 May 2018 23:15:58 +0200
-Subject: [PATCH] mbox: do not use backtrace if using uClibc without backtrace
- support
-
-Since uClibc can be configured without support for backtrace, disable
-the backtrace if we are building with a uClibc that was built without
-backtrace.
-
-This is a bit hacky, and would greatly benefit from a test in ./configure
-instead, but does nicely as a quick fix for now.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for 0.103.0]
----
- libclamav/mbox.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libclamav/mbox.c b/libclamav/mbox.c
-index 71f540c0a..4851297a9 100644
---- a/libclamav/mbox.c
-+++ b/libclamav/mbox.c
-@@ -91,7 +91,7 @@
- #include <features.h>
- #endif
- 
--#if __GLIBC__ == 2 && __GLIBC_MINOR__ >= 1
-+#if __GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 && !defined(__UCLIBC__) || defined(__UCLIBC_HAS_BACKTRACE__)
- #define HAVE_BACKTRACE
- #endif
- #endif
--- 
-2.14.3
-
diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 2857f9cbf4..ae5cad036a 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -1,14 +1,20 @@
 config BR2_PACKAGE_CLAMAV
 	bool "clamav"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBMSPACK
+	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
 	help
@@ -20,4 +26,5 @@ config BR2_PACKAGE_CLAMAV
 comment "clamav needs a toolchain w/ C++, dynamic library, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 60aba89fa0..ad9d1c9264 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,14 +1,14 @@
 # Locally calculated
-sha256  61d7ebda7c9c36f50425a3726ae293db36adeae7f71b1fe488902b73c70b7e11  clamav-0.103.11.tar.gz
-sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
-sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
-sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
-sha256  6dce638b76399e7521ad8e182d3e33e4496c85b3b69b6ff434b53017101e82ad  COPYING.getopt
-sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LGPL
-sha256  e3a9b913515a42f8ff3ef1551c3a2cdba383c39ed959729e0e2911219496ad74  COPYING.llvm
-sha256  d96d71b66aa32c4a2d1619b9ca3347dafa9460bcf0fb5ac2408916067ad31dfc  COPYING.lzma
-sha256  accdcf2455c07b99abea59016b3663eaef926a92092d103bfaa25fed27cf6b24  COPYING.pcre
-sha256  e2c1395a3d9fea6d5d25847c9d783db6e2cc8b085b4025861f459139c5dfd90b  COPYING.regex
-sha256  1faccc6b5c7b958fb807a3f573d5be9bf7889fe898f7e0617c544b05a81bfd00  COPYING.unrar
-sha256  a20d6317c5384e8d4c05f9c31097878675d9429ec46090656166039cc10bc957  COPYING.YARA
-sha256  c2f77553f8d870c5635b0dace0519253233f172b33ce1fdf6578610706294eee  COPYING.zlib
+sha256  0872dc1b82ff4cd7e8e4323faf5ee41a1f66ae80865d05429085b946355d86ee  clamav-1.0.1.tar.gz
+sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
+sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
+sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
+sha256  6dce638b76399e7521ad8e182d3e33e4496c85b3b69b6ff434b53017101e82ad  COPYING/COPYING.getopt
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING/COPYING.LGPL
+sha256  e3a9b913515a42f8ff3ef1551c3a2cdba383c39ed959729e0e2911219496ad74  COPYING/COPYING.llvm
+sha256  c7cbcf00b59dc61165b655b45bf6c21bb685d593861e7abbc78460c499167b42  COPYING/COPYING.lzma
+sha256  accdcf2455c07b99abea59016b3663eaef926a92092d103bfaa25fed27cf6b24  COPYING/COPYING.pcre
+sha256  e2c1395a3d9fea6d5d25847c9d783db6e2cc8b085b4025861f459139c5dfd90b  COPYING/COPYING.regex
+sha256  1faccc6b5c7b958fb807a3f573d5be9bf7889fe898f7e0617c544b05a81bfd00  COPYING/COPYING.unrar
+sha256  a20d6317c5384e8d4c05f9c31097878675d9429ec46090656166039cc10bc957  COPYING/COPYING.YARA
+sha256  c2f77553f8d870c5635b0dace0519253233f172b33ce1fdf6578610706294eee  COPYING/COPYING.zlib
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 090e546aee..977b6010b3 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,30 +4,38 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.103.11
+CLAMAV_VERSION = 1.0.1
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
-CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
-	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.pcre COPYING.regex \
-	COPYING.unrar COPYING.zlib
+CLAMAV_LICENSE_FILES = \
+	COPYING.txt \
+	COPYING/COPYING.bzip2 \
+	COPYING/COPYING.file \
+	COPYING/COPYING.getopt \
+	COPYING/COPYING.LGPL \
+	COPYING/COPYING.llvm \
+	COPYING/COPYING.lzma \
+	COPYING/COPYING.pcre \
+	COPYING/COPYING.regex \
+	COPYING/COPYING.unrar \
+	COPYING/COPYING.zlib
 CLAMAV_CPE_ID_VENDOR = clamav
 CLAMAV_SELINUX_MODULES = clamav
 # affects only Cisco devices
 CLAMAV_IGNORE_CVES += CVE-2016-1405
 CLAMAV_DEPENDENCIES = \
+	bzip2 \
 	host-pkgconf \
+	host-rustc \
+	json-c \
 	libcurl \
 	libmspack \
+	libxml2 \
 	openssl \
+	pcre2 \
 	zlib \
 	$(TARGET_NLS_DEPENDENCIES)
 
-# mmap cannot be detected when cross-compiling, needed for mempool support
-CLAMAV_CONF_ENV = \
-	ac_cv_c_mmap_private=yes \
-	have_cv_ipv6=yes \
-	OBJC=$(TARGET_CC)
-
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 CLAMAV_LIBS += -latomic
 endif
@@ -40,66 +48,27 @@ endif
 CLAMAV_CONF_ENV += LIBS="$(CLAMAV_LIBS)"
 
 CLAMAV_CONF_OPTS = \
-	--with-dbdir=/var/lib/clamav \
-	--with-libcurl=$(STAGING_DIR)/usr \
-	--with-openssl=$(STAGING_DIR)/usr \
-	--with-system-libmspack=$(STAGING_DIR)/usr \
-	--with-zlib=$(STAGING_DIR)/usr \
-	--disable-zlib-vcheck \
-	--disable-rpath \
-	--disable-clamav \
-	--disable-milter \
-	--disable-llvm \
-	--disable-clamdtop \
-	--enable-mempool
-
-ifeq ($(BR2_PACKAGE_BZIP2),y)
-CLAMAV_DEPENDENCIES += bzip2
-# autodetection gets confused if host has bzip2, so force it
-CLAMAV_CONF_ENV += \
-	ac_cv_libbz2_libs=-lbz2 \
-	ac_cv_libbz2_ltlibs=-lbz2
-else
-CLAMAV_CONF_OPTS += --disable-bzip2
-endif
-
-ifeq ($(BR2_PACKAGE_JSON_C),y)
-CLAMAV_CONF_OPTS += --with-libjson=$(STAGING_DIR)/usr
-CLAMAV_DEPENDENCIES += json-c
-else
-CLAMAV_CONF_OPTS += --without-libjson
-endif
-
-ifeq ($(BR2_PACKAGE_LIBXML2),y)
-CLAMAV_CONF_ENV += ac_cv_path_xmlconfig=$(STAGING_DIR)/usr/bin/xml2-config
-CLAMAV_CONF_OPTS += --with-xml=$(STAGING_DIR)/usr
-CLAMAV_DEPENDENCIES += libxml2
-else
-CLAMAV_CONF_OPTS += --disable-xml
-endif
-
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-CLAMAV_CONF_OPTS += --with-iconv
-CLAMAV_DEPENDENCIES += libiconv
-else
-CLAMAV_CONF_OPTS += --without-iconv
-endif
-
-ifeq ($(BR2_PACKAGE_PCRE2),y)
-CLAMAV_CONF_OPTS += --with-pcre=$(STAGING_DIR)/usr
-CLAMAV_DEPENDENCIES += pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-CLAMAV_CONF_OPTS += --with-pcre=$(STAGING_DIR)/usr
-CLAMAV_DEPENDENCIES += pcre
-else
-CLAMAV_CONF_OPTS += --without-pcre
-endif
+	-DCMAKE_SKIP_INSTALL_RPATH=ON \
+	-DENABLE_JSON_SHARED=ON \
+	-DENABLE_MAN_PAGES=OFF \
+	-DENABLE_MILTER=OFF \
+	-DENABLE_TESTS=OFF \
+	-DHAVE_SYSTEM_LFS_FTS=ON \
+	-DRUST_COMPILER_TARGET=$(ARCH)-unknown-$(TARGET_OS)-$(LIBC)$(ABI) \
+	-Dtest_run_result=ON \
+	-Dtest_run_result__TRYRUN_OUTPUT=ON
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+CLAMAV_CONF_OPTS += -DENABLE_APP=ON
+CLAMAV_DEPENDENCIES += ncurses
 ifeq ($(BR2_INIT_SYSTEMD),y)
-CLAMAV_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+CLAMAV_CONF_OPTS += -DENABLE_SYSTEMD=ON
 CLAMAV_DEPENDENCIES += systemd
 else
-CLAMAV_CONF_OPTS += --with-systemdsystemunitdir=no
+CLAMAV_CONF_OPTS += -DENABLE_SYSTEMD=OFF
+endif
+else
+CLAMAV_CONF_OPTS += -DENABLE_APP=OFF -DENABLE_SYSTEMD=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
