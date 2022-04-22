Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E56DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 10:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70A76408F2;
	Fri, 22 Apr 2022 10:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YaQRNcq9rSdz; Fri, 22 Apr 2022 10:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BD4640587;
	Fri, 22 Apr 2022 10:09:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2F71BF281
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 10:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D49B60F71
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 10:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBE69L7MH15M for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 10:09:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE2BA60F12
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 10:09:06 +0000 (UTC)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 49827240016;
 Fri, 22 Apr 2022 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650622141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DKNbw0Mexpbv4M1otAGQ9azvZu/H4/WRoOhWhSD/WJo=;
 b=JABaCJhASs4/owHivxlmc34H5DGT2OvzZJmNWeqnhKQtb8dpDOvFty7mTq2ld5djUxzTUJ
 G4czq9JbZJ4Sv5GfGAN4NHXa8AbbjF4O2qSZFJniKiBYtzTC+o9NeDiQxxJniOUHFw3o9e
 1ublzgTVd+IMab/UX+fk0PWs3y3AomSMtakJgGnilFaIa3BCgc9/+FX3mkaOjFHOBgyF2N
 TyQX/LtacjIYUFsmx1vYSKaFd4XnyMTaOmWMvhNAPHGaoYlfFDwlMdSVUT4l79befUf7Zb
 WTa+9UPjyktfGXbtSa42rZxrBUaMhpq4OcPIpLV5lGrAM6a0Z7ANk+yBR2ouFg==
Message-ID: <13e22a566019cfbb7f9a6de52a485dad687e1217.camel@bootlin.com>
To: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 22 Apr 2022 12:09:00 +0200
In-Reply-To: <87pmlbr70w.fsf@tarshish>
References: <20220420083923.3875405-1-thomas.perrot@bootlin.com>
 <20220420083923.3875405-2-thomas.perrot@bootlin.com>
 <87pmlbr70w.fsf@tarshish>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/imx-cst: new package
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
From: Thomas Perrot via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1579037437161679719=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1579037437161679719==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-PfWLLhantI877Px53DtV"


--=-PfWLLhantI877Px53DtV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Baruch,

On Wed, 2022-04-20 at 20:28 +0300, Baruch Siach wrote:
> Hi Thomas,
>=20
> On Wed, Apr 20 2022, Thomas Perrot via buildroot wrote:
> > This package provides i.MX Code Signing Tools uses to sign i.MX
> > bootloader
> > to enable secure boot (HABv4 and AHAB).
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
>=20
> [...]
>=20
> > diff --git a/package/imx-cst/imx-cst.mk b/package/imx-cst/imx-
> > cst.mk
> > new file mode 100644
> > index 000000000000..c91dfb602cbf
> > --- /dev/null
> > +++ b/package/imx-cst/imx-cst.mk
> > @@ -0,0 +1,49 @@
> > +##################################################################
> > ##############
> > +#
> > +# imx-cst
> > +#
> > +##################################################################
> > ##############
> > +
> > +# debian/3.3.1+dfsg-2
> > +IMX_CST_SITE =3D
> > https://gitlab.apertis.org/pkg/imx-code-signing-tool.git
> > +IMX_CST_SITE_METHOD =3D git
> > +IMX_CST_VERSION =3D e2c687a856e6670e753147aacef42d0a3c07891a
> > +IMX_CST_LICENSE =3D BSD-3-Clause
> > +IMX_CST_LICENSE_FILES =3D LICENSE.bsd3
> > +
> > +HOST_IMX_CST_DEPENDENCIES =3D host-byacc host-flex host-openssl
> > +
> > +ifneq ($(filter %64,$(HOSTARCH)),)
> > +HOST_IMX_CST_OSTYPE =3D linux64
> > +else
> > +HOST_IMX_CST_OSTYPE =3D linux32
> > +endif
>=20
> It looks like the only difference between 64 and 32 is in openssl
> build
> rule, and for x86 (host) targets only. We don't use this openssl rule
> since we build host-openssl with our own rules. So maybe we can just
> arbitrarily choose hard coded 'linux64'. It seems that
> debian/Makefile
> does that.

