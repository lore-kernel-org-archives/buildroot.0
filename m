Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57824C77B7D
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 12:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0E9983B9E;
	Sun, 14 May 2023 12:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0E9983B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QLn6-KSA1wnv; Sun, 14 May 2023 12:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B4F583BCA;
	Sun, 14 May 2023 12:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B4F583BCA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C54131BF48B
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D2F760E39
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D2F760E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svAohZBPWXWX for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 12:32:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C03EE60E22
 for <buildroot@buildroot.org>; Sun, 14 May 2023 12:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C03EE60E22
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEE5F86682; Sun, 14 May 2023 12:32:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 May 2023 14:29:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5f500e1a728b632ccbff553475c0ee7d6c960bb
X-Git-Newrev: 6a3e81bf5492c61dfe14b5e1485b9adb034ce4e8
X-Patchwork-Hint: ignore
Message-Id: <20230514123207.AEE5F86682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtkmm3: bump to version 3.24.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a3e81bf5492c61dfe14b5e1485b9adb034ce4e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/gtkmm/-/blob/3.24.7/NEWS

README [0] states:

    It's easiest to build with Meson, if the tarball was made with Meson,
    and to build with Autotools, if the tarball was made with Autotools.
    Then you don't have to use maintainer-mode.
    How do you know how the tarball was made? If it was made with Meson,
    it contains files in untracked/gdk/gdkmm/, untracked/gtk/gtkmm/ and
    other subdirectories of untracked/.

This is the case, therefore switch to meson build system.

gtkmm3 tries to detect if X11 is enabled for gtk.
Switch to explicit definition to be safe.

Also disable tests and demos.

[0]: https://gitlab.gnome.org/GNOME/gtkmm/-/blob/3.24.7/README

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gtkmm3/gtkmm3.hash |  4 ++--
 package/gtkmm3/gtkmm3.mk   | 16 +++++++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
index fc7e33339e..c54862de67 100644
--- a/package/gtkmm3/gtkmm3.hash
+++ b/package/gtkmm3/gtkmm3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtkmm/3.22/gtkmm-3.22.0.sha256sum
-sha256  05da4d4b628fb20c8384630ddf478a3b5562952b2d6181fe28d58f6cbc0514f5  gtkmm-3.22.0.tar.xz
+# From https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.7.sha256sum
+sha256  1d7a35af9c5ceccacb244ee3c2deb9b245720d8510ac5c7e6f4b6f9947e6789c  gtkmm-3.24.7.tar.xz
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index 8bbcf224e6..f5a2fee6b9 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GTKMM3_VERSION_MAJOR = 3.22
-GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).0
+GTKMM3_VERSION_MAJOR = 3.24
+GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).7
 GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
 GTKMM3_SITE = https://download.gnome.org/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
 GTKMM3_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
@@ -13,4 +13,14 @@ GTKMM3_LICENSE_FILES = COPYING COPYING.tools
 GTKMM3_INSTALL_STAGING = YES
 GTKMM3_DEPENDENCIES = atkmm2_28 cairomm1_14 glibmm2_66 libgtk3 libsigc2 pangomm2_46 host-pkgconf
 
-$(eval $(autotools-package))
+GTKMM3_CONF_OPTS = \
+	-Dbuild-demos=false \
+	-Dbuild-tests=false
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+GTKMM3_CONF_OPTS += -Dbuild-x11-api=true
+else
+GTKMM3_CONF_OPTS += -Dbuild-x11-api=false
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
