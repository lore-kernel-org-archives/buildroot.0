Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F302C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 20:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBD16408A6;
	Wed,  6 Apr 2022 20:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Co8qkUmRCnEw; Wed,  6 Apr 2022 20:13:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7109840400;
	Wed,  6 Apr 2022 20:13:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5696C1BF317
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 20:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 454D640400
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 20:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SeEzOnqogSGV for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 20:13:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB52C403A8
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 20:13:16 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2eb57fd3f56so39281617b3.8
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 13:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l0X+10q1UMtNhXvjfYhmmgqCPCMDIvVu+gqrLG8f8g0=;
 b=GIUyRSgSS+IeeBLnGds5foY+XSMdbWlOtVAoQzS/FVAinjpCOG+QYe+IouoEg5UpLy
 iphAo5BW1mrYk9Y4Dxx/a8UM6AtKZ2p40sSJCS5CZ19LsBRQllP2iztMbkdkva3NSGsB
 CZrqK+ddtOZy1eHb8gXYxA7o340JMQYzZf6WW/nzSLnVBwtaPSBXWNNPUljIFFQcJgt3
 PQXjU5p6fdr5qB0D+Fyz6UaX+gqr8vqfRh9wXp7tksMzst/g2kReOU6/u2sJOHzXOut7
 zxZmwJgTgaGpdzvJjd1zp7hXax1bcxyRkc6U7mJKCcF7UUjKoX3owXRAZ8gH8V0rw9fW
 D+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l0X+10q1UMtNhXvjfYhmmgqCPCMDIvVu+gqrLG8f8g0=;
 b=RpztAkHZWTQ0whpz6lfciHhzYJ5ZjpoQoGD6wf8jNS4ShFYT2vTx78plAqV0YDh3K+
 HziZGHGjkbwL+9eb69QzmYTp5GZ0XeLwPHSK5ot27OXcjA5HjqK6W9yT/RhKbJ47KlnN
 eLyq9cr0j037n/7lhD4yCwCXHLC59/1zUPcP1H/1ThrCjYC59yTKcEdE1CvcSR6XonAK
 Zt+duNqbH2g84yZca8JX748LHdwTkAMipksBCos5dLoAZwXEYfQx95fG3a1Y4K+gu4Wq
 V5NwQK12r+4AkVvnm0OylbnKvhc1vwnavpSfaNUMumWZTxsPy9v5JE8c3Tde/c2SCJNR
 I8VQ==
X-Gm-Message-State: AOAM531kfk5bGcQoS38nz1FeKWOs0zyvUYbrudqnCu7Y+1Xp7o1LgTpe
 CCidl/2qhc6rLbupjv1vAfebavmaCUqNIbNp6GJka49f
X-Google-Smtp-Source: ABdhPJyx/t8H47dpO7JzpxxafOmqT1uBQYBzu0xOexy+f144/DKAFAq0S7lA1MdmxUaKbu8bfTl6N8esEqlhlNnJec0=
X-Received: by 2002:a81:f41:0:b0:2eb:70ce:4179 with SMTP id
 62-20020a810f41000000b002eb70ce4179mr9019912ywp.187.1649275995897; Wed, 06
 Apr 2022 13:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxCknY7qH9uiqNpDhynxAdsjw1zM9AH=UaiAzET+f7treA@mail.gmail.com>
 <a4724812-eafb-0ffc-b14d-df9ed04aac80@mind.be>
In-Reply-To: <a4724812-eafb-0ffc-b14d-df9ed04aac80@mind.be>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Wed, 6 Apr 2022 17:13:05 -0300
Message-ID: <CAM70yxAu66JWhogiabz7fXqz4XpFGXmiOaahX5V3+GKQG_eUfw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [Feature Request] Host cmake built with the
 --system-curl option
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
Content-Type: multipart/mixed; boundary="===============7892244463541195228=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7892244463541195228==
Content-Type: multipart/alternative; boundary="000000000000df414905dc01fd15"

--000000000000df414905dc01fd15
Content-Type: text/plain; charset="UTF-8"

Thank you for your feedback on this request, Arnout.

Buildroot's cmake is being executed in my post-build script instead of my
system's cmake. How do I make my system's cmake take precedence?

