Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96742C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 19:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 196BA4017B;
	Wed,  3 Aug 2022 19:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 196BA4017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBdI2Pz0yNy8; Wed,  3 Aug 2022 19:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 278CA40156;
	Wed,  3 Aug 2022 19:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 278CA40156
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9831BF5DC
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7E3F812F6
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7E3F812F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIRFn72EzWIY for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 19:46:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07FA781298
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07FA781298
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 19:46:00 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso3070334pjo.1
 for <buildroot@busybox.net>; Wed, 03 Aug 2022 12:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lFHP6rvEAcNY9tPfTFAd5yKkC6dE9n4II2ZrKaf0U64=;
 b=UaciLtifFBDTAVaSYNQBbxWjePIR/xuSk8QD2sWPCa+xwAqP3OKGLtmBq5bFdMqHbI
 U4ZYpWA5PgaheQai537vOd4dBKk4/aR/zSiAZl0e2FaLoJVhp9JcOi5R6GmnVDzRZURJ
 nUfeJLYDwJlgE6/0fDo165nBaeQuHeefJdYhL+tPFCcpeKqew6yBJYy3tmv7/cWjt3Xv
 kGa9XsRu1x9N+pxsf9fWctty0FbivnZI5YAqW4rBZCudwhOXDrcq7AZxmHIdCFCypEBK
 /yeKDKTOTjDfwO6z6kfFCgM9FchKh+x482vSivAbfJ1CiD438vxVoODz8P8wtIusrf6x
 ueWA==
X-Gm-Message-State: ACgBeo2lqIB21wXf5vxhfYQIfQDKWg13cSC0jfX/HBoRaDL6r9/XlBPS
 lDc+JATVCT0ILkfLtKI1JUp5YOnpSGeUWBtkCp45/w==
X-Google-Smtp-Source: AA6agR48DKqf2r3aI9j1O2PeA8mcLTVLuYKA4h3CyDOA4svLXS26jdfPtrOA6VrTp9c5r/tsoWLbGu7mabBhXkRRS/c=
X-Received: by 2002:a17:903:11d2:b0:167:8a0f:8d4b with SMTP id
 q18-20020a17090311d200b001678a0f8d4bmr27301599plh.78.1659555960071; Wed, 03
 Aug 2022 12:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220803074349.7590-1-francois.perrad@gadz.org>
 <20220803074349.7590-3-francois.perrad@gadz.org>
 <20220803183206.4a278247@windsurf>
In-Reply-To: <20220803183206.4a278247@windsurf>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 3 Aug 2022 21:45:48 +0200
Message-ID: <CAB0FRssCzSJocBF3yee4nOEf-z=92Dm93OLaKoM7sCn+5jGgzA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 2/3] package/qoriq-cadence-dp-firmware:
 add install in target
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
Cc: buildroot <buildroot@busybox.net>, Francois Perrad <fperrad@gmail.com>
Content-Type: multipart/mixed; boundary="===============4049432517697327290=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4049432517697327290==
Content-Type: multipart/alternative; boundary="0000000000007c3ec405e55b7bf3"

--0000000000007c3ec405e55b7bf3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 3 ao=C3=BBt 2022 =C3=A0 18:32, Thomas Petazzoni via buildroot <
buildroot@buildroot.org> a =C3=A9crit :

> Hello Fran=C3=A7ois,
>
> On Wed,  3 Aug 2022 09:43:48 +0200
> Francois Perrad <fperrad@gmail.com> wrote:
>
> > This patch adds the firmware to $(TARGET_DIR)/boot other than
> > to $(BINARIES) folder. This is needed in the case
> > BR2_LINUX_KERNEL_INSTALL_TARGET is not set
>
> Could you clarify why installing the kernel in /boot is related to
> having or not this firmware installed in /boot?
>
>
in v1, the commit message was :

this firmware must be installed with the kernel,
> there are 2 cases:
>
- in $(TARGET_DIR)/boot
> - in $(BINARIES), in order to be bundled into a boot partition
>

Fran=C3=A7ois


> > +ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),)
> >  QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES =3D YES
> >  QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET =3D NO
> > +endif
>
> So this means that when BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy, the firmware
> will no longer be installed in $(BINARIES_DIR), potentially breaking
> existing usage of this package?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000007c3ec405e55b7bf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 3 ao=C3=BBt 2022 =C3=A0=
=C2=A018:32, Thomas Petazzoni via buildroot &lt;<a href=3D"mailto:buildroot=
@buildroot.org">buildroot@buildroot.org</a>&gt; a =C3=A9crit=C2=A0:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Fran=C3=A7ois,<br=
>
<br>
On Wed,=C2=A0 3 Aug 2022 09:43:48 +0200<br>
Francois Perrad &lt;<a href=3D"mailto:fperrad@gmail.com" target=3D"_blank">=
fperrad@gmail.com</a>&gt; wrote:<br>
<br>
&gt; This patch adds the firmware to $(TARGET_DIR)/boot other than<br>
&gt; to $(BINARIES) folder. This is needed in the case<br>
&gt; BR2_LINUX_KERNEL_INSTALL_TARGET is not set<br>
<br>
Could you clarify why installing the kernel in /boot is related to<br>
having or not this firmware installed in /boot?<br>
<br></blockquote><div><br></div><div>in v1, the commit message was :</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>this f=
irmware must be installed with the kernel,<br>there are 2 cases:<br></div><=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>- in $(T=
ARGET_DIR)/boot<br>- in $(BINARIES), in order to be bundled into a boot par=
tition<br></div></blockquote><div><br></div><div>Fran=C3=A7ois<br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),)<br>
&gt;=C2=A0 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES =3D YES<br>
&gt;=C2=A0 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET =3D NO<br>
&gt; +endif<br>
<br>
So this means that when BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy, the firmware<b=
r>
will no longer be installed in $(BINARIES_DIR), potentially breaking<br>
existing usage of this package?<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--0000000000007c3ec405e55b7bf3--

--===============4049432517697327290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4049432517697327290==--
