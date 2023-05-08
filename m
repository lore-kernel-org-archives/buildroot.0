Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E5AC77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21ADC40881;
	Mon,  8 May 2023 20:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21ADC40881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aU-_HP4O_XDQ; Mon,  8 May 2023 20:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FB28405A7;
	Mon,  8 May 2023 20:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FB28405A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 085951BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2A97404AB
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2A97404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdScfidIParn for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:44:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D14AD4049F
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D14AD4049F
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:44:47 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout10.t-online.de (Postfix) with SMTP id 100134A889;
 Mon,  8 May 2023 22:44:45 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.197.49]) by fwd77.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pw7iu-1NmQuv0; Mon, 8 May 2023 22:44:44 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:49584)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pw7iu-0002rH-0T;
 Mon, 08 May 2023 22:44:44 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon,  8 May 2023 22:44:44 +0200
Message-Id: <20230508204444.3173860-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683578684-CE03F6D8-8B379CC3/0/0 CLEAN NORMAL
X-TOI-MSGID: d2207298-608f-4676-896e-e31d1a133740
Subject: [Buildroot] [PATCH 1/1] package/clamav: bump version to 1.0.1
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which was applied upstream.
License files were moved to COPYING/

Updated license hash of COPYING.lzma due to upstream commit
https://github.com/Cisco-Talos/clamav/commit/6b3b8b2e9ddcfd61c88a4b61e0d4e10fcb996ce6#diff-216b7167897f75c13c7fcfa08956f8f9269af0927024c7e14201683b94ebad8f
which made no changes to the license text.

Switched build system to cmake, reworked various dependencies.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .checkpackageignore                           |   1 -
 ...backtrace-if-using-uClibc-without-ba.patch |  36 ------
 package/clamav/Config.in                      |   7 ++
 package/clamav/clamav.hash                    |  26 ++---
 package/clamav/clamav.mk                      | 103 ++++++------------
 5 files changed, 56 insertions(+), 117 deletions(-)
 delete mode 100644 package/clamav/0001-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 5d1ad34ac6..5b5a0e3c4e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -286,7 +286,6 @@ package/cgroupfs-mount/S30cgroupfs Indent Shellcheck Variables
 package/chipmunk/0001-Fix-build-failure-on-musl.patch Upstream
 package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch Upstream
 package/chrony/S49chrony Indent Shellcheck Variables
-package/clamav/0001-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch Upstream
 package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch Upstream
 package/cmake/0001-rename-cmake-rootfile.patch Upstream
 package/cmocka/0001-Don-t-redefine-uintptr_t.patch Upstream
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
index 27f9b16a39..ad9d1c9264 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,14 +1,14 @@
 # Locally calculated
-sha256  6f49da6ee927936de13d359e559d3944248e3a257d40b80b6c99ebe6fe8c8c3f  clamav-0.103.8.tar.gz
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
index 0f0491bf0d..977b6010b3 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,30 +4,38 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.103.8
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
