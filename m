Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEFECFD640
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7402C821D8;
	Wed,  7 Jan 2026 14:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MA7tWRa9frhR; Wed,  7 Jan 2026 14:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EFD3821D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794940;
	bh=MkY4ITS0NEebNeCjKLBO3tzw/iKeDvGMI/Ta40wLyhE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V0xrUUvPecVdbEAP9X0ZKf9DsDaqbcYyqV148m4AtgiekGYnV6MSRmSyOtdAO9QaT
	 2h0PmE5hka4/hg1W/UKa11j+jvrF0n3X8sid7nY7OXqzJLQkAkQZkF7spWfFNaVBZz
	 xVudVvndxCJ7oL1A1hlr93jKVxHxu4gJrjvWaToaxHVSv83bh4aMoR4x8uRXU8qlu1
	 qvmrGYBIrxhjcYIufGGXPdf4fhShJZRtR3RhfSTFv0PG5dWWS47Cmh7d6ss42HYkMR
	 uxLo8XcBYk0VXYqShRULQPAUVXhkhzWZx2epaSlwlOSMd1AriuBzr/E9x92CcHZtoB
	 DuMnTK1j1sB1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EFD3821D3;
	Wed,  7 Jan 2026 14:09:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A94C970
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AC88409A2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PUk6gh1S6Ds for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A579D409A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A579D409A9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3544883AE; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 15:06:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 405a1682a034c7be58140ff073857028de4bfd72
X-Git-Newrev: 5e835a2874787c33c17b01401704ecd381a45d52
X-Patchwork-Hint: ignore
Message-Id: <20260107140851.A3544883AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/versal2_*: bump to Linux 6.12.60
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e835a2874787c33c17b01401704ecd381a45d52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the versal2 defconfigs to Linux 6.12.60.

Run tested on a versal2 vek385 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/versal2_vek385_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 9a70a6bcb2..a9dd9d7af0 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal2/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sdd2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_XILINX_FPGAUTIL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
