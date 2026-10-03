Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE93CA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41695813C6;
	Sat,  3 Oct 2026 12:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pe53SKpzBOOB; Sat,  3 Oct 2026 12:54:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C246181366
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791032092;
	b=ld+wOKj0lHHhfuc/ujyYQ+Jby7Zcd6X56EPGIfP9Spv8v175Vt5i/SfmSF2saByXzPYx
	 l+GRq2ia4DWEsEmep5cEl5tccrB2MZ1/BtG2cVLqNamsyV0kvtCATOvyb6rtWfEM8Bq/2
	 z3ofaWxpS6CnO2esJBdSs9/Ah6llE+E+w+Kiq6V8vDT75ohhrVChrq1n3egy73yc5xPOG
	 jioL/dc6bk5PHIQt8REqCoA5znYd420tAGz1tI1AoIj7lWpk7HSpkF8PE9rmh6hNkU1Np
	 9WO2HCohswDSopnz9HRT7xMIi776telcn5Wx1DRmQEfsZ8WkeY4cDQOP7upzSySmvUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791032092;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z13cy8hMRzM4a5c1WxuzmnhzdL964jcPkv9BQ2nqx4Q=;
	b=lrAI3vDUQ8B1SI+Sr9SGPnIBjX/2E/SpFCTFBjcZ95TWILetL4InnJ+hb3EsDLptkd0Z
	 uZiGj8oMRGQZR6GXplnyKk6iUSenaoqeTrshymWCxHgLBMVU7rZlhaWAaPu2LO2Rq1TG5
	 av0dhq6IN1qvGIv+xLzdEuPpJ6VQPLc+gTEh5sA8JwhStxiCuBKolpvflE1D+7pc5r35N
	 7lw4GZCdq+chVfv1etpd55Xz1tV+n7uiDT4Ffhzxq5oJc+yf5QoSBjludTv+icXMgJont
	 b1ydNMSqjBe5+c5QGKU+ETseBO14DO4i3uvzAudxkwenJ7MmDX0nUVAo2RE/zNVijBQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791032092;
	bh=Z13cy8hMRzM4a5c1WxuzmnhzdL964jcPkv9BQ2nqx4Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TPfcSiNYWzFt3Wq1TCt/KLMaBWQlSGo/y0epwfjNgTs5yUPw8aDk2E/o1lVPPKAF0
	 oTKIgbidI0LIgS4hU4LFG/Ic25sxjP5B67uy/iZfm7l+lSzGRJwE//o3U2/9hTe+m8
	 vruQqlW5qtOzkQ/Kf9mWRjO2jtsagFY5tFarRq+U/VouyX9sjjunMOdRvaY/0Qv4c1
	 MKQimDmYNqkZ53DTPyEDzQaikYjD/IPHAmHCrWs2rny/MYjdEbrfGGIYx2mcX/k98k
	 IIb09S/N1cazAKS49jAEeNMjjJrEwF3rqfMhVmAAHjOVgb5fKUygPgiglfeXo6QrKI
	 fa+abkb2tcbdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C246181366;
	Sat,  3 Oct 2026 12:54:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6BA01A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A314E4140A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAtTq6jgPFem for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:54:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C2ECE41422
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791032091;
 b=D63qKrXUw7HrCPd8tCYDzbqSzH72hUGD31+gSoXK/oLbOusLibu25u65UBZZy9DThKcW
 eFMXXd7a2QXqvxmQzhkQSDSlB+wUPaRV3G2bu1z06L+XEjkLpUhjjNd8JhzQ2QuI/gxuU
 IcBcQg0S3yQKn0wF3vw0/LhVRdBqqtKcNRVdABFhXknAtsv31GsKEeBx8ZT4rncY+TGiV
 QeqFNr8w2fj83nmCvNKF0+gcoQ9UX81hutEgsm+cbhEL6ifUkvv9/PiWmnCeE9pRg242C
 SlV/2D/1e1v+r7/oT34Pza8aOWa4NQJBQRXDj7dCYY3eY+37+BGOh2Cn6SchXqkxEHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791032091;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Q+l91QEloiWWKenQVbNLdmCnCaKljwJBa+9Xq8UY2ds=;
 b=aWcOGT5mV6giFFHAEzqGGKxGOwQecmgSvUiSbG9SzJ37ZggJSA6CCDPIpz1xMA9ZWZzZ
 b0MGLEj6FM8mkoOCHzjqH6HAizKbxybbx/ZZRuFokkRr6sl6YZjTnG5JDZ0KbdLDijngN
 4Js3Ou5kBHvqa7i/HK4vkx9H3Om4sVRQGlXZ3CNx9jRNgydS15Rl6NmYJccwAgAOta9EU
 cxHuoANQJxG3bRT0jwzaVo4HQNxqKbhYRxKLEwl2munwBoJHOAEtBx7/eJG78dbgZnY0k
 Re63DfNK8t8sEalFz1K79YfDNr0Il/A03VO8e1fpmeKI6WMGepnwOOS5ZyLFJsEcXPg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jatweiPC; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2ECE41422
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1D95E1A10FC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E8876604FF;
 Sat,  3 Oct 2026 12:54:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 585BB10328366; 
 Sat,  3 Oct 2026 14:54:48 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:54:47 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD7FITLzstMUo0Z@windsurf>
References: <20261003084453.545653-34-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-34-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-wrapt: bump to version
 2.5.0
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

On Sat, Oct 03, 2026 at 02:44:19AM -0600, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://github.com/GrahamDumpleton/wrapt/commit/9740b74522161056058696dd3b9981886eda3be0
> 
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
