Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602A4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 23:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8E7660AD0;
	Sun, 30 Jan 2022 23:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wi5pNzVLYul1; Sun, 30 Jan 2022 23:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D87C260A9E;
	Sun, 30 Jan 2022 23:48:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1D021BF4D8
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 23:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC8E483FA9
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 23:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pzZh_8lsii4f for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 23:48:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AE5C83FA6
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 23:48:15 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id EJvYnjI1SDzPJEJvYn5GDJ; Mon, 31 Jan 2022 00:48:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643586492; bh=r7YkPUjfD6Nv3Yb7gFs/BMdFNAPv5BXOg86WkUlyedc=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=CcS4zhSFSv0AjrYRg4x9LKRz+8Y0Bv8fJy6nIm+S4vWwSHWzXQD0E22k//TYbNC00
 DcEZsQldN4QtFH4Vw87n/GNYAPECVf9qflRQsQ4pPQVFVy90spNsY3XTBPPWl1iyeh
 GbYeipUm5jmuJmT9DPpfvd6zAFfN/J8riDOeGwWDCe7NyNNMm0yPo4AQbYyggCCF/N
 xw22z7uOnWgtVCUyInEfh9CVw4d6TIP6xFXA4TeTEn1nV8nXz66LS5jMJsIjOndWO8
 VZ4123ZZKM02+pMFdOMgLZfAGJE4+tl/HMW8rb8an0E6U2MOJqqziLG3KnvKeWCibI
 /ptt7sdeFrBhg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Message-Id: <D7F1931E-9222-48C8-A285-4C1F5D215078@benettiengineering.com>
Date: Mon, 31 Jan 2022 00:48:11 +0100
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfEx8F6EsilGIN32AnOv5AR8Wh9+ERLpdIjRZ0pdjyS5mg/oTGLm4QHZ+IifqAIdg1SixN6f9AXbo5rXjkHffFIqxKh3OkpcH53E6lIBDxjW3ZYde5S/R
 cBpfLtqZneUh+QFUILs2P2wXupYCPDzDMhh87DtvZwO6K5dR7/hzZqRACJJVDY7bvZJyvDH+LSGTU3fwQxZvAHOZ2SZP1JcXy179MbQq50ZWRjH9pqEsE3TI
 phBGAVvpgJMoFt1J+XfpvV3UlfJ6XnPC4oIBb8lMOrM9CipITZep/f0Gd/bEG6YNbdOnnHKDS9OXtviXkOtOhhj1m4oNbhOss1JWasSNupb1Yw9XKRePPz68
 lE66yo2FhizBqr3vmY+lZxV33m4mkA==
Subject: Re: [Buildroot] [PATCH] board: Add support for iMX8MN BSH SMM S2 PRO
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7784432500149141177=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7784432500149141177==
Content-Type: multipart/alternative; boundary=Apple-Mail-4E6BAA9A-D32B-4042-A874-FA35D3F2817D
Content-Transfer-Encoding: 7bit


--Apple-Mail-4E6BAA9A-D32B-4042-A874-FA35D3F2817D
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFHi Michael,

+Cc

> Il giorno 31 gen 2022, alle ore 00:27, Michael Nazzareno Trimarchi <michae=
l@amarulasolutions.com> ha scritto:
> =EF=BB=BFHi Giulio
>=20
> On Sat, Jan 29, 2022 at 8:46 PM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
>>=20
>> Hi Michael,
>>=20
>> On 29/01/22 14:54, Giulio Benetti wrote:
>> [SNIP]
>>=20
>>>>> Have you given a go with latest Buildroot docker to check if uboot
>>>>> needs libfdtpy, python3 etc.?
>>>>> It=E2=80=99s highly probable it needs them.
>>>> Suggestion, should be given to the other newest board that was added.
>>> Correct, I=E2=80=99m going to check my latest board reviews about this
>>=20
>> I've pointed them tbh
>>=20
>>>> I think that you are talking about
>>>> host-tools here.
>>> Yes
>>>> Please point me to this buildroot docker
>>> https://hub.docker.com/r/buildroot/base/tags
>>> <https://hub.docker.com/r/buildroot/base/tags>
>>> # docker pull buildroot/base:20211120.1925
>>=20
>> This is not correct, sorry, I've just given a try and it builds
>> correctly even if it fails with gitlab CI.
>> You have to use this docker:
>> docker pull buildroot/base:20210922.2200
>=20
> I will resend. I found some wrong artifacts and I need to test it again

Ok. I was wrong anyway again with the docker.
In IRC Yann pointed me that we have to use the one in:
https://github.com/buildroot/buildroot/blob/master/.gitlab-ci.yml

So please use:
# docker pull registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314=


Anyway they=E2=80=99re pretty compatible as I=E2=80=99ve seen at uboot and L=
inux host level,
so the problems you=E2=80=99ve found there will still be on this other docke=
r.

He=E2=80=99s going to sync docker hub with that version.

Sorry for html but I=E2=80=99m on mobile :-/

Best regards
=E2=80=94-
Giulio Benetti
Benetti Engineering sas

>=20
> Michael
>=20
>> Best regards!
>> --
>> Giulio Benetti
>> Benetti Engineering sas
>=20
>=20
>=20
> --=20
> Michael Nazzareno Trimarchi
> Co-Founder & Chief Executive Officer
> M. +39 347 913 2170
> michael@amarulasolutions.com
> __________________________________
>=20
> Amarula Solutions BV
> Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> T. +31 (0)85 111 9172
> info@amarulasolutions.com
> www.amarulasolutions.com

