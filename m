Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0022BC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93DF741748;
	Wed,  2 Nov 2022 22:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93DF741748
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pGCspHEJ6J71; Wed,  2 Nov 2022 22:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 689F641736;
	Wed,  2 Nov 2022 22:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 689F641736
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2AA91BF966
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEC0781EC5
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEC0781EC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKUndDZpjDYm for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:58:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03D0A81E61
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03D0A81E61
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E35DD87B30; Wed,  2 Nov 2022 22:58:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 23:55:43 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 38dd4017f629a41696dcb2844f28e8ea8bd59c43
X-Git-Newrev: 31d9d073e0b75c957355b5a05823845d8bb0b236
X-Patchwork-Hint: ignore
Message-Id: <20221102225804.E35DD87B30@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
 configs/zynqmp_zcu106_defconfig: fix pmufw sw reset
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

commit: https://git.buildroot.net/buildroot/commit/?id=31d9d073e0b75c957355b5a05823845d8bb0b236
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

This patch will solve the problem of the pmufw built by the
zynqmp-pmufw-builder where soft resets crash for the zcu106.
Details of the issue can be found here:

https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 894753ee47596200104d4ba57cf29eed45aef2c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/zynqmp_zcu106_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 3d98dffe01..896fea0ab2 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2022.1/bin/pmufw-v2022.1.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/v2022.1_22.04_1/xlnx-firmware/zcu106/zcu106_pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
