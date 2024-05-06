Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2813C25B74
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AC6A822EB;
	Mon,  6 May 2024 20:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSmHALLsLyIZ; Mon,  6 May 2024 20:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9ED3822D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9ED3822D4;
	Mon,  6 May 2024 20:07:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E53A91BF33C
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19D4D4058E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9J9FE7z6V-GI for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E07F4148E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E07F4148E
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:06:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 047F5868B6; Mon,  6 May 2024 20:06:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:05:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1fdfc00dbaaceb2d4b6ae29e50c20992bed7292
X-Git-Newrev: cc2910a7dbd331ae0ad6a8f06ce7cd0559a1ebe1
X-Patchwork-Hint: ignore
Message-Id: <20240506200644.047F5868B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am62x_sk_defconfig: update
 U-Boot to v2024.04
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc2910a7dbd331ae0ad6a8f06ce7cd0559a1ebe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to the latest release from U-Boot

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/ti_am62x_sk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 3ce4862999..51e8793a66 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -27,12 +27,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
