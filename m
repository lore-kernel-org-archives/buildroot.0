Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70307C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3CA64042B;
	Tue, 16 Aug 2022 20:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3CA64042B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nga_BlTbYlqJ; Tue, 16 Aug 2022 20:12:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DCDC402EB;
	Tue, 16 Aug 2022 20:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DCDC402EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E96121BF9B9
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D136081494
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D136081494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_2x2i3GaMxs for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1421C8145F
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1421C8145F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C2BE987875; Tue, 16 Aug 2022 19:58:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 21:52:20 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 1a41de765e9d8b204ccf49be29e99dd12a77cef1
X-Git-Newrev: 4a297987151fb6de3fded300f5a614d5ccc908bd
X-Patchwork-Hint: ignore
Message-Id: <20220816195804.C2BE987875@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 package/glslsandbox-player: add support for the NullSW windowing system
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a297987151fb6de3fded300f5a614d5ccc908bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

This nullws doesn't need any extra dependency other than the EGL/GLES
ones, which will help simplify the glslsandbox-player package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 81ad39d62f660a1409e96d1dbd405d6dab16c0f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glslsandbox-player/Config.in             | 5 +++++
 package/glslsandbox-player/glslsandbox-player.mk | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 317eb62898..19536c8546 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -65,6 +65,11 @@ choice
 	help
 	  Select the native windowing system you wish to use.
 
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_NULL
+	bool "NullWS"
+	help
+	  Enable Null Windowing System
+
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS
 	bool "KMS/DRM/GBM"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index 70bd5ca370..6496cdf23d 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -41,7 +41,9 @@ else
 GLSLSANDBOX_PLAYER_CONF_OPTS += --disable-install-scripts
 endif
 
-ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS),y)
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_NULL),y)
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=nullws
+else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS),y)
 # gbm dependency is not needed, as it is normally packaged with
 # libegl/libgles drivers.
 GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
