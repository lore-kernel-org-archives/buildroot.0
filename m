Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E7CC0755A
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 07:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75C9381207;
	Mon, 27 Nov 2023 07:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75C9381207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vklZXdXkOsIh; Mon, 27 Nov 2023 07:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FA5C8127D;
	Mon, 27 Nov 2023 07:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA5C8127D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0EAA1BF36C
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 07:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6F9D4034D
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 07:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F9D4034D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bOPC4VPj32MN for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 07:07:21 +0000 (UTC)
X-Greylist: delayed 34219 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 27 Nov 2023 07:07:20 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97BE8402B9
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97BE8402B9
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 07:07:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1701068837; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=EFjSu4B29M1H9GpGs/9a/43KTZ+TEKh0zq2fgIEN+q5B/9G/8zuS1626B/lPlITKM/
 78fOrWJcdPWk3OX0xXY4W27p4rNz6zBNmzpVxq80AT7SQfTr8eJi8FgFbEIaMYRew2io
 m4PE//KLFgixsSg3pH3yEOl71weZsGfB1U2JAlt69mJvK2r7WxDZMhfRX8WGiBSOU6k+
 Rf6iTivLJE+hhSnLB8J80NU40LSzU8U22Io/qCciwLWFYgwKuFWNOsaaXNFR9CC/5CFF
 lAKxep6Z343MtXgYHqUxy+9FFH+VknsF5UDhLQJn0FUqwiYVCn6RtqYUzBoD77UpdECf
 zQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701068837;
 s=strato-dkim-0002; d=strato.com;
 h=Message-ID:References:In-Reply-To:Reply-to:Subject:To:From:Date:Cc:
 Date:From:Subject:Sender;
 bh=KLPgMA5en4urLRDfFuQcsGFhE+BU1tKC8Jb9SC6eYFQ=;
 b=W9/psTK75GxHVeYxzIdW5LL3KfI/FS+prqm2Hi6pzeAE1JGqK4+x5vCb8KDRmzjw1C
 Htx9hbXCy9EfMlIFXHn7lYc/rbBaiiX79XYra3d1+pSnahLQkzhbQUREtB3/EHDCALo+
 evdxeghvbBA0v9bV3lqWx/kcosNPxuF20TVCNBuelP4i1uMt/gSROeoegpAdnE0GDCGb
 U2K0lDJYEwcDBIFSNcc9+ZmQBfxxKuDWwj3zzqrbI8Lp3DIAsOiGTo76iCUN830M5mA8
 2h8M/XMlMLyWm7K/ovQmF2YjG44K4y8XEcZpssA9J0K5YImmrRkptv8KXi0UGayXRokS
 RcaA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":IGkLe0G6f98kjqfw4wUQFrlMTRmdcFArqMJ/8fSjEoKsocSmf3F8nXFB3fOYuVG6"
Received: from [127.0.0.1] by smtp.strato.de (RZmta 49.9.1 DYNA|AUTH)
 with ESMTPSA id k8f8b7zAR77He7Q
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Mon, 27 Nov 2023 08:07:17 +0100 (CET)
Date: Mon, 27 Nov 2023 08:07:17 +0100
From: Leo <info.leo@widler.de>
To: buildroot@buildroot.org
In-Reply-To: <20231127064813.GP3177259@scaer>
References: <20231126214357.3376407-1-info.leo@widler.de>
 <20231126215644.GO3177259@scaer>
 <9CB2714C-64FC-4E32-BD7D-12F72EC7EC34@widler.de>
 <20231127064813.GP3177259@scaer>
