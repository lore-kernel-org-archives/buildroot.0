Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D521BC38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D78860AF0;
	Mon, 24 Oct 2022 21:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D78860AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rm0mPqmoUWcl; Mon, 24 Oct 2022 21:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FDC360AE4;
	Mon, 24 Oct 2022 21:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FDC360AE4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 035DD1BF30C
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBA77400CE
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBA77400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eF3eXeeZn61T for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B871A400C4
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B871A400C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6C968704C; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 23:27:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13596db789ead1ae68d3d53c298cbdb73e55cdfc
X-Git-Newrev: 54a8261e6f0f80fe8eaa3ad48e0f3936015466e1
X-Patchwork-Hint: ignore
Message-Id: <20221024214302.A6C968704C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libshout: bump to version 2.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=54a8261e6f0f80fe8eaa3ad48e0f3936015466e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version) and so autoreconf
- libvorbis is optional since
  https://gitlab.xiph.org/xiph/icecast-libshout/-/commit/181ac9f3f51825077194599f5c4621fa323b1b7f

https://gitlab.xiph.org/xiph/icecast-libshout/-/blob/v2.4.6/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nfigure.ac-add-an-option-to-disable-tools.patch | 51 ----------------------
 package/libshout/Config.in                         |  1 -
 package/libshout/libshout.hash                     |  4 +-
 package/libshout/libshout.mk                       | 13 ++++--
 4 files changed, 11 insertions(+), 58 deletions(-)

diff --git a/package/libshout/0001-configure.ac-add-an-option-to-disable-tools.patch b/package/libshout/0001-configure.ac-add-an-option-to-disable-tools.patch
deleted file mode 100644
index 5c20db72e9..0000000000
--- a/package/libshout/0001-configure.ac-add-an-option-to-disable-tools.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 148b56bf894192cef6dd133715e295260b934a71 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 5 Mar 2021 15:50:32 +0100
-Subject: [PATCH] configure.ac: add an option to disable tools
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.xiph.org/xiph/icecast-libshout/-/issues/2331]
----
- Makefile.am  | 5 ++++-
- configure.ac | 5 +++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index ea855cf..79241f1 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3,10 +3,13 @@
- AUTOMAKE_OPTIONS = 1.6 foreign
- ACLOCAL_AMFLAGS = -I m4
- 
--SUBDIRS = include src doc win32 tools
-+SUBDIRS = include src doc win32
- if HAVE_EXAMPLES
- SUBDIRS += examples
- endif
-+if HAVE_TOOLS
-+SUBDIRS += tools
-+endif
- 
- EXTRA_DIST = INSTALL m4/shout.m4 m4/acx_pthread.m4 \
- 	m4/ogg.m4 m4/vorbis.m4 m4/xiph_compiler.m4 m4/xiph_net.m4 \
-diff --git a/configure.ac b/configure.ac
-index 264b9b0..34f971c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -100,6 +100,11 @@ AC_ARG_ENABLE([examples],
-   AS_HELP_STRING([--disable-examples],[Do not build example code]))
- AM_CONDITIONAL([HAVE_EXAMPLES],[test "${enable_examples}" != "no"])
- 
-+dnl Allow tools not to be build
-+AC_ARG_ENABLE([tools],
-+  AS_HELP_STRING([--disable-tools],[Do not build tools]))
-+AM_CONDITIONAL([HAVE_TOOLS],[test "${enable_tools}" != "no"])
-+
- dnl Module checks
- XIPH_NET
- 
--- 
-2.30.0
-
diff --git a/package/libshout/Config.in b/package/libshout/Config.in
index f8749b9183..6a7560b349 100644
--- a/package/libshout/Config.in
+++ b/package/libshout/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBSHOUT
 	bool "libshout"
 	select BR2_PACKAGE_LIBOGG
-	select BR2_PACKAGE_LIBVORBIS
 	help
 	  Libshout is a library for communicating with and sending data
 	  to an icecast server. It handles the socket connection, the
diff --git a/package/libshout/libshout.hash b/package/libshout/libshout.hash
index ae43e0a9c8..d562b5231b 100644
--- a/package/libshout/libshout.hash
+++ b/package/libshout/libshout.hash
@@ -1,8 +1,8 @@
 # From https://ftp.osuosl.org/pub/xiph/releases/libshout/SHA512SUMS
-sha512  290844185da16961f03434d3e341573dd6cb0139e5fa81902903021b641382d2629302d7c356bc591b35656754e07f4e44a8d9e782e092b17a051b9ae8f54341  libshout-2.4.5.tar.gz
+sha512  e8478cdbf9a27674c16a7b620d1576f2e31a47262b8e29b314d0f46d4e5be24b9a29790b7b226f48939bc34cacf5734fae0aa5686c7ed5879cdbd827ff8e0339  libshout-2.4.6.tar.gz
 
 # From https://ftp.osuosl.org/pub/xiph/releases/libshout/SHA256SUMS
-sha256  d9e568668a673994ebe3f1eb5f2bee06e3236a5db92b8d0c487e1c0f886a6890  libshout-2.4.5.tar.gz
+sha256  39cbd4f0efdfddc9755d88217e47f8f2d7108fa767f9d58a2ba26a16d8f7c910  libshout-2.4.6.tar.gz
 
 # Hash for license file
 sha256  7a4436f9ec37603356791c87de3bc444989befd2682d29efb3d97604e04c1852  COPYING
diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 4afb762de6..be63786795 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBSHOUT_VERSION = 2.4.5
+LIBSHOUT_VERSION = 2.4.6
 LIBSHOUT_SITE = https://downloads.xiph.org/releases/libshout
 LIBSHOUT_LICENSE = LGPL-2.0+
 LIBSHOUT_LICENSE_FILES = COPYING
 LIBSHOUT_INSTALL_STAGING = YES
-LIBSHOUT_DEPENDENCIES = host-pkgconf libogg libvorbis
-# We're patching configure.ac
-LIBSHOUT_AUTORECONF = YES
+LIBSHOUT_DEPENDENCIES = host-pkgconf libogg
 LIBSHOUT_CONF_OPTS = \
 	--disable-examples \
 	--disable-tools
@@ -23,6 +21,13 @@ else
 LIBSHOUT_CONF_OPTS += --disable-theora
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+LIBSHOUT_CONF_OPTS += --enable-vorbis
+LIBSHOUT_DEPENDENCIES += libvorbis
+else
+LIBSHOUT_CONF_OPTS += --disable-vorbis
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX),y)
 LIBSHOUT_CONF_OPTS += --enable-speex
 LIBSHOUT_DEPENDENCIES += speex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
