Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD877C4332F
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 20:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66ABA40255;
	Mon, 11 Dec 2023 20:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66ABA40255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1qG0PSq4sOU; Mon, 11 Dec 2023 20:29:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1642540278;
	Mon, 11 Dec 2023 20:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1642540278
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E02D1BF41C
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 20:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31C8E41A3D
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 20:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31C8E41A3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wbt-zO9jK0Up for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 20:29:12 +0000 (UTC)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A19441A3A
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 20:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A19441A3A
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5c21e185df5so4098051a12.1
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 12:29:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702326551; x=1702931351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Sv7z7TN5QTjmgUWds/3uVeJ7fIu0X0BGiqT9BaKc7E=;
 b=Xi9jT4JQWRYZiTgyM28NcgPovyC2uTuUNlQ2CFH1hIlJmMBr3j6cXvIuSC8pDazFQY
 Y/UrJGboDlsLFVBsJ0j88RbSGIOKrlPMdYLuOOE7pGyt3siVvJp+ec2tw/atbkTZ5F3T
 BbCYAnqNqkh4RH35l7vHGKdq9HJoyhoKcYWsTw3xOLYb48m1BYcSWj7xSdf+QoECRuIZ
 82X1YyhxKZrp7qEqeTYIkpXNM6/5WYd/Z5qokFtXAyoT1NuPxwC60Cgf3ocfWOEyVJ12
 DUNFQSAnTrsr8KTF9fJdNZBij4+DHkgSJbKqXl9cyv8CLSMkiO/yC0kJk+vSKlJpaQDZ
 kaQA==
X-Gm-Message-State: AOJu0YxoFyXAK/21CjY3C9xMT3yFwd7epjhcLK/2tLu9x1/qh6vXasnp
 GzPV7KgCtFXMwB4zdk98ay0m6oVWJynVsI+ovXXOjw==
X-Google-Smtp-Source: AGHT+IHoFQ2uWFYBHBRE0YJs+Qkl6iXQtX3OE5lcGotzurrM2rcLkhqzZ4TB8F8pR1UwvL96bgrVSWjyIQr5S2zLs1g=
X-Received: by 2002:a17:90b:10d:b0:286:97bf:d930 with SMTP id
 p13-20020a17090b010d00b0028697bfd930mr4235929pjz.8.1702326551107; Mon, 11 Dec
 2023 12:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
 <CAAE6iEVHsRZjeH8XeukovfafAq+HsCH+pC26kWOWWnBNVxgzjA@mail.gmail.com>
 <CABGWkvo1jo3YSsz8W__tvY5mV==_unc1Yk9DMO5qQJX-VJQmFw@mail.gmail.com>
In-Reply-To: <CABGWkvo1jo3YSsz8W__tvY5mV==_unc1Yk9DMO5qQJX-VJQmFw@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 11 Dec 2023 21:28:59 +0100
Message-ID: <CAAE6iEWRNmkKvSbRgM34M8rAsTK4+CUj+YV16nCi2FkpH=fbWA@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1702326551; x=1702931351; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/Sv7z7TN5QTjmgUWds/3uVeJ7fIu0X0BGiqT9BaKc7E=;
 b=WYoJNyD8u3WVNQFBAaTZSHbGObGFXAKqD9NaLDLrW7JusSOCuR/PauDWqWXz9VMy6F
 XCwPYyoYX1HO1vEZU7hitStMQ02auRXPY9PRCLPopJWR50DERTTUldeuxVkrqN79wIZP
 0gh5cMmjltbC7GbDHtukrAa/6ZuxYKzo6g58GN5kiLJec+FbPl0brtzAsH3FA6JMtnNz
 hDRSdmtKEbS/E+67wkKmoFTC0tjyhZvf1Tv3kfBOPb44tLnGIUuKyGnFPowgxGoTrwH8
 nITfgk9f9p16lxDwFMK+hoQTZtQh/UkqNAbIayZLlQVF9umEB+ii4JzvLn5hSr02MM/X
 +bKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=WYoJNyD8
