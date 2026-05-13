Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2447CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DC6A41B75;
	Fri, 15 May 2026 13:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzZ0RuVVBlpF; Fri, 15 May 2026 13:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE3E241B8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851829;
	bh=IeIUyG9Bb3PQFNPva0IETXVs4ekbOf58JkLWDtU0aXo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mGosqDjY5xZFIZS2X2Amlgr5TE3eViEoSA+7MGLfrGf9HGHn9Bs/ECgaKhbwVedQj
	 u1KMegbU3Tg/4WmZ8sMu8pGZkMoiuAMlbvlrsnRn7nsQeJBeEx07xH/tAxBNIm1g1L
	 0VEacINwpFAbYDT+PvmqbEZKM39BAGUpvXwbPZ++9tTCuhby6BID+AC0TTl3uhnxsL
	 BbVpQAHYwyUf0jRKias+MqmEIot0DaF98zrr4bG4setdaYVrKirhUOsdawbXpSAEeE
	 vmd6b0qGgdGJUyEz3KuPZZuCq839sOQ/QSYXsQxndrl4k0wSyY20I0YBcMQE8TfPos
	 jENuAS6183B2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE3E241B8D;
	Fri, 15 May 2026 13:30:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E37F36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 481BA41B35
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEw8qFZHpNw3 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6E9040DD1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6E9040DD1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36D9086354; Fri, 15 May 2026 13:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 14:53:22 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 9dbdc05a97660768375bf11d7d96f53260ac78f7
X-Git-Newrev: 4ed87fcf74d7c3c503b9c72b93711824d4d4ce68
X-Patchwork-Hint: ignore
Message-Id: <20260515132949.36D9086354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] DEVELOPERS: add Shubham
 Chakraborty as dos2unix maintainer
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ed87fcf74d7c3c503b9c72b93711824d4d4ce68
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Add entry for package/dos2unix/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Julien: reword commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9f3097bcf69166e6341806537a09ff4414840b61)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 91768e68b1..0772c958ad 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3036,6 +3036,7 @@ F:	package/wolfssl/
 
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
+F:	package/dos2unix/
 F:	package/pv/
 
 N:	Simon Dawson <spdawson@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
