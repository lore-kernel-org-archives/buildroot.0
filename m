Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FA9C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 20:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20B864173D;
	Fri, 10 Nov 2023 20:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20B864173D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AOgAhOsOpkMW; Fri, 10 Nov 2023 20:55:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF88D41823;
	Fri, 10 Nov 2023 20:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF88D41823
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 210F41BF2C4
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 20:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE660415C8
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 20:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE660415C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lQrBr0GKRNZv for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 20:54:58 +0000 (UTC)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A51B41521
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 20:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A51B41521
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-daead9cde1eso2559032276.2
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 12:54:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699649697; x=1700254497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MH7f5/ddOzXJVCZHy5JzrFNlrN/3bBKNnMMNyjZNK8Q=;
 b=oSNdD7DNbmS/a2+0O8dNNFaGkKRoeCZ1N+zsnmQqwBPQeFm5eWF+UWvai6N5932r17
 uiZZehNTelllyqL3AuzDHRx/2r7cQAW1CsjMhRBpoosOufh1GdljYhaDciL0DDT/4+ph
 N3Zy+FHYYbBop7mfe1aGpcRfJ1OebygURfQ2ryXnub4dIF3Qq2N5eeCH9bU+ThedbTFo
 OWolxTss00sfXGFBMBYl5WfT//BkinmxsK+ZWiVAj7r7mkIvG+PM8cWUkAtGtzTN2I6S
 sggjKhJ3QmSMKob4850Yt66BEoT51fo4jypSH5BEHYsTZW9dh7laYimUvN1OuBxszF1g
 Gpag==
X-Gm-Message-State: AOJu0Yx+gM+VXk+Rpa62aEAcKP538W7PkHSZNzyH9SmCoHNtltQgeD7f
 u+tNW3jqP6BMi7l1HsawmObUjjtedBEKDWuLgPQ=
X-Google-Smtp-Source: AGHT+IF8ZZBYzls7hvj75/0PB+/EAijVz39pAoW32E+2AGaCzHCqTOXJS8MrjV9vMU/UQrxWcOWNx1nst7Fr6G1nezU=
X-Received: by 2002:a25:d784:0:b0:da3:b603:8314 with SMTP id
 o126-20020a25d784000000b00da3b6038314mr379747ybg.0.1699649696959; Fri, 10 Nov
 2023 12:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
 <20231108215536.7a780fe2@windsurf>
 <CAFSsvmqmULY+=X8bx-mv0k0Boj4RgZD5LBQ=4gVz+KV_TO_ndQ@mail.gmail.com>
 <bf35c736-8d92-4b84-97ab-fefc4ef2be15@mind.be>
In-Reply-To: <bf35c736-8d92-4b84-97ab-fefc4ef2be15@mind.be>
From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2023 13:54:45 -0700
Message-ID: <CAFSsvmpjafVwN2JRAB_fjGoKoqa6ZJPqSwKQt+7ye6C74ipNCw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699649697; x=1700254497; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MH7f5/ddOzXJVCZHy5JzrFNlrN/3bBKNnMMNyjZNK8Q=;
 b=loqebW6DTXur9URQivRLnOQhWwoxoYH19HzzhtRk46nepSVWJmXIFJHyYfxX8Ohf+R
 02At9fFeUa1W9yqyBoBd1pVx+np52R4evmMwsPbJ92aWzq46UKCAUHkT6rpJowBIZ3Uu
 fjIyU6hZvqSssROgonDy5xFqkzZ96q13NmkRP2NRUXWb1gXnh/kgjERjassWk4WUD8Mz
 jPRI4eM1P92GqrAg9r/kbIM7c/gW5NDPz0YK2sH6Q9EZHSCGK3nC4u0BEmtUohhP8brr
 55owHEsTf0KvSmdQ7neRz7iPh9CQxUde05UnKJQM/QYhjra5fOJ/OhW5+vgFVhb8JqH8
 gGEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=loqebW6D
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
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============4042135499503912070=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4042135499503912070==
Content-Type: multipart/alternative; boundary="0000000000006e10130609d2880e"

