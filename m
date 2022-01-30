Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4C7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B13F83E5C;
	Sun, 30 Jan 2022 14:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmhOGtyIkfO6; Sun, 30 Jan 2022 14:50:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87CB483E2F;
	Sun, 30 Jan 2022 14:50:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03F001BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E54136058F
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXLzy_sSP4nY for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:50:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3061F60087
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:50:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7617282AE5; Sun, 30 Jan 2022 14:43:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 15:50:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e2976aee57cb4f8f75899c4ad5a5ea4ff8f5ad4
X-Git-Newrev: 079923d5fabf4f887bb140808cb16067ca08b19b
X-Patchwork-Hint: ignore
Message-Id: <20220130144346.7617282AE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: bump version to 2.70.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=079923d5fabf4f887bb140808cb16067ca08b19b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The internal_pcre option was dropped in:
https://gitlab.gnome.org/GNOME/glib/-/commit/9fbd7f3dc1f029b64b6991a540402b2bfa98de5c

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglib2/0002-remove-cpp-requirement.patch | 2 +-
 package/libglib2/libglib2.hash                     | 4 ++--
 package/libglib2/libglib2.mk                       | 6 ++----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
index c402cbafa5..2f95228932 100644
--- a/package/libglib2/0002-remove-cpp-requirement.patch
+++ b/package/libglib2/0002-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.68.4',
+   version : '2.70.0',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index d421e025ff..580be3e08e 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.68/glib-2.68.4.sha256sum
-sha256  62fd061d08a75492617e625a73e2c05e259f831acbb8e1f8b9c81f23f7993a3b  glib-2.68.4.tar.xz
+# https://download.gnome.org/sources/glib/2.70/glib-2.70.0.sha256sum
+sha256  200d7df811c5ba634afbf109f14bb40ba7fde670e89389885da14e27c0840742  glib-2.70.0.tar.xz
 # License files, locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index af73aeb3bf..d3cba1a8bb 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.68
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION_MAJOR = 2.70
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
@@ -30,7 +30,6 @@ HOST_LIBGLIB2_CONF_OPTS = \
 	-Dselinux=disabled \
 	-Dsystemtap=false \
 	-Dxattr=false \
-	-Dinternal_pcre=false \
 	-Dtests=false \
 	-Doss_fuzz=disabled
 
@@ -52,7 +51,6 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 # bogus installation path once combined with $(DESTDIR).
 LIBGLIB2_CONF_OPTS = \
 	-Dglib_debug=disabled \
-	-Dinternal_pcre=false \
 	-Dlibelf=disabled \
 	-Dgio_module_dir=/usr/lib/gio/modules \
 	-Dtests=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