On Wed, Apr 6, 2022 at 11:29 AM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 06/04/2022 04:06, Emile Cormier wrote:
> > When using cmake while running a post-build script, the
> ExternalProject_add
> > command fails when the URL option is used to download a source tarball
> via
> > https. This is because the host cmake is not built using the
> --system-curl
> > option (https://github.com/Kitware/CMake/blob/master/bootstrap#L660
> > <https://github.com/Kitware/CMake/blob/master/bootstrap#L660>).
> >
> > Without the system-curl option, the cmake build will use its own bundled
> libcurl
> > without OpenSSL support, and thus downloading tarballs via https fails.
> >
> > Adding the --system-curl option would entail that libcurl also be built
> as a
> > host library. I don't think it currently is.
>
>   Not only that, we'd need to configure host-curl to pull in host-openssl
> as well.
>
>   That is not really great. It means that cmake (which in many
> configurations is
> a very basic dependency) would pull in two more packages, which
> significantly
> increases build time.
>
>   And the only added value is that it allows you to build something
> outside of
> buildroot. If you need to do that, simply install cmake on your build
> system and
> use that instead of the buildroot-built cmake.
>
>   Regards,
>   Arnout
>
>
> >
> > I use CMake's ExternalProject_add in our project to download and build
> the
> > static library dependencies that our embedded application needs. I know
> that
> > buildroot provides various packages for cross-compiled libraries, but I
> have no
> > control over the versions (and compile-time options) of these packages.
> >
> > Cheers,
> > Emile Cormier
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000df414905dc01fd15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you for your feedback on this request, Arnout.<=
/div><div><br></div><div>Buildroot&#39;s cmake is being executed in my post=
-build script instead of my system&#39;s cmake. How do I make my system&#39=
;s cmake take precedence?<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 6, 2022 at 11:29 AM Arnout V=
andecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 06/04/2022 04:06, Emile Cormier wrote:<br>
&gt; When using cmake while running a post-build script, the ExternalProjec=
t_add <br>
&gt; command fails when the URL option is used to download a source tarball=
 via <br>
&gt; https. This is because the host cmake is not built using the --system-=
curl <br>
&gt; option (<a href=3D"https://github.com/Kitware/CMake/blob/master/bootst=
rap#L660" rel=3D"noreferrer" target=3D"_blank">https://github.com/Kitware/C=
Make/blob/master/bootstrap#L660</a> <br>
&gt; &lt;<a href=3D"https://github.com/Kitware/CMake/blob/master/bootstrap#=
L660" rel=3D"noreferrer" target=3D"_blank">https://github.com/Kitware/CMake=
/blob/master/bootstrap#L660</a>&gt;).<br>
&gt; <br>
&gt; Without the system-curl option, the cmake build will use its own bundl=
ed libcurl <br>
&gt; without OpenSSL support, and thus downloading tarballs via https fails=
.<br>
&gt; <br>
&gt; Adding the --system-curl option would entail that libcurl also be buil=
t as a <br>
&gt; host library. I don&#39;t think it currently is.<br>
<br>
=C2=A0 Not only that, we&#39;d need to configure host-curl to pull in host-=
openssl as well.<br>
<br>
=C2=A0 That is not really great. It means that cmake (which in many configu=
rations is <br>
a very basic dependency) would pull in two more packages, which significant=
ly <br>
increases build time.<br>
<br>
=C2=A0 And the only added value is that it allows you to build something ou=
tside of <br>
buildroot. If you need to do that, simply install cmake on your build syste=
m and <br>
use that instead of the buildroot-built cmake.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
<br>
&gt; <br>
&gt; I use CMake&#39;s ExternalProject_add in our project to download and b=
uild the <br>
&gt; static library dependencies that our embedded application needs. I kno=
w that <br>
&gt; buildroot provides various packages for cross-compiled libraries, but =
I have no <br>
&gt; control over the versions (and compile-time options) of these packages=
.<br>
&gt; <br>
&gt; Cheers,<br>
&gt; Emile Cormier<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div>

--000000000000df414905dc01fd15--

--===============7892244463541195228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7892244463541195228==--
