Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7A1C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 21:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD30960AFA;
	Fri, 18 Feb 2022 21:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kDvWgeVkuNjc; Fri, 18 Feb 2022 21:41:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA9B160AC0;
	Fri, 18 Feb 2022 21:41:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E23301BF311
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 21:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBC0960AC0
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 21:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QSOr6-4Cy-MO for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 21:41:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3A5F60A97
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 21:41:26 +0000 (UTC)
Received: from smtpclient.apple ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPA
 id LB0Gn6RfT4NL9LB0GniFXA; Fri, 18 Feb 2022 22:41:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645220484; bh=mbeD86wNDcIV8enWP87KLP7EZsm4gV75SWHycl1LtTw=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=b6JiNEI9GN0xOzpd77mH3kDykXVgqdtTQoCFXD1otivxH5zFnrTnZDIgUTrDUEr1J
 vzUcF2RBqVWB2uz7FTT7Bzpem5zpxwGRG2bp0xUgAXsv//TbIy30St4vNuRmFgLGft
 eLkkcYvVPkPY7hSpveG6mxxxrNJtE2dFx93CbjhTTfovQHFSbAaHigN1KkkUDLFXyM
 J9BKrSE4zc+8THIzHNtngcuD3XXp7KGCj7wmBvOgWdEtMrnHfozz3GGchmwj+koWC1
 4nYUOQiHlyAtMtd44H7ZYGWD0pWtVF3q+Rp/Xw6z0a+xh5O2YXEtTmbveteGZW8wYM
 IPz5xvixydnEA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 18 Feb 2022 22:41:23 +0100
Message-Id: <C47D66BF-F38D-4FD2-B36D-E6C3A1F21DF8@benettiengineering.com>
References: <CAGrGpJB10RkRQOwkJ6_cVz=qX2qkQPxp5rmf802qOiss+5+3xw@mail.gmail.com>
In-Reply-To: <CAGrGpJB10RkRQOwkJ6_cVz=qX2qkQPxp5rmf802qOiss+5+3xw@mail.gmail.com>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfHysozr5iazX7+4yjj2wuS2DqDgGUECl74ljF4D+wAxAtptkkCTSobxJJDl3auqCTS06TlqpOVrO8DRWya3KSuPpNDgPrWhdIUqXiyYapZzQC9ryI36x
 92DvaQmyBhNk4RYDdZOCrQKTBY79RDXxIC3rtmzr4KLiptAOhay6KemeJwioD9S54IR7xGTqEVgXz8AhSTeFWYV9JLBfM5DekaHKe/t4YNkOfAiYSTHzhrJd
 TGSIHLuXotYnNfG9BPmn1Q==
Subject: Re: [Buildroot] Buildroot Failure 2022-02-16 02:25:21
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
Content-Type: multipart/mixed; boundary="===============2192093935390137343=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2192093935390137343==
Content-Type: multipart/alternative; boundary=Apple-Mail-B271D55C-E8DF-4B88-A99E-2E8F894D2B08
Content-Transfer-Encoding: 7bit


--Apple-Mail-B271D55C-E8DF-4B88-A99E-2E8F894D2B08
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Peter,

I add ML in Cc,

> Il giorno 18 feb 2022, alle ore 20:03, Peter Thompson <peter.macleod.thomp=
son@gmail.com> ha scritto:
>=20
> =EF=BB=BF
> Hi  Giulio
>=20
> Whew - that was fast - I am back asking questions already :)....
>=20
> My bump of sdl2_ttf-2.0.15 to sdl2_ttf-2.0.18  caused an autobuilder failu=
re  2022-02-16 02:25:21.      The log indicates the problem is  pthread.h mi=
ssing when harfbuzz is specified.    See log below...

Here can you please provide me the link like below?
http://autobuild.buildroot.net/results/cba/cba34c431f8d1315e9ca9159274421a82=
19a701e//

>=20
> Not sure why sdl2_ttf-2.0.15 worked before..... =20

It seems like that between 2.0.15 to 2.0.18(maybe)
sdl2_ttf only uses harfbuzz provided by sdl2_ttf itself.
This means it=E2=80=99s skipping the one provided from Buildroot that is alr=
eady patched for harfbuzz pthread.h issue.

> Anyways, I planned to add=20
> SDL2_TTF_DEPENDENCIES +=3D  pthread
> right under
> SDL2_TTF_DEPENDENCIES +=3D  harfbuzz

I would instead try to make sdl2_ttf to choose external harfbuzz instead of u=
sing the internal one. And also, we=E2=80=99re not sure that phtread.h is no=
t provided at all.
Sometimes build systems fail to recognize headers and libs(the way they chec=
k if a library does exist or not).

>=20
> But I am having trouble testing.   When I submit
>  ./autobuild   91f241b8e96   ( I assume SHA1 is the git id =3D commit id)
> I get=20
> 404 Error Cannot get configuration for build 91f/91f241b8
> Suggestions?

