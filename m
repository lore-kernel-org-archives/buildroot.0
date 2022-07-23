Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5203C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5677561B15;
	Sat, 23 Jul 2022 20:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5677561B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IO7erGAaGKhH; Sat, 23 Jul 2022 20:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C9C261B04;
	Sat, 23 Jul 2022 20:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C9C261B04
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 445751BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9648C416A3
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9648C416A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0C2nkPkuU-mI for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:24:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D64AF4048D
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D64AF4048D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4982E851A6; Sat, 23 Jul 2022 20:10:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:23:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 624f2e658d09d13cb9e61a8a52f2227d2a60d7f7
X-Git-Newrev: e88cb1038d3a3691621d0fe14bc9f13d6c9b7389
X-Patchwork-Hint: ignore
Message-Id: <20220723201033.4982E851A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glslsandbox: kms needs gbm
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

commit: https://git.buildroot.net/buildroot/commit/?id=e88cb1038d3a3691621d0fe14bc9f13d6c9b7389
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Obviously, KMS/DRM/GBM needs gbm so add a dependency on libgbm which was
added by commit 4a541ee93242e67f7fab625607f5501c6925d451:

checking for gbm... no
configure: error: Package requirements (gbm) were not met:

Package 'gbm', required by 'virtual:world', not found

Fixes:
 - http://autobuild.buildroot.org/results/31b3fff9748300e293b4efb5615176ccce48dd15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glslsandbox-player/Config.in             | 1 +
 package/glslsandbox-player/glslsandbox-player.mk | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 2b049357a9..132705584e 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -70,6 +70,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_NULL
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS
 	bool "KMS/DRM/GBM"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_LIBDRM
 
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index 6496cdf23d..f0a9475aa6 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -44,9 +44,7 @@ endif
 ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_NULL),y)
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=nullws
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS),y)
-# gbm dependency is not needed, as it is normally packaged with
-# libegl/libgles drivers.
-GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm
+GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm libgbm
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=kms
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-utgard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
