Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ABDC4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 13:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E60E80ECD;
	Fri,  8 Dec 2023 13:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E60E80ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJnDk3VjrGur; Fri,  8 Dec 2023 13:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77EA780C2D;
	Fri,  8 Dec 2023 13:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77EA780C2D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 276231BF83C
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 13:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F318F403AA
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 13:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F318F403AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VtOUSk2uiBZp for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 13:30:18 +0000 (UTC)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DCFB400CB
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 13:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DCFB400CB
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-db35caa1749so2195453276.2
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 05:30:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702042217; x=1702647017;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PjItjk7gAZ2f4xrT+1hLrsGJVvQnscWktdo2rf7WiZc=;
 b=X0dHMgtW53hTPLw//eIMGd14DcYOf4HM4pptOJAey0wo2XKRbc0l2KISdErOiK3R29
 pD+bVmDdk9Ngd0CphgugEJnkZDGGdJ/lbEY4wLqPBYD/c2gDPMPGX2C8r2M4q8XoJFob
 2r+Uvbh0+zYUbLBFdK+BlFTSXFFsTs05HEks5UBUanEbwHkZ8ooJWS6bXd2eyD7EZHM7
 LwmTTxagdnIaMqbbp3YVZUjBDlV3hReTIW04cJmJd8dP84sHvEfyxb29khwkT5Q/5FC9
 1KY92aukWrAHpfKW8Gp3ietwmYCtJoBoiClo/xLIugPNSg8CwcrdYcTtZTxWrDUiT4f4
 3Q0Q==
X-Gm-Message-State: AOJu0YxF9zPNEqgX/8w0jjCmzOsuxK+Jgr4z/NmtvcEHQvhBrLo22XjN
 F918dT1vVDk37hLC/Zq3CkQyF3UdIddY1TWijNM=
X-Google-Smtp-Source: AGHT+IHe7MFPFE6OAxE/PU0dwIXE+/0omlzMTvA5E8AeuPtZ8KzQLH9TBpcNCbSSe0cjOHASH/8FjkDqzciKG6CV/rw=
X-Received: by 2002:a5b:74d:0:b0:db7:dacf:3fa4 with SMTP id
 s13-20020a5b074d000000b00db7dacf3fa4mr3307116ybq.81.1702042217069; Fri, 08
 Dec 2023 05:30:17 -0800 (PST)
MIME-Version: 1.0
References: <CAPn86JAC9RLnYULz=M+y55KGgzvF_yWZa3ujNSbg58aCS6KPZQ@mail.gmail.com>
 <ZXMAJq84X14w97J+@tl-lnx-nyma7486-2>
In-Reply-To: <ZXMAJq84X14w97J+@tl-lnx-nyma7486-2>
From: Stefano Cottafavi <stefano.cottafavi@gmail.com>
Date: Fri, 8 Dec 2023 14:30:05 +0100
Message-ID: <CAPn86JBOi=QB6PJKtd6PB8cwY9pmwH9TiBtOmwm2QtxrAeQ+Eg@mail.gmail.com>
To: yann.morin@orange.com, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702042217; x=1702647017; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PjItjk7gAZ2f4xrT+1hLrsGJVvQnscWktdo2rf7WiZc=;
 b=cUo9sVfGlq3wYnyF/WggQSRumaykERNKuEwbll0kGCTbNJqfeTQAW+UgbfQkpGgllD
 8Ya7TguBGFzkKm9wDw82tKfu/2FqVyRI6cjh73g5oaoniffdLe0Uw2Z4f+GA4fQxZ4pl
 B7MMstTrMu9FaOMyGmNIBQXphMEzUayMCiO5WDgyXu5BYFtmfaokAefp/h2k2xl9pD5x
 qII8QIf+1NQRj9DbwNlo8tBYGEM7Rnj2tWiDWeMljyaMEt5BV9ZdrtQfiCyYuoTUppRO
 GbBES8+32ucL37xxXz38kplqJSeoOs7OYDALyWc2pFb9D+ExpRFJX0T8GUyzYITanezL
 YlXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cUo9sVfG
Subject: Re: [Buildroot] help - custom user not working
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
Content-Type: multipart/mixed; boundary="===============7805790075357316030=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7805790075357316030==
Content-Type: multipart/alternative; boundary="000000000000bdc13f060bff958a"

