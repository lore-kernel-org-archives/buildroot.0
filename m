Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56458C43217
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0527940635;
	Mon,  7 Nov 2022 22:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0527940635
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1Lvh15jPWp0; Mon,  7 Nov 2022 22:36:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F13474031F;
	Mon,  7 Nov 2022 22:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F13474031F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6AE1BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24ADC81336
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24ADC81336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVPG7nZnPUgl for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:35:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF4F381331
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF4F381331
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:35:57 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id d20so18473840ljc.12
 for <buildroot@buildroot.org>; Mon, 07 Nov 2022 14:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ovDrgtEfOjD48rqi8P3Rmo+VKXitzL5M3YVoNFHjr74=;
 b=Il7ciyM4+kjRCpLNBBM6oDAEJASE4NjxOXjnGqEWmm9xle2WGNsktqMx3OuVldKdDW
 VuvJTkwPsva+9kuHmOhvbDpoxBw7Q/j2w7m+h6qT5ulp3JNbdxy5AVjdGqiOEG9Tc/gD
 p+nwDdGvXRcUDOo9faz07MTh5fdHn+Dg38iRbESMb8XrmQ2d5gAO59+Eib5q+GCc9XAY
 vHlQuVjlKKkXVHp1mOQXjyyWcnDHq7CHNL9WlJs1vMYOM8B9/SykqLhlYYNZtryPWEEK
 +/MNU8Oveu0kBfIBWTRvN3mvaCbTgnGN55e30l0IB/WnCC7KO/ocmPB/eaG2ugYB2VRU
 DiNw==
X-Gm-Message-State: ACrzQf0nw4hQrkNq6GcjjE4WpWReV47xuzSHcTR6YmWTvN6UGRSWc7e1
 PniZrOZL21xGHCe6L3oo0rFHkdEBGzJ90VCCDg4=
X-Google-Smtp-Source: AMsMyM4QbBPuyiqVO9okx/PMxIDZTlrw2xbZgTB0cp8GRJqqAPovkjf00D7mLQZVGzzhWskLYaLefOGWoW2DHAPU9NE=
X-Received: by 2002:a2e:8ed2:0:b0:26c:5cf3:cc89 with SMTP id
 e18-20020a2e8ed2000000b0026c5cf3cc89mr6141933ljl.483.1667860555622; Mon, 07
 Nov 2022 14:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20221106222042.648813-1-fontaine.fabrice@gmail.com>
 <20221107230925.73bb92d9@windsurf>
In-Reply-To: <20221107230925.73bb92d9@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 7 Nov 2022 23:35:43 +0100
Message-ID: <CAPi7W83h9UyvLgf834At4_wxUXq7xXyYxyDVXcz0=T_9caJRZw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ovDrgtEfOjD48rqi8P3Rmo+VKXitzL5M3YVoNFHjr74=;
 b=ISwVLbvN+XNjUjO7eaoKvci8A9c+y1vMvPBxSu1Un483SVjw+KxMRhmb7LS/GIiEpO
 0SITJeLGhuSLfU6PTTURDKVOX4yk5c1wA4FF5+IvG+lDWaRzSFa42C29Y8M/Ow7geSqz
 ZSQn+D4aUntxCE1DYnfETCE1TmPRLVdt7DLWy6H5DlkPomQTVGDlKabQpgIGIzH4yP6c
 +OhY4F98x5DQE7JG0yNuMw47LjlUV+KUWAiAgGJttQq0NP/9vUl+BJ5hI7laz/Br0ZlP
 58HoA3ThMcMTe+s3NLtTrbLnjhRQwp8QOrBlzXmDr4uB080RUbPLmxnS6rHnLJe5H6Km
 lRng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ISwVLbvN
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: fix static build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7989236035914716658=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7989236035914716658==
Content-Type: multipart/alternative; boundary="000000000000f3ede005ece90b25"

--000000000000f3ede005ece90b25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 7 nov. 2022 =C3=A0 23:09, Thomas Petazzoni <thomas.petazzoni@bootli=
n.com>
a =C3=A9crit :