--0000000000006e10130609d2880e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Arnout:

To answer your questions:

Q) If there is anything we need to change, why would such a change not be
acceptable for upstream refpolicy?
A) I am, but one person and I don't have time to submit all the small
changes for refpolicy.

Q) How come our SELinux runtime tests don't fail if the upstream refpolicy
doesn't work?
A) Our tests are not performed in enforcing mode.

Q)  That seems like a much saner approach - I'd expect the diff to be prett=
y
small. Also, I expect that we need to make any changes that Yocto needs to
make
as well - which is all the more reason to upstream them!
A)
https://github.com/ni/meta-selinux/tree/nilrt/master/kirkstone/recipes-secu=
rity/refpolicy/refpolicy
      There are currently 74 patches to refpolicy they have made. All of
them have been submitted
       upstream and all of them have been deemed Inappropriate [embedded
specific.]
       So not only is the diff not small, it would be enormous compared to
this patch series.

Q) Why does upstream refpolicy provide a "reference" that is not suitable
for
actual use?
A) Ask them! It's quite frustrating! Even RHEL/Fedora does not use
refpolicy, but instead, a fork they made!

Thanks!

Adam

On Fri, Nov 10, 2023 at 12:40=E2=80=AFPM Arnout Vandecappelle <arnout@mind.=
be>
wrote:

>
>
> On 10/11/2023 17:49, Adam Duskett wrote:
> > Hey Thomas, sorry for the late reply!
> >
> > Refpolicy itself is just that, a reference policy.
>
>   If refpolicy only provides a reference policy, how can Buildroot do any
> better? We don't do any weird things with packages, so any policy that is
> applicable to Buildroot is applicable to everyone.
>
> > Quite a few gaps are missing
> > with several packages.
> > In fact, Fedora/RHEL have their own policy based on the refpolicy
> package found
> > here:
> > https://github.com/fedora-selinux/selinux-policy
> > <https://github.com/fedora-selinux/selinux-policy> because refpolicy
> itself is
> > not adequate for a complete
> > system in enforcing mode.
>
>   The basic question is: if there is anything we need to change, why woul=
d
> such
> a change not be acceptable for upstream refpolicy?
>
>   Also, how come our SELinux runtime tests don't fail if the upstream
> refpolicy
> doesn't work?
>
>
> > Also note, that the yocto selinux layer went another route and patches
> refpolicy
> > instead of providing separate
> > selinux policy files.
>
>   That seems like a much saner approach - I'd expect the diff to be prett=
y
> small. Also, I expect that any changes that yocto needs to make, we need
> to do
> as well - which is all the more reason to upstream them!
>
>
> > To summarize: These are necessary because refpolicy is not complete nor
> suitable
> > for a system running in
> > enforcing mode.
>
>   Why does upstream refpolicy provide a "reference" that is not suitable
> for
> actual use?
>
>
>   Not I know next to nothing about SELinux, I may be missing something
> glaringly
> obvious. Please consider all of the above questions as honest questions,
> not as
> snide remarks.
>
>   Regards,
>   Arnout
>
> >
> > On Wed, Nov 8, 2023 at 1:55=E2=80=AFPM Thomas Petazzoni via buildroot
> > <buildroot@buildroot.org <mailto:buildroot@buildroot.org>> wrote:
> >
> >     Hello Adam,
> >
> >     On Thu, 12 Oct 2023 12:31:57 +0200
> >     Adam Duskett <adam.duskett@amarulasolutions.com
> >     <mailto:adam.duskett@amarulasolutions.com>> wrote:
> >
> >      > SELinux support in Buildroot is currently outstanding! However,
> one last
> >     major
> >      > issue remains: Enforcing mode needs to work out of the box
> correctly, without
> >      > denials, at least with a minimal defconfig.
> >      >
> >      > This patch series seeks to remedy this problem with a basic set =
of
> >     policies in
> >      > several commonly selected packages to allow a user who wishes to
> use
> >     SELinux in
> >      > enforcing mode the ability to do so without having to spend
> several hours
> >      > writing the same policy that everyone who wishes to do the same
> thing would
> >      > have to do.
> >      >
> >      > The packages I have selected are based on the
> pc_x86_64_bios_defconfig
> >     with all
> >      > of the selinux packages selected because it was the most
> straightforward
> >     option
> >      > I had to create a small, bootable system in Virtual Manager with
> ssh
> >     support to
> >      > quickly build out a policy that didn't generate any denials in
> >      > /var/log/audit.log.
> >      >
> >      > I want to address Yann's questions from a previous discussion on
> IRC:
> >      >   Q) What will be the maintenance effort?
> >      >   A) Minimal after this patch series. As you will see, most
> policies are
> >     only a
> >      >      few lines long!
> >      >
> >      >   Q) How much time will we invest when we bump a package or add =
a
> dependency?
> >      >   A) Usually none! If a package bump/new dependency requires new
> >     permissions to
> >      >      the SELinux policy, this is a good thing! We should step
> back and
> >     question
> >      >      why a package previously accessing only files and libraries
> suddenly
> >     needs
> >      >      to (e.g.), change permissions on a /dev/ device!
> >
> >     Thanks a lot for working on this.
> >
> >     However, I'd like to understand why these policy files need to be i=
n
> >     Buildroot. For example, you're adding some policy for OpenSSH. But
> >     Buildroot just builds upstream OpenSSH with no change. Why do we ne=
ed
> >     some policy specifically in Buildroot for OpenSSH that cannot be in
> >     upstream refpolicy?
> >
> >     Back when Antoine T=C3=A9nart (which you have in Cc) was working on=
 this,
