Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB55C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 06:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7351F402E2;
	Mon, 12 Dec 2022 06:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7351F402E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t3LWWtlfWW1B; Mon, 12 Dec 2022 06:49:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B6484049A;
	Mon, 12 Dec 2022 06:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B6484049A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8F5D1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 06:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83F0F40136
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 06:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83F0F40136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Msj_IoHtKpt for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 06:49:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80A984011C
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80A984011C
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 06:49:04 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id x28so16958945lfn.6
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 22:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/wRLrcj+ORdpZKxpe7kxBGfpsibKhrZHci53GgIgCw=;
 b=dCr9pURb1gemcMOfYWjvaPlSztfLXkdI3IwVRV/4hKparC1M230u9TgwMG1XSPERPZ
 T4e9E3RJzzPE/xagmLA8uGP/Oyc7iaVq60k+Z7VOKbEG8j9s022Ph5D/PX/b0XAp02gr
 OMDNLVKUaBFN5ibBvSgLJGr6hukyqLZlpKl+Ym/6Y52WH3SyEtjVLsov0Q0PSlG6dMlf
 57Z4g5gL6e2mAFH4Nfg6nWvbtZAFnPMcFeTKm5mrh3HSbAnIUJT40/ryRUmTzVuX2Qry
 7HaE0e1i4kA8TL2ZCoefzZlXtP6RluAkbVzqvfvbYG1gF4JH3rMdiJs6Pgk5YevM3N1w
 ggFQ==
X-Gm-Message-State: ANoB5pn9aH1dLlwQDsmPsIR92H0KK6RVYLjOosme+C2e6lUThgUAycMP
 x/GeHPW0Bg4S4QrQN/Wr7ZeZrqPRd2s=
X-Google-Smtp-Source: AA0mqf5NLX1p6pz5l/085ySzvrTVXdDKuQrRnniEzjwWSG9EQwYI28ryAnuSNmCken3icnnwIcW6iQ==
X-Received: by 2002:a05:6512:3416:b0:4a4:68b9:19dd with SMTP id
 i22-20020a056512341600b004a468b919ddmr4244576lfr.5.1670827741249; 
 Sun, 11 Dec 2022 22:49:01 -0800 (PST)
Received: from gmail.com (82-209-154-112.cust.bredband2.com. [82.209.154.112])
 by smtp.gmail.com with ESMTPSA id
 y28-20020a19641c000000b004b564e1a4e0sm1507943lfb.76.2022.12.11.22.48.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 22:49:00 -0800 (PST)
Date: Mon, 12 Dec 2022 07:49:11 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Message-ID: <Y5bO5xA2u7NbOxpa@gmail.com>
References: <20221128091158.5049-1-marcus.folkesson@gmail.com>
 <CAM8FrKJYV5b0u5aorY2WtvCdEL4R+ybb6ekXNqPDXrOLmQeRLg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM8FrKJYV5b0u5aorY2WtvCdEL4R+ybb6ekXNqPDXrOLmQeRLg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y/wRLrcj+ORdpZKxpe7kxBGfpsibKhrZHci53GgIgCw=;
 b=Yp7Wrh8doXr8z5oGubU8OVmViq9PV7rHgqe6EPZDdjO2jek41aFKDbxVfahhSpHkAp
 MXPHT3b9wyEvox6RVfcMpU3B0Q1qagKLhJL0+rmhCoz53Q+18NsRyEC4XLyDxZiIvC4Q
 3BsU6DLs42xQuKdhTDYdREtp9GoJttGDuaWqYi0Mdu99HzfczMB6nd8whrmboNCbaUK+
 NGORNFgJThNI1e0SU01Kqvh1Z7ufl44rwHpWF+g7LdwJqYZkYsQ0WfnYH+9wt1V9odqT
 KZZDfBGSwtuspXyaA8dPrLLr7XA4sR46EkuVtgFZzKrTtqF+mSo+2JRG05DK7puCcRdg
 lTgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Yp7Wrh8d
