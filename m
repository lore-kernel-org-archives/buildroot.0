Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B71C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 09:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8562A82457;
	Tue, 28 Jun 2022 09:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8562A82457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWJ-VAbHTU-o; Tue, 28 Jun 2022 09:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0403482779;
	Tue, 28 Jun 2022 09:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0403482779
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C848F1BF30D
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 09:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A160060D9C
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 09:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A160060D9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJwY5RNTl3fD for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 09:12:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E642960D75
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E642960D75
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 09:12:07 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id eq6so16585183edb.6
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 02:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KxwURJjBdm0ohFROEj7IekLYKLvfzoq4vbQRnlog1MA=;
 b=m6xgtJIYGow45HgjbPlYPYAUA+SnfLkRgws4R8kehx3rYEWldRtCIJ4pR6vAp26vY4
 X3yE+vhivweWzMRTIHLWmqdf1UqqD71AT+Pd1K2WHSVQo7XQz4sotWWdLYTTYE1oI5c7
 hFPAies+34AlTdxJIjgbGeDEHiShBO0psgM5wmKW7fN+47/n5QGuDEgUTO2cS6HFW2mw
 7I00bhksnATE8dx1Jadr0We5TH48fQ33DSl2SyWcDCfNAG2caOH+r9TgR5jaKg0JpFAZ
 iZv3PElguY4Eb7KWb6YQmm7jLUcqAxuHukO5SNxWby2/53ylp9Q06kZKj0F/Gl2YGDWX
 NFRA==
X-Gm-Message-State: AJIora977m6Ry43lsbYmnzIDf/s8Pd8duz1jr9+RUuCLi9qC8ySWNle5
 PqUYscoGqmv47FsmSmcFnHkJXe/TiOYChJ8WGCns9g==
X-Google-Smtp-Source: AGRyM1sMqsor3GKttIWDzdwIIJgosqECMP66h4IQflkfxTEoP1hKfJfhNsf+LSWd+JaNEhI9yNu/x19eMmaI/QfowwQ=
X-Received: by 2002:aa7:dac2:0:b0:435:76a2:4ebe with SMTP id
 x2-20020aa7dac2000000b0043576a24ebemr22120540eds.196.1656407526026; Tue, 28
 Jun 2022 02:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.2285.1655818273.17960.buildroot@buildroot.org>
 <f68f04d611f75d87d9fae2a0a04a3896@umbiko.net>
 <CA+_SqVbnBaZL6=DorHZTt-zjtGFHVXPz4kQjovQoJhFRjfW27A@mail.gmail.com>
 <0461dd83240f84078d7e3341289d3fa5@umbiko.net>
In-Reply-To: <0461dd83240f84078d7e3341289d3fa5@umbiko.net>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 28 Jun 2022 11:11:30 +0200
Message-ID: <CA+_SqVYO9APvnvA+fuG0OeF1ptr3LZEhtehKxm=Bj9AAcE+N=A@mail.gmail.com>
To: Andreas Ziegler <br015@umbiko.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KxwURJjBdm0ohFROEj7IekLYKLvfzoq4vbQRnlog1MA=;
 b=O9oL1GJ/G/fX3+3RHmMVPy1zwNcFLdAaie5vQ9WyqTVkSz+ys+YZN1BYtaXvNQYKCV
 j0tzlJXMNQrkKtjgEuPsefOGZTr7Y4ZBJtQFbactW/X9wcBFjsmJL1J748hKEuWPP9/s
 53X9wqKII7u1Y/tGvOZdkOGfgy2DcKT2iBZ6Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=O9oL1GJ/
Subject: Re: [Buildroot] [PATCH 4/4] package/busybox: add service to load
 kernel modules at boot
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
Content-Type: multipart/mixed; boundary="===============7287592306117361866=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7287592306117361866==
Content-Type: multipart/alternative; boundary="00000000000031465405e27e6ed3"

--00000000000031465405e27e6ed3
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 28, 2022 at 11:03 AM Andreas Ziegler <br015@umbiko.net> wrote:

