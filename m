Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E32CC71153
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 09:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53196414D1;
	Sun,  3 Sep 2023 09:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53196414D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26OahxbOtHAJ; Sun,  3 Sep 2023 09:11:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 285F44151B;
	Sun,  3 Sep 2023 09:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 285F44151B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD1CA1BF395
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 09:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8108260B98
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 09:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8108260B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNCi0vcq5ikC for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 09:10:59 +0000 (UTC)
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5A7960A5E
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 09:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5A7960A5E
Received: from smtpclient.apple ([146.241.105.17])
 by Aruba Outgoing Smtp  with ESMTPA
 id cj8AqHi5S76f7cj8BqROxS; Sun, 03 Sep 2023 11:10:55 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 3 Sep 2023 11:10:54 +0200
Message-Id: <5ACCEA48-91DC-4556-9800-578FD8B618ED@benettiengineering.com>
References: <CAPmASes2TPHpX_uZbatW8icnq1hhheKVrd7nJAuCcosc6AyPsA@mail.gmail.com>
In-Reply-To: <CAPmASes2TPHpX_uZbatW8icnq1hhheKVrd7nJAuCcosc6AyPsA@mail.gmail.com>
To: Andrea Simeoni <andreasimeoni73@gmail.com>
X-Mailer: iPhone Mail (20G75)
X-CMAE-Envelope: MS4xfFX9tZXWu5lppMFVU85RgNptRb2eRb6wBFdgUqx4i75FWLQBC0d7FQNk/9FCCLxtaxlAgN+v1gs40QRrc87Gc2kYfRF3RwsTGUDc5VbX6Rn7E99cn86E
 dB3GLSiHNyZPwuzflNeDF4cLcLrHu0sQwtyoAlbKTOtMnucGf7vb9ql9QuZRSVKmnYAMkzBHVj39398SRNnV6tSKRZhunAJoPuUwhJ/L4Fije6MArWPvM7i/
 38lCjuIj8gXjPPYUKDsfu7Nmt3tXm46+51NAWM9sw+U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1693732255; bh=ty1lzFcHQLfm1mlsVJQHVzlX7xuCri+85PzSHkxY5m8=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=YgNwGfFMCPE4jtiZxtcTZW+AgpGUUyknChQX18diQ8yY6uYzaDMKKqae0DkFmC5hC
 qB11adPApWI+5sLX5H4tBKkg9oeRWJxJ0Y0gpCZhbtLOA7amdFDPeDk9wI9QSJ90IE
 jjtcF4Ma73rwR03kVhS5cEq9JHcz93eMseE0l5c34XzPQ6wTSWEFuV8JpaxcwR6miO
 MAys//oPK8NYvViNMYw8hONAI3Ss1AwkvJFEYgTJnhFduy7VBxYSE3WnpJfPQmvrLR
 ImO1pzRbkgptXd4A7P0Ucoga/5s37d98uCFU7WgnmA3D9f0a2J7LM7knyaipLEjiFM
 w2uMjL/7SOm8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YgNwGfFM
Subject: Re: [Buildroot] stat command missing
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
Content-Type: multipart/mixed; boundary="===============1291486714915068142=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1291486714915068142==
Content-Type: multipart/alternative; boundary=Apple-Mail-D1D01BF5-6CEC-41E4-B6FC-E5EB820B858C
Content-Transfer-Encoding: 7bit


--Apple-Mail-D1D01BF5-6CEC-41E4-B6FC-E5EB820B858C
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

> Il giorno 3 set 2023, alle ore 08:43, Andrea Simeoni <andreasimeoni73@gmai=
l.com> ha scritto:
>=20
> =EF=BB=BF
>=20
>> Enabling Busybox CONFIG_STAT option works good for me. How do you enable
>> it?
>>=20
>> I mean, you have to add a busybox config file or a fragment.
>> To do the first test you can issue:
>> $ make busybox-menuconfig
>> and enable it under Coreutils
>> then you have to rebuild it with:
>> $ make busybox-rebuild
>>=20
>> but the best way is to supply a busybox config fragment.
>=20
> Hi Giulio,
> I set BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES to  CONFIG_STAT=3Dy

Here ^^^ you have to point to a file(or more) containing CONFIG_STAT=3Dy
That=E2=80=99s why it doesn=E2=80=99t work.
Give a try with that so you create something reproducible.

> and then I issued make busybox-dirclean && make busybox-reconfigure. But a=
s said it didn't accept that option.
>=20
> I didn't know the <package>-menuconfig target. It's great!

Yes some package supports it, like Linux, uboot, swupdate, busybox etc.

> I followed your steps and now I have a working stat on my image, thanks!

Good :-)

Giulio

> Andrea
>=20
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-D1D01BF5-6CEC-41E4-B6FC-E5EB820B858C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Andrea,<br><div dir=3D"ltr"><br><blockqu=
ote type=3D"cite">Il giorno 3 set 2023, alle ore 08:43, Andrea Simeoni &lt;a=
ndreasimeoni73@gmail.com&gt; ha scritto:<br><br></blockquote></div><blockquo=
te type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr"><br><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Enabling Busybox CONFIG_STAT option works good for me. How do you enable<br>=

it?<br>
<br>
I mean, you have to add a busybox config file or a fragment.<br>
To do the first test you can issue:<br>
$ make busybox-menuconfig<br>
and enable it under Coreutils<br>
then you have to rebuild it with:<br>
$ make busybox-rebuild<br>
<br>
but the best way is to supply a busybox config fragment.<br></blockquote><di=
v><br></div><div>Hi Giulio,<br></div><div>I set&nbsp;BR2_PACKAGE_BUSYBOX_CON=
FIG_FRAGMENT_FILES to&nbsp; CONFIG_STAT=3Dy</div></div></div></div></blockqu=
ote><div><br></div><div>Here ^^^ you have to point to a file(or more) contai=
ning CONFIG_STAT=3Dy</div><div>That=E2=80=99s why it doesn=E2=80=99t work.</=
div><div>Give a try with that so you create something reproducible.</div><br=
><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><div> and then I issued make busybox-dirclean &amp;&amp; make bu=
sybox-reconfigure. But as said it didn't accept that option.<br></div><div><=
br></div><div>I didn't know the &lt;package&gt;-menuconfig target. It's grea=
t!</div></div></div></div></blockquote><div><br></div><div>Yes some package s=
upports it, like Linux, uboot, swupdate, busybox etc.</div><br><blockquote t=
ype=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><d=
iv>I followed your steps and now I have a working stat on my image, thanks!<=
/div></div></div></div></blockquote><div><br></div><div>Good :-)</div><div><=
br></div><div>Giulio</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div class=3D"gmail_quote"><div>Andrea</div><div><br></div></d=
iv></div>
<span>_______________________________________________</span><br><span>buildr=
oot mailing list</span><br><span>buildroot@buildroot.org</span><br><span>htt=
ps://lists.buildroot.org/mailman/listinfo/buildroot</span><br></div></blockq=
uote></body></html>=

--Apple-Mail-D1D01BF5-6CEC-41E4-B6FC-E5EB820B858C--

--===============1291486714915068142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1291486714915068142==--