--000000000000bdc13f060bff958a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey guys,
I appreciated the prompt response. Noob me, my user table was indeed just a
one liner, with no line feed :-(
And that fixed it.

Now I can happily move on with the development, thank you!

Cheers,
Ste


On Fri, Dec 8, 2023 at 12:38=E2=80=AFPM <yann.morin@orange.com> wrote:

> Stefano, All,
>
> On 2023-12-08 11:45 +0100, Stefano Cottafavi spake thusly:
> > I'm trying to add a custom user to the minimal "raspberrypi4_defconfig"
> build.
> > I'm using Buildroot 2023.11, following the manual I've created a
> "users.txt" file (in the buildroot root folder) with just one line:
> > pi -1 pi -1 =3Draspberry /home/pi /bin/sh -
> > The config file contains:
> > BR2_ROOTFS_USERS_TABLES=3D"users.txt"
> > The build is successful and looking and the "full_users_table.txt"
> (output of the build) I can see the user definition above.
> > However, when I try to log on as "pi" I get "Login incorrect" error.
> > If I login as root and check the /etc/psswd, I DO NOT see the user pi
> > Can you help me understand what am I missing?
>
> Be sure that your users.txt is a proper unix-style text file, i.e.
> lines are \n terminated, even the last one (proper editors, like vi,
> will include the proper line termintaion).
>
> Regards,
> Yann E. MORIN.
>
> --
>                                         ____________
> .-----------------.--------------------:       _    :------------------.
> |  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
> |                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
> | +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
> | yann.morin (at) orange.com           |_=3D"    ,--' | / \ HTML MAIL    =
|
> '--------------------------------------:______/_____:------------------'
>
>
> _________________________________________________________________________=
___________________________________
> Ce message et ses pieces jointes peuvent contenir des informations
> confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez
> recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages
> electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme o=
u
> falsifie. Merci.
>
> This message and its attachments may contain confidential or privileged
> information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and
> delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have bee=
n
> modified, changed or falsified.
> Thank you.
>

--000000000000bdc13f060bff958a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hey guys,=C2=A0</div><div class=3D"gmail_defau=
lt" style=3D"font-family:monospace,monospace;font-size:small">I appreciated=
 the prompt response. Noob me, my user table was indeed just a one liner, w=
ith no line feed :-(</div><div class=3D"gmail_default" style=3D"font-family=
:monospace,monospace;font-size:small">And that fixed it.</div><div class=3D=
"gmail_default" style=3D"font-family:monospace,monospace;font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-family:monospace,monosp=
ace;font-size:small">Now I can happily move on with the development, thank =
you!</div><div class=3D"gmail_default" style=3D"font-family:monospace,monos=
pace;font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
family:monospace,monospace;font-size:small">Cheers,</div><div class=3D"gmai=
l_default" style=3D"font-family:monospace,monospace;font-size:small">Ste</d=
iv><div class=3D"gmail_default" style=3D"font-family:monospace,monospace;fo=
nt-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, Dec 8, 2023 at 12:38=E2=80=AFPM &lt;<a hre=
f=3D"mailto:yann.morin@orange.com">yann.morin@orange.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Stefano, All,<br>
<br>
On 2023-12-08 11:45 +0100, Stefano Cottafavi spake thusly:<br>
&gt; I&#39;m trying to add a custom user to the minimal &quot;raspberrypi4_=
defconfig&quot; build.<br>
&gt; I&#39;m using Buildroot 2023.11, following the manual I&#39;ve created=
 a &quot;users.txt&quot; file (in the buildroot root folder) with just one =
line:<br>
&gt; pi -1 pi -1 =3Draspberry /home/pi /bin/sh -<br>
&gt; The config file contains:<br>
&gt; BR2_ROOTFS_USERS_TABLES=3D&quot;users.txt&quot;<br>
&gt; The build is successful and looking and the &quot;full_users_table.txt=
&quot; (output of the build) I can see the user definition above.<br>
&gt; However, when I try to log on as &quot;pi&quot; I get &quot;Login inco=
rrect&quot; error.<br>
&gt; If I login as root and check the /etc/psswd, I DO NOT see the user pi<=
br>
&gt; Can you help me understand what am I missing?<br>
<br>
Be sure that your users.txt is a proper unix-style text file, i.e.<br>
lines are \n terminated, even the last one (proper editors, like vi,<br>
will include the proper line termintaion).<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ________=
____<br>
.-----------------.--------------------:=C2=A0 =C2=A0 =C2=A0 =C2=A0_=C2=A0 =
=C2=A0 :------------------.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded |=C2=A0 =C2=A0 __/ )=C2=A0=
 =C2=A0| /&quot;\ ASCII RIBBON |<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Software=
=C2=A0 Designer |=C2=A0 _/ - /&#39;=C2=A0 =C2=A0| \ / CAMPAIGN=C2=A0 =C2=A0=
 =C2=A0|<br>
| +33 638.411.245 &#39;--------------------: (_=C2=A0 =C2=A0 `--, |=C2=A0 X=
=C2=A0 AGAINST=C2=A0 =C2=A0 =C2=A0 |<br>
| yann.morin (at) <a href=3D"http://orange.com" rel=3D"noreferrer" target=
=3D"_blank">orange.com</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|_=3D&qu=
ot;=C2=A0 =C2=A0 ,--&#39; | / \ HTML MAIL=C2=A0 =C2=A0 |<br>
&#39;--------------------------------------:______/_____:------------------=
&#39;<br>
<br>
___________________________________________________________________________=
_________________________________<br>
Ce message et ses pieces jointes peuvent contenir des informations confiden=
tielles ou privilegiees et ne doivent donc<br>
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu=
 ce message par erreur, veuillez le signaler<br>
a l&#39;expediteur et le detruire ainsi que les pieces jointes. Les message=
s electroniques etant susceptibles d&#39;alteration,<br>
Orange decline toute responsabilite si ce message a ete altere, deforme ou =
falsifie. Merci.<br>
<br>
This message and its attachments may contain confidential or privileged inf=
ormation that may be protected by law;<br>
they should not be distributed, used or copied without authorisation.<br>
If you have received this email in error, please notify the sender and dele=
te this message and its attachments.<br>
As emails may be altered, Orange is not liable for messages that have been =
modified, changed or falsified.<br>
Thank you.<br>
</blockquote></div>

--000000000000bdc13f060bff958a--

--===============7805790075357316030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7805790075357316030==--
