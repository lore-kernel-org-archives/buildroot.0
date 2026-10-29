Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA453606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W3HeHbXP
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5875406AF;
	Thu, 29 Oct 2026 12:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TU-8bUwP55mS; Thu, 29 Oct 2026 12:19:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 38F93406D7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793276349;
	b=jeMNtNaBoM6Zo7gCWsFb2WZCRClxQeSldfTFibGh8+NcmBNb/gaTWF6J5f4Xe6Qb9cJB
	 9BdblDyH419XlShH2JoTD9RxG1lqC/EGjC1ZqJ2YZAp0cJl7K0YoJA0/wiv86l85wC4IF
	 VGVmN2R1wcy6ebwdopz8hkPAFb3qKrPfBnWgaJMtJlLlITQBs4o2uQkhGeEow3J+/Yv5y
	 QLVrpQQ7Amn61kRwkSOqqDCGUoqpegP79vYzhEYxCfzC79xEyuBQjguvkh69USA2MMd/q
	 9YnoUhnyOJRlHT6c0mXpA9RS52QYhGP0TTyvuBkVLDbUEnNJHWNWsTcaO+fevV3ZW9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793276349;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uRpYIHLq9eKyvk9zkdgjeeutX6zizsUIro6OOVq8vEM=;
	b=lBkM4WCVuB4MnIwCs3hRwf6OwHv1wm3QStl+YflPoJjee5ejXnrcREbETbyB/ArV18xV
	 lzUfRhExkEN9QevT6d0DDzfJ7PPbuL+t4N2HcoD6KIDIK+vKQ39ARYGQEY5CcEPE/uJFp
	 p4RJX3ws/ww4y4hsbndjvgt408s/ysFzVSJ7XDeBSvnpghTnaHvye/3dfomo5svp7jeRj
	 EX2YzCTIOGIH/qDRtQRk2YnlxQOPBWJAQ/okQ8ptiMrpugFgD3nd012Ch12AW/wqW7J6q
	 sMuskFFvsPOlpn+Fbp3VPX55PNDLNmZcLMYIWDvUBYulkcnY4nhzj1EtIdmTLltUz9A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793276349;
	bh=uRpYIHLq9eKyvk9zkdgjeeutX6zizsUIro6OOVq8vEM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W3HeHbXP7x5OBAf6i4Kvtl1o9jSK18NpKEY1p9upbMhjUbQ26rDcTS/DYbr1wmT2I
	 TJNoO1AlSWXx7wLB8gV07tsak+GD5gINh+9i5O9kudEwXhOxDXvKnSs7haI6/qIlPN
	 DF51XPFTwtQEWslIa/pljnNbnKKrxcyRUXajJccaRzHpqc+i+datDuQiqtRCiymEg6
	 qBf3OhKzh15HMMlNgoJauqsW/GnXOJ6fX4zPf1emQDcFt3Tg+QR7VjhlSWEUDWNbY5
	 OtCoOPpFE6muMMisgxOXlp9BDiRdrDBT20PA1pNTyycQxXNyN8dYEhzEyzNCsLRNGj
	 FvJ5TrFHQsQQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38F93406D7;
	Thu, 29 Oct 2026 12:19:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33FE4380
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 12:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25C586069F
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 12:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKSf_xQnrESk for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 12:19:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8E207606BD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793276346;
 b=stn9O4D5rBZd7HOL6voMcp97LB88zmF67DIkf8IUoSIFwTLzjjD3z3q1fDspmrvmUNrv
 u7fXkSGKmuq+ni8yl9KU+ZASFSMJG7eelEykXTVtVIOUDfGIPde1gbSOn6hB2K6xckegN
 /K450ZeMcqiz7eKn6wMu1DbNWNxjjt1exBB6lCAcXYkT0F8gXc87/uvbYKoXexPUHMzgB
 VcwSWSssdOngXHzYWyyM0UF2A3RW59HnYDg/prZhnN9dXNc/KYiMtEUl36K+OoxyM5SXH
 a9C2yo3SbXIM/4yRoCiTRib9pLMxDJ840l085XVjfy1y7mbrBKf61A4/Cu5TurTTLWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793276346;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rOzsr7pOuCbqsOnVZyo34s+zM+OaLTOx4SdlSmurUCg=;
 b=jRNbtvtu9FFpd7yGHLklF0NQJJDPPcDskj1+p6rppg0opsRO88qPU2k8GbiJD/cifYYe
 QTCOgqRlIcbI0eYK3EgfO7g4VZvSKXYVgI4/iE+J/X3xRDT9vQVwTiUTukO0EsT9vszxe
 oeUKeQt2nVqgHXsp9pkHwdFF7oAEAvJhkudJwJhCmq7xensIfn9KBwnK1RrB5ut2fN2Is
 r46XXh+XThMWTUjXCx8aepivz7E5S8jOQJSDGaBGoGRT3cmVKtE8riMLWogaol6IWv9Md
 v1ZktxzJabfD7g0wM0VzVM2puoj5DxHmxbFVXQ7SfPJxKHLs4zEzEZLTV8St2IYvBlg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=RIQr9y4x; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E207606BD
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 12:19:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6B3B24E4138B;
 Thu, 29 Oct 2026 12:19:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3F22660360;
 Thu, 29 Oct 2026 12:19:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 917CF103290B1; Thu, 29 Oct 2026 13:18:58 +0100 (CET)
Date: Thu, 29 Oct 2026 13:18:57 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <auM5okwWBVvAlvXJ@windsurf>
References: <20261027144159.1097876-1-dario.binacchi@amarulasolutions.com>
 <20261027144159.1097876-2-dario.binacchi@amarulasolutions.com>
 <auDQxqNkGAR3F3JJ@windsurf>
 <CABGWkvq6-B8ETC79RY3pXJX2SY0-FB9o7cGdgQ6MkNrGeZLT0g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvq6-B8ETC79RY3pXJX2SY0-FB9o7cGdgQ6MkNrGeZLT0g@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/drogon: fix build with LibreSSL
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 10:58:09AM +0100, Dario Binacchi wrote:

> The fix has now been merged upstream, unchanged:
> [5]https://github.com/an-tao/trantor/commit/
> a77cc3651d5950f2f8aeceab80f74f31870f4017
> 
> I sent a v2 that points to the upstream commit.

Excellent, thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
