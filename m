Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2846606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JU7OZApy
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3A4140602;
	Sun, 25 Oct 2026 21:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfmcLYQ5vYZE; Sun, 25 Oct 2026 21:24:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CB96240589
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792963470;
	b=Hf6CpLmJT6r37WfgwBJHQ2bUo/uh2ePaHCS6x9K0HbYtYr7KLV983TvdFnr1UUDsXYNH
	 ZsxAMQ3IKWWHBK47DRTGg6FkQ0SCCkKVqwpry/Q26Ugj5RRdRif5vn/Crh6H5C9ecc3a2
	 f5DaATlm+dVOuWiLzIwDHPCcUEkIqnl/XBsSt7XXW0Bevj0Q14/JFfB2gJfa0j3bYLW5o
	 lCRCSC8P7BYYdtwUYxTFBZ96sATigDg5oGr36MvionsJhG2XQhju/5HdxQNHPuAcmX1n0
	 Xe4rbYCQhl2I2lUIloK359uiDU2IyLenw+h3twJrwznQmMzg8c99c0KXNJT5JbRyy0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792963470;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zASsAU3V7sglL1E/Wq08UefnReObPpJlkmb81hkVfyA=;
	b=sfvqZiX1UkkJwfYF5Vu4oxQuSLHGmyh9+/O/s3IoCZqsBUa18jw4d2lRB94Ycwukogbi
	 MZtuV5izT0zkxUOib7fgDdYmfBh2N82F/cP8aOOsyHKUWdBdgIuCqbwId24+IVjbYkpHN
	 Cjfe8aUmUZe/X+ZCGlDP+xcpguFJatnFFEZBuOQ2c93kW4qPxMNVpCmR0Nub5zcUn6QKg
	 j2SaGu7sY2I1KnWf+2VRp3zIUb9ITi4hREPhLN/Ia5EO+4Bfywyj+i9JctfiCBvT61eVI
	 j1doaV3+fTZWGLc80xUmQX+BuDzVD68vH8F9EN/f2qDJNeHEqMvGw6XOCnvMwErE/fQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792963470;
	bh=zASsAU3V7sglL1E/Wq08UefnReObPpJlkmb81hkVfyA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JU7OZApyKTWM9HoDMzfJYQG9GlP+WMRpwDor+UR+Cs3MKKqRw3CmPuehQMmjGUYHw
	 XSMt5Rss8jJLQlW30v+h0OT+zoeCBNJf8FyNb97EFXpgUnpwE2V3QiP4R3n0pCOsUV
	 B3kEvqx3S00MEXPcYO5UldRIEVhEjq445oa6cthArL/D39VaCjEgMU2p+sOCTV5x3M
	 T87G9yjEx8jYRwmggmKuBr9AkQl/oF1nwLGLEQ375kiMSJEyrEz5w6GEjQlaVMo2nN
	 0z5jQOXdQ4hZ1b/6dzdDqUMMHAdp3P2XeGXHElYjwxFEs6Ymz8BNLODrZ/yoLaYQiu
	 QPJV2zvsjhnVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB96240589;
	Sun, 25 Oct 2026 21:24:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E9B2279
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8085E80ABD
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVylK9BkIMCq for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:24:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 20E2880AA6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792963468;
 b=CI0fMPWl57NOxMZ6jpyPvpY0CAMAKE4s9YqvcaHHI5K8WybHVf9BsohOMhKgpCKlNGVK
 iUWBJBiVd4ZBziWt6u2bUtGyV5v5ornROlOujBQz02iCMaG1N04fOnjGfX4ytYlzcQ7WN
 vrFy5O1WWc8sCe+62rJ7OP6q6B+oPuTzjPlYZ69AIkdCtQcAGU7Tv9I477vZEPMDBukYO
 K4U46OvfDnUOpEvyOTRP41NvIRhzZqwHRDi3jzJ64bF6X/5Z16QiJTFU8ahyt1RtS3WHb
 S77p0cNU/cZOjGEEyZYzbGMBlyrNtcIDAi9lCV4G6G2PWRcGf14jpoCXkOJB1Ys2ROA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792963468;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=EpOBP2d+hUb7GEtB/VtQd7vVRVKRPvCCSmlHgb0cluo=;
 b=YH8K3cQoGdLx8cvO20lcVROL2XJVcC3JHylg+X9y/k464lEkWU0wzddIZ4SpVP5Y8OzG
 nXGZRqgp0divgdJYI7fdKtW56qwRO6Brv2FbNHRTemGh9/knlN6FhXKW2yK7qqFitvCzJ
 tPyl42gVm0whXL5ewWedYzSuYV1qr4gn/YkJ7fH4qad8PIwfBRCQqybEaoF2Sme6FpjY/
 YdDGyWfr23ThjlXS2uyaHWtBYhs7eN9KbP21ZB4fmkD3crkmVbk1oxOg9TkPXkwywj4Tb
 9Lgmk9zUDk4nreov0S2MlwY043+F3db/iqC2/zMLwXiQ3wx4LuaT6N1S+LoDZ0v/jLQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=KSyUusOn; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20E2880AA6
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:24:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EDBCC4E41308;
 Sun, 25 Oct 2026 21:24:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BACF860740;
 Sun, 25 Oct 2026 21:24:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 515361032902C; Sun, 25 Oct 2026 22:24:23 +0100 (CET)
Date: Sun, 25 Oct 2026 22:24:22 +0100
To: =?utf-8?Q?L=C3=A9o?= DENIEUL <leo.denieul.yoshino@gmail.com>
Cc: buildroot@buildroot.org, Maxime Leroy <maxime@leroys.fr>, 
 Vladimir Oltean <olteanv@gmail.com>, Vincent Jardin <vjardin@free.fr>
Message-ID: <at5zgNxcTP1UK9rB@windsurf>
References: <cover.1792395346.git.ldenieul@iliad-free.fr>
 <8df847c25b2d0b181922e99411f64e7fa5f6e4a4.1792395346.git.ldenieul@iliad-free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8df847c25b2d0b181922e99411f64e7fa5f6e4a4.1792395346.git.ldenieul@iliad-free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v7 2/3] package/qoriq-restool: bump to
 lf-6.12.34-2.1.0
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 09:48:20AM +0200, L=E9o DENIEUL wrote:
> From: Maxime Leroy <maxime@leroys.fr>
> =

> Align with other NXP Layerscape components using the same tag.
> No code changes, just switching from commit hash to official release tag.
> =

> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
