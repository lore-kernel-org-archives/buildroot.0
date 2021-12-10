Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F48FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 20:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0007640129;
	Fri, 10 Dec 2021 20:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0efyuDE2B2lv; Fri, 10 Dec 2021 20:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 018264039A;
	Fri, 10 Dec 2021 20:26:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5C81BF28E
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 20:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CFE9425F7
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 20:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZPWtgf8JD2r for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 20:26:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1107D425F4
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 20:26:13 +0000 (UTC)
Received: from smtpclient.apple ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPA
 id vmT4mSlYDVJjRvmT4mlguG; Fri, 10 Dec 2021 21:26:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639167971; bh=4abZ0hUth3dSUSj9ABzE9BTsfJPcsyKwq27f5vHEkp8=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=ViRwJhRy3fk5xfqRxBaGAuOyyYB7EuVc7T6lONuvlKfjptZg9hYmlxGycFRv7ggVH
 sBlIQT/si+LhjVH2jkuEK35dKujBIJbsyTe1ifLQvFc+t9zbeJ6PTlILvV6W6RUC9g
 Z5JfijKPhQF8WTgPqO83MkwksS208AGQtiAbT1dxDn0xW0SogErEXT2LccwmqtAXw8
 uGWKIFIXkgSxVyCkJHjhjMEd96WI/Jwbyu94j17Rto2rV3Ru5mCv8g7OebsuZWH/vb
 p/jtJS5dUzJCct/rCHdYeyOtT0Iky8BsOB2CElNKWPw81r7ifAh8u0AYNJX5efUwVZ
 j8CjAg9RPOrYg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 10 Dec 2021 21:26:10 +0100
Message-Id: <DFCC6A00-0724-4619-90D8-8D76A172442C@benettiengineering.com>
References: <c2931bcc-68eb-e00e-5fc1-a67357c853b1@mind.be>
In-Reply-To: <c2931bcc-68eb-e00e-5fc1-a67357c853b1@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (19B74)
X-CMAE-Envelope: MS4wfEDRcB25BfjZDIEgE7vKSA+ZmCqmBmahpXlwADjCGvPWyJ4GnO8nWyI3iCuXgm8cBVvXnrTtmeo21Ff3yVlMkq5P5O8bcLhWp0Qiz1P5FsLAbuwfOyta
 18WgdpDiJzuKa+ciDqpqVjANogOJTBepyx7nTP/TLbozVULMWest6K0YmgkSXRZaszsQgk5kezWPgAQoymRaCmTjuH34dYegSmn9mjU5MTSNvovk1/Y+unZU
 6MfOfgbpqKvVQ0tPO7TBzZXsjQELZj7FgojWTrMiGDVzUtm7hbarK7D+QzMF5vsX5KU+C2re/8ckE9tUPAKAzw==
Subject: Re: [Buildroot] [PATCH 2/7] package/minijail: new package
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
Cc: =?utf-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4456866444658811251=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4456866444658811251==
Content-Type: multipart/alternative; boundary=Apple-Mail-5AEEBA9C-7EED-4E74-BA5D-6330EF947E5C
Content-Transfer-Encoding: 7bit


--Apple-Mail-5AEEBA9C-7EED-4E74-BA5D-6330EF947E5C
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Arnout, Yann, All,

> Il giorno 10 dic 2021, alle ore 19:15, Arnout Vandecappelle <arnout@mind.b=
e> ha scritto:
>=20
> =EF=BB=BF
>=20
>> On 10/12/2021 15:48, Giulio Benetti wrote:
>> Hi Jos=C3=A9,
>>> On 10/12/21 15:12, Jos=C3=A9 Pekkarinen wrote:
>>> This patch adds a new package for minijail.
>> Reword "This patch add package minijail"
>=20
> Actually, no. For something this simple, it's better to leave the body emp=
ty (i.e. just the SoB), because the subject says it all already.

I agree with you. But I don=E2=80=99t know why I=E2=80=99ve been asked to re=
peat the summary into the body of commit log, like in this commit:
https://source.denx.de/u-boot/u-boot/-/commit/4ca28e98ace5d1253ed8cb9623dfac=
9296d70971

This is a Linux patch that has been committed to pinctrl next:
https://lore.kernel.org/lkml/20211125211443.1150135-5-Mr.Bossman075@gmail.co=
m/

Maybe it is because when you see the patch in a mail client(I=E2=80=99m thin=
king about thunderbird) the summary is separated and =E2=80=9Cdifficult=E2=80=
=9D to read.

I don=E2=80=99t know what else :-)

Best regards
Giulio Benetti
Benetti Engineering sas

>=20
> Regards,
> Arnout

--Apple-Mail-5AEEBA9C-7EED-4E74-BA5D-6330EF947E5C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div>Hi Arnout, Yann, All,</div><br><div di=
r=3D"ltr"><blockquote type=3D"cite">Il giorno 10 dic 2021, alle ore 19:15, A=
rnout Vandecappelle &lt;arnout@mind.be&gt; ha scritto:<br><br></blockquote><=
/div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span></span><br><s=
pan></span><br><span>On 10/12/2021 15:48, Giulio Benetti wrote:</span><br><b=
lockquote type=3D"cite"><span>Hi Jos=C3=A9,</span><br></blockquote><blockquo=
te type=3D"cite"><span>On 10/12/21 15:12, Jos=C3=A9 Pekkarinen wrote:</span>=
<br></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>T=
his patch adds a new package for minijail.</span><br></blockquote></blockquo=
te><blockquote type=3D"cite"><span>Reword "This patch add package minijail"<=
/span><br></blockquote><span></span><br><span> Actually, no. For something t=
his simple, it's better to leave the body empty (i.e. just the SoB), because=
 the subject says it all already.</span><br></div></blockquote><div><br></di=
v><div>I agree with you. But I don=E2=80=99t know why I=E2=80=99ve been aske=
d to repeat the summary into the body of commit log, like in this commit:</d=
iv><div><a href=3D"https://source.denx.de/u-boot/u-boot/-/commit/4ca28e98ace=
5d1253ed8cb9623dfac9296d70971">https://source.denx.de/u-boot/u-boot/-/commit=
/4ca28e98ace5d1253ed8cb9623dfac9296d70971</a></div><div><br></div><div>This i=
s a Linux patch that has been committed to pinctrl next:</div><div><a href=3D=
"https://lore.kernel.org/lkml/20211125211443.1150135-5-Mr.Bossman075@gmail.c=
om/">https://lore.kernel.org/lkml/20211125211443.1150135-5-Mr.Bossman075@gma=
il.com/</a></div><div><br></div><div>Maybe it is because when you see the pa=
tch in a mail client(I=E2=80=99m thinking about thunderbird) the summary is s=
eparated and =E2=80=9Cdifficult=E2=80=9D to read.</div><div><br></div><div>I=
 don=E2=80=99t know what else :-)</div><div><br></div><div>Best regards</div=
><div>Giulio Benetti</div><div>Benetti Engineering sas</div><br><blockquote t=
ype=3D"cite"><div dir=3D"ltr"><span></span><br><span> Regards,</span><br><sp=
an> Arnout</span><br></div></blockquote></body></html>=

--Apple-Mail-5AEEBA9C-7EED-4E74-BA5D-6330EF947E5C--

--===============4456866444658811251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4456866444658811251==--
