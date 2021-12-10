Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3257AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 14:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6AC985180;
	Fri, 10 Dec 2021 14:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EEQxGKK2puTf; Fri, 10 Dec 2021 14:10:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD83185177;
	Fri, 10 Dec 2021 14:10:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4896A1BF4DB
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3740F41FDE
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDdyoHULCdLB for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 14:10:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BB5A41FD1
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 14:10:32 +0000 (UTC)
Received: from smtpclient.apple ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPA
 id vgbWmMUTUVJjRvgbWmhnv3; Fri, 10 Dec 2021 15:10:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639145431; bh=dNf8jJWQwmavq56f9XWzMUYMKdFbNfFiRyDiUhFZpd0=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=bTsNCU+ZLZ5URHLn+718NPS37U42GPIsPZVvER8YZegsacm0dPxkL6YNSkOjFxh7u
 uDEoYxjse2hSMsXJPZfiuuxUuf6ku9fQ+WXH1RknDBnhPKTLgUttmcVB4oOrLCchwz
 JFVKSPicZUrik3kzfAelgxBVrKI+Yl5c0M9KnPc33TQbPqJmlIzTfgFQx/NuffKena
 qZdQTdgoH1U4iYu9PxJCYnKkDiF7zLUXZi+Y8THfPNhJnBMplh2VDdgfxQiHYvYaGt
 vuJBZLXMVQN0YsJsTlMfyoat7iwapfxPUFnGNLjdXeNCxgQmZnFsObIqFDzJs+3K6B
 Vd553nH28BGpg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 10 Dec 2021 15:10:29 +0100
Message-Id: <6A91F3BC-692E-43F9-98DA-24A98044F162@benettiengineering.com>
References: <CAJPV9Mpjwh+_H7vVKjqcQcROrw+daU+jW+d=n0Dw5Dev-E2DVQ@mail.gmail.com>
In-Reply-To: <CAJPV9Mpjwh+_H7vVKjqcQcROrw+daU+jW+d=n0Dw5Dev-E2DVQ@mail.gmail.com>
To: =?utf-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
X-Mailer: iPhone Mail (19B74)
X-CMAE-Envelope: MS4wfIhph1ubBmgbS/Lolgbq4ZwYk42STHQn0Tl5v47ne9hZuwVKqDNvj7/6SS/kSQ/qvJiiiOtg1AZFQN06ZnVDFf9Fwf3k9uMwxVbzH6kkL6jvzev7DGuH
 Sn2mF0qzy5lSN/vuBM9eTgXz+jVb2pK0Bvr3WMnH3gUzhaEnnFvOS/656Eq1a0fWPgo2ay0zHA74mdGBsUmVy/58TclfVbwOvsvlYxq3u7OfcqQWtr3WFGkT
 lRZkizsQXkjM/86sfEEanA==
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
Content-Type: multipart/mixed; boundary="===============6347609361866592734=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6347609361866592734==
Content-Type: multipart/alternative; boundary=Apple-Mail-9C7405FB-4902-45E3-8D77-17F080FF3247
Content-Transfer-Encoding: 7bit


--Apple-Mail-9C7405FB-4902-45E3-8D77-17F080FF3247
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jos=C3=A9,

> Il giorno 10 dic 2021, alle ore 12:03, Jos=C3=A9 Pekkarinen <jose.pekkarin=
en@unikie.com> ha scritto:
>=20
> =EF=BB=BF
>=20
>=20
>>> On Fri, Dec 10, 2021 at 12:29 PM Giulio Benetti <giulio.benetti@benettie=
ngineering.com> wrote:
>>> Hi Jos=C3=A9,
>>>=20
>>> please use plain-text,
>>=20
>> Sorry, google thingy, not sure I can fix it :\

Use an e-mail client where you can set such setting. I=E2=80=99m on mobile n=
ow and maybe my answer will be a html. It happens sometimes.