Subject: Re: [Buildroot] [PATCH 00/11] Add support for AM62x-SK HS-FS devices
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: multipart/mixed; boundary="===============7322143153743452053=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7322143153743452053==
Content-Type: multipart/alternative; boundary="0000000000005fd4ab060c41c9c2"

--0000000000005fd4ab060c41c9c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 11 d=C3=A9c. 2023 =C3=A0 17:50, Dario Binacchi <
dario.binacchi@amarulasolutions.com> a =C3=A9crit :

> Hi Fran=C3=A7ois,
>
> On Sun, Dec 3, 2023 at 5:19=E2=80=AFPM Fran=C3=A7ois Perrad <francois.per=
rad@gadz.org>
> wrote:
> >
> >
> >
> > Le mer. 29 nov. 2023 =C3=A0 18:26, Dario Binacchi <
> dario.binacchi@amarulasolutions.com> a =C3=A9crit :
> >>
> >> The SK-AM62B-P1 is the newest version of SK-AM62which includes
> >> high-security field-securable (HS-FS) silicon to optionally customize
> keys
> >> and encryption for security applications.
> >> This requires enabling the BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
> option,
> >> which, however, was buggy. This series fixes the errors and bumps the
> Linux
> >> kernel and U-Boot required for such a new device.
> >>
> >> Dario Binacchi (11):
> >>   boot/ti-k3-core-secdev: new package
> >>   boot/ti-k3-image-gen: manage HS hardware
> >
> >
> > These two first patches are similar to this one: [v9,07/11]
> package/ti-core-secdev-k3: new package
> > see
> https://patchwork.ozlabs.org/project/buildroot/patch/20230622160212.20634=
72-8-dannenberg@ti.com/
> >
> Could you please be more explicit?
> I have read the link and have some doubts about how to proceed. The
> series you pointed out hasn't been
> merged, and several months have passed. It seems to me that it can no
> longer be merged because,in the
> meantime, a simpler series (it did not add ti-core-secdev-k3) has been
> accepted. Unlike the patch you
>  indicated, I have decided to add ti-core-secdev-k3 to u-boot, rather
> than the package directory, as nothing
>  is installed in the rootfs but only in the binary directory. I also
> believe, as requested by the review, that I have
>  kept the management of this package simple.
> What do you think?
>
>
previous works were partially merged (and not with the latest version)
and the support of these TI boards becomes a little mess.

so, thanks you for this series which goes ahead.

Fran=C3=A7ois


