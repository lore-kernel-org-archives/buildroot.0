Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DC0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 22:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07F8084133;
	Wed, 16 Mar 2022 22:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id is7r2wjkC2Fw; Wed, 16 Mar 2022 22:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0832832C7;
	Wed, 16 Mar 2022 22:25:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD9261BF3DB
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AADC640018
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eI8znN0zj9CB for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 22:25:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0011A400EF
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 22:25:16 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id w7so4059111ioj.5
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 15:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x1NokEjQZcxHXVcK1dv18Da+YiYfdrDfDLi+q595GiU=;
 b=BqWZdcLsW6RFARr8Us6tIim0tQuazB4di+FoKG8SNarrTU5DN2E02GdaBjvNSTAnuW
 ZLhRDr2Q+YWd925wC+ku0xbaY9g4wbbulGGMV1XJ3cKyB0i7oc2EHLNQhc6/cFjnlwmL
 0JcFSlmi6eQoM4fn5jJeO7ElnM5qQBsj/h+UpUWNm5iKBpodPwhE19aK6+aTWI6evXEG
 DjEHSA+1fehoLANwJkfLmqhQcF67a7f9nw+V6Nph+BlYHt/vGZMORKQwVCX5enc29ph6
 2/MigNrKELBciAAgHykaTspN4dNJZ+GMbIgt/vVOQLmxSkBEMHeUrpnZ8BeVjI0k8Os4
 ck2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x1NokEjQZcxHXVcK1dv18Da+YiYfdrDfDLi+q595GiU=;
 b=Ww5xLubzG+j8oaPCAPCUp7MuXmKEGKUiiBxp9hogMrZlNqHVjMwrHKEkpk3QpQXQoM
 TMWps3CFNM0f9j+tvIt9JmymeIN0HRvm3a2a2D3bv0sx+sltRkBThOrzQEFoENOvZX54
 Csd8HjjbkSi4E8R0mlBaaj80Jupp345WX5TDanmWFqApxjKDasGRo7+3itwC6Bcib2Ss
 JPZGgoGBJu5gxkz2mY/+ekdpPaik5BKz3nvpXlhGa39wcitTYSsqbmy4Txu2te2iReTq
 FWkmJiJYsrLrnkccXKWGcu6cjBg9TkiHD+HPa/RLoUe4YVY37AnpCUFIA5OxeLhg0AWC
 j7/w==
X-Gm-Message-State: AOAM5329SE+rr1ooxjD7XeN6I1kfJxx5unLWbI4S116L8b65l08S260X
 Rv6ohwgMk895zc7dLPSGP4EQ+h8DNhiEkjU2sMc=
X-Google-Smtp-Source: ABdhPJw2BAVreIN70+HAAVZaGj/WSqPQ20n7t3n+IiwXox8h7oCDhTK4Bz8ZQTc1p72TH/yePpoKVkqvpky7kA3RvHQ=
X-Received: by 2002:a05:6638:16d4:b0:31a:210e:223 with SMTP id
 g20-20020a05663816d400b0031a210e0223mr694654jat.196.1647469515208; Wed, 16
 Mar 2022 15:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSsCzsQbWw25kghn49m6vZ9XBMi5NQfBHhTh5X6E3z=JFg@mail.gmail.com>
 <CADYjeStJRry=ed46Km6nsaFk+wtbaxs0bLDfiPmtJ7xwZs2UwA@mail.gmail.com>
 <Yio9dHRYViMb7+iG@arch-zen.localdomain>
 <CADYjeSvNBqiYOuQrxdpQF_9t0w+4pf6B4d-Ufs5xAkkgCZGfFA@mail.gmail.com>
 <dc6491aa-fac9-75cb-2a3e-e4b847c496ae@mind.be>
 <20220315213347.09ddc034@gmx.net>
In-Reply-To: <20220315213347.09ddc034@gmx.net>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Wed, 16 Mar 2022 23:25:04 +0100
Message-ID: <CADYjeSsSFA4RQR_Xn3M4Y-ww4ecWUwUqaSj4Zm+3aFJ3mpN9+Q@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
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
Cc: Jan Havran <havran.jan@email.cz>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5388737679385014639=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5388737679385014639==
Content-Type: multipart/alternative; boundary="0000000000003b79e805da5d63c5"

--0000000000003b79e805da5d63c5
Content-Type: text/plain; charset="UTF-8"

Hello Peter,

