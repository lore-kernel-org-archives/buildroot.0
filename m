Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03964C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 907D182D40;
	Mon,  2 May 2022 22:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06YPhOoNVfKC; Mon,  2 May 2022 22:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C51E82C04;
	Mon,  2 May 2022 22:39:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 766271BF39A
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 22:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72B734161D
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 22:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kdxsPIXo6yPt for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 22:39:36 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E5B341612
 for <buildroot@buildroot.org>; Mon,  2 May 2022 22:39:36 +0000 (UTC)
Received: from smtpclient.apple ([151.82.138.250])
 by Aruba Outgoing Smtp  with ESMTPA
 id leaknKei6MQNQlealnXCpZ; Tue, 03 May 2022 00:32:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1651530751; bh=TrWubIPmU2/m88autpshH8UzM2qg3zif741yeNSjSxM=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=BpaoKwlgv9aJyW2+vWcO5rhHoLX50mLqyrJKD2EgRYLg8gvmuONGHojIecgkFDS35
 V6NRicPWfo5bRv2beVw0EvvWFZpgBac3pg5w+W2SjvMgLS1Cay2kjowbCtGc5PoN9O
 KUWZIdvtZlBfT3REnN/xR8Diyai6mVxpmAFmebYAiJfyQpY7ppDNBvssew+gwX5GwR
 B+lnoDs7c8JbJ6BlzyJ0LnMq7mKH8koM22V2MPF8anUEMbR38v01UopyJMlugSeeJr
 CI/bgQu0AtPtTvWK9uw+H3yVyBTtckP8VZ9SZkOyuu5Yimklv0YSBKdSYYx5U96AV/
 NhgSN5mZgDjjQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 3 May 2022 00:32:30 +0200
Message-Id: <BA9620C9-EFA1-4ED8-93AB-37B17ECDABFC@benettiengineering.com>
References: <6d240506-25df-6db2-f62b-f2c04360b968@mind.be>
In-Reply-To: <6d240506-25df-6db2-f62b-f2c04360b968@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (19E258)
X-CMAE-Envelope: MS4xfCMyPcobHwPiEaB2B+C6JkbS2YCYjhReTLIaWOfVI78B6Q95brC0W7A9ImQIviquSm0HIHqRu38b3+vCJ2cmDJL1MkIQ5JRP5743yTNJHWaVyHYaaV6m
 Yoq4mmyb4Bu3Mokd0H+wTZmM0VQ0FYfMsgkgsSXwojR9XAjwIfwFzQfb6rg5D+lowr/oDT65rjaqeMmNPkTKiRbf5WZfvtWgApozKIngVvx/W8tMnodn6mzr
 rSp7XEmAgh4f9TJxk9Ex00iT+gwGYfjB8W0hxP1bO/9lyACIkx6afe5tAxmDhxNQ
Subject: Re: [Buildroot] [PATCH] package/libnss: bump to version 3.78
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8965152462142178250=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8965152462142178250==
Content-Type: multipart/alternative; boundary=Apple-Mail-FD8A1BAD-2449-4A06-894D-E169681EFC5A
Content-Transfer-Encoding: 7bit


--Apple-Mail-FD8A1BAD-2449-4A06-894D-E169681EFC5A
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Arnout,

> Il giorno 2 mag 2022, alle ore 23:53, Arnout Vandecappelle <arnout@mind.be=
> ha scritto:
>=20
> =EF=BB=BF
>=20
>> On 01/05/2022 02:07, Giulio Benetti wrote:
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>=20
> Applied to master, thanks.
>=20
> This isn't a security bump?

It seems not, Mozilla is not giving release notes since 6/8 months. So I=E2=80=
=99ve just checked and found this:

https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2021-43527

Where they state the CVE is present if NSS < 3.73 or < 3.68.1 and every webs=
ite states the same.
So no this is not a security bump.
I will take care on next bumps to signal if it is a security bump or not.

Best regards
Giulio

>=20
> Regards,
> Arnout
>=20
>> ---
>>  package/libnss/libnss.hash | 4 ++--
>>  package/libnss/libnss.mk   | 2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
>> index 04e81e6b84..0c06495f5e 100644
>> --- a/package/libnss/libnss.hash
>> +++ b/package/libnss/libnss.hash
>> @@ -1,4 +1,4 @@
>> -# =46rom https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_77_RTM/=
src/SHA256SUMS
>> -sha256  825edf5a2fd35b788a23ff80face591f82919ae3ad2b8f77d424a450d618dedd=
  nss-3.77.tar.gz
>> +# =46rom https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_78_RTM/=
src/SHA256SUMS
>> +sha256  f455f341e787c1167328e80a84f77b9a557d595066dda6486a1874d72da68800=
  nss-3.78.tar.gz
>>  # Locally calculated
>>  sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4=
  nss/COPYING
>> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
>> index 7568ec67ed..540092dfcf 100644
>> --- a/package/libnss/libnss.mk
>> +++ b/package/libnss/libnss.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ########################################################################=
########
>>  -LIBNSS_VERSION =3D 3.77
>> +LIBNSS_VERSION =3D 3.78
>>  LIBNSS_SOURCE =3D nss-$(LIBNSS_VERSION).tar.gz
>>  LIBNSS_SITE =3D https://ftp.mozilla.org/pub/mozilla.org/security/nss/rel=
eases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>>  LIBNSS_DISTDIR =3D dist
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-FD8A1BAD-2449-4A06-894D-E169681EFC5A
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Arnout,<br><div dir=3D"ltr"><br><blockqu=
ote type=3D"cite">Il giorno 2 mag 2022, alle ore 23:53, Arnout Vandecappelle=
 &lt;arnout@mind.be&gt; ha scritto:<br><br></blockquote></div><blockquote ty=
