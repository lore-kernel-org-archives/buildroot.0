Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30A8C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 16:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6871680F51;
	Sun, 28 Jul 2024 16:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptwgkVz2hxgD; Sun, 28 Jul 2024 16:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47716810FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47716810FB;
	Sun, 28 Jul 2024 16:19:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 633F81BF82C
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 16:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EC84402F5
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 16:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHlyeFhDvMud for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 16:19:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0867402E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0867402E0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0867402E0
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 16:19:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42803adb420so2021815e9.2
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 09:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722183541; x=1722788341;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C9OZ/jqZO9GhE1q8blH1BX9KYuYNNEz2SmMqGEDkfF4=;
 b=QuIrybCXOvMEZj3xgBGAcQXaVoZb8rHqzjaq5jHyJZaFWKq5R8eW5YTMjYqG4RkQ0y
 UzorrBgMKBUuPGc8bHFgpQ0PsdbQR2hDDpAcMQU3zS3kf90AqLLtKRqAfzAtTQMG6DyJ
 lhvGYcsEN7nY+lTXly0WVIBtOc52mtwXijOI7GXXYe5bEv43QjbkaZ7C9syU6yXDcV15
 DhtFYxh7+ePXDC+HImxTmj0FBtMFQga8IUuC5L5UKXBifFlasrBt+tz7tN/daZEoJvog
 VIOlezsOzFTYvKkBvD6mW0HQ91PVsYHG1bkZioFMXQhMFtBrNcTK7RQKpIvjxA79TteG
 bbNw==
X-Gm-Message-State: AOJu0YyREwvBHGVN978Wr50gSdVtKjqI+CGPOsoAMZRazg/vmxP/ZR3u
 3ofKmBWLAAb+nq9gnkcOKPVzYdb/oxr17kpGNYoKI207juKEuX6uaXSZbgtf7XQtMVlVMlgkTxN
 mfM6kCA/o2837Jig7Xo+DNbv7go6Nbqo1
X-Google-Smtp-Source: AGHT+IEgTpHMzwchYIAcRBdhAi8UexCKGUkh6SVzmSZ3yUHB6u9FDIUYjni8cjeVuocMyiDJmgnNAryQG/VRNYg2GWU=
X-Received: by 2002:a5d:6d83:0:b0:367:2da6:aa1b with SMTP id
 ffacd0b85a97d-36b34d2c81dmr5227867f8f.7.1722183541232; Sun, 28 Jul 2024
 09:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240728115817.743185-1-dm.chestnykh@gmail.com>
 <20240728180047.38c594f2@windsurf>
In-Reply-To: <20240728180047.38c594f2@windsurf>
From: Dmitriy Chestnykh <dm.chestnykh@gmail.com>
Date: Sun, 28 Jul 2024 19:21:20 +0300
Message-ID: <CA+RUeSqWVBsZYMV1S_2eDnLbEJY6E7o4aqDQjd9j=puoSs0cfQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722183541; x=1722788341; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C9OZ/jqZO9GhE1q8blH1BX9KYuYNNEz2SmMqGEDkfF4=;
 b=b8T0gweTlySdCTMf3MpJgnbKIpyCdu+uXm+ANcFPlfJPFbPdAqVrO4BtRSu8PQ6Zcq
 UzBY2USDM5wO90PQ9W7BIEmolfvHp7G6ehIn2zjBUd8N91eoAOmMv8/nDHCj84imzdxD
 9LgpaXDYbzLN8SA4pi2syMnP4vR9p5QVsWzBOxBLJtnBa7TrkGrOwxM2NZtXT+qzygyp
 PkVVPZaIL5FOtnq3qn++IKaJCSMWz1+ATVaep6N+ienQLdUBLDcWzAuAAQ3yaR63dTs8
 uIRHzrZRxGK0wpeGt/lwaIBO8PY//XUoBqLPvcWwF6WD2RoAdmsUfnwibKi7PTo5sgno
 2Dew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=b8T0gweT
Subject: Re: [Buildroot] [PATCH] package/uclibc: Fix ARC build with 4.x
 kernel headers
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
Content-Type: multipart/mixed; boundary="===============2422199772688435264=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2422199772688435264==
Content-Type: multipart/alternative; boundary="000000000000369fac061e511a5e"

--000000000000369fac061e511a5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas
The SuperH4 issue has already been fixed by patch number 0002 (
https://gitlab.com/buildroot.org/buildroot/-/commit/f463a4953534df13397ce11=
3bfbbc03d4b8e4df7
)