In my local Buildroot package folder I don't have
"0001-build-re-enable-options-for-libwpa_client.so-and-.patch"
file.
Can you please let me know how to include this file? This is my first time
applying patches in Buildroot. I have downloaded patch file(tar.bz2). I
assume copying patch file to wpa_supplicant dir and running "make clean &&
make" will apply this patch. Please correct me if I am wrong.

And also I tried below to assign IP address to my board (RPi CM4)

wpa_supplicant -B -Dnl80211 -iwlan0 -cwpa_supplicant.conf
udhcpc -i wlan0

But this gives:

udhcpc: started, v1.35.0
udhcpc: broadcasting discover
udhcpc: broadcasting discover
udhcpc: broadcasting discover
udhcpc: broadcasting discover
.
.
.
Is there any other way to assign IP address to the board?

Your help will be much appreciated.

Thanks in advance

On Tue, 15 Mar 2022 at 21:33, Peter Seiderer <ps.report@gmx.net> wrote:

> On Tue, 15 Mar 2022 21:00:54 +0100, Arnout Vandecappelle <arnout@mind.be>
> wrote:
>
> > On 15/03/2022 14:05, Sourabh Hegde wrote:
> > > Helllo Jan,
> > >
> > > Thanks for the answer.
> > >
> > >  From Buildroot 2021 release "ctrl_interface" is disabled and so I
> have
> >
> >   It's disabled unless BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=y
> >
> > > commented out below line in etc/wpa_supplicant.conf file
> > >
> > > # |ctrl_interface=/var/run/wpa_supplicant|
> >
> >   This shouldn't be needed. AFAIK wpa_supplicant ignores the option if
> > CTRL_IFACE is not enabled.
> >
> > > |
> > > |
> > > |And also in my rootfs, there is no "|/var/run/wpa_supplicant|" file.
> >
> >   The file (actually, named pipe) is created when wpa_supplicants starts
> up.
> > /var/run is a tmpfs so it can only be created at runtime.
> >
> > > |
> > > |
> > > |
> > > |I have set below options in menuconfig|
> > > |
> > > |
> > > menuconfig.PNG
> > >
> > > Then doing make clean & make results in below errors:
> > >
> > >  >>> wpa_supplicant 2.10 Installing to staging directory
> > > /usr/bin/install -m 0644 -D
> > >
> /root/raspcm4/sources/output/build/wpa_supplicant-2.10/wpa_supplicant/libwpa_client.so
>
> > >
> /root/raspcm4/sources/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libwpa_client.so
> > > /usr/bin/install: cannot stat
> > >
> '/root/raspcm4/sources/output/build/wpa_supplicant-2.10/wpa_supplicant/libwpa_client.so':
>
> > > No such file or directory
> > > make[1]: *** [package/pkg-generic.mk:331 <http://pkg-generic.mk:331>:
> > >
> /root/raspcm4/sources/output/build/wpa_supplicant-2.10/.stamp_staging_installed]
>
> > > Error 1
> > > make: *** [Makefile:23: _all] Error 2
> > >
> > > Can you please let me know what could be the issue and how to resolve
> it?
> >
> >   I've tried to build the same configuration (with current git master)
> and it
> > builds without problems.
>
> Problem introduced on buildroot git master with wpa_supplicant version
> bump [1] and
> fixed with [2]...
>
> Regards,
> Peter
>
> [1]
> https://git.buildroot.net/buildroot/commit/package/wpa_supplicant?id=39381a467cd2cfc15f77d3f9adbf329d2f92e312
> [2]
> https://git.buildroot.net/buildroot/commit/package/wpa_supplicant?id=c4eebf191c781a3ea6b5eb1811cc17ae92ea2fb2
>
> >
> >   Please supply the defconfig and also the full build log (by uploading
> to a
> > pastebin).
> >
> >   Regards,
> >   Arnout
> >
> >
> > >
> > > Thanks in advance
> > > ||
> > >
> > > On Thu, 10 Mar 2022 at 19:03, Jan Havran <havran.jan@email.cz
> > > <mailto:havran.jan@email.cz>> wrote:
> > >
> > >     Hi Sourabh,
> > >
> > >     after enabling RPi firmware you must load the Wifi driver - since
> you are using
> > >     systemd, it should by handled by udev on start I think.
> > >
> > >     So you probably just need to configure /etc/network/interfaces to
> start
> > >     wpa_supplicant
> > >     on wlan0 with /etc/wpa_supplicant.conf file, where you can put
> your credentials.
> > >     Or at least that is what I have done, but I am not using systemd.
> > >
> > >     I did something similar some time ago, you can check it here:
> > >
> https://gitlab.com/sonicpp/gnss-pi/-/commit/caf0317c024e51fc7e322deacd09ec9346d47e26
> > >     <
> https://gitlab.com/sonicpp/gnss-pi/-/commit/caf0317c024e51fc7e322deacd09ec9346d47e26
> >
> > >
> > >     (note that to make "my" credentials public in that commit was an
> intention).
> > >
> > >     P.S.: if you want to have any modifications to be part of your
> image with
> > >     filesystem,
> > >     you can do it by using rootfs overlays for example:
> > >     https://buildroot.org/downloads/manual/manual.html#rootfs-custom
> > >     <https://buildroot.org/downloads/manual/manual.html#rootfs-custom>
> > >
> > >     Regards,
> > >
> > >     Jan Havran
> > >
> > >     V Thu, Mar 10, 2022 at 05:43:27PM +0100, Sourabh Hegde napsal(a):
> > >      > Hello All,
> > >      >
> > >      > I am trying to connect my Raspberry Pi CM4 to Wifi
> automatically after
> > >      > start-up. I am using Buildroot based Linux distribution. I have
> worked with
> > >      > Yocto before and it provides systemd-networkd and
> wpa_supplicant feature to
> > >      > connect to wifi on boot. I am lloking something similar in
> Buildroot but
> > >      > couldn't find any notes online.
> > >      >
> > >      > So far, I think I have enabled the necessary config/driver
> using "make
> > >      > menuconfig" :
> > >      > [image: wpa_supplicant.png]
> > >      > [image: firmware.png]
> > >      >
> > >      > But now, how can I set-up wpa_supplicant.conf? Any link to
> notes or
> > >      > suggestion would be helpful.
> > >      >
> > >      > Can anyone please let me know how to proceed further with it?
> > >      >
> > >      > Your help will be much appreciated.
> > >      >
> > >      > Thanks in advance.
> > >      >
> > >      > P.S: I am using Buildroot 2022.02 release and also using
> systemd feature
> > >      > and let me know if any info is missing here.
> > >      >
> > >      > Regards,
> > >      >
> > >      > Sourabh
> > >
> > >
> > >
> > >
> > >      > _______________________________________________
> > >      > buildroot mailing list
> > >      > buildroot@buildroot.org <mailto:buildroot@buildroot.org>
> > >      > https://lists.buildroot.org/mailman/listinfo/buildroot
> > >     <https://lists.buildroot.org/mailman/listinfo/buildroot>
> > >
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--0000000000003b79e805da5d63c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Peter,<div><br></div><div>In my local Buildroot pack=
age folder I don&#39;t=C2=A0have &quot;<span style=3D"color:rgb(0,0,0);font=
-family:monospace;font-size:13.3333px;font-weight:700;white-space:pre">0001=
-build-re-enable-options-for-libwpa_client.so-and-.patch&quot; </span><span=
 style=3D"color:rgb(0,0,0);font-family:monospace;font-size:13.3333px;white-=
