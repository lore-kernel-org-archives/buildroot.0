Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B98C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61DA34042F;
	Sun,  9 Jan 2022 22:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mvOwxkNIkBU4; Sun,  9 Jan 2022 22:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9487B40354;
	Sun,  9 Jan 2022 22:52:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC1411BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E61EC4010E
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9oJWCxGC3Aom for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:52:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4EAE400FB
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:52:42 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id m1so4877768lfq.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FRv7L02OBBwHMmEcW+plDjWhizaAltddxBbfgTWoxB8=;
 b=HXBPj2OHBLLj6HNs31jt1VOxDSdSkTafGfDP0ms5tjGDhN9Gem+kdmvdFEs++p4x83
 XPRNDZCiHjZXGN+X6Bb5MEumHc8qoroQY5x4JOL4KImmZaVxFxWYgB/1iZ8YXk+Nxq0b
 7AwS3Wf22OlT/vxcFTLTa1Gr9ngQPNc16VShTPars7eHpTO11Y2K0iWqfjtK1NX2jM5C
 fE1r3YQQtFUWW91s+iY6QA+INdj0+yRxfdZF8FUcCojnDahPOD+CXc0R+HozrOE3Y/fs
 FXyTZKlT/6ubpV0gwxYdPTMyLNOrDy6fTGsvIDxP7Oj35H6YsU7LX0i7h5KUAiGT/VbA
 ttYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FRv7L02OBBwHMmEcW+plDjWhizaAltddxBbfgTWoxB8=;
 b=Jj70GH7qEc8gJwCB6RNu9dgjO69HG46Dpwkghgh1ro2hFFSsgR2+FydxT8OsplQVdL
 KIwzKAr3aWPplPfVgYwakHaqj8QzaD9nR8Ela2SB3GZs4+zycjjiw1pLXW/Av2MgFZXT
 TbIM4iTet/LSdDk7gC9sPPAz98/pvTmAHLobmdrMbO2PP2xk6r6LgrtIsJtmJu1fxQy7
 a6ahEvXPpmbHZlR0QGUlwJ3+3LNE5PLzhOrQ+/nA6BbXc4DSf/P36AY9xQoLsYxXCBfJ
 1ouCnyNjXslW29MmbeCfy23Xcw+YheSx7pJDjf8kZcwXw38Xv+uDoq1RcQTpEbiMZxAr
 E63w==
X-Gm-Message-State: AOAM530fq0WhfRrcjaBZuyxLlBeDMXrgcIAxROeLZk9Wmkcx/Csy7zWA
 AWHZ68hHI1KkFXqkLOjhnUq/WLihmvNGWOcyhj0=
X-Google-Smtp-Source: ABdhPJx+X9qbwUstBtJx/YbatC6+08BRfd9WCf2CxEyl/4P3btLGXaRxC0xvhtHGGjQUyeqXRia0iuN8dlnUVIb0hpw=
X-Received: by 2002:a05:6512:282b:: with SMTP id
 cf43mr63643309lfb.331.1641768760572; 
 Sun, 09 Jan 2022 14:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20201126152832.1115350-1-nolange79@gmail.com>
 <CADvTj4p=60BwS0f6+UZABNYRw6BYph+qkTU7L9Gv+=LOJewsMQ@mail.gmail.com>
 <CADYdroOofT_jFTyAFuTd+iZGbmYwFwofJ8aHYnuz4TAbk4C80A@mail.gmail.com>
 <CADvTj4q4bR++z4YevSfa35Xxu7AUVMmS2o4mEtfP4WK3-cGx2A@mail.gmail.com>
In-Reply-To: <CADvTj4q4bR++z4YevSfa35Xxu7AUVMmS2o4mEtfP4WK3-cGx2A@mail.gmail.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 9 Jan 2022 23:52:31 +0100
Message-ID: <CADYdroMDCcUYSj6XyrXUHi4hwDWjtTXNX7BOmLt-Eb3JK_3fQQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: Allow extra config
 options
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
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6827858325506164783=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6827858325506164783==
Content-Type: multipart/alternative; boundary="000000000000c6fd9405d52e13ca"

--000000000000c6fd9405d52e13ca
Content-Type: text/plain; charset="UTF-8"

James Hilliard <james.hilliard1@gmail.com> schrieb am So., 9. Jan. 2022,
23:41:

> On Sat, Jan 8, 2022 at 2:31 PM Norbert Lange <nolange79@gmail.com> wrote:
> >
> > Am Sa., 8. Jan. 2022 um 20:04 Uhr schrieb James Hilliard
> > <james.hilliard1@gmail.com>:
> > >
> > > On Thu, Nov 26, 2020 at 8:28 AM Norbert Lange <nolange79@gmail.com>
> wrote:
> > > >
> > > > Systemd has very many options, adding a way for the user
> > > > to set custom options can help customizations
> > > > without changing buildroot files.
> > >
> > > I'm not sure this is a good idea, if a configuration option needs
> > > customizability it
> > > probably needs a specific kconfig option. Systemd config options tend
> to require
> > > dependency selection and special handling so this seems likely to cause
> > > spurious errors due to improper usage. Seems to be a pretty big
> footgun IMO.
> >
> > Sure, you are aware that many of my buildroot patches are stuck in limbo
> > since early 2020?
>
> Different issue IMO.
>

Yep, but seemed reasonable way out to me.


