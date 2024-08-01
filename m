Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65044C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AA7B81F87;
	Thu,  1 Aug 2024 21:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfGyrdJjdo0T; Thu,  1 Aug 2024 21:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 880EE820AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 880EE820AF;
	Thu,  1 Aug 2024 21:40:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2A31BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 107BA6067A
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPgbgxIKrxeW for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31D9A606CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31D9A606CA
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:40:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EFC87F931; Thu,  1 Aug 2024 21:40:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Aug 2024 23:39:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91fc008a7913fa0fa74913fc3cd7a4c180d9177a
X-Git-Newrev: a1b28a8c428c31dcb7388f2c81e974ff7de159b4
X-Patchwork-Hint: ignore
Message-Id: <20240801214029.2EFC87F931@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rock5b: remove unneeded uboot
 tools param
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1b28a8c428c31dcb7388f2c81e974ff7de159b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While switching from a custom to mainline kernel in commit
b7dbdd3d775b8e94664c6f37b11afc8a6a352e35, the uboot tools became
unneeded and were removed from the rock5b_defconfig. However, the FIT
support configuration parameter was accidentally left inside the
defconfig. This patch removes it.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/rock5b_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 2765b5fbd8..0778e8afdf 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
-BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
