Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53685C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Mar 2022 12:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7DB78132A;
	Sun,  6 Mar 2022 12:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VeVPW7wPplLV; Sun,  6 Mar 2022 12:50:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08C3780B20;
	Sun,  6 Mar 2022 12:50:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41DE31BF4D5
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 12:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3152480B20
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 12:50:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTMZ_CJ2Eyfu for <buildroot@lists.busybox.net>;
 Sun,  6 Mar 2022 12:50:04 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D127580A72
 for <buildroot@busybox.net>; Sun,  6 Mar 2022 12:50:03 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.50.4]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MBDzc-1nJeC80otK-00CgyY; Sun, 06 Mar 2022 13:44:54 +0100
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <post@lespocky.de>)
 id 1nQqFj-0006LU-CE; Sun, 06 Mar 2022 13:44:52 +0100
Date: Sun, 6 Mar 2022 13:44:46 +0100
From: Alexander Dahl <post@lespocky.de>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220306124445.GB10202@falbala.internal.home.lespocky.de>
References: <20220306120902.132254-1-francois.perrad@gadz.org>
MIME-Version: 1.0
In-Reply-To: <20220306120902.132254-1-francois.perrad@gadz.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scan-Signature: 398b5fa1ed41958f905023f519330efd
X-Provags-ID: V03:K1:pkG/LCsAdtZ+nc2qm4xOpcsm2DN3H8/KHfw3kENErkEGKjz634K
 xGrSsksz8q3YKIp8sHZRka9PL2Gr3O0+rB+8N6nUDZEyYM6KEf/RY1pOJQKyN/HZkYQWuiN
 MaHOXbSuR5DDSAesXYRpTKLve8sEb+Q4ovtHX6tkfcWjFObu1PmDukXIobqI9GxK+ePg6Gd
 XQ0nixSY+2s3BVc5mo6hg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KDWunMYmpLc=:b0iBh2yGjmWJT2dD4+qOb1
 4kAQEs72AIKfhGuEydflGg+T8VBmpGeE/1V0o5T0+b3UYEgE6GVDEbfg7ekIwdaFO64EV6Tsd
 s+7GELuVeXa7Gk2MuTMtLbpddoVxsk7o8W89QngoeT3hDDQayHrVRr8j6LU3t1SJvan4X6Qjg
 EbrgelSO2nSu+iRDhV5ZNmlMxEiAB7UleND1WjY1i4OXWpB8maPR/VTOe0agulMSw8ma7e4d3
 5tpK2aXfGfsZ4zUI04okn6/lzoduZJMaj2uwPyaunWuxzlA6xB8iFCEYlxcx/rZ6j3A7Pa+0N
 vFiii/NvCEKWRkkBh4/vc6ubX2yj1TB61l/yba0acCmon4UT7jtXcUh2z7HrYBUFucksum5Ld
 s80svSZ8hg1AF1pD/jGqVAL0CkOA8UyqYLPbvfoUzhJT5Wdiy6hQO96g813eR2FpXvsOZ8WBo
 aQp0RcvLK6U//66E1PDaCBcaliK8h8+y4gP7KikqC2W3ZPpu2pdRL0FoH+RQptLep5tpwzbiU
 SacPNfBs5EfvOIEMNJK1jzZX7o5Crz4xLdB+UlQjXHcBohehTvWL4/PoG4Jc71Ecuo4cNag7R
 qGGRSCc7umkXljd4ZX7DTpTz+vOWBLFfgC9Unm2QjHSz2lcgWLr4CFt3k/QkujfwBK9/nnhMv
 gPc92nw1SIbSqsucRRAWTn2+ArmX9NnjwqTOfkgSzQRk92E6RSL4c6AJ7Z60s7KDvzKc=
Subject: Re: [Buildroot] [PATCH] package/libxlst: security bump to version
 1.1.35
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
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============4338943214331043748=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4338943214331043748==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline


--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Francois,

there's a typo in the subject, should read libxslt.

Greets
Alex

