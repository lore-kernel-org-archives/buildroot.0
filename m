Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A493DD43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7145083B97;
	Fri, 12 Dec 2025 07:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8zdEaB5pQlT; Fri, 12 Dec 2025 07:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90CE883868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526185;
	bh=qvjIliwdnI2GmTOD6dLpLB4085wtMUBrSxJux3I4ZEM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HjGBcdSdBASBum44h8FGnSBhYcf9+hIOotPl0PFtOgjS/cc0PpyeOv7GUmHsLWCIz
	 Oxn/yzMA5d2OARAkkCxAcrXBa8FK9r1EDPNmCxpBJwuS6wTcTTB1aOveHUs1FvWsrR
	 PeuL6vMwLn7xBRu7/jYqEgtQ9YrWnM/Ui99tcboCBRgqKb1+a+AL5zFHIclbuOliUf
	 JKQRnnxc9ILdX4FqzgXFmjxnx951XENG7/bjqHfI+wp6LYdusgdXmxo1kHtYSNdxYD
	 LaEtvbdZoJhWEipVHbU5wTKkAWR7OBJMTxPpl7pHprwRxhBw51+dgHAgSUy2HsNIMy
	 fzZImf/YLAMLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90CE883868;
	Fri, 12 Dec 2025 07:56:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34210E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 320DE4117D
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QS_KVp7BERxl for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ACE941129
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1ACE941129
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19B878076A; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 22:51:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ee9ac9d557b851a2c3291816e68a20e590da3af
X-Git-Newrev: f6ef6e933b1aa52e55780334a42f65c35c3283f4
X-Patchwork-Hint: ignore
Message-Id: <20251212075535.19B878076A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx: remove xilinx_v2025.1 hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6ef6e933b1aa52e55780334a42f65c35c3283f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all Xilinx board configs have been bumped to xilinx_v2025.2, remove
the xilinx_v2025.1 hashes which are no longer needed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 1 -
 board/xilinx/patches/linux/linux.hash                               | 1 -
 board/xilinx/patches/uboot/uboot.hash                               | 1 -
 3 files changed, 3 deletions(-)

diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index ef387496b1..429f610a56 100644
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  4d16661f367adb8713113acb420a1ad5f611ce6a309e98005a8ea3273511f03d  xlnx_rebase_v2.12_2025.1.tar.gz
 sha256  ea59fbfb702857a24f96ee8e9cf04f997942db1de98f8406b7daf9dcc8f4e9ea  xlnx_rebase_v2.12_2025.2.tar.gz
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 3ecbd03a27..90feba3d62 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  ea55acf69bead3d4cf121de414cccfbe75a3c36465c93d9500cc00688d9b8d9d  xlnx_rebase_v6.12_LTS_merge_6.12.40.tar.gz
 sha256  38aec9ce252ed6a0b64d294d4d58bf51e25b249eefb31b800a5ce62cb084298a  xlnx_rebase_v6.12_LTS_2025.2.tar.gz
diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
index d46063b7b1..6ef11ef02c 100644
--- a/board/xilinx/patches/uboot/uboot.hash
+++ b/board/xilinx/patches/uboot/uboot.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  b86d6f07d16a83ed0bdbd9b9439e099afc87ba7dfb77246e2472183848e2ea93  xlnx_rebase_v2025.01_2025.1.tar.gz
 sha256  8819cbebda739436d5d2fbdef578ec3c9b902f7edbe0ce4ed6f0ddf254fcf2a7  xlnx_rebase_v2025.01_2025.2.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
