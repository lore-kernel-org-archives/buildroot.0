Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576A3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 14:04:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EDA160F12
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 14:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EDA160F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97C38402BB;
	Sun,  5 Sep 2021 14:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QseC1VU2upTm; Sun,  5 Sep 2021 14:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7988D402A4;
	Sun,  5 Sep 2021 14:04:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 859DB1BF968
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 14:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 741D640389
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 14:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ffDWSzgi-wWZ for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 14:04:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4C9740384
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 14:04:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 91FBE88600; Sun,  5 Sep 2021 14:03:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Sep 2021 16:03:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bc053c2b118b9d3de119a57dc9241b3ccdbebb9
X-Git-Newrev: 7744f8f35035e411026838515121c925235a46e1
X-Patchwork-Hint: ignore
Message-Id: <20210905140318.91FBE88600@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glslsandbox-player: add mali-t76x
 support
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7744f8f35035e411026838515121c925235a46e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mali-t76x frame buffer driver requires a "null" native windowing
system. With such a system, the default EGL display is selected.

Fixes:
http://autobuild.buildroot.net/results/4a579346463d0d946d6d2a05723270135d728981

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glslsandbox-player/Config.in             | 5 +++++
 package/glslsandbox-player/glslsandbox-player.mk | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index dc0d2c07f1..8ab668d260 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -56,6 +56,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
 choice
 	prompt "Native windowing system"
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI  if BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X if BR2_PACKAGE_MALI_T76X
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI   if BR2_PACKAGE_RPI_USERLAND
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2  if BR2_PACKAGE_SDL2_OPENGLES
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX if BR2_PACKAGE_TI_SGX_UM
@@ -73,6 +74,10 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI
 	bool "Allwinner ARM/Mali Frame Buffer"
 	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
 
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X
+	bool "ARM/Mali T76x Frame Buffer"
+	depends on BR2_PACKAGE_MALI_T76X
+
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI
 	bool "RaspberryPI Frame Buffer"
 	depends on BR2_PACKAGE_RPI_USERLAND
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index 341b939110..1578608a42 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -44,6 +44,9 @@ GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=kms
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-mainline
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=mali
+else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += mali-t76x
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=nullws
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += rpi-userland
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=rpi
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