space:pre">file.</span></div><div>Can you please let me know how to include=
 this file? This is my first time applying patches in Buildroot. I have dow=
nloaded patch file(tar.bz2). I assume copying patch file to wpa_supplicant =
dir and running &quot;make clean &amp;&amp; make&quot; will apply this patc=
h. Please correct me if I am wrong.</div><div><br></div><div>And also I tri=
ed below to assign IP address to my board (RPi CM4)</div><div><br></div><di=
v>wpa_supplicant -B -Dnl80211 -iwlan0 -cwpa_supplicant.conf</div><div>udhcp=
c -i wlan0</div><div><br></div><div>But this gives:</div><div><br></div>udh=
cpc: started, v1.35.0<br>udhcpc: broadcasting discover<br>udhcpc: broadcast=
ing discover<br>udhcpc: broadcasting discover<br>udhcpc: broadcasting disco=
ver<br><div>.</div><div>.</div><div>.</div><div>Is there any other way to a=
ssign IP address to the board?=C2=A0</div><div><br></div><div>Your help wil=
l be much appreciated.</div><div><br></div><div>Thanks in advance</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, 15 Mar 2022 at 21:33, Peter Seiderer &lt;<a href=3D"mailto:ps.report@gm=
x.net">ps.report@gmx.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Tue, 15 Mar 2022 21:00:54 +0100, Arnout Vandecap=
pelle &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.b=
e</a>&gt; wrote:<br>
<br>
&gt; On 15/03/2022 14:05, Sourabh Hegde wrote:<br>
&gt; &gt; Helllo Jan,<br>
&gt; &gt; <br>
&gt; &gt; Thanks for the answer.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 From Buildroot 2021 release &quot;ctrl_interface&quot; is d=
isabled and so I have=C2=A0 =C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0It&#39;s disabled unless BR2_PACKAGE_WPA_SUPPLICANT_CTRL_I=
FACE=3Dy<br>
&gt; <br>
&gt; &gt; commented out below line in etc/wpa_supplicant.conf file<br>
&gt; &gt; <br>
&gt; &gt; # |ctrl_interface=3D/var/run/wpa_supplicant|=C2=A0 <br>
&gt; <br>
&gt;=C2=A0 =C2=A0This shouldn&#39;t be needed. AFAIK wpa_supplicant ignores=
 the option if <br>
