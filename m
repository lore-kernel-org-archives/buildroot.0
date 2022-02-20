Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38D2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 13:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33B91404CF;
	Sun, 20 Feb 2022 13:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-_zDgc2qPer; Sun, 20 Feb 2022 13:25:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3509F404A3;
	Sun, 20 Feb 2022 13:25:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 405821BF361
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 13:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CBAF81757
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 13:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9skAYDNxUdm for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 13:25:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99CF981756
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 13:25:37 +0000 (UTC)
Received: from smtpclient.apple ([151.44.21.244])
 by Aruba Outgoing Smtp  with ESMTPA
 id LmDXn34ePNVvLLmDXn0QaC; Sun, 20 Feb 2022 14:25:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645363535; bh=ZcoUVrd2fSytta4VIRFJdTwV8VzimuNIUng6HtWAnww=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=KGfnA0bfU5itU8EeCi2sHGRwXYVMH0N27Ms+RnIs1Ax12tahfoIjokGxe3tocQdPv
 dNDCG2yqPayafZ+SVQPoNahMhoFG1l7VjkQewUdGoJ3/XV6jsfwcapV5QEJ6RSLFZA
 RiWRckzUM5qopXUwju0s4TiUGEEtANxXGETr674jCVLDrlulr5uq0wsCdGwGQdHWpU
 B+lXpBugNAIRxLWpSQLKXtVkGU52Jo6jX4/1pPuWc2X4P26Xzho2gb0iHcrSAF6joy
 T3oehoApQqVxxpGUzjNQNIKqnpH0gNvXvo9eDBsH51NrARQwAXHdc6qA38i39okco8
 ZSFIOqWAo+o9A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 20 Feb 2022 14:25:34 +0100
Message-Id: <186B6238-5452-4211-BD9D-29A3C921DE42@benettiengineering.com>
References: <CAHnHX5jAJw2ON8-e6UBmvDLR6j3p1iUYY1GvRpbULHBjF80SrQ@mail.gmail.com>
In-Reply-To: <CAHnHX5jAJw2ON8-e6UBmvDLR6j3p1iUYY1GvRpbULHBjF80SrQ@mail.gmail.com>
To: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
X-Mailer: iPhone Mail (19D52)
X-CMAE-Envelope: MS4wfDJnaG501UDOFx2GGD2peFTDGQDpqB1icYOnuvBqCWpgfpYwYDozEfa3s5YLYlxko3rJnyiQ/Zls68i7faBfDwAn2z9Sdg6fus0k5wcwXtk0Rc3upFF2
 /DIRFD5icjkGNf9t5uWQlQIp2TvnafuvcskLGAzeCmM2YyrKgP4iUzOTkHDDuvoeoIk9ZQ7QAz8MMdnraoRULktH7oXt+kjYJG1io29UbF+eknShZli2Lf6A
 ewavtCDsPXP/eGxxgPmBLw==
Subject: Re: [Buildroot] Issue with login
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
Content-Type: multipart/mixed; boundary="===============5826836091494179604=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5826836091494179604==
Content-Type: multipart/alternative; boundary=Apple-Mail-4A122234-ECE0-43EE-9C37-398626425502
Content-Transfer-Encoding: 7bit


--Apple-Mail-4A122234-ECE0-43EE-9C37-398626425502
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Il giorno 20 feb 2022, alle ore 14:08, Mohd Faiz Rohani <mohd.faiz.rohani@=
gmail.com> ha scritto:
>=20
> =EF=BB=BF
>=20
> Yes I have tried putting root as the login, but still not working.  I have=
 tried both conditions, with password set as well as no password set in the B=
uildroot menuconfig and recompile. But the results are the same. I even disa=
bled the login prompt options, but when I running the board login prompt kee=
p coming. Fyi  i have used the gcc-linaro-7.5.0-2019 toolchain in ubuntu 20.=
04.

Mmh, can you provide your defconfig?
Please create it with:
$ make savedefconfig
you should find a defconfig in your Buildroot folder and pastebin it so we c=
an reproduce it(maybe).

By the way, why are you using such old toolchain?
And AFAIK Buildroot 2021.11.1 shouldn=E2=80=99t provide it as external toolc=
hain, so this means you have provided it and its specific options, so maybe t=
here some mistake there.
Have you instead tried building using the Buildroot toolchain?

Linux 4.4.* should work ok with more recent toolchain versions.

Best regards
Giulio

>=20
>=20
>> On Sun, Feb 20, 2022, 8:55 PM Giulio Benetti <giulio.benetti@benettiengin=
eering.com> wrote:
>> Hi Mohd,
>>=20
>>>> Il giorno 20 feb 2022, alle ore 13:46, Mohd Faiz Rohani <mohd.faiz.roha=
ni@gmail.com> ha scritto:
>>>>=20
>>> =EF=BB=BF
>>> Hi Giulio,
>>>=20
>>> Yes I have used root as a user. unfortunately i didn't set the path to t=
he users tables. Could this be a problem? If so, where to set them? I unders=
tand that the users list are kept in paswd file correct?
>>=20
>> Before getting to users table let=E2=80=99s check why root doesn=E2=80=99=
t work.
>>=20
>> Have you tried issuing:
>> root
>> And no password at all and press =E2=80=9Center=E2=80=9D key?
>>=20
>> It=E2=80=99s pretty strange it doesn=E2=80=99t work
>>=20
>> Giulio
>>=20
>>>=20
>>> Thanks
>>>=20
>>>> On Sun, Feb 20, 2022 at 7:43 PM Giulio Benetti <giulio.benetti@benettie=
ngineering.com> wrote:
>>>> Hi Mohd,
>>>>=20
>>>> have you used root as user? Or did you provide a user table?
>>>>=20
>>>> Giulio
>>>>=20
>>>> Inviato da iPhone
>>>>=20
>>>> > Il giorno 20 feb 2022, alle ore 11:57, Mohd Faiz Rohani <mohd.faiz.ro=
hani@gmail.com> ha scritto:
>>>> >=20
>>>> > =EF=BB=BF
>>>> > Hi guys,
>>>> >=20
>>>> > I managed to compile with success the Uboot(U-Boot 2019.04), Linux ke=
rnel(4.4.155)and root file system(systemd 249) using the Buildroot-2021.11.1=
. It was able to boot successfully until the login prompt. However, it seems=
 like there is an error with the login prompt it does not want to enter, jus=