--Apple-Mail-4E6BAA9A-D32B-4042-A874-FA35D3F2817D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">=EF=BB=BF<meta http-equiv=3D=
"content-type" content=3D"text/html; charset=3Dutf-8">Hi Michael,</div><div d=
ir=3D"ltr"><br></div><div dir=3D"ltr">+Cc<br><div dir=3D"ltr"><br><blockquot=
e type=3D"cite">Il giorno 31 gen 2022, alle ore 00:27, Michael Nazzareno Tri=
marchi &lt;michael@amarulasolutions.com&gt; ha scritto:<br><br></blockquote>=
</div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Hi Giulio</s=
pan><br><span></span><br><span>On Sat, Jan 29, 2022 at 8:46 PM Giulio Benett=
i</span><br><span>&lt;giulio.benetti@benettiengineering.com&gt; wrote:</span=
><br><blockquote type=3D"cite"><span></span><br></blockquote><blockquote typ=
e=3D"cite"><span>Hi Michael,</span><br></blockquote><blockquote type=3D"cite=
"><span></span><br></blockquote><blockquote type=3D"cite"><span>On 29/01/22 1=
4:54, Giulio Benetti wrote:</span><br></blockquote><blockquote type=3D"cite"=
><span>[SNIP]</span><br></blockquote><blockquote type=3D"cite"><span></span>=
<br></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>Have you given a go with l=
atest Buildroot docker to check if uboot</span><br></blockquote></blockquote=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>needs libfdtpy,=
 python3 etc.?</span><br></blockquote></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>It=E2=80=99s highly probable it needs the=
m.</span><br></blockquote></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></s=
pan><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>Suggestion, should be=
 given to the other newest board that was added.</span><br></blockquote></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan></span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>Correct, I=E2=80=99m going to check my latest board r=
eviews about this</span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><span></span><br></blockquote><blockquote type=3D"cite"><span>I've point=
ed them tbh</span><br></blockquote><blockquote type=3D"cite"><span></span><b=
r></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>I think that you are talking about</span><br></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>host-tools here.</span><br></blockquo=
te></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>Yes</span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>Please point me to this buildroot docker</span><br></bl=
ockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>https://hub.docker.com/r/buildroot/base/=
tags</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>&lt;https://hub.docker.com/r/buildroot/base/tags&gt;<=
/span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span># docker pull buildroot/base:20211120.1925</span><br></blo=
ckquote></blockquote><blockquote type=3D"cite"><span></span><br></blockquote=
><blockquote type=3D"cite"><span>This is not correct, sorry, I've just given=
 a try and it builds</span><br></blockquote><blockquote type=3D"cite"><span>=
correctly even if it fails with gitlab CI.</span><br></blockquote><blockquot=
e type=3D"cite"><span>You have to use this docker:</span><br></blockquote><b=
lockquote type=3D"cite"><span>docker pull buildroot/base:20210922.2200</span=
><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><s=
pan></span><br><span>I will resend. I found some wrong artifacts and I need t=
o test it again</span><br></div></blockquote><div><br></div><div>Ok. I was w=
rong anyway again with the docker.</div><div>In IRC Yann pointed me that we h=
ave to use the one in:</div><div><a href=3D"https://github.com/buildroot/bui=
ldroot/blob/master/.gitlab-ci.yml">https://github.com/buildroot/buildroot/bl=
ob/master/.gitlab-ci.yml</a></div><div><br></div><div>So please use:</div><d=
iv># docker pull&nbsp;<span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0=
, 0, 0); font-family: Menlo, &quot;DejaVu Sans Mono&quot;, &quot;Liberation M=
ono&quot;, Consolas, &quot;Ubuntu Mono&quot;, &quot;Courier New&quot;, &quot=
;andale mono&quot;, &quot;lucida console&quot;, monospace; font-size: 13px; w=
hite-space: pre-wrap; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit=
-text-size-adjust: 100%; background-color: rgb(255, 255, 255);">registry.git=
lab.com/buildroot.org/buildroot/base:20220105.2314</span></div><div><br></di=
v><div>Anyway they=E2=80=99re pretty compatible as I=E2=80=99ve seen at uboo=
t and Linux host level,</div><div>so the problems you=E2=80=99ve found there=
 will still be on this other docker.</div><div><br></div><div>He=E2=80=99s g=
oing to sync docker hub with that version.</div><div><br></div><div>Sorry fo=
r html but I=E2=80=99m on mobile :-/</div><div><br></div><div>Best regards</=
div><div>=E2=80=94-</div><div>Giulio Benetti</div><div>Benetti Engineering s=
as</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span></span><br><spa=
n>Michael</span><br><span></span><br><blockquote type=3D"cite"><span>Best re=
gards!</span><br></blockquote><blockquote type=3D"cite"><span>--</span><br><=
/blockquote><blockquote type=3D"cite"><span>Giulio Benetti</span><br></block=
quote><blockquote type=3D"cite"><span>Benetti Engineering sas</span><br></bl=
ockquote><span></span><br><span></span><br><span></span><br><span>-- </span>=
<br><span>Michael Nazzareno Trimarchi</span><br><span>Co-Founder &amp; Chief=
 Executive Officer</span><br><span>M. +39 347 913 2170</span><br><span>micha=
el@amarulasolutions.com</span><br><span>__________________________________</=
span><br><span></span><br><span>Amarula Solutions BV</span><br><span>Joop Ge=
esinkweg 125, 1114 AB, Amsterdam, NL</span><br><span>T. +31 (0)85 111 9172</=
span><br><span>info@amarulasolutions.com</span><br><span>www.amarulasolution=
s.com</span><br></div></blockquote></div></body></html>=

--Apple-Mail-4E6BAA9A-D32B-4042-A874-FA35D3F2817D--

--===============7784432500149141177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7784432500149141177==--
