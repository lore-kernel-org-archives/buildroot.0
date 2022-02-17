Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB41C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 769F960BE8;
	Thu, 17 Feb 2022 20:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6Tv79WHtv-M; Thu, 17 Feb 2022 20:52:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92FC660A8A;
	Thu, 17 Feb 2022 20:52:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBD7C1BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B522A400D8
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qxJu0INNSrjY for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:52:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AB6D40227
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:52:09 +0000 (UTC)
Received: from smtpclient.apple ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPA
 id Knl2nAsQgSCAGKnl2ne5m0; Thu, 17 Feb 2022 21:52:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645131128; bh=GPmIoWUPyBlLltKGor3yG7PXPsSMrSXIC7UI6yhKUtk=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=D2oq8Y4dwflMZAeuLQdoWd/UmPs+StJZzy5o5ApgLlPp1YhXtOByK86orfJLGg0kv
 ar/xr/P4NIihSTF4vL7Yy6I3QSXYBNwdpBrCzbV+P6wHZVpYZnqf9yTMYBRO3jexW7
 IcLZ5LqpIFYbbgGcCBGC9106A3nL4xVJwFsaWRTTfbZMv9wTYRIWFLNkEsOtG0zBla
 bk05jPqB+E+SdeIQZt989EdNnfrBf/S38KCNhY+ep/gu/YFov9Aee/54S76sTDQgxZ
 lBrv2MiXerRpRWT6AIphQ0Jl+sL6hi57cI2oT4U1NAKOgUdVuWNnkXkzVUoWv+4cT2
 kPl5eSFR9NpdA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 17 Feb 2022 21:52:07 +0100
Message-Id: <72EB6D19-6401-4EF9-B07C-85CC767E3FA3@benettiengineering.com>
References: <20220217204339.GI522310@scaer>
In-Reply-To: <20220217204339.GI522310@scaer>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfJItzwb+QsAeDrp5Scje5l2zSvqhgTwc4D9F68NaGPr9qa3zGcTqMwataX0DZ3K7GkNy3maikBjAv0p1dk8b7NSWO0gop/d9YJS2SBA08fo5BmTnBI9A
 GgydAh7hYwyigJcJn5OgKBYSKsWHuur4unNB3oA3Z/N2Z8SDYdA/eICz0mrTytBwD6RV1NnKQOhU5AcdsejuU5gVfkDMuWHfZb0eLS5RioZO9wkDLczh5rPd
 crprFsXl+/TpUjnWd4pnkxV9mK1f6ueDW4JcaxLje50YghXOVa6GA2C72fcdnRhgNg/G6TnN+HHusXSm+jIHIA==
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptsetup: fix build failure
 with libgcrypt
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
Cc: moritz@h6t.eu, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1140509980489346847=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1140509980489346847==
Content-Type: multipart/alternative; boundary=Apple-Mail-F70BB444-1097-44C4-815C-133672F698FE
Content-Transfer-Encoding: 7bit


--Apple-Mail-F70BB444-1097-44C4-815C-133672F698FE
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Yann, Moritz,

> Il giorno 17 feb 2022, alle ore 21:44, Yann E. MORIN <yann.morin.1998@free=
.fr> ha scritto:
>=20
> =EF=BB=BFGiulio, All,
>=20
> On 2022-02-17 14:29 +0100, Giulio Benetti spake thusly:
>>>> Il giorno 17 feb 2022, alle ore 08:55, Moritz Bitsch via buildroot <bui=
ldroot@buildroot.org> ha scritto:
>>> The patch 0001-Add-check-program-for-symver-attribute.patch touches
>>> a autoconf relevant file which causes a configure --recheck in the
>>> make step without proper CONF_ENV. Running autoreconf prevents this.
>> Thank you for the contribution, but Fabrice already sent a patch for that=
:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20220213210504.14168=
61-1-fontaine.fabrice@gmail.com/
>=20
> Yep, but in this case, I applied Moritz' patch, because Fabrice has
> waaaayyyy too many commits in his name already! ;-]

