Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FEB606D809
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q8IH1Ux7
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3E6D408F0;
	Wed,  4 Nov 2026 21:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wIjZKgL8pUF; Wed,  4 Nov 2026 21:06:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 267E940930
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826410;
	b=QowHxcOiRLT+RIZKG1CmTgS1iVQ0UHxoYu/6lHqjblGsT241H7Acsc/pXkgAVKNVny4h
	 1uqDoaT0iG8fPcEksKzy0n54UxlqIzV97oU160YlAShKTmX/c2repK4huF/vRQpg1L8Ul
	 XH3rzH4uqlzPXevV8X8vdeuuC+/VfukP5lpaVm8B7eBn2PlUu0dCXZPJDE7ouCS1O0kSB
	 5NevM7ZbQhvC1aPQjRaaWDnyX5Mzq1agjtgPoo+Ld/qSw3ymdjr+7K3PpTq3yWM7z4rJd
	 CYvjAHQsyu2JPxP4gPf+0oLvWFIjTEnj4eH/4ivIY0Qg/ltiKxJpZbLdUN7Ly1mBlWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826410;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5BkMVzCE1Zn9juXmuiJizNUWJkAG4qPqyrLx7Q7HEC8=;
	b=fFOXSnmVn5iUrnuvDR6HvxgNM77lXskl+QEmO6tCTipTekiWRLq8rKANDTiQ3Kgo5Rs+
	 I2oeLf2Pl/lbkcyGadJe1RYJi+cE/blvEQVPrr8xpcNdNULAzmTy+ftUtfZEOAuz2eSAA
	 OCT6CBdK+jw8IMBu+LDwbEnQhRNxLaifcdFJwCZPK5T5MBTCflj1ecrvN2aD/wjzgzEAJ
	 jf6K4rOnjt7Pw7mA7O0Ocqw3+rKvklO9iguz+jyL2WUVicUUYaTGG4EX+YMF/Er4cOz/c
	 OHJa/oo7h8BP+xDRXUmdeyNathZOOvcqW6RdO9x38omhn1ZaqoFtenzvuBFjfEhvwlw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826410;
	bh=5BkMVzCE1Zn9juXmuiJizNUWJkAG4qPqyrLx7Q7HEC8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q8IH1Ux7CNA4V0fD3uIg1r+NYu3igaDoVPCra/T1IHDOdq76VFH6gn919tqKtXxFV
	 aRwtpW6AKlfdPSiOcbBBxqeMCYraa7uFTeIZNnHjIFELa3A0eAr/YQB8m+6p2hPWVr
	 zWeBHvFNR4sn/CzAONju3gL7j0vCUeZx7M3h2Frzi5aFGF6nX5ENvw73WQnzIXNPlP
	 xahpPIhZS7WQvETdKHTZvgqYVRzD5VhYJtiEWnvvfN1rHpbz69IfldFUJnFyfUFXop
	 kQzEKj+Kl0c4D0wiouEiNTep1ToQ5oTVIyBxvswLkALooj+/7luwwk+o9+aKQdTyJD
	 Mh0qlloXmyxMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 267E940930;
	Wed,  4 Nov 2026 21:06:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFA9DB00
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 910B8408AC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXDI2q9SMUA0 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EF31D408AB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF31D408AB
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 233C79DE7B; Wed,  4 Nov 2026 21:05:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:06:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48053a2861fbd03da67022769d7decd03072d380
X-Git-Newrev: 9fead9bc6853081f90554b8c4fe6516606d442a2
X-Patchwork-Hint: ignore
Message-Id: <20261104210504.233C79DE7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Angelo Compagnucci for the
 website
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9fead9bc6853081f90554b8c4fe6516606d442a2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

I reworked the website with Bootstrap 5 and I'm going to follow its
maintenance as well.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8f7552407e..7ce992a683 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -225,6 +225,7 @@ N:	Angelo Compagnucci <angelo.compagnucci@gmail.com>
 F:	board/sipeed/lichee_rv/
 F:	board/sipeed/lichee_rv_dock/
 F:	configs/sipeed_lichee_rv*
+F:	docs/website/
 F:	package/apparmor/
 F:	package/corkscrew/
 F:	package/cups/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
