Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886D6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 242CC83EB7;
	Thu, 17 Feb 2022 15:27:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sBAZ2f4WTKVr; Thu, 17 Feb 2022 15:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 512AE83E87;
	Thu, 17 Feb 2022 15:27:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6671D1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50D5D4023B
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:27:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30rqdLkoPPiI for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:27:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 202D240227
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:27:14 +0000 (UTC)
Received: from smtpclient.apple ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPA
 id KiganHUSjiF0aKigbnrhyh; Thu, 17 Feb 2022 16:27:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645111633; bh=4YzUULgvOT1BPYDt9vteDb30t+mFiFTZqtTecp7D53c=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=gliw3fF8iigEjUukC6UwU5CPm52T5+wvBkP325Hku5glsKmG43VQdLEjW/SNypmTS
 WQv3Evxjh20+aFBQB2VnGLRO7+QFc5oYMkGDT0TSI0t+/uwezVxCQa0qfgwVbkEs7S
 e3yDoqzQMdEQPmEYY6S1RAybksvH7J4nBrB1s/hRzmkB3oaJw3r6rjUYS0OMTFjK14
 UyxsOI8qaFOjB8OWsRZC+dZ4oYtm6bz1OPhrwUPg0FAt7a8bUKAsL3zuiu3Z4no2x2
 qkxssj2a42wRsTfb5YB/H/sMOjACqZk1C0sHoRLPQ6Wrw9N0nvwS7HDXNcGGreKx10
 It68HwiaXYIXQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 17 Feb 2022 16:27:12 +0100
Message-Id: <964BF830-917A-4CFE-A8BE-DD8DCA18A9F8@benettiengineering.com>
References: <20220217151054.865073-3-marcus.hoffmann@othermo.de>
In-Reply-To: <20220217151054.865073-3-marcus.hoffmann@othermo.de>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfGio1cdUh6b8AEdvPpp1VuCgREMW6S8k1HMnm70vZs4qIu2QRAexKU9zQQi5oXyH5XLHKmAQAISf2GcgUQ/qUMxzqk0y4ed64sTdKtH64zgGsl3K3aNz
 8dYx3Xrp8Vkysv4VQoCbqHzS1swnL3E7aZBnzMOiFFs8XTZzEoHi5f56Mti3bw5hFlw/NwVMX8AvRoak8XQaiwvzdIfNmWQaOEBVj+XStMHdYyUNE5pMP/bW
 c4QUsiUvw7uNNuWlK/E5LiRz59hGxe6uFSV/C7qrKn+ZpziwOVqS37gjxBdFeqVE
Subject: Re: [Buildroot] [PATCH 2/2]
 board/orangepi/orangepi-rk3399/genimage: fix partition types for gpt
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6381313146925550589=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6381313146925550589==
Content-Type: multipart/alternative; boundary=Apple-Mail-90D1982A-20A1-489C-91A7-BD2144036BFB
Content-Transfer-Encoding: 7bit


--Apple-Mail-90D1982A-20A1-489C-91A7-BD2144036BFB
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Marcus,

> Il giorno 17 feb 2022, alle ore 16:11, Marcus Hoffmann <marcus.hoffmann@ot=
hermo.de> ha scritto:
>=20
> =EF=BB=BFFixes:
>  ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid
>  for mbr and hybrid partition-table-type

Here you should add:
Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784375

Thank you
Best regards

> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> ---
> board/orangepi/orangepi-rk3399/genimage.cfg | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/board/orangepi/orangepi-rk3399/genimage.cfg b/board/orangepi/=
orangepi-rk3399/genimage.cfg
> index c94e0bc7cc..a02166172f 100644
> --- a/board/orangepi/orangepi-rk3399/genimage.cfg
> +++ b/board/orangepi/orangepi-rk3399/genimage.cfg
> @@ -26,14 +26,13 @@ image sdcard.img {
>    }
>=20
>    partition boot {
> -        partition-type =3D 0xC
> +        partition-type-uuid =3D F
>        bootable =3D "true"
>        image =3D "boot.vfat"
>        offset =3D 16M
>    }
>=20
>    partition rootfs {
> -        partition-type =3D 0x83
>        image =3D "rootfs.ext4"
>    }
> }
> --=20
> 2.25.1
>=20
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-90D1982A-20A1-489C-91A7-BD2144036BFB
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Marcus,<br><div dir=3D"ltr"><br><blockqu=
ote type=3D"cite">Il giorno 17 feb 2022, alle ore 16:11, Marcus Hoffmann &lt=
;marcus.hoffmann@othermo.de&gt; ha scritto:<br><br></blockquote></div><block=
quote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Fixes:</span><br><span> &=
nbsp;ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid</=
span><br><span> &nbsp;for mbr and hybrid partition-table-type</span><br></di=
v></blockquote><div><br></div><div>Here you should add:</div><div>Fixes:</di=
v><div><a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/21037843=
75">https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784375</a></div><d=
iv><br></div><div>Thank you</div><div>Best regards</div><div><br></div><bloc=
kquote type=3D"cite"><div dir=3D"ltr"><span>Signed-off-by: Marcus Hoffmann &=
lt;marcus.hoffmann@othermo.de&gt;</span><br><span>---</span><br><span> board=
/orangepi/orangepi-rk3399/genimage.cfg | 3 +--</span><br><span> 1 file chang=
ed, 1 insertion(+), 2 deletions(-)</span><br><span></span><br><span>diff --g=
it a/board/orangepi/orangepi-rk3399/genimage.cfg b/board/orangepi/orangepi-r=
k3399/genimage.cfg</span><br><span>index c94e0bc7cc..a02166172f 100644</span=
><br><span>--- a/board/orangepi/orangepi-rk3399/genimage.cfg</span><br><span=
>+++ b/board/orangepi/orangepi-rk3399/genimage.cfg</span><br><span>@@ -26,14=
 +26,13 @@ image sdcard.img {</span><br><span>  &nbsp; &nbsp;}</span><br><sp=
an></span><br><span>  &nbsp; &nbsp;partition boot {</span><br><span>- &nbsp;=
 &nbsp; &nbsp; &nbsp;partition-type =3D 0xC</span><br><span>+ &nbsp; &nbsp; &=
nbsp; &nbsp;partition-type-uuid =3D F</span><br><span>  &nbsp; &nbsp; &nbsp;=
 &nbsp;bootable =3D "true"</span><br><span>  &nbsp; &nbsp; &nbsp; &nbsp;imag=
e =3D "boot.vfat"</span><br><span>  &nbsp; &nbsp; &nbsp; &nbsp;offset =3D 16=
M</span><br><span>  &nbsp; &nbsp;}</span><br><span></span><br><span>  &nbsp;=
 &nbsp;partition rootfs {</span><br><span>- &nbsp; &nbsp; &nbsp; &nbsp;parti=
tion-type =3D 0x83</span><br><span>  &nbsp; &nbsp; &nbsp; &nbsp;image =3D "r=
ootfs.ext4"</span><br><span>  &nbsp; &nbsp;}</span><br><span> }</span><br><s=
pan>-- </span><br><span>2.25.1</span><br><span></span><br><span>____________=
___________________________________</span><br><span>buildroot mailing list</=
span><br><span>buildroot@buildroot.org</span><br><span>https://lists.buildro=
ot.org/mailman/listinfo/buildroot</span><br></div></blockquote></body></html=
>=

--Apple-Mail-90D1982A-20A1-489C-91A7-BD2144036BFB--

--===============6381313146925550589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6381313146925550589==--
