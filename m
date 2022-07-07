Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298C0C43334
	for <buildroot@archiver.kernel.org>; Thu,  7 Jul 2022 15:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC80D41B7E;
	Thu,  7 Jul 2022 15:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC80D41B7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hTCLPmK2sjiU; Thu,  7 Jul 2022 15:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A4A341B7D;
	Thu,  7 Jul 2022 15:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A4A341B7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A527E1BF5DE
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 15:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F39340FE2
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 15:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F39340FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNRAQ3_h6HDI for <buildroot@lists.busybox.net>;
 Thu,  7 Jul 2022 15:13:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD8C6404B0
 for <buildroot@buildroot.org>; Thu,  7 Jul 2022 15:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD8C6404B0
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 467C7835DC; Thu,  7 Jul 2022 15:00:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Jul 2022 17:10:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3990050c8ba8161689aca7a21ce1600291c6de3
X-Git-Newrev: b38fff43a7d54dcddd02114cb32bcb82a061fa64
X-Patchwork-Hint: ignore
Message-Id: <20220707150015.467C7835DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp/kria/kv260/uboot.fragment:
 add additional uboot build options
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

commit: https://git.buildroot.net/buildroot/commit/?id=b38fff43a7d54dcddd02114cb32bcb82a061fa64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds additional uboot build options that are
required for kria k26 soms.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynqmp/kria/kv260/uboot.fragment | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/board/zynqmp/kria/kv260/uboot.fragment b/board/zynqmp/kria/kv260/uboot.fragment
index e1aca68692..874eb470ac 100644
--- a/board/zynqmp/kria/kv260/uboot.fragment
+++ b/board/zynqmp/kria/kv260/uboot.fragment
@@ -1 +1,16 @@
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-smk-k26-revA"
+CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
+CONFIG_DTB_RESELECT=y
+CONFIG_MULTI_DTB_FIT=y
+CONFIG_DMA=y
+CONFIG_XILINX_DPDMA=y
+CONFIG_PHY=y
+CONFIG_PHY_XILINX_ZYNQMP=y
+CONFIG_PINCTRL=y
+CONFIG_PINCONF=y
+CONFIG_POWER_DOMAIN=y
+CONFIG_ZYNQMP_POWER_DOMAIN=y
+CONFIG_DM_RESET=y
+CONFIG_RESET_ZYNQMP=y
+CONFIG_VIDEO_ZYNQMP_DPSUB=y
+CONFIG_SF_DEFAULT_SPEED=40000000
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