Here you need to pass this sha1:
cba34c431f8d1315e9ca9159274421a8219a701e
that is the autobuilder sha1 and not the git sha1.

Take care to download the right script:
http://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build

Then to:
$ chmod a+x br-reproduce-build
Open it and adjust Buildroot path.
Then execute it with:
$ ./br-reproduce-build cba34c431f8d1315e9ca9159274421a8219a701e

Also remember that if it fails you can:
$ cd cba34c431f8d1315e9ca9159274421a8219a701e/output
$ make sdl2_ttf
or to rebuild package only:
$ make sdl2_ttf-dirclean sdl2_ttf

>=20
> --- ALTERNATE IDEA ---
>=20
> A better way to fix this issue might be to fix package/harfbuzz.   It is t=
hat dependency which needs pthread and which is causing sdl2_ttf to fail AFA=
IK.=20

If look closer the build failure you will see that it=E2=80=99s not Buildroo=
t harfbuzz that fails but a harfbuzz embedded into sdl2_ttf.=20
So what I should to is to try to make sdl2_ttf drop its internal harfbuzz an=
d use the Buildroot one.

> I see harfbuzz is maintained by you so you are an excellent person to ask.=
   =20
>=20
> I checked harfbuzz and there is=20
> 0001-meson.build-check-for-pthread.h.patch
> from Nov 2020 by Fabrice Fontaine.   Not sure if that patch was applied or=
 if it fixes my issue.=20

That is applied and actually fixes harfbuzz build failure. But as explained a=
bove you=E2=80=99re dealing with the one embedded into sdl2_ttf package.

>=20
> Should I have copied the mailing list with these questions?  I am never su=
re.=20

If you=E2=80=99re in doubt put it in Cc :-)

> Anyway - thanks for being there and helping.    It is appreciated.=20

You=E2=80=99re welcome!

Best regards

Giulio

>=20
> Peter
>=20
>=20
> In file included from external/harfbuzz-2.8.0/src/hb.hh:470,
>                  from external/harfbuzz-2.8.0/src/hb-aat-layout.cc:28:
> external/harfbuzz-2.8.0/src/hb-mutex.hh:53:10: fatal error: pthread.h: No s=
uch file or directory
>    53 | #include <pthread.h>
>       |          ^~~~~~~~~~~
> compilation terminated.
>=20

--Apple-Mail-B271D55C-E8DF-4B88-A99E-2E8F894D2B08
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Peter,<br><br>I add ML in Cc,<br><div di=
r=3D"ltr"><br><blockquote type=3D"cite">Il giorno 18 feb 2022, alle ore 20:0=
3, Peter Thompson &lt;peter.macleod.thompson@gmail.com&gt; ha scritto:<br><b=
r></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<di=
v dir=3D"ltr"><div>Hi&nbsp; Giulio</div><div><br></div><div>Whew - that was f=
ast - I am back asking questions already :)....<br></div><div><br></div><div=
>My bump of sdl2_ttf-2.0.15 to sdl2_ttf-2.0.18&nbsp; caused an autobuilder f=
ailure&nbsp; 2022-02-16 02:25:21.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The log indi=
cates the problem is&nbsp; pthread.h missing when harfbuzz is specified.&nbs=
p;&nbsp;&nbsp; See log below...<br></div></div></div></blockquote><div><br><=
/div><div>Here can you please provide me the link like below?</div><div><a h=
ref=3D"http://autobuild.buildroot.net/results/cba/cba34c431f8d1315e9ca915927=
4421a8219a701e//">http://autobuild.buildroot.net/results/cba/cba34c431f8d131=
5e9ca9159274421a8219a701e//</a></div><br><blockquote type=3D"cite"><div dir=3D=
"ltr"><div dir=3D"ltr"><div><br></div><div>Not sure why sdl2_ttf-2.0.15 work=
ed before.....&nbsp;&nbsp;</div></div></div></blockquote><div><br></div><div=
>It seems like that between 2.0.15 to 2.0.18(maybe)</div><div>sdl2_ttf only u=
ses harfbuzz provided by sdl2_ttf itself.</div><div>This means it=E2=80=99s s=
kipping the one provided from Buildroot that is already patched for harfbuzz=
 pthread.h issue.</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div d=
ir=3D"ltr"><div> Anyways, I planned to add <br></div><div>SDL2_TTF_DEPENDENC=
IES +=3D&nbsp; pthread</div><div>right under</div><div>SDL2_TTF_DEPENDENCIES=
 +=3D&nbsp; harfbuzz</div></div></div></blockquote><div><br></div><div>I wou=
ld instead try to make sdl2_ttf to choose external harfbuzz instead of using=
 the internal one. And also, we=E2=80=99re not sure that phtread.h is not pr=