Subject: Re: [Buildroot] [PATCH] package/libostree: bump to version 2022.7
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
Content-Type: multipart/mixed; boundary="===============1682715123200169524=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1682715123200169524==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xsfI3ZIxXhReAs3/"
Content-Disposition: inline


--xsfI3ZIxXhReAs3/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Bump again.

Am I doing something wrong in my patch-workflow or have you maintainers jus=
t been too busy
for a while?

/Marcus

On Mon, Dec 05, 2022 at 09:43:04AM +0100, Marcus Folkesson wrote:
> Bump
>=20
> Med v=E4nliga h=E4lsningar / Best regards
> Marcus Folkesson
>=20
>=20
> Den m=E5n 28 nov. 2022 kl 10:12 skrev Marcus Folkesson <
> marcus.folkesson@gmail.com>:
>=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  package/libostree/libostree.hash | 2 +-
> >  package/libostree/libostree.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/libostree/libostree.hash
> > b/package/libostree/libostree.hash
> > index 582af4b7b9..ed31109fdb 100644
> > --- a/package/libostree/libostree.hash
> > +++ b/package/libostree/libostree.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256  835ef47d9a0b35a10c77ffd7f0fbd2e2b87f7cccb588da27442a05ff71ffad=
8c
> > libostree-2022.6.tar.xz
> > +sha256  8be2a9261c94e8b9ec4113380ffc480f8598245fb321a009bad4fae4b82241=
1f
> > libostree-2022.7.tar.xz
> >  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd6=
9c
> > COPYING
> > diff --git a/package/libostree/libostree.mk b/package/libostree/
> > libostree.mk
> > index e99da9d2cb..8e8ec63213 100644
> > --- a/package/libostree/libostree.mk
> > +++ b/package/libostree/libostree.mk
> > @@ -4,7 +4,7 @@
> >  #
> >
> >  ######################################################################=
##########
> >
> > -LIBOSTREE_VERSION =3D 2022.6
> > +LIBOSTREE_VERSION =3D 2022.7
> >  LIBOSTREE_SOURCE =3D libostree-$(LIBOSTREE_VERSION).tar.xz
> >  LIBOSTREE_SITE =3D
> > https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERS=
ION)
> >
> > --
> > 2.38.1
> >
> >

--xsfI3ZIxXhReAs3/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmOWzuEACgkQiIBOb1ld
UjLN7xAAqdHTgIUSky5srkdarR5/4FL4UZ896obx0qQ77Mtds/Sr/4aNrInYNhPS
OZq1xIQkAaMwV0YgKIzSBLRqQH+V/Q5prI/kQMB04uDMEQp7ATxw4VFeP/SwPQg7
dmjMMVLgtK/uh3TqiTp4Bh/LaLJi5MWy9cNtG4tFYwmNYYxCXOAb2igbkfgytq6D
Itwc9fjxctOMo9dBWc72WY3vBbWlX1q/Fby3tDeKLHYHX0zXB++9G4AX8B2uZV4t
0dcWxWAewqPBiE9+PKyW6WtUHnVHcEicTsTjgofXhpd0Wcn8Jh1ft/N0llSSLcKC
tcrXbHBaCAtCNbe74ZU4Q65ESOh20YijlUVXMaR+B7eDG+lW3GzxlzvqR2NJK3iJ
xO01QDaShh14LEVS5PvQIhzcJJNc3qKeWc2WpHM+HG4K6/TW+gvrsGovI+K0cVFa
TNUIv2nPqc4q+PMOac+3mTDzZlu0DetRqbBC/Xl6vvNppz9FKyXiNzixXwdvv9qf
YGoFI1v2VFoAXbSbx89jgomQuFFKEaEeYDj9GtUjLxpq5E3iof3LWY8JoMMEcpU3
8kxeyY3A4ex6xuoIFbGh+Zi+RMtsA0xnJAyC5UnkALR+j/kUJsaAVWrxHQtuH8xj
ccEZ3M6K6I+bETzV1ISLIbFy0g/ti4+qNHzLL+0kBgkRylQkJ8g=
=t+jz
-----END PGP SIGNATURE-----

--xsfI3ZIxXhReAs3/--

--===============1682715123200169524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1682715123200169524==--
