Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA2AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 13:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 052AB8429F;
	Tue, 15 Mar 2022 13:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltMGeBUQs4K9; Tue, 15 Mar 2022 13:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC88784293;
	Tue, 15 Mar 2022 13:05:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16B351BF574
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 13:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0205940158
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 13:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgnKenWpITes for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 13:05:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 235E8400C9
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 13:05:20 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id j29so13224954ila.4
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PGhwAS9OQBFz04+Sx+PVmH0RPeSKp9pkAH6ujaFNe30=;
 b=b94CbhnJsaLRSQUv7NTXagxTnKG3K3hJnGuDVONvaC3v/avrVMp8mwSMIC7lbPD+Pc
 0U/eNz/0KhigjEoDmxogivdc7ea3Ur/VPsZ1Z3x7nCneVMbEM/Z5suMhLDyc5HpGWzE1
 eCrCPdwo98kPUNPwbfy0FQxgHgRRKBotAN8sJYH0BedyQTv1iDKb7vgQRfRzYn/7I7mH
 cXMjHypl2oP77lw1B2aBMNfvRCKBMU4Tc/t2Kua5wpg2P2NA9tFJkvBEN2u3I432KseM
 skAR3Gj5dJlPPaKj2XgM3u6gsIp4rG3i7mbRN/XSgL2Uzt7HsZsFRrODDRDhWUiL6EPL
 y6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PGhwAS9OQBFz04+Sx+PVmH0RPeSKp9pkAH6ujaFNe30=;
 b=AMsmdFNzIrRZVQleit+bNNO2bLrgZYiy6qOu9G5iMlG/pp4r8dWYSHb8BGfP/J3uYd
 xLdBBd2SryTEThF/zWQCxGvVSLK95XNcx+Gz1k7sllMLFc1FDEgoVq/oN8/RHwRDScH2
 Mt1ZRapJpAOOfpzuVhuVC3HUrM8xrnxjf5Vqqp4Tx8/5H0y2zjJ27Hi1f7lE8Xfzvz21
 XUQ2F4yhq5aWHnRvdpxcIRk6Ss0QnoRpE3w1QDBNstk1QEtL2Ze/Rst0Yn7MwTnSWB81
 TahmithQfcLNobO616HETc0+1xoBMhrCBU/R4EKJNSZcEPnaToDeGbzltmi26aX05ymM
 5xjA==
X-Gm-Message-State: AOAM5309dMNuBeN1cdCoT277kwG91rlbpbqu+8CeF+n+ukURNvIMGXOS
 zQo/kRKdFKMFW3XicGSzcPEbo9nIpOmA7+JHakXIvRlVVxE=
X-Google-Smtp-Source: ABdhPJzUbuxcz+MZhuA756A+UAVpm5GUzQyxpea/BjD8w0cdZ+stR3Htv7pHxZOTqEI0QgTFkLQ/psNCT7bHADXHj74=
X-Received: by 2002:a92:cb0f:0:b0:2c6:15ee:61e0 with SMTP id
 s15-20020a92cb0f000000b002c615ee61e0mr22657329ilo.75.1647349519794; Tue, 15
 Mar 2022 06:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSsCzsQbWw25kghn49m6vZ9XBMi5NQfBHhTh5X6E3z=JFg@mail.gmail.com>
 <CADYjeStJRry=ed46Km6nsaFk+wtbaxs0bLDfiPmtJ7xwZs2UwA@mail.gmail.com>
 <Yio9dHRYViMb7+iG@arch-zen.localdomain>
In-Reply-To: <Yio9dHRYViMb7+iG@arch-zen.localdomain>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Tue, 15 Mar 2022 14:05:08 +0100
Message-ID: <CADYjeSvNBqiYOuQrxdpQF_9t0w+4pf6B4d-Ufs5xAkkgCZGfFA@mail.gmail.com>
To: Jan Havran <havran.jan@email.cz>
Subject: Re: [Buildroot] How to connect to Wifi on start-up using Buildroot?
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
Content-Type: multipart/mixed; boundary="===============5575067515055257937=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5575067515055257937==
Content-Type: multipart/related; boundary="000000000000f35adf05da417291"

--000000000000f35adf05da417291
Content-Type: multipart/alternative; boundary="000000000000f35ade05da417290"

--000000000000f35ade05da417290
Content-Type: text/plain; charset="UTF-8"

Helllo Jan,

Thanks for the answer.

From Buildroot 2021 release "ctrl_interface" is disabled and so I have
commented out below line in etc/wpa_supplicant.conf file

# ctrl_interface=/var/run/wpa_supplicant

And also in my rootfs, there is no "/var/run/wpa_supplicant" file.

I have set below options in menuconfig

[image: menuconfig.PNG]

Then doing make clean & make results in below errors:

>>> wpa_supplicant 2.10 Installing to staging directory
/usr/bin/install -m 0644 -D
/root/raspcm4/sources/output/build/wpa_supplicant-2.10/wpa_supplicant/libwpa_client.so
/root/raspcm4/sources/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libwpa_client.so
/usr/bin/install: cannot stat
'/root/raspcm4/sources/output/build/wpa_supplicant-2.10/wpa_supplicant/libwpa_client.so':
No such file or directory
make[1]: *** [package/pkg-generic.mk:331:
/root/raspcm4/sources/output/build/wpa_supplicant-2.10/.stamp_staging_installed]
Error 1
make: *** [Makefile:23: _all] Error 2

Can you please let me know what could be the issue and how to resolve it?

Thanks in advance

On Thu, 10 Mar 2022 at 19:03, Jan Havran <havran.jan@email.cz> wrote:

> Hi Sourabh,
>
> after enabling RPi firmware you must load the Wifi driver - since you are
> using
> systemd, it should by handled by udev on start I think.
>
> So you probably just need to configure /etc/network/interfaces to start
> wpa_supplicant
> on wlan0 with /etc/wpa_supplicant.conf file, where you can put your
> credentials.
> Or at least that is what I have done, but I am not using systemd.
>
> I did something similar some time ago, you can check it here:
>
> https://gitlab.com/sonicpp/gnss-pi/-/commit/caf0317c024e51fc7e322deacd09ec9346d47e26
>
> (note that to make "my" credentials public in that commit was an
> intention).
>
> P.S.: if you want to have any modifications to be part of your image with
> filesystem,
> you can do it by using rootfs overlays for example:
> https://buildroot.org/downloads/manual/manual.html#rootfs-custom
>
> Regards,
>
> Jan Havran
>
> V Thu, Mar 10, 2022 at 05:43:27PM +0100, Sourabh Hegde napsal(a):
> > Hello All,
> >
> > I am trying to connect my Raspberry Pi CM4 to Wifi automatically after
> > start-up. I am using Buildroot based Linux distribution. I have worked
> with
> > Yocto before and it provides systemd-networkd and wpa_supplicant feature
> to
> > connect to wifi on boot. I am lloking something similar in Buildroot but
> > couldn't find any notes online.
> >
> > So far, I think I have enabled the necessary config/driver using "make
> > menuconfig" :
> > [image: wpa_supplicant.png]
> > [image: firmware.png]
> >
> > But now, how can I set-up wpa_supplicant.conf? Any link to notes or
> > suggestion would be helpful.
> >
> > Can anyone please let me know how to proceed further with it?
> >
> > Your help will be much appreciated.
> >
> > Thanks in advance.
> >
> > P.S: I am using Buildroot 2022.02 release and also using systemd feature
> > and let me know if any info is missing here.
> >
> > Regards,
> >
> > Sourabh
>
>
>
>
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--000000000000f35ade05da417290
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Helllo Jan,</div><div><br></div><div>Thanks for the a=
nswer.</div><div><br></div><div>From Buildroot 2021 release &quot;ctrl_inte=
rface&quot; is disabled and so I have commented out below line in etc/wpa_s=
upplicant.conf file</div><div><br></div><div>#
<code><span id=3D"gmail-LC1" class=3D"gmail-line" lang=3D"conf"><span class=
=3D"gmail-n">ctrl_interface</span>=3D/<span class=3D"gmail-n">var</span>/<s=
pan class=3D"gmail-n">run</span>/<span class=3D"gmail-n">wpa_supplicant</sp=
an></span></code></div><div><code><span id=3D"gmail-LC1" class=3D"gmail-lin=
e" lang=3D"conf"><span class=3D"gmail-n"><br></span></span></code></div><di=
v><code><span id=3D"gmail-LC1" class=3D"gmail-line" lang=3D"conf"><span cla=
ss=3D"gmail-n"><font face=3D"arial,sans-serif">And also in my rootfs, there=
 is no </font>&quot;<code><span id=3D"gmail-LC1" class=3D"gmail-line" lang=
=3D"conf">/<span class=3D"gmail-n">var</span>/<span class=3D"gmail-n">run</=
span>/<span class=3D"gmail-n">wpa_supplicant</span></span></code>&quot; fil=
e. <br></span></span></code></div><div><code><span id=3D"gmail-LC1" class=
=3D"gmail-line" lang=3D"conf"><span class=3D"gmail-n"><br></span></span></c=
ode></div><div><code><span id=3D"gmail-LC1" class=3D"gmail-line" lang=3D"co=
nf"><span class=3D"gmail-n"><font face=3D"arial,sans-serif">I have set belo=
w options in menuconfig</font></span></span></code></div><div><code><span i=
d=3D"gmail-LC1" class=3D"gmail-line" lang=3D"conf"><span class=3D"gmail-n">=
<font face=3D"arial,sans-serif"><br></font></span></span></code></div><div>=
<img src=3D"cid:ii_l0s58muc0" alt=3D"menuconfig.PNG" style=3D"margin-right:=
 0px;" width=3D"321" height=3D"265"></div><div><br></div><div>Then doing ma=