> Hi Angelo,
>
> On 2022-06-28 07:56, Angelo Compagnucci wrote:
> > On Sat, Jun 25, 2022 at 7:02 AM Andreas Ziegler <br015@umbiko.net>
> > wrote:
> >
> >> Hi Angelo,
> >>
> >> On 2022-06-21 13:31, Angelo Compagnucci
> >> <angelo@amarulasolutions.com>
> >> wrote:
> >>
> >>>>
> >>>>
> >>>> On 20/06/2022 23:40, Angelo Compagnucci wrote:
> >>>>> In cases where no hotplug is available (by choice or by the
> >> lack of a
> >>>>> proper hotplug method for a device), this service can be used
> >> to load
> >>>>> kernel module drivers by reading the /etc/modules file.
> >>>>
> >>>> Do you have a concrete example of something that needs this?
> >> It's
> >>>> kind
> >>>> of a
> >>>> hack for e.g. a device connected to a serial port that isn't
> >> described
> >>>> in
> >>>> DT
> >>>> (e.g. on an x86 platform), right?
> >>>>
> >>>
> >>> Wifi card connected on SDIO with an out of tree kernel module.
> >>>
> >>>
> >>>> I'm not altogether sure if it is worth making an init script
> >> for
> >>>> that.
> >>>>
> >>>
> >>> Most distros out there have the /etc/modules loaded at boot time.
> >>>
> >>>
> >>>> Also, this would belong to the initscripts package because it
> >> would
> >>>> also
> >>>> be
> >>>> needed if busybox isn't used at all (it would of course require
> >> kmod).
> >>>>
> >>>
> >>> Right, I'll fix it
> >>>
> >>>
> >>>>
> >>>>
> >>>>>
> >>>>> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> >>>>> ---
> >>>>>   package/busybox/S02modules | 56
> >> ++++++++++++++++++++++++++++++++++++++
> >>>>>   package/busybox/busybox.mk [1] |  2 ++
> >>>>>   2 files changed, 58 insertions(+)
> >>>>>   create mode 100644 package/busybox/S02modules
> >>>>>
> >>>>> diff --git a/package/busybox/S02modules
> >> b/package/busybox/S02modules
> >>
> >> S02 is a bit early, [mu]dev use S10.
> >
> > Can you point me to these  [mu]dev scripts?
> >
> >>>>> new file mode 100644
> >>>>> index 0000000000..f25712e1ca
> >>>>> --- /dev/null
> >>>>> +++ b/package/busybox/S02modules
> >>>>> @@ -0,0 +1,56 @@
> >>>>> +#!/bin/sh
> >>>>> +
> >>>>> +MODULES="modules"
> >>>>> +
> >>>>> +load_unload() {
> >>>>> +     [ ! -f /etc/${MODULES} ] && echo ' OK' && exit 0
> >>>>> +
> >>>>> +     while read module args; do
> >>>>> +
> >>>>> +             case "$module" in
> >>>>> +                     ""|"#"*) continue ;;
> >>>>> +             esac
> >>>>> +
> >>>>> +             if [ "$1" = "load" ]; then
> >>>>> +                     modprobe -q ${module} ${args} >/dev/null
> >> && \
> >>>>> +                             printf ' %s success,' "$module"
> >> ||
> >>>>> +                             printf ' %s failed,' "$module"
> >>>>> +             else
> >>>>> +                     rmmod ${module} >/dev/null
> >>>>> +             fi
> >>>>> +
> >>>>> +     done < /etc/${MODULES}
> >>>>> +}
> >>>>> +
> >>>>> +start() {
> >>>>> +     printf 'Starting %s:' "$MODULES"
> >>>>> +
> >>>>> +     load_unload load
> >>>>> +
> >>>>> +     echo ' OK'
> >>>>> +}
> >>>>> +
> >>>>> +stop() {
> >>>>> +     printf 'Stopping %s: ' "$MODULES"
> >>>>> +
> >>>>> +     load_unload unload
> >>>>> +
> >>>>> +     echo 'OK'
> >>>>> +}
> >>>>> +
> >>>>> +restart() {
> >>>>> +     stop
> >>>>> +     sleep 1
> >>>>> +     start
> >>>>> +}
> >>>>> +
> >>>>> +case "$1" in
> >>>>> +     start|stop|restart)
> >>>>> +             "$1";;
> >>>>> +     reload)
> >>>>> +             # Restart, since there is no true "reload"
> >> feature.
> >>>>> +             restart;;
> >>>>> +     *)
> >>>>> +             echo "Usage: $0 {start|stop|restart|reload}"
> >>>>> +             exit 1
> >>>>> +esac
> >>>>> diff --git a/package/busybox/busybox.mk [1]
> >> b/package/busybox/busybox.mk [1]
> >>>>> index 3e49de0a84..40490e866a 100644
> >>>>> --- a/package/busybox/busybox.mk [1]
> >>>>> +++ b/package/busybox/busybox.mk [1]
> >>>>> @@ -382,6 +382,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS
> >>>>>       $(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
> >>>>>       $(BUSYBOX_INSTALL_ZCIP_SCRIPT)
> >>>>>       $(BUSYBOX_INSTALL_MDEV_CONF)
> >>>>> +     $(INSTALL) -m 0755 -D package/busybox/S02modules \
> >>>>> +                     $(TARGET_DIR)/etc/init.d/S02modules;
> >>
> >> Since this is intended for systems without dynamic device handling,
> >> you
> >> might use an optional script, similar to BUSYBOX_INSTALL_*_SCRIPT:
> >>
> >> # Copy S22modules to /etc/init.d if no dynamic device handling is
> >> used
> >> ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
> >> define BUSYBOX_INSTALL_MODULES_SCRIPT
> >> $(INSTALL) -m 0755 -D package/busybox/S22modules \
> >> $(TARGET_DIR)/etc/init.d/S22modules;
> >> endef # BUSYBOX_INSTALL_MODULES_SCRIPT
> >>
> >> Probably a default /etc/modules could also be installed.
> >
> > Yes, but it is not the only usecase here. A usecase could be a
> > userspace software that needs a special kernel module to be loaded on
> > boot or a hardware which cannot be hotplugged.
>
> Then a Config.in item to select this feature would be appreciated, since
> most configurations will not need it.
>

Not sure if it will be happily accepted ;)
The last word is on the BR maintainers.
Anyway, in systemd we have the service always installed and available, it
prints anything to the console if no module should be loaded.
I can move the check for the modules file at the very beginning of the
script, so it's like it has never been executed.