ovided at all.</div><div>Sometimes build systems fail to recognize headers a=
nd libs(the way they check if a library does exist or not).</div><div><br></=
div><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div><br></d=
iv><div>But I am having trouble testing. &nbsp; When I submit<br></div><div>=
&nbsp;./autobuild &nbsp; 91f241b8e96&nbsp;&nbsp; ( I assume SHA1 is the git i=
d =3D commit id)<br></div><div>I get <br></div><div>404 Error Cannot get con=
figuration for build 91f/91f241b8</div><div>Suggestions?<br></div></div></di=
v></blockquote><div><br></div><div>Here you need to pass this sha1:</div><di=
v>cba34c431f8d1315e9ca9159274421a8219a701e</div><div>that is the autobuilder=
 sha1 and not the git sha1.</div><div><br></div><div>Take care to download t=
he right script:</div><div><a href=3D"http://git.buildroot.net/buildroot-tes=
t/plain/utils/br-reproduce-build">http://git.buildroot.net/buildroot-test/pl=
ain/utils/br-reproduce-build</a></div><div><br></div><div>Then to:</div><div=
>$ chmod a+x br-reproduce-build</div><div>Open it and adjust Buildroot path.=
</div><div>Then execute it with:</div><div>$ ./br-reproduce-build&nbsp;<span=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">cba34c431f8d1315e=
9ca9159274421a8219a701e</span></div><div><span style=3D"caret-color: rgb(0, 0=
, 0); color: rgb(0, 0, 0);"><br></span></div><div><span style=3D"caret-color=
: rgb(0, 0, 0); color: rgb(0, 0, 0);">Also remember that if it fails you can=
:</span></div><div><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0=
, 0);">$ cd&nbsp;</span><span style=3D"caret-color: rgb(0, 0, 0); color: rgb=
(0, 0, 0);">cba34c431f8d1315e9ca9159274421a8219a701e/output</span></div><div=
><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">$ make sdl2=
_ttf</span></div><div><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0=
, 0, 0);">or to rebuild package only:</span></div><div><span style=3D"caret-=
color: rgb(0, 0, 0); color: rgb(0, 0, 0);">$ make sdl2_ttf-dirclean sdl2_ttf=
</span></div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"=
><div><br></div><div>--- ALTERNATE IDEA ---<br></div><div><br></div><div>A b=
etter way to fix this issue might be to fix package/harfbuzz. &nbsp; It is t=
hat dependency which needs pthread and which is causing sdl2_ttf to fail AFA=
IK.&nbsp;</div></div></div></blockquote><div><br></div><div>If look closer t=
he build failure you will see that it=E2=80=99s not Buildroot harfbuzz that f=
ails but a harfbuzz embedded into sdl2_ttf.&nbsp;</div><div>So what I should=
 to is to try to make sdl2_ttf drop its internal harfbuzz and use the Buildr=
oot one.</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr=
"><div> I see harfbuzz is maintained by you so you are an excellent person t=
o ask.&nbsp; &nbsp; <br></div><div><br></div><div>I checked harfbuzz and the=
re is <br></div><div>0001-meson.build-check-for-pthread.h.patch</div><div>fr=
om Nov 2020 by Fabrice Fontaine.&nbsp;&nbsp; Not sure if that patch was appl=
ied or if it fixes my issue.&nbsp;<br></div></div></div></blockquote><div><b=
r></div><div>That is applied and actually fixes harfbuzz build failure. But a=
s explained above you=E2=80=99re dealing with the one embedded into sdl2_ttf=
 package.</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"lt=
r"><div><br></div><div>Should I have copied the mailing list with these ques=
tions?&nbsp; I am never sure. <br></div></div></div></blockquote><div><br></=
div><div>If you=E2=80=99re in doubt put it in Cc :-)</div><br><blockquote ty=
pe=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div>Anyway - thanks for being=
 there and helping.&nbsp;&nbsp;&nbsp; It is appreciated. <br></div></div></d=
iv></blockquote><div><br></div>You=E2=80=99re welcome!<div><br></div><div>Be=
st regards</div><div><br></div><div>Giulio</div><div><br><blockquote type=3D=
"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div>Peter</div><div=
><br></div><div><br></div><div><pre>In file included from external/harfbuzz-=
2.8.0/src/hb.hh:470,
                 from external/harfbuzz-2.8.0/src/hb-aat-layout.cc:28:
external/harfbuzz-2.8.0/src/hb-mutex.hh:53:10: fatal error: pthread.h: No su=
ch file or directory
   53 | #include &lt;pthread.h&gt;
      |          ^~~~~~~~~~~
compilation terminated.</pre></div><div><pre><br></pre></div></div>
</div></blockquote></div></body></html>=

--Apple-Mail-B271D55C-E8DF-4B88-A99E-2E8F894D2B08--

--===============2192093935390137343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2192093935390137343==--
