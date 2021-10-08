Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADDFC433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 16:59:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A418760F6D
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 16:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A418760F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E6C460733;
	Fri,  8 Oct 2021 16:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NCHMEMhx_uFe; Fri,  8 Oct 2021 16:59:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9D7660788;
	Fri,  8 Oct 2021 16:58:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10A2F1BF489
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 16:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBF114052F
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 16:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gib5ZBvQINlC for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 16:58:56 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EBA740192
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 16:58:56 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.61.127]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N5n3t-1mp8Of29n9-017DQ3; Fri, 08 Oct 2021 18:53:46 +0200
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <post@lespocky.de>)
 id 1mYt7v-00043j-BN; Fri, 08 Oct 2021 18:53:44 +0200
Date: Fri, 8 Oct 2021 18:53:39 +0200
From: Alexander Dahl <post@lespocky.de>
To: "Walter, Stefan" <stefan.walter@iml.fraunhofer.de>
Message-ID: <20211008165338.45kboyxbx6v33mvh@falbala.internal.home.lespocky.de>
Mail-Followup-To: "Walter, Stefan" <stefan.walter@iml.fraunhofer.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: 9f5b2199e4483c1fbb1603fea470fc05
X-Provags-ID: V03:K1:S8Aa1Mvb0H9B7Cr75bSqnDop/LiOZNr79wkn6GQ7afV4Ads0S11
 ubxMIvhIIm7pVX33zX8H+FAJaa7/jhbSuuY9PDRrGpgr/kUksYf7iUO5ZBybTPGaDiewz6U
 lvL9KxKEvLO7zfwmNCkIcE+A24QipOrfvkyzzfaV69TLtfx4x+c8LJOk8fyphQz4NEhfI9M
 IbJEIxtmb3BBzHLzSh8Kw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LD3Qocdh3Dc=:mH/z5e3JWI8xwwkiFwDjhm
 16YUdyjd63Wi6jzCp5/LRQG3Lcj3stWjRAp58XknFyq6Rv2WPSD6NjUCFMiGM3fRl56sMyc5N
 wYszUG/bwTWD2k/6KSArA3kwRxegkrQ5DqFZW59tQ8doovmaodPQs0vflc5BzRW+J1Lf2CBj8
 lx+Sp1aYaAhBelol6NuVZfsbh+iHR7Ltad8GxHN7I6erQ40BS0e6IdqFaOoP5+rjSmadVz+pd
 aqkAH4k7VnSCLA/9CTPRUT4TyLPnlmsZlndEzdIcXufYsy9d1VEvgfivG/ud0XYsCtrH0OTAq
 v7/zrgeRtfrofvhs6/dpGfB0C05El01F6yGp5klxXvmu63nnpPYoZFbhmQc33/d7ru+MTdlTD
 LLoGOstdSBBidk7QcrFMZyw0VbbCTRtR/I7o725JQZ4iXVKF5zU0VoDQb7m9SZ3ffHrBx44bX
 KJVV4pbqXHggmNYFURaXvpUYrqXfRcLDUtRA2BIG+mzZ8xn28uaAeRABlJPsZvuHoKQb8c0cn
 t1AmtsDSxqIFa/GjgJvenNyAYBdWJquPdphioRrdNzELISB5MEgrw2FEp4jeJKmZspVTuuIBx
 4V30jDu25IOPhKB3wC7wjmy0v0WV6rtzGUHI34e4pDhxyLYlAgsI0OktrhwMdJzeAjOxersAz
 TElw+CuCwlFbXRDYx/hNJcLGCHDyUeW8PABJwfS57F+mOuYsDY0MfoWHFEmA3GKZuKq3bEYaI
 GYDsQOSRjQxaL24lprzNQDaIOOQBEvr1XdIFxQ==
Subject: Re: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1251764113916889707=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1251764113916889707==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="udxdiqs2tp4szk3t"
Content-Disposition: inline


--udxdiqs2tp4szk3t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Stefan

