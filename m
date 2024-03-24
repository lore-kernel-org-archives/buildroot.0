Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5030C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 07:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23EDF406FD;
	Sun, 24 Mar 2024 07:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Fz9w73StssC; Sun, 24 Mar 2024 07:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F317D40759
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F317D40759;
	Sun, 24 Mar 2024 07:59:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB3D1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 07:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 040FC81295
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 07:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pM5voaq8F8VU for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 07:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D94581252
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D94581252
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3556583A15; Sun, 24 Mar 2024 07:58:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 08:58:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2846f8fea5ff8798047266f346762a7671d6b32
X-Git-Newrev: 9d4874819948a654510bea71a7d5e3db7ff10bee
X-Patchwork-Hint: ignore
Message-Id: <20240324075859.3556583A15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/visionfive2: fix genimage.cfg path
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d4874819948a654510bea71a7d5e3db7ff10bee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set correct directory for the BR2_ROOTFS_POST_SCRIPT_ARGS.

Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/visionfive2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index dc086953a0..3a1a4f527c 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -3,7 +3,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,05533e9c31d6f0da20efc2d436a3b0f6d516ed4b)/linux-05533e9c31d6f0da20efc2d436a3b0f6d516ed4b.tar.gz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
