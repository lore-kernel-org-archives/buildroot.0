Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F12C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 22:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 679A560A9D;
	Sun, 26 Nov 2023 22:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 679A560A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0WVziIbHbuTR; Sun, 26 Nov 2023 22:17:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C48B60BED;
	Sun, 26 Nov 2023 22:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C48B60BED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2044D1BF215
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 22:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBED860BED
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 22:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBED860BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9eTLpxnuhJM for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 22:17:55 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 063B360A9D
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 22:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 063B360A9D
ARC-Seal: i=1; a=rsa-sha256; t=1701037072; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=ZG38oG8hG1Q2mdAWL+z9z1ymAcqe0exE5jDF4MT2ophd45FMubTMXaXXCr+8QwmjXQ
 BOIev3aQFU+9uVJXRkRCRhBZnqkdOLEUpDFpoP/NitO91QQw5Ic7S5kmvWjJc3m5QH83
 sMVTlDWF3WWPHORh/mVwLFXhk7ZgVajbUcoEfJFVRXv4t7+OglV38QFR0HV+hQuw2PNy
 md4j39000ILMsSPITDKjgCG1Z8ph/K0A+T5LsjU7x4TDDkaM0H6mGGPUnHkTtTvC+d6Y
 YuCgjQWMmKiH7ZtwOhucXY/qBcERtpJT9job+OcbObxqvN50KSkCvOGycvDQAE5gAkau
 dKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701037072;
 s=strato-dkim-0002; d=strato.com;
 h=Message-ID:References:In-Reply-To:Reply-to:Subject:To:From:Date:Cc:
 Date:From:Subject:Sender;
 bh=UmlHD5M67uL/gijwO/tPdF4hLiNd56tGleuy0UdwYrE=;
 b=hNXMseJUr9VcZcIi0aJRrqC9i58BG1nGAhepEKYlDxX8n/2n84bZaMEzJ5GDiAE8Qf
 0LwuSMTBw2byo2fqh73jiu/xu0PVtK2fL4GXsG9kLPzzfcg30I86iZzaMqioRMrpQ/9r
 pnQvVd+Icf5QrHvY0Py5n+aIwpdGFPsGMpM254bHAU4n5FZCvs6O00Nwlo3380/SbqGq
 4RMhm/c9TNsuwEiU9QGu+ApqDQQxxjTJIkUThbWzuDyh9zcAaCAdnPEzh+zufRUhVn7s
 lc0dpDFx/F+kper+3g/bAE9CWZJXP6WpTWCmYEzFVPAQE0MCMGHzcID6S4SIhUfOdwLT
 EZdg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":IGkLe0G6f98kjqfw4wUQFrlMTRmdcFArqMJ/8fSjEoKsocSmf3F8nXFB3POYuFu6"
Received: from [127.0.0.1] by smtp.strato.de (RZmta 49.9.1 DYNA|AUTH)
 with ESMTPSA id k8f8b7zAQMHqdiN
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Sun, 26 Nov 2023 23:17:52 +0100 (CET)
Date: Sun, 26 Nov 2023 23:17:51 +0100
From: Leo <info.leo@widler.de>
To: buildroot@buildroot.org
In-Reply-To: <20231126215644.GO3177259@scaer>
References: <20231126214357.3376407-1-info.leo@widler.de>
 <20231126215644.GO3177259@scaer>
Message-ID: <9CB2714C-64FC-4E32-BD7D-12F72EC7EC34@widler.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1701037072; 
 s=strato-dkim-0002; d=widler.de;
 h=Message-ID:References:In-Reply-To:Reply-to:Subject:To:From:Date:Cc:
 Date:From:Subject:Sender;
 bh=UmlHD5M67uL/gijwO/tPdF4hLiNd56tGleuy0UdwYrE=;
 b=JwKRO+gUZxagq1JpwFKtUpzl4Qawx5KvY0tm/L+0I4lLyuqWBaI5I4X0WRNpycSJ89
 UTD6FZ4xG0Ic8BVAZ8sO5yhpL1s51VV4so6UrVv+hu5xonP3PtNiclEQVLWPv2TzNRK0
 vZOxoCNDeJyPSKtrR0XEu76MCbeiRk/z4fIxhgAmLPJW6ym9ALfMOfFCOPu8pagKKpfI
 2NWDL7aj9/maGWtwKvWv/IE4Pw/c78W18aKtV4lqOzn5BsC7WBbfDZRL2leeZqcdGXQf
 mbuBiYMrs4NvfOj8B4zUx5ROUnJ4karVPjE3eUBrPGv4L9aSDty2vJZJGo16NtyBvwq7
 KNKw==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1701037072; 
 s=strato-dkim-0003; d=widler.de;
 h=Message-ID:References:In-Reply-To:Reply-to:Subject:To:From:Date:Cc:
 Date:From:Subject:Sender;
 bh=UmlHD5M67uL/gijwO/tPdF4hLiNd56tGleuy0UdwYrE=;
 b=QdJ1trmmq/Z1CG4WFP2nUb3EaxhqZ0KaiHTacehj3s8smACzSJ7q9nvA9ANvFY9Gze
 Dmfr/kV78D7wX87VF0DQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=widler.de header.i=@widler.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=JwKRO+gU; 
 dkim=pass header.d=widler.de header.i=@widler.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=QdJ1trmm
