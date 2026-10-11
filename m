Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FFECA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 06:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A92F740850;
	Sun, 11 Oct 2026 06:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuEepPrmEfYd; Sun, 11 Oct 2026 06:48:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B09BD4078C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791701303;
	b=JljFR3mPpPBGrfEEoPxdyJrBTrSrxXYOkIlLCFlckWLX1E98VLBDe3LIYgr7vwBDEay5
	 rRhKN1gptuAtBXlGIxkbaOdGYG0HwqlBeOqeNXGwiO30U/X0EFXhfwMbzjO3f9CQOTc5l
	 kFfIy19TGwv5OwPxyhzYkXF/5JOaKlIhSoPbx7XW/0IxVrrBtx9+/rGDDgoeyfx8WarbS
	 FTeI6/bf30gslAER6J0upL3gdFEMDjadNo6hLC5ZnDWaspauckMcThDKjkU0B5F7f0IgR
	 yg92kw8XNJnVA/MsRV+saLkksuZxkehdntgaugO594jt+axNttRYDTWlTaxLYOyr2Hg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791701303;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=s+KSkaBT60TNnI1hDiL17aDfMBS8Q58UvO8xPAUpA2w=;
	b=mxwuifWrqfRuRfsBb6KjcaPgmIJLKe/HTnsVbA1wZ9G8KqCEJr0gAk+oi084+KgPDEb6
	 E2wpVMgy5UZfZFBFloWMuC/eb1kj1vyL+qAdAvHXjxeHKa8CT/pHDU+f4DvqDAlTQxRnP
	 XJTPNGuAHkTDpBuTAuH2p5w604miJWsHuKVAUEC44BPqJiDIzQbdPr7buerT6yDREl0o7
	 OzQkwNmef9GE+BOLkGiduXZELYXyIrmnI5dmTU3u582jBl6dCNQADMvej2FBfRn4f8Plm
	 3pc0WQw7V69ca5JC0HO3vnn1OlqPB8WupxcD2FgCRo+DrqVA1jw3HXLGzabSMtNj2RA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791701303;
	bh=s+KSkaBT60TNnI1hDiL17aDfMBS8Q58UvO8xPAUpA2w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EMKfRHW5wv5+wqb4Ck+UAFNxLDascFXvSJjY0e/SJ2XuPnBRt0msRHSosm/uVBalo
	 b8zNuJ0BsjWujtJh85ri/HHWE1TMnFDFZkaOkax2BnKkF97SDUET7Fg4dMW4Jcv24G
	 fifwipy/s5KYj+L8dOn5CV9w5tdtHg2EggiL4KD7ssgJH2fA9Dhv29w836rviueW+G
	 LGJt13X4Sn4Xhu5kbkC3ZRzouxcoXwV69gFd/OfZoFBqH4gZ4Ab8twXkEe5V1TE2dS
	 y/CEpuK2JdrAaqkiV9fETu3qOXUWIq+Uu8HMSC0E0TsMmovARsbi7ioD0XWbNsX+WU
	 3P8pm/cWAGSNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B09BD4078C;
	Sun, 11 Oct 2026 06:48:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1B8E1DE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB0A440770
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqwE4F0UVa_c for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 06:48:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8B5854078C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791701300;
 b=arlZan4heccJhTk+VVtUmSV5eIM28vBknddGoIp2kwvDVYOv/IgeeIxwBC1bJXpbrIo6
 8WqArZw+gw+aDkjeGbcLhVypzCXvf9UIwqeNH7NquHkRjN5yo7TLUSKOuPaC1xEr0bz1Z
 MhJbMjbo43klsJ16PSJ+Lf7s19Q8nKgs1nPyW5hpn8WQVYY+RLiocrVWDRGPzEf1FpTxt
 nfIooNxLgAzBKKqaqtstocMJA9yumXRNDBbNBh1Xo5qLWqfYKsZCWd6Zjj5Ns6lGBh4nT
 MZfl8wc+3Vzn875341iazftpIdbxBYDQxxNUtSOzGmClS3x0oguSy+Rl8U0vLAO65wQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791701300;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=F1NjI7yW/OZvCoB7NbEKfQObHJGDybOnymfflBjQpVY=;
 b=ei+wR7wpyPiVxesh81seU5FHgQevfozJjCO3hNPNgLM9E+TbVdv92Yll5V+/JwRXnZwd
 AXNSzFvTRvmcbOQzjB3mzSpknhfNbQuZbQPhW4e3/49bZ6IpaJA0lo8wCgiU1GS6e96b2
 uM3vAQ8/1yP2LUzUs30KE2BqHRzyBJAvYOKpJfJd3TcAGjGU2fWcUJNrNDTiK5A22hDrK
 2aUGsPvEnKDwt7QyLKs94heiwuCHgvKgsHvmfIR26+84AK6T+MJenk3mAvI1LIolDt2uL
 bTE3x2abRiWhEfPa+A4UTCdgR42P4bP0m4ywvRN6vLh55htHy2+XXu5xw7/n/p7uQ3g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=A0k0NeXb; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B5854078C
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:48:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 258214E410E6;
 Sun, 11 Oct 2026 06:48:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C8FAD605CC;
 Sun, 11 Oct 2026 06:48:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 867BE11D70B18; 
 Sun, 11 Oct 2026 08:48:11 +0200 (CEST)
Date: Sun, 11 Oct 2026 08:48:09 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, 
 "joseph@anodize.com" <joseph@anodize.com>,
 "ramin.moussavi@yacoub.de" <ramin.moussavi@yacoub.de>, 
 "thesamprice@gmail.com" <thesamprice@gmail.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "arnout@rnout.be" <arnout@rnout.be>,
 "lordrasmus@gmail.com" <lordrasmus@gmail.com>, 
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>, 
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Message-ID: <assxFoQCpRtNjAkx@windsurf>
References: <20260902040121.1583600-1-neal.frager@amd.com>
 <asqptBFqe5itH4RQ@windsurf>
 <BL1PR12MB5032C1DBCFDE52533D8A1BE2F0902@BL1PR12MB5032.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BL1PR12MB5032C1DBCFDE52533D8A1BE2F0902@BL1PR12MB5032.namprd12.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gcc: add microblaze frame
 unwinding fix to v15 and v16
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

On Sun, Oct 11, 2026 at 04:51:56AM +0000, Frager, Neal via buildroot wrote:

> > Applied to master, thanks. What about gcc 14.x? The issue didn't exist?
> 
> I believe gcc 14.x needs this patch too. I just never tested gcc 14.x.

So, will you send a patch for GCC 14.x ? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
