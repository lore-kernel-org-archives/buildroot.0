Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDDFCFD637
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 026A981F92;
	Wed,  7 Jan 2026 14:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJF0lNhpa_ZH; Wed,  7 Jan 2026 14:08:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A002081FD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794938;
	bh=ycuwyQfIgpqFRm93YNNzy4bpasf0y2rIR13FGiTarvc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qxGQ25KwDqf02xG83odPFdoKGZaHT/ihP+P2zXQSLuqIOjf4uMdsaIZQvlVQmDs8s
	 fuZeQUwgv9a0bprNDWOBmILirlg7XGtNVJ+6uyv/ygdIJWCwMkunCOQ5ZU/qfnx7Bg
	 9tx6L05nv5WodN/1tHenOKjrWMD64ZL2kXYwWx9IJsl9uckXJjUqXgDTFBgCLXh18Y
	 yDSbLOeID6ho9bnAHI6jkAMA1aLSvxSOPur06iGUkLylNujdCMmEExt7VfWDhfzEFp
	 i9ui0CW4PvH36tOZISrFPNQaOfDc1AGd9uyZdpo9xo6cwlNxfsczGp+MCeIV3noZic
	 cg4rbiIaepSmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A002081FD6;
	Wed,  7 Jan 2026 14:08:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F6E6436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63ABE6083E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5INSZzSq1ijC for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE5E060D59
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE5E060D59
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD88F88348; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 15:06:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e835a2874787c33c17b01401704ecd381a45d52
X-Git-Newrev: 9fb55bea2149adda6a852868697c94a979fbd997
X-Patchwork-Hint: ignore
Message-Id: <20260107140851.AD88F88348@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx: remove xilinx_v2025.2 hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fb55bea2149adda6a852868697c94a979fbd997
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all Xilinx boards have been bumped to Linux 6.12.60, remove the hash
for the xlnx_rebase_v6.12_LTS_2025.2 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/xilinx/patches/linux/linux.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 2c5a57277e..0b1d9331f0 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  38aec9ce252ed6a0b64d294d4d58bf51e25b249eefb31b800a5ce62cb084298a  xlnx_rebase_v6.12_LTS_2025.2.tar.gz
 sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
