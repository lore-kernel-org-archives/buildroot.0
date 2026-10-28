Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73E8606A31E
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 19:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PZLyH8Da
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CD854047E;
	Wed, 28 Oct 2026 19:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qY4WPjB2a17F; Wed, 28 Oct 2026 19:26:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 54754404C1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793215585;
	b=dvmRa+P6hUo+lKu18OwsH+tuIL/x7uVa8iZUfrDga0e0zXyRgvgSWX9fG6iHi3SPZyez
	 MmUPvwkq73vKvZVBypwTs9WiUCKNKwouyo33Z+td7h9nLijDaCZqR2A9dcRTGMhfzYhuL
	 2eXOZtERhgASmgot4Lv+m5mxU36vnK+5jcw0sJuYvqYF6yE7GWZ7+4Ff0s1XeZzq7EKPF
	 trIt5tc1HFjcC3mFE1ibLsEYis/qDSHyIh+9PyhgA08yGwX+TRcjAj4crMQwQG/N41A1F
	 IROYfoxsWpLF66yzMq+6+6hsTEbOVQBRwLRccZSAvGUn27CgFCNdzoO2phqMCVkgNuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793215585;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9JC9SBcT4wSt3gORkI81FNSmXAFJiaejW3g2rkM/hoA=;
	b=K18Ke99K3vAcP1ym25DT1yGONfqpUgyDPXsPGNNsQV+KVCGjkyNPJWL54mzOEuVspXFd
	 8jyQ5s39aQNL6gYRca+GtGPchTMdkUMFVqLcb/ls6ORWH6ulxeguS24YgvAV1Y2xmGsty
	 HvON8BKHG5dHSM/UEtuD3iRd9fhWH8rlvGPf/2TMKSB2NQy/0pEEIOFMzVbtnInwUCO+/
	 fylUWidogLLZtRMXYJIqu2dHtClJGvjZSU1nRfVHTTZ2lgamM3ofFXDU8fVkATixppmu3
	 Bu4L3RAx5ofq0bgQcTmdK0GKQTe0/gBmoe1qYk5B5uVmG0Rm64j/6SutoDTii6HI96Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793215585;
	bh=9JC9SBcT4wSt3gORkI81FNSmXAFJiaejW3g2rkM/hoA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PZLyH8DanRWCKQlKtQsbCd8FQRdUJEe4VTKawjwOvgmayWl/Ga2GF9pW959GMBMHs
	 YXmvmfoJSLnT7VLipCsDWM4dvOTH+mq0o4M8nr8EY0m8jKBG3qZRYLZ6NZcYQGSVDX
	 /1Ju2lXgT6F1BKXI0K1JYte7305FhSXBQ2hKV70fFhIJ5O5jzDGGZ2EGB/AKyNbNhR
	 MQx0K6naqlyll9r5Dv5VcdDzYprkk0TMUyLxNMBjOe4QYIzF4nFNy+9qUVF+Q/Pccg
	 KjD5HlzBQeJbyvrCP/thERp/dp90ln6qSr7Xu3l7zTccV9CKg4B98F5pZ9Ecm4uQvN
	 AV4SrI+OErF5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54754404C1;
	Wed, 28 Oct 2026 19:26:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6288F380
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48CDC605D2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q14aPANcH6Sy for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 19:26:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F3125605D7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793215583;
 b=VhM6LeimGko6G2uKFYVclSeXawS5ZO6RrSF1BTDlt2NgeVqCx70+RdhEfyM+chw+0QIm
 lEaRQd0EVf+MRo6KB2f5Lt58RsIh0m3KhIBp8ToGEn7LcBwLKg4eYM7OaTP9Ses1/m/3E
 zCHIwTVA0rtOsb26tbasVEeFKZ/M0jUMORCkQTo2nP8FcLfAb6gY+mktIhTtwTow8xy+5
 F+QWIoF9IcgXy7eOlp16yoff/RPtOrfFXM0ZNCpXl4SjfPxPjGXfkMAl2SoggFceD5AVe
 24gfFSweMJcL30atSJhNS/o0nQmugz6dBQ6jO8LASWjmMuht310BYgY1mrVK9F+KJog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793215583;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=7THltF42bT49Or5GOW1UavkU6BDKu1IClXixV7PLoSE=;
 b=M1Ui+m3UbODFN/s05vu5Q3MS/lL/CK78qZzZU0T+4iM3oZkhuRoGDlLweFLgq5d9GhyP
 AwzFo3xc2s3ypl2WA7hBjlwd5qB8lwV7+UR2fn9+Jvv+5brbj7BiftE8amZgP1g89UwpF
 zgGp5QUppGkuSLlYss1QyXbw3N1bFKmkpPUJKYa06/annOgcp4URdeIclG/CcpvKzwhcS
 2QETdLL1hyAHuN9x0YagYikFSEO5L5OWW1wibtxJdNRAPaA7frdUPLRPHou5mc5J+ZRqV
 wuMA5R50OaqnfDTLwMy3FTOPflavZfHhi/LSjNKRvORtsVlL7IV+Zo1AOAAEaJ/XAbA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=OcJwEnlY; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3125605D7
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:26:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 511D61A137B;
 Wed, 28 Oct 2026 19:26:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 20E8560769;
 Wed, 28 Oct 2026 19:26:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9EA12103290EE; Wed, 28 Oct 2026 20:26:12 +0100 (CET)
Date: Wed, 28 Oct 2026 20:26:12 +0100
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Gary Bisson <bisson.gary@gmail.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 Petr Vorel <petr.vorel@gmail.com>, Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, 
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Message-ID: <auJMP03q5otyiwAO@windsurf>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
 <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
 <auCcCZK-kGH25_uM@windsurf>
 <092b4771-dc93-49eb-9803-ccfcf9ccea2b@rnout.be>
 <8605bc8e-8711-4764-8262-f37a1f32adeb@broadcom.com>
 <auD5d-yrritLxAfN@windsurf>
 <ae0634ed-d834-4ff6-a239-6fdbdb180334@broadcom.com>
 <auI71Zq-3lVH7z4U@windsurf>
 <365a841b-48e5-41a1-8711-5db60f759ffa@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <365a841b-48e5-41a1-8711-5db60f759ffa@broadcom.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 00/23] Support building the Linux kernel out
 of tree with LINUX_OVERRIDE_SRCDIR
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

On Wed, Oct 28, 2026 at 11:35:56AM -0700, Florian Fainelli wrote:

> Currently it's output/source/<pkg>-<version> and it is set in Makefile in
> one location, so we can certainly change that to sources (plural).

No big preference on this, I think it's really a minor detail in the
whole story.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