On Thu, Oct 07, 2021 at 08:36:07PM +0000, Walter, Stefan wrote:
> the following used to work until Buildroot 2021.02, i.e. the
> resulting image booted normally. Ever since Buildroot 2021.02.1 and
> up until 2021.02.5, the resulting image does not boot any more - the
> boot process either gets stuck right after displaying "GRUB
> loading..", or it reboots at that point, leading to an infinite boot
> loop.

Sounds like should try git bisect between 2021.02 and 2021.02.1 to
identify the commit which broke your setup?

Greets
Alex

> What I'm doing:
>=20
> 1. Run Buildroot to create a root partition image (my_defconfig attached).
> 2. Create a GRUB image like this (grub_early.cfg attached):
>=20
> /path/to/buildroot-sdk/host/bin/grub-mkimage --config=3Dgrub_early.cfg --=
directory=3D/path/to/buildroot-sdk/host/lib/grub/i386-pc -o ./genimage_inpu=
t_tmp/grub_core.img --format=3Di386-pc --prefix=3D=3D/boot/grub biosdisk pa=
rt_msdos ext2 normal linux configfile
>=20
> 3. Create a home partition image like this:
>=20
> MKE2FS_CONFIG=3D/path/to/buildroot-sdk/host/etc/mke2fs.conf /path/to/buil=
droot-sdk/host/sbin/mke2fs -d home_partition_prep/home -j -L home -t ext3 -=
U random -b 4096 ./genimage_input_tmp/home.ext3 25M
>=20
> 4. Create a disk image like this (genimage.cfg attached):
>=20
> /path/to/buildroot-sdk/host/bin/genimage --loglevel=3D1 --config=3Dgenima=
ge.cfg --inputpath=3D./genimage_input_tmp --outputpath=3Dimages --rootpath=
=3Dhome_partition_prep --tmppath=3D./genimage_tmp --tune2fs=3D/path/to/buil=
droot-sdk/host/usr/sbin/tune2fs --e2fsck=3D/path/to/buildroot-sdk/host/usr/=
sbin/e2fsck
>=20
> Does anyone have any idea what's going wrong here since 2021.02.1?
>=20
> Best regards,
> Stefan




> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--udxdiqs2tp4szk3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmFgd44ACgkQNK3NAHIh
XMblfQ/9FrYwqNhYYLWuYSn696HJu+JPNrbQntIyHFZWyH9ir2+Xn5x/YgDV/5dx
GtqktBuhrPndqgxKZV/uNblDCJLakZn0QizKs2+fby0ps1z5u3Z34qfslWulYU4V
qu3A3/Dz8O3pP7l11SIL8SLwJ3wJc/tdSSLQ+5bX0mxtxmtBCmfJvIOxXiXr2iN2
IlNfXY78rNvhfpxxq1C8FjO8lYtrO+1kyYvGgY3/okRiw6fdx6WWHBEUdj+i6XIi
mKkRI3vFLyRkTKrPN9Xox23z3b3VcW+AUqWdJTafNZsz+5FpQCU0AlPd8OoJgfjP
JV4oFvGVuI5wBehyzFXJRYKiVmsT162y/7dJLTH0s2gvGJ5p/+p0QF81DoEivaAl
Q1BeFLekQeiSc1I1SMpKQ71elXiBLy1R55h8NSAM3LljY31i1j1n8bchjhtSQzsY
40rWxrRuHUquFV8JFAW/MQFtch7HiH0Hmab0bRlkUBw4AVOI14ggeil4nlIs45zu
B7sln8j9ViDVKvgYkUVvhB53CQ1Y3QahTK4ezmax/YLtPShp3BxwiAXLz4rc2Aym
ar1Gx9tqg00sEoZ4nj5qxTtZ51oK2nBCEL2y5cWqrgmLtwVBGC7YBZdePfbf1ztA
RdS3ut0kzn0aH07cRXvoPYvB4trq533EM4EIa3joLL5aINroNsk=
=jbUM
-----END PGP SIGNATURE-----

--udxdiqs2tp4szk3t--

--===============1251764113916889707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1251764113916889707==--
