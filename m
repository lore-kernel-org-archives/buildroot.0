Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8F2CA5FF0
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 660CA80C98;
	Sun,  4 Oct 2026 16:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHV7zEQtenyy; Sun,  4 Oct 2026 16:13:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3216680C9A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130397;
	b=Ga6Sia9Vw/VLXEWaHByf9qqummHTkX/VT+2gr5pKYSPRhSdXCw8zs6TV9lf8qCKF2uA5
	 KpbOBIkPR7GT4+ylNrBF61B7aJ+Gn4h9wYRRuqv78ZVFbNV72sf30BkmxIhCFcqOGQ/6h
	 I0xdYDm3KIokPDGRukq+3lK5e8JlRRkYMnYBkBPKIPK7uZonmx62Z5rNoX0clLpxVShHM
	 vuKGdEGMF8yBYtW+Iy++kTWwHzk5usYRu9FoahfCWUsGptmTSfFDBW6Gz9Y4Rj8scYvbO
	 s0bl68HNuZkbKtdjkBPEkB9tinPFQTsVPndkrtyoQjHL2H6stQkOWYyTuwOadOUXdDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130397;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=iut8EcvMOE9MCwgRMUSk2MZO+dJ2Q+ztwEKmpDkHl60=;
	b=p8jj0e21dGa+qT9T3Sk4WCILhnSXliwYDtwFiEZr1cudFUDX8D9jiJ2AybRAVEWnpmR0
	 7MJjtXlECe7xpsNJPwL6H9rquIg9JU0KEGnoUVDE/eYTdSogjs3J4rbV4BINHjAIecPay
	 7xnJSNBh8RT8HnpOgpGtGKBwnC4+Mi+5Yj9FUzc790c/saQbw7uHEVJo4Zi8v4r9adQJU
	 YneRPCtUbozSLqrB40VROEcgZ8Y386i7ToBv/Fz9pr7zfaX3sg27Ks4gYrJLOpiV6LwpG
	 nm3P6grsSfNtHkOdfYepjtJa/+c/lHKa969SlMuI+rhO9j9329aIkNJDU95p5rJH2Og==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130397;
	bh=iut8EcvMOE9MCwgRMUSk2MZO+dJ2Q+ztwEKmpDkHl60=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O0Fppm4RYBjaNJ7erMPOZhLuuBs+Qmay3yFPuS8GYrW040rlP6uEidI+t5BIzuKe8
	 aIxxzf9xqM7OelN9iv1k6G6F8TN5iH9rjaIW/W6+ojup21iKT9bLBH0jBCOzadzfAq
	 E363JShlO99/yDExg328Pap8VA82iCVOljsrtde5gksToM0R1QF2QWaqsTA/YlychX
	 lLReR9obpml4X4W5C0xsyKJkI2NKzS4UKZYG/sBxlHX0ode2WnUFHzgkI5MSZU0H92
	 a6U811tMw8Tu7UCrktNNAOAPRqZUDiIL0AjFzaYcjaCgX3ILuiwp6BGWOLrSt8i5/c
	 gsw6AhTEa/KEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3216680C9A;
	Sun,  4 Oct 2026 16:13:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27F5034E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E18640068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXjZWHlKU_SX for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:13:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4FCE040049
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130394;
 b=i8wsBHn2FrQV5nn1lxljuQ+rarOYOZLF+S/+NDtDfb9vlKYOtYL8LYivOPGmEzXAnzfg
 bMFRGnikqGE7cLgApr+GapxYpuUUabdVXFYEW/uZfHSZhs5nLRJbl647FvWNu88ZUXAYx
 LQOV66v3yu7z2iGmdGkdbPySVBfVGKHh5XY3EnicfciUz2AjyLZ339pDLL1cc1pBip7cs
 p0cSfrvwUnpKcqblzrEzW0pOnw6YR23QQ5+w6mY9WDjIxGty+h3+g1cHdhZCTxmT3FctZ
 kDweurJn2Hfr4DLejR1OciAIZAWhrr2UTz777uZsur+7nL5OjjFMtFjpsHe9sVQYs9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130394;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=rNMbjfogFx32ypNsjRXpeHMaKhLpCBgUHi/BQwADIM0=;
 b=ob8rjtwTq/xtj7chzPX/VVQm2++FcKZZhSHdcMx53yMbCAC2U5rmcQSpaz2ScjxN6bFv
 pCEyOEy3J+PtzBupZ4xcX77eNtKmRoTE2bDyS7Jm4daLrlPzBpelzeEOWZNAxT7x1WPGC
 s1uIczqguTgnZM82VA/iOvkWm34BhTww2Emf4FsHx19W7sbRYUmtcg/HA3FjBDzbDInYY
 Em5d8mOikW1tP66/5FB/UrQd7I7wo9eQTBmTFoXniSajdROCT7Py1zAqjX112mtM4++3D
 MgIRca+D9SFAO+X12ZTIH+bvjWWRHGrs94m5Op/2ZGKdVVpX0UHtzIfIE6FZGBby7Cw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b="G7CZP/SS"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=G7CZP/SS
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FCE040049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:13:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=G7CZP/SSqx7GTQCyR3K5mJYsVkQhAynpXbVBdrDTI1ErHGnZ/3IT3N6Pi3+dH/XNtNAxA/aIJKNc8TWDCPRkZMUGJ1UX7YeQtn/BgI1TWsVnUDaPENbTDscLk8sIuiTYZ+2//MWFjAGzRKhyFqSf5yfndLrHgEnrV4NIIEu6iDQ1ZtN61y2zu6OLGKs38e9/ISTTkPkcRDcUfGuOG67is+4FRc2hyHnI2Y/LdEIwzt7hRY+4eR6H+vnLd7XPL1Yxj1PeFaIZDuZi5c1m+ZCj4F6tbfX9BWWqZjMewxt+2jESfxKW//P6SrVbqnmLJXqKxRTxOZsnwxjnHpfNfEalvQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=LZ4+gvimNLXV2gAskJJhuVMpJpCg2MVkFHW510MM2gw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2065909465; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 04 Oct 2026 16:13:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xDOpm-0000000CgCs-0GFE;
 Sun, 04 Oct 2026 18:13:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261004080940.3050791-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 4 Oct 2026 10:09:40 +0200")
References: <20261004080940.3050791-1-bernd@kuhls.net>
Date: Sun, 04 Oct 2026 18:13:05 +0200
Message-ID: <87cxtpla0e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/strukturag/libheif/releases/tag/v1.23.5
 > Fixes the following CVEs:

 > (CVE numbers will be added when assigned.)

 > CVE-2026-XXXXX (GHSA-v8qw-hwjv-44hw)
 > CVE-2026-XXXXX (GHSA-qwpf-5wf7-r996)
 > CVE-2026-XXXXX (GHSA-9c75-9g8r-4728)
 > CVE-2026-XXXXX (GHSA-r7gr-2xm2-23wf)
 > CVE-2026-XXXXX (GHSA-q492-cfcm-895h)

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/188f0146e907aa08e0d9dca0bbde53c5d5cd8a97

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