Message-ID: <0A422087-89C4-4C88-8263-E05CC5BA1FB8@widler.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1701068837; 
 s=strato-dkim-0002; d=widler.de;
 h=Message-ID:References:In-Reply-To:Reply-to:Subject:To:From:Date:Cc:
 Date:From:Subject:Sender;
 bh=KLPgMA5en4urLRDfFuQcsGFhE+BU1tKC8Jb9SC6eYFQ=;
 b=Vd94nlWIjBvVF0L9lCdJ+Eicfw8dRH4JmQawE72fy671R09C5MbOfMtF5AaIUZIBKA
 APt4yNkm2r22PnvLejCMNC8PGf0f3GUcf0ZM0xuaEpRWhRWo6M4dVoxemg0pev/LXQCe
 2LIfS+2ztYHQafUB2ZBZGxGWoz9TXlKKr0GYntbQDXqiMMjf4xVEQE+DWEQ2aBSSbp28
 99fDKNCbdoGiN1qxG93IvI4f3WuEQc6Cd4Nmwf/K+rUAqKtSti57yt5Eatso8iJV+EMS
 8bIzUqFEVgF7k+UgZStbXFghr1LbAeaKzkvUnoNBzI7rhMDMYD9kq9ZnnTWy6qZHqKq3
 HoZQ==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1701068837; 
 s=strato-dkim-0003; d=widler.de;
 h=Message-ID:References:In-Reply-To:Reply-to:Subject:To:From:Date:Cc:
 Date:From:Subject:Sender;
 bh=KLPgMA5en4urLRDfFuQcsGFhE+BU1tKC8Jb9SC6eYFQ=;
 b=mlNT/JEB9SGs26VxYQa6iBJfefr4QFuI4AOqScSK8gR7s05rHTXlJC/xe9/NZdOPH+
 2eOu77+JMDODStYYxdAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=widler.de header.i=@widler.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Vd94nlWI; 
 dkim=pass header.d=widler.de header.i=@widler.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=mlNT/JEB
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
Content-Type: multipart/mixed; boundary="===============6457959969995651542=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6457959969995651542==
Content-Type: multipart/alternative;
 boundary=----YCZICZK7BKK4HFOLWI5YLDWKK7UT1P
Content-Transfer-Encoding: 7bit

------YCZICZK7BKK4HFOLWI5YLDWKK7UT1P
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,=20

defconfig can be found here: https://github=2Ecom/openbouffalo/buildroot_b=
ouffalo/blob/main/configs/pine64_ox64_full_defconfig
The link to the tool chain is also in there=2E
Sure it would be better to get to the root of the problem=2E My solution w=
as just a quick and dirty fix=2E

Regards,
Leonard Widler

Am 27=2E November 2023 07:48:13 MEZ schrieb "Yann E=2E MORIN" <yann=2Emori=
n=2E1998@free=2Efr>:
>Leo, All,
>
>On 2023-11-26 23:17 +0100, Leo spake thusly:
>> I'll change my name, thanks for letting me know
>>=20
>> The failure is on none of the auto builders=2E I have uploaded the conf=
ig=2Elog here: [1]https://pastebin=2Ecom/ZzP6pNvx
>
>Can you also provide the Buildroot defconfig, please?
>
>(Also, I see you are running as root; this is not required to run
>Buildroot, and is even dangerous and not really supported; please run as
>a non-root user=2E)
>
>> And to fix this issue I added the --enable-multilib option which resolv=
es the problem=2E
>
>The issue looks like a misconfiguration somewhere:
>
>    =2E=2E=2E/crti=2Eo: can't link double-float modules with soft-float m=
odules
>    =2E=2E=2E//ld: failed to merge target specific data of file =2E=2E=2E=
/crti=2Eo
>
>So, we want to understand the problem rather than paper-over it=2E
>
>Where did you get your toolchain (Xuantie-900 linux-5=2E10=2E4 glibc gcc
>Toolchain V2=2E6=2E1 B-20220906)? Is it public, so we can try and reprodu=
ce
>the issue?
>
>Regards,
>Yann E=2E MORIN=2E
>
>> Regards,
>> Leonard Widler
>>=20
>> Am 26=2E November 2023 22:56:44 MEZ schrieb "Yann E=2E MORIN" <yann=2Em=
orin=2E1998@free=2Efr>:
>>=20
>>  leow149, All,
>>=20
>>  Thank you for your contribution! Here is a quick review=2E
>>=20
>>  First, we'll need you to use your real name as the author of the patch=
;
>>  we do not accept annonymous (od pseduonymou) contributions=2E
>>=20
>>  On 2023-11-26 22:43 +0100, leow149 spake thusly:
>>=20
>>  This commit fixes a build error which specifically happens for Bouffal=
lo Labs BL808 based boards, but might also happen on other RiscV64 Boards=
=2E
>>=20
>>=20
>>  Please wrap your commit log to ~72 chars=2E
>>=20
>>  Waht is the error that you see? Could you see if there is a similar
>>  build failure on out autobulders:
>>=20
>>  [2]http://autobuild=2Ebuildroot=2Eorg/?static=3D1&reason=3Dattr-%
>>=20
>>=20
>>  The last build error for attr was more than a year ago now, so it is
>>  relatively surprising to see that attr does not build=2E So we'll need=
 a