>> =20
>> On 10/12/21 07:20, Jos=C3=A9 Pekkarinen wrote:
>> >=20
>> >     Hi,
>> >=20
>> >     Any comments in the following patchset?
>> >=20
>> >     Thanks!
>> >=20
>> >     Jos=C3=A9
>> >=20
>> >=20
>> > On Fri, Dec 3, 2021 at 10:37 AM Jos=C3=A9 Pekkarinen=20
>>=20
>> Only 1 week has passed, backlog is pretty big(478 patches at the moment)
>=20
> Sorry, I was following linux kernel guidances
> of the rule of 1w, I'll be more patient next time.

I honestly sent patches that stayed sitting there for even months in Linux M=
L. I don=E2=80=99t know this rule of the 1 week, but maybe I=E2=80=99m not a=
ware.

> =20
>> > <jose.pekkarinen@unikie.com <mailto:jose.pekkarinen@unikie.com>> wrote:=

>> >=20
>> >     The patch will add a basic opensc package to build
>> >     on buildroot.
>>=20
>> This commit log is not sufficient. Can you please take a look at other=20=

>> commit log on while adding a "new package"? Try to imitate, that's a=20
>> good starting point.
>=20
> Most I see have empty comment. Mind to elaborate
> what is missing?=20

Sorry, here the problem is how the commit log is written. Pick one of the la=
test new package adding and imitate it.

Usually the commit log is written with the infinite verbs. So something like=
:
=E2=80=9CThis patch adds opensc package=E2=80=9D

and probably that=E2=80=99s enough.
You don=E2=80=99t need to specify =E2=80=9Cto build on Buildroot=E2=80=9D be=
cause this patch will be applied to it so it=E2=80=99s implicit.

>=20
>> >     Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com
>> >     <mailto:jose.pekkarinen@unikie.com>>
>>=20
>> This ^^^ SoB has a strange format, how did you produce the patch?
>> Also how did you set the user.email in git?
>=20
> It is properly set, so either git send-email or google added
> that extra feaure.

I don=E2=80=99t think it=E2=80=99s google mail client, it seems like you=E2=80=
=99ve setup the user.e-mail wrong.
Try to check with:
# git config user.mail

Thanks for the Eddie anyway, I didn=E2=80=99t tell you on the previous email=
 :-)

Best regards
Giulio

> =20
> Thanks!
>=20
> Jos=C3=A9.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-9C7405FB-4902-45E3-8D77-17F080FF3247
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Jos=C3=A9,<br><div dir=3D"ltr"><br><bloc=
kquote type=3D"cite">Il giorno 10 dic 2021, alle ore 12:03, Jos=C3=A9 Pekkar=
inen &lt;jose.pekkarinen@unikie.com&gt; ha scritto:<br><br></blockquote></di=
v><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr"><div d=
ir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, Dec 10, 2021 at 12:29 PM Giulio Benetti &lt;<a href=3D"=
mailto:giulio.benetti@benettiengineering.com">giulio.benetti@benettiengineer=
ing.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi Jos=C3=A9,<br>
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
br></div><div>Thanks for the Eddie anyway, I didn=E2=80=99t tell you on the p=
revious email :-)</div><div><br></div><div>Best regards</div><div>Giulio</di=
v><br><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div><div c=
lass=3D"gmail_quote"><div>&nbsp;</div></div></div><blockquote style=3D"margi=
n:0 0 0 40px;border:none;padding:0px"><div><div class=3D"gmail_quote"><div>T=
hanks!</div><div><br></div></div></div></blockquote><blockquote style=3D"mar=
gin:0 0 0 40px;border:none;padding:0px"><div><div class=3D"gmail_quote"><div=
>Jos=C3=A9.</div></div></div></blockquote></div>
<span>_______________________________________________</span><br><span>buildr=
oot mailing list</span><br><span>buildroot@buildroot.org</span><br><span>htt=
ps://lists.buildroot.org/mailman/listinfo/buildroot</span><br></div></blockq=
uote></body></html>=

--Apple-Mail-9C7405FB-4902-45E3-8D77-17F080FF3247--

--===============6347609361866592734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6347609361866592734==--
