Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19120606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PhxXwOhW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4CD881232;
	Fri,  6 Nov 2026 16:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dx7DgNVJ9A8a; Fri,  6 Nov 2026 16:08:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0C08081217
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981289;
	b=eGvcIaHlk/J2kFE3i9c5ul2cKlmFPUipXpwQCp7sYjC80wcXMAh3T/MsfTZCCh5M+dKl
	 kXv7lbhLxgryhTBshk7mNQ+yvm6B6AgWED2DwwuyUHXrf6Q1gw3zoq60CFLLY/ylvot86
	 gYH0xNjIKsmHvDBkH4MIduhTOHo2csCahtn7VMCBHUXZQi6CTNQ+rX35/tE2gHn5q98WL
	 MT/kRJdz8j2MFcYjfT94sHfn7gfzrrxyDmkGkqm8xP+Nx1ysorsZ3egf9QThq8RTR1of9
	 1MypzmW+0xXMttrtOiz0tK3Q49ZR00g9ssKeZ4RCcjyGMCKFHtDKmp9rglMlawp4+0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981289;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nBkp21hYrTG101psjlV+1mQhXmS5n2i7D1tP024cPeo=;
	b=lnWHx6/WbS6P7ZFVCeuccZ/iaC/tb4MAP4hzKRz+jX6+12IIr9oH5VAylDqXYtmZeh6O
	 KDHToyHUSrCvIUsaGCVeOBjj/Fp3xslzOJB20gqTEbBBIdcfXFfP+E0HuAhb8zvJssRrk
	 6fSVurDIraQ67xG65uhZYe4ROTmIT+nhqjeiFD+LWc7ZxPGo1z0L61NP9A19gQBVkT6tn
	 Z3I0Ze9PX5lIjxeDWYH9nDZwv3bVCNMI3lu3JBH5GHN4/6+/7TFqlyKhh+EVa3au5DSXH
	 dB6o0O8tELNKgiLRfFZ3Q9yvJrdOVLZZX9v7grXudM9MUVnA6M7NS6BZ4hE+yRLBOrw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981289;
	bh=nBkp21hYrTG101psjlV+1mQhXmS5n2i7D1tP024cPeo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PhxXwOhWmDexGzDl2m5cC5BczFMRhkFp9/ljvOaFkgPyhOCuv3Rz9JqPpyuAiNmm5
	 XtyPeB6O3XKWp47/ITd6LaqSD7u1vidxbzTNMlFr9tFsLs//fOPg4+dKNZrPZJQgRU
	 ejaIFLY0bWrzWdNrXDZgn8JwvkLYtuituGLv7e+e+UBC83IrQmHsw1TIIskM5iSwD+
	 tyB8dnzZ56AlWS+k/tFzumWTwwjdfF4IRyjTIFnhadj45sXfysAqaHge9BLAy5esV8
	 ptO/vxpE75fV49hOdqqBlbSDWS/ebtcRgFcUEBdpF1Ss9rlg/y2bpb3CzQCHacDXuZ
	 RPIvqw/TN5Bdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C08081217;
	Fri,  6 Nov 2026 16:08:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF7754B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E133E40911
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JckFIzWI0tyk for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4041B4090B
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4041B4090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B97389E09B; Fri,  6 Nov 2026 16:06:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Nov 2026 11:18:34 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 040df834cfabe1d6e476fb01e34efde810a17ce1
X-Git-Newrev: 878a938e098c9bcfcfbfb157072906370d982cb7
X-Patchwork-Hint: ignore
Message-Id: <20261106160633.B97389E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/iperf3: security
 bump version to 3.22
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/878a938e098c9bcfcfbfb157072906370d982cb7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/esnet/iperf/blob/3.22/RELNOTES.md

Fixes CVE-2026-101283, CVE-2026-101276, CVE-2026-102253, CVE-2026-71217.

"The iperf-3.18 release notes were updated to reflect that a code change
 in that version addresses CVE-2026-71218."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cb129a641b403cfc4c1b2ea9280b966e19837b62)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index cce50581e6..92246b6915 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.21.tar.gz.sha256
-sha256  656e4405ebd620121de7ceca3eaf43a88f79ea1b857d041a6a0b1314801acdd8  iperf-3.21.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.22.tar.gz.sha256
+sha256  1c0d0fb02c52626111d6e132db80edfbf27bbaff8bd9245df2a371dcb0b35a92  iperf-3.22.tar.gz
 # Locally computed
 sha256  6c6e9abd761ff429c11189cd93bdee5bff7e3591253bd614b253a5f4fd30cbe5  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index bff9a40865..2e9305692d 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.21
+IPERF3_VERSION = 3.22
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
