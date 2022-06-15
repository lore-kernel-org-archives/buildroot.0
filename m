Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0851DC43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 10:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7149F40BA1;
	Wed, 15 Jun 2022 10:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TXLFCebTU1d1; Wed, 15 Jun 2022 10:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5691440489;
	Wed, 15 Jun 2022 10:32:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8A031BF5A8
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 10:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE8B240489
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 10:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJEUFlowSMZp for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 10:32:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DAB84017A
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 10:32:10 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.41.38]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MUD7D-1oAX8Y0lhz-00RF1g; Wed, 15 Jun 2022 12:32:05 +0200
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <post@lespocky.de>)
 id 1o1QJc-0008M5-7C; Wed, 15 Jun 2022 12:32:03 +0200
Date: Wed, 15 Jun 2022 12:31:59 +0200
From: Alexander Dahl <post@lespocky.de>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220615103158.GC12610@falbala.internal.home.lespocky.de>
Mail-Followup-To: Arnout Vandecappelle <arnout@mind.be>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Jens-Christoph Brendel <jens-christoph.brendel@computec.de>
References: <8c2fc8d9-5bc7-1982-35ed-1fc31e1bb470@mind.be>
MIME-Version: 1.0
In-Reply-To: <8c2fc8d9-5bc7-1982-35ed-1fc31e1bb470@mind.be>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scan-Signature: b85a8e66e101ac701f0f4b979a7f64e0
X-Provags-ID: V03:K1:4hzi9kUjitEk0QNqqE8w1hPIQd6bKSWlYlZfqt4P/OH4NZZY3B/
 rJRFVcVO66Vo/Xv3Dq3iwmp5qubvAf58T9fKaSbEvCQ+Lpwl0VGkS2l/HxCAGhoHpEbJmWM
 CXmuHfFWtampoc53rlMXbLehUg8vMSJctt9rh2LhoCqG2tGmfbn3d7OqIqrjHvakVsMp/LM
 H43jDVaJ6Ij8DYbhGGebw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t660wYIxjCI=:03RXNLMtxAlWN0oj4QtBj8
 2tDDMwtXWCcfZguSsVtuiuk2XIkGzwqBYEgGKHswBo09yOyMgI/bcSro89iStZY+lI3nGeEq2
 SgIGiWKpkQ8SklNFonU7hZlvz0vSERuNXF8mXTLZQuLEOgh/xWiXt66kWS99RV/m2aVVoNn5w
 wbFnV0+88fndddgPbrMZzuS3bYfMt6elqhUgxUf38c5v0EY67YBNOtll0bAvKdwSTZNzgpZx1
 j1bxsuIBuRp664pz7CBeGJxspIYSFy0/KloIFFX4JJAk4JiqXRPwlU9KWDZI+e13dgPoDh4mW
 XnelAkMQUYhCvksEfWhChzelkjMex5hzWP4cM6hxUsf/3Sq4DpSGOHHfRr8xIoqw1OhPFZiSN
 xyY5ZfBbxUih5qNC7qlSCbJjJLlYZfI9nja3IOdC1gmSamPDGhbcP3cla6Wjl63dXzVsYnHce
 lQn77Jo3r1Cem6dngVO5D0nNtM2bnj2vR30sJPyVwLdlw5spTbiUu4dYB4cUaptySPTXI9RhP
 b3arWDCQhAymQ/HXhmT+6Hl4UhSvhseQJejpkV7N5Ar+Unx5jVVfWOffTXqCnKthc5/sxSssS
 wCmKkllY14XUevi+2Zqg8DFkR4azxs8AbhY83hqz4d13ysQdXMBCT6hDHy+EhtiI9don9s/KJ
 00KNF9Gv7f3X7RsqkfRYe+lXMX1D2KmgVxtWD/354WUjCG8/rDjYsTmIxkAp/ZpcplQlsD8ch
 bLQMzTiYI48gODkGFBAT6zEhpek5uxm9HUX7TA==
Subject: Re: [Buildroot] Article for the German Linux magazine
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
Cc: Jens-Christoph Brendel <jens-christoph.brendel@computec.de>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2460101126434022736=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2460101126434022736==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hei hei,

On Fri, May 13, 2022 at 10:45:20AM +0200, Arnout Vandecappelle wrote:
> =A0Hi all,
>=20
> =A0About two weeks ago, we got a mail on the list asking for a volunteer =
to
> write an introductory article about Buildroot for the IoT-themed issue of
> the German Linux magazine. I volunteered two rite such an article.
>=20
> =A0I have an outline or rough draft below. It's just bullet points (thoug=
h I
> ended up writing sentences for most of it). I'd like to get feedback on:
>=20
> - Is there anything missing that I should mention in the article?
>=20
> - Is there something in here which is incorrect?
>=20
> - Is there something here that we actually don't want to draw attention t=
o?
>=20
> =A0Please *do not* pay attention to style or spelling or little details t=
hat
> are missing.
>=20
>=20
> =A0Thank you for your help!
>=20
>=20
> =A0Regards,
> =A0Arnout
>=20
>=20
> Buildroot for IoT
>=20
> For IoT distro is important:
> - getting a basic system up and running quickly;
> - small footprint (sometimes only 64MB of flash)
> - control over what you build;
> - support for all major cloud services
> - easy integration of own components;
> - attention for security issues.
>=20
> Buildroot is a build system that grew out of uClinux and busybox, so with=
 a
