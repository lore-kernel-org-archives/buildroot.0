Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD585606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LLPntiQ0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B98B608C5;
	Thu, 22 Oct 2026 11:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56iUY9b-detu; Thu, 22 Oct 2026 11:13:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 25E3260896
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792667617;
	b=RfLneodPMWaWxQuNXsU470jE58f/RETGZUWgOWcsfyU6SIQTDXFsd6GwxZKYxpEav/3I
	 AXzjYGNPTUNgcthf52D8ZrIZK90I9hQOGiI+sgTq50UwezmsL99iZMO6T5e61P5ApTqzL
	 4sj2c/j/0yYeHy0CNfNyep0wyDNkmw8MCOgTzejCFgT3JKDSU+FgYTZ7Ylq2OW5kjHfhs
	 id92YMyzDf8stjMCYgj4rDZ5MUyAqKehidzFp8xzF3BEFo1OEZ7dZnAqRYeoNnFaeXAwk
	 pMrLLIFQXljQwZTZAwpjbIrBlExcDWMamxGfxmHw4EzR2AYRPZGbiDUT0W6TC03veVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792667617;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FHjIDDMDFqHDpC+LeRuBUvnMogo7ZeDCzEpOBtx0cl0=;
	b=m5ikPRkmCvUPlcJ+bdI1ObyYY0mfV5w4WyVLcAq3Rl/GYmL0iIwvzX0uZkD1xNRgWlKX
	 ONqD4Jt5/U2z1GCqxGoNER3fjMjyRvOa0uLs1GvDFRRrFWPJ5hNv5taB3Z6UXEk6ABGQD
	 TDc9e4J1mChvGdjdEQxf7o0QpXP9eqtzWDZrFzO4+uhP9OV3iEGAH5J8usf5CYVa1VsmZ
	 aXiKdUHQ4O5xgM71Tm5jjZmUO+6C/6w3uxWbfT+CDER77v3qDqvG2Fp8SPxTA06bV9CKF
	 vTkpvSWn0+KqPuS/Dxdw262YgP+v7hbspSuQvag1faOTAFrMlA0Lno3g3aCnLQFzXnQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792667617;
	bh=FHjIDDMDFqHDpC+LeRuBUvnMogo7ZeDCzEpOBtx0cl0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LLPntiQ0FnHc22qoaZgzXD1GIG/sBOb7caFoZwd1XCBhc/wyeR+npGv5oBCinqzcs
	 Yr4EkwkpX2QcPFdQshJ2avjv70BW0vBy4fYcfaLh0tiaWZzXL7JnodO6d5buHqyusM
	 ExA+FJ48Q7Qk8fwIUEXasCVBWP7b/DX7qMp+1NgA1UjdQ87LKKNXcjhwpfv48JLtou
	 ViSDAahzxZ7ojfTUtJx4FqEb/7A+oYd6zU+PwPfb5cBHYkm8GEjKK3ezSRoVurUaYL
	 OuLMk9DsBL819DD5gAcD7/9mm6lzIK0euZYexuoJILxeVPcdD+uX4RuazXvkZERHFl
	 AyWwxLdRpdmcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25E3260896;
	Thu, 22 Oct 2026 11:13:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DD3B356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC1E6089D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:13:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrrBf5mx17xD for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 11:13:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1BE5C60884
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792667614;
 b=QQJ8HwLWM+ixDGp/rle1jVcsgx7zEyytPGEJKJV8Cl5Y4dSJtCX9iC5vPwYi8m/TgOA6
 HxqCUF5z39SKZHyKAO/X5gxewCyoor3XY6FMc9y2JieqSR8TJuItj1w9plWaZnfvh9WiX
 i9rsXl6EjKu8o8jkTc0DkQfrnHPxzhgfQyckls3YhQp7dawNn2sVJptpCTB8qb5/kStoK
 K6dgn2oSrtsr5PeskwaheLLv2aaiEyI2suPsJZ+J03Bva8JaKofiIP3L/m46qDl+Cb4sC
 lJHUwjjWWGy13C+5JhMmVvfrR+bYwRvzmDDnl2mEspQX9U/lXlzfxWZTQs9r6+ud82A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792667614;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=xlzOPGZQv6W1ZfTz6rSgWLcODK9Zb74Z9wVP5C+04RQ=;
 b=O6jTCMRoJTUqXqHnzV6RsZCxtT3TXJDDt9vgHvwxLQ1HJC0BIpqXqBShDJEFTHIquc4a
 ZFSqm9Ef0a/3VsOWFpKX7IPrNGoA4efzVJwYq6fNXdVQNwRjufiNmDtyAaCGVkczlvbUT
 J8YOTDgZB43CZNxWkUlmjZOFfk9FWIpp/3IWvMy8GoBkCf4TsTisRLNKn15Q4gFqsE+vj
 jICZhXbE8CRencgs7INd63+2/fpFrUcq6G1aDf/dMxSU97LydLVo997Fe7npwtpBDzjYU
 qn2YrTYUW4j9WNpYjTBEVyAskA52l/335bohrjkxwfu2l2VIc3KlNULD+gBu5z/VbFA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vL911UEI; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BE5C60884
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:13:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 10CF6C58472;
 Thu, 22 Oct 2026 11:14:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B2FBE60360;
 Thu, 22 Oct 2026 11:13:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AA0D710328EFA; 
 Thu, 22 Oct 2026 13:13:26 +0200 (CEST)
Date: Thu, 22 Oct 2026 13:13:25 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Message-ID: <atnvkhUXOH2UxGmj@windsurf>
References: <20260918073631.665322-1-heiko.thiery@gmail.com>
 <20260918083230.33707-1-thomas.perale@mind.be>
 <CAEyMn7Z65+MpTA7JR6kR06ewcLcV0TGd=-eCjwfwa8N-w61mUA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEyMn7Z65+MpTA7JR6kR06ewcLcV0TGd=-eCjwfwa8N-w61mUA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: add uuid as
 serialNumber
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thomas, Heiko,

On Fri, Sep 18, 2026 at 10:58:26AM +0200, Heiko Thiery wrote:

> > But i don't know if it feasible or nice to deal with from a user point of view.
> >
> > Is there a tool you are using that enforce setting this field ?
> 
> There is no tool, but our company's security office requested this
> field for their process.
> 
> >
> > Also in the commit message I would include the link to the spec:
> >
> > https://cyclonedx.org/docs/1.6/json/#serialNumber
> 
> I can submit a v2 that adds this information.

So where do we stand with this?

If the CycloneDX spec requires this UUID, I would suggest that we
include it, and people who want to compared CycloneDX files in terms
of reproducibility will have to ignore this field.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
