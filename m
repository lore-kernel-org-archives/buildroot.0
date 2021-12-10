Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5662CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 14:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4128422D3;
	Fri, 10 Dec 2021 14:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-BncEup4I4R; Fri, 10 Dec 2021 14:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE16E422D6;
	Fri, 10 Dec 2021 14:19:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC0D01BF4DB
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E88B2613E0
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2UM9J8WK4Ms0 for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 14:19:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70A1760ED2
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 14:19:09 +0000 (UTC)
Received: from smtpclient.apple ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPA
 id vgjrmMdKpVJjRvgjsmhucq; Fri, 10 Dec 2021 15:19:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639145948; bh=Q3R38t19DJpXqWkruJ33UBw4MfEAiD9x9tIuHvR+Cqg=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=U1O/k/3T6I96HFGRgtmJs3xHj632w44TF70lvTTLQXLDC1s5K8o2tESOFsq7l9Pv2
 npfZpYFjrJF57E6AEHi9N+mYwXOvKNm8PFZPM24rzGE4lF+Z39mrtqSkFFQbye3Wpb
 vCSB9tihJGk/cgaKgmf5c1hDDwM6kujpic7RluiM+BayASTLuUCG9pnvznPnSh65/n
 Q1hjjke5HnxdK+pU5aMjQcDrRLgQkWEFO92IdYHrJobQnk9tLAjeOgvNwV+sQRS7Mc
 mIQF5SCMT5J60uWw4eourrSS1C8eyopZwwjQEb94wmQ/7eqK2KCWVSMNoTQl5lgZij
 fB++zEaqbkhnQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 10 Dec 2021 15:19:07 +0100
Message-Id: <0EAC6D3C-8B2B-4259-B7E3-2A69057391C1@benettiengineering.com>
References: <6A91F3BC-692E-43F9-98DA-24A98044F162@benettiengineering.com>
In-Reply-To: <6A91F3BC-692E-43F9-98DA-24A98044F162@benettiengineering.com>
To: =?utf-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
X-Mailer: iPhone Mail (19B74)
X-CMAE-Envelope: MS4wfAmh5ElawZlL6dC904YVcpOAaHbunmGPZX4wPB+1hnaq46uwTnZBRWRYAQjkiN3G0AryNNW5sleBzvsKUckyEEW6ZfKOriAbJpt0bfM2ZMdxSrzv3QN2
 TzU0/AZyCoXUviTsHdaVuP1b0qwbfael31uYukhxzeQLdAVXumPBVIHbjEYUb6d1o3DYZNy2zOP2usxI7d5WOQJOlrDylDsql9YN5g2I+VtIhXK+UlxfP9Un
 iXWlzkIWtb5QLNeQZrzg/w==
Subject: Re: [Buildroot] [PATCH 1/3] package/opensc: new package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7003965414754470630=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7003965414754470630==
Content-Type: multipart/alternative; boundary=Apple-Mail-4AE373DD-0366-4F99-80BA-8F704ADDBB45
Content-Transfer-Encoding: 7bit


--Apple-Mail-4AE373DD-0366-4F99-80BA-8F704ADDBB45
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Il giorno 10 dic 2021, alle ore 15:10, Giulio Benetti <giulio.benetti@bene=
ttiengineering.com> ha scritto:
>=20
> =EF=BB=BFHi Jos=C3=A9,
>=20
>>> Il giorno 10 dic 2021, alle ore 12:03, Jos=C3=A9 Pekkarinen <jose.pekkar=
inen@unikie.com> ha scritto:
>>>=20
>> =EF=BB=BF
>>=20
>>=20
>>> On Fri, Dec 10, 2021 at 12:29 PM Giulio Benetti <giulio.benetti@benettie=
ngineering.com> wrote:
>>> Hi Jos=C3=A9,
>>>=20
>>> please use plain-text,
>>=20
>> Sorry, google thingy, not sure I can fix it :\
>=20
> Use an e-mail client where you can set such setting. I=E2=80=99m on mobile=
 now and maybe my answer will be a html. It happens sometimes.
