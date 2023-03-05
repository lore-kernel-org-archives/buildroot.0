Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E579C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 18:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B72AB60FD0;
	Sun,  5 Mar 2023 18:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B72AB60FD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhQUOWIIwpa1; Sun,  5 Mar 2023 18:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6A3B60F99;
	Sun,  5 Mar 2023 18:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6A3B60F99
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF64B1BF865
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 997CB60E66
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 997CB60E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RblY7ZGgHhI for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 18:28:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEF23605B3
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 18:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEF23605B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9B27866ED; Sun,  5 Mar 2023 18:28:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 19:19:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7085ab3eaeb05fedefdb862efe78ad85ab80187
X-Git-Newrev: fd8db3d60c9194c1d27d1bc301f3e0c6b0c81109
X-Patchwork-Hint: ignore
Message-Id: <20230305182821.A9B27866ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglfw: add wayland dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd8db3d60c9194c1d27d1bc301f3e0c6b0c81109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix added by commit 0bbb12eff3b9f9d9719c48644c2b3d563e80de48 was
incomplete resulting in the following build failure:

-- Checking for modules 'wayland-client>=0.2.7;wayland-cursor>=0.2.7;wayland-egl>=0.2.7;xkbcommon'
--   Package 'wayland-client', required by 'virtual:world', not found
--   Package 'wayland-cursor', required by 'virtual:world', not found
--   Package 'wayland-egl', required by 'virtual:world', not found
CMake Error at /home/autobuild/autobuild/instance-9/output-1/host/share/cmake-3.22/Modules/FindPkgConfig.cmake:603 (message):
  A required package was not found

Fixes:
 - http://autobuild.buildroot.org/results/9c032902418a4ab0c9aa655eb29eddee0711815d
 - http://autobuild.buildroot.org/results/7381e114fa5c796c6edbb2c8e3987563bb32b6fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglfw/libglfw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index eee8e7b298..f5d254eec3 100644
--- a/package/libglfw/libglfw.mk
+++ b/package/libglfw/libglfw.mk
@@ -29,7 +29,7 @@ LIBGLFW_DEPENDENCIES += libgles
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-LIBGLFW_DEPENDENCIES += libxkbcommon wayland-protocols
+LIBGLFW_DEPENDENCIES += libxkbcommon wayland wayland-protocols
 # Override pkg-config pkgdatadir variable, it needs the prefix
 LIBGLFW_CONF_OPTS += \
 	-DGLFW_USE_WAYLAND=1 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
