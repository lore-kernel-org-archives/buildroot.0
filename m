Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EBAEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 13:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 513C160B23;
	Mon, 17 Jul 2023 13:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 513C160B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ut3vTxpwDeBQ; Mon, 17 Jul 2023 13:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8764E60B8A;
	Mon, 17 Jul 2023 13:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8764E60B8A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2DE1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 13:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44AC6818D4
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 13:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44AC6818D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofzC-S1kBffs for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 13:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 558DF81970
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 13:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 558DF81970
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 438F9872F2; Mon, 17 Jul 2023 13:17:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 15:04:36 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 7f8805c1a698fcf4cf8b62d037c6a8076bd8ab5e
X-Git-Newrev: 8b26a893f567422d56de9ac4edf7310ddb6d8954
X-Patchwork-Hint: ignore
Message-Id: <20230717131709.438F9872F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/mesa3d-demos:
 needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b26a893f567422d56de9ac4edf7310ddb6d8954
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Reference:
https://gitlab.freedesktop.org/mesa/demos/-/blob/main/meson.build#L21

Fixes:
http://autobuild.buildroot.net/results/90e/90e98fa0f37462cadea0fcbff9feabad5554587d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c1a7079a2387738044dd76105267d6477418df48)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-demos/Config.in | 6 ++++++
 package/piglit/Config.in       | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d-demos/Config.in b/package/mesa3d-demos/Config.in
index b716cf5799..7848bb6faf 100644
--- a/package/mesa3d-demos/Config.in
+++ b/package/mesa3d-demos/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MESA3D_DEMOS
 	bool "mesa3d-demos"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES \
 		|| BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBOPENVG
 	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
@@ -10,3 +11,8 @@ config BR2_PACKAGE_MESA3D_DEMOS
 	  OpenGL demos from the Mesa 3D project.
 
 	  http://mesa3d.org
+
+comment "mesa3d-demos needs a toolchain with C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES \
+		|| BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBOPENVG
diff --git a/package/piglit/Config.in b/package/piglit/Config.in
index 5e957a555a..22d1c7c28e 100644
--- a/package/piglit/Config.in
+++ b/package/piglit/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_PIGLIT
 		BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND || \
 		BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL || \
 		BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
-	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
+	depends on BR2_INSTALL_LIBSTDCPP # mesa3d-demos, python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBPNG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