&gt; CTRL_IFACE is not enabled.<br>
&gt; <br>
&gt; &gt; |<br>
&gt; &gt; |<br>
&gt; &gt; |And also in my rootfs, there is no &quot;|/var/run/wpa_supplican=
t|&quot; file.=C2=A0 <br>
&gt; <br>
&gt;=C2=A0 =C2=A0The file (actually, named pipe) is created when wpa_suppli=
cants starts up. <br>
&gt; /var/run is a tmpfs so it can only be created at runtime.<br>
&gt; <br>
&gt; &gt; |<br>
&gt; &gt; |<br>
&gt; &gt; |<br>
&gt; &gt; |I have set below options in menuconfig|<br>
&gt; &gt; |<br>
&gt; &gt; |<br>
&gt; &gt; menuconfig.PNG<br>
&gt; &gt; <br>
&gt; &gt; Then doing make clean &amp; make results in below errors:<br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 &gt;&gt;&gt; wpa_supplicant 2.10 Installing to staging dire=
ctory=C2=A0 <br>
&gt; &gt; /usr/bin/install -m 0644 -D <br>
&gt; &gt; /root/raspcm4/sources/output/build/wpa_supplicant-2.10/wpa_suppli=
cant/libwpa_client.so <br>
&gt; &gt; /root/raspcm4/sources/output/host/aarch64-buildroot-linux-gnu/sys=
root/usr/lib/libwpa_client.so<br>
&gt; &gt; /usr/bin/install: cannot stat <br>
&gt; &gt; &#39;/root/raspcm4/sources/output/build/wpa_supplicant-2.10/wpa_s=
upplicant/libwpa_client.so&#39;: <br>
&gt; &gt; No such file or directory<br>
&gt; &gt; make[1]: *** [package/<a href=3D"http://pkg-generic.mk:331" rel=
=3D"noreferrer" target=3D"_blank">pkg-generic.mk:331</a> &lt;<a href=3D"htt=
p://pkg-generic.mk:331" rel=3D"noreferrer" target=3D"_blank">http://pkg-gen=
eric.mk:331</a>&gt;: <br>
&gt; &gt; /root/raspcm4/sources/output/build/wpa_supplicant-2.10/.stamp_sta=
ging_installed] <br>
&gt; &gt; Error 1<br>
&gt; &gt; make: *** [Makefile:23: _all] Error 2<br>
&gt; &gt; <br>
&gt; &gt; Can you please let me know what could be the issue and how to res=
olve it?=C2=A0 <br>
&gt; <br>
&gt;=C2=A0 =C2=A0I&#39;ve tried to build the same configuration (with curre=
nt git master) and it <br>
&gt; builds without problems.<br>
<br>
Problem introduced on buildroot git master with wpa_supplicant version bump=
 [1] and<br>
