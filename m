Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B634CEFD04
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C5AC807E4;
	Tue,  6 Jan 2026 20:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eom8TM9LR_1Y; Tue,  6 Jan 2026 20:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7783281DE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767731409;
	bh=IlOaN7Jx/1ZpIj6nwKo7bDAwsEEWT6v2WZ7B3uVT1R8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G6jqIspWmVauRdc3Du9qK1CRxY8Neka7rVlBpFeq0seZ/KmqgDPPn4TNMPqYi5Hn/
	 Dm3sUyHp/5WGQp55KYRY/+5myQn1wE/gSejB6JBNNvAvdaRpwVB20yYwDyImbk6ebK
	 TByCB6NB0Gc7YFOQfKW4MlsrGjc3rw+XSLNFXbF29MF+8MlI67A2GkEFWdRP4jTkg6
	 UPA+DZEw5FfayMttQwg+zUiDfKb5Oapx0l0VKGcuFkGtVYVKJTh8+Hv4V9I/dMCaij
	 7m7VYI5u1ubA5Hyxhg6wc/iMlgcXmVB89JwpzNlSKelVMAl3uBOhssQ8Irxy4cRjUU
	 LQMcvr9erPKQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7783281DE6;
	Tue,  6 Jan 2026 20:30:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA6DC70B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BE0260BE4
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUFlg4Cliq_c for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF52760BCB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF52760BCB
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:30:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAFB8882ED; Tue,  6 Jan 2026 20:30:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 21:29:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 898677d8b357f2080c61cce6ef3d0fb0b7689d6e
X-Git-Newrev: 0500fe48900056607e16cb488eef95caf65a9578
X-Patchwork-Hint: ignore
Message-Id: <20260106203007.DAFB8882ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx: add Linux 6.12.60 hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=0500fe48900056607e16cb488eef95caf65a9578
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the hash for the Xilinx Linux 6.12.60 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/xilinx/patches/linux/linux.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
index 90feba3d62..2c5a57277e 100644
--- a/board/xilinx/patches/linux/linux.hash
+++ b/board/xilinx/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  38aec9ce252ed6a0b64d294d4d58bf51e25b249eefb31b800a5ce62cb084298a  xlnx_rebase_v6.12_LTS_2025.2.tar.gz
+sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