pe=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span></span><br><span></span><br><spa=
n>On 01/05/2022 02:07, Giulio Benetti wrote:</span><br><blockquote type=3D"c=
ite"><span>Signed-off-by: Giulio Benetti &lt;giulio.benetti@benettiengineeri=
ng.com&gt;</span><br></blockquote><span></span><br><span> Applied to master,=
 thanks.</span><br><span></span><br><span> This isn't a security bump?</span=
><br></div></blockquote><div><br></div><div>It seems not, Mozilla is not giv=
ing release notes since 6/8 months. So I=E2=80=99ve just checked and found t=
his:</div><div><br></div><div><a href=3D"https://cve.mitre.org/cgi-bin/cvena=
me.cgi?name=3DCVE-2021-43527">https://cve.mitre.org/cgi-bin/cvename.cgi?name=
=3DCVE-2021-43527</a></div><div><br></div><div>Where they state the CVE is p=
resent if NSS &lt; 3.73 or &lt; 3.68.1 and every website states the same.</d=
iv><div>So no this is not a security bump.</div><div>I will take care on nex=
t bumps to signal if it is a security bump or not.</div><div><br></div><div>=
Best regards</div><div>Giulio</div><br><blockquote type=3D"cite"><div dir=3D=
"ltr"><span></span><br><span> Regards,</span><br><span> Arnout</span><br><sp=
an></span><br><blockquote type=3D"cite"><span>---</span><br></blockquote><bl=
ockquote type=3D"cite"><span> &nbsp;package/libnss/libnss.hash | 4 ++--</spa=
n><br></blockquote><blockquote type=3D"cite"><span> &nbsp;package/libnss/lib=
nss.mk &nbsp;&nbsp;| 2 +-</span><br></blockquote><blockquote type=3D"cite"><=
span> &nbsp;2 files changed, 3 insertions(+), 3 deletions(-)</span><br></blo=
ckquote><blockquote type=3D"cite"><span>diff --git a/package/libnss/libnss.h=
ash b/package/libnss/libnss.hash</span><br></blockquote><blockquote type=3D"=
cite"><span>index 04e81e6b84..0c06495f5e 100644</span><br></blockquote><bloc=
kquote type=3D"cite"><span>--- a/package/libnss/libnss.hash</span><br></bloc=
kquote><blockquote type=3D"cite"><span>+++ b/package/libnss/libnss.hash</spa=
n><br></blockquote><blockquote type=3D"cite"><span>@@ -1,4 +1,4 @@</span><br=
></blockquote><blockquote type=3D"cite"><span>-# =46rom https://ftp.mozilla.=
org/pub/security/nss/releases/NSS_3_77_RTM/src/SHA256SUMS</span><br></blockq=
uote><blockquote type=3D"cite"><span>-sha256 &nbsp;825edf5a2fd35b788a23ff80f=
ace591f82919ae3ad2b8f77d424a450d618dedd &nbsp;nss-3.77.tar.gz</span><br></bl=
ockquote><blockquote type=3D"cite"><span>+# =46rom https://ftp.mozilla.org/p=
ub/security/nss/releases/NSS_3_78_RTM/src/SHA256SUMS</span><br></blockquote>=
<blockquote type=3D"cite"><span>+sha256 &nbsp;f455f341e787c1167328e80a84f77b=
9a557d595066dda6486a1874d72da68800 &nbsp;nss-3.78.tar.gz</span><br></blockqu=
ote><blockquote type=3D"cite"><span> &nbsp;# Locally calculated</span><br></=
blockquote><blockquote type=3D"cite"><span> &nbsp;sha256 &nbsp;a20c1a32d1f81=
02432360b42e932869f7c11c7cdbacf9cac554c422132af47f4 &nbsp;nss/COPYING</span>=
<br></blockquote><blockquote type=3D"cite"><span>diff --git a/package/libnss=
/libnss.mk b/package/libnss/libnss.mk</span><br></blockquote><blockquote typ=
e=3D"cite"><span>index 7568ec67ed..540092dfcf 100644</span><br></blockquote>=
<blockquote type=3D"cite"><span>--- a/package/libnss/libnss.mk</span><br></b=
lockquote><blockquote type=3D"cite"><span>+++ b/package/libnss/libnss.mk</sp=
an><br></blockquote><blockquote type=3D"cite"><span>@@ -4,7 +4,7 @@</span><b=
r></blockquote><blockquote type=3D"cite"><span> &nbsp;#</span><br></blockquo=
te><blockquote type=3D"cite"><span> &nbsp;##################################=
##############################################</span><br></blockquote><block=
quote type=3D"cite"><span> &nbsp;-LIBNSS_VERSION =3D 3.77</span><br></blockq=
uote><blockquote type=3D"cite"><span>+LIBNSS_VERSION =3D 3.78</span><br></bl=
ockquote><blockquote type=3D"cite"><span> &nbsp;LIBNSS_SOURCE =3D nss-$(LIBN=
SS_VERSION).tar.gz</span><br></blockquote><blockquote type=3D"cite"><span> &=
nbsp;LIBNSS_SITE =3D https://ftp.mozilla.org/pub/mozilla.org/security/nss/re=
leases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src</span><br></blockquote><bl=
ockquote type=3D"cite"><span> &nbsp;LIBNSS_DISTDIR =3D dist</span><br></bloc=
kquote><span>_______________________________________________</span><br><span=
>buildroot mailing list</span><br><span>buildroot@buildroot.org</span><br><s=
pan>https://lists.buildroot.org/mailman/listinfo/buildroot</span><br></div><=
/blockquote></body></html>=

--Apple-Mail-FD8A1BAD-2449-4A06-894D-E169681EFC5A--

--===============8965152462142178250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8965152462142178250==--
