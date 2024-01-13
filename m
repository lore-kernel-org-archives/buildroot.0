Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7282DC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3195860F03;
	Sat, 13 Jan 2024 21:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3195860F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z912Z2FS9fHj; Sat, 13 Jan 2024 21:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C6A660E4B;
	Sat, 13 Jan 2024 21:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C6A660E4B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 863CD1BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5990283022
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5990283022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wyxwN5Y0ykxM for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F49583051
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F49583051
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A01286064; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 22:14:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5f839af621c56aae464ae0beb6f61747001ff2e
X-Git-Newrev: 300717f0e2b5f1ec4434d30aa1c6a2b2da5da3a7
X-Patchwork-Hint: ignore
Message-Id: <20240113211502.5A01286064@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: bump to 20.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=300717f0e2b5f1ec4434d30aa1c6a2b2da5da3a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  2 --
 DEVELOPERS                                         |  1 +
 ...ix-detection-of-re-entrant-resolver-funct.patch | 38 ----------------------
 ...6-main-iostream.c-fix-build-with-libressl.patch | 38 ----------------------
 package/asterisk/asterisk.hash                     |  2 +-
 package/asterisk/asterisk.mk                       | 18 +++-------
 6 files changed, 6 insertions(+), 93 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7417e12e93..bbbf35c102 100644
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
index 94a89c63d5..f5b04937b6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3108,6 +3108,7 @@ N:	Wade Berrier <wberrier@gmail.com>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
