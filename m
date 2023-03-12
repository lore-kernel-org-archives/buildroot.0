Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA77DC74A4B
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77C1340281;
	Sun, 12 Mar 2023 22:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77C1340281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCZ6AXL7SqGs; Sun, 12 Mar 2023 22:08:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF97B41676;
	Sun, 12 Mar 2023 22:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF97B41676
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9B4D1BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83E0980EA9
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83E0980EA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3qRktCj7AGy for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:08:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F89480E9D
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F89480E9D
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:08:45 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout05.t-online.de (Postfix) with SMTP id 52E24E261;
 Sun, 12 Mar 2023 23:08:43 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.204.131]) by fwd82.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pbTrr-4Msp4D0; Sun, 12 Mar 2023 23:08:39 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:46874)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pbTrr-0006rN-07;
 Sun, 12 Mar 2023 23:08:39 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 23:08:38 +0100
Message-Id: <20230312220838.288338-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312220838.288338-1-bernd.kuhls@t-online.de>
References: <20230312220838.288338-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678658919-11794992-249B3F44/0/0 CLEAN NORMAL
X-TOI-MSGID: bdf58093-4db9-4850-83fe-6e576ecda297
Subject: [Buildroot] [PATCH 2/2] package/transmission: bump version to 4.0.1
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

This bump depends on bumping libutp to at least
c95738b1a6644b919e5b64d3ea9736cfc5894e0b.

Updated license hash due to copyright year bump:
https://github.com/transmission/transmission/commit/4b8cfa2e576feea6a6f2fd5ae5fe1a59449aca6f

Switched buildsystem to cmake, reworked dependencies.

Removed all patches, transmission now depends on the libutp package and
uses cmake as build system.

Upstream removed the configure option for lightweight build:
https://github.com/transmission/transmission/commit/47ebb3f63a2f8983f9858bfbec6b72c42588a388

Removed the option to disable uTP support, for details see upstream issue:
https://github.com/transmission/transmission/issues/4751

Added -latomic when needed to fix build errors on riscv32 and sparc.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Please note that 0001-fix-utypes.patch contains DOS line breaks so you
might have problems when applying this patch.

 package/transmission/0001-fix-utypes.patch    | 30 ----------
 .../transmission/0002-fix-utp-include.patch   | 46 ---------------
 ...ac-fix-autoreconf-with-autoconf-2.70.patch | 42 -------------
 package/transmission/Config.in                | 32 +++++-----
 package/transmission/transmission.hash        |  5 +-
 package/transmission/transmission.mk          | 59 +++++++++----------
 6 files changed, 50 insertions(+), 164 deletions(-)
 delete mode 100644 package/transmission/0001-fix-utypes.patch
 delete mode 100644 package/transmission/0002-fix-utp-include.patch
 delete mode 100644 package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch

diff --git a/package/transmission/0001-fix-utypes.patch b/package/transmission/0001-fix-utypes.patch
deleted file mode 100644
index 81efa884a7..0000000000
--- a/package/transmission/0001-fix-utypes.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Fix build error "conflicting types for 'UTP_Write'"
-
-Fetch from: http://www.adminsehow.com/2012/10/how-to-install-transmission-2-71-on-debian-6-0-squeeze/
-
-The corresponding upstream bug report (unfixed) can be found here:
-https://trac.transmissionbt.com/ticket/5232
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-[Fabrice: adapt to 3.00, which always uses stdbool.h]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998@free.fr:
-  - don't comment-out dropped code, just drop it
-  - use CR-LF in replacement code, as used by upstream
-]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-
---- transmission-2.82.org/third-party/libutp/utypes.h	2013-08-09 04:47:43.000000000 +0200
-+++ transmission-2.82/third-party/libutp/utypes.h	2014-01-02 20:17:18.000000000 +0100
-@@ -35,8 +35,8 @@
- typedef const char * cstr;
- typedef char * str;
- 
--#ifndef __cplusplus
--typedef uint8 bool;
--#endif
-+#ifndef __cplusplus
-+#include <stdbool.h>
-+#endif
- 
- #endif //__UTYPES_H__
diff --git a/package/transmission/0002-fix-utp-include.patch b/package/transmission/0002-fix-utp-include.patch
deleted file mode 100644
index db8b5ab39b..0000000000
--- a/package/transmission/0002-fix-utp-include.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Fix compilation when using system libminiupnpc with libutp disabled
-
-If transmission uses its own copy of libminiupnpc in third-party/ then
-the configure script adds that path to CFLAGS:
-https://trac.transmissionbt.com/browser/trunk/configure.ac#L455
-
-This path is also added if transmission uses its own copy of libutp:
-https://trac.transmissionbt.com/browser/trunk/configure.ac#L349
-
-But if a system-provided libminiupnpc is used and utp-support is
-disabled using --disable-utp the result is a build error, detected by
-buildroot autobuilders:
-http://autobuild.buildroot.net/results/b79/b79e51140cb0320554a58ce59dcb33f53cd9211a/build-end.log
-
-net.c:40:24: fatal error: libutp/utp.h: No such file or directory
-
-Patch proposed by Yann E. MORIN:
-http://lists.busybox.net/pipermail/buildroot/2016-July/167896.html
-
-Patch sent upstream: https://trac.transmissionbt.com/ticket/6163
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff -uNr transmission-2.92.org/configure.ac transmission-2.92/configure.ac
---- transmission-2.92.org/configure.ac	2016-03-06 21:23:45.336198393 +0100
-+++ transmission-2.92/configure.ac	2016-07-31 12:13:40.921660078 +0200
-@@ -358,6 +358,10 @@
-     else
-       AC_MSG_ERROR("Unable to build uTP support -- C++ compiler not found")
-     fi
-+else
-+    # For the system libminiupnpc with UTC disabled,
-+    # point to our bundled UTP headers
-+    LIBUTP_CFLAGS="-I\$(top_srcdir)/third-party/"
- fi
- AC_SUBST(LIBUTP_CFLAGS)
- AC_SUBST(LIBUTP_LIBS)
-@@ -457,7 +461,7 @@
-     LIBUPNP_LIBS_QT="\$\${TRANSMISSION_TOP}/third-party/miniupnp/libminiupnp.a"
- else
-     AC_DEFINE([SYSTEM_MINIUPNP])
--    LIBUPNP_CFLAGS="" 
-+    LIBUPNP_CFLAGS="${LIBUTP_CFLAGS}"
-     LIBUPNP_LIBS="-lminiupnpc"
-     LIBUPNP_LIBS_QT="-lminiupnpc"
- fi
diff --git a/package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch b/package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
deleted file mode 100644
index bfb0084bc4..0000000000
--- a/package/transmission/0003-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 857ac91a03a096601f62b358fc61355d4cc25b9b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 9 Oct 2021 18:51:13 +0200
-Subject: [PATCH] configure.ac: fix autoreconf with autoconf >= 2.70
-
-Remove the whitespace before IT_PROG_INTLTOOL as suggested in
-https://www.mail-archive.com/bug-autoconf@gnu.org/msg04851.html
-to avoid the following build failure with autoconf >= 2.70:
-
-ERROR: 'IT_PROG_INTLTOOL' must appear in configure.ac for intltool to work.
-
-The problem has been introduced by upstream autoconf commit
-http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=b3b3af821a0b9e82ebe56b77b1731d2fe58f52de
-
-Fixes:
- - http://autobuild.buildroot.org/results/e8bea26f6b12adf16335b24836a7c5c31911af6a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not upstreamable as upstream swicthed to cmake (
-https://github.com/transmission/transmission/issues/1573)]
----
- configure.ac | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index fd1132fda..04e0e19bb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -555,9 +555,7 @@ dnl it should be safe to re-edit 0.40 back down to 0.23
- use_nls=no
- if test "x$enable_nls" = "xyes" ; then
-     use_nls=yes
--    m4_ifdef([IT_PROG_INTLTOOL],
--             [IT_PROG_INTLTOOL([0.35.0],[no-xml])],
--             [AC_MSG_ERROR("--enable-nls requires intltool to be installed.")])
-+IT_PROG_INTLTOOL([0.35.0],[no-xml])
-     AC_CHECK_HEADERS([libintl.h])
-     GETTEXT_PACKAGE=transmission-gtk
-     AC_SUBST(GETTEXT_PACKAGE)
--- 
-2.33.0
-
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 980b042e33..84bd85eeff 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -1,12 +1,23 @@
 config BR2_PACKAGE_TRANSMISSION
 	bool "transmission"
+	depends on !BR2_BINFMT_FLAT # libnatpmp
+	depends on BR2_INSTALL_LIBSTDCPP # libutp
+	depends on !BR2_STATIC_LIBS # libnatpmp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
+	depends on BR2_USE_WCHAR # libpsl
+	select BR2_PACKAGE_DHT
+	select BR2_PACKAGE_LIBB64
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBDEFLATE
 	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBMINIUPNPC
+	select BR2_PACKAGE_LIBNATPMP
+	select BR2_PACKAGE_LIBPSL
+	select BR2_PACKAGE_LIBUTP
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
 	help
 	  Transmission is a cross-platform BitTorrent client.
 
@@ -14,15 +25,6 @@ config BR2_PACKAGE_TRANSMISSION
 
 if BR2_PACKAGE_TRANSMISSION
 
-config BR2_PACKAGE_TRANSMISSION_UTP
-	bool "Transmission uTP support"
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  Install support for uTorrent Transport Protocol
-
-comment "uTP needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
 config BR2_PACKAGE_TRANSMISSION_CLI
 	bool "transmission-cli"
 	help