>=20
>> =20
>>> On 10/12/21 07:20, Jos=C3=A9 Pekkarinen wrote:
>>> >=20
>>> >     Hi,
>>> >=20
>>> >     Any comments in the following patchset?
>>> >=20
>>> >     Thanks!
>>> >=20
>>> >     Jos=C3=A9
>>> >=20
>>> >=20
>>> > On Fri, Dec 3, 2021 at 10:37 AM Jos=C3=A9 Pekkarinen=20
>>>=20
>>> Only 1 week has passed, backlog is pretty big(478 patches at the moment)=

>>=20
>> Sorry, I was following linux kernel guidances
>> of the rule of 1w, I'll be more patient next time.
>=20
> I honestly sent patches that stayed sitting there for even months in Linux=
 ML. I don=E2=80=99t know this rule of the 1 week, but maybe I=E2=80=99m not=
 aware.
>=20
>> =20
>>> > <jose.pekkarinen@unikie.com <mailto:jose.pekkarinen@unikie.com>> wrote=
:
>>> >=20
>>> >     The patch will add a basic opensc package to build
>>> >     on buildroot.
>>>=20
>>> This commit log is not sufficient. Can you please take a look at other=20=

>>> commit log on while adding a "new package"? Try to imitate, that's a=20
>>> good starting point.
>>=20
>> Most I see have empty comment. Mind to elaborate
>> what is missing?=20
>=20
> Sorry, here the problem is how the commit log is written. Pick one of the l=
atest new package adding and imitate it.
>=20
> Usually the commit log is written with the infinite verbs. So something li=
ke:
> =E2=80=9CThis patch adds opensc package=E2=80=9D
>=20
> and probably that=E2=80=99s enough.
> You don=E2=80=99t need to specify =E2=80=9Cto build on Buildroot=E2=80=9D b=
ecause this patch will be applied to it so it=E2=80=99s implicit.
>=20
>>=20
>>> >     Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com
>>> >     <mailto:jose.pekkarinen@unikie.com>>
>>>=20
>>> This ^^^ SoB has a strange format, how did you produce the patch?
>>> Also how did you set the user.email in git?
>>=20
>> It is properly set, so either git send-email or google added
>> that extra feaure.
>=20
> I don=E2=80=99t think it=E2=80=99s google mail client, it seems like you=E2=
=80=99ve setup the user.e-mail wrong.
> Try to check with:
> # git config user.mail
>=20
> Thanks for the Eddie anyway, I didn=E2=80=99t tell you on

s/Eddie/contribution


> the previous email :-)
>=20
> Best regards
> Giulio
>=20
>> =20
>> Thanks!
>>=20
>> Jos=C3=A9.
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-4AE373DD-0366-4F99-80BA-8F704ADDBB45
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><br><div dir=3D"ltr"><blockquote type=3D"ci=
te">Il giorno 10 dic 2021, alle ore 15:10, Giulio Benetti &lt;giulio.benetti=
@benettiengineering.com&gt; ha scritto:<br><br></blockquote></div><blockquot=
e type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<meta http-equiv=3D"content-type" c=
ontent=3D"text/html; charset=3Dutf-8">Hi Jos=C3=A9,<br><div dir=3D"ltr"><br>=
<blockquote type=3D"cite">Il giorno 10 dic 2021, alle ore 12:03, Jos=C3=A9 P=
ekkarinen &lt;jose.pekkarinen@unikie.com&gt; ha scritto:<br><br></blockquote=
></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">=
<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Fri, Dec 10, 2021 at 12:29 PM Giulio Benetti &lt;<a h=
ref=3D"mailto:giulio.benetti@benettiengineering.com">giulio.benetti@benettie=
ngineering.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi Jos=C3=A9,<br>
<br>
please use plain-text,<br></blockquote><div><br></div></div><blockquote styl=
e=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><=
div>Sorry, google thingy, not sure I can fix it :\</div></div></blockquote><=
/div></div></blockquote><div><br></div><div>Use an e-mail client where you c=
an set such setting. I=E2=80=99m on mobile now and maybe my answer will be a=
 html. It happens sometimes.</div><br><blockquote type=3D"cite"><div dir=3D"=
ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>&nbsp;</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
On 10/12/21 07:20, Jos=C3=A9 Pekkarinen wrote:<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;Hi,<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;Any comments in the following patchset?<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;Thanks!<br>
&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;Jos=C3=A9<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Dec 3, 2021 at 10:37 AM Jos=C3=A9 Pekkarinen <br>
<br>
Only 1 week has passed, backlog is pretty big(478 patches at the moment)<br>=
</blockquote><div><br></div></div><blockquote style=3D"margin:0 0 0 40px;bor=
der:none;padding:0px"><div class=3D"gmail_quote"><div>Sorry, I was following=
 linux kernel guidances</div></div></blockquote>of the rule of 1w, I'll be m=
