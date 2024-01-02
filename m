Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF52C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 13:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D253404DA;
	Tue,  2 Jan 2024 13:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D253404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dl53XOoZ8nIL; Tue,  2 Jan 2024 13:26:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29062400D7;
	Tue,  2 Jan 2024 13:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29062400D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF0A1BF314
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 13:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 293F460EC5
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 13:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 293F460EC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FqXEplK8M_2S for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 13:26:00 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DEC160E8A
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 13:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DEC160E8A
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 81FDE353549A; Tue,  2 Jan 2024 14:25:57 +0100 (CET)
Date: Tue, 2 Jan 2024 14:25:57 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZZQO5Te/A8SzdRLn@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1704201957; bh=Ymq3URoFNlWYb/OfHWqbyv+lBxmmkOfbepKLpqJCOUI=;
 h=Date:From:To:Subject:From;
 b=hSi9EoJCp7b768r4N4vIT7WVAuavMf1E0zrFDYB3O12EwZ2WU3glXDbi4B2Av2aAL
 /uHTo20xE0unef4Ac2nNrx/tsZjqfgzQ6fsDWJyUZxNWcs3hCcUjUD+0jWPBy/fo8H
 RZcxseFdhK4n9hSJazYYDg83rdMjS2+iDBInmY9fhzFFJr8e3b/kAnL68MqN4JJ8fa
 Xe6QNHtRsruOAZ4zkrvGEPtnI2X61IDZBtuMsOLjU30Q5kjVaZauWer+PAJUOT7/Ss
 MxC4qxTG30tjz4BBJn991gHBbrhc8jULvj9kYftllO1cniJelocUXFl8Js/ptuN7tR
 JPKqHtqt9BeBA==
Subject: [Buildroot] [PATCH] package/asterisk: bump to 20.5.2
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

Tested on a Raspberry PI4 with a SNOM 360 and a SIP Trunk to Easybell.
Attention: chan_sip is deprecated, use chan_pjsip instead.
For chan_pjsip you need to enable openssl otherwise the module will not
load.

Patches 0005 and 0006 are applied upstream.
Remove unused configure options:
--without-curses
--without-isdnnet
--without-misdn
--without-nbs
--without-oss
--without-sqlite
--without-suppserv
--without-termcap
--without-tinfo
--without-vpb

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .checkpackageignore                           |  2 -
 DEVELOPERS                                    |  1 +
 ...tection-of-re-entrant-resolver-funct.patch | 38 -------------------
 ...n-iostream.c-fix-build-with-libressl.patch | 38 -------------------
 package/asterisk/asterisk.hash                |  2 +-
 package/asterisk/asterisk.mk                  | 18 ++-------
 6 files changed, 6 insertions(+), 93 deletions(-)
 delete mode 100644 package/asterisk/0005-configure-fix-detection-of-re-entrant-resolver-funct.patch
 delete mode 100644 package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index def465e802..807752c5f4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -159,8 +159,6 @@ package/asterisk/0001-sounds-do-not-download-and-check-sha1s.patch Upstream
 package/asterisk/0002-configure-fix-detection-of-libcrypt.patch Upstream
 package/asterisk/0003-build-ensure-target-directory-for-modules-exists.patch Upstream
 package/asterisk/0004-install-samples-need-the-data-files.patch Upstream
-package/asterisk/0005-configure-fix-detection-of-re-entrant-resolver-funct.patch Upstream
-package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch Upstream
 package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch Upstream
 package/at/S99at Indent Variables
 package/attr/0001-build-with-older-GCCs.patch Upstream
diff --git a/DEVELOPERS b/DEVELOPERS
index cc089e8ff6..d8e8d58026 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3106,6 +3106,7 @@ N:	Wade Berrier <wberrier@gmail.com>
 F:	package/ngrep/
 
 N:	Waldemar Brodkorb <wbx@openadk.org>
+F:	package/asterisk/
 F:	package/mksh/
 F:	package/ruby/
 F:	package/uclibc/