> focus on very small systems.
> Meanwhile, it supports all kinds of different use cases, ranging from
> (still) systems with only a few MB of flash, over docker images for cloud
> deployments, to complex systems with a graphical stack, database, etc.
> The principles of Buildroot are
> - simplicity;
> - flexibility to build exactly the system you want;
> - reproducibility: if you rebuild the same configuration years later, you
> should get the same result bit-for-bit;
> - maintainability.
>=20
> With Buildroot, you can build a system by choosing which packages you want
> and some other options in a menu system (based on that of the Linux kerne=
l).
> On that basis, Buildroot will download and build the source code of the
> selected packages and compile it into the root file system.
> You can also add your own extra files, for example configuration files or
> your own application.
> To get you started, there are sample configurations for about 230 boards
> that you can buy off-the-shelf, plus about 40 configurations for simulati=
on
> in qemu.
> However, it is easy enough to make your own configuration, as long as you
> know which CPU variant you have and which bootloader and kernel options
> (device tree) to use.
>=20
> In practice, however, you will almost always want to add your own applica=
tion.
> For that, you can generate an SDK that you can use to build the applicati=
on,
> e.g. in an IDE.
> But it is also very easy to create a new package for your application.
> If you use one of the supported build systems (meson, cmake, autotools,
> qmake, waf, cargo, go, python, rebar), a few lines are usually enough.
>=20
> Apart from the flexibility of the choice of packages (e.g. 4 different in=
it
> systems, 3 different C libraries, 15 different root file systems, more th=
an
> 10 different web servers or web frameworks), the flexibility is mainly in
> the possibilities to modify the root file system, to add configuration
> files, etc. Because of the large amount of freedom, the choice of packages
> is often limited to a few lines. However, with so much freedom, there is =
no
> standard way to implement some common use cases, e.g., readonly root file
> system with a separate partition for persistence, or a verified boot proc=
ess
> with hardware TPM. It is possible to implement all these things, but you
> have to figure out how.
>=20
> There are some projects that use buildroot to build a more managed (and t=
hus
> less flexible) "distro": SkiffOS, dahliaOS, Batocera Linux, Home Assistant
> Operating System.

fli4l [1] is also using buildroot, but development has stalled in the
last two years after we could not do on site meetings anymore. :-/

Greets
Alex

[1] http://www.fli4l.de/en/home/whats-that-fli4l/

>=20
> For security issues, buildroot has a system that automatically detects CV=
Es.
> The list of packages is updated weekly on
> http://autobuild.buildroot.net/stats/master.html. A mail is also sent to =
the
> people who signed up as developers for the package.
> In addition, Buildroot offers the classical global hardening options: sta=
ck
> smashing protection, PIC/PIE, RELRO, buffer overflow detection.
>=20
> Internally, Buildroot uses GNU make to drive the build, supported by shell
> scripts and some C code (mostly copied and adapted from elsewhere).
> The infrastructure consists of about 5000 lines GNU make, 5000 lines shell
> scripts, and 20000 lines C code (mainly for the Kconfig infrastructure). =
The
> make code is not so easy to understand (because make is a strange languag=
e),
> but it is still manageable. Moreover, adjustments to the core code are
> rarely needed - most evolution is in the packages themselves.
>=20
> Buildroot is maintained by volunteers. There are 4 maintainers, i.e. peop=
le
> with commit access. However, the biggest contribution is made by about 100
> other people who add about 1500 changesets each release. Releases are made
> every 3 months (20XX.02, 20XX.05, 20XX.08, 20XX.11). The last month of a
> cycle is a stability phase where only fixes are applied - but new evoluti=
ons
> still end up in the 'next' branch. Twice a year there is a developer
> meeting, although due to the known circumstances this has not taken place
> since February 2020. The community is mainly on the mailing list
> (lists.buildroot.org) and on IRC (#buildroot on OFTC).
>=20
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

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmKptRoACgkQNK3NAHIh
XMa/Pw/8C3IQRksajAe9OTVpftU/UdCDX3h1JPO8TF6xSMXFvt61pJYWbrCfKg0i
7e7NzGp4Tk1cwFKtWYNT5COHW+v9XOVhSa1utqdYATMIbXinyfZaaJr16CBPTRC/
yV5dhSORNt27JNEi8yb3czQUgQUEQ3zFnGXuvykUkASELugfPS6jyr5LuGbCfkGL
1CFk8a51MUCbIZrTsqTYDuwPdIj37CiNcTRFhWyPDuFjihHOGKDuXBBq5YdMWufj
ujXbTRJQN999+zuHLEkYd4/sktQTwFd0aiZoQVurB0TW/I4WPmSAF4ZLivQo0v10
3KxubjjTgo+iw8P0P3kfkH78n0AJpocZG10FyyCtKseBolWGdWTekqb+YClyKSXE
o8H+QsYsUqhz8EPqMx3qzhtJkInRL8v5vsKGaFcAePcyW3dv1GsKCECJRXEt8nPa
w492e2AhP7pwhdLlQNPF7EHQYIgTSXymXGYeJqT1ncSPFwLICCdOZvi/Vd9qToSh
q/r2iZdn4G1CzzRE4UwX3XN1GH8wY4dHJlMEhMpXYLJHaECMhHQBe02/9KSyl3dh
hTswus67CaNPhFt0YJNNS0EaywVg8KdrargQATq2Df+VOVxomwUqgSls4rZ/lk7L
DPUyUeTYMo7SXrhHYj4f7jFpKoVNSb7TuHvd8JiyeQyy96SZnVc=
=IDDV
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--

--===============2460101126434022736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2460101126434022736==--