> >     and also my colleague Maxime Chevallier (which I have added in Cc),
> >     their plan was to make it possible to use the upstream refpolicy fo=
r
> a
> >     Buildroot system, by contributing changes to the refpolicy (and the=
y
> >     contributed quite a few).
> >
> >     Why are we not continuing on this approach?
> >
> >     Or is your policy a "from scratch" policy that can be used as a
> >     complete alternative to the upstream refpolicy?
> >
> >     (Note: we will clearly want a runtime test case for this.)
> >
> >     Best regards,
> >
> >     Thomas
> >     --
> >     Thomas Petazzoni, co-owner and CEO, Bootlin
> >     Embedded Linux and Kernel engineering and training
> >     https://bootlin.com <https://bootlin.com>
> >     _______________________________________________
> >     buildroot mailing list
> >     buildroot@buildroot.org <mailto:buildroot@buildroot.org>
> >     https://lists.buildroot.org/mailman/listinfo/buildroot
> >     <https://lists.buildroot.org/mailman/listinfo/buildroot>
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000006e10130609d2880e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Arnout:</div><div><br></div><div>To answer=C2=
=A0your questions:</div><div><br></div><div>Q) If there is anything we need=
 to change, why would such a change not be acceptable for upstream refpolic=
y?<br></div><div>A) I am, but one person and I don&#39;t have time to submi=
t all the small changes for refpolicy.</div><div><br></div><div>Q) How come=
 our SELinux runtime tests don&#39;t fail if the upstream refpolicy doesn&#=
39;t work?</div><div>A) Our tests are not performed in enforcing mode.</div=
><div><br></div><div>Q)=C2=A0 That seems like a much saner approach - I&#39=
;d expect the diff to be pretty</div>small. Also, I expect that we need to =
make any changes that Yocto needs to make<br>as well - which is all the mor=
e reason to upstream them!<div>A)=C2=A0=C2=A0<a href=3D"https://github.com/=
ni/meta-selinux/tree/nilrt/master/kirkstone/recipes-security/refpolicy/refp=
olicy">https://github.com/ni/meta-selinux/tree/nilrt/master/kirkstone/recip=
es-security/refpolicy/refpolicy</a></div><div>=C2=A0 =C2=A0 =C2=A0 There ar=
e currently 74 patches to refpolicy they have made. All of them have been s=
ubmitted</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0upstream and all of them have=
 been deemed Inappropriate [embedded specific.]</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0So not only is the diff not small, it would be enormous compared =
