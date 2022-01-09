Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06742C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 00:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F18882591;
	Mon, 10 Jan 2022 00:29:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lWDE2_9TyqWf; Mon, 10 Jan 2022 00:29:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEFE382572;
	Mon, 10 Jan 2022 00:29:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 987921BF977
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 00:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 941CB60BC1
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 00:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lH5qbCbxKKfS for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 00:29:08 +0000 (UTC)
X-Greylist: delayed 00:36:38 by SQLgrey-1.8.0
Received: from cache12.mydevil.net (cache12.mydevil.net [128.204.216.223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1935860A75
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 00:29:07 +0000 (UTC)
Date: Mon, 10 Jan 2022 00:52:22 +0100
From: michal.lyszczek@bofc.pl
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220109235222.ylomtonoeuzcak2c@marchewa.kurwinet.pl>
References: <20220109110555.3789-1-nolange79@gmail.com>
 <f78e9576-5626-dbe4-b61b-7cd8f4a6b779@mind.be>
MIME-Version: 1.0
In-Reply-To: <f78e9576-5626-dbe4-b61b-7cd8f4a6b779@mind.be>
X-System-Sender: michal.lyszczek@bofc.pl
X-System-UID: 1039
Subject: Re: [Buildroot] [PATCH v2] package/openrc: add patch to create
 /run/lock/subsys
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
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1276623001179882135=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1276623001179882135==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o7m3po7bzznytrat"
Content-Disposition: inline


--o7m3po7bzznytrat
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022-01-09 14:12:16, Arnout Vandecappelle wrote:
>=20
>=20
> On 09/01/2022 12:05, Norbert Lange wrote:
> > Together with changes to sysv/busybox init, this directory
> > will already exist on all init systems before any service
> > scripts are run.
> >=20
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>=20
>  Applied to master, thanks.
>=20
>  Normally we require patches to be upstreamed first, but there are already
> plenty of other patches that haven't been sent upstream. It could also be=
 a
> bit buildroot-specific (though I think the subsys is there because some
> packages actually use that directory).
>=20
>  Still, Micha=C5=82, do you think this patch would be acceptable upstream?
> Obviously not in its current form since upstream has group uucp rather th=
an
> daemon.


I think it won't be accepted by upstream. Seems that openrc does
not use /var/lock/subsys anywhere, nor does Gentoo. I also think that
/var/lock/susbsys is used mainly by redhat/rpm packages with plain
rc.d scripts. So in that case this rather seem like buildroot specific
change and is not really related to openrc, thus I don't see why
openrc would commit this patch.

But bear in mind, I am not a Gentoo nor openrc developer, so that
might not be true.

--o7m3po7bzznytrat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEE75TheM5OqeB/xDzA/x6/5+OpdLEFAmHbdTYACgkQ/x6/5+Op
dLFxwgf+Ny3Y8Ea00EzV35bRWlBk7TCnQYYLmxPar+ZpDEokfFznm0XYIXahAVV3
6KQ9UsN0yb0FznRO6RnDc8FEHiTkRPJFDwPvIYbtBXLX2ilTzLZ8aDNCDGsKyrV/
Dl/5bw4oEl3a9jWt6EZc6U+6ia8f3JIVaTOeCUYaVo4rsa16guiK1o9f+XATnqQ0
+r14AX4Jw3uXOzE0SxU20fehqSL/1SggxtH4iB2c1AOLYq9V31H5C9nMJCOopTeW
Tvv3g+KNumHwIZZh6W5x6KhcklUS0VHo/vmivC9/8eo+LODcHygydrE2nYNdPReB
A7iC5VTMBScbdfhRXucqSfLfIampXg==
=YxFb
-----END PGP SIGNATURE-----

--o7m3po7bzznytrat--

--===============1276623001179882135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1276623001179882135==--
