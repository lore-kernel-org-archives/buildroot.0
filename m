Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA58C83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2554192B;
	Sat, 26 Aug 2023 18:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE2554192B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9aS5EvVduXbB; Sat, 26 Aug 2023 18:06:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7669B415DF;
	Sat, 26 Aug 2023 18:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7669B415DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA3F11BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2255418D2
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2255418D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gv-y_FVL0bQQ for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:06:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3CEB418C0
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3CEB418C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B060C860FF; Sat, 26 Aug 2023 18:06:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 20:06:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ee8ef970bab8680162175d127e388a04286791f
X-Git-Newrev: 3214d9d2b8ed3decd33c99dcc01172add28cf94c
X-Patchwork-Hint: ignore
Message-Id: <20230826180615.B060C860FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/sipeed_{maixduino,
 maix_go}_sdcard_defconfig: fix build with binutils >= 2.38
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

commit: https://git.buildroot.net/buildroot/commit/?id=3214d9d2b8ed3decd33c99dcc01172add28cf94c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport an upstream patch fixing the build with binutils >= 2.38
for riscv's for Zicsr and Zifencei.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949340
https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949329

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/sipeed_maix_go_sdcard_defconfig   | 1 +
 configs/sipeed_maixduino_sdcard_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 6c61e3aaaf..2bea0b97be 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -17,6 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
+BR2_GLOBAL_PATCH_DIR="board/canaan/k210-soc/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index da8cbe45f9..db7896fadf 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -17,6 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
+BR2_GLOBAL_PATCH_DIR="board/canaan/k210-soc/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
