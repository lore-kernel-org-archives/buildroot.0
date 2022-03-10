Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0D9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 11:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C880F40B44;
	Thu, 10 Mar 2022 11:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eGmJFIcDt5fT; Thu, 10 Mar 2022 11:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B86C540B17;
	Thu, 10 Mar 2022 11:33:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0DE1BF868
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77C9E611EB
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=parad0x.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SsLZj4MCxCao for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 11:33:13 +0000 (UTC)
X-Greylist: delayed 01:14:45 by SQLgrey-1.8.0
Received: from parad0x.org (parad0x.org [IPv6:2001:41d0:8:3e8c::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47533611EA
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 11:33:13 +0000 (UTC)
Received: by parad0x.org (Postfix, from userid 1000)
 id 196F910304A; Thu, 10 Mar 2022 12:33:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=parad0x.org; s=mail;
 t=1646911991; bh=/JjAKV+qK3peQyOXOco47eOL3qA1X9wtcURWWnO8DXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fbS1CeTGcS9kJlZmKdJZJ8MxQ0X7uFIwz2uLMreFx2FgGW8zVL8LgsqQmU73wctaa
 YWR9794CSW2HFiZtlQwagLeGZcfm9bO1K4Eyclp/ZlP2EhdCjQEhG5aEHkj6ObzRKU
 ep0UoSUMDQlwWNynFHr0W1EHb08yQQMIdokgyW/o=
Date: Thu, 10 Mar 2022 12:33:11 +0100
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20220310113310.GA9122@parad0x.org>
References: <20220310101826.GA2353@parad0x.org>
 <34cb1e87c9ff49b897ae79c543278d03@AcuMS.aculab.com>
MIME-Version: 1.0
In-Reply-To: <34cb1e87c9ff49b897ae79c543278d03@AcuMS.aculab.com>
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
From: Mat via buildroot <buildroot@buildroot.org>
Reply-To: Mat <mat@parad0x.org>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2743866387031558706=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2743866387031558706==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 10:45:41AM +0000, David Laight wrote:
> From: Mathieu Mirmont
> > Sent: 10 March 2022 10:18
> >=20
> > Different shells can have different behaviours when it comes to
> > globbing patterns. The dash shell (/bin/sh) on Debian testing switched
> > to a different fnmatch/glob implementation that results in this new
> > behaviour:
> >=20
> > Using bash:
> > $ mkdir /tmp/foo
> > $ echo /tmp/foo/.[^.]*
> > /tmp/foo/.[^.]*
> >=20
> > Using dash:
> > $ mkdir /tmp/foo
> > $ echo /tmp/foo/.[^.]*
> > /tmp/foo/..
>=20
> That is just broken.
> Does the [^x] pattern work at all?
>
> Raise a bug on 'Debian testing' hopefully they'll
> fix it before it actually gets released anywhere.

The new behaviour of dash is very strange indeed, but also according
to POSIX the wildcard pattern [^x] is undefined so we should not rely
on it.

--=20
Mat <mat@parad0x.org>

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJiKeH0AAoJENaa1EWGzzIiQHwQALA7+Dl/Q42tA13chpEw5CWy
eYX5vVvFrCi20inT+Re5un5OXP3Lx6weC8LEJ77dJiacoa3F39ND4mSWX6acL79i
rHVnpOILylYWcGdWBKpyPpppQKHDaEmmiH7l84Z9e4wUY6GbOL7AgJTfB5MUcE7F
HtAEppEAcc4yoqc/aHG7RMuLjm6BXaIzI/JvYWQoS1Qfj47XmYSV8OlHjrdvhAOe
moFuSSoI6iqwlM0fyudaYr8d60r15ckZH/LAzh2+T3N0MQYEXLcbaGmcBZb38S/q
YeI/vgcItAsd/SyFrXHhMPKV4U1fajLVwrkQ/TZaksT1xIB3S6FwdbDv1/vBrFD5
I+J826bTcDvYC5u0JuM5gBE6s44PI+AmyWPK6Vz66CUmXDDqOdodBmk3Krfro+bH
vSbcNzasDNmjfYBpWdd1t+GJTqS1s/4dL0DPmOba/CN4fO/EBEnql/yD/FbpamKB
cPZQUKEu5U/tHSvBEPEkdP5C8h12B4ZXOoJ85mLLfUCKB2QHbGDRfMTkGzmVw5tS
+XB1R32PapsawAIz6Tjk2K86trjEMIbLA0XLNaZMLjeCUzq5x01E0/OgQfB00+FW
8hzUlaE11kYKj5kk99vzCAOQHlTk0EkGfq7auPBsNWGU9G/k0mlMq+OzGsAPYuSi
/HB7jHsSJrCzDxxRWkCA
=AuRs
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--

--===============2743866387031558706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2743866387031558706==--