fixed with [2]...<br>
<br>
Regards,<br>
Peter<br>
<br>
[1] <a href=3D"https://git.buildroot.net/buildroot/commit/package/wpa_suppl=
icant?id=3D39381a467cd2cfc15f77d3f9adbf329d2f92e312" rel=3D"noreferrer" tar=
get=3D"_blank">https://git.buildroot.net/buildroot/commit/package/wpa_suppl=
icant?id=3D39381a467cd2cfc15f77d3f9adbf329d2f92e312</a><br>
[2] <a href=3D"https://git.buildroot.net/buildroot/commit/package/wpa_suppl=
icant?id=3Dc4eebf191c781a3ea6b5eb1811cc17ae92ea2fb2" rel=3D"noreferrer" tar=
get=3D"_blank">https://git.buildroot.net/buildroot/commit/package/wpa_suppl=
icant?id=3Dc4eebf191c781a3ea6b5eb1811cc17ae92ea2fb2</a><br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Please supply the defconfig and also the full build log (b=
y uploading to a <br>
&gt; pastebin).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0Arnout<br>
&gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Thanks in advance<br>
&gt; &gt; ||<br>
&gt; &gt; <br>
&gt; &gt; On Thu, 10 Mar 2022 at 19:03, Jan Havran &lt;<a href=3D"mailto:ha=
vran.jan@email.cz" target=3D"_blank">havran.jan@email.cz</a> <br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:havran.jan@email.cz" target=3D"_blan=
k">havran.jan@email.cz</a>&gt;&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Hi Sourabh,<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0after enabling RPi firmware you must load the =
Wifi driver - since you are using<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0systemd, it should by handled by udev on start=
 I think.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0So you probably just need to configure /etc/ne=
twork/interfaces to start<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0wpa_supplicant<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0on wlan0 with /etc/wpa_supplicant.conf file, w=
here you can put your credentials.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Or at least that is what I have done, but I am=
 not using systemd.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0I did something similar some time ago, you can=
 check it here:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.com/sonicpp/gnss-pi/=
-/commit/caf0317c024e51fc7e322deacd09ec9346d47e26" rel=3D"noreferrer" targe=
t=3D"_blank">https://gitlab.com/sonicpp/gnss-pi/-/commit/caf0317c024e51fc7e=
322deacd09ec9346d47e26</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.com/sonicpp/gnss=
-pi/-/commit/caf0317c024e51fc7e322deacd09ec9346d47e26" rel=3D"noreferrer" t=
arget=3D"_blank">https://gitlab.com/sonicpp/gnss-pi/-/commit/caf0317c024e51=
fc7e322deacd09ec9346d47e26</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0(note that to make &quot;my&quot; credentials =
public in that commit was an intention).<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0P.S.: if you want to have any modifications to=
 be part of your image with<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0filesystem,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0you can do it by using rootfs overlays for exa=
mple:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://buildroot.org/downloads/man=
ual/manual.html#rootfs-custom" rel=3D"noreferrer" target=3D"_blank">https:/=
/buildroot.org/downloads/manual/manual.html#rootfs-custom</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://buildroot.org/downloads=
/manual/manual.html#rootfs-custom" rel=3D"noreferrer" target=3D"_blank">htt=
ps://buildroot.org/downloads/manual/manual.html#rootfs-custom</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Jan Havran<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0V=C2=A0Thu, Mar 10, 2022 at 05:43:27PM +0100,=
=C2=A0Sourabh Hegde napsal(a):=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hello All,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; I am trying to connect my Raspberry Pi C=
M4 to Wifi automatically after<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; start-up. I am using Buildroot based Lin=
ux distribution. I have worked with<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Yocto before and it provides systemd-net=
workd and wpa_supplicant feature to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; connect to wifi on boot. I am lloking so=
mething similar in Buildroot but<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; couldn&#39;t find any notes online.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; So far, I think I have enabled the neces=
sary config/driver using &quot;make<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; menuconfig&quot; :<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; [image: wpa_supplicant.png]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; [image: firmware.png]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; But now, how can I set-up wpa_supplicant=
.conf? Any link to notes or<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; suggestion would be helpful.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Can anyone please let me know how to pro=
ceed further with it?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Your help will be much appreciated.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thanks in advance.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; P.S: I am using Buildroot 2022.02 releas=
e and also using systemd feature<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; and let me know if any info is missing h=
ere.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Regards,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Sourabh=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ________________________________________=
_______<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; buildroot mailing list<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"mailto:buildroot@buildroot.or=
g" target=3D"_blank">buildroot@buildroot.org</a> &lt;mailto:<a href=3D"mail=
to:buildroot@buildroot.org" target=3D"_blank">buildroot@buildroot.org</a>&g=
t;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"https://lists.buildroot.org/m=
ailman/listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.buildroot.org/mailman/listinfo/buildroot</a>=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.buildroot.org/mai=
lman/listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists=
.buildroot.org/mailman/listinfo/buildroot</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; buildroot mailing list<br>
&gt; &gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buil=
droot@buildroot.org</a><br>
&gt; &gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot=
" rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/=
listinfo/buildroot</a>=C2=A0 <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
</blockquote></div>

--0000000000003b79e805da5d63c5--

--===============5388737679385014639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5388737679385014639==--
