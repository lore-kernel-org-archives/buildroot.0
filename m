Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAD9C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16375405F9;
	Sun,  4 Feb 2024 21:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16375405F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETRFiL0ieVfA; Sun,  4 Feb 2024 21:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC7DC405F5;
	Sun,  4 Feb 2024 21:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC7DC405F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2AD21BF407
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8114A60B57
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8114A60B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OVhJedKFq5SO for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:25:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B873960AD8
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B873960AD8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5FF686934; Sun,  4 Feb 2024 21:25:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 22:24:32 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 93a4ad81741b3b2ce2ae31fa5120ca83510cfcb5
X-Git-Newrev: eefe041de30eacce5c0b6e0dcf977b4594819d19
X-Patchwork-Hint: ignore
Message-Id: <20240204212555.A5FF686934@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/vulkan-loader:
 fix x11 handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=eefe041de30eacce5c0b6e0dcf977b4594819d19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix the following build failure raised since the addition of the package
in commit 6aa1bc31678ff9f8013084fda34b9f941cc63fc3:

In file included from /home/buildroot/autobuild/run/instance-3/output-1/build/vulkan-loader-1.3.262/loader/extension_manual.h:24,
                 from /home/buildroot/autobuild/run/instance-3/output-1/build/vulkan-loader-1.3.262/loader/extension_manual.c:23:
/home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/vulkan/vulkan.h:71:10: fatal error: X11/extensions/Xrandr.h: No such file or directory
   71 | #include <X11/extensions/Xrandr.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/55ddfd44393e3bcc2f25bad2f9ecb7e1b142a985

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3b8b1125adcdb3563a8392e802f0fb5266142e93)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vulkan-loader/vulkan-loader.mk | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
index f6dd9d0ac3..b1545a4972 100644
--- a/package/vulkan-loader/vulkan-loader.mk
+++ b/package/vulkan-loader/vulkan-loader.mk
@@ -26,13 +26,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 VULKAN_LOADER_DEPENDENCIES += libxcb
-VULKAN_LOADER_CONF_OPTS += \
-	-DBUILD_WSI_XCB_SUPPORT=ON \
-	-DBUILD_WSI_XLIB_SUPPORT=ON
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON
 else
-VULKAN_LOADER_CONF_OPTS += \
-	-DBUILD_WSI_XCB_SUPPORT=OFF \
-	-DBUILD_WSI_XLIB_SUPPORT=OFF
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXRANDR),yy)
+VULKAN_LOADER_DEPENDENCIES += xlib_libX11 xlib_libXrandr
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XLIB_SUPPORT=ON
+else
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XLIB_SUPPORT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
