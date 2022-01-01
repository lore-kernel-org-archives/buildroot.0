Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE0BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91733400D9;
	Sat,  1 Jan 2022 10:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wzsAQscRbLFk; Sat,  1 Jan 2022 10:13:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9495A4012F;
	Sat,  1 Jan 2022 10:13:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD4831BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A772C404A9
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wElCCDwnGNYs for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:12:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 460D24012F
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:12:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2ABCF818B0; Sat,  1 Jan 2022 10:06:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 11:09:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9865dc01ddab8d8048acb09787f4e1342cd4377f
X-Git-Newrev: a252a2852df8d42c1fd4b10afc2d0fa385e51186
X-Patchwork-Hint: ignore
Message-Id: <20220101100650.2ABCF818B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shairport-sync: bump to version
 3.3.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=a252a2852df8d42c1fd4b10afc2d0fa385e51186
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop second patch (already in version)

https://github.com/mikebrady/shairport-sync/releases/tag/3.3.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...nfigure.ac-fix-build-with-automake-1.16.5.patch | 48 ----------------------
 package/shairport-sync/shairport-sync.hash         |  2 +-
 package/shairport-sync/shairport-sync.mk           |  2 +-
 3 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch b/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch
deleted file mode 100644
index 2ee8f59fee..0000000000
--- a/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ad22edb303a470b6f9eda9fd9d3f588bb2eff8cb Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 15 Oct 2021 08:02:23 +0200
-Subject: [PATCH] configure.ac: fix build with automake 1.16.5
-
-Fix the following build failure with convolution raised since automake
-1.16.5 and
-https://git.savannah.gnu.org/cgit/automake.git/commit/?id=f4a3a70f69e1dbccb6578f39ef47835098a04624:
-
-configure.ac:305: error: AM_INIT_AUTOMAKE expanded multiple times
-/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
-configure.ac:6: the top level
-/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
-configure.ac:305: the top level
-
-Fixes:
- - http://autobuild.buildroot.org/results/464148bdccb705d8992dc860262bfdeb01b7e2a1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mikebrady/shairport-sync/pull/1314]
----
- configure.ac | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f77087c5..aa533a2d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,7 +3,7 @@
- 
- AC_PREREQ([2.50])
- AC_INIT([shairport-sync], [3.3.8], [4265913+mikebrady@users.noreply.github.com])
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([subdir-objects])
- AC_CONFIG_SRCDIR([shairport.c])
- AC_CONFIG_HEADERS([config.h])
- AC_PROG_RANLIB
-@@ -302,7 +302,6 @@ AM_CONDITIONAL([USE_PA], [test "x$with_pa" = "xyes"])
- # Look for Convolution flag
- AC_ARG_WITH(convolution, [AS_HELP_STRING([--with-convolution],[choose audio DSP convolution support])])
- if test "x$with_convolution" = "xyes" ; then
--  AM_INIT_AUTOMAKE([subdir-objects])
-   AC_DEFINE([CONFIG_CONVOLUTION], 1, [Include audio DSP convolution support.])
-   AC_CHECK_LIB([sndfile], [sf_open], , AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
- fi
--- 
-2.33.0
-
diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index ebc81dedc1..331866a379 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c92f9a2d86dd1138673abc66e0010c94412ad6a46da8f36c3d538f4fa6b9faca  shairport-sync-3.3.8.tar.gz
+sha256  17990cb2620551caa07a1c3b371889e55803071eaada04e958c356547a7e1795  shairport-sync-3.3.9.tar.gz
 sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index ba8b44a621..cf49f2b2ed 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.3.8
+SHAIRPORT_SYNC_VERSION = 3.3.9
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
