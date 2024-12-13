Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148DAE7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 09:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A48DA414D6;
	Fri, 13 Dec 2024 09:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G78ccB12sCad; Fri, 13 Dec 2024 09:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53435414EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53435414EA;
	Fri, 13 Dec 2024 09:35:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30EA91146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 09:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06107820E9
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 09:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUGrdxQWiBzd for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 09:35:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=mwalle@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 127E982051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 127E982051
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 127E982051
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 09:35:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D17935C6695;
 Fri, 13 Dec 2024 09:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74472C4CED0;
 Fri, 13 Dec 2024 09:35:41 +0000 (UTC)
Date: Fri, 13 Dec 2024 10:35:37 +0100
Message-Id: <D6AGYGCVAEYN.F84LYRW2DRTV@kernel.org>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Kilian Zinnecker"
 <kilian.zinnecker@mail.de>, "Damien Le Moal" <dlemoal@kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Niklas Cassel"
 <cassel@kernel.org>
To: "Niklas Cassel" <Niklas.Cassel@wdc.com>
X-Mailer: aerc 0.16.0
References: <20241213083430.4121422-1-niklas.cassel@wdc.com>
 <D6AG261DAIGT.19EZJ5IUQQ16R@kernel.org> <Z1v5werOKAXaX2iW@ryzen>
In-Reply-To: <Z1v5werOKAXaX2iW@ryzen>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1734082541;
 bh=24LMedHSktW4Sa6ZjR//MIwmHYTZh2g13Vh3hSZ3QSY=;
 h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
 b=D/31ZMFboWyDUhFHr7tsdZO1TIpPNMOyWcqJ+/WKROtBnTKpSmi8coQ5RWFWS8tuD
 NdtgsccRtO4R7JcokE4nfvmyfYkS8XkxvjDmhw7GaN+QCjO6SQeugH7diFPP6t8hKX
 Xhav9Vac3HqPHomTjMZYRSt4GlsgXqG97DMwpA9JAWm9o6CEQaCK1X4NAbgSMioDPw
 zAVYwZdFuK1Jm4W7L1OZu2CR++6CSIn30KyrH1OOH3nvA8HMb5pG0ET2kexgE1D+Oz
 QxOWP5IPxZcLbzklnuPmlqgv5hDTBVERHhmzr/0sV21h579sjgG1/toTAkI5k952Kk
 8vFiGUXQ/DUDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=D/31ZMFb
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
Content-Type: multipart/mixed; boundary="===============2188848914357782929=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2188848914357782929==
Content-Type: multipart/signed;
 boundary=f4826d94179e9c18b764e857345397274f904c77c734f8c65c365ea29117;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--f4826d94179e9c18b764e857345397274f904c77c734f8c65c365ea29117
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Niklas,

> > > -Dropped support for out-of-tree device tree overlays, as Linux 6.12 =
no
> > >  longer supports building an out-of-tree device tree by simply copyin=
g
> > >  it to the kernel source directory (without also modifying the Makefi=
le).
> >=20
> > Why is that? As it seems, it is not possible to compile it by simply
> > copying to arch/<arch>/dts (which is buildroot doing currently)
> > anymore. But copying it to arch/<arch>/dts/<vendor>/ is working.
> > Correct?
>
> I'm assuming that neither works anymore, see:
> https://lore.kernel.org/buildroot/CAFOYHZDQmMRuK76TpOSAOFPdqAb4gpw=3DLNKf=
mpu=3DsqAD1EMhFg@mail.gmail.com/T/#u
> https://lore.kernel.org/all/CAK7LNAR4h6NZ+D0BK+q4VQBeHWpjzRBQFQ9ovBrftM=
=3D6dHRcUg@mail.gmail.com/
> https://lore.kernel.org/buildroot/Z1nq_gneO4ORw3EG@curiosity/T/#t

Thanks for the pointers.

But I've just tested both compiling .dts and .dtso from within a
vendor directory and it seems to be working on next-20241213 (?).

> > In that case, we should work on getting support for that in
> > buildroot as well. Esp. buildroot is really lacking copying an
> > actual device tree into that subdir too and currently it's a PITA to
> > include a soc.dtsi for example. If you're using a device tree in
> > buildroot you'd have to use '#include "vendor/soc.dtsi"' while in
> > the kernel (as well as in yocto) you'll just use '#include
> > "soc.dtsi"'.
>
> Yes, it appears that buildroot folks have an idea that it should be possi=
ble to
> restore BR2_LINUX_KERNEL_CUSTOM_DTS_PATH in newer kernels by sed:ing the
> Makefile.
>
> However, I don't see any reason to defer this patch until then.
>
>
> Once someone has written a patch that restores BR2_LINUX_KERNEL_CUSTOM_DT=
S_PATH
> support for recent kernels, you can submit an incremental path on top of =
this
> that adds support for out-of-tree device tree overlays, if you so wish.
>
> But honestly, considering that the only buildroot configurations that mak=
e use of
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH are:
> - acmesystems_acqua_a5_256mb_defconfig (v6.6)
> - acmesystems_acqua_a5_512mb_defconfig (v6.6)
> - octavo_osd32mp1_brk_defconfig (v5.10)  =20
> - octavo_osd32mp1_red_defconfig (v5.10)
> - s6lx9_microboard_defconfig (v4.4.7)
>
> are using really old kernel versions, nothing is broken in upstream build=
root,
> so I expect that it might take quite a long time before anyone bothers to
> restore BR2_LINUX_KERNEL_CUSTOM_DTS_PATH support in newer kernels.

This is most useful for buildroot externals which you cannot grep
that easily :) Thus I'd imagine it is more common than you think.

-michael

--f4826d94179e9c18b764e857345397274f904c77c734f8c65c365ea29117
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ1v/6hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hwVgF+PLQ51N5ahq8WpQymllRMcvFJOO1N92Yv
VxKDA4ILPk3ZgmSHHgGG9MSyNlPCWx88AYCv/4JpbXJXz8B5P5H+WcaOgkBB0ksm
gtWXSFcHXCEQqaOvKwMfolCGx/51LV+xjxI=
=QWSz
-----END PGP SIGNATURE-----

--f4826d94179e9c18b764e857345397274f904c77c734f8c65c365ea29117--

--===============2188848914357782929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2188848914357782929==--
