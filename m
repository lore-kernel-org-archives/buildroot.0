Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D807C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 19:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9B648291C;
	Wed, 27 Jul 2022 19:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9B648291C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o37uCt1pp73J; Wed, 27 Jul 2022 19:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CC8482907;
	Wed, 27 Jul 2022 19:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CC8482907
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BF981BF3C6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8429260E41
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8429260E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l_vEs3dKG-wm for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 19:24:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0FC560D9C
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0FC560D9C
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 19:24:38 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id b67so9748901vsc.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 12:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t/Ge/8ZmnYcAHcC9vQqmk7ntT0EBAxZcExW59G2I3eI=;
 b=tAOD34W8hzm0hFIoPtTsW8AoCU7lWrQr0zpPPDBIZeYerStU6hgmPRXdQNjdVkHMgv
 aE0wMa43hWjMZ+Nwjia8yZDzIfObXLW7CqMIMmh5wXFoWAbLw9oUA+CclxeMz/HQ8gQ0
 IZJ45F7LppfOoar2Qq4hy+QBVDzaORc86U9ZTv4+ybOC3O0boj/smQ1R3h+T1+2d44dL
 lWGpQKoy4VDzOD5sfda2ctW+9c7IJYTxvDDcsyNxkV1KCl63SuBfMEkCnw1AasN5B3dQ
 izXpSF04yaLXZRISM8ZXRa7flbTg34pgYkPbAKQxllUsrIAPlQOd/o72wJ4RnafC6gZy
 qiaQ==
X-Gm-Message-State: AJIora/zq6AMKZ6CTqvGwbUgi9tC6TKzlmw8oF9P5ohnZoSuDHRWFU9i
 TYp1CNxf9I2Tkj+1ehezEWU3UN8TIZ3D+Wzwj5iCbk9wSqA=
X-Google-Smtp-Source: AGRyM1uMO5X7IMomaXKnkHzJRBkzrJsvtUm6vhjEoIKNE1Y7oOMaCIRm8XIRN3aF7Q71thWavmOxy5BIbhyBwe2vhZw=
X-Received: by 2002:a67:e101:0:b0:358:4660:345c with SMTP id
 d1-20020a67e101000000b003584660345cmr7878805vsl.27.1658949877722; Wed, 27 Jul
 2022 12:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220109221650.777610-1-nolange79@gmail.com>
 <2288ff34-d140-a1a0-3f8e-86baf04f4dee@mind.be>
 <CADYdroP82ZnJLWzL0=DP1r2T-0nJe3c7xxC4QgwkNtF5dkC_8A@mail.gmail.com>
 <28488fd2-ab02-43c7-25da-cdcb3f37d83a@mind.be>
 <CADYdroNVSoUB-GkdRoXj64s+e+ECwE2sUfSs17kLcN-h_0_i7Q@mail.gmail.com>
 <289f02de-d0f2-347f-28be-0cfe52478990@mind.be>
In-Reply-To: <289f02de-d0f2-347f-28be-0cfe52478990@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 27 Jul 2022 21:24:26 +0200
Message-ID: <CADYdroM-JfgzWwB8D8a-w7qSyGFkuF1z3DJ7pG7w7gRDi300HQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=t/Ge/8ZmnYcAHcC9vQqmk7ntT0EBAxZcExW59G2I3eI=;
 b=IP2LvYHckm/By/OGzSgHLRp/9m4gWwPTIoTD13ajPwCtTq3tfs2VfGtYnAHL0ynVZa
 7kj3JyIUpIOq6NMZTaiosi4hGir1aeiaLpPCBXTZP9amUnjXzl8sg0PvQ1CvZ22rJzsn
 hOP/yEgL5QBAnSR2c+o5TmKEHA5xqOV7KqOMCgQp0UnLpNTHKERuzwGhwmGPecVY3SXP
 3I/1o9/dQxLo8G4SRYBtrzvEhPvp7V5qTeuUY77BWsZFfCCtAkO114SZAHUlpi7E1t9n
 19TbHHKCbWTuaM+BoOcLAh0szPUEBu81zIYwdozZf6BPH5FLkX0k4g4YBsZCUfoceDJ3
 CzHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IP2LvYHc
Subject: Re: [Buildroot] [PATCH v6 1/4] package/dbus-broker: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4876477243690057111=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4876477243690057111==
Content-Type: multipart/alternative; boundary="00000000000029722d05e4ce5ec1"

--00000000000029722d05e4ce5ec1
Content-Type: text/plain; charset="UTF-8"

Arnout Vandecappelle <arnout@mind.be> schrieb am Mi., 27. Juli 2022, 21:09:

