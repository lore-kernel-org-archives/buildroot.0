Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0DDC32772
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 888B3410BB;
	Tue, 16 Aug 2022 20:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 888B3410BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZ6RpR7E0c6N; Tue, 16 Aug 2022 20:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E28E408D2;
	Tue, 16 Aug 2022 20:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E28E408D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D6DD31BF470
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B19EC408AE
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B19EC408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xog5-YaU-zTf for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B89D24086E
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B89D24086E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 77A7A8788D; Tue, 16 Aug 2022 19:58:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 21:50:52 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4608a025d200cc34e1b6985fa5b4a6641b2fb66d
X-Git-Newrev: 85cd3874cb4da5df3f5042b92e3800df71160c98
X-Patchwork-Hint: ignore
Message-Id: <20220816195810.77A7A8788D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/glslsandbox: kms
 needs gbm
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

commit: https://git.buildroot.net/buildroot/commit/?id=85cd3874cb4da5df3f5042b92e3800df71160c98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Obviously, KMS/DRM/GBM needs gbm so add a dependency on libgbm which was
added by commit 4a541ee93242e67f7fab625607f5501c6925d451:

checking for gbm... no
configure: error: Package requirements (gbm) were not met:

Package 'gbm', required by 'virtual:world', not found

Fixes:
 - http://autobuild.buildroot.org/results/31b3fff9748300e293b4efb5615176ccce48dd15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e88cb1038d3a3691621d0fe14bc9f13d6c9b7389)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
