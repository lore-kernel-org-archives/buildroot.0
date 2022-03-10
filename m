Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2AFC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 12:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C7861204;
	Thu, 10 Mar 2022 12:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GwGf_T7rv7i4; Thu, 10 Mar 2022 12:11:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B7A061201;
	Thu, 10 Mar 2022 12:11:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9569B1BF414
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 12:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A794053D
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 12:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=parad0x.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5DP2VtCaHHd for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 12:11:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from parad0x.org (parad0x.org [176.31.119.140])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 321004015D
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 12:11:07 +0000 (UTC)
Received: by parad0x.org (Postfix, from userid 1000)
 id B547610341D; Thu, 10 Mar 2022 13:11:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=parad0x.org; s=mail;
 t=1646914265; bh=pj2SVaPgexb4DGuBpT2riuBXElVMqcego7VjTvw8BBQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IMKlTwp6bMeE7HiWg0V4Nv9e9W7SqlbxwBz/fhE/r5otzIXiwpiYUgc4aHd5Sjlbt
 0DAI8RKB6eAnNyxOFScvpZ+AQR2bBgXpdkS1o/o6tt+KId4HW8d/nNGJhn3y8WKcoa
 cTN0QSZGL5uq18d0OXCSpM/HLw9xzwbgW+UsAiA4=
Date: Thu, 10 Mar 2022 13:11:05 +0100
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20220310121105.GB11974@parad0x.org>
References: <20220310101826.GA2353@parad0x.org>
 <34cb1e87c9ff49b897ae79c543278d03@AcuMS.aculab.com>
 <20220310113310.GA9122@parad0x.org>
 <35a9243ae72142ac8380675e9caa0fcf@AcuMS.aculab.com>
MIME-Version: 1.0
In-Reply-To: <35a9243ae72142ac8380675e9caa0fcf@AcuMS.aculab.com>
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
Content-Type: multipart/mixed; boundary="===============6584754155223165461=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6584754155223165461==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 11:52:08AM +0000, David Laight wrote:
> It is worth checking whether Debian have changed the behaviour of dash
> or whether they've just changed the default root shell to dash.

They've switched to the internal fnmatch implementation of dash [1] in
this commit [1]. Before that they were using fnmatch(3) from the
glibc.

[1] https://salsa.debian.org/debian/dash/-/commit/d7b1269eeeb5749ccc577f6e0=
1dfccc2916b0130

--=20
Mathieu Mirmont <mat@parad0x.org>

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJiKerWAAoJENaa1EWGzzIiw0oP/313YTM6w2qeAUcQKrciHtJM
T8FrW5kGBUI7cABouBPptCo0MaX+i+0FwVAehM9JZSCW9bJgp8iyWrPlWZsJpFdv
SMF2sLNh+whoAaKklIGQRY2sI7OU8VgkwIhL5MCkT1kSG5UQMEZpn5qA1OitVUSQ
vMCG03nmP4r7YIjFY0RybPu3bdy56FIOwqWtggygLrDRgfpiwNYtpVhhgdsPuJjP
qjvPExd10m20U12RhV3OkXUaxcnBXQ9lSL5K6w4cP6ozwcKb1KdKV2uPA5Vwu6Py
HuLaBaC0FCzjwrS3bzIMs+BRjFctW9h3QC/kD5ZpO793h6NW3idEY3h9ckUaeCxN
qy0EP20pbT2mS3SItyJXr2AlR27uTk7vH2AQhgLvTmVtHessGsPI1r/pbD4wlARm
RNPFimoICiePXjOR1mpp4iLcXjKg7ad0R4VOhHXy1FyoLCuBVV1vbZ+LgZoN4vJQ
3oOtX6UkfDYi+4ihp5BcpmzZIiL6m6xTbZDdTdHKNXWEA0jHII+qnvosXnB6jOSM
1kFqi7y5X7AyWRsYmd8RCcn0UpvK0+2Wyv6mVWGhWfi/03dVcVLimCsoQCn+zY03
iBue/s9aPcfBS2kW/d7MJ+nArY5fbjPzy3YFDCnm7Ut1mN5teC+qggX6RLzGOWzh
uyxx3idbvXm57gZb5fJB
=yKoe
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--

--===============6584754155223165461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6584754155223165461==--