>
>
> On 27/07/2022 19:31, Norbert Lange wrote:
> >
> >
> > Arnout Vandecappelle <arnout@mind.be <mailto:arnout@mind.be>> schrieb
> am Mi.,
> > 27. Juli 2022, 19:05:
> >
> >
> >
> >     On 27/07/2022 15:47, Norbert Lange wrote:
> >      > Am Mi., 27. Juli 2022 um 13:08 Uhr schrieb Arnout Vandecappelle
> >      > <arnout@mind.be <mailto:arnout@mind.be>>:
> [snip]
> >      >>    So to me the proper approach seems to change dbus itself so
> the daemon is
> >      >> optional, i.e. only libdbus is installed if the daemon is not
> enabled,
> >     similar
> >      >> to e.g. libcurl. BR2_PACKAGE_DBUS_DAEMON should default to y
> because
> >     that's what
> >      >> most people want. We'd have to go through existing packages to
> check if they
> >      >> depend on libdbus or on the daemon - mostly it will be the
> first. If
> >     there is a
> >      >> package that really needs the daemon (I don't actually think
> so), then
> >     we might
> >      >> need to introduce a virtual package for the daemon. Regardless,
> dbus-broker
> >      >> should depend on !BR2_PACKAGE_DBUS_DAEMON.
> >
> >        Looking more detailed at it, this seems too complicated. dbus
> doesn't
> >     offer a
> >     way to install only the library. Also in terms of rootfs size, the
> only
> >     difference is the dbus-daemon and dbus-launch binaries, plus a few
> config
> >     files.
> >     Not really sufficient to make it worth it.
> >
> >        What I will do, I think, is to include logic in dbus to remove the
> >     activation
> >     units (both the service and the socket) when dbus-broker is enabled.
> It is
> >     slightly messy because dbus.mk <http://dbus.mk> and dbus-broker.mk
> >     <http://dbus-broker.mk> become fairly tightly woven
> >     together, but I think it's worth it from a usability perspective.
> >
> >
> > Sounds messy too,
>
>   Agreed. But the only unmessy thing that I found so far is to not use
> dbus-broker at all if original dbus is selected, and I think that that
> pretty
> much defeats the purpose of including dbus-broker.
>
> > I would rather have a dbus-common package that includes the socket an
> config
> > files (and creates the user if necessary).
>
>   That is a good idea. However, it only works for the two dbus
> configuration
> files, not for the systemd units, so it only solves half of the mess. And
> the
> added benefit is not that great. Also, they don't change very often any
> more
> upstream (the last change is from 12/21, before that it's 12/17). So in
> the end
> we decided not to go for dbus-common.
>
>
> > That package would download dbus, but not build it, instead just copy
> over those
> > files.
> > Kinda like util-linux-libs
> >
> >
> >      > Debian does something similar, including splitting of the xml
> config files
> >      > and actual daemons into their own packages.
> >      >
> >      > see [1].
> >      >
> >      >>> Note about the user: the path to the system bus socket is a
> so-called
> >      >>> "well-known location": it is expected to be there, by spec.
> Moving it
> >      >>> elsewhere is going to break existing programs. So, the user
> running the
> >      >>> system bus daemon must be able to create that socket.
> >      >>>
> >      >>> As we may have two packages providing a system bus daemon, they
> have to
> >      >>> be both able to create the socket, and thus must both be able
> to write
> >      >>> in the directory containing the socket. And since they can be
> switched
> >      >>> at runtime, they must be running as the same user.
> >      >>>
> >      >>> We can't just reference the original dbus user, so we duplicate
> the
> >      >>> entry. What is important, is that the user be named 'dbus', as
> that's
> >      >>> what we use in both cases.
> >      >>
> >      >>    If it's a virtual package, then the user could be created by
> the virtual
> >      >> package itself.
> >
> >        It won't be a virtual package, so no longer relevant.
> >
> >
> >      > with systemd you probably dont even need a real user for the
> isolation
> >      > benefits.
> >      > So maybe this would just be necessary if dbus utilities are used,
> >      > you can also just let systemd create that user dynamically:
> >      >
> >      > [Service]
> >      > ...
> >      > User=dbus
> >      > Group=dbus > DynamicUser=true
> >
> >        If we do this both in the dbus and the dbus-broker units, then
> indeed we can
> >     remove the dbus user.
> >
> >
> > AFAIR the reason for the dbus to be a system user is that dbus-launch
> can setuid
> > into it.
> > So it only works without system user if dbus-launch is not used.
> Dbus-broker
> > delegates this functionality to system (dbus activation)
>
>   Well, the service file still calls dbus-broker-launch, which I guess
> does
> setuid because the upstream service file doesn't have any User= or Group=
>

I meant Dbus-launch, dbus-broker-launch *does not use setuid* which depends
on filesystem/inode permissions and uid.
If you prefix a ! In the service file dbus-broker-launch will be run as
root, and since this is the only way the executable is used (unlike dbus)
the dynamic user uid is enough.

Hence dbus-broker-launch works with random/dynamic uids, while dbus-launch
needs a stable one.


>   I think we'll just stick to what we have now, and keep the upstream
> service
> file rather than hacking our own...
>
>   Regards,
>   Arnout
>
> >
> >
> >        If I add this just to dbus-broker, but dbus still creates a
> static user, is
> >     this going to give a problem for systemd? I.e. does systemd support a
> >     DynamicUser=true if the user exists already statically? I think so...
> >
> >
> > Think so too.
> >
> >
> >        Regards,
> >        Arnout
> >
> >      > ExecStart=!/usr/bin/dbus-broker-launch --scope system --audit
> >      > ExecReload=!/usr/bin/busctl call org.freedesktop.DBus
> >      > /org/freedesktop/DBus org.freedesktop.DBus ReloadConfig
> >
> >     [snip]
> >
> >
> > Norbert
> >
>

--00000000000029722d05e4ce5ec1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind=
.be">arnout@mind.be</a>&gt; schrieb am Mi., 27. Juli 2022, 21:09:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
<br>
On 27/07/2022 19:31, Norbert Lange wrote:<br>
&gt; <br>
&gt; <br>
&gt; Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_=
blank" rel=3D"noreferrer">arnout@mind.be</a> &lt;mailto:<a href=3D"mailto:a=
rnout@mind.be" target=3D"_blank" rel=3D"noreferrer">arnout@mind.be</a>&gt;&=
gt; schrieb am Mi., <br>
&gt; 27. Juli 2022, 19:05:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 27/07/2022 15:47, Norbert Lange wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Am Mi., 27. Juli 2022 um 13:08 Uhr schrieb Ar=
nout Vandecappelle<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;<a href=3D"mailto:arnout@mind.be" target=
=3D"_blank" rel=3D"noreferrer">arnout@mind.be</a> &lt;mailto:<a href=3D"mai=
lto:arnout@mind.be" target=3D"_blank" rel=3D"noreferrer">arnout@mind.be</a>=
&gt;&gt;:<br>
[snip]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 So to me the proper approach=
 seems to change dbus itself so the daemon is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; optional, i.e. only libdbus is installed =
if the daemon is not enabled,<br>
&gt;=C2=A0 =C2=A0 =C2=A0similar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; to e.g. libcurl. BR2_PACKAGE_DBUS_DAEMON =
should default to y because<br>
&gt;=C2=A0 =C2=A0 =C2=A0that&#39;s what<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; most people want. We&#39;d have to go thr=
ough existing packages to check if they<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; depend on libdbus or on the daemon - most=
ly it will be the first. If<br>
&gt;=C2=A0 =C2=A0 =C2=A0there is a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; package that really needs the daemon (I d=
on&#39;t actually think so), then<br>
&gt;=C2=A0 =C2=A0 =C2=A0we might<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; need to introduce a virtual package for t=
he daemon. Regardless, dbus-broker<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; should depend on !BR2_PACKAGE_DBUS_DAEMON=
.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Looking more detailed at it, this seems too=
 complicated. dbus doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0offer a<br>
&gt;=C2=A0 =C2=A0 =C2=A0way to install only the library. Also in terms of r=
ootfs size, the only<br>
&gt;=C2=A0 =C2=A0 =C2=A0difference is the dbus-daemon and dbus-launch binar=
ies, plus a few config<br>
&gt;=C2=A0 =C2=A0 =C2=A0files.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Not really sufficient to make it worth it.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 What I will do, I think, is to include logi=
c in dbus to remove the<br>
&gt;=C2=A0 =C2=A0 =C2=A0activation<br>
&gt;=C2=A0 =C2=A0 =C2=A0units (both the service and the socket) when dbus-b=
roker is enabled. It is<br>
&gt;=C2=A0 =C2=A0 =C2=A0slightly messy because <a href=3D"http://dbus.mk" r=
el=3D"noreferrer noreferrer" target=3D"_blank">dbus.mk</a> &lt;<a href=3D"h=
ttp://dbus.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">http://dbus.=
mk</a>&gt; and <a href=3D"http://dbus-broker.mk" rel=3D"noreferrer noreferr=
er" target=3D"_blank">dbus-broker.mk</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://dbus-broker.mk" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">http://dbus-broker.mk</a>&gt; become fai=
rly tightly woven<br>
&gt;=C2=A0 =C2=A0 =C2=A0together, but I think it&#39;s worth it from a usab=
ility perspective.<br>
&gt; <br>
&gt; <br>
&gt; Sounds messy too,<br>
<br>
=C2=A0 Agreed. But the only unmessy thing that I found so far is to not use=
 <br>
dbus-broker at all if original dbus is selected, and I think that that pret=
ty <br>
much defeats the purpose of including dbus-broker.<br>
<br>
&gt; I would rather have a dbus-common package that includes the socket an =
config <br>
&gt; files (and creates the user if necessary).<br>
<br>
=C2=A0 That is a good idea. However, it only works for the two dbus configu=
ration <br>
files, not for the systemd units, so it only solves half of the mess. And t=
he <br>
added benefit is not that great. Also, they don&#39;t change very often any=
 more <br>
upstream (the last change is from 12/21, before that it&#39;s 12/17). So in=
 the end <br>
we decided not to go for dbus-common.<br>
<br>
<br>
&gt; That package would download dbus, but not build it, instead just copy =
over those <br>
&gt; files.<br>
&gt; Kinda like util-linux-libs<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Debian does something similar, including spli=
tting of the xml config files<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; and actual daemons into their own packages.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; see [1].<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Note about the user: the path to the =
system bus socket is a so-called<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; &quot;well-known location&quot;: it i=
s expected to be there, by spec. Moving it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; elsewhere is going to break existing =
programs. So, the user running the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; system bus daemon must be able to cre=
ate that socket.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; As we may have two packages providing=
 a system bus daemon, they have to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; be both able to create the socket, an=
d thus must both be able to write<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; in the directory containing the socke=
t. And since they can be switched<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; at runtime, they must be running as t=
he same user.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; We can&#39;t just reference the origi=
nal dbus user, so we duplicate the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; entry. What is important, is that the=
 user be named &#39;dbus&#39;, as that&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; what we use in both cases.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 If it&#39;s a virtual packag=
e, then the user could be created by the virtual<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; package itself.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 It won&#39;t be a virtual package, so no lo=
nger relevant.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; with systemd you probably dont even need a re=
al user for the isolation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; benefits.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; So maybe this would just be necessary if dbus=
 utilities are used,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; you can also just let systemd create that use=
r dynamically:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; [Service]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; User=3Ddbus<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Group=3Ddbus &gt; DynamicUser=3Dtrue<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 If we do this both in the dbus and the dbus=
-broker units, then indeed we can<br>
&gt;=C2=A0 =C2=A0 =C2=A0remove the dbus user.<br>
&gt; <br>
&gt; <br>
&gt; AFAIR the reason for the dbus to be a system user is that dbus-launch =
can setuid <br>
&gt; into it.<br>
&gt; So it only works without system user if dbus-launch is not used. Dbus-=
broker <br>
&gt; delegates this functionality to system (dbus activation)<br>
<br>
=C2=A0 Well, the service file still calls dbus-broker-launch, which I guess=
 does <br>
setuid because the upstream service file doesn&#39;t have any User=3D or Gr=
oup=3D<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquot=
e></div></div><div dir=3D"auto">I meant Dbus-launch, dbus-broker-launch *do=
es not use setuid* which depends on filesystem/inode permissions and uid.</=
div><div dir=3D"auto">If you prefix a ! In the service file dbus-broker-lau=
nch will be run as root, and since this is the only way the executable is u=
sed (unlike dbus) the dynamic user uid is enough.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Hence dbus-broker-launch works with random/dynami=
c uids, while dbus-launch needs a stable one.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
<br>
=C2=A0 I think we&#39;ll just stick to what we have now, and keep the upstr=
eam service <br>
file rather than hacking our own...<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 If I add this just to dbus-broker, but dbus=
 still creates a static user, is<br>
&gt;=C2=A0 =C2=A0 =C2=A0this going to give a problem for systemd? I.e. does=
 systemd support a<br>
&gt;=C2=A0 =C2=A0 =C2=A0DynamicUser=3Dtrue if the user exists already stati=
cally? I think so...<br>
&gt; <br>
&gt; <br>
&gt; Think so too.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnout<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ExecStart=3D!/usr/bin/dbus-broker-launch --sc=
ope system --audit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ExecReload=3D!/usr/bin/busctl call org.freede=
sktop.DBus<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; /org/freedesktop/DBus org.freedesktop.DBus Re=
loadConfig<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[snip]<br>
&gt; <br>
&gt; <br>
&gt; Norbert<br>
&gt; <br>
</blockquote></div></div></div>

--00000000000029722d05e4ce5ec1--

--===============4876477243690057111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4876477243690057111==--
