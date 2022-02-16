Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5786C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 19:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8109C40157;
	Wed, 16 Feb 2022 19:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4GoSm0WTDl7o; Wed, 16 Feb 2022 19:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B39F400D6;
	Wed, 16 Feb 2022 19:54:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2603F1BF592
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6800400D6
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DBaZD6lSuUTm for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 19:53:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDD6640157
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 19:53:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 33617835A2; Wed, 16 Feb 2022 19:45:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 20:49:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 795c473cfdedc71b6dcf5b691cec729d2845da0b
X-Git-Newrev: 6aca97d6e51a006187bcd3319cb7ff1a92380c66
X-Patchwork-Hint: ignore
Message-Id: <20220216194559.33617835A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{mesa3d,
 mesa3d-headers}: bump version to 21.3.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=6aca97d6e51a006187bcd3319cb7ff1a92380c66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2022-February/000663.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 871cf2f495..c8573fafad 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.3.5
+MESA3D_HEADERS_VERSION = 21.3.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e36d798e21..d64b833100 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2022-January/000660.html
-sha256  d93b2a9d2464ee856d7637a07dff6b7cd950f295ad58518bb959f76882cf4a4c  mesa-21.3.5.tar.xz
-sha512  417d1787f8177567f0c547dde3e24212f7497f2fe7cdaa945fe998cd61ec0e9eb9388feb444e377c4fd8794b056af02aac28d1bbfb9527844391ba49e6893933  mesa-21.3.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2022-February/000663.html
+sha256  96bb761fd546e9aa41d025fcc025225c5668443839dae21e3731959beb096736  mesa-21.3.6.tar.xz
+sha512  8c930e04eade29f689384ee7d6e2f178acbbf30fa6c9fdf132281279658c3c221ec7f9b1318e3c0a654c6136f925a5c0a35eaf849b65db7674641127c71e8a4f  mesa-21.3.6.tar.xz
 
 # License
 sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5f080ff5fc..95618b2072 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.3.5
+MESA3D_VERSION = 21.3.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
