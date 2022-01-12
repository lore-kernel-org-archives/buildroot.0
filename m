Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1AEC433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 16:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8E79404A3;
	Wed, 12 Jan 2022 16:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehgJh2DQF3FJ; Wed, 12 Jan 2022 16:11:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D191405D0;
	Wed, 12 Jan 2022 16:11:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0500E1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 16:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8E424294F
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 16:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTcfVv5_t2jF for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 16:11:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02AD742944
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 16:11:06 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.49.168]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MTiLj-1mvjtD1VCH-00U5SP; Wed, 12 Jan 2022 17:05:26 +0100
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <post@lespocky.de>)
 id 1n7g7e-0003zw-Jj; Wed, 12 Jan 2022 17:05:22 +0100
Date: Wed, 12 Jan 2022 17:05:13 +0100
From: Alexander Dahl <post@lespocky.de>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220112160512.GC6032@falbala.internal.home.lespocky.de>
Mail-Followup-To: Adrian Perez de Castro <aperez@igalia.com>,
 buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220112132618.2634250-1-aperez@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20220112132618.2634250-1-aperez@igalia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scan-Signature: b5c68d3dc740017cdbea82766534053c
X-Provags-ID: V03:K1:waTPecX9E0KF2VkBIWjgTtFoY7xrcifq1wUM21PuwxlvMr9tWVP
 N1Wx+nCQhGhOChNMTp8oe9znzhRStEE7FN3b0Iop1RN7czBLcvjLL6h7Y81dZg3x4AbFpad
 N8BmveqjpN8omG0/ynGpGoVl48McP5JEK6xMM9Yx/ahdt+iruABRE3ZmdrOaFHAr08IAjcX
 F7BfRiiX4nedXPkwL1n+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lCvbqNmPl4Y=:Oav6rAp/vrC5Q7GjTCRS0y
 pIvMCY62R5H3fzaddCvqXWHLxQTYltA7eKWbIf+l8WhSY4JJC8HFA2Wx5l3ubq49d9aQmglxO
 nLfhC55XV1nXGkJoNcjr4Y+Sbpuneoqeb8L6oFDSEgi6xzG895kpHLOJsVNvounSS0AfjArr1
 kdZut3zWI+kdIWq2/lHTRD48UYNJJFfRQMmu2PnQ9n/0LV2+XWz+VsAoM3b411Uvck3Y/uWo1
 7HaPvLPhxxi1MZEQQHRmSGBbvgN8/ohNF4tkVPgPf03RTjztKPBFe3pRYZvIdrB24Kgn9C+Rk
 tcUaOKRgW1jqRgmtQxfwwnC/pc/gVsdDxcFP1quibIyCUR+a+x7k82hlgjAwaGM17UC5HJpF/
 LiYVSUxWPSL4iz13R0YDk6m+U7LSsUfpoIa2sErRKhEWoiX+3/gDICkiCqauvLzD6flMH3wv5
 qi6OXN5yCX48Crqu7mcWGFSFw2QxAAdzOF/KzpR1YWQLjRy/xPzqXmR77if2AVThwTvGW/ifc
 WIWenwdW67nTKbzN7YAb1CewlfE2ibUfH0a45HMFhLlM36YQzP49+RSvaFPayH/IFJR/yKvru
 ebl1v5L/OysEZgY6k9Uy4mHjMXTZttfNvqVQopKQsF7GxNmcY9ddgunv9yqlt+eiRFdK1e+BT
 o+8qeqdxnuORcrJVfchJ9g6+StqQeCBl4s7lTjhYLmZ4Bey7DcbfoLrJ3WadYJ20msi0=
Subject: Re: [Buildroot] [PATCH RFC 0/2] Use Ninja as build tool for
 CMake-based packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4230127227479754441=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4230127227479754441==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Adrian,

On Wed, Jan 12, 2022 at 03:26:16PM +0200, Adrian Perez de Castro wrote:
> As discussed yesterday, here is a quick stab for testing and getting the
> conversation started about using Ninja for CMake-based packages (hence the
> missing documentation updates and the "RFC" tag in the subject :-D).

