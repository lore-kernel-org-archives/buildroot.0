Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4B7606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 08:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pp6MfCNX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC3B9405B0;
	Tue, 27 Oct 2026 08:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5ImLikctUMP; Tue, 27 Oct 2026 08:20:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0C9C64057C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793089207;
	b=IvKcLpEWT3SkCBayCMqn9MhQ1d3w61V7xyyFQogxmb2505HTVB5EzOUwMgkJdNexQPB4
	 4wkk2eP+KEN64O11FbWwaj6gPcg02kJf2X0C2PFvY0VcY7lWiexThliejf3gqvBn8Ir+r
	 MicvoVNj7CZ1pS0WU+mY/2rZsqT7c8XtnBiiqhfHrE5KkTIwaENtahtim2Wd0bboKSpuR
	 zyqyZ401+QyRpn7SkzHbYpvGKCnlpc5RZ/klVMjPcRRK97pfAMb85r81OIHRV081nMKFS
	 COC8AsCWeSj2S+NW4Hp65m0QSke/JZ/bOFBROZLxJb24P27vcVLkclqTjKO3ViwVk9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793089207;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cX1xrG9TClf1NRaYVV2TWgjLEPPMDryT4871zsda+2U=;
	b=nlCHGEdmNJWFCFkfpzDJvrKjNd4f2rCux3hPAFCsC8RgMASAv+bKYCJPgeIsLcAwWJBm
	 YQ3nvHbUdOSY3R4vq4X+IMG+j5V9lQEamX5+4lskJ7Fd6wamC9EAq1aHL0nW6zo2Ixeyt
	 LsWPG9vxnuBUZFIku8162KwiknvqRmFWgnJSssmaSaFZG7CQ2koc26o1Fdpd5HBAkN23r
	 6a/e7tmxrwBOEuCMy+NHfZl6kRboJQWsXnU1RbNgAS8tvPPUwnW20DIbHY6idBeutwCav
	 1bb4K8XpB8/ziUlecCB8mDw5X6tI72FSW5z9V7XJo7URkla+stpxs310lKvnBp/NiSA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793089207;
	bh=cX1xrG9TClf1NRaYVV2TWgjLEPPMDryT4871zsda+2U=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pp6MfCNXr/vQW8AawIkH5/N6S/PVFrBvOhqyVDubBjgK06p89xdbiIbIP761nhcA2
	 c7IeYV3zZYjrthNsJCyWLvZ/BNQeFGfZonJJxj5vmdZRqfiwKtz/U86QGOX03K6InA
	 1nQVYBvpHP5e3IZWwYUZFwdiWQ3PB8FcP2shYk4vUkS9JAsBYTD/8vj0KV7fSCJu1q
	 hWrd86e1J7C8ZH7No5jk+Fjf+NWwnsmZn39QFI7tofZxBSftpqPhzjEL2J1Vs2Atlr
	 a/66j6hRZIq+bnmEKdhBu6cgHu19YDkEoEjAz1a3C1ZDxLnjG1+2aTv2/U/F6ZQEVU
	 N+qlX8UNGZ6tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C9C64057C;
	Tue, 27 Oct 2026 08:20:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 176A7120
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0F574057C
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhw8nlvGdY3g for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 08:20:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DFE624056E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793089205;
 b=cVIhlqPerAN4+2k3kQwgbKk1BSVo4jEPfc8R/wCeHnEtFzRtbYEqc7JkRsyCc5WCkM+k
 YJkLnbigH+/lSq5Gj3VBPKuahRPJ9LZuvEl75hfsBnA4YVqBMYuoHMRvtfu2uDH6p0hN4
 5H0LjnyKFz7S0XyBlyaq+858VclF32mAh1etZbm2KOUnGjNbcQEhF14kGQL1EpNuSKSLB
 jgz7z7GcYfXMZvwRxilBOTGG4UqbG5xwwFOCf+w8LOaPLd4jhEPu1xSOWzgP5dCCZY5jq
 NBWyNtAVeFhjvHM0NUcvyl9yApo/XtuwiaLA4dcizwvJMU9uASCwXczrkuugOlqdIGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793089205;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Ke+Df6TheNSoIQc6dUHKSg6wule6/MEBTXpLK710ugI=;
 b=rO2mRbfAwwQ8UM5YNq1wpIcCOz3MVLZy9cczSLsUAREGLO9ZDMUp6xuXyxWEwAg2TAry
 iwatEsnKPqnAkr64sgdeEiz7ldaIc0Vc9PD3VA39dJr2u5n0YQpBtzHgPVhCDjIG2Amxp
 am9M9jrVWSRi7ohGmIpkPcjFJF2ubI5uF65Di1gwqmSb+o36ZFI8po/xZu1BsaIcJJ8nb
 zOB7QkU/5fGMctE43/X3cr13EOYvNgZ+6scENJQisFKMWIHBYRB2RdtzPfo4NytCNuokj
 zo+E3uXzkKvoJilnM2feVauNdSEpGmNpLDb65PLxLFf4uXj0ySA/vs1PqokSgPYzlQg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="gtCR/7Wi"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFE624056E
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:20:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6738FC79AAE;
 Tue, 27 Oct 2026 08:21:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 022E8603BD;
 Tue, 27 Oct 2026 08:20:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 790951032909B; Tue, 27 Oct 2026 09:19:59 +0100 (CET)
Date: Tue, 27 Oct 2026 09:19:58 +0100
To: Andreas Ziegler <br025@umbiko.net>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
Message-ID: <auBeTP2NwmLiaDGR@windsurf>
References: <20261024220915.2813680-1-alexander.sverdlin@gmail.com>
 <at5oC97YlhN98HHS@windsurf>
 <e34f4a3f8aaee192923e3ecdde4a287a1cfaabda.camel@gmail.com>
 <45a821b584840d1cabe6df1dfe083fb8@umbiko.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45a821b584840d1cabe6df1dfe083fb8@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] boot/syslinux: Bump to 6.04-pre2
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
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 04:54:45AM +0000, Andreas Ziegler wrote:

> Yes, there is still interest in this software, and I sadly mourn the absence
> of the don't-delete-host-syslinux patch.

Not sure to understand this one. Could you clarify? Is Alexander's
patch dropping some feature that exists today in boot/syslinux/ and
that is important for you?

In any case: thanks a lot for raising your interest in syslinux. If
both of you could add yourself in DEVELOPERS for boot/syslinux/, it
would be much appreciated.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
