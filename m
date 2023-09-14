Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4783EEAA71
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84D0341904;
	Thu, 14 Sep 2023 21:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84D0341904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ieu4K5swTgf1; Thu, 14 Sep 2023 21:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B02B54185E;
	Thu, 14 Sep 2023 21:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B02B54185E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE8DA1BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87A684185E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87A684185E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMgnOftHYxh0 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:11:35 +0000 (UTC)
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C2924046F
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C2924046F
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1d598ba1b74so815043fac.0
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 14:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694725894; x=1695330694;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s/3ufY6kc3kLGx1HCFMmT/6LRIYZbHaoScUNBhH7lcg=;
 b=YOF2SmUkTD3AJshBNwMzyxN7kia7N7i644BLE5a+ti6X1Xm8Uu/4bC8XVZMvBmHY5b
 tyU8hQYfJKOt3l9UPp5p+l/6ECNO8QVXTe9E3fXUwkGAAigDbbwB5iy2cZr48WUn1dRS
 JJwdc4LDrOToOM+eUrQzovyDlEGJaCY280wOR+e2DAXalJ5Y0/ZEm90MY2X1Uz3nOixu
 6UtvaZnI0T3uutEl7G6iTOUoQQyPAdnJLWwS3SoSJ3xEYLxTSj5jnkA8fRd8lg8huj5Y
 f1F2kIfZcfUKBFXxJFPvsJJWJE8cci0eO4sGjGRCVLKwRmkdyXPJAdoh9DYkQyIIZgAp
 QDcg==
X-Gm-Message-State: AOJu0YwZK7g4ktKEa/N92uCTOSsecfNxFSZo6zyuKhCvmrED5ZiUctMX
 4bHu3q0rZVlzjEXYm11sDBDxjCrxvNrCLyKrxKPx93fo
X-Google-Smtp-Source: AGHT+IHwOIJpba0/sFfgV2/Z2owrfazc4KQl9dUibcqv9SQI5mGIfTaCpzseOaLZLVgQz5+QkY2YKlNkxJ0wpFw3d8M=
X-Received: by 2002:a05:6871:d10:b0:1d6:3b5f:3211 with SMTP id
 vh16-20020a0568710d1000b001d63b5f3211mr2108744oab.31.1694725894177; Thu, 14
 Sep 2023 14:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSs78_vitxWDHo=zDMC9MJyaW7zcaQhuJn2n3AmzkvtZjA@mail.gmail.com>
 <20230914151436.4c5e8073@windsurf>
 <CADYjeSuUpRDgDQt4PWKFF-gVxWBmb=xB4Aa_FrMsVyvbFzWnqg@mail.gmail.com>
 <20230914214733.5db06617@windsurf>
In-Reply-To: <20230914214733.5db06617@windsurf>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Thu, 14 Sep 2023 23:11:23 +0200
Message-ID: <CADYjeSufnw2-kfTDSdkiQRvHpmbmbiJEhttgb7uf4Z6xafYJeA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694725894; x=1695330694; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s/3ufY6kc3kLGx1HCFMmT/6LRIYZbHaoScUNBhH7lcg=;
 b=o5XZIusJEqTG1USSHGd/vqaOCRKXwZvHeqXGh8y/rwAHK9LoUABb6gHYgtK/q158qV
 nrGX+XL/Q0newcBsC+mshRovyV9O1Enf+ODr1Gdz1OSv2KJDqN8p+lAEPxkfbY5Ug3hQ
 L5YNGp/KyLWJZqpiHayVxHm9EKuAqT8FnQ9QS7DiRZ50jhDn/0yZGdklSxGh/UrJS2dl
 vbIexZRdav4uNgJ9xD3GPxFAoE+A48eFGFHOkkipgtpFFnz9PT+FuJsqhS/RQb8b9OU3
 2MHR6Fm28Umgfe1eB9Qdc3Kmo4NwMIbF8lWPwLhFlpH/xQnMvptrn6TYBgvudA+R/UD4
 PVwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=o5XZIusJ
Subject: Re: [Buildroot] Error linking against target architecture while
 building new package
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
Content-Type: multipart/mixed; boundary="===============7415122467277303282=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7415122467277303282==
Content-Type: multipart/alternative; boundary="000000000000ea0ad00605581ef5"

--000000000000ea0ad00605581ef5
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Thanks for the update.

Can you please let me know any packages that had similar issues? Maybe I
can use them as reference to properly set CFLAGS in the makefile or
environment of make...
This would be helpful.

