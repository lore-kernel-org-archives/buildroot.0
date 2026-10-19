Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE3160A2615
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qNPHexo/
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFAB1406A7;
	Mon, 19 Oct 2026 17:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qx9bh2y9nw30; Mon, 19 Oct 2026 17:46:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7AD5D40620
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792431983;
	b=LsQx/gnzWqJFl6OPBrQaVWK2ioYmkYHNiQa0JVT9PeeHZp5/yHdFNy2xgGQOgcAwjtTc
	 aKlyP/ptGVu2E+fZoATBqqe3NSsWmoxJDPb+me2tuCVX80Mc3ZpnwgunEbApSsuKa3ao7
	 3GCneVMJgjqR0dN++1KH5IOfBXUhv4C3NJ3+vJWQGdY0/10yJaQMGo8X/xHw85V6e1vgy
	 773e2VWflF2NGyrBEih//a8zJdBGwP3NXstY43oatjCEqNMpxe1yhBURaqDKIotPqJ/i8
	 szrhCMmFTokFmyv1X4plRsc4fF4tEA3wU/3OCZyk+oEFcsSViususbYpFTm1RqYh1fQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792431983;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EMnYbrnSFzvdxXU91KtZjiH8d+KXqap+8xLpsdCtu+Q=;
	b=ZkVvNhjxW0ty8WUhOk4veeZuqcZxhv3VoSQy+BhIkiXr0yqx4lQhvwg7tMA41nW48Jdn
	 lXGyB917pa73xo1yHXmd3fet1RoRhNXyk2fQAalEBwEM4ndJquICWCKjxDVv35bIWT7Cv
	 XtsOIstfL7poujsvfuZzbmfwY0699JN5P0jIgjttMka5+tX3e9IbGVmKrzjAm+IgRdkaF
	 VxEIGaTVXypLo1b6qD1KRrP2zwwivNJ5oWL8CC2qCohvRA4gMvyFVr3DJl8EiEclwyLYA
	 2dhoQxLdoWZWqht24QFN7szri3YMszcYUrGIkgY4XsggcL3tcTcWR1F7tSj8DTjyziA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792431983;
	bh=EMnYbrnSFzvdxXU91KtZjiH8d+KXqap+8xLpsdCtu+Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qNPHexo/cy+xnhJG56yzd+k99MYaCBIr8rT9dzKZ2zQkD3wkmXwXKJXRGDC1l+IXo
	 BfhkaRB+KQiSLu/rxKI72Z9jWQGP/po8MRG8uaPSbfIwRabsflEPdyjAF+daRpAaDD
	 yBvGEw/qeC+TNzryzNFyiC69gGU7O5jThrcf57jKmM6weWechhuCOiXgSWd8aRlVS4
	 Y8ASvgIKoBOC4tiUSPk+aMp2QIOr7A7Uwc1GOuNsWPBNw8TTbltQuFT84ZXv4UCt3y
	 TIDsGVkkXBN4HfQvZind/MlscWGN+f/q1ITC4vhhMcaUH6qLhooB2ACEYDQXCB1c/o
	 UL8tS2uXC18PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AD5D40620;
	Mon, 19 Oct 2026 17:46:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93625279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84A9980BE2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlhgmqC7u9l8 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:46:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BF57C80AC5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792431980;
 b=qrdl1Iin/+5CYWVKeR70Ncjw7lbyT2QLxMxonwC0YojjdR5pCirpRh/BCkg6hxImEueX
 wYtLuUMBqiF6z3u0ReieOp3Zhl4SuV5yqAklXMQQmTHjtteT9fwctKnmnnV9jwVWEY+Rm
 gz9QmKZM1LhppswFt4SWddbKqPLJMRfXLiXOUcWioQfXIlV5QKxBkpUJAKmeKiI+Lzddu
 I8nlLG8n7x7HNsf7FXsVqB0JQ9xE8jqTP9N/hjJA4d2pUHJVdZY7zj2J4zykeOvLo/hq7
 ejPzlM03AtVgw0bPHRckB5+L9rCz/YlgRbmBtKHRwFuwtnjRLRiO9upCa/q30pMIjlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792431980;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=2zMaGRUlx+5ftR5RWxTuFhcRFkHd10Jq8tgrG+Q26Bo=;
 b=szR/LN7eStnFj/Ty5Udqi6+d1D9R/TvmXeQqqvMPHLoNJjHClRAvfFp152f3XEGy/nwH
 2Z0mV6phftJUD9xtK8cFizt23TNWcuUvthE730bFtD4T6D8486WYOWevqRXotq1DoOvO1
 ZW0BhFftke88qhkm6sMrkASiqpwvJg0gDLQRuMzUJ1TSXFUGhQV2ZB8mR2aKjPlsjat8c
 tpt8PLVwaywD0+idfxuK5EDdMKr05T7OJZpb/mT9LmtAQgkrxSvanexlXdIUfbH+jELh+
 vSScx6pmhUQBtcBAyN3veD/uPHXz9f5xYErJ8N9bta1dSWjc5Y0IwUt9538G2lJs2Ug==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=uTfZkebo; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF57C80AC5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:46:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 18DFA4E41279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:46:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E0BF860582;
 Mon, 19 Oct 2026 17:46:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3427010328C5E; 
 Mon, 19 Oct 2026 19:46:11 +0200 (CEST)
Date: Mon, 19 Oct 2026 19:46:10 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atZXWibo_8lEnSYG@windsurf>
References: <20261003233231.753958-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003233231.753958-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/4] package/python-shellingham: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 03, 2026 at 05:32:28PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
