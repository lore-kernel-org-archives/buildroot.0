Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F954C3DA4D
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 304B2412B0;
	Fri, 12 Jul 2024 15:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJ-79aGSwjCd; Fri, 12 Jul 2024 15:00:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 751F641108
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 751F641108;
	Fri, 12 Jul 2024 15:00:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A0E41BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DC6341103
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5xqjDvyjvgC for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 396B840A18
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 396B840A18
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:00:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3345886081; Fri, 12 Jul 2024 15:00:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 16:56:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d64958d92388dc5ecf29f3ddb36cb758d222bef9
X-Git-Newrev: 829f7d9e8462fbfff9afa3ad5d90c7d383a82bb8
X-Patchwork-Hint: ignore
Message-Id: <20240712150022.3345886081@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp: cleanup
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

commit: https://git.buildroot.net/buildroot/commit/?id=829f7d9e8462fbfff9afa3ad5d90c7d383a82bb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all zynqmp defconfigs have been bumped to xilinx-v2024.1, this patch
cleans up the board/zynqmp dir by removing files that are no longer necessary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/zynqmp/kria/uboot.fragment                              | 11 -----------
 ...001-feat-build-add-support-for-new-binutils-versions.patch |  1 -
 .../0002-build-tools-avoid-unnecessary-link.patch             |  1 -
 3 files changed, 13 deletions(-)

diff --git a/board/zynqmp/kria/uboot.fragment b/board/zynqmp/kria/uboot.fragment
deleted file mode 100644
index d8efc230a0..0000000000
--- a/board/zynqmp/kria/uboot.fragment
+++ /dev/null
@@ -1,11 +0,0 @@
-CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
-CONFIG_MULTI_DTB_FIT=y
-CONFIG_DTB_RESELECT=y
-CONFIG_DMA=y
-CONFIG_XILINX_DPDMA=y
-CONFIG_PHY=y
-CONFIG_PHY_XILINX_ZYNQMP=y
-CONFIG_PINCTRL=y
-CONFIG_PINCONF=y
-CONFIG_VIDEO_ZYNQMP_DPSUB=y
-CONFIG_SF_DEFAULT_SPEED=40000000
diff --git a/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
deleted file mode 120000
index 8ad996914b..0000000000
--- a/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
+++ /dev/null
@@ -1 +0,0 @@
-../../../../boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
diff --git a/board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch b/board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
deleted file mode 120000
index fecdee5449..0000000000
--- a/board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
+++ /dev/null
@@ -1 +0,0 @@
-../../../../boot/arm-trusted-firmware/v2.8/0002-build-tools-avoid-unnecessary-link.patch
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
