Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF156C43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 10:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58AA083E20;
	Wed, 15 Jun 2022 10:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5dL9zD6FP2n; Wed, 15 Jun 2022 10:47:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5336683E12;
	Wed, 15 Jun 2022 10:47:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B68061BF5A8
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 10:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A21FA83E12
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 10:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKGjTXKVvE9y for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 10:47:18 +0000 (UTC)
X-Greylist: delayed 00:05:13 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 114B483A47
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 10:47:17 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.41.38]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N9doJ-1ng7v50CiT-015ai6; Wed, 15 Jun 2022 12:42:02 +0200
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <post@lespocky.de>)
 id 1o1QTC-0008VN-25; Wed, 15 Jun 2022 12:41:59 +0200
Date: Wed, 15 Jun 2022 12:41:52 +0200
From: Alexander Dahl <post@lespocky.de>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20220615104152.GD12610@falbala.internal.home.lespocky.de>
Mail-Followup-To: Michael Nosthoff <buildroot@heine.tech>,
 buildroot@buildroot.org, Samuel Martin <s.martin49@gmail.com>
References: <20220608081605.1141488-1-buildroot@heine.tech>
MIME-Version: 1.0
In-Reply-To: <20220608081605.1141488-1-buildroot@heine.tech>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scan-Signature: 064f474b8d4e20554a8c27c9e010a453
X-Provags-ID: V03:K1:R8QQ7i5FLbA8QRzXyJ6oGXIC8tuo9jkcSgSKPN6XPg9WCqyAshg
 J5swMz7rOtk27z0Vb/WWkKqmerTeyLm8flPn5uDlnXQy9DcT509MxGgurYtcR6sMPL7zai2
 BwfebaQADI1RK12fyE2dlajQ3B33ujPLNg544CLZQVh2tq3yXfUF2aRv5jKRTJZXHa+KDB9
 SaiU/1bsa6QYBuZi5W2nw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mh71jat/ZEo=:inNqJpe3reR7hFxBHtS9Od
 II01EBLWcFvI/3bvRX9SwwJLTIBhwEv0Cl/teBBW53TP26YXTLTOsY8/Jk8HLkyD30SbVElzx
 inDnxsSLrjbl/axlTtzKzrezLMFt1dYjxVrDVTFeiY7gRvaGTWg+kc6yKK5AWH8+pa3boWZDo
 j/uSO8aVj+y0b6SDweePD/k4XhKeZB/pG9T6alJlWs8eUeFsYN8bXffseMN+C4JCSBI9LdUNV
 ewRAMnhbZ07Wz9f6TS7MynFLkwZ+I5ySZdpGBR9El2yAYMlFb7FZ4FJiQ6Ogm950D2y+iwV9Z
 jkjisuvWc24VcsYGiaE4QktRqh+DddHfahTtTKn5KKvXQFRWsnK1Yjrf/XtlDeShyo7zvXvzi
 UfGnpcJvZULmJ6IDNwDAYyE7tzB3rNlEgw36zARS5Y+2RyeG94nxKIzNnfD30+/5OLXQ4ljMj
 ak1pEgT3LSoP42s/06LNQwyxDUVRNWQFgx1gqZlEe4+0/8O9XjiucS+1i9vLn/sRo5PvUK3yU
 GqCSmjv/VCcX+hFtuEgxopR/PW4XVScj4F8/5oRmUv5CtHplFzWc6A0ktjfSty6mnr6xaZMzh
 aojrFWMDJH8eeEiPmbBgisQraPSkWvMw9osWvqsrtqdQA335gwzYMvzAlL6Yc8qSTJl12asA/
 f4OKUI8wn313DD98LPtTgg6b79Wby7x0TTBO7BVtg+dKLHfB6MYHmaCTSLny+iL2/DglAaZ5D
 pDRTIkjzofzaEKMEqV0VCSlJqlI4m1nIePdrAA==
Subject: Re: [Buildroot] [PATCH] package/catch2: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6588799866505044294=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6588799866505044294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Michael,