> My usecase was for a wifi card connected via sdio running only with an
> > out of tree kernel module. The wifi card is soldered and doesn't have
> > a CS to trigger an hotplug event and the only sensible way I found to
> > load the module at boot was to have a proper way to load modules at
> > boot.
>
> I used something similar initially, until switching to udev.
>

Sure I can, but this patch is exactly to cover the cases where a developer
cannot/won't switch to something like that.


>
> > I'm not aware normal distros does so much tinkering about loading a
> > kernel module at boot: /etc/modules or the newly /etc/modules-load.d/
> > for systemd are widely adopted and are usually working out of the box.
> >
>
> Kind regards,
> Andreas
>
> >> Kind regards,
> >> Andreas
> >>
> >>>>
> >>>> This is a sysvinit script, so it should be installed in
> >>>> BUSYBOX_INSTALL_INIT_SYSV.
> >>>>
> >>>>
> >>>>
> >>>> Regards,
> >>>> Arnout
> >>>>
> >>>>>   endef
> >>>>>
> >>>>>   # Install the sysvinit scripts, for the moment, but not those
> >> that
> >>>> already
> >>>>
> >>>
> >>>
> >>> --
> >>>
> >>> Angelo Compagnucci
> >>>
> >>> Software Engineer
> >>>
> >>> angelo@amarulasolutions.com
> >>> __________________________________
> >>> Amarula Solutions SRL
> >>>
> >>> Via le Canevare 30, 31100 Treviso, Veneto, IT
> >>>
> >>> T. +39 (0)42 243 5310
> >>> info@amarulasolutions.com
> >>>
> >>> www.amarulasolutions.com [2]
> >>> [`as] https://www.amarulasolutions.com|
> >
> > --
> >
> > Angelo Compagnucci
> >
> > Software Engineer
> >
> > angelo@amarulasolutions.com
> > __________________________________
> > Amarula Solutions SRL
> >
> > Via le Canevare 30, 31100 Treviso, Veneto, IT
> >
> > T. +39 (0)42 243 5310
> > info@amarulasolutions.com
> >
> > www.amarulasolutions.com [3]
> >
> > [`as] https://www.amarulasolutions.com|
> >
> > Links:
> > ------
> > [1] http://busybox.mk
> > [2] http://www.amarulasolutions.com
> > [3] http://www.amarulasolutions.com/
>