I miss some general motivation for switching from Makefile to Ninja
generator. Can you add some reasoning or numbers to upcoming patch set
revisions?

Thanks and greets
Alex

>=20
> In order to avoid the circular dependency of host-ninja requiring itself,
> ninja.mk gets changed to use host-generic-package with a build command
> that plainly runs the compiler on the set of sources we know are needed
> to build a minimal usable version of it under Unix-y systems. This is
> basically the list of sources that CMake would have picked (as per the
> CMakeLists.txt file) passed straight to $(HOSTCXX).
>=20
> The next change modifies pkg-cmake.mk to always pass -GNinja and removes
> the $(<PKG>_INSTALL[_STAGING,_TARGET]_OPTS) variables, because when using
> Ninja the "install/fast" targets are not generated by CMake (those are
> an internal detail of the Makefile generator, it seems). For consistency
> with the Meson package infrastructure variables $(NINJA), $(<PKG>_NINJA_E=
NV)
> and $(NINJA_OPTS) are honored by the default set of build/install command=
s.
>=20
> Now, there might be packages that break with this, and I would be
> particularly concerned about things like packages which use CMake and
> build out-of-tree kernel modules (as the kernel build infrastructure is
> all Make, and only Make!) but the changes included were enough for me
> to get Raspberry Pi images built with WebKit (both GTK and WPE ports)
> in it, which results in the following built using [host-]cmake-package:
>=20
>   - brotli
>   - cog
>   - jpeg-turbo
>   - openjpeg
>   - webkitgtk
>   - webp
>   - woff2
>   - wpewebkit
>=20
> While not a long list by any means, I think it shows a decent sample of
> packages coming from different development teams that work just fine
> switching to Ninja.
>=20
> If anybody can suggest something with a bigger number of CMake packages to
> build (or a .config file to share) I will be more than happy to give it a
> test this with these patches applied :)
>=20
> Cheers,
> -Adrian
>=20
>=20
> Adrian Perez de Castro (2):
>   package/ninja: do not require cmake
>   package/pkg-cmake.mk: use ninja instead of make
>=20
>  package/ninja/ninja.mk | 36 +++++++++++++++++++++++++++++++++++-
>  package/pkg-cmake.mk   | 24 ++++++++++++++----------
>  2 files changed, 49 insertions(+), 11 deletions(-)
>=20
> --=20
> 2.34.1
>=20
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmHe/DQACgkQNK3NAHIh
XMYUrRAAmSnr/FC0vn6x3+fxQUwUO9++OtfSy7B8d7Sg3Ks3TVgVQfvqlMMdsFcU
sQQUUjKHstx5yid9smGjCmJHFcEApE3xKivSxUW3CfFP0pc8G3ayE51YkhsleYO/
EQ5/H8O/S+pnmEMqT8QHzduNSrs34AYGdAS8fO0Em1hltREtPpF16chl3G0bJHqJ
Med9LDQHnlene0hM5V13YtR+IWbWYsOFoEnBOR1NGMeJvvu7dyL2m/fANtg9w5rr
6GvD2v/FaP+GUSAbYd4TKznbpFnba9WWkUn2BwamM478SrgvHoBSXlf5AVmWbONU
E0jX/bV71izoZ/gzkZxFk4YOY/MPQvKMcVD4XUnrORPhoTZVbzkrDyaOVBCrB93v
ZrAfislhhC9bSohkLjeVegZcKDVTp/+yFkP5Aq8+mBs9mCffGswXZUyG+226/ZgC
N/ZqL6zumtJSdu6OpgGV5A4c7RWNwK7ssUC+FRP1zsPs2K4dxe3v9Kyi5xPxHlM3
gHv6Q8hKetTyU7kIy689m+80LHcJ18X2j6YhNdH7U+DolGFtLQN9vl+fsR/cjNTE
U251MqoyznGacdOzOwU0auF7RhEKhTOQE1DEKcOnCfx18tRaM5gpIuFNHLdV+98k
sP990ntRx84jvjTWMT54JLCjfVHbfz9b3qkxmgCoLSLTC4wXkUw=
=VzyU
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--

--===============4230127227479754441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4230127227479754441==--
