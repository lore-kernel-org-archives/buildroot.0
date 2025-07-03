Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B86CC83F09
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D528483E3F;
	Fri,  4 Jul 2025 06:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9e9ulpCZ2YtZ; Fri,  4 Jul 2025 06:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DA5083E0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DA5083E0D;
	Fri,  4 Jul 2025 06:22:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 065B41EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EED2608FC
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q88jx3p3lAm8 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DF9860B60
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DF9860B60
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B01E849B1; Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 09:56:14 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 608cbd7755f3ebbc8fedc00855ad9744a233f751
X-Git-Newrev: 8154e1226d2f631ee10ed8c34713f71aeb19ec23
X-Patchwork-Hint: ignore
Message-Id: <20250704062126.8B01E849B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libwebsock:
 remove package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3618300467070376104=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3618300467070376104==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8154e1226d2f631ee10ed8c34713f71aeb19ec23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The upstream Github repository payden/libwebsock is no longer available,
and its URL now redirects to some completely unrelated software.
We don't know for sure what happened, but at least the package does not
build anymore, because its source code has vanished.

Since no other buildroot package depends on libwebsock, and it hasn't
received any update; let's simply remove it from here.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9f2dbf148660f201091604bccc1195b7b787616b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |  3 -
 Config.in.legacy                                   |  9 +++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 ...se-pkg-config-to-detect-libevent-and-open.patch | 81 ----------------------
 package/libwebsock/0002-fix-ssl.patch              | 21 ------
 package/libwebsock/0003-fix-incorrect-inline.patch | 66 ------------------
 package/libwebsock/Config.in                       | 16 -----
 package/libwebsock/libwebsock.hash                 |  3 -
 package/libwebsock/libwebsock.mk                   | 22 ------
 10 files changed, 9 insertions(+), 214 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 25ea61a43e..59e9002255 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -731,9 +731,6 @@ package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch lib_patch.Upstrea
 package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch lib_patch.Upstream
 package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch lib_patch.Upstream
 package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch lib_patch.Upstream
-package/libwebsock/0001-Switch-to-use-pkg-config-to-detect-libevent-and-open.patch lib_patch.Upstream
-package/libwebsock/0002-fix-ssl.patch lib_patch.Upstream
-package/libwebsock/0003-fix-incorrect-inline.patch lib_patch.Upstream
 package/libyuv/0001-i386-sse2.patch lib_patch.Upstream
 package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch lib_patch.Upstream
 package/lighttpd/S50lighttpd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
diff --git a/Config.in.legacy b/Config.in.legacy
index b1d03b3494..9af6d07127 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.02.5"
+
+config BR2_PACKAGE_LIBWEBSOCK
+	bool "libwebsock has been removed"
+	select BR2_LEGACY
+	help
+	  The upstream Github repository payden/libwebsock is no
+	  longer available, and has been removed from Buildroot.
+
 comment "Legacy options removed in 2025.02.4"
 
 config BR2_PACKAGE_LIBEBUR128
diff --git a/DEVELOPERS b/DEVELOPERS
index 155cd39ccc..d490e58ec8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1326,7 +1326,6 @@ F:	package/gengetopt/
 F:	package/janus-gateway/
 F:	package/libnice/
 F:	package/libsrtp/
-F:	package/libwebsock/
 F:	package/sofia-sip/
 
 N:	Grzegorz Blach <grzegorz@blach.pl>
diff --git a/package/Config.in b/package/Config.in
index fdd03d879c..9157c00c9c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2093,7 +2093,6 @@ menu "Networking"
 	source "package/libutp/Config.in"
 	source "package/libuwsc/Config.in"
 	source "package/libvncserver/Config.in"
-	source "package/libwebsock/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/libyang/Config.in"
 	source "package/libzenoh-c/Config.in"
