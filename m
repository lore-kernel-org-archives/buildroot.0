Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355FFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3D5060D6C;
	Sat, 11 Dec 2021 20:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eR9m8f-F7mmz; Sat, 11 Dec 2021 20:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D9CE60D74;
	Sat, 11 Dec 2021 20:54:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 101A91BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64E8F60768
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtcL_ASZOtDy for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71DB36134C
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 42CBE82964; Sat, 11 Dec 2021 20:48:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 21:46:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac0ddf8bdfc3c9ab0c5fc89ca200a81c3906c75d
X-Git-Newrev: 7377feafafab33c6223a9e4aa89d249dfb9f3e18
X-Patchwork-Hint: ignore
Message-Id: <20211211204815.42CBE82964@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: bump to verion 0.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7377feafafab33c6223a9e4aa89d249dfb9f3e18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new release includes a number of improvements. Release notes:

  https://wpewebkit.org/release/cog-0.12.0.html

Small tweaks were needed due to the "fdo" platform backend being renamed
as "wl"; the symbol is kept as BR2_PACKAGE_COG_PLATFORM_FDO to avoid
breaking existing configurations. Also the new version supports building
with libsoup3, which is not yet packaged in Buildroot, so -DUSE_SOUP2=ON
is always passed to CMake.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cog/Config.in | 4 ++--
 package/cog/cog.hash  | 8 ++++----
 package/cog/cog.mk    | 9 +++++----
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index 5f00c5a2dd..d4238750f9 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -28,12 +28,12 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
 	  must be always specified in the command line.
 
 config BR2_PACKAGE_COG_PLATFORM_FDO
-	bool "FreeDesktop.org backend"
+	bool "Wayland backend"
 	default y
 	select BR2_PACKAGE_LIBXKBCOMMON
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	help
-	  Enable the FreeDesktop.org backend. Cog will interface with
+	  Enable the Wayland backend. Cog will interface with
 	  a compositor over the Wayland protocol.
 
 config BR2_PACKAGE_COG_PLATFORM_DRM
diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 3abc5f2c83..6a9af1845d 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.10.1.tar.xz.sums
-md5  b997da3c143bc34ec5e953eb7e7ccefc  cog-0.10.1.tar.xz
-sha1  f25312141de918f41add3e3c9984faa985cda0a9  cog-0.10.1.tar.xz
-sha256  aecf546d7b0645119d79559c5574cb5eb68364fc8409dfbd47a4920bd1f221bc  cog-0.10.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.12.0.tar.xz.sums
+md5  30d6f68914af0ba5c32ac14df504215a  cog-0.12.0.tar.xz
+sha1  de367b33fb45a1bca9e443ca5c1d6cae3833d759  cog-0.12.0.tar.xz
+sha256  aad413a8aaf15d400d70f9c909a28b92b138f7b0c0d825978de8788d0d75208a  cog-0.12.0.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 07b8e245ef..606374d9c3 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.10.1
+COG_VERSION = 0.12.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
@@ -16,13 +16,14 @@ COG_CONF_OPTS = \
 	-DCOG_PLATFORM_HEADLESS=ON \
 	-DCOG_WESTON_DIRECT_DISPLAY=OFF \
 	-DINSTALL_MAN_PAGES=OFF \
-	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
+	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
+	-DUSE_SOUP2=ON
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
-COG_CONF_OPTS += -DCOG_PLATFORM_FDO=ON
+COG_CONF_OPTS += -DCOG_PLATFORM_WL=ON
 COG_DEPENDENCIES += libxkbcommon wayland-protocols
 else
-COG_CONF_OPTS += -DCOG_PLATFORM_FDO=OFF
+COG_CONF_OPTS += -DCOG_PLATFORM_WL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
