Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AE9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 15:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6AC28473E;
	Thu, 10 Mar 2022 15:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xz9CRn8lmo39; Thu, 10 Mar 2022 15:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20A638473A;
	Thu, 10 Mar 2022 15:42:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 294E31BF375
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 15:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17D248473A
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 15:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Ar7_2BpDAnC for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 15:42:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from parad0x.org (parad0x.org [IPv6:2001:41d0:8:3e8c::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECD5584736
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 15:42:10 +0000 (UTC)
Received: by parad0x.org (Postfix, from userid 1000)
 id 42AFA1033DB; Thu, 10 Mar 2022 16:42:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=parad0x.org; s=mail;
 t=1646926929; bh=OrUrMir3fZqTfSWkvDXLrT/cWHAItma3xo+Is2tyBy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oueYoy6SpjCg1lUmg4lfufUx6hDMYQISRfl/0YV0wfXZvLVpkOtH8HnKf12wOQjeV
 HAiekQopNyvsJbnkESHmRVuT0PJeQ5vjhArDAxES1DMsckWwuLE7do7b/VAi461ADM
 DfBoZN7CPKu2Q/OfFDThplZSnqdTIsJjCwNr7+t8=
Date: Thu, 10 Mar 2022 16:42:09 +0100
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20220310154209.GA32108@parad0x.org>
References: <20220310101826.GA2353@parad0x.org>
 <34cb1e87c9ff49b897ae79c543278d03@AcuMS.aculab.com>
 <20220310113310.GA9122@parad0x.org>
 <35a9243ae72142ac8380675e9caa0fcf@AcuMS.aculab.com>
 <20220310121105.GB11974@parad0x.org>
 <2c3fb2b6d5c54261a4e0a8538ec6ea3c@AcuMS.aculab.com>
MIME-Version: 1.0
In-Reply-To: <2c3fb2b6d5c54261a4e0a8538ec6ea3c@AcuMS.aculab.com>
X-PGP-Key: http://parad0x.org/~mat/pubkey.asc
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Buildroot] [PATCH 1/1] fs/common.mk: use find instead of shell
 glob patterns
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
From: Mathieu Mirmont via buildroot <buildroot@buildroot.org>
Reply-To: Mathieu Mirmont <mat@parad0x.org>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0887315532531429343=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0887315532531429343==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 01:47:24PM +0000, David Laight wrote:
> From: Mathieu Mirmont
> > Sent: 10 March 2022 12:11
> >=20
> > On Thu, Mar 10, 2022 at 11:52:08AM +0000, David Laight wrote:
> > > It is worth checking whether Debian have changed the behaviour of dash
> > > or whether they've just changed the default root shell to dash.
> >=20
> > They've switched to the internal fnmatch implementation of dash [1] in
> > this commit [1]. Before that they were using fnmatch(3) from the
> > glibc.
> >=20
> > [1] https://salsa.debian.org/debian/dash/-/commit/d7b1269eeeb5749ccc577=
f6e01dfccc2916b0130
>=20
> Hmmm:
>=20
>     External implementations change in subtle ways, leading to hard to
>     diagnose bugs. It=E2=80=99s better to rely on the built-in implementa=
tion
>     instead.
>=20
> As does randomly changing the implementation!

True, however [^x] is not part of POSIX so it can't be expected to
work with /bin/sh.

--=20
Mathieu Mirmont <mat@parad0x.org>

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJiKhxOAAoJENaa1EWGzzIiz4YQALQVou+lc3xqwJDRyTRUgiGx
NNauxCEUtmNIVprEe0ZDpe/aZbg7zJ3YItD3AQXM2t2iAlrpVjpkh52xGHU8q58X
jeJi2sx68JT65Rz0kzNx5LVVWZ+MiOtDQhyLPTiuufLA5+H2La1IYxNLqxXVFQMf
AEubwOyKGiI2zqenAUaKdRLMmkIhAzUjqB7XW8IQPVsS3ajICKBPFXfj+mmRRVoL
JnTVvUZtXong5QhyBneQT2rAWvAJn6Iyyh7oO9Xs+IXcOE0nQPbOAaI9AlIaUrJc
GZRmtptgm/0tGDIp4deYGtkYmBFVpW9jJSksKLSOyRgsPGlArRakMnyPtTVk/15a
rBdCGp5p2Zj87DVCwbQZHkZRgFbBkQgw7zJ9mW+G8a7ZZIIDvB4uP6l2StbvyFTg
paRHlGUx10lFIppliKtxbCIEo/AdDSY++9iOqPDY+0KBemAxJzfwV8/m5PgxR3wc
XieeTUi1ljrieX7BnNOljLzwlWicX0uIcIK2qEsMmC8uU9xTEWjI836ibA/WcV8g
OhPi/TA90boEUSDR6ssuzzo717Gp5dG7iRaGB6B9YRUBJ9ZTzb8nrmY5v0+6AVgL
pg6RCazLlSljtl4wUh/ztjjXKspJNA8lpsNWOTpf0FMiXuVpM4L72gWhBoT7RNUc
GgmyRJaxsuvVTquoyXnW
=DR7t
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--

--===============0887315532531429343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0887315532531429343==--
