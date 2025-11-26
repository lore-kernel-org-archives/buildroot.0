Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AD2D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83A218132D;
	Fri, 12 Dec 2025 07:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sHdaJzoRpYE; Fri, 12 Dec 2025 07:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D476830C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526171;
	bh=JtflYbisNH/y+vtFY1yOJumnk99vwfqOx1uhndfLVis=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pm9C27yYNARwaw9xjAApz492chjbPOPo/pxSwD6EihKU3Ml55FBvg2I3H/35ELh17
	 zCW0bmp5S1ftpX/Dyf5/GTWfUkuPS2pU0vUOuKVGsh72uZ63e606jBdBLOoVxaMJD0
	 2yMwlZQB9OoWwKjG+hWCb0rVy9iIZ35WL5JwtVI9Ix8fL8kQpEzEbjiLP53N5VmMFP
	 TNggJcxiACmgfbSoEJsH+i7eQiE9m0qBTb9ZkSi9631ag8cxVg5rdEsnafw4FDbjEw
	 2C72qM7CFsgadkx5EqrWaigc28Qk/y0NAb5ognn+s+kwvxcLDifqrSe/yoBowU10JR
	 34huAunje3N0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D476830C0;
	Fri, 12 Dec 2025 07:56:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 142302E9
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D3424115D
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2K7wJ2X6UGwr for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D62244111F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D62244111F
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D537C86C9A; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 10:38:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a23826f481f974d9e6df2d776d7bf27b97b14b9
X-Git-Newrev: c8ce4fc7cf4998480852d62ffaf19359591fde27
X-Patchwork-Hint: ignore
Message-Id: <20251212075534.D537C86C9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx: add xilinx_v2025.2 hashes
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c8ce4fc7cf4998480852d62ffaf19359591fde27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hashes for xilinx_v2025.2 release tags which include the following:
arm-trusted-firmware v2.12
linux v6.12.40
uboot v2025.01
with all Xilinx downstream commits included with xilinx_v2025.2.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 1 +
 board/xilinx/patches/linux/linux.hash                               | 1 +
 board/xilinx/patches/uboot/uboot.hash                               | 1 +
 3 files changed, 3 insertions(+)

diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index d7bd1e73ef..ef387496b1 100644
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  4d16661f367adb8713113acb420a1ad5f611ce6a309e98005a8ea3273511f03d  xlnx_rebase_v2.12_2025.1.tar.gz
+sha256  ea59fbfb702857a24f96ee8e9cf04f997942db1de98f8406b7daf9dcc8f4e9ea  xlnx_rebase_v2.12_2025.2.tar.gz
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 994d637d50..3ecbd03a27 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  ea55acf69bead3d4cf121de414cccfbe75a3c36465c93d9500cc00688d9b8d9d  xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz
+sha256  38aec9ce252ed6a0b64d294d4d58bf51e25b249eefb31b800a5ce62cb084298a  xlnx_rebase_v6.12_LTS_2025.2.tar.gz
diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
index 19192b182c..d46063b7b1 100644
--- a/board/xilinx/patches/uboot/uboot.hash
+++ b/board/xilinx/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  b86d6f07d16a83ed0bdbd9b9439e099afc87ba7dfb77246e2472183848e2ea93  xlnx_rebase_v2025.01_2025.1.tar.gz
+sha256  8819cbebda739436d5d2fbdef578ec3c9b902f7edbe0ce4ed6f0ddf254fcf2a7  xlnx_rebase_v2025.01_2025.2.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
