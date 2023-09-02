Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5018CC83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 17:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E57F460E73;
	Sat,  2 Sep 2023 17:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E57F460E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oXTado4UUqAu; Sat,  2 Sep 2023 17:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2250260E86;
	Sat,  2 Sep 2023 17:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2250260E86
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5221D1BF407
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3912860E38
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3912860E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECObtAwVNWi6 for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 17:14:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CE76605E0
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 17:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CE76605E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3679D86901; Sat,  2 Sep 2023 17:14:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 19:09:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39ae14faabb82703c2cee2ddf23e5925a0f0f251
X-Git-Newrev: 84b0d834a4a0b0fab4bf80d85533db7b5975a09e
X-Patchwork-Hint: ignore
Message-Id: <20230902171402.3679D86901@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d-demos: add dependency on
 libxkbcommon for wayland support
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

commit: https://git.buildroot.net/buildroot/commit/?id=84b0d834a4a0b0fab4bf80d85533db7b5975a09e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of mesa3d-demos to version 9.0.0 in Buildroot commit
80304d9911f34f8a0173a4f37d52f93177478cc7, libxkbcommon is needed for
the wayland support. Without libxkbcommon, the build fails with:

Run-time dependency wayland-client, wayland-egl, xkbcommon found: NO (tried pkgconfig and cmake)

../output-1/build/mesa3d-demos-9.0.0/meson.build:62:14: ERROR: Dependency "wayland-client, wayland-egl, xkbcommon" not found, tried pkgconfig and cmake

Fixes:

  http://autobuild.buildroot.net/results/1c01da4966b054de9c15f0eb3d738806c7d5d315/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Thomas: patch extracted from
https://patchwork.ozlabs.org/project/buildroot/patch/20230716145003.339645-2-bernd@kuhls.net/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-demos/Config.in       | 1 +
 package/mesa3d-demos/mesa3d-demos.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d-demos/Config.in b/package/mesa3d-demos/Config.in
index 7848bb6faf..1761494c3a 100644
--- a/package/mesa3d-demos/Config.in
+++ b/package/mesa3d-demos/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_MESA3D_DEMOS
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
 	help
 	  OpenGL demos from the Mesa 3D project.
 
diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index 29cb00bb8a..a9c9283660 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -63,7 +63,7 @@ MESA3D_DEMOS_CONF_OPTS += -Dosmesa=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-MESA3D_DEMOS_DEPENDENCIES += wayland
+MESA3D_DEMOS_DEPENDENCIES += libxkbcommon wayland
 MESA3D_DEMOS_CONF_OPTS += -Dwayland=enabled
 else
 MESA3D_DEMOS_CONF_OPTS += -Dwayland=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