-- 

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--00000000000031465405e27e6ed3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 28, 2022 at 11:03 AM Andr=
eas Ziegler &lt;<a href=3D"mailto:br015@umbiko.net">br015@umbiko.net</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Ange=
lo,<br>
<br>
On 2022-06-28 07:56, Angelo Compagnucci wrote:<br>
&gt; On Sat, Jun 25, 2022 at 7:02 AM Andreas Ziegler &lt;<a href=3D"mailto:=
br015@umbiko.net" target=3D"_blank">br015@umbiko.net</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hi Angelo,<br>
&gt;&gt; <br>
&gt;&gt; On 2022-06-21 13:31, Angelo Compagnucci<br>
&gt;&gt; &lt;<a href=3D"mailto:angelo@amarulasolutions.com" target=3D"_blan=
k">angelo@amarulasolutions.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; On 20/06/2022 23:40, Angelo Compagnucci wrote:<br>
&gt;&gt;&gt;&gt;&gt; In cases where no hotplug is available (by choice or b=
y the<br>
&gt;&gt; lack of a<br>
&gt;&gt;&gt;&gt;&gt; proper hotplug method for a device), this service can =
be used<br>
&gt;&gt; to load<br>
&gt;&gt;&gt;&gt;&gt; kernel module drivers by reading the /etc/modules file=
.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Do you have a concrete example of something that needs thi=
s?<br>
&gt;&gt; It&#39;s<br>
&gt;&gt;&gt;&gt; kind<br>
&gt;&gt;&gt;&gt; of a<br>
&gt;&gt;&gt;&gt; hack for e.g. a device connected to a serial port that isn=
&#39;t<br>
&gt;&gt; described<br>
&gt;&gt;&gt;&gt; in<br>
&gt;&gt;&gt;&gt; DT<br>
&gt;&gt;&gt;&gt; (e.g. on an x86 platform), right?<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Wifi card connected on SDIO with an out of tree kernel module.=
<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; I&#39;m not altogether sure if it is worth making an init =
script<br>
&gt;&gt; for<br>
&gt;&gt;&gt;&gt; that.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Most distros out there have the /etc/modules loaded at boot ti=
me.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Also, this would belong to the initscripts package because=
 it<br>
&gt;&gt; would<br>
&gt;&gt;&gt;&gt; also<br>
&gt;&gt;&gt;&gt; be<br>
&gt;&gt;&gt;&gt; needed if busybox isn&#39;t used at all (it would of cours=
e require<br>
&gt;&gt; kmod).<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Right, I&#39;ll fix it<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailt=
o:angelo@amarulasolutions.com" target=3D"_blank">angelo@amarulasolutions.co=
m</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0package/busybox/S02modules | 56<br>
&gt;&gt; ++++++++++++++++++++++++++++++++++++++<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0package/busybox/<a href=3D"http://busybox.=
mk" rel=3D"noreferrer" target=3D"_blank">busybox.mk</a> [1] |=C2=A0 2 ++<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A02 files changed, 58 insertions(+)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644 package/busybox/S02modu=
les<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; diff --git a/package/busybox/S02modules<br>
&gt;&gt; b/package/busybox/S02modules<br>
&gt;&gt; <br>
&gt;&gt; S02 is a bit early, [mu]dev use S10.<br>
&gt; <br>
&gt; Can you point me to these=C2=A0 [mu]dev scripts?<br>
&gt; <br>
&gt;&gt;&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt;&gt;&gt; index 0000000000..f25712e1ca<br>
&gt;&gt;&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt;&gt;&gt; +++ b/package/busybox/S02modules<br>
&gt;&gt;&gt;&gt;&gt; @@ -0,0 +1,56 @@<br>
&gt;&gt;&gt;&gt;&gt; +#!/bin/sh<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +MODULES=3D&quot;modules&quot;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +load_unload() {<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0[ ! -f /etc/${MODULES} ] &amp;&am=
p; echo &#39; OK&#39; &amp;&amp; exit 0<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0while read module args; do<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case =
&quot;$module&quot; in<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;|&quot;#&quot;*) continue ;;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<=
br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ =
&quot;$1&quot; =3D &quot;load&quot; ]; then<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0modprobe -q ${module} ${args} &gt;/dev/null<br>
&gt;&gt; &amp;&amp; \<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf &#39; %s success=
,&#39; &quot;$module&quot;<br>
&gt;&gt; ||<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf &#39; %s failed,=
&#39; &quot;$module&quot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<=
br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0rmmod ${module} &gt;/dev/null<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br=
>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0done &lt; /etc/${MODULES}<br>
&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +start() {<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Starting %s:&#39; &qu=
ot;$MODULES&quot;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0load_unload load<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0echo &#39; OK&#39;<br>
&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +stop() {<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Stopping %s: &#39; &q=
uot;$MODULES&quot;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0load_unload unload<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0echo &#39;OK&#39;<br>
&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +restart() {<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0stop<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0sleep 1<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0start<br>
&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +case &quot;$1&quot; in<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0start|stop|restart)<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;$1&quot;;;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0reload)<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Res=
tart, since there is no true &quot;reload&quot;<br>
&gt;&gt; feature.<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resta=
rt;;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*)<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo =
&quot;Usage: $0 {start|stop|restart|reload}&quot;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit =
1<br>
&gt;&gt;&gt;&gt;&gt; +esac<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/package/busybox/<a href=3D"http://busybox=
.mk" rel=3D"noreferrer" target=3D"_blank">busybox.mk</a> [1]<br>
&gt;&gt; b/package/busybox/<a href=3D"http://busybox.mk" rel=3D"noreferrer"=
 target=3D"_blank">busybox.mk</a> [1]<br>
