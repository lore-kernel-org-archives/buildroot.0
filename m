Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A575F5A8C6
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 20:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF1EC83155;
	Mon, 20 Apr 2026 20:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eodKFBMgmLs3; Mon, 20 Apr 2026 20:49:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1643C83143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776718168;
	bh=ubdWomfRYwaBGGzm2uA24h9XwhOdu4PaKs3HEknY2AQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lUxbg4Zm4q/Xwx7Rv24qGS7RYvnXnJiUfV1spXXcJOrkroX9y4XXuOCIXt+Ew5FYM
	 nrRzzVnquYjTO4tOlXjOfYsW19dV26QyHQG4vWsE86ZcRABuc52h26D3BpwFRQUeNJ
	 cmT6tLUPUFzW3dOtNaAI+ApxyVrPtG59XnynB0FP838MYTVqlEgbE5R2paqDGCKPfs
	 A54I7xCsTc1QEZ2+vEVMy5wQ0EsZhnJY70MtWDKefIsMVQvx5clqe6AwBZdII9wm76
	 uAKx6Xk8btPZkP2uJPdvDLT5gbq1ZLqQZ/mV6eXuM3lGsiiecPJ8sSqdQulh3Xyc1l
	 ZVhKa+y4k/wLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1643C83143;
	Mon, 20 Apr 2026 20:49:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48F54257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AC1D83126
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F08vbHCTUhFk for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 20:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64E4983122
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64E4983122
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:49:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AC9482167; Mon, 20 Apr 2026 20:49:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 21:44:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ee91a3016fcc84d960a066ff5a501233a8a9526
X-Git-Newrev: 7f29f6badf4e5e35f2bfe75d640a800727bef0ae
X-Patchwork-Hint: ignore
Message-Id: <20260420204926.1AC9482167@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/versal2_*: bump to Linux 6.12.70
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7f29f6badf4e5e35f2bfe75d640a800727bef0ae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump the versal2 defconfigs to Linux 6.12.70.

Run tested on a versal2 vek385 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/versal2_vek385_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index a9dd9d7af0..3096cd9b7a 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal2/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sdd2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.60)/xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_merge_6.12.70)/xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_XILINX_FPGAUTIL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
