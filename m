Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5634C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 16:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C65B41F16;
	Fri, 10 Nov 2023 16:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C65B41F16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uuh6sB9GfP6m; Fri, 10 Nov 2023 16:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34E9E421DC;
	Fri, 10 Nov 2023 16:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34E9E421DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6191BF97F
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 16:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10995421DC
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 16:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10995421DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ijN3NxZgmc8Z for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 16:49:35 +0000 (UTC)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B63E641F16
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 16:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B63E641F16
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5a8628e54d4so19602867b3.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 08:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699634974; x=1700239774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BjXg43jALRVpQDLhjIxva1fLa1wzblEElyqDeN3mErI=;
 b=l/f6B1W5TFIYjOiWhLuolIFCkb+eBVS1jyXAT+VOcpR+vqXY3OAvhME1j8B7BZWRK2
 DbjtkMt4FfCa1HzHOLeY874/+Ef9dtIRgAO8u7D9EjlRSZkVS6wNRjpjjhzkHIgXIxC6
 ufiiv9cmu/f1zaea/I10rfGd1XyoYVk46hpJZhdhBg24YigcF44VhHV4YRIEdjw8QQO2
 oCzwnDHaxLxVcsprMBdirkARoNx92JjS1WGB3h1nLJ1UJAjm8NNiBojUxr+vF+weHq3b
 qfxfd9zBxVylEKOPmXlhCQ8vW5a9pZlCx5bQ6jMR8f1LYuEylxFWEWfWpIqzb5nUJdbF
 anTg==
X-Gm-Message-State: AOJu0YxN6BqYXN9grjWZHl9Miza11kpzDmcN2z55n0zowodMEshVlT/7
 sD1VFdqsdyGdkahMK4I2gVj6lKGaB6RWyREdaOE=
X-Google-Smtp-Source: AGHT+IH716/KLuVGwItlYQOJn3Sev8P2YCyU3HnpeJykSeRiN7pj4zHPTcXvFgC7kgGjxwByVojkQid/1iu9HWmzIsg=
X-Received: by 2002:a81:5403:0:b0:589:e815:8d71 with SMTP id
 i3-20020a815403000000b00589e8158d71mr1942082ywb.11.1699634974450; Fri, 10 Nov
 2023 08:49:34 -0800 (PST)
MIME-Version: 1.0
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
 <20231108215536.7a780fe2@windsurf>
In-Reply-To: <20231108215536.7a780fe2@windsurf>
From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2023 09:49:23 -0700
Message-ID: <CAFSsvmqmULY+=X8bx-mv0k0Boj4RgZD5LBQ=4gVz+KV_TO_ndQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699634974; x=1700239774; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BjXg43jALRVpQDLhjIxva1fLa1wzblEElyqDeN3mErI=;
 b=hHqjbtu4QlnRYP9XLv7fMLD+3rAeyUZdjrEKfdemtjEngMn+G1uXsQZDZMhVCnQkdz
 PzVn5rKN4y00YEgrkzncI+m061rGmhuNB6i3MNV6+wC0u3cgzWphf56A3Q1+BT3Gt4Kn
 VSSsS9M2hLrUR+NbJ/X59+yq8j+RCC3LYQtM9IL3deHUIF+L4knRke5NCrpZIlGUyQzU
 JRt9re/tzYydqGwDSvFCspieg0wTd8sys5SjxAeyFuNniKwRNI9/yUXgyKi/g9/xeyWa
 +sW7tvrgzkmtx7y0+D9mtpWCJ3O3Muw3Iya2eIQepsVQ/KUGtDmSjMm3a2H0rD7qx/Tb
 TkpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hHqjbtu4
Subject: Re: [Buildroot] [PATCH 00/12] SELinux: Basic config enforcing mode
 support.
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Antoine Tenart <atenart@kernel.org>, Sen Hastings <sen@phobosdpl.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============5867591933941944853=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5867591933941944853==
Content-Type: multipart/alternative; boundary="000000000000e669df0609cf1a36"

--000000000000e669df0609cf1a36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Thomas, sorry for the late reply!

Refpolicy itself is just that, a reference policy. Quite a few gaps are
missing with several packages.
In fact, Fedora/RHEL have their own policy based on the refpolicy package
found here:
https://github.com/fedora-selinux/selinux-policy because refpolicy itself
is not adequate for a complete
system in enforcing mode.

Also note, that the yocto selinux layer went another route and patches
refpolicy instead of providing separate
selinux policy files.

To summarize: These are necessary because refpolicy is not complete nor
suitable for a system running in
enforcing mode.

On Wed, Nov 8, 2023 at 1:55=E2=80=AFPM Thomas Petazzoni via buildroot <
buildroot@buildroot.org> wrote:

