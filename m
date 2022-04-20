Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1874C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 08:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AF1142504;
	Wed, 20 Apr 2022 08:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p40voD4xPXBP; Wed, 20 Apr 2022 08:39:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B41A42506;
	Wed, 20 Apr 2022 08:39:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C502C1BF319
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 08:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0DF860B1D
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 08:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V0NgFCHleZKp for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 08:39:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24DE560AAD
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 08:39:21 +0000 (UTC)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E9EB7C000F;
 Wed, 20 Apr 2022 08:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650443957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bP+ztVzTXJKS1lFv97x6Fp14zLJ2q5lQbiS2g+vGJ68=;
 b=cn3zRJ5NVoLgnzbarAd5Z9y2FP7lXtOo7K4ETeaN0/tA70JgOXNSvKGShNSz2L2FIhd+Jx
 owqijJkgt/PXiAuOL/krblUbugPLSWGKv1FA2zwabQZ38NPQTG8ZyLgmSBHn0mD7kn9OmW
 3sbjnX+q6Ucelf1CrMJMPblYm+aLGgCJog7WKvZxy3vubzV4G3SBiJoT8MTwAsjx+b4180
 QwDTmYT2S5tO5ZSf3slpObgSEy2VCbL9MrzYFIgmOYxZGh5/xhyvaZyZ3xebcTQeOzbwQU
 r3eJ5TI3gVZxxT21SLT6qbATku2V3h36eADY+kDDlG5mBMEABTN4liqHvwfhqA==
Message-ID: <aa8ded3d92323550b31ac24dd2ad283d13307a0e.camel@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Apr 2022 10:39:16 +0200
In-Reply-To: <20220419142635.008ac004@windsurf>
References: <20220419092151.91638-1-thomas.perrot@bootlin.com>
 <20220419092151.91638-3-thomas.perrot@bootlin.com>
 <20220419142635.008ac004@windsurf>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/imx-cst: add new package
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5112392564265823643=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5112392564265823643==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-CEcTArhAaVkPdTyjutIO"


--=-CEcTArhAaVkPdTyjutIO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Tue, 2022-04-19 at 14:26 +0200, Thomas Petazzoni via buildroot
wrote:
> Hello Thomas,
>=20
> On Tue, 19 Apr 2022 11:21:51 +0200
> Thomas Perrot <thomas.perrot@bootlin.com> wrote:
>=20
> > =C2=A0N:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Thomas Perrot <thomas.perrot@boot=
lin.com>
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0package/byacc
> > +F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0package/imx-cst
>=20
> Trailing slash needed.
>=20
> > diff --git a/package/imx-cst/Config.in.host b/package/imx-
> > cst/Config.in.host
> > new file mode 100644
> > index 000000000000..84cb825e59cf
> > --- /dev/null
> > +++ b/package/imx-cst/Config.in.host
> > @@ -0,0 +1,8 @@
> > +config BR2_PACKAGE_HOST_IMX_CST
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "host imx-cst"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I.MX code signing too=
l provides software code signing
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 support designed that=
 integrate the HABv4 and AHAB
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 library.
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > https://www.nxp.com/webapp/sps/download/license.jsp?colCode=3DIMX_CST_T=
OOL
>=20
> When I go to this page, I need to agree to a "SOFTWARE LICENSE
> AGREEMENT i.MX CODE SIGNING TOOL", but then your .mk is pointing to a
> non-NXP Git repository, and you state the license is BSD-3-Clause.
>=20
> > +# debian/3.3.1+dfsg-2
> > +IMX_CST_SITE =3D
> > https://gitlab.apertis.org/pkg/imx-code-signing-tool.git
>=20
> What is this location? Just someone who put the NXP code online? Or a
> separate implementation?

NXP code has been put by Debian maintainers.