>>  bit more context=2E
>>=20
>>=20
>>  Signed-off-by: leow149 <info=2Eleo@widler=2Ede>
>>=20
>>   ---------------------------------------------------------------------=
-----------------------------------------------------------
>>=20
>>   package/attr/attr=2Emk | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>=20
>>  diff --git a/package/attr/attr=2Emk b/package/attr/attr=2Emk
>>  index 0327497e1e=2E=2E89f7d21f0c 100644
>>  --- a/package/attr/attr=2Emk
>>  +++ b/package/attr/attr=2Emk
>>  @@ -13,7 +13,8 @@ ATTR_CPE_ID_VENDOR =3D attr_project
>>=20
>>   ATTR_INSTALL_STAGING =3D YES
>>=20
>>  -ATTR_CONF_OPTS =3D --disable-nls
>>  -
>>  +ATTR_CONF_OPTS =3D \
>>  +       --disable-nls \
>>  +       --enable-multilib
>>=20
>>=20
>>  Buildroot does not generate multilib toolchains, and when using an
>>  external toolchain that is multilib, the proper multilib diretory is
>>  copies over to the sysroot=2E
>>=20
>>  So, --eanble-multilib looksa like the wrong approach, at least without
>>  more explanations=2E
>>=20
>>  Can you elaborate on the issue you encounter, and what makes you think
>>  --enable-multilib is the correct solution?
>>=20
>>  Thanks!
>>=20
>>  Regards,
>>  Yann E=2E MORIN=2E
>>=20
>>=20
>>   $(eval $(autotools-package))
>>   $(eval $(host-autotools-package))
>>  --
>>  2=2E30=2E2
>>=20
>>   ---------------------------------------------------------------------=
-----------------------------------------------------------
>>=20
>>  buildroot mailing list
>>  buildroot@buildroot=2Eorg
>>  [3]https://lists=2Ebuildroot=2Eorg/mailman/listinfo/buildroot
>>=20
>> Links:
>> 1=2E https://pastebin=2Ecom/ZzP6pNvx
>> 2=2E http://autobuild=2Ebuildroot=2Eorg/?static=3D1&reason=3Dattr-%
>> 3=2E https://lists=2Ebuildroot=2Eorg/mailman/listinfo/buildroot
>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot=2Eorg
>> https://lists=2Ebuildroot=2Eorg/mailman/listinfo/buildroot
>
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

------YCZICZK7BKK4HFOLWI5YLDWKK7UT1P
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div dir=3D"auto">Hi, <br><br>defconfig can be fou=
nd here: <a href=3D"https://github=2Ecom/openbouffalo/buildroot_bouffalo/bl=
ob/main/configs/pine64_ox64_full_defconfig">https://github=2Ecom/openbouffa=
lo/buildroot_bouffalo/blob/main/configs/pine64_ox64_full_defconfig</a><br>T=
he link to the tool chain is also in there=2E<br>Sure it would be better to=
 get to the root of the problem=2E My solution was just a quick and dirty f=
ix=2E<br><br>Regards,<br>Leonard Widler</div><br><br><div class=3D"gmail_qu=
ote"><div dir=3D"auto">Am 27=2E November 2023 07:48:13 MEZ schrieb "Yann E=
=2E MORIN" &lt;yann=2Emorin=2E1998@free=2Efr&gt;:</div><blockquote class=3D=
"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid =
rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail"><div dir=3D"auto">Leo, All,<br><br>On 2023-11-26 23:=
17 +0100, Leo spake thusly:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-l=
eft: 1ex;"><div dir=3D"auto">I'll change my name, thanks for letting me kno=
w<br><br>The failure is on none of the auto builders=2E I have uploaded the=
 config=2Elog here: [1]https://pastebin=2Ecom/ZzP6pNvx<br></div></blockquot=
e><div dir=3D"auto"><br>Can you also provide the Buildroot defconfig, pleas=
e?<br><br>(Also, I see you are running as root; this is not required to run=
<br>Buildroot, and is even dangerous and not really supported; please run a=
s<br>a non-root user=2E)<br><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-=
left: 1ex;"><div dir=3D"auto">And to fix this issue I added the --enable-mu=
ltilib option which resolves the problem=2E<br></div></blockquote><div dir=
=3D"auto"><br>The issue looks like a misconfiguration somewhere:<br><br>   =
 =2E=2E=2E/crti=2Eo: can't link double-float modules with soft-float module=
