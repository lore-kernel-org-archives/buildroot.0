Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C0ACD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 13:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3EF5414CB;
	Wed,  3 Apr 2024 13:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TNJt0fKUMZD; Wed,  3 Apr 2024 13:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A28541713
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A28541713;
	Wed,  3 Apr 2024 13:24:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 908CC1BF3C5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 13:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B4DC41713
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 13:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRjegtJnAQWC for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 13:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=mwalle@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C86C9414CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C86C9414CB
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C86C9414CB
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 13:24:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7BD9F61451;
 Wed,  3 Apr 2024 13:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C82C433C7;
 Wed,  3 Apr 2024 13:24:17 +0000 (UTC)
Date: Wed, 03 Apr 2024 15:24:14 +0200
Message-Id: <D0AIR4402RGT.1B7XIPV29012@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Michael Nazzareno Trimarchi" <michael@amarulasolutions.com>
X-Mailer: aerc 0.16.0
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
 <20240330160244.3214733-7-dario.binacchi@amarulasolutions.com>
 <D0AICZ7BOW8A.2PLPZEPK1YG2E@kernel.org>
 <CAOf5uwnWwPdcLC8DRcd5qa_DGkGqXUbb8EO8CNcafi0RwNQhxg@mail.gmail.com>
In-Reply-To: <CAOf5uwnWwPdcLC8DRcd5qa_DGkGqXUbb8EO8CNcafi0RwNQhxg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1712150658;
 bh=wNSZZwtKm+XN6QjNv3XBDrl0xFHHud8Jdv6XWk9RnhE=;
 h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
 b=jq5ovu7t3ZcEOUsgk+xAfoxu45M2rp68onJXIYVZDNQopEjiu9enFUAvrvqVt6Qdc
 Dgva3cYXlyMfqwtBxsjP638ZS15ojb42GekAyMHqBJhu5+ghYgHiHbThsfyCmYvjVi
 cMjteLFaxFINsm4hiR2AhfCykiKd6lTuvxh63SU1sPj8pTK28P8ehyZAgHdFQDsoAn
 njofkX9JdJIDVG9tBLUy4K1AOaU/ITP+vPaYEkYiwsagUxsPUxXcCFFu179Gp9UPxS
 CFp7ENnzhGNMMS1du/qffJ0dZWnQYH+cWpnA/an1HIm4XJgt2HnDOFP72FDJurR7pj
 Wr6Oe5vNifEWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jq5ovu7t
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
Content-Type: multipart/mixed; boundary="===============2643781231393404890=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2643781231393404890==
Content-Type: multipart/signed;
 boundary=8e6d39811915666ef6d674335ce8264f431d4e3755ed8d9cee249cf3ec98;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--8e6d39811915666ef6d674335ce8264f431d4e3755ed8d9cee249cf3ec98
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Michael,

> > > +TI_K3_R5_LOADER_SECTYPE =3D $(call qstrip,$(BR2_PACKAGE_TI_K3_SECTYP=
E))
> > > +TI_K3_R5_LOADER_SOC =3D $(call qstrip,$(BR2_PACKAGE_TI_K3_SOC))
> > > +
> > >  define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
> > >       cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
> > > +     cd $(@D); find ./ -type f -regex "\.\/tiboot3-$(TI_K3_R5_LOADER=
_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-[^-]*..bin" -exec cp {} $(BINARIES_DIR)/ti=
boot3.bin \;
> >
> > The filename should *not* be hardcoded to look like
> > <soc>-<sectype>.bin. This is just an artifact how TI is naming their
> > files in *their* u-boot binman files. Instead this should just be a
> > Kconfig variable (maybe K3_R5_LOADER_FILENAME?) which can be set by
> > the user/board config and which defaults to "tiboot3.bin".
> > "tiboot3.bin" is the filename which is used by the ROM in filesystem
> > boot mode and for which u-boot is already creating a symlink.
> > So this will then just be another simple "cp".
> >
> > On a side node, we also found out that the "find . -regex" is rather
> > fragile in the sense that it might not copy anything at all without
> > generating an error.
> >
>
> The idea was to merge this series based on the series topic. I would
> like to remind you that
> the code in buildroot was not working and we sent a first series back
> in November that was suppose
> to fix something that was "merged" before and unfortunately broken.
> We like all the suggestions and we would of course love
> to improve the series but it would be nice to limit the series to the
> subject and not continue to add a more generalist approach.
> This is from you the first email and thank you for adding your
> contribution and welcome on board too.
> I think that we should now wait for V11

Sorry, for being that late, but I don't think it is the way to go to
introduce something "broken" (for a lack of a better wording) and
then fix it afterwards, Esp. because it means touching all the bits
and defconfigs again. IOW, this is not an improvement but rather how
to do it the correct way (in my opinion, others might disagree of
course).
Also, I'm not sure if the TI_K3_R5_LOADER_{SOC,SECTYPE} is used
elsewhere or if it can be dropped altogether.

-michael

--8e6d39811915666ef6d674335ce8264f431d4e3755ed8d9cee249cf3ec98
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZg1YfhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jmMQF/Sk6ENkvxGeifP2dxQOtrXhiwto0tN312
WlPOGggfxOf5S/2ImnRRgxxporNh2Nu7AYC7Y5RwcTIDuDgv6gAGNXjbXWvwaf5j
/SZ0VdyupdlQYnUDUsE+Y5Mypwz+2J6/MrE=
=iZ2+
-----END PGP SIGNATURE-----

--8e6d39811915666ef6d674335ce8264f431d4e3755ed8d9cee249cf3ec98--

--===============2643781231393404890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2643781231393404890==--
