Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E82D2502E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 17:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C39CF812DD;
	Sun, 11 Jan 2026 17:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRw00GrokMrJ; Sun, 11 Jan 2026 17:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BD048125E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768152576;
	bh=WptzpxePa8Lh0mPOvRhccWUqGbrAfVC+cXxkBTHBJGk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d1/e0mptTEMJXK5Eh63qrUT4G4m3azmtJKY94c64ZjqB3oZm3r6KssXcFegJqGh3P
	 jwdRXFqHeT2UjMxu27SMRwPjT6tT2q5Wh8bGnnSUGdAHJv7yVjLy54klZMScKmjqqG
	 jHDl4623xC2OBVUOQdyK2P2b04Idt7fTa5l8L5lHqjbcIsqGohu4WNARRWVUSxOI/V
	 MnVDFFUIkAI0pmwO2PrOCgJiFHU9viMCoW4cGyFo4EUVypXzGQ0Kdt43LHoE+lW99f
	 KZSLGjxuJQ2pRUS3hfXoQGzuD2iceQY3bkkfM3fAmVdmdWoUSubNTP6Ts100g6Z2bx
	 UvMRsV2m02B/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BD048125E;
	Sun, 11 Jan 2026 17:29:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 689D51CC
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A9376085B
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMTIFhiCI3vI for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 17:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C19B60781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C19B60781
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C19B60781
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:29:33 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1385461538; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Jan 2026 17:29:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vezFq-00000006t7M-2gjh;
 Sun, 11 Jan 2026 18:29:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Preyas via buildroot <buildroot@buildroot.org>
Cc: Preyas <preyas17@zohomail.in>
In-Reply-To: <20260110155452.5532-1-preyas17@zohomail.in> (Preyas via
 buildroot's message of "Sat, 10 Jan 2026 15:54:52 +0000")
References: <20260110155452.5532-1-preyas17@zohomail.in>
Date: Sun, 11 Jan 2026 18:29:30 +0100
Message-ID: <87bjj0ys5h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KhoDn1IeLR1t7cT5/uHGNGiB/YogvIfEgEngVxy16HO9WpMh2GLwGTCUvCIwwbT46vmfF2rT3/OF7+mhC8PbKeNWyADGTKxhOdONc0pCmhOdCvWHB99nC5XInAOIIIXgVRdLQNqxrPUSAwOYO/kq2cStk+gg5PZXPYZ8D5aUek3ltKUAy2Nc0xs+qZR+pwkHcSSLjcS+FluCqe2BR44fyTkNKdo+IEgbQDWtqvw8q29hcyRdD6xcI/YcDmuIWHJt7tDe1ysFzzZ2HDp6+cec/Lo7d7g3kPy8uwupLsPB2uX/a9NKTOf0WVSWmV2rQrmxP+yi8qVTXizuy8+JweKFrw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=u8XrixEdBFfMjt3uUwK0PgPh8UgPJZoY1IdeGtim64c=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=KhoDn1Ie
Subject: Re: [Buildroot] [PATCH] docs: use https for documentation links
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

>>>>> "Preyas" == Preyas via buildroot <buildroot@buildroot.org> writes:

 > From: Preyas Sharma <preyas17@zohomail.in>
 > Switch a handful of documentation/website links from http to https.

 > Signed-off-by: Preyas Sharma <preyas17@zohomail.in>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
