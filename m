Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B01C433EF
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 17:09:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C91561284
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 17:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C91561284
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C16AF40501;
	Thu, 11 Nov 2021 17:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-0vqN2ojWih; Thu, 11 Nov 2021 17:08:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29692404ED;
	Thu, 11 Nov 2021 17:08:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AB7E1BF327
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 17:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59AFE606D6
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 17:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sFc2aeiFXgmM for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 17:08:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B8FB605BD
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 17:08:54 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.59.63]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M1INQ-1mjYbp3rcQ-002myK; Thu, 11 Nov 2021 18:08:52 +0100
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <post@lespocky.de>)
 id 1mlDZB-0000ls-4W; Thu, 11 Nov 2021 18:08:50 +0100
Date: Thu, 11 Nov 2021 18:08:48 +0100
From: Alexander Dahl <post@lespocky.de>
To: Anton Kornilevsky <kornilevsky@cato-gmbh.de>
Message-ID: <20211111170847.jkvvxcjxvoreh7ac@falbala.internal.home.lespocky.de>
Mail-Followup-To: Anton Kornilevsky <kornilevsky@cato-gmbh.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <c73dab514fed4b4caa7ed80739fcc029@WINHEXBEEU126.win.mail>
MIME-Version: 1.0
In-Reply-To: <c73dab514fed4b4caa7ed80739fcc029@WINHEXBEEU126.win.mail>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: 7af19da85ad859a41b3be88a3c47722c
X-Provags-ID: V03:K1:yRg2+A+napNlmld9HtXbkJHxdKVI9tC4bWZnkv4FwSpbusUN7cn
 O+6IpVYSBJqHpQ3pD1BjtNqIDQTVyS3Gw7lMDmmF8NImfvQVw+3wmxaRuGa+tbmI5V+Dq4/
 4wJrkC9XD/ID1OxEvwNoAOJ/LqTSy4gySp5ZkemIPDQ5Yu9FLbL9wuVh1OTWRnlf90GQHpy
 48xgreE0JSE1hKqNbGpyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6zn3FG+WRMs=:vsNgbN4aoTUclO1yVNjyFo
 xfJEg9qkcIqeMRCSFLdxVJQlnZXJt/Z+nKlXCsVx14ncWLz3PM85S+RrxiutRikkr/UHbJJn4
 uJ9yocspdBBfKNB+Ktq1bVzIrL/CiitoJT2MCF01aJAfp5cAuX7aL08K5F/oFg7ETgl24wd45
 DOm5B5WaXmpXk6TnuOAOQgPr8dA1BFKZb9EW6i+PkONSw+/GGq5X6iRlo76EkQ/7NHBVIRwRV
 j73azJKiNhEnXpfY6rRXVTyvuNk0BO7w2724F17QrdsnaxEEROrxkQ3GphuQKtAGWUtbbAfJC
 ufB2GFT4xmW5H5rEsgawHt8ZNgGBLoS/oXcaGFO0uq16k1+tQi0u2wKzVW5ZSu7uxjV+kuGUb
 Lpd4w0Elmv9f/eoyZS5kVqMxtHyg1E/MFu9vdbMKX5qP0fwlsNRtz5DR5867dD8n9eqrgdb1B
 Z9wRQZil9LZpQggGCl6s82c7UwvQvp29i3J+HVH4b8EtYKnqfXpeW/G+7qDjBEdQmB4iqkzGt
 /E46lII++/1MBg2VdLcMYiHUD8/I9WU0DRCjkiPGZjyBXCJAhZpptCGC8nO5s30xwdVop6ER9
 o8fLGmMpbUvIwk34unTV4i6JkFbRcwUhDU6/I8iArz9tOIFbJ5JHx/MC0wWaqojZv2qClg0zU
 yvp01CvyhabwPSu6S7TyIT0N9SQRNsLuzlOyIf65PjrdGNP0PUpOEGokp13efk/eXD64=
Subject: Re: [Buildroot] Adding support to a variant of an already supported
 MCU
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
Content-Type: multipart/mixed; boundary="===============8086239906455646231=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8086239906455646231==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5aax7khaxo4zf6o6"
Content-Disposition: inline


--5aax7khaxo4zf6o6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hei hei,

On Thu, Nov 11, 2021 at 02:39:00PM +0000, Anton Kornilevsky wrote:
> I have been tasked with rebuilding a linux kernal for a board that
> is using the AT91SAM9261 MCU.

Which is still supported by recent Linux Kernel AFAIK.

> The buildroot support for this MCU has been dropped sometimes back in 201=
5,=20

Can you point to some actual commits?

> and I was unable to rebuild the kernal using the last supported
> version of buildroot, due to an error related to the integrity of
> the zipfile containing the sam-ba utility. I seems like the older
> sam-ba utility versions are no longer to be found on microchips
> servers.

I might have those lying around somewhere, but you don't need those
for running on the target anyways, do you?

> How would one go about adding support to a variant of an MCU that is
> already supported by Buildroot? Is this even possible?

I just looked briefly over the defconfigs in buildroot's 'configs'
folder and at91sam9g20dfc_defconfig and at91sam9260eknf_defconfig
should be from the same at91 family. That should be a good start to
come up with a toolchain at least?

For building a recent kernel, at91_dt_defconfig in kernel tree should
give you a starting point?

Good luck!
Alex

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--5aax7khaxo4zf6o6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmGNThwACgkQNK3NAHIh
XMZWExAAukdhXGib7QHpVCq9SRwVUhBv9UqWU6jhxA3OSbqX2mssMFfUYKFTOuB9
Gd1IuX74UzLINWDyQ9UsRq+tQo/XE8CfHkxPABIiMUBgG02O1qNI+3drX3mmFaww
nmZSFzvf/R3gjRdQc7ziHve1vD435VN2J5qH16REcGGNyNZLc9p0Le9XVbf/4HYb
U7eH8P8vBdyoPYuWqz+GNoeVQ254vbpha+YJ3ExegGzStvpOlYBVYAPGa+R9fKMC
alvFuOz8BYoMhmGxfkKy7Prqw/k/yqILkH90wJlBwGt13g6IfMMTMhVdqRtGrviY
CUaQGgAj24PR+HxYo20bdZ8ILltcuJuuzFocWp+tpv5copb7EClvE/JUiI5LZHwO
YJADWSGXltEWD53G5KpBaSq5/gBd8jzFU1ojga4Ektt/64lCarXgjzLp+py01Y5O
E/kjKzT+23eXTDP1cybHUjLWPdHCIWd5IS/tupEmuNwdtdYF5t0nAMV+0rz4nQ2Y
qDuIxbZY30KCUKpDLK/RVpoRMGmEI1tnWAfDDPwq20RznEF1PbcmpKpZ6WAXu4oa
nC4ssq5ZpiVwKiiQYTFaGt+4LzeJPX4Ugr6Y2gx62+sFI0l6Kh33pbXwsDGReLWt
G+dFlY/TX1yTWz655PXUrooPJWUmzKBVo4GAsgztN+3MdkLJkJ4=
=iZiT
-----END PGP SIGNATURE-----

--5aax7khaxo4zf6o6--

--===============8086239906455646231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8086239906455646231==--
