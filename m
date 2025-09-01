Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3384CCA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 10:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD74060E24;
	Mon,  1 Sep 2025 10:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKOs54Mkw7bv; Mon,  1 Sep 2025 10:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFDCC60AD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFDCC60AD7;
	Mon,  1 Sep 2025 10:17:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E68E10E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 10:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 440DA40452
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 10:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBnauW6Fo4c7 for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 10:17:02 +0000 (UTC)
X-Greylist: delayed 74324 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Sep 2025 10:16:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 776AB4044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 776AB4044B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.154.239.214;
 helo=forward103d.mail.yandex.net; envelope-from=leo@yuriev.ru;
 receiver=<UNKNOWN> 
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net
 [178.154.239.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 776AB4044B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 10:16:58 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c43:84a0:0:640:dfd2:0])
 by forward103d.mail.yandex.net (Yandex) with ESMTPS id 8CE6BC00E9;
 Mon, 01 Sep 2025 13:16:53 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id qGbHG8OL6Cg0-dZmdY8J0; 
 Mon, 01 Sep 2025 13:16:53 +0300
X-Yandex-Fwd: 1
Message-ID: <030165bf682e95e893ac114dc61744255d0290cb.camel@yuriev.ru>
From: =?koi8-r?Q?=EC=C5=CF=CE=C9=C4_=E0=D2=D8=C5=D7?= "(Leo Yuriev)"
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Cc: Buildroot Notifications <buildroot.notifications@gmail.com>, leo@yuriev.ru
Date: Mon, 01 Sep 2025 13:16:38 +0300
In-Reply-To: <68b5111e.170a0220.136224.1e1c@mx.google.com>
References: <68b5111e.170a0220.136224.1e1c@mx.google.com>
Autocrypt: addr=leo@yuriev.ru; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.56.2-alt1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1756721813; bh=VMoiaHRIkTwZ9ITZDIm369SJh6lXhlNJm/6wspVVqSQ=;
 h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
 b=s7nR49nhUhQULn4T5DcgcyaUPLuQOKF/HHarjzfXwZkwnQFOEkfHscfvMf6bIdbBR
 le9KyvplWqVgdrlKgDb+RR16nNv98H2rMIWQqmOgb4LfRtMG0iiMwNrz+kRONHHI82
 nugnCCJEcqijHH/WuE0fVQ7OGBYPWRbujqqfQPZ0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yuriev.ru
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-88.klg.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2025-08-31
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
Content-Type: multipart/mixed; boundary="===============9055497288003040428=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============9055497288003040428==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-68X4u6HkSlHrzZXav/4X"


--=-68X4u6HkSlHrzZXav/4X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Outdated packages
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This is the list of packages for which a new version has been
> detected
> and for which you are a registered developer. Please help us
> improving
> the quality of Buildroot by bumping these packages to their latest
> version.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | found by |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link to re=
lease-
> monitoring.org=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 version=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 upstream=C2=A0=20
> -------------------------------+----------+--------------------------
> ---------------------+--------------+--------------
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libmdbx |=C2=
=A0 DISTRO=C2=A0 |
> https://release-monitoring.org/project/141559=C2=A0| 0.13.6=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |
> 0.13.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
>=20
> Thanks for your contribution to Buildroot!

Hi,=C2=A0

A month ago, I submitted the patch
https://patchwork.ozlabs.org/project/buildroot/list/?series=3D467274.
It has not been applied and is already outdated due to the new release.

The fresh one was submitted yesterday
https://patchwork.ozlabs.org/project/buildroot/patch/20250831133138.13736-1=
-leo@yuriev.ru/
Corresponding libmdbx release v0.13.8 includes improvements based on
the results of a wide semi-annual user usage (within Ethereum mostly).
So it is reasonable to backport this patch to all supported buildroot
releases/branches.

Leonid.

--=20
Used PGP key 97BEF93EAB607518BD10B927E8686 could be checked
at=C2=A0https://gitflic.ru/user/erthink and/or https://github.com/erthink

--=-68X4u6HkSlHrzZXav/4X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE9IGHqvPZe++T6rYHUYvRC5J+hoYFAmi1coYACgkQUYvRC5J+
hoaclBAAhwy/j84ReIURE5CzFtPt0+xfYM2dLcql2Z+XlMsuTM6014x50m/BMxO2
Lw+QHK7A0Kw2OjRi8R0wCwS58uMzbtmelcSd8NitwwE0tvWNPrQ3l8d6twVEq0Zj
5gCprOf8YFeD6QJKvJXEgtXff+xAAxPaVtPlPiPle2lXNvt0V81WTuOMzdsaJXqz
bGfGQ9DC8PVZSKT6K3XjsKLIIqWvWLmYV7o+oeapdL4l4eBFHXhusEvYPaeaWvMj
/ezan+GX9C2FtsK6v/+1YnmHmVXsEPIaqkILC5yezqy8jnyEiH4//C5ewuuFFT6Z
f89nmrYCTPyFfjuJtfwQYPV/TMaV1J+Zj31+fyOf4nZmAWOVTbli5Rj2xrTXFxIA
wT/9YNZVawG8aXIFZ+nteqStYWCgfky+CNe6W0gIC0YrBLp9EmVbn6b1y8k95vKs
s6jVKvMSW3zmrBs6nWP+wb8zNA/TfdKNuolAkOSstJjUi0m00LoyoPYm45TxPwNS
B1kBJ/7cCSZFrhWIhCO1uaXA3Uc5fsKWfhhZFjtBkqnWsDYCxLkEe2uZKS3oEqkb
PEiFdGwSOybUeJygEV7UaghVXjln3FtWK+OmIqrNQmggeuDR/eQIHOhrKIdZ0S24
KMhy7QhTkydQcP5WwyUIkVormU/nyvSEO0oI8Kh0xZrUhkJauZg=
=qWVg
-----END PGP SIGNATURE-----

--=-68X4u6HkSlHrzZXav/4X--

--===============9055497288003040428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9055497288003040428==--
