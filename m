Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5C7FCB622
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 16:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A6E760A61;
	Fri,  6 Mar 2026 16:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWlHilcs3Wf7; Fri,  6 Mar 2026 16:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99B0B61293
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772815313;
	bh=vrePbdSofpWuAc/EmCkasBzCWX87TBiEI0PWp2DbzEQ=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E6B7skIVpMnUNB24vOFkYjtSjsJj4u2ovTtevENYpPoECGKu1+D4ziTPnVFDriBNv
	 vRGuugbHXWuqIaw/BAFvOfixv0wDR/iVkHjgm2dh55w0frpNnvbLZu6D760hPnNXhw
	 Du0mG/cPEjvlxS8ncLfsoTaR+uJDN1RK0r2IRi13dZEG6bj/irLuJNSXRAAdXyce+O
	 7D2fqQCq8RvUczJhTt5aSuKBhXKLGIydEg0wssZn5sl55EaMJPBYrn9tmsljaNsDYV
	 U4EdmKQGYyb2iHeuEQG5ZHgLKq0jglzORfpMr8zweqvqzPE++942QY71leJMRFckDf
	 sQfL0E/0hBBAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99B0B61293;
	Fri,  6 Mar 2026 16:41:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B12F339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 16:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 289A061291
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 16:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmR8GgIqokB8 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 16:41:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.233.101.22;
 helo=leonov.paulk.fr; envelope-from=paulk@sys-base.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C9826065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C9826065A
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C9826065A
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 16:41:49 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 2D6C81F8004A
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 16:41:46 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 3763DB26B1E; Fri,  6 Mar 2026 16:41:45 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id C1B95B26B19;
 Fri,  6 Mar 2026 16:41:44 +0000 (UTC)
Date: Fri, 6 Mar 2026 17:41:42 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Pedro Aguilar <paguilar@paguilar.org>
Message-ID: <aasDxprCbKvKQoLd@shepard>
References: <20260225175138.2965145-1-paulk@sys-base.io>
 <20260306124633.143362-1-thomas.perale@mind.be>
MIME-Version: 1.0
In-Reply-To: <20260306124633.143362-1-thomas.perale@mind.be>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=sys-base.io
Subject: Re: [Buildroot] [PATCH] packages/libunistring: bump to version 1.4.2
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
Content-Type: multipart/mixed; boundary="===============5513468574620768092=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5513468574620768092==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y4midAkthvVotTmE"
Content-Disposition: inline


--y4midAkthvVotTmE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri 06 Mar 26, 13:46, Thomas Perale wrote:
> In reply of:
> > This minor release contains a fix for building with host glibc 2.43,
> > which fails otherwise.
>=20
> I'm looking at this commit to maybe cherry-pick it for the 2025.02.x bran=
ch.

I think it would be good yes.

> I'm running a host with glibc 2.43 and didn't manage to reproduce the bui=
ld
> issue. Can you point me to the commit that fixes it or an error log.

Here is what the error looks like:
/usr/bin/gcc -DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..  -I. -I. -I.. -I.. -DIN_=
LIBUNISTRING -DDEPENDS_ON_LIBICONV=3D1 -I/home/paulk/projects/code/cardboar=
d/build/buildroot/host/include  -O2 -I/home/paulk/projects/code/cardboard/b=
uild/buildroot/host/include -c amemxfrm.c
In file included from /usr/include/features.h:540,
                 from /usr/include/errno.h:25,
                 from amemxfrm.c:23:
