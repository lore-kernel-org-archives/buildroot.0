Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6ACF5A8BC
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 20:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65DDD831CA;
	Mon, 20 Apr 2026 20:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYf08iwqGLTJ; Mon, 20 Apr 2026 20:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E0C283147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776718169;
	bh=AnslgDCnHkHwIAp0m6K9QvX2TrBQoYvAOVlswvWtMk4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n2Qne32O0pI/dPf32x4r/Yl/6MdZxNgigKOMNMmhzAexdZPtcdGcskfM4R0ULVnPE
	 cAXThYD2BitUs+4eMT5b846NZDUufqnaqMXq/NaJTBmyrP2uR61ve1FeRczB2icEFH
	 i/3KXKMPpWnYFHI/hP1wdAOd2lzypCyXytQsGaK+itSFqNaCmzcHgKgzTkYxIgPuH8
	 BLb3SAyWFz3xQ6Vn5Tf+h1H74HypkzN6RyoOJiftfH49ER0S3Ok8ga8rxa24rf2iYK
	 0/fFK+tVc2C9+8I6CIK9oLK+ixglSl7ZhLXFtaO0MhGDQFNXPET3XK/oVT0NDRX4QY
	 J46y/5kp+uHkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E0C283147;
	Mon, 20 Apr 2026 20:49:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5859B355
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E8EE41113
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9qa9hCjLBMo for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 20:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45F0740C1A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45F0740C1A
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:49:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC6F982167; Mon, 20 Apr 2026 20:49:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 21:44:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a266be923f5a8077d40b5c65c4e23138ddce3a63
X-Git-Newrev: f69408025327b6fa630c4183425688a6abf04f11
X-Patchwork-Hint: ignore
Message-Id: <20260420204925.EC6F982167@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx: add Linux 6.12.70 hash
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f69408025327b6fa630c4183425688a6abf04f11
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the hash for the Xilinx Linux 6.12.70 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/xilinx/patches/linux/linux.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index d843dafb20..87db73fc78 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,5 +1,6 @@
 # Locally calculated
 sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz
+sha256  002fa6c617d3d3eaf1e16219079f4e4303b84ea472b2b3c5d47f766a106a79c7  xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz
 
 # Locally calculated
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
