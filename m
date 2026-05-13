Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37245CD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A22341B31;
	Fri, 15 May 2026 13:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAHeecS1jyVx; Fri, 15 May 2026 13:28:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C29E41AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851734;
	bh=//Cvw9PsLZEoXpFJO179YNL8kxs3p5iK4jYGZSM2G98=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dr8AzVJO57XMKHPDCnwLpHRu0WoK6r+mvNqhV+ke+sSAoEPB1WP6Z3yk7V3/ulyCQ
	 nq84kmEU2qLQJBRDzULHMsWI4z06XYB1jZrRxuUoSKXjShAWifLG1bEkkAG08d7q0G
	 d8jEC8MuNbvM7fiRNv7cP+b964qFBs6tieIxz9rDwA9WUZtjpegmhhUkP/SV6nUOmn
	 WMX/jeDwuPayPK+onwM91OKZZtM+sHKd24MOzhtM3cboLoyLeZFkmic0R+6n/oYSXB
	 XxnVMW40X00iPG5gmGfNMy1q3FVrDG0mUYWiKXIbwK4S4Z6T2e6LX2YH0AT4EDZ6uD
	 enGFKQOKvm32w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C29E41AB9;
	Fri, 15 May 2026 13:28:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D67E36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42F7E61568
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGBhbAnqBuaQ for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE6CB61567
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE6CB61567
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D1DF86356; Fri, 15 May 2026 13:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 15:18:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e2a74be343daa9fb6c94696cee26a28e6c0543a5
X-Git-Newrev: f6c9fc252a4f6d8dddc9c639b40a49d6ba4b6a73
X-Patchwork-Hint: ignore
Message-Id: <20260515132817.0D1DF86356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: add Shubham
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f6c9fc252a4f6d8dddc9c639b40a49d6ba4b6a73
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 4569d03e2b..711c973494 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2959,6 +2959,7 @@ F:	package/wolfssl/
 
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
+F:	package/dos2unix/
 F:	package/pv/
 
 N:	Simon Dawson <spdawson@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