=2E/stdlib.h:807:20: error: expected identifier or =E2=80=98(=E2=80=99 befo=
re =E2=80=98_Generic=E2=80=99
  807 | _GL_EXTERN_C void *bsearch (const void *__key,

And the email thread on the libunistring bug list:
https://lists.gnu.org/archive/html/bug-libunistring/2026-02/msg00001.html

Hope this helps,

Paul


>=20
> Thanks,
> PERALE Thomas
>=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
>=20
> > ---
> >  package/libunistring/libunistring.hash | 4 ++--
> >  package/libunistring/libunistring.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/package/libunistring/libunistring.hash b/package/libunistr=
ing/libunistring.hash
> > index f86b6f94b02b..ef2f3da34147 100644
> > --- a/package/libunistring/libunistring.hash
> > +++ b/package/libunistring/libunistring.hash
> > @@ -1,6 +1,6 @@
> >  # Locally calculated after checking pgp signature
> > -# https://ftp.gnu.org/gnu/libunistring/libunistring-1.4.1.tar.xz.sig
> > -sha256  67d88430892527861903788868c77802a217b0959990f7449f2976126a3077=
63  libunistring-1.4.1.tar.xz
> > +# https://ftp.gnu.org/gnu/libunistring/libunistring-1.4.2.tar.xz.sig
> > +sha256  5b46e74377ed7409c5b75e7a96f95377b095623b689d8522620927964a4149=
9c  libunistring-1.4.2.tar.xz
> >  # Locally calculated
> >  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb369=
86  COPYING
> >  sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d=
1c  COPYING.LIB
> > diff --git a/package/libunistring/libunistring.mk b/package/libunistrin=
g/libunistring.mk
> > index 1abbfde6da9e..57333a35bffc 100644
> > --- a/package/libunistring/libunistring.mk
> > +++ b/package/libunistring/libunistring.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ######################################################################=
##########
> > =20
> > -LIBUNISTRING_VERSION =3D 1.4.1
> > +LIBUNISTRING_VERSION =3D 1.4.2
> >  LIBUNISTRING_SITE =3D $(BR2_GNU_MIRROR)/libunistring
> >  LIBUNISTRING_SOURCE =3D libunistring-$(LIBUNISTRING_VERSION).tar.xz
> >  LIBUNISTRING_INSTALL_STAGING =3D YES
> > --=20
> > 2.53.0
> >=20
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--y4midAkthvVotTmE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmmrA8YACgkQhP3B6o/u
lQzQRRAAm2neFyOJUCGtBSwg36Wd9WnvdBZDU/zyLnoF5EXSbNONQE2cUDfh/pr9
xLKei7KYUUbX7KYaM35FzHfWRbhexkVKs/NYsSmSbxEis+QB+I67LIZgsot8KseF
AwuLtMP023N5Hxii3W2frIMUTA8tNugPow4n242+3HXBqr2NiPFAB9/Gd64krq+9
2sUzYF+/kY1cpF4nVXjfw1jyZH7dup3So++BDiMQPKNFJ+ygxwjXqd/AYUGD2EFF
YY1+vTxzT3ZidBeUGJlaPBs7oUjwfn4JLijMU3uzZqnC6lsuYsyGpzrehJp8iG1x
XnBdgkhyLE7F4knLPAku02NAxy/gKWSZPmCWmDqFjjToBIcHlITlFlYNfIGXq1GT
8/hnuQVsmx+q/4y7+N1fjh+3pgtla4XlFoM2AW79FVdKOeWO42ksoXZxlUAgA0N7
ccKzAMPZCD7byjWBUNWpi1oLztRi/0FzpnzFjKcgEe4yvx6VYfEFZXmgnhjLS05J
eeVld2WNuHoEBjP1PXAIzB+wymlD/utyY9oq8PuU3KqwJbvKMuqe8rrAkhCqgP+7
cnPfNktXZdepJnVyy+lleCYLxkaNc0NmrLRBQMTSQ4w6KKM3WKDdsTAftjA73R2q
vcmeJbWFLnm4h4Mdz8qplanTuR3T87shN9BjIDfVdH7dInrEAO0=
=ARK4
-----END PGP SIGNATURE-----

--y4midAkthvVotTmE--

--===============5513468574620768092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5513468574620768092==--