to this patch series.</div><div><br></div><div>Q) Why does upstream refpoli=
cy provide a &quot;reference&quot; that is not suitable for</div>actual use=
?<div>A) Ask them! It&#39;s quite frustrating! Even RHEL/Fedora does not us=
e refpolicy, but instead, a fork they made!</div><div><br><div>Thanks!</div=
><div><br></div><div>Adam</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, Nov 10, 2023 at 12:40=E2=80=AFPM Arnout Va=
ndecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 10/11/2023 17:49, Adam Duskett wrote:<br>
&gt; Hey Thomas, sorry for the late reply!<br>
&gt; <br>
&gt; Refpolicy itself is just that, a reference policy.<br>
<br>
=C2=A0 If refpolicy only provides a reference policy, how can Buildroot do =
any <br>
better? We don&#39;t do any weird things with packages, so any policy that =
is <br>
applicable to Buildroot is applicable to everyone.<br>
<br>
&gt; Quite a few gaps are missing <br>
&gt; with several packages.<br>
&gt; In fact, Fedora/RHEL have their own policy based on the refpolicy pack=
age found <br>
&gt; here:<br>
&gt; <a href=3D"https://github.com/fedora-selinux/selinux-policy" rel=3D"no=
referrer" target=3D"_blank">https://github.com/fedora-selinux/selinux-polic=
y</a> <br>
&gt; &lt;<a href=3D"https://github.com/fedora-selinux/selinux-policy" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/fedora-selinux/selinux=
-policy</a>&gt; because refpolicy itself is <br>
&gt; not adequate for a complete<br>
&gt; system in enforcing mode.<br>
<br>
=C2=A0 The basic question is: if there is anything we need to change, why w=
ould such <br>
a change not be acceptable for upstream refpolicy?<br>
<br>
=C2=A0 Also, how come our SELinux runtime tests don&#39;t fail if the upstr=
eam refpolicy <br>
doesn&#39;t work?<br>
<br>
<br>
&gt; Also note, that the yocto selinux layer went another route and patches=
 refpolicy <br>
&gt; instead of providing separate<br>
&gt; selinux policy files.<br>
<br>
=C2=A0 That seems like a much saner approach - I&#39;d expect the diff to b=
e pretty <br>
small. Also, I expect that any changes that yocto needs to make, we need to=
 do <br>
as well - which is all the more reason to upstream them!<br>
<br>
<br>
&gt; To summarize: These are necessary because refpolicy is not complete no=
r suitable <br>
&gt; for a system running in<br>
&gt; enforcing mode.<br>
<br>
=C2=A0 Why does upstream refpolicy provide a &quot;reference&quot; that is =
not suitable for <br>
actual use?<br>
<br>
<br>
=C2=A0 Not I know next to nothing about SELinux, I may be missing something=
 glaringly <br>
obvious. Please consider all of the above questions as honest questions, no=
t as <br>
snide remarks.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; On Wed, Nov 8, 2023 at 1:55=E2=80=AFPM Thomas Petazzoni via buildroot =
<br>
&gt; &lt;<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">build=
root@buildroot.org</a> &lt;mailto:<a href=3D"mailto:buildroot@buildroot.org=
" target=3D"_blank">buildroot@buildroot.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hello Adam,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, 12 Oct 2023 12:31:57 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0Adam Duskett &lt;<a href=3D"mailto:adam.duskett@ama=
rulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:adam.duskett@amarulaso=
lutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;&gt=
; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; SELinux support in Buildroot is currently out=
standing! However, one last<br>
&gt;=C2=A0 =C2=A0 =C2=A0major<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; issue remains: Enforcing mode needs to work o=
ut of the box correctly, without<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; denials, at least with a minimal defconfig.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; This patch series seeks to remedy this proble=
m with a basic set of<br>
&gt;=C2=A0 =C2=A0 =C2=A0policies in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; several commonly selected packages to allow a=
 user who wishes to use<br>
