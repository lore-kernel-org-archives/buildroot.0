Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4B5C63705
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 10:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCDA54184A;
	Thu,  8 Dec 2022 10:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCDA54184A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-bgL8tfO1pW; Thu,  8 Dec 2022 10:05:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C46B04167D;
	Thu,  8 Dec 2022 10:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C46B04167D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E38731BF407
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDD20818DC
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDD20818DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DoUJuq-wmz5B for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 10:05:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E25B281865
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E25B281865
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 10:05:40 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0F7E032006F5
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 05:05:39 -0500 (EST)
Received: from imap48 ([10.202.2.98])
 by compute6.internal (MEProxy); Thu, 08 Dec 2022 05:05:40 -0500
X-ME-Sender: <xms:87aRY5DTIhqOou6jdCqb9O-_-quqSqe2FDUKRMTOde_7-VGS2_VWyQ>
 <xme:87aRY3iQnZtPXjU9Ti4cnsfnfzM7kXXa6V9q8iHT8YrBpcDGn6IdbJv0OwFWyvnYB
 y5cSzLy7uGC9mDo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdffrghnihhlohcuuegrrhhgvghnfdcuoehmrghilhesuggs
 rhhgnhdrtghhqeenucggtffrrghtthgvrhhnpeefjeekgfeuhfekffffueelueekleeife
 ffudeugeeifefgfefhheelueeifffgtdenucffohhmrghinhepsghuihhlughrohhothdr
 ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrghilhesuggsrhhgnhdrtghh
X-ME-Proxy: <xmx:87aRY0mr4gf4mUy3R0kJnCltkCNsp8YHtNqeWS5_ENlUXRKh9YFMSA>
 <xmx:87aRYzzwlXtXG_eHpHp3YBuN-O4p_AwTUnQJgEZ3RBNS10sZuG-ciw>
 <xmx:87aRY-T1QBD2vrNELZvj6OlJcu7GsvlRncl8brIcZW3FV8SMa8zCGg>
 <xmx:87aRY8DilxJVT4EbjmAMB_uF7RtDeoFXyRzjxL_gkbaN_lHB_lXiGg>
Feedback-ID: i1d444086:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7489C31A0063; Thu,  8 Dec 2022 05:05:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <540be639-0bab-41ae-b1b5-9ffa5a2895a6@app.fastmail.com>
In-Reply-To: <20221205201224.GG2855@scaer>
References: <b0cf6b84-b0ce-4c51-8ed3-54bcfd1c8ef6@app.fastmail.com>
 <20221205201224.GG2855@scaer>
Date: Thu, 08 Dec 2022 11:05:18 +0100
From: "Danilo Bargen" <mail@dbrgn.ch>
To: Buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dbrgn.ch; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1670493939; x=1670580339; bh=nU2MPMqFj9
 R36CrhbXzzUjvlk9zUoly77/0X8nwmEj4=; b=Q01jYl12hCXQrfXygFiN2usFUk
 MwZ3DdhgcJlAO0nB2ECi8mo0aUVicQrc5M7GuwHuLm8FqkcdBG6F9uBRh1SKg4K4
 MgPW72mOfFb3PUssDxaK7i2lNHIBPH86WKWrjNtlknQHRpH4ZuMQqBLDGE0qRjO3
 pAa3cSDxvCL8xsZzuwODOXTfLf34KTrjcvypNl9Ik8lW6wVJ5QGMRzq2AwXuIoR6
 nXVyl29JViCPk2q4UeMjYOX7AzvWa6Nv2Ok3oAwF6HlsEj6zDbceBJ0/cKvuSp7/
 U6uWMFAZn3CE5++jaCayBvrfNhgG/lgrxr9kOMfzlkq0fjle2fxrWrMX25Eg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670493939; x=1670580339; bh=nU2MPMqFj9R36CrhbXzzUjvlk9zU
 oly77/0X8nwmEj4=; b=dZjfWmVtHmFwyKkPaYhe3PgE3Ys5xYsHvg6D/KSAJyV9
 WArFuEH7w5ZGbCjsA6aJH2NfcfzNnLPBap+fRCjcja2GGs6O/IMPo64QtD4BmACe
 iP6XgdOgLnZLOOZ219lNkhMjb37F+5ujMKGR6+xfUQqPLs2azCCPnK8jy0E3b46o
 K42slS1a3mZt5f4tCGObRwY4ZBWhAk0DAjNYm8VBMtrtddjxSKzqMothpisQlUIC
 tIHRuQ9FIPcaD1UOvl7OPhWrJ2aAkGvRubiXY9G2Bz66rMS7foL/5cDjk6gw7Yn0
 sXrRsNT3N7PnpjlCdNEq/kRCSF8D4w4tSvNaemZbTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dbrgn.ch header.i=@dbrgn.ch
 header.a=rsa-sha256 header.s=fm3 header.b=Q01jYl12; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=dZjfWmVt
Subject: Re: [Buildroot] Excluding certain architectures for a package
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

Thanks for your reply, that helped. I submitted a patch that excludes unsupported architectures:

https://lists.buildroot.org/pipermail/buildroot/2022-December/657407.html

Best regards,
Danilo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