ore patient next time.<br></div></div></blockquote><div><br></div><div>I hon=
estly sent patches that stayed sitting there for even months in Linux ML. I d=
on=E2=80=99t know this rule of the 1 week, but maybe I=E2=80=99m not aware.<=
/div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><div>&nbsp;</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-=
left:1ex">
&gt; &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com" target=3D"_blank">jos=
e.pekkarinen@unikie.com</a> &lt;mailto:<a href=3D"mailto:jose.pekkarinen@uni=
kie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;&gt; wrote:<br>=

&gt; <br>
&gt;&nbsp; &nbsp; &nbsp;The patch will add a basic opensc package to build<b=
r>
&gt;&nbsp; &nbsp; &nbsp;on buildroot.<br>
<br>
This commit log is not sufficient. Can you please take a look at other <br>
commit log on while adding a "new package"? Try to imitate, that's a <br>
good starting point.<br></blockquote><div><br></div></div><blockquote style=3D=
"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div>=
Most I see have empty comment. Mind to elaborate</div></div></blockquote>wha=
t is missing?&nbsp;</div></div></blockquote><div><br></div><div>Sorry, here t=
he problem is how the commit log is written. Pick one of the latest new pack=
age adding and imitate it.</div><div><br></div><div>Usually the commit log i=
s written with the infinite verbs. So something like:</div><div>=E2=80=9CThi=
s patch adds opensc package=E2=80=9D</div><div><br></div><div>and probably t=
hat=E2=80=99s enough.</div><div>You don=E2=80=99t need to specify =E2=80=9Ct=
o build on Buildroot=E2=80=9D because this patch will be applied to it so it=
=E2=80=99s implicit.</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div><br><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt;&nbsp; &nbsp; &nbsp;Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"m=
ailto:jose.pekkarinen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.c=
om</a><br>
&gt;&nbsp; &nbsp; &nbsp;&lt;mailto:<a href=3D"mailto:jose.pekkarinen@unikie.=
com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;&gt;<br>
<br>
This ^^^ SoB has a strange format, how did you produce the patch?<br>
Also how did you set the user.email in git?<br></blockquote><div><br></div><=
/div></div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><=
div><div class=3D"gmail_quote"><div>It is properly set, so either git send-e=
mail or google added</div></div></div></blockquote>that extra feaure.<br></d=
iv></div></blockquote><div><br></div><div>I don=E2=80=99t think it=E2=80=99s=
 google mail client, it seems like you=E2=80=99ve setup the user.e-mail wron=
g.</div><div>Try to check with:</div><div># git config user.mail</div><div><=
br></div><div>Thanks for the Eddie anyway, I didn=E2=80=99t tell you on</div=
></div></blockquote><div><br></div><div>s/Eddie/contribution</div><div><br><=
/div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div> the previous email=
 :-)</div><div><br></div><div>Best regards</div><div>Giulio</div><br><blockq=
uote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div><div class=3D"gmai=
l_quote"><div>&nbsp;</div></div></div><blockquote style=3D"margin:0 0 0 40px=
;border:none;padding:0px"><div><div class=3D"gmail_quote"><div>Thanks!</div>=
<div><br></div></div></div></blockquote><blockquote style=3D"margin:0 0 0 40=
px;border:none;padding:0px"><div><div class=3D"gmail_quote"><div>Jos=C3=A9.<=
/div></div></div></blockquote></div>
<span>_______________________________________________</span><br><span>buildr=
oot mailing list</span><br><span>buildroot@buildroot.org</span><br><span>htt=
ps://lists.buildroot.org/mailman/listinfo/buildroot</span><br></div></blockq=
uote></div></blockquote></body></html>=

--Apple-Mail-4AE373DD-0366-4F99-80BA-8F704ADDBB45--

--===============7003965414754470630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7003965414754470630==--