=D0=B2=D1=81, 28 =D0=B8=D1=8E=D0=BB. 2024=E2=80=AF=D0=B3. =D0=B2 19:00, Tho=
mas Petazzoni <thomas.petazzoni@bootlin.com
>:

> Hello Dmitry,
>
> On Sun, 28 Jul 2024 14:58:17 +0300
> Dmitry Chestnykh <dm.chestnykh@gmail.com> wrote:
>
> > Provide correct grouping for preprocessor
> > conditions to avoid building ld.so with
> > undefined macroses which are in use
> >
> > Fixes
> >   package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.patch
> > Upstream:
> >
> https://patchwork.ozlabs.org/project/uclibc-ng/patch/20240728115224.72566=
6-1-dm.chestnykh@gmail.com/
> >
> > Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
>
> Thanks for this patch!
>
> I also encountered a SuperH 4 build issue with uClibc-ng:
>
> /builds/
> buildroot.org/toolchains-builder/build/sh-sh4--uclibc--stable-2024.05-1/l=
ib/gcc/sh4-buildroot-linux-uclibc/13.3.0/../../../../sh4-buildroot-linux-uc=
libc/bin/ld:
> ldso/ldso/ld-uClibc_so.a(ldso.oS): in function `add_ldso.isra.0':
> ldso.c:(.text+0x1f28): undefined reference to `_dl_stat'
>
> More details at:
>
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7378437145
>
> Could this be fixed by your patch?
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000369fac061e511a5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Thomas<br></div>The SuperH4 issue has already b=
een fixed by patch number 0002 ( <a href=3D"https://gitlab.com/buildroot.or=
g/buildroot/-/commit/f463a4953534df13397ce113bfbbc03d4b8e4df7">https://gitl=
ab.com/buildroot.org/buildroot/-/commit/f463a4953534df13397ce113bfbbc03d4b8=
e4df7</a> )</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">=D0=B2=D1=81, 28 =D0=B8=D1=8E=D0=BB. 2024=E2=80=AF=D0=B3. =D0=B2=
 19:00, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com=
">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hello Dmitry,<br>
<br>
On Sun, 28 Jul 2024 14:58:17 +0300<br>
Dmitry Chestnykh &lt;<a href=3D"mailto:dm.chestnykh@gmail.com" target=3D"_b=
lank">dm.chestnykh@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Provide correct grouping for preprocessor<br>
&gt; conditions to avoid building ld.so with<br>
&gt; undefined macroses which are in use<br>
&gt; <br>
&gt; Fixes<br>
&gt;=C2=A0 =C2=A0package/uclibc/0003-Fix-arc-build-with-4.x-kernel-headers.=
patch<br>
&gt; Upstream:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://patchwork.ozlabs.org/project/uclibc-ng/=
patch/20240728115224.725666-1-dm.chestnykh@gmail.com/" rel=3D"noreferrer" t=
arget=3D"_blank">https://patchwork.ozlabs.org/project/uclibc-ng/patch/20240=
728115224.725666-1-dm.chestnykh@gmail.com/</a><br>
&gt; <br>
&gt; Signed-off-by: Dmitry Chestnykh &lt;<a href=3D"mailto:dm.chestnykh@gma=
il.com" target=3D"_blank">dm.chestnykh@gmail.com</a>&gt;<br>
<br>
Thanks for this patch!<br>
<br>
I also encountered a SuperH 4 build issue with uClibc-ng:<br>
<br>
/builds/<a href=3D"http://buildroot.org/toolchains-builder/build/sh-sh4--uc=
libc--stable-2024.05-1/lib/gcc/sh4-buildroot-linux-uclibc/13.3.0/../../../.=
./sh4-buildroot-linux-uclibc/bin/ld" rel=3D"noreferrer" target=3D"_blank">b=
uildroot.org/toolchains-builder/build/sh-sh4--uclibc--stable-2024.05-1/lib/=
gcc/sh4-buildroot-linux-uclibc/13.3.0/../../../../sh4-buildroot-linux-uclib=
c/bin/ld</a>: ldso/ldso/ld-uClibc_so.a(ldso.oS): in function `add_ldso.isra=
.0&#39;:<br>
ldso.c:(.text+0x1f28): undefined reference to `_dl_stat&#39;<br>
<br>
More details at:<br>
<br>
<a href=3D"https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/73784=
37145" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.or=
g/toolchains-builder/-/jobs/7378437145</a><br>
<br>
Could this be fixed by your patch?<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000369fac061e511a5e--

--===============2422199772688435264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2422199772688435264==--
