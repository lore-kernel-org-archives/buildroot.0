Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51938CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 168D540F4F;
	Fri,  5 Jun 2026 12:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBIkC2mOuMCJ; Fri,  5 Jun 2026 12:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 468A940FAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663111;
	bh=8T55bWI48NjwvRIrQRWiD+0QOnOJwVI6nv7M+PvdXxw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oKp9+Wns3ZZIKl/CpJ4D4Ujx9vi++ZvFe66O8tRxZab9qJukOxnhw4SZy7lac6ROp
	 FRyek9H6ucw/DWI/XNfMnKWRMDcdO+N9fNtKxRtCJXx16fdQEUXvEem1G95oQ+SCGL
	 EqeZ/VvPmQdVzktZ//WEqCB2y48KfwGQZEvHOExQVQVxrDufIEyCG7P67gCJmdWBiv
	 u48le4ZJDswA7mb3d2GrIWjbI1qRqlY1ciL6pfd21e4Zpa0DDQeZsBYvja+ELNmcfm
	 O75Ay2yK5X2b2z9kpk8xUligIOVNmfaWSuAgql5Z8CR8p4rVL8knUmubdjOTxuH0FR
	 kke7BPkOt2DrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 468A940FAE;
	Fri,  5 Jun 2026 12:38:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D98FF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DDA481E8B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ko3R0AaDwLbL for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF18881E7D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF18881E7D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2549A87B40; Fri,  5 Jun 2026 12:37:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:48:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 331413c84e4ab295e85e0a07dd60ea2aa3fa6863
X-Git-Newrev: caea40bbabba0026ea00e0329cc78e1af7ce42f0
X-Patchwork-Hint: ignore
Message-Id: <20260605123712.2549A87B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: add entry for
 Shubham Chakraborty (unrar)
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/caea40bbabba0026ea00e0329cc78e1af7ce42f0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 232f8b5ca7aee3af04632df6616aa6919bd36d0e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 908b3b1a3b..77bafdc337 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2937,6 +2937,7 @@ F:	package/ccache/
 F:	package/dos2unix/
 F:	package/htop/
 F:	package/pv/
+F:	package/unrar/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