&gt;&gt;&gt;&gt;&gt; index 3e49de0a84..40490e866a 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/package/busybox/<a href=3D"http://busybox.mk" re=
l=3D"noreferrer" target=3D"_blank">busybox.mk</a> [1]<br>
&gt;&gt;&gt;&gt;&gt; +++ b/package/busybox/<a href=3D"http://busybox.mk" re=
l=3D"noreferrer" target=3D"_blank">busybox.mk</a> [1]<br>
&gt;&gt;&gt;&gt;&gt; @@ -382,6 +382,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS=
<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BUSYBOX_INSTALL_UDHCPC_SCR=
IPT)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BUSYBOX_INSTALL_ZCIP_SCRIP=
T)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BUSYBOX_INSTALL_MDEV_CONF)=
<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 -D package/bus=
ybox/S02modules \<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/init.d/S02modules;<br>
&gt;&gt; <br>
&gt;&gt; Since this is intended for systems without dynamic device handling=
,<br>
&gt;&gt; you<br>
&gt;&gt; might use an optional script, similar to BUSYBOX_INSTALL_*_SCRIPT:=
<br>
&gt;&gt; <br>
&gt;&gt; # Copy S22modules to /etc/init.d if no dynamic device handling is<=
br>
&gt;&gt; used<br>
&gt;&gt; ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)<br>
&gt;&gt; define BUSYBOX_INSTALL_MODULES_SCRIPT<br>
&gt;&gt; $(INSTALL) -m 0755 -D package/busybox/S22modules \<br>
&gt;&gt; $(TARGET_DIR)/etc/init.d/S22modules;<br>
&gt;&gt; endef # BUSYBOX_INSTALL_MODULES_SCRIPT<br>
&gt;&gt; <br>
&gt;&gt; Probably a default /etc/modules could also be installed.<br>
&gt; <br>
&gt; Yes, but it is not the only usecase here. A usecase could be a<br>
&gt; userspace software that needs a special kernel module to be loaded on<=
br>
&gt; boot or a hardware which cannot be hotplugged.<br>
<br>
Then a Config.in item to select this feature would be appreciated, since <b=
r>
most configurations will not need it.<br></blockquote><div><br></div><div>N=
ot sure if it will be happily accepted ;)</div><div>The last word is on the=
 BR maintainers.</div><div>Anyway, in systemd we have the service always in=
