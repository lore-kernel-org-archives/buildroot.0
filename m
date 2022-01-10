Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5953C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 12:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EC6340906;
	Mon, 10 Jan 2022 12:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZL4N7CCwmu6V; Mon, 10 Jan 2022 12:23:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 918DB4038C;
	Mon, 10 Jan 2022 12:23:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE7A81BF275
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 12:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B136827BB
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 12:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gj9WQuu61seE for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 12:23:23 +0000 (UTC)
X-Greylist: delayed 00:05:21 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A447081A27
 for <buildroot@busybox.net>; Mon, 10 Jan 2022 12:23:21 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.37.181]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MEVBc-1n9dRU3GCg-00Fy68; Mon, 10 Jan 2022 13:17:26 +0100
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <post@lespocky.de>)
 id 1n6tc1-0000yo-EF; Mon, 10 Jan 2022 13:17:22 +0100
Date: Mon, 10 Jan 2022 13:17:16 +0100
From: Alexander Dahl <post@lespocky.de>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <20220110121715.GA6032@falbala.internal.home.lespocky.de>
Mail-Followup-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 "Robbat (Gentoo)" <robbat2@gentoo.org>, embedded@gentoo.org,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Pascal Bellard (SliTaz)" <pascal.bellard@slitaz.org>,
 =?iso-8859-1?Q?Llu=EDs_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 Richard Weinberger <richard@nod.at>
References: <c31dba4f-42a8-ba48-7df2-b56bf4699a4c@sigma-star.at>
MIME-Version: 1.0
In-Reply-To: <c31dba4f-42a8-ba48-7df2-b56bf4699a4c@sigma-star.at>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scan-Signature: cfc1030892414ad8b9e614439ac53396
X-Provags-ID: V03:K1:2K4C7oUIkOL9cDS8fngW0GAotIjoim3o0J/mZ5Gw224CGGSJW1a
 3bUyEsLpTUjPmI2Ge3eCxTY9jXEY3cMOE0pcHFMeZPjHn8Xb3J2SDkjpbjn5EbpoTpoj5cC
 oeTY4HcHq15z5t/9uoDBQcpH3FsPQVdgYddjSYiUs7+/rRKAIXtc11Cj6KK8lNqKbtWHpse
 yQa+LwerXFgAsxa1UfC8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O4XXN90x60k=:GFSZA9sA9KV5zCBt3BlthI
 rlI46jSj+cWPlPq987P6gqX5o9Op7qTR/gmv+61t+W0KQPatuMyTf3UmAR1aVo1Qmd3BqbDVf
 1Ii17UsvFkKTcSeNKMDiVcj/1Xfe3p0IgmVoLdszscD0xmorv58tN8FwwZbBzEoD4JHuLfvo1
 XoHzMGQsibVR6JHilGrz+bxx5iX+4HkNjOYP+ZZZ8HCj/XAKdyGCFWGufDwybbrIDFiZ76PVT
 JWOe9icFWNt6/uaQcYRtqK+34coP55wsP5l4PTrAu2sxhgH9vakcYoQY3115qm9yWZT0ML/D1
 8VNV8QXX5piRB2bDdsN7q/T2UALXUZ56D5IgvDzsVsmNTFtgZx0/1ZzYqkzxRfB7K0c/9nWsw
 RPJS8R2YGdnJ+9PvorUUFt52m5QLNawYuyx3rhtq78hAxKjL1/wWbJD+sXJsVlpHq+6S+6jKc
 H7w2WIrKmjigoR1phHPGyJP77dYDvjoZm0TxdSA/wjpW9jlA/fDahNAlJEgVPRNASqyh71sJm
 1ZFt0kM+kb3T6+hOnMEySaX3HDgZPA4MOrWD8urXvb5bOwTaTR1GV8q7SXYRuXav+prv5Ug9h
 F9LXF5Tgq/bKGZ9zr74tiDqUrjtpbyiD/V/7t8OfQBRenG/tzVGPmEeC8pfdWadeFj0uGutMm
 EfddCNH17G751Qmw2EbcxWKqiusBCdDyAuTDbkstrad/7YE3NpoDE+FKOuyPA6l80pbY=
