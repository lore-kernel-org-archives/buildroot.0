Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A167CE6918F
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 20:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EC3642D6C;
	Fri, 22 Nov 2024 20:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCjcaE9WL9Gf; Fri, 22 Nov 2024 20:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EEF442D6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EEF442D6E;
	Fri, 22 Nov 2024 20:31:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B30A7E11
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 20:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACC9284B87
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 20:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65WhHdeGkUUr for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 20:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA43284B88
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA43284B88
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 20:30:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2BAB8649A; Fri, 22 Nov 2024 20:30:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 22 Nov 2024 19:43:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 853c3d62c5afd2da7a271f1572b3cbaf62800901
X-Git-Newrev: bc8448eeae071b85c777c3c411c96f875b0619e8
X-Patchwork-Hint: ignore
Message-Id: <20241122203058.D2BAB8649A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/xilinx/patches: add
 xilinx_v2024.2 hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc8448eeae071b85c777c3c411c96f875b0619e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add hashes for xilinx_v2024.2 release for zynq boards.

xilinx_v2024.2 release includes:
 - linux 6.6.40
 - uboot 2024.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/xilinx/patches/linux/linux.hash | 1 +
 board/xilinx/patches/uboot/uboot.hash | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index b007db4303..6f269e1c71 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  6415cfcfd74e943d6ae44f6c1edcae09bf6cd89410b03c4290bf1464a8368f84  xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz
+sha256  8ebbbe2d40597d9a5f36d47a1dfe4caffcef3d9f5ffa059ed4504bb761282593  xlnx_rebase_v6.6_LTS_2024.2.tar.gz
diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
index a5ab9fae05..1fb12d1a11 100644
--- a/board/xilinx/patches/uboot/uboot.hash
+++ b/board/xilinx/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  58e391a001d9d8ed347ab3258ff7c8435c866b1ff2b2c22ebc95af592444c0f5  xlnx_rebase_v2024.01_2024.1.tar.gz
+sha256  f1a86ccdbe60bac89177a24bbfd56fc6e8e67823669f0997de563c3cc0ea4dd1  xlnx_rebase_v2024.01_2024.2.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
