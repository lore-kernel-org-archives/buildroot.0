Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D55C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5577942477;
	Sat, 23 Jul 2022 20:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5577942477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olNM0foBZdC5; Sat, 23 Jul 2022 20:24:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 141514185D;
	Sat, 23 Jul 2022 20:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 141514185D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B40FC1BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E8744169A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E8744169A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XiKVgJMBoX9k for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:24:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCE1B4019C
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCE1B4019C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 38075851A3; Sat, 23 Jul 2022 20:10:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:23:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9ef4fb3153fa5e9b4cdbcdd7f193feb3ec82443
X-Git-Newrev: 81ad39d62f660a1409e96d1dbd405d6dab16c0f6
X-Patchwork-Hint: ignore
Message-Id: <20220723201033.38075851A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glslsandbox-player: add support
 for the NullSW windowing system
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

commit: https://git.buildroot.net/buildroot/commit/?id=81ad39d62f660a1409e96d1dbd405d6dab16c0f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This nullws doesn't need any extra dependency other than the EGL/GLES
ones, which will help simplify the glslsandbox-player package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
