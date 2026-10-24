Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5950606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VAKwe8wA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E2CC810E3;
	Sat, 24 Oct 2026 21:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMn-2dsZupyB; Sat, 24 Oct 2026 21:29:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 59794810EC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877377;
	b=b1xdlODtYp2t9DYZ309ufbMLlqXjBSTBovpCBzvvmXYSZorspU4lGr9sk2b+yxeNmc5Z
	 fEku21VlS4GNa5M32/lHvlokewULS4NMUPR/kIc86cTJ7xLhBGp9EY7SGzR5qVKFOVaSB
	 cPx1Y9ETuvXs4EsgnQJm9PTam7mqKfkWgXOdA953lPiExv4WWbxnqrsKoj2tK/zKnPERV
	 4vDnr3K5rRsFbMfg0Rn8sffM86ymROI1Y4N5oSB+ATo4E/RVBShjMhwuflrfJhJUBWjfa
	 N9Kn7iEvfx995L4WlSgTwAff4keg8FLyVJDZJOY98WRHquBKV3KlK/8fdWMwIQO6oSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877377;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vp18jXHn1VyLZAHHduPBxv+zIPk0EwDVTAd4nuigvMk=;
	b=aeb0RKgKmTPmbGqFigNm3U3T/jo2sm1LehV79ig/aei6Hzd2NxYLYLX3dH/DYcGhOEBB
	 OwUpbahm1nHFfDYPMKTCiTvyuz3i9ogwI7nGJW9X/Y6tY5Sqwh4yJaFmEz0hel54+U6h9
	 luEjmKaBuLWV2vqsal8eenVwhapJnpCdR9w5M8ZMnkkeFwLqMOnBsgtAI8/r5UOBDVQLH
	 zDklxjUAniQ6bgSriIAwjC+bgaIYacsx7Dsz2O4xxXvk+T3wMJy6J1HgJLcPVti7LwDdC
	 9LHezwl2ujNXyxrfP4/3MOZxJGdke8EYWgufxfk9A9lD6zFTcD2fKnAHKcwJcFwreEQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877377;
	bh=vp18jXHn1VyLZAHHduPBxv+zIPk0EwDVTAd4nuigvMk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VAKwe8wAD0F0EJVl917EE+TmxJsUTdZR6ufBE2zKuSgwG+seOufcHeStdNUhjvaKU
	 /4/p6E7L8Pobtpi4fRePki4PCi9Q4KvORCgQXosHz/axqZJHXiMesTFsZ7zzRvvJ4r
	 XQeqUd3guh65HtrZvXEFSqSweKAgXDe6+Ek4ULt6XhdChB9YqgXiD0A38gH8SGAvof
	 3Z5INW04aglU5UC7QxjbBf5uTosVKwEZSOLHmrLalwOcPL0+sLw8iTyiQrM9PHQS79
	 ZhSo3KQizLOaWPF7Acr3Jc4Pv66s6KZEFUnD2to3wTfwMytDsrZ0BahnhI4Cq4+o53
	 ZhoWhAh/sWxUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59794810EC;
	Sat, 24 Oct 2026 21:29:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E017D2F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D20D06061C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLWiFI1hXRaj for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:29:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E74AD60619
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877375;
 b=WFywT7DDI3xKeIllIKECjv2i1RpZR9/mlWhE23jebbToibzNr8XKbr5B/sSfbrpCI6p4
 2buWQPqREUDyBLiUTVK1Pe9H+E0Db4nImZtHeyMJsngFzJi8kqEHxnpd9niZlefHxM2wo
 K3wJFr9zSTOHmTNoWLJGVODYOfbr0ahLXQJMvGzSWklDJCq1YTnWKDsAaHy7eWfKJED7L
 s5uTPwMT8IjiQ39GeA48tNnUyNpgtymzZxZvIhUXpN6ukMHGpuc1a2XputVMr6K8kDvXI
 U1onK5G0LILIK70026UI+md6wrdkWcnU7x/EVBF+tPSHUkD+k5FyitkYx88+SEkabCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877375;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=QvbAvLUUqjdPU50fBlv90Jk2KrXU/oBdw3Yd+NMenNU=;
 b=g5jeQGYd3d8KxHhfJPUs2QRaWTEu0y3Hae8x0mJAjuCP4kO3+a8X7ZEk0sm8SqNfTmHm
 pWLjjRO27gZpgrClGcEm0vmmi0RmGSScebtIXO7XByHVkEi9KDSbm+vN94We702ofMa8P
 NgHL7pHzSYuvHnZE/yIFIKJIpKlF0dbhwMHbXZ6iUv6FSUxklrVpTCPnQXI38qYUo8YCE
 LfqCXzW8HScIAbZZkkR9vR0QyfbmUdk9nAv9tyJAw2nHt0r1jyiST8atLrqU7mzIFQvah
 oFV0RK2FTbdfynz2GuusXSvOyRRKv2ZzNVyp8VMKYJEF5sNrURL8q7zmYssVcXhPBDA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UQkpf3Dd; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E74AD60619
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:29:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8412B1A1320
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:29:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4F84960769;
 Sat, 24 Oct 2026 21:29:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 03F0C10328DD2; 
 Sat, 24 Oct 2026 23:29:30 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:29:30 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Meena Murthy <meena.murthy@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <at0jJBq7FyrLSsHr@windsurf>
References: <20261024151043.1971569-1-fiona.klute@gmx.de>
 <20261024151043.1971569-2-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024151043.1971569-2-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] configs/engicam_px30_core_defconfig:
 require pkg_resources for binman
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

On Sat, Oct 24, 2026 at 05:10:43PM +0200, Fiona Klute via buildroot wrote:
> The defconfig uses U-Boot 2025.04, so binman fails without
> pkg_resources. Also update the kernel to the latest release of the
> 6.12 series.

Thanks for the patch. However, I don't think we should do the Linux
kernel version bump in the same patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