Subject: Re: [Buildroot] [ANNOUNCE] mtd-utils-2.1.4 is released
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
Cc: "Sergey Bolshakov \(ALT Linux\)" <sbolshakov@altlinux.org>,
 "Pascal Bleser \(SUSE\)" <pascal.bleser@opensuse.org>,
 "Levente Polyak \(Arch\)" <anthraxx@archlinux.org>,
 "Oliver Schinagl \(Alpine\)" <oliver@schinagl.nl>, embedded@gentoo.org,
 "Riku Voipio \(Debian\)" <riku.voipio@linaro.org>,
 =?iso-8859-1?Q?Llu=EDs_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 "Orphaned \(Void Linux\)" <orphan@voidlinux.org>,
 "Robbat \(Gentoo\)" <robbat2@gentoo.org>,
 MTD Mailing List <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer \(Fedora\)" <jwboyer@gmail.com>,
 "Pascal Bellard \(SliTaz\)" <pascal.bellard@slitaz.org>
Content-Type: multipart/mixed; boundary="===============5938466189839646918=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5938466189839646918==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello David,

On Fri, Jan 07, 2022 at 03:24:59AM +0000, David Oberhollenzer wrote:
> mtd-utils-2.1.4 is released.
>=20
> Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.=
1.4.tar.bz2
> Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.=
1.4.tar.bz2.asc
> Signed git tag:        git://git.infradead.org/mtd-utils.git v2.1.4
>=20
> Alternatively also mirrored here:
>=20
> Tarball:               https://infraroot.at/pub/mtd/mtd-utils-2.1.4.tar.b=
z2
> Tarball gpg signature: https://infraroot.at/pub/mtd/mtd-utils-2.1.4.tar.b=
z2.asc
> Signed git tag:        https://git.infraroot.at/mtd-utils.git v2.1.4

I tried to verify the gpg signature, but I could not find a public
key. At https://keys.openpgp.org/ you only get a not working key:

    gpg: key BCE5DC3C741A02D1: new key but contains no user ID - skipped

I also searched at http://www.linux-mtd.infradead.org/index.html and
could not find a key, could you please point us to a recent version?

Greets
Alex

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmHcI8cACgkQNK3NAHIh
XMavFg//UIYGWw6LHjB3Z5KJYe9FKzLHp6NEKdk6pXmeUIuxufVKsfdS7nLPwsFP
2hrli88DJG+ItYUl7bFyROEePNafSlAJiAXTAXoI5G0dCNz8TtnWZl7f9awayowf
d5H+nlL6VeIa1fRE/z7MVIiQimmNYHnF2cCTauHmyaK+F41zOrqnlk9VvVebtCp2
w4yB7RwCTiIRXSrAlaHeS2CRRz/bsUX4MjwL7uED0Z5y3fWRqYhJszju4Zp68JBM
4LaNLmGSKll1Hmjk8FVIG4oHJFgMyZoLxwNA08xbiT8ynk4eXgaIKIRvs0KgKYAJ
gcpnHbEw2TNqOJ/lis79z9wKgvMYKx5335pCnD0BD8acfO9s9v6PvxZkHVczj52Y
xW2OBOcHMwjTw4PzNX0BsM7IAQ0TOL2YGpLkgHGotqQPM8f1EKXa3812FDxYhBCD
4WPHI8hWQABnweSCIRUq8/4AZPUZPL/Ui+PqdAnjmZo2oHT8joCLYyhdxvJO8oB7
at1O1Cdct9nPelGwLVaFMUdJQtxVDgzNqiTAENG92Hu3cREDmJ+dqG1uTnZ6Tb3X
PxNWvvZ7QQU35mLiUqN19ERtOuAYbyNUBWL2pzkQ50d8DCAJBegB2kp7kjvzhLXz
VyWjYr831/bObUkdGBqU0O4EZ1/j4SYM4Hfdl0fxO9xFkq6BxzY=
=eEe8
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--

--===============5938466189839646918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5938466189839646918==--
