Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532A4C4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AD6460E26;
	Tue, 15 Nov 2022 13:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AD6460E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVp76el3WfUJ; Tue, 15 Nov 2022 13:30:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 443EE60C14;
	Tue, 15 Nov 2022 13:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 443EE60C14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F3241BF319
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B5298140C
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B5298140C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NaCuvFtB-7iY for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:30:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59EB581388
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59EB581388
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 499F583CC3; Tue, 15 Nov 2022 13:30:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 14:29:07 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: f3bc8807428924d78eb1df695a7016ad361b89e4
X-Git-Newrev: 398e5f58a3d3c4e41509655ab32d65977dbfd4f5
X-Patchwork-Hint: ignore
Message-Id: <20221115133041.499F583CC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=398e5f58a3d3c4e41509655ab32d65977dbfd4f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

This patch removes the CONFIG_MULTI_DTB_FIT u-boot option for the
zynqmp_kria_kv260_defconfig as it is not necessary.  The post build
kv260.sh creates the proper u-boot.itb without needing this option.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 515319b86f17ea5a2ce3e51c9063bac9f9e00a01)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
