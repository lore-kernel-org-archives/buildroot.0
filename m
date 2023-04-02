Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6C6C76196
	for <buildroot@archiver.kernel.org>; Sun,  2 Apr 2023 12:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EA8660AED;
	Sun,  2 Apr 2023 12:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EA8660AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7Bo15nXejHg; Sun,  2 Apr 2023 12:58:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E424B60C2A;
	Sun,  2 Apr 2023 12:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E424B60C2A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06DEE1BF473
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 12:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFE41410DC
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 12:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFE41410DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YuhWAHXNLJ_t for <buildroot@lists.busybox.net>;
 Sun,  2 Apr 2023 12:58:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9A30410D2
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9A30410D2
 for <buildroot@buildroot.org>; Sun,  2 Apr 2023 12:58:31 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so29949337pjp.1
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 05:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680440311;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uB+zU2qIqlsExBr2Awzoa0GZ1Tdwf/0nUGz+fA2oftY=;
 b=Xv1rZBJxhydDeBREdrhFPbVBFlAWeAbikl2r0mOQ6DsnCvy1twEC0izVCE5eJd4SS8
 AI1MaxuVBF86I4rg45SppsA/en5StoptRPL5lt5BRn78hiCAafbNjCHexAmWAtOx4wry
 1OO52+nZjF6TqJ4OqYx00dXZ0Rh6+Rh9M4OJMPgRDs0QhN2hARalmwFAGcuUoV1vYdO/
 oP8YrUQ+kLi7UE/aIEzGgjEXeDDpj2gDAIu4Gs6SDvFrxoWBaHI0LeTBhNsnfYZsITPC
 9YOouXWuNMAJ3IMeP7JMeXZ73hnYbxve4ZDcZEmUVs7MWMubppRXmALm2rOUD9cx0uX9
 eukQ==
X-Gm-Message-State: AAQBX9f/SljsEVOADFdMaE60Vxyl7A4MFrpB4WTYjI9+hTkFd5q+FBsQ
 +RGaY1K7Lst7jAWjzMU4iOI=
X-Google-Smtp-Source: AKy350bM+F9OONVlS8yu0SY+A4U2rQwAHBipdkk/G7vxBn81CWP3VqgG/PiIZYCHrPu3vVMuS8eRyw==
X-Received: by 2002:a17:903:787:b0:19e:31a3:1a7e with SMTP id
 kn7-20020a170903078700b0019e31a31a7emr25337461plb.69.1680440311116; 
 Sun, 02 Apr 2023 05:58:31 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-38.three.co.id. [116.206.12.38])
 by smtp.gmail.com with ESMTPSA id
 ja7-20020a170902efc700b001a1ddd224desm4798018plb.89.2023.04.02.05.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 05:58:30 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id E5E801066A7; Sun,  2 Apr 2023 19:58:27 +0700 (WIB)
Date: Sun, 2 Apr 2023 19:58:27 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
Message-ID: <ZCl78+f4dzEOXHx9@debian.me>
References: <20230329193028.775041-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
In-Reply-To: <20230329193028.775041-1-sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680440311;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uB+zU2qIqlsExBr2Awzoa0GZ1Tdwf/0nUGz+fA2oftY=;
 b=GuAmHjph7GDBDclZqqpt/xLpl+g1H3aBkDiTBaJLnfOvRidGrX1fk0uuOZyvF8o2PR
 3/vLmi6ZUrv5ep05LwG6EoEL5tB7lYuluO00BmJwd+KVaoh41jWG4jgqQTR3YQsy1Vf/
 TQifJm+Tu4PTrs5WZS+zrKWmjy9QL/DOe93Vok4o6FlAhlTBQix1wdgCednO9Pa94xrk
 CpOeIvyELVO6nWkQ6yRqQKiEUd8mfl/NaBZojC+yTssbUKkKuU55vi3fb3Hijm4B9GOI
 RwdTNSrkaqqNbooRJiI53I8/AnoDVDr17qa75Wb2wG9gpGhkgSCoxWRpvpXwqxhB5FPx
 5T3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GuAmHjph
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: bump to version 2.37
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
Cc: Romain Naour <romain.naour@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============4234522946894523707=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4234522946894523707==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hwp43bacIJD71Hfb"
Content-Disposition: inline


--hwp43bacIJD71Hfb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 09:30:27PM +0200, Sebastian Weyer wrote:
> From: Romain Naour <romain.naour@smile.fr>
>=20
> See:
> https://sourceware.org/glibc/wiki/Release/2.37
> https://lists.gnu.org/archive/html/info-gnu/2023-02/msg00000.html
>=20
> Security related changes:
>=20
>   CVE-2022-39046: When the syslog function is passed a crafted input
>   string larger than 1024 bytes, it reads uninitialized memory from the
>   heap and prints it to the target log file, potentially revealing a
>   portion of the contents of the heap
>=20
> Remove patch 0001-Revert-Linux-Implement-a-useful-version-of-_startup_.pa=
tch fixed
> in 2.37 release by [1].
>=20
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=3D29249
>=20

SDK tarballs for aarch64 and powerpc64 big endian (with binutils 2.39
and GCC 12) successfully built, thanks!

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--hwp43bacIJD71Hfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQQJRmM4Nl+8BKPNGvtCNk3+7YYOdAUCZCl77wAKCRBCNk3+7YYO
dCFyAQChBfnhLKcwBIJ5znEJy8k9Fi5kXC4dPzQJ2rHrmZPfywD/S6KpWzLc2rbI
qfV/lsflZjt9VHxuslFZaOj6Tt7PHes=
=BYxZ
-----END PGP SIGNATURE-----

--hwp43bacIJD71Hfb--

--===============4234522946894523707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4234522946894523707==--
