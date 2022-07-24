Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBC2C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24032405D0;
	Sun, 24 Jul 2022 19:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24032405D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zYedLL2o0SFr; Sun, 24 Jul 2022 19:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A9B840441;
	Sun, 24 Jul 2022 19:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A9B840441
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E885E1BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD4856104A
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD4856104A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Q1TzT1Npd3n for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71D1460D59
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71D1460D59
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9FC5985CCA; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:52:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20c71ceea0363f0eb0ade4508e8bc78474587ba0
X-Git-Newrev: 3c006f162c1e95ee0964efad077cedb0e213f947
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.9FC5985CCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-mga: bump
 version to 2.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c006f162c1e95ee0964efad077cedb0e213f947
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch (and autoreconf) which was commited upstream:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/commit/f227f2f286123a9ca64b567783825a2c18b87971

COPYING hash changed because of a spelling fix: MERCHANTIBILITY ->
MERCHANTABILITY. Note that the latter is also the spelling used in the
official MIT license.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../xdriver_xf86-video-mga/0001-misc-fixes.patch    | 21 ---------------------
 .../xdriver_xf86-video-mga.hash                     | 10 ++++------
 .../xdriver_xf86-video-mga.mk                       |  7 +++----
 3 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mga/0001-misc-fixes.patch b/package/x11r7/xdriver_xf86-video-mga/0001-misc-fixes.patch
deleted file mode 100644
index 5707bd1b3a..0000000000
--- a/package/x11r7/xdriver_xf86-video-mga/0001-misc-fixes.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- xf86-video-mga-1.4.9/configure.ac.orig	2007-06-10 11:55:24.000000000 +0200
-+++ xf86-video-mga-1.4.9/configure.ac	2007-06-10 12:00:37.000000000 +0200
-@@ -77,12 +77,18 @@
- AC_HEADER_STDC
- 
- if test "x$DRI" != xno; then
-+	if test "$cross_compiling" = no; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-         AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
-         AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+	else
-+		have_dri_h="yes"
-+		have_sarea_h="yes"
-+		have_dristruct_h="yes"
-+	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
index 218e52e19c..813429789b 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-December/002933.html
-md5 b8fc99b4adea8bfe80156b13df4b6c9c  xf86-video-mga-2.0.0.tar.bz2
-sha1 833f2710a1fd7b3f2db3700b2ad055527da5033b  xf86-video-mga-2.0.0.tar.bz2
-sha256 268946e1a13e9d80e4f724a0740df9e6e8c8bad37697fcbf456924e9fdbb5d79  xf86-video-mga-2.0.0.tar.bz2
-sha512 b92006486aef815ff4399f291d610c65d88c0b32a9dae97658c644715ff62b221b01495b5c7a2311745e26f699c1c1f753b81c7bf54cf75567af9f78ac015540  xf86-video-mga-2.0.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003184.html
+sha256  27a33b70837965bb4a5f27fd260be085ca5bba837a4e62907f093c2f205603ab  xf86-video-mga-2.0.1.tar.xz
+sha512  d9a0abedb71f3354788c2f91b770bc00c4118cfa2c99072dea82c28f025bc87bb88ebaf969962a8f0e97e1ff7938aebd9c682b730b0e07d5174dd9e8dc2cdfb6  xf86-video-mga-2.0.1.tar.xz
 # Locally computed
-sha256 6c567575e381478c7616eedff3ea2ae5228a5b54fbdd22d4070ebae312fa085c  COPYING
+sha256  f69c2f4fd11ec4de7fcc23146187836eed1755aade3fef28b9204ea1a4adf61b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 24f2da2cce..4841a643bc 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MGA_VERSION = 2.0.0
-XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/archive/individual/driver
+XDRIVER_XF86_VIDEO_MGA_VERSION = 2.0.1
+XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_MGA_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_MGA_LICENSE = MIT
 XDRIVER_XF86_VIDEO_MGA_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
