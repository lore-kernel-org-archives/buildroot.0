Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBAAC46467
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 19:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A044060E34;
	Sat,  7 Jan 2023 19:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A044060E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJcGM-YgdGff; Sat,  7 Jan 2023 19:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A63E60ECE;
	Sat,  7 Jan 2023 19:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A63E60ECE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03AAE1BF844
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 19:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2495C410B1
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 19:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2495C410B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zkuYEUhph2vy for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 19:29:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DED9410C0
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 19:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DED9410C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D7AE87625; Sat,  7 Jan 2023 19:29:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Jan 2023 20:24:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5db2e5d45e75b44e7c7c5ad8c61d1be2a2748cbc
X-Git-Newrev: fad36fa91d9a85ce548ea7f3fd42c1c4b31564ba
X-Patchwork-Hint: ignore
Message-Id: <20230107192932.2D7AE87625@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/hifive_unleashed_defconfig:
 explicitly use OpenSBI 0.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=fad36fa91d9a85ce548ea7f3fd42c1c4b31564ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rather than relying on what is currently the default.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/hifive_unleashed_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 0b87f2588f..2b6ee6c08e 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -37,6 +37,8 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="0.9"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
