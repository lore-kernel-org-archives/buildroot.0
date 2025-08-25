Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFE9CA0FE7
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 20:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31FCB42B35;
	Mon, 25 Aug 2025 20:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJK8EwLbnG3y; Mon, 25 Aug 2025 20:40:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6356A42B44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6356A42B44;
	Mon, 25 Aug 2025 20:40:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A79ACD
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 20:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFADC84B06
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 20:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFhAACcPAG3k for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 20:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4135F84AF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4135F84AF4
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 20:40:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CB2587B3D; Mon, 25 Aug 2025 20:40:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Aug 2025 22:22:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37741586af7696985bff7ef398581681fe6e96b9
X-Git-Newrev: 30bc19f730a3897c51fbd43881407dcfc6fe36ad
X-Patchwork-Hint: ignore
Message-Id: <20250825204039.3CB2587B3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx: remove xilinx_v2024.2 hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=30bc19f730a3897c51fbd43881407dcfc6fe36ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch removes the xilinx_v2024.2 hashes since all xilinx defconfigs have
been bumped to xilinx_v2025.1.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 1 -
 board/xilinx/patches/linux/linux.hash                               | 1 -
 board/xilinx/patches/uboot/uboot.hash                               | 1 -
 3 files changed, 3 deletions(-)

diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 2ef3825bb9..d7bd1e73ef 100644
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  a45390c9e1d584a389abd37ee49dce3f8d3b41718b1fd7c977608b5387a38955  xlnx_rebase_v2.10_2024.2.tar.gz
 sha256  4d16661f367adb8713113acb420a1ad5f611ce6a309e98005a8ea3273511f03d  xlnx_rebase_v2.12_2025.1.tar.gz
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 0022390aa6..902169229c 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  b726226e8784d92049190f19768d393eccf3ad111c7a2e685bb29cfa1bdf1f70  xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz
 sha256  25795c354f30a3358506ab02deeac99e7f79850804c52d6c3d5539fd310f0491  xlnx_rebase_v6.12_LTS_2025.1.tar.gz
diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
index 56ee166378..19192b182c 100644
--- a/board/xilinx/patches/uboot/uboot.hash
+++ b/board/xilinx/patches/uboot/uboot.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  f1a86ccdbe60bac89177a24bbfd56fc6e8e67823669f0997de563c3cc0ea4dd1  xlnx_rebase_v2024.01_2024.2.tar.gz
 sha256  b86d6f07d16a83ed0bdbd9b9439e099afc87ba7dfb77246e2472183848e2ea93  xlnx_rebase_v2025.01_2025.1.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
