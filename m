Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0135ECEFD04
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7BA581E9C;
	Tue,  6 Jan 2026 20:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yO0tJJU6ga7M; Tue,  6 Jan 2026 20:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD44D81E6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767731414;
	bh=zKv9dQoIPX1d+wu+kK5+zQ+gLj3YoE306+wQXrY7PPk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LK7G83XULxpAGqaRmGwUruh5yVPiRVX3xvHcGbnICaS1MWofdXdS70a1CmGJnCzsn
	 BqaWffHHTcS8VYa4gAfJ0+xgiqUpGynVz2c/mSTsE/43FkFluEt1r/ki7WWQnHCSBe
	 OVeNFuIjVEl+tZAaE7E7rfPTONaRfQaSw4DQ/LTvDL/wfeVWz9BTQvAmbnVreI+Yax
	 Inh6sbVuRo6NmZP1SvXEmxVs0RtRLI4j17pIOC9qQxLz82EBfkLwMiFeq/m+k3qp3j
	 AyyeYZqopEtgGFH7ruQ6DLyZuUwCJs/vdyUZ2STXGE8nmEphbumrYExG0q35I2lHMz
	 Qv2E6p5EOUe7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD44D81E6B;
	Tue,  6 Jan 2026 20:30:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20B0E70B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1C9981E29
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_Up_akApzqW for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1709481DEE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1709481DEE
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:30:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E397E882EE; Tue,  6 Jan 2026 20:30:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 21:29:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0500fe48900056607e16cb488eef95caf65a9578
X-Git-Newrev: e022e57a971c8bcc252809ed859b55a60ccc5d81
X-Patchwork-Hint: ignore
Message-Id: <20260106203007.E397E882EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynq_*: bump to Linux 6.12.60
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=e022e57a971c8bcc252809ed859b55a60ccc5d81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the zynq defconfigs to Linux 6.12.60.

Run-tested on a zc702 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/zynq_microzed_defconfig | 2 +-
 configs/zynq_zc702_defconfig    | 2 +-
 configs/zynq_zc706_defconfig    | 2 +-
 configs/zynq_zed_defconfig      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index d50e1ab818..f307614337 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
index a4afb61faa..5056d96441 100644
--- a/configs/zynq_zc702_defconfig
+++ b/configs/zynq_zc702_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 4f15fef813..8ec71a2716 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index c08dabadd4..bf9fd40e33 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
