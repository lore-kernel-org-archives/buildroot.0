Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDAAC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 17:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E14415C1;
	Wed, 27 Jul 2022 17:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95E14415C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aR6gLIddqlla; Wed, 27 Jul 2022 17:31:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 147DF4160D;
	Wed, 27 Jul 2022 17:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 147DF4160D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 454301BF9B4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 17:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20A558275A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 17:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20A558275A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWJ9Tbwz-d3N for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 17:31:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0287826DE
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0287826DE
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 17:31:23 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id t82so984555vkb.7
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ZBKWPHmTGm4+lYeBnNXVJIS1PvJlsNGptCEAOzhpps=;
 b=xEfHg589FqnOlrNFzoU93+NPtMMkZPa0UqqTxZgYFaxiOftEv86W3k16RarfylTsqu
 6DJaxYVTAQjg/q131S4LpTX4kmSpgY/zq0xv7qa5CvWIG0/L5ytXhF0rIXwbZagJmDCu
 LBEV9CmfxG3jCIeXLDwEA+vqluRze7SZvXR1+tp5rzoALfqKQASudxvzdf+VqZWBCO5z
 445dy2yhFbmdbAjMBWYdCqMMe54HsHXqdAfckLGQItPDm9SmPurM9vTRDpvgf2zFPK7D
 MjfdPV+w/2WwVfC2wM6rvnIMnWOkuAxM7z4MO0eCdRQxzlwLO9AMRhh9PWsDmCbIAVnD
 cA1g==
X-Gm-Message-State: AJIora9PEWhhgg7SjrxvAUFYi/BRSMXGwxkem6aZv6uxjRWJhPJuGb8l
 1rRYeyoG3nwmYYDflUP+pQ6m2Zn84zO83JtXlqs=
X-Google-Smtp-Source: AGRyM1ujsfTBv4n0PX6uPjPQgsu0eAqFfiyzUpCA7heMuEfiUn5W7G1P0+UbUg68X7dHP5/LRhGIr9nhrmJq3S/fNbo=
X-Received: by 2002:a1f:164a:0:b0:376:20d:e8c8 with SMTP id
 71-20020a1f164a000000b00376020de8c8mr7250531vkw.21.1658943082367; Wed, 27 Jul
 2022 10:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220109221650.777610-1-nolange79@gmail.com>
 <2288ff34-d140-a1a0-3f8e-86baf04f4dee@mind.be>
 <CADYdroP82ZnJLWzL0=DP1r2T-0nJe3c7xxC4QgwkNtF5dkC_8A@mail.gmail.com>
 <28488fd2-ab02-43c7-25da-cdcb3f37d83a@mind.be>
In-Reply-To: <28488fd2-ab02-43c7-25da-cdcb3f37d83a@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 27 Jul 2022 19:31:11 +0200
Message-ID: <CADYdroNVSoUB-GkdRoXj64s+e+ECwE2sUfSs17kLcN-h_0_i7Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9ZBKWPHmTGm4+lYeBnNXVJIS1PvJlsNGptCEAOzhpps=;
 b=RPJryS8Dqoxpfw2WRTeDg7adzoeBkf6Se4TXVXc3a3yPf0XUtQNkRRIPjLo/GhXUVX
 y2n97xW70lNBoFriIAeBM96Vd/2Gdk20UuMQ5FUU0mcI5sHgdrjatXRD2YzHiOF7+4uk
 VteB9vT8uoqw0XisVbpwMFrerD2Yw2sdoOZP+UPn4rKhX0yt3i17K7A3C5uR2arhzxcF
 bccYJRQNpkwbRlFVULcFMTV9AD9sXy27Z14vJgjQHBUoWoa2BwuTBk1760NbeDJ0yQjL
 rI2i0IpKrGzSTH/KManJ1E5NF3nWgMnzflLbTDAZDSecF3vabFUeOamQ42CxEA65EFUX
 zaLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RPJryS8D
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
Content-Type: multipart/mixed; boundary="===============3549404420380041998=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3549404420380041998==
Content-Type: multipart/alternative; boundary="000000000000208f2f05e4ccc96b"