> > Just doesnt seem feasible to timely fix everything and version bumps
> often leave
> > more untapped options. Some part of the necessity would be just being
> pragmatic.
>
> I generally try to add any new options when bumping but I sometimes miss
> some.
>
> >
> > One example would be using the unified cgroups hierarchy
> > (-Ddefault-hierarchy=unified), hybrid is pretty much deprecated,
> > and some systemd features that buildroot allows to enable (OOMD for
> example)
> > wont work without it.
>
> I mean, this sounds like something that needs to be fixed in upstream
> buildroot.
>

And it did finally.


> >
> > >
> > > What systemd configure option would you want to be using that isn't
> > > currently able to be enabled?
> >
> > FYI those are the ones I currently use:
> >
> > -Ddefault-hierarchy=unified \
> > -Dutmp=false \
> > -Ddefault-dnssec=no \
> > -Didn=false \
> > -Denvironment-d=false \
> > -Dxdg-autostart=false \
> > -Ddns-over-tls=false \
> > -Ddefault-llmnr=no \
> > -Ddns-over-tls=false \
> > -Ddefault-mdns=no \
> > -Dlz4=false
>
> I'm seeing a lot of these added though(I remember adding some of them
> myself), are you
> trying to use a newer systemd than the version supported by the
> buildroot version you are
> building from?
>

Not only missing, but I sometimes need a *different* config. For example i
don't want to link against lz4, since I use zstd instead.


> Note that systemd defaults can generally be overridden via configs in
> the overlay as well.
>

Yeah, gonna have to look that up. News to me.
I will shelve that one in patchwork then

Norbert.

--000000000000c6fd9405d52e13ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">James Hilliard &lt;<a href=3D"mailto:james.hilliard1@g=
mail.com">james.hilliard1@gmail.com</a>&gt; schrieb am So., 9. Jan. 2022, 2=
3:41:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On Sat, Jan 8, 2022 at 2:31 P=
M Norbert Lange &lt;<a href=3D"mailto:nolange79@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">nolange79@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Am Sa., 8. Jan. 2022 um 20:04 Uhr schrieb James Hilliard<br>
&gt; &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">james.hilliard1@gmail.com</a>&gt;:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Nov 26, 2020 at 8:28 AM Norbert Lange &lt;<a href=3D"mail=
to:nolange79@gmail.com" target=3D"_blank" rel=3D"noreferrer">nolange79@gmai=
l.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Systemd has very many options, adding a way for the user<br>
&gt; &gt; &gt; to set custom options can help customizations<br>
&gt; &gt; &gt; without changing buildroot files.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m not sure this is a good idea, if a configuration option n=
eeds<br>
&gt; &gt; customizability it<br>
&gt; &gt; probably needs a specific kconfig option. Systemd config options =
tend to require<br>
&gt; &gt; dependency selection and special handling so this seems likely to=
 cause<br>
&gt; &gt; spurious errors due to improper usage. Seems to be a pretty big f=
ootgun IMO.<br>
&gt;<br>
&gt; Sure, you are aware that many of my buildroot patches are stuck in lim=
bo<br>
&gt; since early 2020?<br>
<br>
Different issue IMO.<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Yep, but seemed reasonable way out to me.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
&gt; Just doesnt seem feasible to timely fix everything and version bumps o=
ften leave<br>
&gt; more untapped options. Some part of the necessity would be just being =
pragmatic.<br>
<br>
I generally try to add any new options when bumping but I sometimes miss so=
me.<br>
<br>
&gt;<br>
&gt; One example would be using the unified cgroups hierarchy<br>
&gt; (-Ddefault-hierarchy=3Dunified), hybrid is pretty much deprecated,<br>
&gt; and some systemd features that buildroot allows to enable (OOMD for ex=
ample)<br>
&gt; wont work without it.<br>
<br>
I mean, this sounds like something that needs to be fixed in upstream build=
root.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">And it did finally.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; What systemd configure option would you want to be using that isn=
&#39;t<br>
&gt; &gt; currently able to be enabled?<br>
&gt;<br>
&gt; FYI those are the ones I currently use:<br>
&gt;<br>
&gt; -Ddefault-hierarchy=3Dunified \<br>
&gt; -Dutmp=3Dfalse \<br>
&gt; -Ddefault-dnssec=3Dno \<br>
&gt; -Didn=3Dfalse \<br>
&gt; -Denvironment-d=3Dfalse \<br>
&gt; -Dxdg-autostart=3Dfalse \<br>
&gt; -Ddns-over-tls=3Dfalse \<br>
&gt; -Ddefault-llmnr=3Dno \<br>
&gt; -Ddns-over-tls=3Dfalse \<br>
&gt; -Ddefault-mdns=3Dno \<br>
&gt; -Dlz4=3Dfalse<br>
<br>
I&#39;m seeing a lot of these added though(I remember adding some of them<b=
r>
myself), are you<br>
trying to use a newer systemd than the version supported by the<br>
buildroot version you are<br>
building from?<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Not only missing, but I sometimes need a *different* config. =
For example i don&#39;t want to link against lz4, since I use zstd instead.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
Note that systemd defaults can generally be overridden via configs in<br>
the overlay as well.<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Yeah, gonna have to look that up. News to me.</div><div=
 dir=3D"auto">I will shelve that one in patchwork then=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Norbert.</div><div dir=3D"auto"><br><=
/div></div>

--000000000000c6fd9405d52e13ca--

--===============6827858325506164783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6827858325506164783==--