> Thanks and regards,
> Dario
>
> > Fran=C3=A7ois
> >
> >>
> >>   package/python-jsonschema: add host variant
> >>   package/python-attrs: add host variant
> >>   package/python-referencing: add host variant
> >>   package/python-rpds-py: add host variant
> >>   package/python-jsonschema-specifications: add host variant
> >>   boot/ti-k3-r5-loader: set binman environment variable
> >>   boot/uboot: set BINMAN_INDIRS for TI K3 DM
> >>   configs/ti_am62x_sk_defconfig: bump U-Boot version to 2023.10
> >>   configs/ti_am62x_sk_defconfig: bump Linux version to 6.6.1
> >>
> >>  DEVELOPERS                                    |  1 +
> >>  board/ti/am62x-sk/genimage.cfg                |  7 ++-
> >>  board/ti/am62x-sk/post-build.sh               | 49 ++++++++++++++++++=
+
> >>  board/ti/am62x-sk/post-image.sh               |  5 ++
> >>  boot/Config.in                                |  1 +
> >>  boot/ti-k3-core-secdev/Config.in              |  9 ++++
> >>  boot/ti-k3-core-secdev/ti-k3-core-secdev.hash |  3 ++
> >>  boot/ti-k3-core-secdev/ti-k3-core-secdev.mk   | 19 +++++++
> >>  boot/ti-k3-image-gen/Config.in                |  1 +
> >>  boot/ti-k3-image-gen/ti-k3-image-gen.mk       | 16 +++++-
> >>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       |  1 +
> >>  boot/uboot/uboot.mk                           |  3 +-
> >>  configs/ti_am62x_sk_defconfig                 | 20 ++++++--
> >>  package/Config.in.host                        |  5 ++
> >>  package/python-attrs/Config.in.host           |  8 +++
> >>  package/python-attrs/python-attrs.mk          |  6 +++
> >>  .../Config.in.host                            |  7 +++
> >>  .../python-jsonschema-specifications.mk       |  5 ++
> >>  package/python-jsonschema/Config.in.host      |  6 +++
> >>  .../python-jsonschema/python-jsonschema.mk    |  6 +++
> >>  package/python-referencing/Config.in.host     |  6 +++
> >>  .../python-referencing/python-referencing.mk  |  7 +++
> >>  package/python-rpds-py/Config.in.host         |  8 +++
> >>  package/python-rpds-py/python-rpds-py.mk      |  1 +
> >>  24 files changed, 192 insertions(+), 8 deletions(-)
> >>  create mode 100755 board/ti/am62x-sk/post-build.sh
> >>  create mode 100755 board/ti/am62x-sk/post-image.sh
> >>  create mode 100644 boot/ti-k3-core-secdev/Config.in
> >>  create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
> >>  create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
> >>  create mode 100644 package/python-attrs/Config.in.host
> >>  create mode 100644
> package/python-jsonschema-specifications/Config.in.host
> >>  create mode 100644 package/python-jsonschema/Config.in.host
> >>  create mode 100644 package/python-referencing/Config.in.host
> >>  create mode 100644 package/python-rpds-py/Config.in.host
> >>
> >> --
> >> 2.43.0
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot@buildroot.org
> >> https://lists.buildroot.org/mailman/listinfo/buildroot
>
>
>
> --
>
> Dario Binacchi
>
> Senior Embedded Linux Developer
>
> dario.binacchi@amarulasolutions.com
>
> __________________________________
>
>
> Amarula Solutions SRL
>
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
>
> T. +39 042 243 5310
> info@amarulasolutions.com
>
> www.amarulasolutions.com
>