> On Sun,  6 Nov 2022 23:20:42 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Pass TARGET_LDFLAGS (which contains -static) to fix the following stati=
c
> > build failures with gpio, iio and pci:
> >
> >   LINK     lsgpio
> >
> /home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/arm-buildroot-=
linux-musleabi/10.4.0/../../../../arm-buildroot-linux-musleabi/bin/ld:
> /home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/arm-buildroot-=
linux-musleabi/10.4.0/libgcc.a(_dvmd_lnx.o):
> in function `__aeabi_ldiv0':
> >
> /home/autobuild/autobuild/instance-8/output-1/build/host-gcc-final-10.4.0=
/build/arm-buildroot-linux-musleabi/libgcc/../../../libgcc/config/arm/lib1f=
uncs.S:1499:
> undefined reference to `raise'
> >
> > [...]
> >
> >   LINK    iio_event_monitor
> >
> /home/thomas/autobuild/instance-2/output-1/host/lib/gcc/microblazeel-buil=
droot-linux-musl/11.3.0/../../../../microblazeel-buildroot-linux-musl/bin/l=
d:
> /home/thomas/autobuild/instance-2/output-1/host/lib/gcc/microblazeel-buil=
droot-linux-musl/11.3.0/libgcc.a(unwind-dw2.o):
> in function `size_of_encoded_value':
> >
> /home/thomas/autobuild/instance-2/output-1/build/host-gcc-final-11.3.0/bu=
ild/microblazeel-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:88=
:
> undefined reference to `abort'
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/f202eb843ef331939f5f12325bdbf2d0d6=
64a7ce
> >  -
> http://autobuild.buildroot.org/results/504ec8be1ebd15c5da09f8b90bb723a58d=
4c58c5
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/linux-tools/linux-tool-gpio.mk.in | 2 +-
> >  package/linux-tools/linux-tool-iio.mk.in  | 2 +-
> >  package/linux-tools/linux-tool-pci.mk.in  | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
>
> Applied to master, thanks. However, aren't some of the other
> linux-tools also affected by a similar issue (tmon, cpupower, etc.) ?
>

Nope, tmon was already fixed in commit
2cbcdbf0add46da55020eb56b5e4b974b44e958b.
The other ones can't be built statically.


> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

Best Regards,

Fabrice

--000000000000f3ede005ece90b25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 7 nov. 2022 =C3=A0=C2=A0=
23:09, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com"=
>thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Sun,=C2=A0 6 Nov 2022 23:20:42=
 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Pass TARGET_LDFLAGS (which contains -static) to fix the following stat=
ic<br>
&gt; build failures with gpio, iio and pci:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0LINK=C2=A0 =C2=A0 =C2=A0lsgpio<br>
&gt; /home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/arm-buildro=
ot-linux-musleabi/10.4.0/../../../../arm-buildroot-linux-musleabi/bin/ld: /=
home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/arm-buildroot-lin=
ux-musleabi/10.4.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0&#39;:<=
br>
&gt; /home/autobuild/autobuild/instance-8/output-1/build/host-gcc-final-10.=
4.0/build/arm-buildroot-linux-musleabi/libgcc/../../../libgcc/config/arm/li=
b1funcs.S:1499: undefined reference to `raise&#39;<br>
&gt; <br>
&gt; [...]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0LINK=C2=A0 =C2=A0 iio_event_monitor<br>
&gt; /home/thomas/autobuild/instance-2/output-1/host/lib/gcc/microblazeel-b=
uildroot-linux-musl/11.3.0/../../../../microblazeel-buildroot-linux-musl/bi=
n/ld: /home/thomas/autobuild/instance-2/output-1/host/lib/gcc/microblazeel-=
buildroot-linux-musl/11.3.0/libgcc.a(unwind-dw2.o): in function `size_of_en=
coded_value&#39;:<br>
&gt; /home/thomas/autobuild/instance-2/output-1/build/host-gcc-final-11.3.0=
/build/microblazeel-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h=
:88: undefined reference to `abort&#39;<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/f202eb843ef3=
31939f5f12325bdbf2d0d664a7ce" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/f202eb843ef331939f5f12325bdbf2d0d664a7ce</a>=
<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/504ec8be1ebd=
15c5da09f8b90bb723a58d4c58c5" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/504ec8be1ebd15c5da09f8b90bb723a58d4c58c5</a>=
<br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/linux-tools/<a href=3D"http://linux-tool-gpio.mk.in" rel=
=3D"noreferrer" target=3D"_blank">linux-tool-gpio.mk.in</a> | 2 +-<br>
&gt;=C2=A0 package/linux-tools/<a href=3D"http://linux-tool-iio.mk.in" rel=
=3D"noreferrer" target=3D"_blank">linux-tool-iio.mk.in</a>=C2=A0 | 2 +-<br>
&gt;=C2=A0 package/linux-tools/<a href=3D"http://linux-tool-pci.mk.in" rel=
=3D"noreferrer" target=3D"_blank">linux-tool-pci.mk.in</a>=C2=A0 | 2 +-<br>
&gt;=C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
Applied to master, thanks. However, aren&#39;t some of the other<br>
linux-tools also affected by a similar issue (tmon, cpupower, etc.) ?<br></=
blockquote><div>=C2=A0</div><div>Nope, tmon was already fixed in commit 2cb=
cdbf0add46da55020eb56b5e4b974b44e958b.</div><div>The other ones can&#39;t b=
e built statically.</div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Best Regards,</div><d=
iv><br></div><div>Fabrice <br></div></div></div>

--000000000000f3ede005ece90b25--

--===============7989236035914716658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7989236035914716658==--
