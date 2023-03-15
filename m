Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7503C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 13:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6874B40218;
	Wed, 15 Mar 2023 13:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6874B40218
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7Axy4pU3k6l; Wed, 15 Mar 2023 13:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C33A41971;
	Wed, 15 Mar 2023 13:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C33A41971
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7DA31BF31D
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 13:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1223409EF
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 13:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1223409EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcUrh7u1YEU3 for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 13:07:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D611640948
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 13:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D611640948
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4293873DA; Wed, 15 Mar 2023 13:07:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 14:05:14 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 7b72b30c758e395bc7796dec8e120ef556e312a8
X-Git-Newrev: 18807592f4bced3abf0d45ee7fc267ecd8d02b15
X-Patchwork-Hint: ignore
Message-Id: <20230315130756.C4293873DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libglfw: add
 wayland dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=18807592f4bced3abf0d45ee7fc267ecd8d02b15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit fd8db3d60c9194c1d27d1bc301f3e0c6b0c81109)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglfw/libglfw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index 0a3986f662..09dbb18ef2 100644
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
