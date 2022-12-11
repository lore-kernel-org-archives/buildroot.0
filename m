Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C6FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 18:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D89ED60BBC;
	Sun, 11 Dec 2022 18:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D89ED60BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ufGOu7EwQb6e; Sun, 11 Dec 2022 18:53:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2360860BD4;
	Sun, 11 Dec 2022 18:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2360860BD4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 001FE1BF5F5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 18:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1EC44030C
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 18:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1EC44030C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04YF8V-cJajG for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 18:53:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF5D340305
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF5D340305
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 18:53:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id B5C8E3200312
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:53:19 -0500 (EST)
Received: from imap48 ([10.202.2.98])
 by compute6.internal (MEProxy); Sun, 11 Dec 2022 13:53:19 -0500
X-ME-Sender: <xms:HieWYw2ihb0DF5tC2QXUWdaQcM5K5Lvg0nGyRJG_W_18noHVfp9-RA>
 <xme:HieWY7HJb7MkHz1F58cHC_G3f2_BQ0C5pBSqZyH5r1mdIC5ko9qgppXdAI2Ok2II8
 NpU5UOz-Sk09vx3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeigdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedfffgrnhhilhhouceurghrghgvnhdfuceomhgrihhlsegu
 sghrghhnrdgthheqnecuggftrfgrthhtvghrnhepjeeiudeiffeuhfevjeetuddvueejue
 ehffehieefvdeuveffhfejffefhfdtjedtnecuffhomhgrihhnpehhthhtphhsrdgrnhdp
 ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepmhgrihhlsegusghrghhnrdgthh
X-ME-Proxy: <xmx:HieWY44-WjojB2bvxwPtrI9bOCmyMyD0ukWD32aGASz_6m2GD159FA>
 <xmx:HieWY52iawDOuLkPhM8lzGOkLhN2lBEbvDuNSKqE7mW8Z14WWKKXyg>
 <xmx:HieWYzEP7SxSPk9wgf4pjV_zUuV7GtqoEOLFtI8a4vL6My89Tlxxuw>
 <xmx:HyeWYzG6pvHGnsXpGq_V8ximQi3TajFHtEK76uEX3Bga1thOnwrvwg>
Feedback-ID: i1d444086:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8554331A0063; Sun, 11 Dec 2022 13:53:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <86c5154e-e6a1-4f01-86d4-d43b60c603ac@app.fastmail.com>
In-Reply-To: <20221211171735.GV1044805@scaer>
References: <20221208110247.7002c3ca@c3po> <20221208141647.0ca26b3c@windsurf>
 <b8157c6b-cf89-4d3d-bafc-fba182f8cf5a@app.fastmail.com>
 <20221211171735.GV1044805@scaer>
Date: Sun, 11 Dec 2022 19:52:58 +0100
From: "Danilo Bargen" <mail@dbrgn.ch>
To: Buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dbrgn.ch; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1670784799; x=1670871199; bh=A3t+VvvtwM
 2mcnPc7qQ7CCnzl/FH0LMkk918bnu+jcc=; b=zKKicJs0AvPqX1VJ7qL6slo1Xa
 BfFLhW1zeXyS309LGQaB5/hnf4ZAPGhkQu3L1fpj+Cl34YbDNX3NjuJRZaCXgf/k
 NiPm197zDt5MAco4iZ7+NznVfCWDD5UtwbJLCVxOu+UeZelxPVsRIyS4DQy168CM
 9UqFiUSqD+zxd3VONLhucIWrSolcXlsKPDMJsvUMfSUUCKSK/MVBEqh9/3fobooI
 dHho42fyzN6UL36bE4iQjQI9BsS2rLBfRlJddGLeQYn1P3QRZsJxmu7RyjiabMyP
 FarChimFsWWFUPR53SvV+CuyEpnYAnAQZLMK5HMewOx4+72GE+p6VJ3hqidQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670784799; x=1670871199; bh=A3t+VvvtwM2mcnPc7qQ7CCnzl/FH
 0LMkk918bnu+jcc=; b=jwLC5Lf51RRSEhdhKY+LerFM3tQjHhm1kgzXaMn70Ydo
 Iybz6Kyl56iYGrQjNP1jBmkmHkzYcJBoqf+ziwlqiz9fSjPOwLRmu5VBnAcLLCim
 j5B6rE9pHuDvUwq1QljWE3wbf2OM3WD/zy9CFMhw620vdQxhhhVarP5IVSpUj9W0
 XRRz1xfIdL3H/BXQeqU4jPzmm8lsAgp9H/MsPo3YndZMAOV5ScWNcAoexktmxwUd
 aY8PLCrWI8Vt4hA4KiLPVD+2HLPJhvaj6kj1gS9LMW17TjHhwtvX3uTJgroPoRXX
 SYu1q7S6WNUrbBuOGRmTkn7hTdrtdRj6OZ2kzxre2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dbrgn.ch header.i=@dbrgn.ch
 header.a=rsa-sha256 header.s=fm3 header.b=zKKicJs0; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=jwLC5Lf5
Subject: Re: [Buildroot] [PATCH 1/1] package/tealdeer: exclude unsupported
 targets
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Hello Yann

Thanks for adapting and merging the patch!

> I think what Thomas meant, was that it is a pity that we need a TLS
> implementation just to read the equivalent of man-pages, which by virtue
> of being local oalways work, and that that TLS implementation has
> limitations on architectures, which man-pages do not...

Yes, I understand that :) The only reason is that the current tldr pages are fetched from the domain "tldr.sh" via HTTPS. An alternative to this would be to add a build flag to Tealdeer to not require/support network connectivity at all, and to bundle all current tldr pages with the buildroot package. This way, no network connectivity and no TLS would be needed. This feature was requested by a user a few years ago, and I already implemented it, but never got feedback on the implementation and nobody ever requested that feature again. So in the interest of keeping the codebase simple, I never merged the branch.

Anyways, I brought back a build flag to allow linking against OpenSSL instead: https://github.com/dbrgn/tealdeer/pull/303 Initially I had quite some trouble getting it to find OpenSSL, until I discovered that I need to add a dependency on host-pkgconf. Once the next release is out, I can submit a patch to build against OpenSSL instead of Rustls.

Cheers,
Danilo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
