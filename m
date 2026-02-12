Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D23EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A225684550;
	Fri, 13 Feb 2026 19:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2-7Klb58pD5; Fri, 13 Feb 2026 19:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF7E08462F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011375;
	bh=yvn7i3iD3TmgDLqw1E/s38ffCE7a/ry7BHpJumqW/nw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YgrvbbI3fCdS7ZEaYjAWFFA2Tr0aRPiuoZqlPp9kzRnnL2TZKbTi4hIUvRIeuwftN
	 dRNv+fBMqANaXSG5DkGMQSKWaqxPqslpMfd6dL20THrNGiNi2+L0ufHxd3dREfnJxT
	 etw0CrDt/gfFg3WqjI5gJgoq/CFgQ1bgk+fyQT1eL+7ft3yxsxDnwDcni7ZzS7djCl
	 rXaPc98904WNFLnfpK9dhSPLReitN5DKhc4iTCVKanRAOMv2U4dva3vaFBufeyPjsY
	 OJ9jNCl7u2HQvx4yB6BEB4Tq/Ff4vofCIFplidVLxBOCA0ElE7mG4GKsvftIfpVxOR
	 exNDa4eGCV+cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF7E08462F;
	Fri, 13 Feb 2026 19:36:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EAF369
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21E9441E3B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjPAQRHN5Glf for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E76241E41
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E76241E41
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93C9B8268D; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:01:46 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c4f6278bb897cc2b0568f52dcc0576da71663a43
X-Git-Newrev: f64ce221a5e4b502f8fd29a233b07e72ec98944c
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.93C9B8268D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bitcoin: drop
 dependencies on Boost Libraries
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f64ce221a5e4b502f8fd29a233b07e72ec98944c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The dependencies on Boost.System, Boost.Filesystem were removed in
v23.0 [0][1] and Boost.Thread in v21.99 [2].

This was never reflected in the Buildroot package so do it now.

[0] https://github.com/bitcoin/bitcoin/commit/07269321f38e46e9e02f16d7cd135ea90692638d
[1] https://github.com/bitcoin/bitcoin/commit/b87f9c5edf3895df9650131fcf8551c3ad1d7301
[2] https://github.com/bitcoin/bitcoin/commit/06e1d7d81d5a56d136c6fc88f09a2b0654a164f9

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9171d2982b72f93b973bce6887bd87a91f5c3e1a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bitcoin/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index 8a36ab4f86..6adda97adc 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -20,9 +20,6 @@ config BR2_PACKAGE_BITCOIN
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  Bitcoin Core is an open source project which maintains and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