s<br>    =2E=2E=2E//ld: failed to merge target specific data of file =2E=2E=
=2E/crti=2Eo<br><br>So, we want to understand the problem rather than paper=
-over it=2E<br><br>Where did you get your toolchain (Xuantie-900 linux-5=2E=
10=2E4 glibc gcc<br>Toolchain V2=2E6=2E1 B-20220906)? Is it public, so we c=
an try and reproduce<br>the issue?<br><br>Regards,<br>Yann E=2E MORIN=2E<br=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0=
=2E8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"><div dir=3D"aut=
o">Regards,<br>Leonard Widler<br><br>Am 26=2E November 2023 22:56:44 MEZ sc=
hrieb "Yann E=2E MORIN" &lt;yann=2Emorin=2E1998@free=2Efr&gt;:<br><br> leow=
149, All,<br><br> Thank you for your contribution! Here is a quick review=
=2E<br><br> First, we'll need you to use your real name as the author of th=
e patch;<br> we do not accept annonymous (od pseduonymou) contributions=2E<=
br><br> On 2023-11-26 22:43 +0100, leow149 spake thusly:<br><br> This commi=
t fixes a build error which specifically happens for Bouffallo Labs BL808 b=
ased boards, but might also happen on other RiscV64 Boards=2E<br><br><br> P=
lease wrap your commit log to ~72 chars=2E<br><br> Waht is the error that y=
ou see? Could you see if there is a similar<br> build failure on out autobu=
lders:<br><br> [2]http://autobuild=2Ebuildroot=2Eorg/?static=3D1&amp;reason=
=3Dattr-%<br><br><br> The last build error for attr was more than a year ag=
o now, so it is<br> relatively surprising to see that attr does not build=
=2E So we'll need a<br> bit more context=2E<br><br><br> Signed-off-by: leow=
149 &lt;info=2Eleo@widler=2Ede&gt;<hr>  package/attr/attr=2Emk | 5 +++--<br=
>  1 file changed, 3 insertions(+), 2 deletions(-)<br><br> diff --git a/pac=
kage/attr/attr=2Emk b/package/attr/attr=2Emk<br> index 0327497e1e=2E=2E89f7=
d21f0c 100644<br> --- a/package/attr/attr=2Emk<br> +++ b/package/attr/attr=
=2Emk<br> @@ -13,7 +13,8 @@ ATTR_CPE_ID_VENDOR =3D attr_project<br><br>  AT=
TR_INSTALL_STAGING =3D YES<br><br> -ATTR_CONF_OPTS =3D --disable-nls<br> -<=
br> +ATTR_CONF_OPTS =3D \<br> +       --disable-nls \<br> +       --enable-=
multilib<br><br><br> Buildroot does not generate multilib toolchains, and w=
hen using an<br> external toolchain that is multilib, the proper multilib d=
iretory is<br> copies over to the sysroot=2E<br><br> So, --eanble-multilib =
looksa like the wrong approach, at least without<br> more explanations=2E<b=
r><br> Can you elaborate on the issue you encounter, and what makes you thi=
nk<br> --enable-multilib is the correct solution?<br><br> Thanks!<br><br> R=
egards,<br> Yann E=2E MORIN=2E<br><br><br>  $(eval $(autotools-package))<br=
>  $(eval $(host-autotools-package))<br> --<br> 2=2E30=2E2<hr> buildroot ma=
iling list<br> buildroot@buildroot=2Eorg<br> [3]https://lists=2Ebuildroot=
=2Eorg/mailman/listinfo/buildroot<br><br>Links:<br>1=2E <a href=3D"https://=
pastebin=2Ecom/ZzP6pNvx">https://pastebin=2Ecom/ZzP6pNvx</a><br>2=2E <a hre=
f=3D"http://autobuild=2Ebuildroot=2Eorg/?static=3D1&amp;reason=3Dattr-%">ht=
tp://autobuild=2Ebuildroot=2Eorg/?static=3D1&amp;reason=3Dattr-%</a><br>3=
=2E <a href=3D"https://lists=2Ebuildroot=2Eorg/mailman/listinfo/buildroot">=
https://lists=2Ebuildroot=2Eorg/mailman/listinfo/buildroot</a><br></div></b=
lockquote><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-=
left: 1ex;"><div dir=3D"auto"><hr>buildroot mailing list<br>buildroot@build=
root=2Eorg<br><a href=3D"https://lists=2Ebuildroot=2Eorg/mailman/listinfo/b=
uildroot">https://lists=2Ebuildroot=2Eorg/mailman/listinfo/buildroot</a><br=
></div></blockquote><div dir=3D"auto"><br><br></div></pre></blockquote></di=
v></body></html>
------YCZICZK7BKK4HFOLWI5YLDWKK7UT1P--

--===============6457959969995651542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6457959969995651542==--
