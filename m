Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7661F5A8C7
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 20:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A74804113A;
	Mon, 20 Apr 2026 20:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qZVK2Irim5d; Mon, 20 Apr 2026 20:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 000654112F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776718175;
	bh=JfjQT4mVmXcGOMnpKEDgNWYb3cGFkyqQNlFfiHvmvc0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QrJIt0lkc74jPvHtSi411SAJ9F6NP9VNSf/7Jerj0E5+QukyD9f570ovdRmjF74ts
	 tHLgkD3WbVyMkP5d59SGckw2HVKKVLFp7ZXzsz72N6zzTdJnKQ7/zfCV7vStUrXUZ8
	 7b7Zjz4QacYQrKGdgRbgIeOQbpnX2jkqcmbVUzi1rYi/8uyA5b+MxTfKuCctPX1qaV
	 Ff0/fZbELeKKXBYYlfEsymcCE07RVC2ERGyhMmtlXq81IPbJiUt/qwnCSwiVNySZxG
	 3uAoWhO2LM3ylbkC7RsJPmqiGchWFXEWo7bT61UB0N2B3j+3pOnZUegmhYP0irZF0Q
	 ypQFkrreKHyKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 000654112F;
	Mon, 20 Apr 2026 20:49:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0319B257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B8FF83147
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CTvtPWK7KxV for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 20:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E59083145
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E59083145
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 20:49:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 226F28216E; Mon, 20 Apr 2026 20:49:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 21:44:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f29f6badf4e5e35f2bfe75d640a800727bef0ae
X-Git-Newrev: b228deaeccd222c620b8bd6dedcca08fd95149ff
X-Patchwork-Hint: ignore
Message-Id: <20260420204926.226F28216E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx: remove Linux 6.12.60 hash
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b228deaeccd222c620b8bd6dedcca08fd95149ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Now that all Xilinx boards have been bumped to Linux 6.12.70, remove the hash
for the xlnx_rebase_v6.12_LTS_merge_6.12.60 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/xilinx/patches/linux/linux.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 87db73fc78..bedb88c7ff 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,5 +1,4 @@
 # Locally calculated
-sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz
 sha256  002fa6c617d3d3eaf1e16219079f4e4303b84ea472b2b3c5d47f766a106a79c7  xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz
 
 # Locally calculated
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
