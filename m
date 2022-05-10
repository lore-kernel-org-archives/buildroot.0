Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F308C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 07:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F050B60F71;
	Tue, 10 May 2022 07:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F7s6AfslrljK; Tue, 10 May 2022 07:38:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A25760F6D;
	Tue, 10 May 2022 07:38:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87F921BF23C
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 07:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF0AD403C5
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 07:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-pAjxGVPhad for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 07:38:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25B77403AC
 for <buildroot@buildroot.org>; Tue, 10 May 2022 07:38:36 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.38.142]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTR6K-1nMwC40hum-00Ti7X; Tue, 10 May 2022 09:38:32 +0200
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <post@lespocky.de>)
 id 1noKRt-0003YT-Lp; Tue, 10 May 2022 09:38:30 +0200
Date: Tue, 10 May 2022 09:38:23 +0200
From: Alexander Dahl <post@lespocky.de>
To: =?iso-8859-1?Q?R=E9mi?= Jouannet <remijouannet@gmail.com>
Message-ID: <20220510073822.GE19726@falbala.internal.home.lespocky.de>
Mail-Followup-To: =?iso-8859-1?Q?R=E9mi?= Jouannet <remijouannet@gmail.com>,
 Remi Jouannet <remi.jouannet@outscale.com>, buildroot@buildroot.org
References: <1651848863-30178-1-git-send-email-remi.jouannet@outscale.com>
 <20220506153144.GD19726@falbala.internal.home.lespocky.de>
 <4faa9736-e53b-629c-e6c8-7588e3cf7ba7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4faa9736-e53b-629c-e6c8-7588e3cf7ba7@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scan-Signature: bab203c11356ddcd966eb11ee84a16bf
X-Provags-ID: V03:K1:C/clU7PDHrhE345R+wIdIbnQWSp1bLA2Ozm2NYnNtape8W/gAOW
 yPYemz4Iw+KiPsrwBgZBr087D+PH68vJjn1qr0gfAGCMVVrP7pJF73DDAzhPDk6ZPYzdNKn
 +g7GzShlfiK21sBST/UvOj3RjDemcwL03lqfmiMxS3gWFgtUBmetRAX7CnarKuzV2KjvCaJ
 RHhVggjt2qR0n6yV839gw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IMT8TpeAS2E=:Z96NS5pV5/ypV8ET2nP1Hf
 67tPfPFCC0kllcLQJ2vdsDwAhGyOVzaFWOLAfVmQyGEo+wjktbm74JQK15vbZr2PxtInlVYiO
 Tpz+bAvJd6HgFEjNqubWKIxK5lnND8SVUQMH8a+TId/J9tE2yHSYG5aWyMFlGySIEzs2BLh9x
 Fq8jpPQXrWL2u9MLtbi4OX0tzihBZKPfPzmM/VrlCve0JhpuaFMVgqey+rN2nhBs6RzJVB4yl
 IfFANIwGgD+yeMn1DSO0Zwe4xPy2BpDmSNHweQEp7U0xzaojh1rQmTpVyVEgeWonn218Vi9L0
 AcFvJxjsMIEUQajZAUzDeoKcXNxdF4f2VGdBMeKBoenNPwqiOXcB/D+VsP9WP7WKcrMnXcmS2
 4qntbvqRGzbzDg9TM4w6yMeen6CYD/EZhIj9cFfGkv2qLViets9x3pUng6ogsz9FsjZsVwAC4
 iKUs79kUnbUFOOiHQIEbah7WI/rTCC8Lquxaa2kEH1xiAn5o2C8W/rK/XUVkJMIw76v+faByN
 A+0U7QJNy+tdii7/pOZEVaYxfBeAazj2voxs2Xl3/AyVkUX2LhIHQki4sk+6lfJlfSwVNGBqF
 oqxqJ+Qq31QNGVp1wKPdZsCr/gkbBNSooeTXkHDR95n8X4hi1lowfptiGqH74fLUAcZl46VWW
 aLs6x6o6Ui+2F1jJ+wCifoUQShLH8aE1RNIlNpTNhDE/Z52hOzgBv0SbaRAUOunPkn5c=
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: add -O staticroutes
 options to udhcpc udhcpc default script can handle staticroutes but it
 missing from ifupdown options
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
Cc: Remi Jouannet <remi.jouannet@outscale.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5856517032851779328=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5856517032851779328==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hwvH6HDNit2nSK4j"
Content-Disposition: inline


