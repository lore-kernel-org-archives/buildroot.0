Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3290C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 12:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F82A4054E;
	Sun, 20 Feb 2022 12:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FPUgUsXQhU9U; Sun, 20 Feb 2022 12:55:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EF474047D;
	Sun, 20 Feb 2022 12:55:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 822B01BF371
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 12:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 696B84047D
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 12:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KScWi3IxSd4N for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 12:55:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F4F840422
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 12:55:22 +0000 (UTC)
Received: from smtpclient.apple ([151.44.21.244])
 by Aruba Outgoing Smtp  with ESMTPA
 id LlkGn2gmzNVvLLlkHn0IPk; Sun, 20 Feb 2022 13:55:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645361721; bh=S2M+BKEbxdnftMXqOTHQ6hvh7nJwZRF2ytMSSxnWOqo=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=ROYeDqkvrHK3hH0YiFm+URJWbKWK8zC73IgzWBxsSjUdXaHbHayzZydihIGL8EUWq
 wR52K1HbSPsY8wmjWVBmGqiB5JdN/F3g/izJlSbyDNsQantXQzip6BEfMBVZVEumLm
 IHFrf+j8Avw1B/mjaeovSkg68kjsH75DzIuiRy/sUOZ4RnPrCVubjLr94/AeY9TBFR
 shSY8kENyLfjWrlnJrXXWBTQpm2Mw/yiQvP194hVLUDEFzQKyuZBC5LEHPnyiPezlg
 TILDrEZV0aQz/dKbzOgv2i1xtkUACMrFRJe9uKQD9/CeOiu+FANNmCcCYT0xjl9zu8
 UlpKD4RJwpZAA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 20 Feb 2022 13:55:19 +0100
Message-Id: <DBE98BBE-E4A0-49B8-A2E8-AB951A2CA0F8@benettiengineering.com>
References: <CAHnHX5jOqW2fg--vVGjygya_QMo76DqDsYyEYiqpOmWHW3EHQg@mail.gmail.com>
In-Reply-To: <CAHnHX5jOqW2fg--vVGjygya_QMo76DqDsYyEYiqpOmWHW3EHQg@mail.gmail.com>
To: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
X-Mailer: iPhone Mail (19D52)
X-CMAE-Envelope: MS4wfMEhdVzSirkeogHhIPSwWs67fI9+6KSPCfMNQhWbOahj2pJoJCnprb0uFpcVwkNn1ZvknTrx5UIagaHh7HvNrwOYLjFD7Vjvkh7/DeWn0zzLMdacYrTE
 DaxqRrwcT3DIZzy1O9zLB0zOAUF5XZiHlQDTNePxVAmzegFs7RrUxbNLD/3IyS97ZT6824EueB6zcZ/lSus2ExjGfdMok1imzoeZQYLh2Pv0tU6tZojDhqkV
 k+D0xOtN0Jm8ylSKW3mYow==
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
Content-Type: multipart/mixed; boundary="===============1916839828479093423=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1916839828479093423==
Content-Type: multipart/alternative; boundary=Apple-Mail-FC35C2D5-D80C-4A6B-8685-4209015EA377
Content-Transfer-Encoding: 7bit


--Apple-Mail-FC35C2D5-D80C-4A6B-8685-4209015EA377
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Mohd,

> Il giorno 20 feb 2022, alle ore 13:46, Mohd Faiz Rohani <mohd.faiz.rohani@=
gmail.com> ha scritto:
>=20
> =EF=BB=BF
> Hi Giulio,
>=20
> Yes I have used root as a user. unfortunately i didn't set the path to the=
 users tables. Could this be a problem? If so, where to set them? I understa=
nd that the users list are kept in paswd file correct?

Before getting to users table let=E2=80=99s check why root doesn=E2=80=99t w=
ork.

Have you tried issuing:
root
And no password at all and press =E2=80=9Center=E2=80=9D key?

It=E2=80=99s pretty strange it doesn=E2=80=99t work

Giulio

>=20
> Thanks
>=20
>> On Sun, Feb 20, 2022 at 7:43 PM Giulio Benetti <giulio.benetti@benettieng=
ineering.com> wrote:
>> Hi Mohd,
>>=20
>> have you used root as user? Or did you provide a user table?
>>=20
>> Giulio
>>=20
>> Inviato da iPhone
>>=20
>> > Il giorno 20 feb 2022, alle ore 11:57, Mohd Faiz Rohani <mohd.faiz.roha=
ni@gmail.com> ha scritto:
>> >=20
>> > =EF=BB=BF
>> > Hi guys,
>> >=20
>> > I managed to compile with success the Uboot(U-Boot 2019.04), Linux kern=
el(4.4.155)and root file system(systemd 249) using the Buildroot-2021.11.1. I=
t was able to boot successfully until the login prompt. However, it seems li=
ke there is an error with the login prompt it does not want to enter, just l=
ooping around the login prompt after I have entered the login name (not show=
ing the password prompt). Did anyone know about this?
>> >=20
>> > Thanks.
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot@buildroot.org
>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>>=20

--Apple-Mail-FC35C2D5-D80C-4A6B-8685-4209015EA377
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Mohd,<br><div dir=3D"ltr"><br><blockquot=
e type=3D"cite">Il giorno 20 feb 2022, alle ore 13:46, Mohd Faiz Rohani &lt;=
mohd.faiz.rohani@gmail.com&gt; ha scritto:<br><br></blockquote></div><blockq=
uote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">Hi&nbsp;Giulio=
,<div><br></div><div>Yes I have used root as a user. unfortunately i didn't&=
nbsp;set the path to the users tables. Could this be a problem? If so, where=
 to set them? I understand that the users list are kept in paswd&nbsp;file c=
orrect?</div></div></div></blockquote><div><br></div><div>Before getting to u=
sers table let=E2=80=99s check why root doesn=E2=80=99t work.</div><div><br>=
</div><div>Have you tried issuing:</div><div>root</div><div>And no password a=
t all and press =E2=80=9Center=E2=80=9D key?</div><div><br></div><div>It=E2=80=
=99s pretty strange it doesn=E2=80=99t work</div><div><br></div><div>Giulio<=
/div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div><b=
r></div><div>Thanks</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Feb 20, 2022 at 7:43 PM Giulio Benetti &lt;<=
a href=3D"mailto:giulio.benetti@benettiengineering.com">giulio.benetti@benet=
tiengineering.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi Mohd,<br>
<br>
have you used root as user? Or did you provide a user table?<br>
<br>
Giulio<br>
<br>
Inviato da iPhone<br>
<br>
&gt; Il giorno 20 feb 2022, alle ore 11:57, Mohd Faiz Rohani &lt;<a href=3D"=
mailto:mohd.faiz.rohani@gmail.com" target=3D"_blank">mohd.faiz.rohani@gmail.=
com</a>&gt; ha scritto:<br>
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
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D=
"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/=
buildroot</a><br>
<br>
</blockquote></div>
</div></blockquote></body></html>=

--Apple-Mail-FC35C2D5-D80C-4A6B-8685-4209015EA377--

--===============1916839828479093423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1916839828479093423==--