On Wed, Jun 08, 2022 at 10:16:02AM +0200, Michael Nosthoff via buildroot wr=
ote:
> Catch2 is a modern C++ unit testing framework which is
> increasing in popularity.
> This package is staging only and allows to build tests
> to be run on the target.
>=20
> Further it can also be built as host package (similar to
> gtest)
>=20
> - https://github.com/catchorg/Catch2
>=20
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in          |  1 +
>  package/catch2/Config.in   | 28 ++++++++++++++++++++++++++++
>  package/catch2/catch2.hash |  3 +++
>  package/catch2/catch2.mk   | 19 +++++++++++++++++++
>  5 files changed, 52 insertions(+)
>  create mode 100644 package/catch2/Config.in
>  create mode 100644 package/catch2/catch2.hash
>  create mode 100644 package/catch2/catch2.mk
>=20
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 86755bfe18..211e876e16 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2027,6 +2027,7 @@ F:	package/gnuplot/
>  F:	package/sdl2/
> =20
>  N:	Michael Nosthoff <buildroot@heine.tech>
> +F:	package/catch2/
>  F:	package/grpc/
>  F:	package/gtest/
>  F:	package/libabseil-cpp/
> diff --git a/package/Config.in b/package/Config.in
> index 3b089166da..77ada20db9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1929,6 +1929,7 @@ menu "Other"
>  	source "package/boost/Config.in"
>  	source "package/c-capnproto/Config.in"
>  	source "package/capnproto/Config.in"
> +	source "package/catch2/Config.in"
>  	source "package/cctz/Config.in"
>  	source "package/cereal/Config.in"
>  	source "package/clang/Config.in"
> diff --git a/package/catch2/Config.in b/package/catch2/Config.in
> new file mode 100644
> index 0000000000..b0eee9fa47
> --- /dev/null
> +++ b/package/catch2/Config.in
> @@ -0,0 +1,28 @@
> +config BR2_PACKAGE_CATCH2
> +	bool "catch2"
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  Catch2 is mainly a unit testing framework for C++, but it
> +	  also provides basic micro-benchmarking features, and simple
> +	  BDD macros.
> +
> +	  Catch2's main advantage is that using it is both simple and
> +	  natural. Tests autoregister themselves and do not have to
> +	  be named with valid identifiers, assertions look like
> +	  normal C++ code, and sections provide a nice way to share
> +	  set-up and tear-down code in tests.
> +
> +	  This package allows running testsuites on the target which
> +	  might be advantageous in certain cases.
> +
> +	  https://github.com/catchorg/Catch2
> +
> +comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >=3D 4.9"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

That comment wording doesn't seem right.  Did you mean "catch2"
instead of "gtest" here?

Greets
Alex

> diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
> new file mode 100644
> index 0000000000..8d47257abe
> --- /dev/null
> +++ b/package/catch2/catch2.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256  8c4173c68ae7da1b5b505194a0c2d6f1b2aef4ec1e3e7463bde451f26bbaf4e7=
  v3.0.1.tar.gz
> +sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566=
  LICENSE.txt
> diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
> new file mode 100644
> index 0000000000..e04b8a6b0a
> --- /dev/null
> +++ b/package/catch2/catch2.mk
> @@ -0,0 +1,19 @@
> +########################################################################=
########
> +#
> +# catch2
> +#
> +########################################################################=
########
> +
> +CATCH2_VERSION =3D 3.0.1
> +CATCH2_SOURCE =3D v$(CATCH2_VERSION).tar.gz
> +CATCH2_SITE =3D https://github.com/catchorg/Catch2/archive
> +CATCH2_INSTALL_STAGING =3D YES
> +CATCH2_INSTALL_TARGET =3D NO
> +CATCH2_LICENSE =3D BSL-1.0
> +CATCH2_LICENSE_FILES =3D LICENSE.txt
> +CATCH2_SUPPORTS_IN_SOURCE_BUILD =3D NO
> +
> +CATCH2_CONF_OPTS =3D -DCATCH_INSTALL_DOCS=3DOFF
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> --=20
> 2.25.1
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

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmKpt3AACgkQNK3NAHIh
XMawBg/+Mvm2VGJDcS1vRzxQfz3kN2/LeCCH52AtMDTDjT/kh8pGDOelzYS01tYT
SR1FVhWhu3Yoo16o7jshK6k7V9bPY0UYpqUk2/8qheNVpHaVAN9XBcxTsa9EVm7o
hB5vn6cZnwKPMWmOfmUSalJl+PaEvG0y1WGMxfG/8IxVuFeEcd6AMOhWWyFEDdOH
sC09eJDSNpputrL4rTGewtdldjN1LokyGG4yWymGWG/+tOwex5TToJOWJKFybOGo
c5yOlgSEzpyM/b6Sl60gO3vpHGwzLfyVCIdOOQ9tUX2cs/OAWbRE7dtfQ/n+yAU2
rnr8UqCtBKTtkFfyiNvEU0+Xm7C75/wFylpWHB0dzlbgLuId2i0RQKI6JNEVPzIq
w6K/9s1QuK3+dB/j55qyhx3U0sExDsKAsknmc+xCDBHD4hQudKOs6H/CDYvFNChe
MMJ8vkMYNZJATT43WaGYGz31zRUlhowiC+MsLHrtulEjrqGlSPcu1WFwq2i4730i
fl9Hn4iZJKvFXYS5cEWebf3y394RBqQwjzvsNISnjKPSOlldqUJ3zur5CxK9cmTj
VA/XOY9oZIZZwJZkfH/J3EHqoNOrYnvrrFnPVgWYQD9dADMC+rp/pjW4CswTO2zB
Yqd7OnEqpbxYP2kdXY2ZBIaGeU2ndbCx3b1tdGfQqOs/cEcdjk4=
=kcQd
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--

--===============6588799866505044294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6588799866505044294==--