Thanks for your review, I=E2=80=99m submitting a v3 with the OSTYPE variabl=
e
hardcoded to linux64.

Kind regards,
Thomas

>=20
> baruch
>=20
> > +
> > +# We don't use HOST_CONFIGURE_OPTS when building cst, because we
> > need
> > +# to preserve the CFLAGS/LDFLAGS used by their Makefile.
> > +define HOST_IMX_CST_BUILD_CMDS
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(HOST_MAKE_ENV) $(MAKE) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0OSTYPE=3D$(HOST_IMX_CST_OSTYPE) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ENCRYPTION=3Dyes \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0AR=3D"$(HOSTAR)" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0CC=3D"$(HOSTCC)" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0LD=3D"$(HOSTCC)" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0OBJCOPY=3D"$(HOSTOBJCOPY)" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0RANLIB=3D"$(HOSTRANLIB)" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0EXTRACFLAGS=3D"$(HOST_CFLAGS) $(HOST_CPPFLAGS)" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0EXTRALDFLAGS=3D"$(HOST_LDFLAGS)" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0PWD=3D$(@D)/code/cst \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0-C $(@D)/code/cst \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0build
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(HOST_MAKE_ENV) $(MAKE) $(H=
OST_CONFIGURE_OPTS) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0COPTS=3D"$(HOST_CFLAGS) $(HOST_CPPFLAGS)
> > $(HOST_LDFLAGS)" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0-C $(@D)/code/hab_csf_parser
> > +endef
> > +
> > +define HOST_IMX_CST_INSTALL_CMDS
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(INSTALL) -D -m 755 $(@D)/c=
ode/cst/code/obj.linux64/cst
> > $(HOST_DIR)/bin/cst
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(INSTALL) -D -m 755
> > $(@D)/code/cst/code/obj.linux64/srktool $(HOST_DIR)/bin/srktool
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(INSTALL) -D -m 755 $(@D)/c=
ode/hab_csf_parser/csf_parser
> > $(HOST_DIR)/bin/csf_parser
> > +endef
> > +
> > +$(eval $(host-generic-package))
>=20
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-PfWLLhantI877Px53DtV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmJifrwACgkQn8ALBXH+
Cu2pCwv9FECzLRSjfvjQ9PbfrgAw0JeS/JY0n0MlK5/0kFy05SEvqSdbmXuMfvhk
jgdnHR1FITJgz9cO+QKY4xRBNUaOQCTrCUVT5IoFAkkfKHBz1lB+hTMVxdhYEmww
tW2NbWV1CH45kMuLcMmI4QlzqeQxbMJ72E4wkWpWl3rAcmVC1WBvb07l63jgGHUu
8Yud3t2Giczd+ycbwS2TncwjdyefMCQu2zJTbaBZ5VER+Snhvin2lmt0KJYQ4jV0
0WYC0neS73cKgXfODIHgOqKGOhiRwdYeWYAlh+ifMX0Ymo3idvq4dLpgNz3xJY5+
w8iy+evT6TUIbakLfqRppTGyZyPx0jdx350OCfC83ASNqHNWgrHuU0+SyOGsNK3/
XQs3e07lJ9w1jIXNCvtvv3yIBAyyZ0+UXCZdbuQ6GEBKoyazOeIbsh9kOjf0175M
J/LF6q5KhAO5rfbw7Kl1CPy3CW7inC29z5sGDIGNwdgGOpN6N4cw0/Nickqbecrk
NVPOZ4wH
=ocMS
-----END PGP SIGNATURE-----

--=-PfWLLhantI877Px53DtV--

--===============1579037437161679719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1579037437161679719==--