ke clean &amp; make results in below errors:</div><div><br></div><div>&gt;&=
gt;&gt; wpa_supplicant 2.10 Installing to staging directory<br>/usr/bin/ins=
tall -m 0644 -D /root/raspcm4/sources/output/build/wpa_supplicant-2.10/wpa_=
supplicant/libwpa_client.so /root/raspcm4/sources/output/host/aarch64-build=
root-linux-gnu/sysroot/usr/lib/libwpa_client.so<br>/usr/bin/install: cannot=
 stat &#39;/root/raspcm4/sources/output/build/wpa_supplicant-2.10/wpa_suppl=
icant/libwpa_client.so&#39;: No such file or directory<br>make[1]: *** [pac=
kage/<a href=3D"http://pkg-generic.mk:331">pkg-generic.mk:331</a>: /root/ra=
spcm4/sources/output/build/wpa_supplicant-2.10/.stamp_staging_installed] Er=
ror 1<br>make: *** [Makefile:23: _all] Error 2</div><div></div><div><br></d=
iv><div>Can you please let me know what could be the issue and how to resol=
ve it?</div><div><br></div><div>Thanks in advance<br></div><div><code><span=
 id=3D"gmail-LC1" class=3D"gmail-line" lang=3D"conf"><span class=3D"gmail-n=
"></span></span>
</code>

</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Thu, 10 Mar 2022 at 19:03, Jan Havran &lt;<a href=3D"mailto:havran=
.jan@email.cz">havran.jan@email.cz</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hi Sourabh,<br>
<br>
after enabling RPi firmware you must load the Wifi driver - since you are u=
sing<br>
systemd, it should by handled by udev on start I think.<br>
<br>
So you probably just need to configure /etc/network/interfaces to start wpa=
_supplicant<br>
on wlan0 with /etc/wpa_supplicant.conf file, where you can put your credent=
ials.<br>
Or at least that is what I have done, but I am not using systemd.<br>
<br>
I did something similar some time ago, you can check it here:<br>
<a href=3D"https://gitlab.com/sonicpp/gnss-pi/-/commit/caf0317c024e51fc7e32=
2deacd09ec9346d47e26" rel=3D"noreferrer" target=3D"_blank">https://gitlab.c=
om/sonicpp/gnss-pi/-/commit/caf0317c024e51fc7e322deacd09ec9346d47e26</a><br=
>
<br>
(note that to make &quot;my&quot; credentials public in that commit was an =
intention).<br>
<br>
P.S.: if you want to have any modifications to be part of your image with f=
ilesystem,<br>
you can do it by using rootfs overlays for example:<br>
<a href=3D"https://buildroot.org/downloads/manual/manual.html#rootfs-custom=
" rel=3D"noreferrer" target=3D"_blank">https://buildroot.org/downloads/manu=
al/manual.html#rootfs-custom</a><br>
<br>
Regards,<br>
<br>
Jan Havran<br>
<br>
V=C2=A0Thu, Mar 10, 2022 at 05:43:27PM +0100,=C2=A0Sourabh Hegde napsal(a):=
<br>
&gt; Hello All,<br>
&gt; <br>
&gt; I am trying to connect my Raspberry Pi CM4 to Wifi automatically after=
<br>
&gt; start-up. I am using Buildroot based Linux distribution. I have worked=
 with<br>
&gt; Yocto before and it provides systemd-networkd and wpa_supplicant featu=
re to<br>
&gt; connect to wifi on boot. I am lloking something similar in Buildroot b=
ut<br>
&gt; couldn&#39;t find any notes online.<br>
&gt; <br>
&gt; So far, I think I have enabled the necessary config/driver using &quot=
;make<br>
&gt; menuconfig&quot; :<br>
&gt; [image: wpa_supplicant.png]<br>
&gt; [image: firmware.png]<br>
&gt; <br>
&gt; But now, how can I set-up wpa_supplicant.conf? Any link to notes or<br=
>
&gt; suggestion would be helpful.<br>
&gt; <br>
&gt; Can anyone please let me know how to proceed further with it?<br>
&gt; <br>
&gt; Your help will be much appreciated.<br>
&gt; <br>
&gt; Thanks in advance.<br>
&gt; <br>
&gt; P.S: I am using Buildroot 2022.02 release and also using systemd featu=
re<br>
&gt; and let me know if any info is missing here.<br>
&gt; <br>
&gt; Regards,<br>
&gt; <br>
&gt; Sourabh<br>
<br>
<br>
<br>
<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
</blockquote></div>

--000000000000f35ade05da417290--

--000000000000f35adf05da417291
Content-Type: image/png; name="menuconfig.PNG"
Content-Disposition: inline; filename="menuconfig.PNG"
Content-Transfer-Encoding: base64
Content-ID: <ii_l0s58muc0>
X-Attachment-Id: ii_l0s58muc0

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
QmCC
--000000000000f35adf05da417291--

--===============5575067515055257937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5575067515055257937==--

