Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2700C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:39:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 658B9610A2
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 658B9610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C355401A2;
	Tue, 12 Oct 2021 20:39:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fM6adG2gmlhm; Tue, 12 Oct 2021 20:39:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 558D04011D;
	Tue, 12 Oct 2021 20:39:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA7D51BF9B9
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F7FA400CE
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sA43qh3JzpFI for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:37:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA7A54011D
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5F16E9553D; Tue, 12 Oct 2021 20:34:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 22:23:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fcddb4a2f354524227fa89bddcd40e56f13db93
X-Git-Newrev: aaced92e8c69e3eb71c2cba4c5ae6a1770ae8972
X-Patchwork-Hint: ignore
Message-Id: <20211012203447.5F16E9553D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/bananapi_m1: use NEON+VFPv4 as FPU
 strategy
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

commit: https://git.buildroot.net/buildroot/commit/?id=aaced92e8c69e3eb71c2cba4c5ae6a1770ae8972
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allwinner A20 supports NEON+VFPv4 so let's enable instead of the default
VFPv4-D16.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/bananapi_m1_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/bananapi_m1_defconfig b/configs/bananapi_m1_defconfig
index 23da363345..2d948ec223 100644
--- a/configs/bananapi_m1_defconfig
+++ b/configs/bananapi_m1_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