--000000000000208f2f05e4ccc96b
Content-Type: text/plain; charset="UTF-8"

Arnout Vandecappelle <arnout@mind.be> schrieb am Mi., 27. Juli 2022, 19:05:

>
>
> On 27/07/2022 15:47, Norbert Lange wrote:
> > Am Mi., 27. Juli 2022 um 13:08 Uhr schrieb Arnout Vandecappelle
> > <arnout@mind.be>:
> >>
> >>    Norbert, Yann,
> >>
> >>    As usual, apologies for taking so long to review this. It's because
> it's a bit
> >> complicated. I actually tried to look at it just after our hackaton in
> January
> >> but it was too complicated to quickly get my head around.
> >>
> >> On 09/01/2022 23:16, Norbert Lange wrote:
> >>> dbus-broker is an alternate implementation of a dbus dameon. It can be
> >>> used as a drop-in replacement for the system bus daemon, as well as the
> >>> session bus daemon.
> >>>
> >>> dbus-broker is (basically, and as far as we're concerned in Buildroot)
> >>> split in two components:
> >>>
> >>>     - the actual message bus daemon, that relays messages across
> clients
> >>>
> >>>     - a launcher, which is responsible for setting various aspects of
> the
> >>>       bus, like setting the policy et al. and opening the socket(s) the
> >>>       message bus daemon will have to listen on...
> >>>
> >>> The launcher can only be used in a systemd setup (it makes heavy use of
> >>> systemd facilities), while the message bus is generic. However, the
> >>> message bus daemon is useless without a launcher. There does not exist
> a
> >>> non-systemd launcher, which makes dbus-broker actually a systemd-only
> >>> package; this can be revisited when/if a non-systemd launcher appears.
> >>>
> >>> Note, however, that libdbus is not provided by dbus-borker. People who
> >>> want to use dbus-broker as the bus daemon, and need libdbus, will have
> >>> to enable both, see below.
> >>>
> >>> There are two cases:
> >>>
> >>>    1. original dbus disabled
> >>>
> >>>       Here, we install the config files and systemd socket activation
> >>>       units; dbus-broker provides the system and sessions bus daemons.
> >>>
> >>>       In this case, libdbus is not available.
> >>>
> >>>    2. original dbus enabled
> >>>
> >>>       In this case, we do not install the config files and systemd
> socket
> >>>       activation units, or define a user: they all are provided by the
> >>>       original dbus, and we piggy-back on those.
> >>>
> >>>       In this situation, the default system and sessions message bus
> are
> >>>       the original dbus, and libdbus is available; dbus-broker is not
> >>>       enabled.
> >>>
> >>>       So far, we believe it would be over-engineered to provide a way
> >>>       to allow choosing the bus daemon in the configuraiton. However,
> >>>       users may opt-in to use dbus-broker in a few ways:
> >>>         - at build-time: by calling systemctl enable/disable from a
> >>>           post-build script (preferred), or by providing drop-in units
> >>>           or presets in an overlay (less preferred) or custom skeleton
> >>>           (as a last resort),
> >>>         - at runtime (on a RW filesystem): by calling systemctl
> >>>           enable/disable
> >>
> >>    I don't know... To me it seems logical that if both are enabled,
> that you use
> >> dbus-broker for the bus and only use original dbus for libdbus.
> >
> > Would be fine by me, back then most distros required you to
> > manually enable dbus-broker, now it seems they shift to using
> > it by default if installed.
>
>   Since we anyway already have the infrastructure to automatically enable
> it if
> dbus is not included, it should be easy to do that even if dbus is
> included.
>
> >>    So to me the proper approach seems to change dbus itself so the
> daemon is
> >> optional, i.e. only libdbus is installed if the daemon is not enabled,
> similar
> >> to e.g. libcurl. BR2_PACKAGE_DBUS_DAEMON should default to y because
> that's what
> >> most people want. We'd have to go through existing packages to check if
> they
> >> depend on libdbus or on the daemon - mostly it will be the first. If
> there is a
> >> package that really needs the daemon (I don't actually think so), then
> we might
> >> need to introduce a virtual package for the daemon. Regardless,
> dbus-broker
> >> should depend on !BR2_PACKAGE_DBUS_DAEMON.
>
>   Looking more detailed at it, this seems too complicated. dbus doesn't
> offer a
> way to install only the library. Also in terms of rootfs size, the only
> difference is the dbus-daemon and dbus-launch binaries, plus a few config
> files.
> Not really sufficient to make it worth it.
>
>   What I will do, I think, is to include logic in dbus to remove the
> activation
> units (both the service and the socket) when dbus-broker is enabled. It is
> slightly messy because dbus.mk and dbus-broker.mk become fairly tightly
> woven
> together, but I think it's worth it from a usability perspective.
>

Sounds messy too,
I would rather have a dbus-common package that includes the socket an
config files (and creates the user if necessary).

That package would download dbus, but not build it, instead just copy over
those files.
Kinda like util-linux-libs


> > Debian does something similar, including splitting of the xml config
> files
> > and actual daemons into their own packages.
> >
> > see [1].
> >
> >>> Note about the user: the path to the system bus socket is a so-called
> >>> "well-known location": it is expected to be there, by spec. Moving it
> >>> elsewhere is going to break existing programs. So, the user running the
> >>> system bus daemon must be able to create that socket.
> >>>
> >>> As we may have two packages providing a system bus daemon, they have to
> >>> be both able to create the socket, and thus must both be able to write
> >>> in the directory containing the socket. And since they can be switched
> >>> at runtime, they must be running as the same user.
> >>>
> >>> We can't just reference the original dbus user, so we duplicate the
> >>> entry. What is important, is that the user be named 'dbus', as that's
> >>> what we use in both cases.
> >>
> >>    If it's a virtual package, then the user could be created by the
> virtual
> >> package itself.
>
>   It won't be a virtual package, so no longer relevant.
>
>
> > with systemd you probably dont even need a real user for the isolation
> > benefits.
> > So maybe this would just be necessary if dbus utilities are used,
> > you can also just let systemd create that user dynamically:
> >
> > [Service]
> > ...
> > User=dbus
> > Group=dbus > DynamicUser=true
>
>   If we do this both in the dbus and the dbus-broker units, then indeed we
> can
> remove the dbus user.
>

AFAIR the reason for the dbus to be a system user is that dbus-launch can
setuid into it.
So it only works without system user if dbus-launch is not used.
Dbus-broker delegates this functionality to system (dbus activation)


>   If I add this just to dbus-broker, but dbus still creates a static user,
> is
> this going to give a problem for systemd? I.e. does systemd support a
> DynamicUser=true if the user exists already statically? I think so...
>

Think so too.


>   Regards,
>   Arnout
>
> > ExecStart=!/usr/bin/dbus-broker-launch --scope system --audit
> > ExecReload=!/usr/bin/busctl call org.freedesktop.DBus
> > /org/freedesktop/DBus org.freedesktop.DBus ReloadConfig
>
> [snip]
>

Norbert

>

--000000000000208f2f05e4ccc96b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind=
.be">arnout@mind.be</a>&gt; schrieb am Mi., 27. Juli 2022, 19:05:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
<br>
On 27/07/2022 15:47, Norbert Lange wrote:<br>
&gt; Am Mi., 27. Juli 2022 um 13:08 Uhr schrieb Arnout Vandecappelle<br>
&gt; &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_blank" rel=3D"norefer=
rer">arnout@mind.be</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 Norbert, Yann,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 As usual, apologies for taking so long to review this=
. It&#39;s because it&#39;s a bit<br>
&gt;&gt; complicated. I actually tried to look at it just after our hackato=
n in January<br>
&gt;&gt; but it was too complicated to quickly get my head around.<br>
&gt;&gt;<br>
&gt;&gt; On 09/01/2022 23:16, Norbert Lange wrote:<br>
&gt;&gt;&gt; dbus-broker is an alternate implementation of a dbus dameon. I=
t can be<br>
&gt;&gt;&gt; used as a drop-in replacement for the system bus daemon, as we=
ll as the<br>
&gt;&gt;&gt; session bus daemon.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; dbus-broker is (basically, and as far as we&#39;re concerned i=
n Buildroot)<br>
&gt;&gt;&gt; split in two components:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0- the actual message bus daemon, that relay=
s messages across clients<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0- a launcher, which is responsible for sett=
ing various aspects of the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bus, like setting the policy et al. =
and opening the socket(s) the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0message bus daemon will have to list=
en on...<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The launcher can only be used in a systemd setup (it makes hea=
vy use of<br>
&gt;&gt;&gt; systemd facilities), while the message bus is generic. However=
, the<br>
&gt;&gt;&gt; message bus daemon is useless without a launcher. There does n=
ot exist a<br>
&gt;&gt;&gt; non-systemd launcher, which makes dbus-broker actually a syste=
md-only<br>
&gt;&gt;&gt; package; this can be revisited when/if a non-systemd launcher =
appears.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Note, however, that libdbus is not provided by dbus-borker. Pe=
ople who<br>
&gt;&gt;&gt; want to use dbus-broker as the bus daemon, and need libdbus, w=
ill have<br>
&gt;&gt;&gt; to enable both, see below.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; There are two cases:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 1. original dbus disabled<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Here, we install the config files an=
d systemd socket activation<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0units; dbus-broker provides the syst=
em and sessions bus daemons.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0In this case, libdbus is not availab=
le.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 2. original dbus enabled<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0In this case, we do not install the =
config files and systemd socket<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0activation units, or define a user: =
they all are provided by the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0original dbus, and we piggy-back on =
those.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0In this situation, the default syste=
m and sessions message bus are<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the original dbus, and libdbus is av=
ailable; dbus-broker is not<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0enabled.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0So far, we believe it would be over-=
engineered to provide a way<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to allow choosing the bus daemon in =
the configuraiton. However,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0users may opt-in to use dbus-broker =
in a few ways:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- at build-time: by calling s=
ystemctl enable/disable from a<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0post-build script (pre=
ferred), or by providing drop-in units<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0or presets in an overl=
ay (less preferred) or custom skeleton<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(as a last resort),<br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- at runtime (on a RW filesys=
tem): by calling systemctl<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable/disable<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 I don&#39;t know... To me it seems logical that if bo=
th are enabled, that you use<br>
&gt;&gt; dbus-broker for the bus and only use original dbus for libdbus.<br=
>
&gt; <br>
&gt; Would be fine by me, back then most distros required you to<br>
&gt; manually enable dbus-broker, now it seems they shift to using<br>
&gt; it by default if installed.<br>
<br>
=C2=A0 Since we anyway already have the infrastructure to automatically ena=
ble it if <br>
dbus is not included, it should be easy to do that even if dbus is included=
.<br>
<br>
&gt;&gt;=C2=A0 =C2=A0 So to me the proper approach seems to change dbus its=
elf so the daemon is<br>
&gt;&gt; optional, i.e. only libdbus is installed if the daemon is not enab=
led, similar<br>
&gt;&gt; to e.g. libcurl. BR2_PACKAGE_DBUS_DAEMON should default to y becau=
se that&#39;s what<br>
&gt;&gt; most people want. We&#39;d have to go through existing packages to=
 check if they<br>
&gt;&gt; depend on libdbus or on the daemon - mostly it will be the first. =
If there is a<br>
&gt;&gt; package that really needs the daemon (I don&#39;t actually think s=
o), then we might<br>
&gt;&gt; need to introduce a virtual package for the daemon. Regardless, db=
us-broker<br>
&gt;&gt; should depend on !BR2_PACKAGE_DBUS_DAEMON.<br>
<br>
=C2=A0 Looking more detailed at it, this seems too complicated. dbus doesn&=
#39;t offer a <br>
way to install only the library. Also in terms of rootfs size, the only <br=
>
difference is the dbus-daemon and dbus-launch binaries, plus a few config f=
iles. <br>
Not really sufficient to make it worth it.<br>
<br>
=C2=A0 What I will do, I think, is to include logic in dbus to remove the a=
ctivation <br>
units (both the service and the socket) when dbus-broker is enabled. It is =
<br>
slightly messy because <a href=3D"http://dbus.mk" rel=3D"noreferrer norefer=
rer" target=3D"_blank">dbus.mk</a> and <a href=3D"http://dbus-broker.mk" re=
l=3D"noreferrer noreferrer" target=3D"_blank">dbus-broker.mk</a> become fai=
rly tightly woven <br>
together, but I think it&#39;s worth it from a usability perspective.<br></=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sounds=
 messy too,</div><div dir=3D"auto">I would rather have a dbus-common packag=
e that includes the socket an config files (and creates the user if necessa=
ry).</div><div dir=3D"auto"><br></div><div dir=3D"auto">That package would =
download dbus, but not build it, instead just copy over those files.</div><=
div dir=3D"auto">Kinda like util-linux-libs</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
&gt; Debian does something similar, including splitting of the xml config f=
iles<br>
&gt; and actual daemons into their own packages.<br>
&gt; <br>
&gt; see [1].<br>
&gt; <br>
&gt;&gt;&gt; Note about the user: the path to the system bus socket is a so=
-called<br>
&gt;&gt;&gt; &quot;well-known location&quot;: it is expected to be there, b=
y spec. Moving it<br>
&gt;&gt;&gt; elsewhere is going to break existing programs. So, the user ru=
nning the<br>
&gt;&gt;&gt; system bus daemon must be able to create that socket.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; As we may have two packages providing a system bus daemon, the=
y have to<br>
&gt;&gt;&gt; be both able to create the socket, and thus must both be able =
to write<br>
&gt;&gt;&gt; in the directory containing the socket. And since they can be =
switched<br>
&gt;&gt;&gt; at runtime, they must be running as the same user.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; We can&#39;t just reference the original dbus user, so we dupl=
icate the<br>
&gt;&gt;&gt; entry. What is important, is that the user be named &#39;dbus&=
#39;, as that&#39;s<br>
&gt;&gt;&gt; what we use in both cases.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 If it&#39;s a virtual package, then the user could be=
 created by the virtual<br>
&gt;&gt; package itself.<br>
<br>
=C2=A0 It won&#39;t be a virtual package, so no longer relevant.<br>
<br>
<br>
&gt; with systemd you probably dont even need a real user for the isolation=
<br>
&gt; benefits.<br>
&gt; So maybe this would just be necessary if dbus utilities are used,<br>
&gt; you can also just let systemd create that user dynamically:<br>
&gt; <br>
&gt; [Service]<br>
&gt; ...<br>
&gt; User=3Ddbus<br>
&gt; Group=3Ddbus &gt; DynamicUser=3Dtrue<br>
<br>
=C2=A0 If we do this both in the dbus and the dbus-broker units, then indee=
d we can <br>
remove the dbus user.<br></blockquote></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">AFAIR the reason for the dbus to be a system user is t=
hat dbus-launch can setuid into it.</div><div dir=3D"auto">So it only works=
 without system user if dbus-launch is not used. Dbus-broker delegates this=
 functionality to system (dbus activation)</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
=C2=A0 If I add this just to dbus-broker, but dbus still creates a static u=
ser, is <br>
this going to give a problem for systemd? I.e. does systemd support a <br>
DynamicUser=3Dtrue if the user exists already statically? I think so...<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thin=
k so too.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; ExecStart=3D!/usr/bin/dbus-broker-launch --scope system --audit<br>
&gt; ExecReload=3D!/usr/bin/busctl call org.freedesktop.DBus<br>
&gt; /org/freedesktop/DBus org.freedesktop.DBus ReloadConfig<br>
<br>
[snip]<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Norbert</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
</blockquote></div></div></div>

--000000000000208f2f05e4ccc96b--

--===============3549404420380041998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3549404420380041998==--
