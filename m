Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A45E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 10:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC15960809;
	Fri, 13 Dec 2024 10:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRR6nkYSEY-v; Fri, 13 Dec 2024 10:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7CCD60814
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7CCD60814;
	Fri, 13 Dec 2024 10:03:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA19E75
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 10:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E7F760814
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 10:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FOEAQ-ZxcbD6 for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 10:03:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=mwalle@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7BCE60809
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7BCE60809
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7BCE60809
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 10:03:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F9445C6937;
 Fri, 13 Dec 2024 10:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C25C4CED0;
 Fri, 13 Dec 2024 10:03:43 +0000 (UTC)
Date: Fri, 13 Dec 2024 11:03:40 +0100
Message-Id: <D6AHJX8GO6HT.3K4SPRXLX14U4@kernel.org>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Kilian Zinnecker"
 <kilian.zinnecker@mail.de>, "Damien Le Moal" <dlemoal@kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Niklas Cassel"
 <cassel@kernel.org>
To: "Niklas Cassel" <Niklas.Cassel@wdc.com>
X-Mailer: aerc 0.16.0
References: <20241213083430.4121422-1-niklas.cassel@wdc.com>
 <D6AG261DAIGT.19EZJ5IUQQ16R@kernel.org> <Z1v5werOKAXaX2iW@ryzen>
 <D6AGYGCVAEYN.F84LYRW2DRTV@kernel.org> <Z1wC0zRgrhS0jl52@ryzen>
In-Reply-To: <Z1wC0zRgrhS0jl52@ryzen>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1734084224;
 bh=RWfwUKE8QgPv4k6B0Cs5uSryIMGaElV2tO5lvEMtj4o=;
 h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
 b=eF5Hdmnn85wN7Q4rfTmHade913Hi4Km0G99M48X5M4GA9oINfRQ7H2Ul9ospNBB86
 xZY5sNk+Ev+mFgP4npAy6wXApbG3+L0YsX3xjNtSaN8/KnOipAdrVmKeDxtRoMzXvl
 FEBiD2VogjQIaRIAJiR8uL251nrU1SjPLsQXWrh5Xi+jnAPrdEXmpFcxSwrS8ytPFn
 xLgdK8FIjSzNnAo3effD7Y8WpXW2kJeAULNhr1fGgXtcXTSNs+sJJmngmo2BTeIYEW
 l+iHwaGb/L2n0Dex1X28tuwppRTTsA1bUk7PLG7eSBXvmxFvJ/cjPU5/kfKg0qnX6D
 EFxzdeJwUb1DQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eF5Hdmnn
Subject: Re: [Buildroot] [PATCH v3 1/2] linux: add support for device tree
 overlays
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8150265125143645237=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8150265125143645237==
Content-Type: multipart/signed;
 boundary=11990468e83b5343393d49e358b9a7677e41efaccc4a0ad6a239b434bb92;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--11990468e83b5343393d49e358b9a7677e41efaccc4a0ad6a239b434bb92
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Niklas,

> > But I've just tested both compiling .dts and .dtso from within a
> > vendor directory and it seems to be working on next-20241213 (?).
>
> If you say that copying to arch/<arch>/dts/<vendor>/ is still working, th=
en
> most likely it is only copying to arch/<arch>/dts that is no longer worki=
ng.

Copying it to dts/ was wrong for arch's which had a subdir structure
anyway.

>
> I still think that this patch can be merged as is.
>
> Once the BR2_LINUX_KERNEL_CUSTOM_DTS_PATH mess has been sorted, someone c=
ould
> add support for out-of-tree device tree overlays, if anyone wants/needs t=
hat.

Well, that was actually the intention of my patch :)

> Adding support for in-tree device tree overlays now, does not make life h=
arder
> for anyone if they want to add support for out-of-tree device tree overla=
ys in
> the future.

Agreed.

-michael

--11990468e83b5343393d49e358b9a7677e41efaccc4a0ad6a239b434bb92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ1wGfBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jzbwGA+BkDRe6wfyOc3qSY9xzriB2nRZigcuHj
+mjdYPN5bgg0cmzNCXMcmPk1kifFI3zXAX90MnT05CH+aKMWyAt+Fl/U84jzwcny
VpupeDPrTWsePiiEz/ZRQdHiv9336bY3LqI=
=a3yL
-----END PGP SIGNATURE-----

--11990468e83b5343393d49e358b9a7677e41efaccc4a0ad6a239b434bb92--

--===============8150265125143645237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8150265125143645237==--