> Hello Adam,
>
> On Thu, 12 Oct 2023 12:31:57 +0200
> Adam Duskett <adam.duskett@amarulasolutions.com> wrote:
>
> > SELinux support in Buildroot is currently outstanding! However, one las=
t
> major
> > issue remains: Enforcing mode needs to work out of the box correctly,
> without
> > denials, at least with a minimal defconfig.
> >
> > This patch series seeks to remedy this problem with a basic set of
> policies in
> > several commonly selected packages to allow a user who wishes to use
> SELinux in
> > enforcing mode the ability to do so without having to spend several hou=
rs
> > writing the same policy that everyone who wishes to do the same thing
> would
> > have to do.
> >
> > The packages I have selected are based on the pc_x86_64_bios_defconfig
> with all
> > of the selinux packages selected because it was the most straightforwar=
d
> option
> > I had to create a small, bootable system in Virtual Manager with ssh
> support to
> > quickly build out a policy that didn't generate any denials in
> > /var/log/audit.log.
> >
> > I want to address Yann's questions from a previous discussion on IRC:
> >   Q) What will be the maintenance effort?
> >   A) Minimal after this patch series. As you will see, most policies ar=
e
> only a
> >      few lines long!
> >
> >   Q) How much time will we invest when we bump a package or add a
> dependency?
> >   A) Usually none! If a package bump/new dependency requires new
> permissions to
> >      the SELinux policy, this is a good thing! We should step back and
> question
> >      why a package previously accessing only files and libraries
> suddenly needs
> >      to (e.g.), change permissions on a /dev/ device!
>
> Thanks a lot for working on this.
>
> However, I'd like to understand why these policy files need to be in
> Buildroot. For example, you're adding some policy for OpenSSH. But
> Buildroot just builds upstream OpenSSH with no change. Why do we need
> some policy specifically in Buildroot for OpenSSH that cannot be in
> upstream refpolicy?
>
> Back when Antoine T=C3=A9nart (which you have in Cc) was working on this,
> and also my colleague Maxime Chevallier (which I have added in Cc),
> their plan was to make it possible to use the upstream refpolicy for a
> Buildroot system, by contributing changes to the refpolicy (and they
> contributed quite a few).
>
> Why are we not continuing on this approach?
>
> Or is your policy a "from scratch" policy that can be used as a
> complete alternative to the upstream refpolicy?
>
> (Note: we will clearly want a runtime test case for this.)
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000e669df0609cf1a36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Thomas, sorry for the late reply!<div><br></div><div>R=
efpolicy itself is just that, a reference policy. Quite a few gaps are miss=
ing with several packages.</div><div>In fact, Fedora/RHEL have their own po=
licy based on the refpolicy package found here:</div><div><a href=3D"https:=
//github.com/fedora-selinux/selinux-policy">https://github.com/fedora-selin=
ux/selinux-policy</a> because refpolicy itself is not adequate for a comple=
te</div><div>system in enforcing mode.</div><div><br></div><div>Also note, =
that the yocto selinux layer went another route and patches refpolicy inste=
ad of providing separate</div><div>selinux policy files.=C2=A0</div><div><b=
r></div><div>To summarize: These are necessary because refpolicy is not com=
plete nor suitable for a system running in<br></div><div>enforcing mode.</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, Nov 8, 2023 at 1:55=E2=80=AFPM Thomas Petazzoni via buildroot &l=
t;<a href=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello A=
dam,<br>
<br>
On Thu, 12 Oct 2023 12:31:57 +0200<br>
Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com" targe=
t=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; SELinux support in Buildroot is currently outstanding! However, one la=
st major<br>
&gt; issue remains: Enforcing mode needs to work out of the box correctly, =
without<br>
&gt; denials, at least with a minimal defconfig.<br>
&gt; <br>
&gt; This patch series seeks to remedy this problem with a basic set of pol=
icies in<br>
&gt; several commonly selected packages to allow a user who wishes to use S=
ELinux in<br>
&gt; enforcing mode the ability to do so without having to spend several ho=
urs<br>
&gt; writing the same policy that everyone who wishes to do the same thing =
would<br>
&gt; have to do.<br>
&gt; <br>
&gt; The packages I have selected are based on the pc_x86_64_bios_defconfig=
 with all<br>
&gt; of the selinux packages selected because it was the most straightforwa=
rd option<br>
&gt; I had to create a small, bootable system in Virtual Manager with ssh s=
upport to<br>
&gt; quickly build out a policy that didn&#39;t generate any denials in<br>
&gt; /var/log/audit.log.<br>
&gt; <br>
&gt; I want to address Yann&#39;s questions from a previous discussion on I=
RC:<br>
&gt;=C2=A0 =C2=A0Q) What will be the maintenance effort?<br>
&gt;=C2=A0 =C2=A0A) Minimal after this patch series. As you will see, most =
policies are only a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 few lines long!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Q) How much time will we invest when we bump a package or =
add a dependency?<br>
&gt;=C2=A0 =C2=A0A) Usually none! If a package bump/new dependency requires=
 new permissions to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the SELinux policy, this is a good thing! We shoul=
d step back and question<br>
&gt;=C2=A0 =C2=A0 =C2=A0 why a package previously accessing only files and =
libraries suddenly needs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 to (e.g.), change permissions on a /dev/ device!<b=
r>
<br>
Thanks a lot for working on this.<br>
<br>
However, I&#39;d like to understand why these policy files need to be in<br=
>
Buildroot. For example, you&#39;re adding some policy for OpenSSH. But<br>
Buildroot just builds upstream OpenSSH with no change. Why do we need<br>
some policy specifically in Buildroot for OpenSSH that cannot be in<br>
upstream refpolicy?<br>
<br>
Back when Antoine T=C3=A9nart (which you have in Cc) was working on this,<b=
r>
and also my colleague Maxime Chevallier (which I have added in Cc),<br>
their plan was to make it possible to use the upstream refpolicy for a<br>
Buildroot system, by contributing changes to the refpolicy (and they<br>
contributed quite a few).<br>
<br>
Why are we not continuing on this approach?<br>
<br>
Or is your policy a &quot;from scratch&quot; policy that can be used as a<b=
r>
complete alternative to the upstream refpolicy?<br>
<br>
(Note: we will clearly want a runtime test case for this.)<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--000000000000e669df0609cf1a36--

--===============5867591933941944853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5867591933941944853==--