Subject: Re: [Buildroot] [PATCH 1/1] package/attr: add --enable-multilib to
 fix build error for BL808 based boards
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
Reply-To: info.leo@widler.de
Content-Type: multipart/mixed; boundary="===============3089557188883187025=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3089557188883187025==
Content-Type: multipart/alternative;
 boundary=----I2W4RN31GD9QKOYJGE1LOXOQE4S6FA
Content-Transfer-Encoding: 7bit

------I2W4RN31GD9QKOYJGE1LOXOQE4S6FA
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I'll change my name, thanks for letting me know

The failure is on none of the auto builders=2E I have uploaded the config=
=2Elog here: https://pastebin=2Ecom/ZzP6pNvx

And to fix this issue I added the --enable-multilib option which resolves =
the problem=2E

Regards,
Leonard Widler

Am 26=2E November 2023 22:56:44 MEZ schrieb "Yann E=2E MORIN" <yann=2Emori=
n=2E1998@free=2Efr>:
>leow149, All,
>
>Thank you for your contribution! Here is a quick review=2E
>
>First, we'll need you to use your real name as the author of the patch;
>we do not accept annonymous (od pseduonymou) contributions=2E
>
>On 2023-11-26 22:43 +0100, leow149 spake thusly:
>> This commit fixes a build error which specifically happens for Bouffall=
o Labs BL808 based boards, but might also happen on other RiscV64 Boards=2E
>
>Please wrap your commit log to ~72 chars=2E
>
>Waht is the error that you see? Could you see if there is a similar
>build failure on out autobulders:
>    http://autobuild=2Ebuildroot=2Eorg/?static=3D1&reason=3Dattr-%
>
>The last build error for attr was more than a year ago now, so it is
>relatively surprising to see that attr does not build=2E So we'll need a
>bit more context=2E
>
>> Signed-off-by: leow149 <info=2Eleo@widler=2Ede>
>> ---
>>  package/attr/attr=2Emk | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/package/attr/attr=2Emk b/package/attr/attr=2Emk
>> index 0327497e1e=2E=2E89f7d21f0c 100644
>> --- a/package/attr/attr=2Emk
>> +++ b/package/attr/attr=2Emk
>> @@ -13,7 +13,8 @@ ATTR_CPE_ID_VENDOR =3D attr_project
>> =20
>>  ATTR_INSTALL_STAGING =3D YES
>> =20
>> -ATTR_CONF_OPTS =3D --disable-nls
>> -
>> +ATTR_CONF_OPTS =3D \
>> +	--disable-nls \
>> +	--enable-multilib
>
>Buildroot does not generate multilib toolchains, and when using an
>external toolchain that is multilib, the proper multilib diretory is
>copies over to the sysroot=2E
>
>So, --eanble-multilib looksa like the wrong approach, at least without
>more explanations=2E
>
>Can you elaborate on the issue you encounter, and what makes you think
>--enable-multilib is the correct solution?
>
>Thanks!
>
>Regards,
>Yann E=2E MORIN=2E
>
>>  $(eval $(autotools-package))
>>  $(eval $(host-autotools-package))
>> --=20
>> 2=2E30=2E2
>>=20
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot=2Eorg
>> https://lists=2Ebuildroot=2Eorg/mailman/listinfo/buildroot
>
>--=20
>=2E-----------------=2E--------------------=2E------------------=2E------=
--------------=2E
>|  Yann E=2E MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' cons=
piracy: |
>| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___         =
      |