Yes, Moritz, feel free to send patches for other build failures you can find=
 here in autobuilder:
http://autobuild.buildroot.net/

They are more than welcome!

Kind regards
Giulio

>=20
> Regards,
> Yann E. MORIN.
>=20
> --=20
> .-----------------.--------------------.------------------.---------------=
-----.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspir=
acy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___          =
     |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is=
 no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspira=
cy.  |
> '------------------------------^-------^------------------^---------------=
-----'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-F70BB444-1097-44C4-815C-133672F698FE
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div>Hi Yann, Moritz,</div><br><div dir=3D"=
ltr"><blockquote type=3D"cite">Il giorno 17 feb 2022, alle ore 21:44, Yann E=
. MORIN &lt;yann.morin.1998@free.fr&gt; ha scritto:<br><br></blockquote></di=
v><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Giulio, All,</sp=
an><br><span></span><br><span>On 2022-02-17 14:29 +0100, Giulio Benetti spak=
e thusly:</span><br><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n>Il giorno 17 feb 2022, alle ore 08:55, Moritz Bitsch via buildroot &lt;bui=
ldroot@buildroot.org&gt; ha scritto:</span><br></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>The patch 0001-Add-ch=
eck-program-for-symver-attribute.patch touches</span><br></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>a autoconf r=
elevant file which causes a configure --recheck in the</span><br></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>mak=
e step without proper CONF_ENV. Running autoreconf prevents this.</span><br>=
</blockquote></blockquote><blockquote type=3D"cite"><span>Thank you for the c=
ontribution, but Fabrice already sent a patch for that:</span><br></blockquo=
te><blockquote type=3D"cite"><span>https://patchwork.ozlabs.org/project/buil=
droot/patch/20220213210504.1416861-1-fontaine.fabrice@gmail.com/</span><br><=
/blockquote><span></span><br><span>Yep, but in this case, I applied Moritz' p=
atch, because Fabrice has</span><br><span>waaaayyyy too many commits in his n=
ame already! ;-]</span><br></div></blockquote><div><br></div><div>Yes, Morit=
z, feel free to send patches for other build failures you can find here in a=
utobuilder:</div><div><a href=3D"http://autobuild.buildroot.net/">http://aut=
obuild.buildroot.net/</a></div><div><br></div><div>They are more than welcom=
e!</div><div><br></div><div>Kind regards</div><div>Giulio</div><div><br></di=
v><blockquote type=3D"cite"><div dir=3D"ltr"><span></span><br><span>Regards,=
</span><br><span>Yann E. MORIN.</span><br><span></span><br><span>-- </span><=
br><span>.-----------------.--------------------.------------------.--------=
------------.</span><br><span>| &nbsp;Yann E. MORIN &nbsp;| Real-Time Embedd=
ed | /"\ ASCII RIBBON | Erics' conspiracy: |</span><br><span>| +33 662 376 0=
56 | Software &nbsp;Designer | \ / CAMPAIGN &nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;=
___ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;|</span><br><span>| +33 561 099 427 `------------.-------: &nbsp=
;X &nbsp;AGAINST &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;\e/ &nbsp;There is no=
 &nbsp;|</span><br><span>| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML M=
AIL &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;v &nbsp;&nbsp;conspiracy. &nbsp;|</span>=
<br><span>'------------------------------^-------^------------------^-------=
-------------'</span><br><span>_____________________________________________=
__</span><br><span>buildroot mailing list</span><br><span>buildroot@buildroo=
t.org</span><br><span>https://lists.buildroot.org/mailman/listinfo/buildroot=
</span><br></div></blockquote></body></html>=

--Apple-Mail-F70BB444-1097-44C4-815C-133672F698FE--

--===============1140509980489346847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1140509980489346847==--
