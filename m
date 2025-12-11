Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E48ED43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 617F740B59;
	Thu, 11 Dec 2025 19:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjyrfcQ0OxmZ; Thu, 11 Dec 2025 19:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85972410C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481287;
	bh=2nd+ESULsT3IIvnj9BeUVRfBk8B0MGOU8tMaU3sY2+Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WqkdgXhEn7dvTXmxCCicaHOKlcmLYCJr+UtDxP71/wlm9D0t3wvn97GMJI1qDY6jC
	 3q488RYaQL0tZk+5w7U6SRZvSBQPg3kRoJcJR7Y4+Rzgix9lN9tDuLpf8FQNkSMusZ
	 6dJ6aNbYIYSGtl3xFH4CdLXRgYtORovApTsBctoz5szzU5PhTvwWQVbL3z3GuB4yo4
	 E9l7xeMTd9Q9BQxAtlnuYls97KI0EHXeRRkyMHtv0vRrUYMnOgXMBLS9N2a+mPTOxM
	 Mr2PmhfcAyTYtNMl7yx50UejqVO9QgXnUv00U1LgCzmSD+q6reRhvLyQNSg/Hnn3fK
	 uQ9OK0aPCZWzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85972410C6;
	Thu, 11 Dec 2025 19:28:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EFC12C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC3854008E
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_s8twGZ5yoR for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0E924007B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0E924007B
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3F1686B49; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:21:56 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5dd6a33d6796e0cda2498e476de7d1e5f82808a4
X-Git-Newrev: 46a80aa07a56e369d6a7fd7bc7666eae9aa70e88
X-Patchwork-Hint: ignore
Message-Id: <20251211192746.D3F1686B49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: remove Prabhu
 Sannachi, bouncing e-mail
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

commit: https://git.buildroot.net/buildroot/commit/?id=46a80aa07a56e369d6a7fd7bc7666eae9aa70e88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Prabhu's e-mail address at Collins is bouncing, so let's drop this stale
entry:

<prabhu.sannachi@collins.com>: host
    mxb-00105402.gslb.gpphosted.com[67.231.147.145] said: 550 5.1.1 User
    Unknown (in reply to RCPT TO command)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4d61edf6b1b5b23f285f30f67a2d67695b153909)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f3c58a127d..303280ed69 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2705,9 +2705,6 @@ F:	package/libdvbpsi/
 F:	package/mraa/
 F:	package/synergy/
 
-N:	Prabhu Sannachi <prabhu.sannachi@collins.com>
-F:	package/redis-plus-plus/
-
 N:	Qais Yousef <qais.yousef@arm.com>
 F:	package/bpftrace/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