>| +33 561 099 427 `------------=2E-------:  X  AGAINST      |  \e/  There=
 is no  |
>| http://ymorin=2Eis-a-geek=2Eorg/ | _/*\_ | / \ HTML MAIL    |   v   con=
spiracy=2E  |
>'------------------------------^-------^------------------^--------------=
------'
>_______________________________________________
>buildroot mailing list
>buildroot@buildroot=2Eorg
>https://lists=2Ebuildroot=2Eorg/mailman/listinfo/buildroot

------I2W4RN31GD9QKOYJGE1LOXOQE4S6FA
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div dir=3D"auto">Hi,<br><br>I'll change my name, =
thanks for letting me know<br><br>The failure is on none of the auto builde=
rs=2E I have uploaded the config=2Elog here: <a href=3D"https://pastebin=2E=
com/ZzP6pNvx">https://pastebin=2Ecom/ZzP6pNvx</a><br><br>And to fix this is=
sue I added the --enable-multilib option which resolves the problem=2E<br><=
br>Regards,<br>Leonard Widler</div><br><br><div class=3D"gmail_quote"><div =
dir=3D"auto">Am 26=2E November 2023 22:56:44 MEZ schrieb "Yann E=2E MORIN" =
&lt;yann=2Emorin=2E1998@free=2Efr&gt;:</div><blockquote class=3D"gmail_quot=
e" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 20=
4, 204); padding-left: 1ex;">
<pre class=3D"k9mail"><div dir=3D"auto">leow149, All,<br><br>Thank you for=
 your contribution! Here is a quick review=2E<br><br>First, we'll need you =
to use your real name as the author of the patch;<br>we do not accept annon=
ymous (od pseduonymou) contributions=2E<br><br>On 2023-11-26 22:43 +0100, l=
eow149 spake thusly:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-left: 1e=
x;"><div dir=3D"auto">This commit fixes a build error which specifically ha=
ppens for Bouffallo Labs BL808 based boards, but might also happen on other=
 RiscV64 Boards=2E<br></div></blockquote><div dir=3D"auto"><br>Please wrap =
your commit log to ~72 chars=2E<br><br>Waht is the error that you see? Coul=
d you see if there is a similar<br>build failure on out autobulders:<br>   =
 <a href=3D"http://autobuild=2Ebuildroot=2Eorg/?static=3D1&amp;reason=3Datt=
r-%">http://autobuild=2Ebuildroot=2Eorg/?static=3D1&amp;reason=3Dattr-%</a>=
<br><br>The last build error for attr was more than a year ago now, so it i=
s<br>relatively surprising to see that attr does not build=2E So we'll need=
 a<br>bit more context=2E<br><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding=
-left: 1ex;"><div dir=3D"auto">Signed-off-by: leow149 &lt;info=2Eleo@widler=
=2Ede&gt;<hr> package/attr/attr=2Emk | 5 +++--<br> 1 file changed, 3 insert=
ions(+), 2 deletions(-)<br><br>diff --git a/package/attr/attr=2Emk b/packag=
e/attr/attr=2Emk<br>index 0327497e1e=2E=2E89f7d21f0c 100644<br>--- a/packag=
e/attr/attr=2Emk<br>+++ b/package/attr/attr=2Emk<br>@@ -13,7 +13,8 @@ ATTR_=
CPE_ID_VENDOR =3D attr_project<br> <br> ATTR_INSTALL_STAGING =3D YES<br> <b=
r>-ATTR_CONF_OPTS =3D --disable-nls<br>-<br>+ATTR_CONF_OPTS =3D \<br>+	--di=
sable-nls \<br>+	--enable-multilib<br></div></blockquote><div dir=3D"auto">=
<br>Buildroot does not generate multilib toolchains, and when using an<br>e=
xternal toolchain that is multilib, the proper multilib diretory is<br>copi=
es over to the sysroot=2E<br><br>So, --eanble-multilib looksa like the wron=
g approach, at least without<br>more explanations=2E<br><br>Can you elabora=
te on the issue you encounter, and what makes you think<br>--enable-multili=
b is the correct solution?<br><br>Thanks!<br><br>Regards,<br>Yann E=2E MORI=
N=2E<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0p=
t 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"><div dir=
=3D"auto"> $(eval $(autotools-package))<br> $(eval $(host-autotools-package=
))<br><div class=3D"k9mail-signature">-- <br>2=2E30=2E2<hr>buildroot mailin=
g list<br>buildroot@buildroot=2Eorg<br><a href=3D"https://lists=2Ebuildroot=
=2Eorg/mailman/listinfo/buildroot">https://lists=2Ebuildroot=2Eorg/mailman/=
listinfo/buildroot</a><br></div></div></blockquote><div dir=3D"auto"><br></=
div></pre></blockquote></div></body></html>
------I2W4RN31GD9QKOYJGE1LOXOQE4S6FA--

--===============3089557188883187025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3089557188883187025==--
