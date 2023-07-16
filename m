Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ACDEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 17:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C55E40498;
	Sun, 16 Jul 2023 17:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C55E40498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5xMs7qTDEWX; Sun, 16 Jul 2023 17:01:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC208405DD;
	Sun, 16 Jul 2023 17:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC208405DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48A1A1BF2F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 17:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DC49405DD
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 17:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DC49405DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMzBhQ5nlFJq for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 17:01:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58B1F4036E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58B1F4036E
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 17:01:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D69BA4C0B20;
 Sun, 16 Jul 2023 19:01:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50312)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qL57e-0002Gu-0q;
 Sun, 16 Jul 2023 19:01:26 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 19:01:26 +0200
Message-Id: <20230716170126.438652-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230716170126.438652-1-bernd@kuhls.net>
References: <20230716170126.438652-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689526886;
 bh=ZNH9zUj0IkLzwuK9aFmoB+CiGse/85nU9IJRl4DDttU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hw+Svv8K/cLic8HUmtql3x7f2QIWU4we5/42tRJ4ErL2tpjy0dF8ux2cO45iwVkMg
 rIX08HEuTYUn97zVZQ1oHP34jopiviMmFST7JuFjOJQqB7chFJILB+H41uoP8RLipj
 zK02Lj9mDi7SSdq8kp/fctQiRGD5e0hd4NzkNFiEjWXeMluHGXI9a60o8QTEXFtaOI
 wq2JOO5swDELoekSNl9s8TY5zI0Br8GowX/89/Q5nOPXR5Y/6bBmc5toWQ39e6jTxX
 wz/wZq3qFcyrWmRfyGrIOB0YwfNlOhUqOqobLMS4bJX1TVXHdaXmnSH4vCsN+9BGjV
 u9uIvnWqnJQBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=hw+Svv8K
Subject: [Buildroot] [PATCH 2/2] package/xscreensaver: bump version to 6.06
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add more patches to fix build errors.

Changelog: https://www.jwz.org/xscreensaver/changelog.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  2 +
 ...disable-failure-ac_unrecognized_opts.patch | 17 +++++++
 ...-CONF_STATUS-for-gtk-and-openGL-need.patch | 45 +++++++++++++++++++
 package/xscreensaver/xscreensaver.hash        |  2 +-
 package/xscreensaver/xscreensaver.mk          |  2 +-
 5 files changed, 66 insertions(+), 2 deletions(-)
 create mode 100644 package/xscreensaver/0003-disable-failure-ac_unrecognized_opts.patch
 create mode 100644 package/xscreensaver/0004-configure-Ignore-CONF_STATUS-for-gtk-and-openGL-need.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index fa557733e8..3ed92ded10 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1640,6 +1640,8 @@ package/xl2tp/xl2tpd TrailingSpace
 package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch Upstream
 package/xscreensaver/0001-disable-check-for-pam.patch
 package/xscreensaver/0002-build-Do-not-build-po-files.patch
+package/xscreensaver/0003-disable-failure-ac_unrecognized_opts.patch
+package/xscreensaver/0004-configure-Ignore-CONF_STATUS-for-gtk-and-openGL-need.patch
 package/xxhash/0001-fix-man-page-installation.patch Upstream
 package/xxhash/0002-Makefile-add-dedicated-install-targets.patch Upstream
 package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch Upstream
diff --git a/package/xscreensaver/0003-disable-failure-ac_unrecognized_opts.patch b/package/xscreensaver/0003-disable-failure-ac_unrecognized_opts.patch
new file mode 100644
index 0000000000..1fe9695c19
--- /dev/null
+++ b/package/xscreensaver/0003-disable-failure-ac_unrecognized_opts.patch
@@ -0,0 +1,17 @@
+Do not return an error code when unrecognized configure options are used.
+
+Inspired by
+https://github.com/OpenMandrivaAssociation/xscreensaver/blob/master/xscreensaver.spec#L124
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/configure.ac.orig	2023-07-16 14:51:57.982072603 +0200
++++ b/configure.ac	2023-07-16 15:35:13.616281941 +0200
+@@ -22,7 +22,6 @@
+ 
+ if ! test -z "$ac_unrecognized_opts" ; then
+   echo "" >&2
+-  exit 2
+ fi
+ 
+ ###############################################################################
diff --git a/package/xscreensaver/0004-configure-Ignore-CONF_STATUS-for-gtk-and-openGL-need.patch b/package/xscreensaver/0004-configure-Ignore-CONF_STATUS-for-gtk-and-openGL-need.patch
new file mode 100644
index 0000000000..d153f39a76
--- /dev/null
+++ b/package/xscreensaver/0004-configure-Ignore-CONF_STATUS-for-gtk-and-openGL-need.patch
@@ -0,0 +1,45 @@
+From 516fbcdcfe6343b1d64d35957ddb768346713ff6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 17 Jul 2022 09:47:35 -0700
+Subject: [PATCH] configure: Ignore CONF_STATUS for gtk and openGL needs
+
+These are just warnings
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Downloaded from
+https://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graphics/xscreensaver/files/0001-configure-Ignore-CONF_STATUS-for-gtk-and-openGL-need.patch
+
+[Bernd: rebased for 6.06]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c4fd38f..d7463cf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4549,7 +4548,6 @@ if test "$have_motif" = no -a "$have_gtk" = no; then
+   else
+     warnL "The GTK libraries do not seem to be available; the"
+     warn2 "\`xscreensaver-settings' program requires them."
+-    CONF_STATUS=1
+ #   echo ''
+ #   warn2 'You can use Motif or Lesstif instead of GTK (use the'
+ #   warn2 "\`--with-motif' option) but that is NOT recommended."
+@@ -4735,10 +4733,8 @@ if test "$have_gl" = no ; then
+     CONF_STATUS=1
+   elif test "$with_gl_req" = no ; then
+     noteL 'The OpenGL 3D library is not being used.'
+-    CONF_STATUS=1
+   else
+     noteL 'The OpenGL 3D library was not found.'
+-    CONF_STATUS=1
+   fi
+ 
+   if test "$gl_halfassed" = yes ; then
+-- 
+2.37.1
+
diff --git a/package/xscreensaver/xscreensaver.hash b/package/xscreensaver/xscreensaver.hash
index 27ef7d8f00..db0a410bfc 100644
--- a/package/xscreensaver/xscreensaver.hash
+++ b/package/xscreensaver/xscreensaver.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  328d51797352acf58ca5bab49e76fbf26034e7cad785f651ea11ce7b43fba25a  xscreensaver-6.03.tar.gz
+sha256  f534fab85a836de5b8be8e91fc21b80ca7d6a4ed9386ebe207d4be7a4e7499a7  xscreensaver-6.06.tar.gz
 sha256  8a03451ba5c4c9af669b53e47e50c38c149b9e152d3d627809b962da7b760bbd  hacks/screenhack.h
 sha256  56db580415bb313a4a82c5e08f106304904d15d42faf8e6ab14b34e14e2087a5  hacks/glx/chessmodels.h
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index fed25925cc..c0abade508 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSCREENSAVER_VERSION = 6.03
+XSCREENSAVER_VERSION = 6.06
 XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 
 # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
