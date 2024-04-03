Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D619CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 14:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B806E605C5;
	Wed,  3 Apr 2024 14:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ilG9BCt7tDQy; Wed,  3 Apr 2024 14:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B486860784
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B486860784;
	Wed,  3 Apr 2024 14:07:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E30B21BF426
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 14:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD01A8214D
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 14:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0UjjrOHKcZm for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 14:07:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=mwalle@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 104D9810D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 104D9810D7
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 104D9810D7
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 14:07:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A613561453;
 Wed,  3 Apr 2024 14:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01256C433C7;
 Wed,  3 Apr 2024 14:07:00 +0000 (UTC)
Date: Wed, 03 Apr 2024 16:06:57 +0200
Message-Id: <D0AJNTSE9OEA.37E2DHFDD949H@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Michael Nazzareno Trimarchi" <michael@amarulasolutions.com>
X-Mailer: aerc 0.16.0
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
 <20240330160244.3214733-7-dario.binacchi@amarulasolutions.com>
 <D0AICZ7BOW8A.2PLPZEPK1YG2E@kernel.org>
 <CAOf5uwnWwPdcLC8DRcd5qa_DGkGqXUbb8EO8CNcafi0RwNQhxg@mail.gmail.com>
 <D0AIR4402RGT.1B7XIPV29012@kernel.org>
 <CAOf5uwmQGEd6vCgNsUQvmv3pN-xmCSaAk4VVR3e-tc0xuSTbLg@mail.gmail.com>
In-Reply-To: <CAOf5uwmQGEd6vCgNsUQvmv3pN-xmCSaAk4VVR3e-tc0xuSTbLg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1712153221;
 bh=rcLOsfAvo+QzaezwUGEYlIh6Zm0TANWpA8Hdr8nDZAc=;
 h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
 b=mOT36r0B2QXtFDVWg3dSuNKavP+A+wApkntX04oncBOyzF+5hsHe4me59obSwrFKL
 /FiL4h1T/e+xowippJyPASCYtFdc5FvAgu5BG7WSzqrE0wImwcGzZRY9K0NTa9nIxD
 TcU3Z7mGkuU1QAZpDtAlbcYNwT1I0jXBszxKtqO0lYvEyh+0OBiqyrGtiwSFWOzENg
 w+QjfSLFiuk3jcs/1xKFCY7SPHz8XhQktW1hgdhj+id26royX2XRsoS3FKB5V+t083
 fLMsUD5BOx841Q9cNBL8udOVDxJ3iERzjAM83EyIrqfCS2mxmf5s4B5Upg2HEDypPO
 Iowv3JogfUCww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=mOT36r0B
Subject: Re: [Buildroot] [PATCH v10 06/12] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, heiko.thiery@gmail.com, Asaf
 Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>, James
 Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . Morin" <yann.morin.1998@free.fr>,
 bryce@redpinelabs.com, Andreas Dannenberg <dannenberg@ti.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1045577101883858484=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1045577101883858484==
Content-Type: multipart/signed;
 boundary=45e5a602fe776cf0c23a6313a6e2d76ec725709f542a4336731c76708bac;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--45e5a602fe776cf0c23a6313a6e2d76ec725709f542a4336731c76708bac
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Apr 3, 2024 at 3:49 PM CEST, Michael Nazzareno Trimarchi wrote:
> > > > > +TI_K3_R5_LOADER_SECTYPE =3D $(call qstrip,$(BR2_PACKAGE_TI_K3_SE=
CTYPE))
> > > > > +TI_K3_R5_LOADER_SOC =3D $(call qstrip,$(BR2_PACKAGE_TI_K3_SOC))
> > > > > +
> > > > >  define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
> > > > >       cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.b=
in
> > > > > +     cd $(@D); find ./ -type f -regex "\.\/tiboot3-$(TI_K3_R5_LO=
ADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-[^-]*..bin" -exec cp {} $(BINARIES_DIR=
)/tiboot3.bin \;
> > > >
> > > > The filename should *not* be hardcoded to look like
> > > > <soc>-<sectype>.bin. This is just an artifact how TI is naming thei=
r
> > > > files in *their* u-boot binman files. Instead this should just be a
> > > > Kconfig variable (maybe K3_R5_LOADER_FILENAME?) which can be set by
> > > > the user/board config and which defaults to "tiboot3.bin".
> > > > "tiboot3.bin" is the filename which is used by the ROM in filesyste=
m
> > > > boot mode and for which u-boot is already creating a symlink.
> > > > So this will then just be another simple "cp".
> > > >
> > > > On a side node, we also found out that the "find . -regex" is rathe=
r
> > > > fragile in the sense that it might not copy anything at all without
> > > > generating an error.
> > > >
> > >
> > > The idea was to merge this series based on the series topic. I would
> > > like to remind you that
> > > the code in buildroot was not working and we sent a first series back
> > > in November that was suppose
> > > to fix something that was "merged" before and unfortunately broken.
> > > We like all the suggestions and we would of course love
> > > to improve the series but it would be nice to limit the series to the
> > > subject and not continue to add a more generalist approach.
> > > This is from you the first email and thank you for adding your
> > > contribution and welcome on board too.
> > > I think that we should now wait for V11
> >
> > Sorry, for being that late, but I don't think it is the way to go to
> > introduce something "broken" (for a lack of a better wording) and
>
> I just said that your suggestion is welcome but the code we have
> already has been broken for
> months.
>
> > then fix it afterwards, Esp. because it means touching all the bits
> > and defconfigs again. IOW, this is not an improvement but rather how
> > to do it the correct way (in my opinion, others might disagree of
> > course).
>
> The proposal is not broken but it's better to say not consistent with
> newer boards/soc. Am I wrong?

I'd argue it makes wrong assumptions. The filename buildroot is
picking up here comes from the u-boot binman device tree artifact
and the author of this binman dtsi file is free to choose whatever
filename they like:
   filename =3D "tiboot3-am64x_sr2-hs-evm.bin";

Thus, buildroot should not assume that the filename has some kind of
structure. And also, the binman already generates a link to the
default tiboot3.bin.

Anyway, you have my feedback and there should be enough information
for everyone to form their own opinion on this topic.

-michael

--45e5a602fe776cf0c23a6313a6e2d76ec725709f542a4336731c76708bac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZg1ighIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hXkAF9FS0IF60hUaEv2ReNEr98k6Rf0+s0HTVA
8plagID22vX8wZA7B3X5T4eL3eO86vwpAX4gW4wPlIa6zgHpjgt9t/iyKJ3+dJd+
pUyErf3UdY/Mo/uroX5QMktL3HPZDXwPAUs=
=5dRe
-----END PGP SIGNATURE-----

--45e5a602fe776cf0c23a6313a6e2d76ec725709f542a4336731c76708bac--

--===============1045577101883858484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1045577101883858484==--
