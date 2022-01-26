Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19795C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 13:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D51E84B7B;
	Wed, 26 Jan 2022 13:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YC8RqaHNv7Kt; Wed, 26 Jan 2022 13:02:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8D5984B61;
	Wed, 26 Jan 2022 13:02:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A11691BF473
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 13:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DE4741632
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 13:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rlbtQa5YQPZQ for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 13:02:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B83AF41629
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 13:02:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1E5A381439; Wed, 26 Jan 2022 12:55:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 14:01:15 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 6d9f754a5bf92d008469b0f281bfd9fe139ed218
X-Git-Newrev: 0171ea611a308cf227dd2f8f8f79bf1616f34ad7
X-Patchwork-Hint: ignore
Message-Id: <20220126125511.1E5A381439@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/tcpreplay:
 security bump to version 4.3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=0171ea611a308cf227dd2f8f8f79bf1616f34ad7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

- heap buffer overflow in tcpreplay fast_edit_packet
- heap buffer overflow in tcpreplay get_next_packet
- CVE-2020-24266 heap buffer overflow in tcpprep get_l2len
- CVE-2020-24265 heap buffer overflow in tcpprep
- Drop patch (already in version) and so autoreconf
- Update hash of license file (http -> https with
  https://github.com/appneta/tcpreplay/commit/ad8a18005347b3cef84a9b478d56de96d1ad254f)

https://github.com/appneta/tcpreplay/releases/tag/v4.3.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cd5191efd97e814099d211288a9956e88677ff75)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-configure-ac-fix-without-libdnet.patch    | 76 ----------------------
 package/tcpreplay/tcpreplay.hash                   |  6 +-
 package/tcpreplay/tcpreplay.mk                     |  4 +-
 3 files changed, 4 insertions(+), 82 deletions(-)

diff --git a/package/tcpreplay/0001-configure-ac-fix-without-libdnet.patch b/package/tcpreplay/0001-configure-ac-fix-without-libdnet.patch
deleted file mode 100644
index 75ed4f94de..0000000000
--- a/package/tcpreplay/0001-configure-ac-fix-without-libdnet.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From acee9c0c46f71f1f4c33c2dadf69d19e24b90f27 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 13 Aug 2019 20:19:23 +0200
-Subject: [PATCH] configure.ac: fix --without-libdnet
-
-Allow the user to disable libdnet check through --without-libdnet.
-This option is useful to cross-compile tcpreplay to avoid build failures
-if libdnet is installed on host but not on target, see
-https://bugs.buildroot.org/show_bug.cgi?id=12096
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/appneta/tcpreplay/pull/567]
----
- configure.ac | 48 +++++++++++++++++++++++++-----------------------
- 1 file changed, 25 insertions(+), 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 39ba58b7..5de3dcb5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1464,30 +1464,32 @@ if test $have_cygwin = no ; then
-         AC_HELP_STRING([--with-libdnet=DIR], [Use libdnet in DIR]),
-         [trydnetdir=$withval])
- 
--    case "$build_os" in
--    linux*)
--        dnl # Debian/Ubuntu already have a package called libdnet
--        dnl # so you the package you want to install libdumbnet-dev
--        for testdir in $trydnetdir /usr/local /opt/local /usr ; do
--            if test -x ${testdir}/bin/dumbnet-config -a $founddnet = no ; then
--                LDNETINC="$($testdir/bin/dumbnet-config --cflags)"
--                LDNETLIB="$($testdir/bin/dumbnet-config --libs)"
--                libdnet_version="$($testdir/bin/dumbnet-config --version) (libdumbnet)"
--                founddnet=$testdir
--            fi
--        done
--        ;;
--    esac
-+    if test $trydnetdir != no; then
-+        case "$build_os" in
-+        linux*)
-+            dnl # Debian/Ubuntu already have a package called libdnet
-+            dnl # so you the package you want to install libdumbnet-dev
-+            for testdir in $trydnetdir /usr/local /opt/local /usr ; do
-+                if test -x ${testdir}/bin/dumbnet-config -a $founddnet = no ; then
-+                    LDNETINC="$($testdir/bin/dumbnet-config --cflags)"
-+                    LDNETLIB="$($testdir/bin/dumbnet-config --libs)"
-+                    libdnet_version="$($testdir/bin/dumbnet-config --version) (libdumbnet)"
-+                    founddnet=$testdir
-+                fi
-+            done
-+            ;;
-+        esac
- 
--    if test $founddnet = no ; then
--        for testdir in $trydnetdir /usr/local /opt/local $MACOSX_SDK_PATH/usr /usr ; do
--            if test -x ${testdir}/bin/dnet-config -a $founddnet = no ; then
--                LDNETINC="$($testdir/bin/dnet-config --cflags)"
--                LDNETLIB="$($testdir/bin/dnet-config --libs)"
--                libdnet_version="$($testdir/bin/dnet-config --version)"
--                founddnet=$testdir
--            fi
--        done
-+        if test $founddnet = no ; then
-+            for testdir in $trydnetdir /usr/local /opt/local $MACOSX_SDK_PATH/usr /usr ; do
-+                if test -x ${testdir}/bin/dnet-config -a $founddnet = no ; then
-+                    LDNETINC="$($testdir/bin/dnet-config --cflags)"
-+                    LDNETLIB="$($testdir/bin/dnet-config --libs)"
-+                    libdnet_version="$($testdir/bin/dnet-config --version)"
-+                    founddnet=$testdir
-+                fi
-+            done
-+        fi
-     fi
- 
-     if test $founddnet = no ; then
diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index e83efd78b1..8bcdae958c 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/appneta/tcpreplay/releases/download/v4.3.3/tcpreplay-4.3.3.tar.xz.asc
+# https://github.com/appneta/tcpreplay/releases/download/v4.3.4/tcpreplay-4.3.4.tar.xz.asc
 # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
-sha256  5e960e2a4432f583adbd11fa0855d17b73d9e0f2d6453b749f27aacaee53bab5  tcpreplay-4.3.3.tar.xz
-sha256  5971b0c544622f4b210a9cc56436a970685d3b0666e373c09e3cf9304db15d05  docs/LICENSE
+sha256  42c055106e55852c29d94bb6e1b9e001a0723349f2985eb893a47d384c85002b  tcpreplay-4.3.4.tar.xz
+sha256  07cf5e92d475287a7d1663b33097f40cae5adf03ed8920fcd4374e3dfb48c8ad  docs/LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 9208cb8176..ef65403974 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.3.3
+TCPREPLAY_VERSION = 4.3.4
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
@@ -15,8 +15,6 @@ TCPREPLAY_CONF_ENV = \
 TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr \
 	--enable-pcapconfig
 TCPREPLAY_DEPENDENCIES = libpcap
-# We're patching configure.ac
-TCPREPLAY_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
 TCPREPLAY_CONF_OPTS += --enable-dynamic-link=no
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