diff --git a/package/libwebsock/0001-Switch-to-use-pkg-config-to-detect-libevent-and-open.patch b/package/libwebsock/0001-Switch-to-use-pkg-config-to-detect-libevent-and-open.patch
deleted file mode 100644
index ea3fd0074b..0000000000
--- a/package/libwebsock/0001-Switch-to-use-pkg-config-to-detect-libevent-and-open.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From a6c35dbab5a2a75c176e031122ee64152e50e5d3 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 1 Jan 2015 12:23:43 +0100
-Subject: [PATCH] Switch to use pkg-config to detect libevent and openssl
-
-Switching to pkg-config fixes a number of problems when detecting the
-libraries. For example the detection of libpthread was failing,
-because libevent_threads was added to LIBS before libevent itself,
-causing the libpthread test to fail due to missing symbols. pkg-config
-is anyway nowadays the preferred way for detecting libraries. It also
-has the benefit of working properly in static library situations.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 36 ++++++++++++------------------------
- 1 file changed, 12 insertions(+), 24 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d4109ce..fc1cadc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -27,35 +27,20 @@ AC_FUNC_MALLOC
- AC_FUNC_REALLOC
- AC_CHECK_FUNCS([memset socket strstr])
- 
--AC_CHECK_HEADERS([event2/thread.h], [
--					LIBS="-levent_pthreads ${LIBS}"
--				    ], [
--                                                echo "libevent_pthreads required, failing"
--                                                exit -1
--                                                ])
--AC_CHECK_LIB(pthread, pthread_create, [LIBS="-lpthread ${LIBS}"], [
-+AC_CHECK_LIB(pthread, pthread_create, [PTHREAD_LIBS="-lpthread"], [
-                                                 echo "pthreads required, failing"
-                                                 exit -1
-                                                 ])
--AC_CHECK_LIB(event, event_base_dispatch, [], [
--						echo "libevent required, failing"
--						exit -1
--						])
-+
-+PKG_CHECK_MODULES([EVENT], [libevent])
-+PKG_CHECK_MODULES([EVENT_PTHREAD], [libevent_pthreads])
- 
- AS_IF([test "x$with_ssl" != "xno"],
- 	[
--  	AC_CHECK_LIB([ssl], [SSL_CTX_new],
--  		[
--  			LIBS="-lssl ${LIBS}"
--  			AC_CHECK_LIB([event_openssl], [bufferevent_openssl_socket_new], [
--  				LIBS="-levent_openssl ${LIBS}"
--  				have_ssl=yes
--  			], [have_ssl=no])
--  		], 
--  		[have_ssl=no])
--  	],
--  	[have_ssl=no])
--  	
-+	PKG_CHECK_MODULES([SSL], [openssl], [have_ssl=yes], [have_ssl=no])
-+	AS_IF([test "x${have_ssl}" = "xyes"],
-+		[PKG_CHECK_MODULES([EVENT_OPENSSL], [libevent_openssl], [have_ssl=yes], [have_ssl=no])])])
-+
- AS_IF([test "x$have_ssl" = "xyes"],
- 	[
- 		AC_DEFINE([WEBSOCK_HAVE_SSL], [1], [Define if building SSL support])
-@@ -63,8 +48,11 @@ AS_IF([test "x$have_ssl" = "xyes"],
- 	[AS_IF([test "x$with_ssl" = "xyes"],
- 		[AC_MSG_ERROR([SSL support requested but not found])
- 	])])
--  	
-+
- AM_CONDITIONAL([HAVE_SSL], [test "x$have_ssl" = "xyes"])
-+
-+LIBS="${EVENT_LIBS} ${EVENT_PTHREAD_LIBS} ${PTHREAD_LIBS} ${SSL_LIBS} ${EVENT_OPENSSL_LIBS}"
-+
- AC_DEFINE_UNQUOTED([WEBSOCK_PACKAGE_VERSION], ["$PACKAGE_VERSION"], [libwebsock version])
- AC_DEFINE_UNQUOTED([WEBSOCK_PACKAGE_STRING], ["$PACKAGE_STRING"], [libwebsock package string])
- AC_DEFINE_UNQUOTED([WEBSOCK_PACKAGE_NAME], ["$PACKAGE_NAME"], [libwebsock package name])
--- 
-2.1.0
-
diff --git a/package/libwebsock/0002-fix-ssl.patch b/package/libwebsock/0002-fix-ssl.patch
deleted file mode 100644
index f577538713..0000000000
--- a/package/libwebsock/0002-fix-ssl.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-config: fix SSL detection
-
-The @WEBSOCK_HAVE_SSL@ is replaced at configure time with either a 1 or 0.
-The rest of the code is simply checking to see if WEBSOCK_HAVE_SSL is
-defined at all. Using a #undef WEBSOCK_HAVE_SSL will cause configure
-to either comment it out or change the line to
-"#define WEBSOCK_HAVE_SSL 1".
-
-Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
-
-diff -durN a/src/websock_config.h.in b/src/websock_config.h.in
---- a/src/websock_config.h.in
-+++ b/src/websock_config.h.in
-@@ -4,6 +4,6 @@
- #define WEBSOCK_PACKAGE_STRING @WEBSOCK_PACKAGE_STRING@
- #define WEBSOCK_PACKAGE_VERSION @WEBSOCK_PACKAGE_VERSION@
- #define WEBSOCK_PACKAGE_NAME @WEBSOCK_PACKAGE_NAME@
--#define WEBSOCK_HAVE_SSL @WEBSOCK_HAVE_SSL@
-+#undef WEBSOCK_HAVE_SSL
- 
- #endif
diff --git a/package/libwebsock/0003-fix-incorrect-inline.patch b/package/libwebsock/0003-fix-incorrect-inline.patch
deleted file mode 100644
index 043df45bd3..0000000000
--- a/package/libwebsock/0003-fix-incorrect-inline.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-utf: do not define decode() to be inline
-
-Currently, decode() is prototyped in utf.h, its body is in utf.c and it
-is called from util.c.
-
-However, decode() is defined to be inline, which can not work since,
-when compiling util.c, the body of decode() is out-of-scope for that
-compilation unit.
-
-Furthermore, decode() uses a utf8d, which is a static defined in utf.c .
-So utf8d is not visible when compiling util.c either.
-
-This means that the definition of decode() along with utf8d is basically
-wrong, and is now failing with gcc-5.x, with warnings like so:
-
-    libtool: compile:  /home/ymorin/dev/buildroot/O/host/usr/bin/arm-linux-gcc -DHAVE_CONFIG_H -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Wmissing-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c utf.c  -fPIC -DPIC -o .libs/libwebsock_la-utf.o
-    utf.c:36:12: warning: ‘utf8d’ is static but used in inline function ‘decode’ which is not static
-       *state = utf8d[256 + *state*16 + type];
-                ^
-    utf.c:30:19: warning: ‘utf8d’ is static but used in inline function ‘decode’ which is not static
-       uint32_t type = utf8d[byte];
-                       ^
-    libtool: compile:  /home/ymorin/dev/buildroot/O/host/usr/bin/arm-linux-gcc -DHAVE_CONFIG_H -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Wmissing-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c util.c  -fPIC -DPIC -o .libs/libwebsock_la-util.o
-    In file included from websock.h:73:0,
-                     from util.c:20:
-    utf.h:25:17: warning: inline function ‘decode’ declared but never defined
-     uint32_t inline decode(uint32_t *state, uint32_t *codep, uint32_t byte);
-                     ^
-
-This results in decode() to be omitted from libwebsock.so, and thus link
-failures when another program wants to link with -lwebsock.
-
-The simplest solution is to not inline decode() at all.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Note: an alternative would be to move both decode() and utf8d into
-decode.h nad ditch decode.c if decode really must be inline. This is
-left as an execise for an interested party. But since upstream hasn't
-seen a single commit in more than a year now... :-(
-
-diff -durN a/src/utf.c b/src/utf.c
---- a/src/utf.c	2014-07-15 01:43:20.000000000 +0200
-+++ b/src/utf.c	2015-08-22 22:29:38.667393786 +0200
-@@ -24,7 +24,7 @@
-   1,3,1,1,1,1,1,3,1,3,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1, // s7..s8
- };
- 
--uint32_t inline
-+uint32_t
- decode(uint32_t* state, uint32_t* codep, uint32_t byte)
- {
-   uint32_t type = utf8d[byte];
-diff -durN a/src/utf.h b/src/utf.h
---- a/src/utf.h	2014-07-15 01:43:20.000000000 +0200
-+++ b/src/utf.h	2015-08-22 22:29:10.439227396 +0200
-@@ -22,7 +22,7 @@
- 
- #include <stdint.h>
- 
--uint32_t inline decode(uint32_t *state, uint32_t *codep, uint32_t byte);
-+uint32_t decode(uint32_t *state, uint32_t *codep, uint32_t byte);
- 
- 
- #endif /* UTF_H_ */
diff --git a/package/libwebsock/Config.in b/package/libwebsock/Config.in
deleted file mode 100644
index 14651cf4b4..0000000000
--- a/package/libwebsock/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_LIBWEBSOCK
-	bool "libwebsock"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_LIBEVENT
-	help
-	  C library for easy WebSockets servers.
-
-	  This library allows a developer to quickly develop WebSocket
-	  servers by focusing on the actual logic of your WebSocket
-	  implementation instead of the details of the WebSocket
-	  protocol or even specifics of C sockets.
-
-	  https://github.com/payden/libwebsock
-
-comment "libwebsock needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libwebsock/libwebsock.hash b/package/libwebsock/libwebsock.hash
deleted file mode 100644
index 43f0935a36..0000000000
--- a/package/libwebsock/libwebsock.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  34cf8376446e2371c9af47394043a30dc16af7ed5437d56bc6135c5dfda9ed22  libwebsock-3c1615eeadb0b582b63851073bfe3e5132f31ebc.tar.gz
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.lesser
diff --git a/package/libwebsock/libwebsock.mk b/package/libwebsock/libwebsock.mk
deleted file mode 100644
index df3af3b059..0000000000
--- a/package/libwebsock/libwebsock.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# libwebsock
-#
-################################################################################
-
-LIBWEBSOCK_VERSION = 3c1615eeadb0b582b63851073bfe3e5132f31ebc
-LIBWEBSOCK_SITE = $(call github,payden,libwebsock,$(LIBWEBSOCK_VERSION))
-LIBWEBSOCK_DEPENDENCIES = libevent host-pkgconf
-LIBWEBSOCK_AUTORECONF = YES
-LIBWEBSOCK_INSTALL_STAGING = YES
-LIBWEBSOCK_LICENSE = LGPL-3.0
-LIBWEBSOCK_LICENSE_FILES = COPYING.lesser
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBWEBSOCK_DEPENDENCIES += openssl
-LIBWEBSOCK_CONF_OPTS += --with-ssl
-else
-LIBWEBSOCK_CONF_OPTS += --without-ssl
-endif
-
-$(eval $(autotools-package))

--===============3618300467070376104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3618300467070376104==--