&gt;=C2=A0 =C2=A0 =C2=A0SELinux in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; enforcing mode the ability to do so without h=
aving to spend several hours<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; writing the same policy that everyone who wis=
hes to do the same thing would<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; have to do.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; The packages I have selected are based on the=
 pc_x86_64_bios_defconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0with all<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; of the selinux packages selected because it w=
as the most straightforward<br>
&gt;=C2=A0 =C2=A0 =C2=A0option<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I had to create a small, bootable system in V=
irtual Manager with ssh<br>
&gt;=C2=A0 =C2=A0 =C2=A0support to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; quickly build out a policy that didn&#39;t ge=
nerate any denials in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; /var/log/audit.log.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I want to address Yann&#39;s questions from a=
 previous discussion on IRC:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0Q) What will be the maintenance e=
ffort?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0A) Minimal after this patch serie=
s. As you will see, most policies are<br>
&gt;=C2=A0 =C2=A0 =C2=A0only a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 few lines long!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0Q) How much time will we invest w=
hen we bump a package or add a dependency?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0A) Usually none! If a package bum=
p/new dependency requires new<br>
&gt;=C2=A0 =C2=A0 =C2=A0permissions to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 the SELinux policy, this =
is a good thing! We should step back and<br>
&gt;=C2=A0 =C2=A0 =C2=A0question<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 why a package previously =
accessing only files and libraries suddenly<br>
&gt;=C2=A0 =C2=A0 =C2=A0needs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 to (e.g.), change permiss=
ions on a /dev/ device!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks a lot for working on this.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0However, I&#39;d like to understand why these polic=
y files need to be in<br>
&gt;=C2=A0 =C2=A0 =C2=A0Buildroot. For example, you&#39;re adding some poli=
cy for OpenSSH. But<br>
&gt;=C2=A0 =C2=A0 =C2=A0Buildroot just builds upstream OpenSSH with no chan=
ge. Why do we need<br>
&gt;=C2=A0 =C2=A0 =C2=A0some policy specifically in Buildroot for OpenSSH t=
hat cannot be in<br>
&gt;=C2=A0 =C2=A0 =C2=A0upstream refpolicy?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Back when Antoine T=C3=A9nart (which you have in Cc=
) was working on this,<br>
&gt;=C2=A0 =C2=A0 =C2=A0and also my colleague Maxime Chevallier (which I ha=
ve added in Cc),<br>
&gt;=C2=A0 =C2=A0 =C2=A0their plan was to make it possible to use the upstr=
eam refpolicy for a<br>
&gt;=C2=A0 =C2=A0 =C2=A0Buildroot system, by contributing changes to the re=
fpolicy (and they<br>
&gt;=C2=A0 =C2=A0 =C2=A0contributed quite a few).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Why are we not continuing on this approach?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Or is your policy a &quot;from scratch&quot; policy=
 that can be used as a<br>
&gt;=C2=A0 =C2=A0 =C2=A0complete alternative to the upstream refpolicy?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0(Note: we will clearly want a runtime test case for=
 this.)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thomas<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thomas Petazzoni, co-owner and CEO, Bootlin<br>
&gt;=C2=A0 =C2=A0 =C2=A0Embedded Linux and Kernel engineering and training<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://bootlin.com" rel=3D"noreferrer" =
target=3D"_blank">https://bootlin.com</a> &lt;<a href=3D"https://bootlin.co=
m" rel=3D"noreferrer" target=3D"_blank">https://bootlin.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0_______________________________________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0buildroot mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:buildroot@buildroot.org" target=
=3D"_blank">buildroot@buildroot.org</a> &lt;mailto:<a href=3D"mailto:buildr=
oot@buildroot.org" target=3D"_blank">buildroot@buildroot.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.buildroot.org/mailman/list=
info/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.buildroo=
t.org/mailman/listinfo/buildroot</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.buildroot.org/mailman/=
listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.buil=
droot.org/mailman/listinfo/buildroot</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div></div></div>

--0000000000006e10130609d2880e--

--===============4042135499503912070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4042135499503912070==--
