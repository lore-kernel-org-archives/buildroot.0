Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8FDCCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 842EE4032E;
	Thu, 15 Oct 2026 20:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhcPAAUHRXvS; Thu, 15 Oct 2026 20:02:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9A27E4083C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792094561;
	b=StDR0CYmCeeVWsvQ7Nkw2BxIYDd/uE8mMHtn/1YKAnvzmzoSQziYwEPrA+VwkVvNHOei
	 HWN4uHzkdRbfm3Und/eVO71Y1L57RRO30ucDG8NwiZ/yODxZeXTf9uCqqnRW2hQUp91ml
	 qGd/0yZO9I6zmTmbH84Tf2Vx+O4vzxSek0BIumFII2QPKCaVomgDF6y5kIZXVlkXoPv6m
	 aiVAie7Uo7ZEeSuaWVcnTQUrdL/v2zvS39LYqg79W7Ay3vyb+ShJ8sg70rCy5p7ou3RfD
	 iJcKSG4nx0C5Y2csh/XYreUJrZirPKJgJFYWvitzCLPDYMMmX/k34oEHXJG2dIg+r6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792094561;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BOKIEKAi9p+jpPbBDUyevflsaeC98bvYHw4K9Eo8IOM=;
	b=OsmAynJ9QTwctl/Q0SpPLmMM+uHFJE4BhLG9gTYpmAgo6ElCJm6PibzKzSMX81N8I/xJ
	 n1oHoCazUYkMPGG9dTPcYA4t2ZFBoPxvSmJANjZrDVa+PyFYeSvRgB23ANLm4l5+poJFk
	 2Mq7nI2qGzMHIQJb+9Ns91022KZVNUG+fVq1rrOCdVI4jZ+IJKTTyJsuTPShCkthEuvle
	 74OyBcyBvBczxiW6eQjmJ+A3jGYdrPzRgKzexWYwwJoZ/0o5UR5bllL9lQN1u3qhd8J1s
	 6iADFdw92R2Mc+HryZg9G4dsPzcpJAGjHjODueUI8PaDFXf6faEUsvRAazDRHF3Dc8A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792094561;
	bh=BOKIEKAi9p+jpPbBDUyevflsaeC98bvYHw4K9Eo8IOM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bUgxIGAX0tci59q99QoNsBmNQ0lZ7bQx17LTb/qfo7JmP5n+cWCUfyqVOV45Pvc9q
	 iRB2xkGgrAwExuHR8idQAjHImw9L3swv/X3zWol3Zoc48w8PRyIhZ8uhNvP9y6jbbE
	 MJQtwVYljUcK0ZFtuLrOCarOF8W1BlEkd28ss64wShwlAdinMvsdSeKnMeadqequrS
	 WYG3VuDsIWvxFpVeOt4xM9BYHAOzDd936yYeLyfW+2085/sIQNcxA4f3FaSAY+CrQ0
	 ekm5u7Um5k85MovOBU13G45D48CIH/jpIFfCvfvx5cHS47OhezbjnObNpPFqqDngBJ
	 xYKibKNEFxlTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A27E4083C;
	Thu, 15 Oct 2026 20:02:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87AF8920
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DE92811F8
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTCXE29mWr8x for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:02:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 83577811F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792094559;
 b=DAqx+rcbEZmH5XiPVvAtHqUO3bPVwOPA5akPSNm9hEg4rU7jl3Am/8n+VLjwxcfkVnzu
 ua6Cg3+Ok9bvEXJ+F39rKP/vRqFzVxjFhR7UgEWRsi5y2bjUPImoaqXpHe1TvMxOaaqvp
 Q3vbHYG3QGYBUhCTgWZBt4zx2CYkwek7jZYBLIhvX6U0mgYqP4PWi1o+M7Z2u95oCiTuL
 nqDvhCj/ygZgFpafEgjdkP/G8Imkzm0yBSErswLw67/66X577apVs4ZLj8Q14w31wMYug
 SbXCB7pkVDjxQwsJ8GPVxtPeL35y2DGtjTO1qxb1qIIdBpItfuNyayK9QnMn4uBAWKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792094559;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=0GvnwgBWW7e0U5+odr7hfmqZArelRAjiRbJip5DsWyA=;
 b=GEl3pGKh6ZKrY2Wn5NGzRt6M5UgzLkEdxsHjQO78OBqG6VTlVdIyPR1qoYWTtiPfoFvI
 9J2Wtj7vHieyWGszdX4UVzcaS67l8XUUr1ovjRQD2VGxVkc5xwLpnUnJT7UZDBIwYAkAR
 5jvsw/jxruXrRVPc0HdzLAyvF4HIY2oi5dYnTRTh1r667wyer/V44xFCMAtVMQ+9MDcX0
 S+UuhIajLHq75yhaRVwB24F1yMikFjUZN0ed9uQKek/embhmYiMACwAjqReGFgR/nUUbv
 p6F0ICR9ftOf51Mp3n0+SYm3qgmGX+TmMJDIsrAGVRZnSdZz4JC8dtLHwQoFaVwdePw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HfQJ6e4w; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83577811F1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D7ADF1A1248
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AC1AF6075C;
 Thu, 15 Oct 2026 20:02:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 77FD110328629; 
 Thu, 15 Oct 2026 22:02:31 +0200 (CEST)
Date: Thu, 15 Oct 2026 22:02:30 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, 
	Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Message-ID: <atExUyclKlOo8pdw@windsurf>
References: <20261013215216.2460255-4-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013215216.2460255-4-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-urwid: bump to version 4.2.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 13, 2026 at 03:52:12PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

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
