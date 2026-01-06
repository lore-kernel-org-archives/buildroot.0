Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECA9D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34953414D3;
	Wed,  7 Jan 2026 18:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkkakXQ19ZY0; Wed,  7 Jan 2026 18:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FD0A414F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808967;
	bh=Oul2VN4HTTdoMwESPKjbBDe5uYMaX+5uxtGsvgnxhlg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sYV1ReZH+pHNqckZKSh4nfYQuqfAZgF8B94NG9XdJues2pAEKjBnjmY+P2vesb/h2
	 0XAM2XlI0AOVvR6QAeMtvvjOlg1Z873rGDtSoAuE1HcUlOQ6jDWYnGXX3LwPd59CD1
	 jxuVeIiuR/W1+vruH22srsp1n/nD34DsxtyhhU5VpOBAGL1forbsVEZuejG6YErQbC
	 uSWW0EnmHfDh9PuD5bYUdISke8+HEeNAWq015RyMEWR9gN6MxizR3tzx88u23vM47t
	 d1QLCxuneRdQ4STftwyrWbtxL2utUE3FHv4bmUZkxBmnUco5JV114cTX4ByYtPttA9
	 QguOTD5aUu+GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FD0A414F1;
	Wed,  7 Jan 2026 18:02:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 131DCA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B13F0811B1
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmcevxZ2cIej for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD9E081114
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD9E081114
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBE0380333; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:57:24 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 5bf3e72b57b480d712b2f3e153931898cf278cab
X-Git-Newrev: 99520a44856c50c18e6018446d8b9afa09dc12c6
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.DBE0380333@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libsndfile: add
 CVE trailer in patch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99520a44856c50c18e6018446d8b9afa09dc12c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3efa0091a433ed88ebc9d25630fbf8291808f0c2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch b/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
index dd9f157811..cb73d370bf 100644
--- a/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
+++ b/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
@@ -3,6 +3,7 @@ From: Arthur Taylor <art@ified.ca>
 Date: Fri, 15 Nov 2024 19:46:53 -0800
 Subject: [PATCH] src/ogg: better error checking for vorbis. Fixes #1035
 
+CVE: CVE-2024-50612
 Upstream: https://github.com/libsndfile/libsndfile/commit/4755f5bd7854611d92ad0f1295587b439f9950ba
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
