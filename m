Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DDDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FE7D60D79;
	Mon, 14 Feb 2022 20:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SFg-Gj_5-sp; Mon, 14 Feb 2022 20:02:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B4EA60D51;
	Mon, 14 Feb 2022 20:02:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17E5F1BF316
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06E7560D51
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxbIS7luNmLy for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:01:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65D52606A0
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:01:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 43E188142B; Mon, 14 Feb 2022 19:54:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 20:56:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cef07c93587b186f68c42b8748a4db81c81ec7dc
X-Git-Newrev: fd78150e89abf972d957edd255f2824803d76121
X-Patchwork-Hint: ignore
Message-Id: <20220214195402.43E188142B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/pcengines_apu2_defconfig: linux
 needs host libelf
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd78150e89abf972d957edd255f2824803d76121
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/pcengines_apu2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/pcengines_apu2_defconfig b/configs/pcengines_apu2_defconfig
index 0792c93c19..a85808554c 100644
--- a/configs/pcengines_apu2_defconfig
+++ b/configs/pcengines_apu2_defconfig
@@ -8,6 +8,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pcengines/apu2/linux.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # Default hostname and TTY
 BR2_TARGET_GENERIC_HOSTNAME="apu2"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
