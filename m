Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41918C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C10D342CE4;
	Mon, 20 Feb 2023 21:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C10D342CE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_IeBXx6JlkE; Mon, 20 Feb 2023 21:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56C7E42CE1;
	Mon, 20 Feb 2023 21:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56C7E42CE1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 254941BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4277D610BA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4277D610BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hE2uVpBg3nIV for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6340661095
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6340661095
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CF58828C8; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 21:57:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5e330ff030d11193ce716822c932c2a6b0f109c9
X-Git-Newrev: 515319b86f17ea5a2ce3e51c9063bac9f9e00a01
X-Patchwork-Hint: ignore
Message-Id: <20230220205150.5CF58828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/zynqmp/kria/kv260/uboot.fragment: remove unnecessary
 CONFIG_MULTI_DTB_FIT option
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

commit: https://git.buildroot.net/buildroot/commit/?id=515319b86f17ea5a2ce3e51c9063bac9f9e00a01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch removes the CONFIG_MULTI_DTB_FIT u-boot option for the
zynqmp_kria_kv260_defconfig as it is not necessary.  The post build
kv260.sh creates the proper u-boot.itb without needing this option.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/zynqmp/kria/kv260/uboot.fragment | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/zynqmp/kria/kv260/uboot.fragment b/board/zynqmp/kria/kv260/uboot.fragment
index 874eb470ac..0ed560c411 100644
--- a/board/zynqmp/kria/kv260/uboot.fragment
+++ b/board/zynqmp/kria/kv260/uboot.fragment
@@ -1,7 +1,6 @@
 CONFIG_DEFAULT_DEVICE_TREE="zynqmp-smk-k26-revA"
 CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
 CONFIG_DTB_RESELECT=y
-CONFIG_MULTI_DTB_FIT=y
 CONFIG_DMA=y
 CONFIG_XILINX_DPDMA=y
 CONFIG_PHY=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
