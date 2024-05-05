Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598FBC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 08:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97AE0403CC;
	Sun,  5 May 2024 08:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltEBj3pKHhNg; Sun,  5 May 2024 08:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27F8E400F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27F8E400F7;
	Sun,  5 May 2024 08:38:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6581BF82F
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 08:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2AFE403CC
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 08:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSKnjRbp-U_A for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 08:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDCE54029B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDCE54029B
 for <buildroot@buildroot.org>; Sun,  5 May 2024 08:38:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5900863B6; Sun,  5 May 2024 08:38:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 10:35:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f13651ed88944e3af60eedbaab9a983e6274c45b
X-Git-Newrev: 09bcfb56962afddf29457953b5eedcd51e40333f
X-Patchwork-Hint: ignore
Message-Id: <20240505083834.B5900863B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/armadeus_apf51: activates
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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

commit: https://git.buildroot.net/buildroot/commit/?id=09bcfb56962afddf29457953b5eedcd51e40333f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As asked by Romain. Armadeus boards share Linux hashes.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
[yann.morin.1998@free.fr: fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore              | 1 -
 configs/armadeus_apf51_defconfig | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b7461c1cca..8dd76ac53e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -129,7 +129,6 @@ configs/andes_ae350_45_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
 configs/arm_foundationv8_defconfig lib_defconfig.ForceCheckHash
-configs/armadeus_apf51_defconfig lib_defconfig.ForceCheckHash
 configs/aspeed_ast2500evb_defconfig lib_defconfig.ForceCheckHash
 configs/aspeed_ast2600evb_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
diff --git a/configs/armadeus_apf51_defconfig b/configs/armadeus_apf51_defconfig
index af4562ce0f..8317dd7b8b 100644
--- a/configs/armadeus_apf51_defconfig
+++ b/configs/armadeus_apf51_defconfig
@@ -5,6 +5,10 @@ BR2_cortex_a8=y
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/armadeus/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf51"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
