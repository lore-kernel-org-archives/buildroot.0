Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A74C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 13:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9637B4016A;
	Tue, 15 Feb 2022 13:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ITkBjI78LUL7; Tue, 15 Feb 2022 13:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E1474032B;
	Tue, 15 Feb 2022 13:00:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E4E11BF97D
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 13:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 382934032B
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 13:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsAhuryIT1Kg for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 13:00:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45D3C4016A
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 13:00:39 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id JxRcnK4cUXmFAJxRdnG6FR; Tue, 15 Feb 2022 14:00:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644930038; bh=uDThmd1vhrGUnCGRg77w+falsITnnx4QFIFdn2Xdcv0=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=AebOf3MhSajj04uS1K9y7IxOWuE/SnLuDXDcQed3kfKt+7EG3nKhn4dZN5pTXLlKO
 T3zx7R4fbeZQGOPurgHYjJdDIr5VI3h3I9eubJgZ2K1Qc1GaVX6zoKF/UclNjH/Gpb
 Rk5WbEIRMZoYMp2P96C5bb4cVTcFAMREAubxhmSH2miYXSvaOXuC79cv8aAZQXewGn
 gjHul/aF3KKI6b/vXTXcw8FweOY9tqfMDAs9NcuY2+lmhs6jFxKbsvbLxjc5xAED+Q
 9LI/azAjhdoU/AiHRTWVqJvtwI2OPTYOEKbTpqK86zH0IeZgh+Z/SAtB2kGcEDxlpV
 5HHptbWdnha7g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 15 Feb 2022 14:00:36 +0100
Message-Id: <E6BF6E53-C2C5-4FA5-8419-34B11400C780@benettiengineering.com>
References: <Ygs2xMj+B0UhKFxh@APC323>
In-Reply-To: <Ygs2xMj+B0UhKFxh@APC323>
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfLSkb7gMkY3q0YW00JER6DO8FwYojme8wB1BtH2D9Lm4wDFizcjawwXVqXCNL1JvjT6X00YLCDl9CRAp4gkLLDFg1qK8/CmO/MGOlu4XdB1iUqhcCmo0
 Wp4JQjttX5WuU/vhIM7cGNegW9w/jPPVYdAZOA4AQfdtSc399wcINzl0fuQqoewdoAgu/G+KePzFCRiAFHF/zyrw26d6QAqECG9g63GWzsiDl4vZYadQp1X0
 KnEee2zfmRrkl1Ag218P0A==
Subject: Re: [Buildroot] [PATCH 2/3] board/andes/ae350: add support for
 Andes AE350
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7051751534515547741=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7051751534515547741==
Content-Type: multipart/alternative; boundary=Apple-Mail-7D58E209-234D-453D-9CDB-FE1D77FDEC32
Content-Transfer-Encoding: 7bit


--Apple-Mail-7D58E209-234D-453D-9CDB-FE1D77FDEC32
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Peter,

> Il giorno 15 feb 2022, alle ore 06:16, Yu Chien Peter Lin <peterlin@andest=
ech.com> ha scritto:
>=20
> =EF=BB=BF
>>=20
>>> On Tue, Feb 15, 2022 at 10:32:01AM +0800, Yu Chien Peter Lin wrote:
>>> This patch provides defconfig and basic support for the Andes
>>> 45 series RISC-V architecture.
>>>=20
>>> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
>>> Signed-off-by: Alan Kao <alankao@andestech.com>
>>> ---
>>> Changes
>>> V1->V2:
>>> * move linux source code and its patches to AndesTech Github repo
>>> * rename ae350_andestar45_defconfig to andes_ae350_45_defconfig
>>> * change C library to uClibc
>>> * remove OpenSSL package
>>> * remove rootfs.cpio and rootfs.tar
>>> * update DEVELOPERS
>>> V2->V3:
>>> * specifiy branch to download from AndesTech linux repo
>>> * change boot.cmd to extlinux.conf
>>> * add post-build.sh for extlinux.conf to retrieve Image and DTB
>>> * fix format and update genimage_sdcard.cfg
>>> * update readme.txt
>>> * add packages (python3, pylibfdt and openssl) for u-boot binman
>>> * reorder item in DEVELOPERS
>>>=20
>=20
> Sorry, I missed versioning for this revision.
> I'll resend it and fix changelog format.

Can you please subscribe to patchwork[1] and tag your patches without V3 pre=
fix as rejected?

[1]: https://patchwork.ozlabs.org/project/buildroot/list/

Thank you!
Giulio

>=20
> Regards,
> Yu-Chien Peter Lin
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-7D58E209-234D-453D-9CDB-FE1D77FDEC32
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Peter,<br><div dir=3D"ltr"><br><blockquo=
te type=3D"cite">Il giorno 15 feb 2022, alle ore 06:16, Yu Chien Peter Lin &=
lt;peterlin@andestech.com&gt; ha scritto:<br><br></blockquote></div><blockqu=
ote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<blockquote type=3D"cite"><span>=
On Tue, Feb 15, 2022 at 10:32:01AM +0800, Yu Chien Peter Lin wrote:</span><b=
r></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Thi=
s patch provides defconfig and basic support for the Andes</span><br></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>45 series RISC-V architecture.</span><br></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Signed-=
off-by: Yu Chien Peter Lin &lt;peterlin@andestech.com&gt;</span><br></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
Signed-off-by: Alan Kao &lt;alankao@andestech.com&gt;</span><br></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>---<=
/span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>Changes</span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>V1-&gt;V2:</span><br></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>* m=
ove linux source code and its patches to AndesTech Github repo</span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>* rename ae350_andestar45_defconfig to andes_ae350_45_defconfig</span><=
br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span>* change C library to uClibc</span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>* remove OpenSSL p=
ackage</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>* remove rootfs.cpio and rootfs.tar</span><br></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>* update DEVELOPERS</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>V2-&gt;V3:</span><br></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>* specif=
iy branch to download from AndesTech linux repo</span><br></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>* change b=
oot.cmd to extlinux.conf</span><br></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>* add post-build.sh for extlinux.=
conf to retrieve Image and DTB</span><br></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>* fix format and update gen=
image_sdcard.cfg</span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>* update readme.txt</span><br></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>* a=
dd packages (python3, pylibfdt and openssl) for u-boot binman</span><br></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>* reorder item in DEVELOPERS</span><br></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote><=
/blockquote><span></span><br><span>Sorry, I missed versioning for this revis=
ion.</span><br><span>I'll resend it and fix changelog format.</span><br></di=
v></blockquote><div><br></div><div>Can you please subscribe to patchwork[1] a=
nd tag your patches without V3 prefix as rejected?</div><div><br></div><div>=
[1]:&nbsp;<a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/">h=
ttps://patchwork.ozlabs.org/project/buildroot/list/</a></div><div><br></div>=
<div>Thank you!</div><div>Giulio</div><br><blockquote type=3D"cite"><div dir=
=3D"ltr"><span></span><br><span>Regards,</span><br><span>Yu-Chien Peter Lin<=
/span><br><span>_______________________________________________</span><br><s=
pan>buildroot mailing list</span><br><span>buildroot@buildroot.org</span><br=
><span>https://lists.buildroot.org/mailman/listinfo/buildroot</span><br></di=
v></blockquote></body></html>=

--Apple-Mail-7D58E209-234D-453D-9CDB-FE1D77FDEC32--

--===============7051751534515547741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7051751534515547741==--