--0000000000005fd4ab060c41c9c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 11 d=C3=A9c. 2023 =C3=A0=
=C2=A017:50, Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulasol=
utions.com">dario.binacchi@amarulasolutions.com</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Fran=C3=A7oi=
s,<br>
<br>
On Sun, Dec 3, 2023 at 5:19=E2=80=AFPM Fran=C3=A7ois Perrad &lt;<a href=3D"=
mailto:francois.perrad@gadz.org" target=3D"_blank">francois.perrad@gadz.org=
</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Le mer. 29 nov. 2023 =C3=A0 18:26, Dario Binacchi &lt;<a href=3D"mailt=
o:dario.binacchi@amarulasolutions.com" target=3D"_blank">dario.binacchi@ama=
rulasolutions.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt; The SK-AM62B-P1 is the newest version of SK-AM62which includes<br>
&gt;&gt; high-security field-securable (HS-FS) silicon to optionally custom=
ize keys<br>
&gt;&gt; and encryption for security applications.<br>
&gt;&gt; This requires enabling the BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_F=
S option,<br>
&gt;&gt; which, however, was buggy. This series fixes the errors and bumps =
the Linux<br>
&gt;&gt; kernel and U-Boot required for such a new device.<br>
&gt;&gt;<br>
&gt;&gt; Dario Binacchi (11):<br>
&gt;&gt;=C2=A0 =C2=A0boot/ti-k3-core-secdev: new package<br>
&gt;&gt;=C2=A0 =C2=A0boot/ti-k3-image-gen: manage HS hardware<br>
&gt;<br>
&gt;<br>
&gt; These two first patches are similar to this one: [v9,07/11] package/ti=
-core-secdev-k3: new package<br>
&gt; see <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20=
230622160212.2063472-8-dannenberg@ti.com/" rel=3D"noreferrer" target=3D"_bl=
ank">https://patchwork.ozlabs.org/project/buildroot/patch/20230622160212.20=
63472-8-dannenberg@ti.com/</a><br>
&gt;<br>
Could you please be more explicit?<br>
I have read the link and have some doubts about how to proceed. The<br>
series you pointed out hasn&#39;t been<br>
merged, and several months have passed. It seems to me that it can no<br>
longer be merged because,in the<br>
meantime, a simpler series (it did not add ti-core-secdev-k3) has been<br>
accepted. Unlike the patch you<br>
=C2=A0indicated, I have decided to add ti-core-secdev-k3 to u-boot, rather<=
br>
than the package directory, as nothing<br>
=C2=A0is installed in the rootfs but only in the binary directory. I also<b=
r>
believe, as requested by the review, that I have<br>
=C2=A0kept the management of this package simple.<br>
What do you think?<br>
<br></blockquote><div><br></div><div>previous works were partially merged (=
and not with the latest version)<br>and the support of these TI boards beco=
mes a little mess.<br><br>so, thanks you for this series which goes ahead.<=
/div><div><br></div><div>Fran=C3=A7ois<br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
Thanks and regards,<br>
Dario<br>
<br>
&gt; Fran=C3=A7ois<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0package/python-jsonschema: add host variant<br>
&gt;&gt;=C2=A0 =C2=A0package/python-attrs: add host variant<br>
&gt;&gt;=C2=A0 =C2=A0package/python-referencing: add host variant<br>
&gt;&gt;=C2=A0 =C2=A0package/python-rpds-py: add host variant<br>
&gt;&gt;=C2=A0 =C2=A0package/python-jsonschema-specifications: add host var=
iant<br>
&gt;&gt;=C2=A0 =C2=A0boot/ti-k3-r5-loader: set binman environment variable<=
br>
&gt;&gt;=C2=A0 =C2=A0boot/uboot: set BINMAN_INDIRS for TI K3 DM<br>
&gt;&gt;=C2=A0 =C2=A0configs/ti_am62x_sk_defconfig: bump U-Boot version to =
2023.10<br>
&gt;&gt;=C2=A0 =C2=A0configs/ti_am62x_sk_defconfig: bump Linux version to 6=
.6.1<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
&gt;&gt;=C2=A0 board/ti/am62x-sk/genimage.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 ++-<br>
&gt;&gt;=C2=A0 board/ti/am62x-sk/post-build.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 49 +++++++++++++++++++<br>
&gt;&gt;=C2=A0 board/ti/am62x-sk/post-image.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++<br>
&gt;&gt;=C2=A0 boot/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
&gt;&gt;=C2=A0 boot/ti-k3-core-secdev/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++++<br>
&gt;&gt;=C2=A0 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash |=C2=A0 3 ++<b=
r>
&gt;&gt;=C2=A0 boot/ti-k3-core-secdev/<a href=3D"http://ti-k3-core-secdev.m=
k" rel=3D"noreferrer" target=3D"_blank">ti-k3-core-secdev.mk</a>=C2=A0 =C2=
=A0| 19 +++++++<br>
&gt;&gt;=C2=A0 boot/ti-k3-image-gen/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;&gt;=C2=A0 boot/ti-k3-image-gen/<a href=3D"http://ti-k3-image-gen.mk" r=
el=3D"noreferrer" target=3D"_blank">ti-k3-image-gen.mk</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 16 +++++-<br>
&gt;&gt;=C2=A0 boot/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-loader.mk" r=
el=3D"noreferrer" target=3D"_blank">ti-k3-r5-loader.mk</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 1 +<br>
&gt;&gt;=C2=A0 boot/uboot/<a href=3D"http://uboot.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">uboot.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +-<br>
&gt;&gt;=C2=A0 configs/ti_am62x_sk_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++++++--<br>
&gt;&gt;=C2=A0 package/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++<br>
&gt;&gt;=C2=A0 package/python-attrs/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 8 +++<br>
&gt;&gt;=C2=A0 package/python-attrs/<a href=3D"http://python-attrs.mk" rel=
=3D"noreferrer" target=3D"_blank">python-attrs.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 6 +++<br>
&gt;&gt;=C2=A0 .../Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++<br>
&gt;&gt;=C2=A0 .../<a href=3D"http://python-jsonschema-specifications.mk" r=
el=3D"noreferrer" target=3D"_blank">python-jsonschema-specifications.mk</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++<br>
&gt;&gt;=C2=A0 package/python-jsonschema/Config.in.host=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 6 +++<br>
&gt;&gt;=C2=A0 .../python-jsonschema/<a href=3D"http://python-jsonschema.mk=
" rel=3D"noreferrer" target=3D"_blank">python-jsonschema.mk</a>=C2=A0 =C2=
=A0 |=C2=A0 6 +++<br>
&gt;&gt;=C2=A0 package/python-referencing/Config.in.host=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 6 +++<br>
&gt;&gt;=C2=A0 .../python-referencing/<a href=3D"http://python-referencing.=
mk" rel=3D"noreferrer" target=3D"_blank">python-referencing.mk</a>=C2=A0 |=
=C2=A0 7 +++<br>
&gt;&gt;=C2=A0 package/python-rpds-py/Config.in.host=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 8 +++<br>
&gt;&gt;=C2=A0 package/python-rpds-py/<a href=3D"http://python-rpds-py.mk" =
rel=3D"noreferrer" target=3D"_blank">python-rpds-py.mk</a>=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
&gt;&gt;=C2=A0 24 files changed, 192 insertions(+), 8 deletions(-)<br>
&gt;&gt;=C2=A0 create mode 100755 board/ti/am62x-sk/post-build.sh<br>
&gt;&gt;=C2=A0 create mode 100755 board/ti/am62x-sk/post-image.sh<br>
&gt;&gt;=C2=A0 create mode 100644 boot/ti-k3-core-secdev/Config.in<br>
&gt;&gt;=C2=A0 create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.=
hash<br>
&gt;&gt;=C2=A0 create mode 100644 boot/ti-k3-core-secdev/<a href=3D"http://=
ti-k3-core-secdev.mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-core-secde=
v.mk</a><br>
&gt;&gt;=C2=A0 create mode 100644 package/python-attrs/Config.in.host<br>
&gt;&gt;=C2=A0 create mode 100644 package/python-jsonschema-specifications/=
Config.in.host<br>
&gt;&gt;=C2=A0 create mode 100644 package/python-jsonschema/Config.in.host<=
br>
&gt;&gt;=C2=A0 create mode 100644 package/python-referencing/Config.in.host=
<br>
&gt;&gt;=C2=A0 create mode 100644 package/python-rpds-py/Config.in.host<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.43.0<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; buildroot mailing list<br>
&gt;&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">build=
root@buildroot.org</a><br>
&gt;&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/l=
istinfo/buildroot</a><br>
<br>
<br>
<br>
-- <br>
<br>
Dario Binacchi<br>
<br>
Senior Embedded Linux Developer<br>
<br>
<a href=3D"mailto:dario.binacchi@amarulasolutions.com" target=3D"_blank">da=
rio.binacchi@amarulasolutions.com</a><br>
<br>
__________________________________<br>
<br>
<br>
Amarula Solutions SRL<br>
<br>
Via Le Canevare 30, 31100 Treviso, Veneto, IT<br>
<br>
T. +39 042 243 5310<br>
<a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@amarula=
solutions.com</a><br>
<br>
<a href=3D"http://www.amarulasolutions.com" rel=3D"noreferrer" target=3D"_b=
lank">www.amarulasolutions.com</a><br>
</blockquote></div></div>

--0000000000005fd4ab060c41c9c2--

--===============7322143153743452053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7322143153743452053==--
