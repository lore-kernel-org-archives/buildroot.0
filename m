Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55844C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E41E650BE2;
	Fri, 28 Feb 2025 17:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUppvrk70faC; Fri, 28 Feb 2025 17:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C877950BEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C877950BEA;
	Fri, 28 Feb 2025 17:25:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0440E1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E61CF49771
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0csu2lGy9rb for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9417D4935C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9417D4935C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9058C8197A; Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Feb 2025 10:54:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4516f779ff42652a8e70050b0fe13eed03f46cbe
X-Git-Newrev: bf345354b01d21bb5bb2d1379a72cc4afd6d2f02
X-Patchwork-Hint: ignore
Message-Id: <20250228163050.9058C8197A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/xilinx: remove hash for
 Linux 6.6.60
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf345354b01d21bb5bb2d1379a72cc4afd6d2f02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that all Xilinx boards have been bumped to Linux 6.6.70, the Linux 6.6.60
hash can be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/xilinx/patches/linux/linux.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index c759cf0d88..a970a878c2 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  f59c7d260794d73ee519ba2579ef41aa8ac4985ac5af9461f94fa314969acd2e  xlnx_rebase_v6.6_LTS_merge_6.6.60.tar.gz
 sha256  b726226e8784d92049190f19768d393eccf3ad111c7a2e685bb29cfa1bdf1f70  xlnx_rebase_v6.6_LTS_merge_6.6.70.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