t looping around the login prompt after I have entered the login name (not s=
howing the password prompt). Did anyone know about this?
>>>> >=20
>>>> > Thanks.
>>>> > _______________________________________________
>>>> > buildroot mailing list
>>>> > buildroot@buildroot.org
>>>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>>>>=20

--Apple-Mail-4A122234-ECE0-43EE-9C37-398626425502
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><br><div dir=3D"ltr"><blockquote type=3D"ci=
te">Il giorno 20 feb 2022, alle ore 14:08, Mohd Faiz Rohani &lt;mohd.faiz.ro=
hani@gmail.com&gt; ha scritto:<br><br></blockquote></div><blockquote type=3D=
"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"auto"><div><br>Yes I have tried=
 putting root as the login, but still not working.&nbsp; I have tried both c=
onditions, with password set as well as no password set in the Buildroot men=
uconfig and recompile. But the results are the same. I even disabled the log=
in prompt options, but when I running the board login prompt keep coming. Fy=
i&nbsp; i have used the gcc-linaro-7.5.0-2019 toolchain in ubuntu 20.04.</di=
v></div></div></blockquote><div><br></div><div>Mmh, can you provide your def=
config?</div><div>Please create it with:</div><div>$ make savedefconfig</div=
><div>you should find a defconfig in your Buildroot folder and pastebin it s=
o we can reproduce it(maybe).</div><div><br></div><div>By the way, why are y=
ou using such old toolchain?</div><div>And AFAIK Buildroot 2021.11.1 shouldn=
=E2=80=99t provide it as external toolchain, so this means you have provided=
 it and its specific options, so maybe there some mistake there.</div><div>H=
ave you instead tried building using the Buildroot toolchain?</div><div><br>=
</div><div>Linux 4.4.* should work ok with more recent toolchain versions.</=
div><div><br></div><div>Best regards</div><div>Giulio</div><br><blockquote t=
ype=3D"cite"><div dir=3D"ltr"><div dir=3D"auto"><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Feb 20, 2022, 8:55 PM Giulio Benetti &lt;<a h=
ref=3D"mailto:giulio.benetti@benettiengineering.com">giulio.benetti@benettie=
ngineering.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"auto">Hi Mohd,<br><div dir=3D"ltr"><br><blockquote type=3D"cite">Il gio=
rno 20 feb 2022, alle ore 13:46, Mohd Faiz Rohani &lt;<a href=3D"mailto:mohd=
.faiz.rohani@gmail.com" target=3D"_blank" rel=3D"noreferrer">mohd.faiz.rohan=
i@gmail.com</a>&gt; ha scritto:<br><br></blockquote></div><blockquote type=3D=
"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">Hi&nbsp;Giulio,<div><br></=
div><div>Yes I have used root as a user. unfortunately i didn't&nbsp;set the=
 path to the users tables. Could this be a problem? If so, where to set them=
? I understand that the users list are kept in paswd&nbsp;file correct?</div=
></div></div></blockquote><div><br></div><div>Before getting to users table l=
et=E2=80=99s check why root doesn=E2=80=99t work.</div><div><br></div><div>H=
ave you tried issuing:</div><div>root</div><div>And no password at all and p=
ress =E2=80=9Center=E2=80=9D key?</div><div><br></div><div>It=E2=80=99s pret=
ty strange it doesn=E2=80=99t work</div><div><br></div><div>Giulio</div><br>=
<blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div><br></div><=
div>Thanks</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sun, Feb 20, 2022 at 7:43 PM Giulio Benetti &lt;<a href=3D"m=
ailto:giulio.benetti@benettiengineering.com" target=3D"_blank" rel=3D"norefe=
rrer">giulio.benetti@benettiengineering.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hi Mohd,<br>
<br>
have you used root as user? Or did you provide a user table?<br>
<br>
Giulio<br>
<br>
Inviato da iPhone<br>
<br>
&gt; Il giorno 20 feb 2022, alle ore 11:57, Mohd Faiz Rohani &lt;<a href=3D"=
mailto:mohd.faiz.rohani@gmail.com" target=3D"_blank" rel=3D"noreferrer">mohd=
.faiz.rohani@gmail.com</a>&gt; ha scritto:<br>
&gt; <br>
&gt; =EF=BB=BF<br>
&gt; Hi guys,<br>
&gt; <br>
&gt; I managed to compile with success the Uboot(U-Boot 2019.04), Linux kern=
el(4.4.155)and root file system(systemd 249) using the Buildroot-2021.11.1. I=
t was able to boot successfully until the login prompt. However, it seems li=
ke there is an error with the login prompt it does not want to enter, just l=
ooping around the login prompt after I have entered the login name (not show=
ing the password prompt). Did anyone know about this?<br>
&gt; <br>
&gt; Thanks.<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"nor=
eferrer">buildroot@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/mailma=
n/listinfo/buildroot</a><br>
<br>
</blockquote></div>
</div></blockquote></div></blockquote></div></div></div>
</div></blockquote></body></html>=

--Apple-Mail-4A122234-ECE0-43EE-9C37-398626425502--

--===============5826836091494179604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5826836091494179604==--
