Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0EC606A326
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gE4VWogB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82A5260752;
	Tue, 27 Oct 2026 20:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TrDON8Uk8rNN; Tue, 27 Oct 2026 20:16:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 88961606CB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793132175;
	b=akgrmmOTojkWf6fpTwdqVMcXpecYI0Q6XLdZqoC7jGQP36HfHunoPsvqCbGRwcpQribN
	 hueus4MM1N9iPN5D58slAOwn0fSCNZBLHeLMmyK/KEpyKlA/s8J7FxLOE5ZFkCYiGSb3/
	 jd5FZl6as7JEm4WIJVAV25vTLp/MhDNVDK/KSQBytAFIpi78y9Pq2LfY156/9AwTBYDth
	 sYy6WwyTrIwn2Q33TFP6/bZ1nv8p0ctdk+iLBN0RDC3di68y3vey/CJh9D9wggFSca/Sa
	 e0mOsm7mP3H6j/AmiAsn0t48jA5QQWPxUvcrqhdUBQvwtORC/s/CJVNrEcqp1yqMU6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793132175;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=obs9b6YB2vOKx4fJHcmz+f65VoUicAltjVr6jVE450A=;
	b=RiWNS93Rhn+oZYpQb4nLQVepdF9bgBIWaqOyW9A3pY6M3BR6a0KNxJniZLz5VMNYZiu6
	 Nm1n983hGJgmjGjL//EW63m6jujCpw3rXVNkj+pI7fThgZah3D+hKJ8pIwGOGxEotRNDC
	 Bag1t5FsRyidwdECyktQmbNP/dkudylivYk+BbU61sVOqIGWOQj6wkI9gQkiKRKWO/wGL
	 bu86kVtYFOXSRgSNSzlqlMINFlwmf+m/fbdM5J1UXJrC6n74r7/fl3JxJlefxBM32m5I/
	 Ie/9wg9QayuNbAi0QJnczmLU/ciXqs6IFyxwYI4rDkUYO51xyFIaWSRBwt7/R1JuUrw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793132175;
	bh=obs9b6YB2vOKx4fJHcmz+f65VoUicAltjVr6jVE450A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gE4VWogBUK41U5fejkM3pW10I1pHl0RN2CKU6avUSRk78oh7O4kpS3Yqew03FQgWR
	 LgrPi59Q+Dy4fSkMr3BTmd/GOknKAXMG5w29IBys16J4jVQGUkyE7sJQArv3F6V1hE
	 bKxQrHPnQj0m7OrGFmzo4ZqBB+qq6UygdoxiWSLGtChekC4cVIf16rntTD0fDzuBWp
	 VzH4ts+mb2jed1XLXK1+vhbNaRteQkgTZz7PCtPXN2ktulRQtuJwNukLOwg1+0/5Ka
	 gkMcfa9IWgHB7jpSji7KTGB0F0G9ZLn0XEscuXBSSC2xNLxlL14bP18XIzLDnBfK2I
	 HiCMhLYQ8C79A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88961606CB;
	Tue, 27 Oct 2026 20:16:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AD05529
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0AF460681
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bsrat_FripAw for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:16:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B020F60653
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793132172;
 b=Vjj9Vg707lTev8HfFSlo+gOc7uR31QoCsgxLEummRcOOkUDb73toR/EkdfHvvWgsNtAf
 uFgzT4w0exE5BejGJiNxxxRUxvrpUfsB2UArXe1TMg53ij0br7YBe+ssjBkKma/4RCDhX
 ULSBC47ZrE3HM80o0OpkiyMltEMBun1QVhv+RI3CVCMGF1fli19HPtdxIIzalBw3L4IT0
 yyQI4I8TcxJY7bhY0hRxkbnzZeGA0vrxRnF2LD335vHlNbyjSQTaJmK6MYas+oPVkW7ju
 5Xag1xvA6aPEEwym2xwIeZQYn8OcYgROAGzg/KwCDSfe8Hx6RV2QX8c2KAZScizPYQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793132172;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=QXa3n/sXdciCLcGP1VH+vLP6mSuLpr6aBKYTORZMdr8=;
 b=LgDaZ6NGLMfByoGK35V/+owIbYTCgUOlUmhvH+gMtS/UPgjoHfTLqIiLMP25royvE/sA
 eTEg23HTxfsbzTbyg6iAT+ojPGJ+DD+Mn+3726wkn0qTBLmLzbyImOpmVP1FoEiGyY9xa
 BqI0fRBcutP4xJ/vvP6esDrkibdp8JgWqR0Tjse+oH6nOQj9U4KeXX3PCFftzd5FXpK1J
 4gO8C2WCMwVsn2/6saqkBc3rfqoL/8sXMrfO1aR9E5UucVCjoyP5GqqBdfWxZ4llMEt4q
 FAawCq0MlqBoNQ1mzLISAxe//ER2VTsKXjWIzam0VpcX7EXU1gaBbTKAortRf3lEIMA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="Ji/r1FoG"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B020F60653
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:16:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 496B51A1369;
 Tue, 27 Oct 2026 20:16:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1DE0C603BD;
 Tue, 27 Oct 2026 20:16:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CF23010328A20; Tue, 27 Oct 2026 21:15:59 +0100 (CET)
Date: Tue, 27 Oct 2026 21:15:58 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auEGewEhSV7cl733@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-10-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-10-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 10/14]
 board/mender/x86_64/post-image-efi.sh: do not prepend artifact name to
 mender image
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

On Tue, Oct 27, 2026 at 05:40:07PM +0100, Adam Duskett wrote:
> Do not prepend ${COMPATIBLE_TYPES} to the user-specified artifact
> name. Especially since compatible types can be added multiple times
> to mender-artifact.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

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