--hwvH6HDNit2nSK4j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello R=C3=A9mi,

On Fri, May 06, 2022 at 07:07:06PM +0200, R=C3=A9mi Jouannet wrote:
> Hello,
>=20
> yeah sorry about that, i'm not used to send patch by email

There is a section in the buildroot manual explaining the process
quite well, in short: use `git format-patch` and `git send-email` =E2=80=A6

https://buildroot.org/downloads/manual/manual.html#submitting-patches

> I wanted to do a simple subject and write a few lines to explain the
> patch in the body

That's right. Short subject, one line empty, explanation below.

> do you want me to send a another patch with a a better subject/body ?

I'm not in the position to request that. I can just say patches in the
right format have a much higher chance of being accepted.

Greets
Alex

>=20
> Le 06/05/2022 =C3=A0 17:31, Alexander Dahl a =C3=A9crit=C2=A0:
> > Hei hei,
> >=20
> > took me a while to find the reasoning for this patch. Didn't expect it
> > in that very long subject line. ;-)
> >=20
> > Greets
> > Alex
> >=20
> > On Fri, May 06, 2022 at 02:54:23PM +0000, Remi Jouannet wrote:
> > > Signed-off-by: R=C3=A9mi Jouannet<remi.jouannet@outscale.com>
> > > ---
> > >   package/busybox/busybox.config | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/package/busybox/busybox.config b/package/busybox/busybox=
=2Econfig
> > > index 52cb8ff..a614662 100644
> > > --- a/package/busybox/busybox.config
> > > +++ b/package/busybox/busybox.config
> > > @@ -1022,7 +1022,7 @@ CONFIG_UDHCP_DEBUG=3D0
> > >   CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=3D80
> > >   CONFIG_FEATURE_UDHCP_RFC3397=3Dy
> > >   CONFIG_FEATURE_UDHCP_8021Q=3Dy
> > > -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-b -R -O search"
> > > +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-b -R -O search -O staticroute=
s"
> > >   #
> > >   # Print Utilities
> > > --=20
> > > 1.8.3.1
> > >=20
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


--=20
/"\ ASCII RIBBON | =C2=BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=C2=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--hwvH6HDNit2nSK4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmJ6FmsACgkQNK3NAHIh
XMZvEA//d+B5x7eSCp5Ums9SWWJSRcC2mzkuBTqFj1Vp2klkeeX34EQ5EyLGr9uL
/E5RqKX5BKQdCTBDsejgumHD1ykfNZIdSxtExxsXb651OHz3i1S/4k/KYabpJkwW
5R4cKjnBtmwgxOsFAlZeq6WrQfxetQ4dX1aTAluBYy78GNE96gVYcjZljFTIyqlf
9by0momNVGsCLhOHRQYHwezaV7qx0NGMvu5JTsUFTfI1B2xymuycvt/7vo5iVYjk
xivYJDUzC1JOihqGRlgVIBNtLr6s7rzFSaMM997EcRjn9qplqcXVlLubE/Z6PUi1
qYv2eYrG1NfDk0sgkJjSwCguh4S5WoeNWhWSU1EWM/HYFakixMD3NzP5lxSjmMDV
AFn7QlvgwiBCfxk7Nm0JvllaDsHTY6mKTEpnlQVHi15XtHRTPdcM6yihvwCXa/Td
1cP3Wg1istkVeNONG2K+jl5vBKU0Wq8E3w/pWPM60oXuCWV86FLKaWDInq3q3emV
Oil6NUTUtWQSx6HYGcyH0Un34Zx1kL0qv4+97ZiC0TdMzNkyPEOigiovW2lA55Xs
z2pBdc693mtg2Q0zTfF8+ZV9e9b6PHI6uJwqDl3jnLyloIBbwA20QKpGKLCydQW7
XNfGrunzBqzPmW++aMrSqrjrQig42tqdFXnjC+8H0gwAxo6h1l4=
=ffii
-----END PGP SIGNATURE-----

--hwvH6HDNit2nSK4j--

--===============5856517032851779328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5856517032851779328==--