>=20
> > +IMX_CST_SITE_METHOD =3D git
> > +IMX_CST_VERSION =3D e2c687a856e6670e753147aacef42d0a3c07891a
> > +IMX_CST_LICENSE =3D BSD-3-Clause
> > +IMX_CST_LICENSE_FILES =3D LICENSE.bsd3
>=20
> There are two other license files in this Git repo, the hidapi
> license
> and the OpenSSL license. You are confident they are not relevant?
> Would
> be worth explaining that.

I think it is correct because from source the file
"Software_Content_Register_CST.txt" indicates that the outgoing license
is BSD-3-Clause, and Debian also use this BSD license.

Kind regards,
Thomas Perrot

>=20
> > +HOST_IMX_CST_DEPENDENCIES =3D host-byacc host-flex host-openssl
> > +
> > +define HOST_IMX_CST_BUILD_CMDS
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(HOST_MAKE_ENV) $(MAKE) $(H=
OST_CONFIGURE_OPTS) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0OSTYPE=3Dlinux64 \
>=20
> Would be useful to explain why linux64 is fine even on 32-bit host
> platforms. Actually, when I look at
> https://gitlab.apertis.org/pkg/imx-code-signing-tool/-/blob/apertis/v2023=
dev2/code/cst/code/obj.linux64/Makefile
> I believe that using OSTYPE=3Dlinux64 on 32-bit host machines will not
> work, as it adds -m64 to the compiler flags.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ENCRYPTION=3Dyes \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0COPTIONS=3D"$(HOST_CFLAGS) $(HOST_CPPFLAGS)" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0LDFLAGS=3D"$(HOST_LDFLAGS) -lcrypto" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0PWD=3D$(@D)/code/cst \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0CC=3D"$(CC) -I../../code/common/hdr \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-I../.=
./code/back_end/hdr \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-I../.=
./code/srktool/hdr \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-I../.=
./code/front_end/hdr \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-I../.=
./code/convlb/hdr" \
>=20
> This looks strange. Flags are normally passed using CFLAGS, and $(CC)
> in Buildroot doesn't exist, it's $(HOSTCC) that should be used.
>=20
> Also, I think the list of header paths is properly set with:
>=20
> CINCLUDES :=3D $(SUBSYS:%=3D-I$(CST_CODE_PATH)/%/hdr)
>=20
> but it gets overridden by the fact that you override CFLAGS.
>=20
> I believe there's a better way, let me have a look.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0LD=3D$(CC) \
>=20
> $(CC) doesn't exist, it should be $(HOSTCC).
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0-C $(@D)/code/cst \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0build
>=20
> Best regards,
>=20
> Thomas

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-CEcTArhAaVkPdTyjutIO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmJfxrQACgkQn8ALBXH+
Cu3EJQv/ZznbiuNFAmvDQEFZ1d5e6CR9BeJgyDFo3p8JZHwTXrpq945Ct8JDGZx3
Cz3ywLEzqVcPfmSjy0loqwuXQ+pROPm/jwavlJtTkbjzHfQTLFebTcLuj1sfzdGp
orgkoT6dZ3Jl9W9JsuEQvF+bgJ72T793w5HWNKif43Lf6ktMMGzkozmHCu+H7Noz
xzhzs3645E4p7UKgZotMVLKQZH+Gqwx4B37aRAfsMBeGo9sjfgsix8nO0y6q6OFZ
SJK1nHTeNIYjk8PSTgcTYl3vna+64q8nDI7TUk415eKIqPkmtjxaL2fkmtQdnN3I
uQTPyeF+2XTaNothtlB3nvbT/8+To0vV8oaGXSNCBnY9LYTvKJJ6QUL8LWvmvlYa
oZlHheWmabhU2ylGMoLIGSp1Exr6poR/LVKobkHBCoqc5DiCmjvU7VqAlTuobg4V
EwMDn97dOzPjPbumyfv71iyPu8TT8YDZzwV8UqS4idG8ct+C9ShpislfRjMaoFK1
WJQAcfSQ
=hlcN
-----END PGP SIGNATURE-----

--=-CEcTArhAaVkPdTyjutIO--

--===============5112392564265823643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5112392564265823643==--