On Thu, Sep 14, 2023, 21:47 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> On Thu, 14 Sep 2023 17:25:37 +0200
> Sourabh Hegde <hrsourabh011@gmail.com> wrote:
>
> > vsi_nn_daemon.c:25:10: fatal error: vsi_nn_daemon.h: No such file or
> > directory
> >    25 | #include "vsi_nn_daemon.h"
> >       |          ^~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[4]: ***
> > [/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/common.target:101:
> > bin_r/vsi_nn_daemon.o] Error 1
> > make[4]: *** Waiting for unfinished jobs....
> > vsi_nn_ops.c:25:10: fatal error: vsi_nn_ops.h: No such file or directory
> >    25 | #include "vsi_nn_ops.h"
> >       |          ^~~~~~~~~~~~~~
> > compilation terminated.
> > make[4]: ***
> > [/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/common.target:101:
> > bin_r/vsi_nn_ops.o] Error 1
> > vsi_nn_node_attr_template.c:26:10: fatal error: vsi_nn_node.h: No such
> file
> > or directory
> >    26 | #include "vsi_nn_node.h"
> >       |          ^~~~~~~~~~~~~~~
> > compilation terminated.
> >
> > However, "vsi_nn_daemon." header file is available in
> > /build/imx-nn-accelerator-lf-5.15.71-2.2.1/include/OVXLIB/vsi_nn_daemon.h
> > and
> > /build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/include/vsi_nn_daemon.h
> > Also as you can see in above log, LDFLAGS=""...
>
> If those headers are part of the imx-nn-accelerator code, it probably
> means that the fact we're passing CFLAGS="..." overrides some CFLAGS
> defined by the package Makefile, while it should append to the CFLAGS
> passed in the environment. Sometimes it requires tweaking the Makefile
> of the package, sometimes it means CFLAGS need to be passed in the
> environment of make (by Buildroot) instead of as argument:
>
>         $(TARGET_MAKE_ENV) \
>                 $(TARGET_CONFIGURE_OPTS) \
>                 ...
>                 $(MAKE) -C $(@D)
>
> This really requires a package-specific investigation.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000ea0ad00605581ef5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Thomas,</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks for the update.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Can you please let me know any packages that had similar issues? =
Maybe I can use them as reference to properly set CFLAGS in the makefile or=
 environment of make...</div><div dir=3D"auto">This would be helpful.<br><b=
r><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Sep 14, 2023, 21:47 Thomas Petazzoni &lt;<a href=3D"mailto:tho=
mas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Thu, 14 Sep 2023 17:25:37 +0200<br>
Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blan=
k" rel=3D"noreferrer">hrsourabh011@gmail.com</a>&gt; wrote:<br>
<br>
&gt; vsi_nn_daemon.c:25:10: fatal error: vsi_nn_daemon.h: No such file or<b=
r>
&gt; directory<br>
&gt;=C2=A0 =C2=A0 25 | #include &quot;vsi_nn_daemon.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~=
~~~~~~~~~<br>
&gt; compilation terminated.<br>
&gt; make[4]: ***<br>
&gt; [/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/common.target:101:<br>
&gt; bin_r/vsi_nn_daemon.o] Error 1<br>
&gt; make[4]: *** Waiting for unfinished jobs....<br>
&gt; vsi_nn_ops.c:25:10: fatal error: vsi_nn_ops.h: No such file or directo=
ry<br>
&gt;=C2=A0 =C2=A0 25 | #include &quot;vsi_nn_ops.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~=
~~~~~~<br>
&gt; compilation terminated.<br>
&gt; make[4]: ***<br>
&gt; [/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/common.target:101:<br>
&gt; bin_r/vsi_nn_ops.o] Error 1<br>
&gt; vsi_nn_node_attr_template.c:26:10: fatal error: vsi_nn_node.h: No such=
 file<br>
&gt; or directory<br>
&gt;=C2=A0 =C2=A0 26 | #include &quot;vsi_nn_node.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~=
~~~~~~~<br>
&gt; compilation terminated.<br>
&gt; <br>
&gt; However, &quot;vsi_nn_daemon.&quot; header file is available in<br>
&gt; /build/imx-nn-accelerator-lf-5.15.71-2.2.1/include/OVXLIB/vsi_nn_daemo=
n.h<br>
&gt; and<br>
&gt; /build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/include/vsi_nn_daemo=
n.h<br>
&gt; Also as you can see in above log, LDFLAGS=3D&quot;&quot;...<br>
<br>
If those headers are part of the imx-nn-accelerator code, it probably<br>
means that the fact we&#39;re passing CFLAGS=3D&quot;...&quot; overrides so=
me CFLAGS<br>
defined by the package Makefile, while it should append to the CFLAGS<br>
passed in the environment. Sometimes it requires tweaking the Makefile<br>
of the package, sometimes it means CFLAGS need to be passed in the<br>
environment of make (by Buildroot) instead of as argument:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_MAKE_ENV) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_CONFIGURE_=
OPTS) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE) -C $(@D)<br=
>
<br>
This really requires a package-specific investigation.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--000000000000ea0ad00605581ef5--

--===============7415122467277303282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7415122467277303282==--