stalled and available, it prints anything to the console if no module shoul=
d be loaded.</div><div>I can move the check for the modules file at the ver=
y beginning of the script, so it&#39;s like it has never been executed.</di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; My usecase was for a wifi card connected via sdio running only with an=
<br>
&gt; out of tree kernel module. The wifi card is soldered and doesn&#39;t h=
ave<br>
&gt; a CS to trigger an hotplug event and the only sensible way I found to<=
br>
&gt; load the module at boot was to have a proper way to load modules at<br=
>
&gt; boot.<br>
<br>
I used something similar initially, until switching to udev.<br></blockquot=
e><div><br></div><div>Sure I can, but this patch is exactly to cover the ca=
ses where a developer cannot/won&#39;t switch to something like that.<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I&#39;m not aware normal distros does so much tinkering about loading =
a<br>
&gt; kernel module at boot: /etc/modules or the newly /etc/modules-load.d/<=
br>
&gt; for systemd are widely adopted and are usually working out of the box.=
<br>
&gt; <br>
<br>
Kind regards,<br>
Andreas<br>
<br>
&gt;&gt; Kind regards,<br>
&gt;&gt; Andreas<br>
&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; This is a sysvinit script, so it should be installed in<br=
>
&gt;&gt;&gt;&gt; BUSYBOX_INSTALL_INIT_SYSV.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt; Arnout<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0endef<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Install the sysvinit scripts, for the mo=
ment, but not those<br>
&gt;&gt; that<br>
&gt;&gt;&gt;&gt; already<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Angelo Compagnucci<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Software Engineer<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <a href=3D"mailto:angelo@amarulasolutions.com" target=3D"_blan=
k">angelo@amarulasolutions.com</a><br>
&gt;&gt;&gt; __________________________________<br>
&gt;&gt;&gt; Amarula Solutions SRL<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Via le Canevare 30, 31100 Treviso, Veneto, IT<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; T. +39 (0)42 243 5310<br>
&gt;&gt;&gt; <a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank"=
>info@amarulasolutions.com</a><br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <a href=3D"http://www.amarulasolutions.com" rel=3D"noreferrer"=
 target=3D"_blank">www.amarulasolutions.com</a> [2]<br>
&gt;&gt;&gt; [`as] <a href=3D"https://www.amarulasolutions.com" rel=3D"nore=
ferrer" target=3D"_blank">https://www.amarulasolutions.com</a>|<br>
&gt; <br>
&gt; --<br>
&gt; <br>
&gt; Angelo Compagnucci<br>
&gt; <br>
&gt; Software Engineer<br>
&gt; <br>
&gt; <a href=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">angel=
o@amarulasolutions.com</a><br>
&gt; __________________________________<br>
&gt; Amarula Solutions SRL<br>
&gt; <br>
&gt; Via le Canevare 30, 31100 Treviso, Veneto, IT<br>
&gt; <br>
&gt; T. +39 (0)42 243 5310<br>
&gt; <a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@am=
arulasolutions.com</a><br>
&gt; <br>
&gt; <a href=3D"http://www.amarulasolutions.com" rel=3D"noreferrer" target=
=3D"_blank">www.amarulasolutions.com</a> [3]<br>
&gt; <br>
&gt; [`as] <a href=3D"https://www.amarulasolutions.com" rel=3D"noreferrer" =
target=3D"_blank">https://www.amarulasolutions.com</a>|<br>
&gt; <br>
&gt; Links:<br>
&gt; ------<br>
&gt; [1] <a href=3D"http://busybox.mk" rel=3D"noreferrer" target=3D"_blank"=
>http://busybox.mk</a><br>
&gt; [2] <a href=3D"http://www.amarulasolutions.com" rel=3D"noreferrer" tar=
get=3D"_blank">http://www.amarulasolutions.com</a><br>
&gt; [3] <a href=3D"http://www.amarulasolutions.com/" rel=3D"noreferrer" ta=
rget=3D"_blank">http://www.amarulasolutions.com/</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre-wrap"></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:50=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">Software Engineer</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:angelo@am=
arulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(241,194,50);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">__________________________________</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubun=
tu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:500=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Via le Canevare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">T. +39 (0)42 243 5310</span><span style=3D"font-size:10pt;font-famil=
y:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@=
amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.co=
m/" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">www.=
amarulasolutions.com</span></a></p><div>[`as] <a href=3D"https://www.amarul=
asolutions.com" target=3D"_blank">https://www.amarulasolutions.com</a>|</di=
v></div></div></div>

--00000000000031465405e27e6ed3--

--===============7287592306117361866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7287592306117361866==--
