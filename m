Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA79C83F2C
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 11:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AFE140519;
	Sun,  3 Sep 2023 11:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AFE140519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E4Vqwj8J7d_K; Sun,  3 Sep 2023 11:18:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE6B1403B3;
	Sun,  3 Sep 2023 11:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE6B1403B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B24261BF3EE
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 11:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97D4E60B23
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 11:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97D4E60B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eODakE1N8raa for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 11:17:57 +0000 (UTC)
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFDC760A89
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 11:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFDC760A89
Received: from smtpclient.apple ([146.241.105.17])
 by Aruba Outgoing Smtp  with ESMTPA
 id cl6LqInOL76f7cl72qRnZJ; Sun, 03 Sep 2023 13:17:52 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 3 Sep 2023 13:17:52 +0200
Message-Id: <53D42A90-15CB-4FA5-BEFC-F6F3A88726BA@benettiengineering.com>
References: <A0B28D3C-24E9-4F09-AE80-9FA4B1E19A11@benettiengineering.com>
In-Reply-To: <A0B28D3C-24E9-4F09-AE80-9FA4B1E19A11@benettiengineering.com>
To: Andrea Simeoni <andreasimeoni73@gmail.com>
X-Mailer: iPhone Mail (20G75)
X-CMAE-Envelope: MS4xfLr5kEuwZu4C3J9L2BWElnHaBlb6XDn8Ghp0HBTzpIMBtRgSUTwOSHfMntpQotcdRLWgRIL35lTg3kVhPrN7ooC6sttPzcC/p9VNRwh4VB57Fo6G9VL/
 yKX+gZS2PYTSiLrnrYkoLXe77icsfZZEOtF7gT2Sw1nzyL85e4TjpCeBiztnhAL8UUBYl7z5SVsRARd+bZ7isCQGdMWdR5VjWqbS8Ef8mPTPhALyFtaJlKYb
 x4jfhCFlM+MSH11ZAah1FPok3xTWE8ADSliG54blJHM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1693739872; bh=NTehIZ5AzCZglIH/WzMaogeemJlErSUe19IcvNuvQCU=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=aXNvZtn+m2CV2Gs4eBMEFfUQ0yfqAGtoS18ibT9f0tOqS1wYHWt3bolvPbLp59ol4
 8i6HVoEAR0YLEYs/xr1Vm2Tk/t1QVaKIh062pd5Lj37vjxufvGNuLcSL5JwW59/MGi
 nbJ5cB7WznowwMxYFP4vPNBy9+eU2bd0DNMnwT02erZv3D9IV9VJGaZst5Tngrljkv
 JvihbnkzQbsyzOIc9dhWKAqbOtZTh8Ipn3UfZJ54m3PACeVxIl4vYAv3wezR9gH7fF
 5Bnz3FgMvxyQZesFWTAb5TnMLNlDTpK+83dENU5ACa2c2tmZgQcc7meGOAQ1vSTz97
 KyYZnF1C79lsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=aXNvZtn+
Subject: Re: [Buildroot] Issues with Qt6 and Raspberry Pi 3 B+
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4513115807865781679=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4513115807865781679==
Content-Type: multipart/alternative; boundary=Apple-Mail-7F2FB85D-5AC1-4869-846B-378218AAABC1
Content-Transfer-Encoding: 7bit


--Apple-Mail-7F2FB85D-5AC1-4869-846B-378218AAABC1
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Re-adding Buildroot ML in Cc

Giulio Benetti

> Il giorno 3 set 2023, alle ore 13:17, Giulio Benetti <giulio.benetti@benet=
tiengineering.com> ha scritto:
>=20
> =EF=BB=BFHi Andrea,
>=20
> please keep the Mailing List in Cc while answering(basically reply to all)=
,
> this is because other people can read the final result and in the future t=
hey can benefit from this email exchange,
>=20
>>> Il giorno 3 set 2023, alle ore 12:46, Andrea Simeoni <andreasimeoni73@gm=
ail.com> ha scritto:
>>>=20
>> =EF=BB=BF
>>=20
>>> You should find aarch64-buildroot-linux-gnu-gdb
>>=20
>> Yep, it's there. I was looking for a wrong filename. Sorry.
>> =20
>>> It depends on how you've composed your Qt5/6 Kit. You have to pass qmake=

>>> found under host/bin/qmake.
>>=20
>> Something was odd before.
>> I select Qt5 again and make a clean build.
>>=20
>> Now I can run my Qt/QML applications.
>=20
> Perfect.
>=20
> Best regards
> Giulio

--Apple-Mail-7F2FB85D-5AC1-4869-846B-378218AAABC1
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Re-adding Buildroot ML in Cc<br><br><div di=
r=3D"ltr">Giulio Benetti</div><div dir=3D"ltr"><br><blockquote type=3D"cite"=
>Il giorno 3 set 2023, alle ore 13:17, Giulio Benetti &lt;giulio.benetti@ben=
ettiengineering.com&gt; ha scritto:<br><br></blockquote></div><blockquote ty=
pe=3D"cite"><div dir=3D"ltr">=EF=BB=BF<meta http-equiv=3D"content-type" cont=
ent=3D"text/html; charset=3Dutf-8">Hi Andrea,<br><div dir=3D"ltr"><br></div>=
<div dir=3D"ltr">please keep the Mailing List in Cc while answering(basicall=
y reply to all),</div><div dir=3D"ltr">this is because other people can read=
 the final result and in the future they can benefit from this email exchang=
e,</div><div dir=3D"ltr"><br><blockquote type=3D"cite">Il giorno 3 set 2023,=
 alle ore 12:46, Andrea Simeoni &lt;andreasimeoni73@gmail.com&gt; ha scritto=
:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=
=BF<div dir=3D"ltr"><br><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
You should find aarch64-buildroot-linux-gnu-gdb<br></blockquote><div><br></d=
iv><div>Yep, it's there. I was looking for a wrong filename. Sorry.</div></d=
iv></div></div></blockquote><blockquote type=3D"cite"><div dir=3D"ltr"><div d=
ir=3D"ltr"><div class=3D"gmail_quote"><div>&nbsp;</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
It depends on how you've composed your Qt5/6 Kit. You have to pass qmake<br>=

found under host/bin/qmake.<br></blockquote><div><br></div><div>Something wa=
s odd before.</div><div>I select Qt5 again and make a clean build.</div><div=
><br></div><div>Now I can run my Qt/QML applications.</div></div></div></div=
></blockquote><div><br></div><div>Perfect.</div><br><div>Best regards</div><=
div>Giulio</div></div></blockquote></body></html>=

--Apple-Mail-7F2FB85D-5AC1-4869-846B-378218AAABC1--

--===============4513115807865781679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4513115807865781679==--