diff --git a/package/asterisk/0005-configure-fix-detection-of-re-entrant-resolver-funct.patch b/package/asterisk/0005-configure-fix-detection-of-re-entrant-resolver-funct.patch
deleted file mode 100644
index bee8fdbb1b..0000000000
--- a/package/asterisk/0005-configure-fix-detection-of-re-entrant-resolver-funct.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 9b4070944578336506cd0a76de6f733c72d0ca74 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 13 Oct 2018 11:11:15 +0200
-Subject: [PATCH] configure: fix detection of re-entrant resolver functions
-
-Fixes https://issues.asterisk.org/jira/browse/ASTERISK-21795
-
-uClibc does not provide res_nsearch:
-asterisk-16.0.0/main/dns.c:506: undefined reference to `res_nsearch'
-
-Patch coded by Yann E. MORIN:
-http://lists.busybox.net/pipermail/buildroot/2018-October/232630.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index dd0c8edd13..ee1ca9ceb6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1388,7 +1388,11 @@ AC_LINK_IFELSE(
- 			#include <arpa/nameser.h>
- 			#endif
- 			#include <resolv.h>],
--			[int foo = res_ninit(NULL);])],
-+			[
-+				int foo;
-+				foo = res_ninit(NULL);
-+				foo = res_nsearch(NULL, NULL, 0, 0, NULL, 0);
-+			])],
- 	AC_MSG_RESULT(yes)
- 	AC_DEFINE([HAVE_RES_NINIT], 1, [Define to 1 if your system has the re-entrant resolver functions.])
- 	AC_SEARCH_LIBS(res_9_ndestroy, resolv)
--- 
-2.19.1
-
diff --git a/package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch b/package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch
deleted file mode 100644
index cdd3aa8cfb..0000000000
--- a/package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 9569fa20fec49f530170a3042afb99556cf66a2e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 17 Apr 2022 10:52:42 +0200
-Subject: [PATCH] main/iostream.c: fix build with libressl
-
-Fix the following build failure with libressl by using SSL_is_server
-which is available since version 2.7.0 and
-https://github.com/libressl-portable/openbsd/commit/d7ec516916c5eaac29b02d7a8ac6570f63b458f7:
-
-iostream.c: In function 'ast_iostream_close':
-iostream.c:559:41: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
-  559 |                         if (!stream->ssl->server) {
-      |                                         ^~
-
-Fixes:
- - http://autobuild.buildroot.org/results/ce4d62d00bb77ba5b303cacf6be7e350581a62f9
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- main/iostream.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/main/iostream.c b/main/iostream.c
-index d060b6d6d4..b8ab80ec91 100644
---- a/main/iostream.c
-+++ b/main/iostream.c
-@@ -553,7 +553,7 @@ int ast_iostream_close(struct ast_iostream *stream)
- 					ERR_error_string(sslerr, err), ssl_error_to_string(sslerr, res));
- 			}
- 
--#if !defined(LIBRESSL_VERSION_NUMBER) && (OPENSSL_VERSION_NUMBER >= 0x10100000L)
-+#if !(defined(LIBRESSL_VERSION_NUMBER) && (LIBRESSL_VERSION_NUMBER < 0x2070000L)) && (OPENSSL_VERSION_NUMBER >= 0x10100000L)
- 			if (!SSL_is_server(stream->ssl)) {
- #else
- 			if (!stream->ssl->server) {
--- 
-2.35.1
-
diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 41e1da2962..246f4219aa 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  ef1ddc07dc02bb0c5f5ba58a5e42e42bcb63e55ac94199be8e3b5d3910f43736  asterisk-16.30.1.tar.gz
+sha256  9def260ac8745a5eac7aceabe1c22f84a283b7812f0eccd760f87ce9eb991d22  asterisk-20.5.2.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 4f1a80ba8b..d1f3ea82d3 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.30.1
+ASTERISK_VERSION = 20.5.2
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
@@ -25,7 +25,7 @@ ASTERISK_CPE_ID_VENDOR = asterisk
 ASTERISK_CPE_ID_PRODUCT = open_source
 ASTERISK_SELINUX_MODULES = asterisk
 
-# For patches 0002, 0003 and 0005
+# For patches 0002 and 0003
 ASTERISK_AUTORECONF = YES
 ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson
 
@@ -56,7 +56,6 @@ ASTERISK_CONF_OPTS = \
 	--without-bfd \
 	--without-cap \
 	--without-cpg \
-	--without-curses \
 	--without-gtk2 \
 	--without-gmime \
 	--without-hoard \
@@ -65,37 +64,26 @@ ASTERISK_CONF_OPTS = \
 	--without-imap \
 	--without-inotify \
 	--without-iodbc \
-	--without-isdnnet \
 	--without-jack \
 	--without-uriparser \
 	--without-kqueue \
 	--without-libedit \
 	--without-libxslt \
 	--without-lua \
-	--without-misdn \
 	--without-mysqlclient \
-	--without-nbs \
 	--without-neon29 \
 	--without-newt \
 	--without-openr2 \
 	--without-osptk \
-	--without-oss \
 	--without-postgres \
-	--without-pjproject \
-	--without-pjproject-bundled \
 	--without-popt \
 	--without-resample \
 	--without-sdl \
 	--without-SDL_image \
-	--without-sqlite \
-	--without-suppserv \
 	--without-tds \
-	--without-termcap \
 	--without-timerfd \
-	--without-tinfo \
 	--without-unbound \
 	--without-unixodbc \
-	--without-vpb \
 	--without-x11 \
 	--with-crypt \
 	--with-jansson \
@@ -103,6 +91,8 @@ ASTERISK_CONF_OPTS = \
 	--with-ilbc \
 	--with-libxml2 \
 	--with-libedit="$(STAGING_DIR)/usr" \
+	--with-pjproject \
+	--with-pjproject-bundled \
 	--with-sqlite3="$(STAGING_DIR)/usr" \
 	--with-sounds-cache=$(ASTERISK_DL_DIR)
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
