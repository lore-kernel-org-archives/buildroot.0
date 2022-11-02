Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B35CC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B61F41737;
	Wed,  2 Nov 2022 22:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B61F41737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Abf775FFjad1; Wed,  2 Nov 2022 22:58:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5AF841749;
	Wed,  2 Nov 2022 22:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5AF841749
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D633E1BF95F
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B26A1408E5
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B26A1408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vfpG2sHncOAw for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:58:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AF26408DC
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AF26408DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC34F87B31; Wed,  2 Nov 2022 22:58:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 23:56:17 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 31d9d073e0b75c957355b5a05823845d8bb0b236
X-Git-Newrev: 9f270271f8ab5092361c3a86dcc8e16ccebb3d96
X-Patchwork-Hint: ignore
Message-Id: <20221102225804.EC34F87B31@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
 configs/zynqmp_kria_kv260_defconfig: fix pmufw sw reset
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f270271f8ab5092361c3a86dcc8e16ccebb3d96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

This patch will solve the problem of the pmufw built by the
zynqmp-pmufw-builder where soft resets crash for the kv260.
Details of the issue can be found here:

https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/

Please note that this is a temporary solution as the kv260
pmufw is not yet available on the Xilinx github. This is expected
in the coming months.  The nealfrager github uses the same
licensing terms as the Xilinx github regarding the distribution of
zynqmp pmufw binary files.

https://github.com/Xilinx/ubuntu-firmware/blob/v2022.1_22.04_1/LICENSE
https://github.com/nealfrager/buildroot-firmware/blob/v2022.1/LICENSE

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2b564a8ccf8016d4c3c285702b37192abe0852e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 4700e651dc..25bab4cbb4 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -30,7 +30,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/v2022.1/bin/pmufw-v2022.1.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/nealfrager/buildroot-firmware/raw/v2022.1/kv260/kv260_pmufw.bin"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