@@ -43,6 +45,8 @@ comment "transmission-gtk needs NLS enabled"
 	depends on BR2_PACKAGE_LIBGTK3 && !BR2_SYSTEM_ENABLE_NLS
 endif
 
-comment "transmission needs a toolchain w/ threads"
+comment "transmission needs a toolchain w/ dynamic library, threads, C++, gcc >= 7"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_STATIC_LIBS
diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 13cbc969d3..c9977d216d 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,3 +1,4 @@
+# From https://transmissionbt.com/download
+sha256  8fc5aef23638c983406f6a3ee9918369e4cdc84e3228bd2fb3d01dd55cdad900  transmission-4.0.1.tar.xz
 # Locally calculated
-sha256  9144652fe742f7f7dd6657716e378da60b751aaeda8bef8344b3eefc4db255f2  transmission-3.00.tar.xz
-sha256  2b16da5bd02790d1e4d332cfd42b9dfd7d1b0ed3a16a75dc7e76b6ed239fdba9  COPYING
+sha256  f56732960a61ecf3b9637404eef1a39221d2006336a98792b7b65a79f155449c  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 1660d2c2b9..3130d5ed48 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,55 +4,54 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 3.00
-TRANSMISSION_SITE = https://github.com/transmission/transmission-releases/raw/master
+TRANSMISSION_VERSION = 4.0.1
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
+TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
 	host-pkgconf \
-	host-intltool \
+	dht \
+	libb64 \
 	libcurl \
+	libdeflate \
 	libevent \
+	libminiupnpc \
+	libnatpmp \
+	libpsl \
+	libutp \
 	openssl \
 	zlib
-TRANSMISSION_AUTORECONF = YES
 TRANSMISSION_CONF_OPTS = \
-	--without-inotify \
-	--enable-lightweight
+	-DENABLE_TESTS=OFF \
+	-DRUN_CLANG_TIDY=OFF \
+	-DUSE_SYSTEM_B64=ON \
+	-DUSE_SYSTEM_DEFLATE=ON \
+	-DUSE_SYSTEM_DHT=ON \
+	-DUSE_SYSTEM_NATPMP=ON \
+	-DUSE_SYSTEM_PSL=ON \
+	-DWITH_INOTIFY=OFF
 TRANSMISSION_LICENSE = GPL-2.0 or GPL-3.0 with OpenSSL exception
 TRANSMISSION_LICENSE_FILES = COPYING
 TRANSMISSION_CPE_ID_VENDOR = transmissionbt
 
-ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
-TRANSMISSION_DEPENDENCIES += libminiupnpc
-endif
-
-ifeq ($(BR2_PACKAGE_LIBNATPMP),y)
-TRANSMISSION_DEPENDENCIES += libnatpmp
-TRANSMISSION_CONF_OPTS += --enable-external-natpmp
-else
-TRANSMISSION_CONF_OPTS += --disable-external-natpmp
-endif
-
-ifeq ($(BR2_PACKAGE_TRANSMISSION_UTP),y)
-TRANSMISSION_CONF_OPTS += --enable-utp
-else
-TRANSMISSION_CONF_OPTS += --disable-utp
+# Uses __atomic_load_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+TRANSMISSION_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_CLI),y)
-TRANSMISSION_CONF_OPTS += --enable-cli
+TRANSMISSION_CONF_OPTS += -DENABLE_CLI=ON
 else
-TRANSMISSION_CONF_OPTS += --disable-cli
+TRANSMISSION_CONF_OPTS += -DENABLE_CLI=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_DAEMON),y)
-TRANSMISSION_CONF_OPTS += --enable-daemon
+TRANSMISSION_CONF_OPTS += -DENABLE_DAEMON=ON
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 TRANSMISSION_DEPENDENCIES += systemd
-TRANSMISSION_CONF_OPTS += --with-systemd
+TRANSMISSION_CONF_OPTS += -DWITH_SYSTEMD=ON
 else
-TRANSMISSION_CONF_OPTS += --without-systemd
+TRANSMISSION_CONF_OPTS += -DWITH_SYSTEMD=OFF
 endif
 
 define TRANSMISSION_USERS
@@ -70,14 +69,14 @@ define TRANSMISSION_INSTALL_INIT_SYSTEMD
 endef
 
 else
-TRANSMISSION_CONF_OPTS += --disable-daemon
+TRANSMISSION_CONF_OPTS += -DENABLE_DAEMON=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_GTK),y)
-TRANSMISSION_CONF_OPTS += --with-gtk
+TRANSMISSION_CONF_OPTS += -DENABLE_GTK=ON
 TRANSMISSION_DEPENDENCIES += libgtk3
 else
-TRANSMISSION_CONF_OPTS += --without-gtk
+TRANSMISSION_CONF_OPTS += -DENABLE_GTK=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