On Sun, Mar 06, 2022 at 01:09:02PM +0100, Francois Perrad wrote:
> - fix CVE-2021-30560
> - remove merged patch
> - moved from xmlsoft.org to gnome.org
>=20
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...ml2-config-check-in-configure-script.patch | 31 -------------------
>  package/libxslt/libxslt.hash                  |  6 ++--
>  package/libxslt/libxslt.mk                    |  5 +--
>  3 files changed, 6 insertions(+), 36 deletions(-)
>  delete mode 100644 package/libxslt/0001-Fix-xml2-config-check-in-configu=
re-script.patch
>=20
> diff --git a/package/libxslt/0001-Fix-xml2-config-check-in-configure-scri=
pt.patch b/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.p=
atch
> deleted file mode 100644
> index 3848dcb23..000000000
> --- a/package/libxslt/0001-Fix-xml2-config-check-in-configure-script.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 90c34c8bb90e095a8a8fe8b2ce368bd9ff1837cc Mon Sep 17 00:00:00 2001
> -From: Nick Wellnhofer <wellnhofer@aevum.de>
> -Date: Fri, 15 Nov 2019 11:53:11 +0100
> -Subject: [PATCH] Fix xml2-config check in configure script
> -
> -A 'print' option has never been supported. After a recent change to
> -libxml2, invalid options cause xml2-config to fail.
> -
> -[Retrieved from:
> -https://gitlab.gnome.org/GNOME/libxslt/-/commit/90c34c8bb90e095a8a8fe8b2=
ce368bd9ff1837cc]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 3da57b18..585b9d7c 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -548,7 +548,7 @@ dnl make sure xml2-config is executable,
> - dnl test version and init our variables
> - dnl
> -=20
> --if test "x$LIBXML_LIBS" =3D "x" && ${XML_CONFIG} --libs print > /dev/nu=
ll 2>&1
> -+if test "x$LIBXML_LIBS" =3D "x" && ${XML_CONFIG} --libs > /dev/null 2>&1
> - then
> -     AC_MSG_CHECKING(for libxml libraries >=3D $LIBXML_REQUIRED_VERSION)
> -     XMLVERS=3D`$XML_CONFIG --version`
> ---=20
> -GitLab
> -
> diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
> index 25aa30839..39523a695 100644
> --- a/package/libxslt/libxslt.hash
> +++ b/package/libxslt/libxslt.hash
> @@ -1,5 +1,5 @@
> -# Locally calculated after checking pgp signature
> -sha256	98b1bd46d6792925ad2dfe9a87452ea2adebf69dcb9919ffd55bf926a7f93f7f	=
libxslt-1.1.34.tar.gz
> +# from https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.35.sha=
256sum
> +sha256  8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79=
  libxslt-1.1.35.tar.xz
> =20
>  # Hash for license file:
> -sha256	7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819	=
COPYING
> +sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819=
  COPYING
> diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
> index d0f79d252..9c7be6822 100644
> --- a/package/libxslt/libxslt.mk
> +++ b/package/libxslt/libxslt.mk
> @@ -4,8 +4,9 @@
>  #
>  ########################################################################=
########
> =20
> -LIBXSLT_VERSION =3D 1.1.34
> -LIBXSLT_SITE =3D http://xmlsoft.org/sources
> +LIBXSLT_VERSION =3D 1.1.35
> +LIBXSLT_SOURCE =3D libxslt-$(LIBXSLT_VERSION).tar.xz
> +LIBXSLT_SITE =3D https://download.gnome.org/sources/libxslt/1.1
>  LIBXSLT_INSTALL_STAGING =3D YES
>  LIBXSLT_LICENSE =3D MIT
>  LIBXSLT_LICENSE_FILES =3D COPYING
> --=20
> 2.32.0
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

--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmIkrLcACgkQNK3NAHIh
XMbpVQ/9HAU/9USBgcS/c+aZ4JqsesAjGaAGPABk4C7nEDQ5PoFd0Rwt0NoPS1EV
wccU23GLtbsRfrB91bcSmbvC0WBfQMTSVfQw6JOp+UYlYrbW5DQmHleeDCjSek+f
3Vx70RKBvvOoR4LSHLbX3hYSmkgeuoLlHGbMJbfU2rfiYCYXPxOYwWxKbHmXndE6
+XtXzhEI++6DHybyETiwBwA79XUjiwqHaAapQEazrdYqFnjUpkYuL1cVvglgLXD3
kGaYbY8mKZS+MXL38/hR6S8HhGnfcx6YketQgJriTGcNR2WugNm8xinXY71Ougmv
sowmVbEQawaE/MbDJT10VFwAaN7P+LnsS/2P0nncNNP9TZnG/6OjfU+x9G7I0T4K
bPGqC65sV4YyDKemvjdOrKk1g2QuojVXODhyQ3zvU/J0wMlQHpdFLqASCRnC0Rqw
VXuIhjA0pXHjY66TO7wbcvt2RU7VNKlFbgew6zUZDVS+VIp9tVfPrg47B8ltNLeO
xaBkFIklFoueL0MqUFeVOj5U+OilH68b+BXUJCJjXbQaQHtt6ZVcVhNwDGaGr3hw
FK+nZj2jZvodv76SAuCn3lQuqTJorkSVxIoJQgRLFvzoe2laKa4+ht61spXcSGmB
NX6crUikouzakKJtCrfXsuNR1fskJGac5Ga+nptBZlXyQkz+Lwo=
=CCZA
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--

--===============4338943214331043748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4338943214331043748==--
