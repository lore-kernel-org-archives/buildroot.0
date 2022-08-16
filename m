Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D94C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F7D560B2D;
	Tue, 16 Aug 2022 20:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F7D560B2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 92R0CkdjyS5H; Tue, 16 Aug 2022 20:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C9D605A1;
	Tue, 16 Aug 2022 20:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0C9D605A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E9E31BF470
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A03E814A0
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A03E814A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUBeo-qus1jZ for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A45EC8145F
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A45EC8145F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 624398788B; Tue, 16 Aug 2022 19:58:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 21:50:38 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ef9adc2e01de30bc022d924b28a7742137f64ac8
X-Git-Newrev: 0e2d07ee6e93b56d0202227d3655fd44dcb5d662
X-Patchwork-Hint: ignore
Message-Id: <20220816195810.624398788B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e2d07ee6e93b56d0202227d3655fd44dcb5d662
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
