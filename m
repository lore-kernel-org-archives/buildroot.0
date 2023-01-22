Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8123C25B4E
	for <buildroot@archiver.kernel.org>; Sun, 22 Jan 2023 11:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3045381DFB;
	Sun, 22 Jan 2023 11:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3045381DFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KAuDUaqNvYE0; Sun, 22 Jan 2023 11:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9CE081DE1;
	Sun, 22 Jan 2023 11:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9CE081DE1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 509381BF379
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 11:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 393BB81DE1
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 11:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 393BB81DE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2BtBcTzYEWyF for <buildroot@lists.busybox.net>;
 Sun, 22 Jan 2023 11:44:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BC8981CAF
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BC8981CAF
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 11:44:33 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id u7so5043557qkk.10
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 03:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2NFVvDVJBY6Qd8LqZLOVNIFe2rqmZt8oGyjCdg/Zv6c=;
 b=l0eXzcE8ZugjY2afvyFURtIxRBaEMpNY5yR0aCQIDgtO98tr8w0nfih6lf/FZ10xp+
 BYP8waz4H8863SvACzsPnMclqCu1dj45OA8VCbQS7qPmwH9viDdsAYJjdYvYxfow4+7L
 7b7eRWaa5lL5L8ot7Djy91bISKHaW632wWnFAiF/hhD5NIipt3UT+6eINWxo0OHNLhGp
 KjIghoWE9XfS3K9sBI6Jqis2nzfDk8BEkFIENptrsJycDfLRjP3BJUfVcKPTDRFSEA2C
 fxj1ea+Icn5KYgmAsICM0L3HDEkkI+vqUgPk2QWSvT+nEv+DI058qhKhByizxhqEbPY0
 F3fw==
X-Gm-Message-State: AFqh2kq7TBmLZllhg3M2xlftjVNetWgQicmWJSICuGN51XXHR+rvj6uQ
 BV11YWKVfc4T5vQatV3k5Tv9nNa8BRh2YKTqQpOVlGZL
X-Google-Smtp-Source: AMrXdXuPYCBOdgUS3Lztn3sR2feOAWgNO5HRdl16tBewkRJu60ujAWIZipRSNRiz2aR83SisA8vAYpkQLENOKg0OS3o=
X-Received: by 2002:a05:620a:2aee:b0:705:f3c6:47f6 with SMTP id
 bn46-20020a05620a2aee00b00705f3c647f6mr1160284qkb.639.1674387872774; Sun, 22
 Jan 2023 03:44:32 -0800 (PST)
MIME-Version: 1.0
References: <20230122094453.1381079-1-yann.morin.1998@free.fr>
In-Reply-To: <20230122094453.1381079-1-yann.morin.1998@free.fr>
From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 22 Jan 2023 12:44:21 +0100
Message-ID: <CADYdroNG5RFuEU=Jw3v_7CveUCFQqiJ5y9fZM5mwVsVAVT5BTw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2NFVvDVJBY6Qd8LqZLOVNIFe2rqmZt8oGyjCdg/Zv6c=;
 b=A7pjAlh4Ws7MfTJLpmwdye7ju6lR8qVREeHRhtLrXQQPiKlFD9ziQD9bf8vR/eLKK/
 zv2bC7Fi5jOxWBvLgun4adcEORuyV1ni2+AOsI0lq3eJHdOkSYMNWEaktgXx1gDkdEhv
 T7FyMuFJNXaQI7ooXwVmzm73U8DXtrob3sW3jbhRteiiQzmcMUczVyulAWUfRxKA61ms
 MpYGPJcjWQLyCb0Cf7yqHl356JUxHh61F+1n4/nMo2ZoEMRpZHVVIdZ6b3bu7i26zqIA
 FS5ZDEEXnv8A2TqqHZM5nwS2vxnLrIUsf6D+YNxwsrWsZiJwMRqehc6MwErZrgNRQq7H
 woMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A7pjAlh4
Subject: Re: [Buildroot] [PATCH] system: add option for packages to require
 /bin/sh
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0206469261086704922=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0206469261086704922==
Content-Type: multipart/alternative; boundary="0000000000005f7fbc05f2d8ceab"

--0000000000005f7fbc05f2d8ceab
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Jan 2023, 10:44 Yann E. MORIN, <yann.morin.1998@free.fr> wrote:

> Some packages will require that /bin/sh exists and is a valid shell.
>
> For example, system needs a shell, but does not care much what it is. We
> could provide it with whatever the user configures as BR2_SYSTEM_BIN_SH,
> but that can be empty because of BR2_SYSTEM_BIN_SH_NONE.
>
> So, we add an option to restrict the choice and forbid
> BR2_SYSTEM_BIN_SH_NONE
> from being a selectable option, this ensuring that there is a shell on
> the system. As a side effect, it also ensures that /bin/sh exists.
>
> For systmd, we can then just tell it to unconditionally use /bin/sh as
> the default user shell, and that will also match whatever the user
> selected as the system-wide default shell.
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Norbert Lange <nolange79@gmail.com>
> ---
> Note: this is a prerequisite for the bump to systemd 252.4:
>
> http://patchwork.ozlabs.org/project/buildroot/patch/20230115114840.9027-1-nolange79@gmail.com/
> ---
>  system/Config.in | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/system/Config.in b/system/Config.in
> index 806a747315..963192cb3f 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -320,6 +320,17 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
>           the very least use a strong cryptographic hash for your
>           password!
>
> +config BR2_SYSTEM_NEEDS_BIN_SH
> +       bool
> +       # Busybox has a shell that does not need an MMU, but all the
> +       # standalone shells need one. If BR2_PACKAGE_BUSYBOX is not
> +       # set, BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is set, so we just need
> +       # an MMU.
> +       depends on BR2_USE_MMU || BR2_PACKAGE_BUSYBOX
> +       help
> +         Have your package select this (and proapgate the dependencies)
> +         if it absolutely needs /bin/sh to exist and be a valid shell.
> +
>  choice
>         bool "/bin/sh"
>         default BR2_SYSTEM_BIN_SH_DASH if !BR2_PACKAGE_BUSYBOX
> @@ -360,6 +371,7 @@ comment "bash, dash, mksh, zsh need
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
>
>  config BR2_SYSTEM_BIN_SH_NONE
>         bool "none"
> +       depends on !BR2_SYSTEM_NEEDS_BIN_SH
>
>  endchoice # /bin/sh
>
> --
> 2.25.1
>

Hello Yann,

I see the use of requiring /bin/sh, but that is as soon as any packet
requires a shell script or wants to login.

Systemd allows configuring the paths of several tools that might or might
not exist.
This doesn't itself change whether  /bin/sh is needed or not (nor that
252.4 changes anything in that behavior). Am I missing something?

Regards, Norbert

--0000000000005f7fbc05f2d8ceab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, 22 Jan 2023, 10:44 Yann E. MORIN, &lt;<a href=
=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Some packages will require that /bi=
n/sh exists and is a valid shell.<br>
<br>
For example, system needs a shell, but does not care much what it is. We<br=
>
could provide it with whatever the user configures as BR2_SYSTEM_BIN_SH,<br=
>
but that can be empty because of BR2_SYSTEM_BIN_SH_NONE.<br>
<br>
So, we add an option to restrict the choice and forbid BR2_SYSTEM_BIN_SH_NO=
NE<br>
from being a selectable option, this ensuring that there is a shell on<br>
the system. As a side effect, it also ensures that /bin/sh exists.<br>
<br>
For systmd, we can then just tell it to unconditionally use /bin/sh as<br>
the default user shell, and that will also match whatever the user<br>
selected as the system-wide default shell.<br>
<br>
Signed-off-by: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr"=
 target=3D"_blank" rel=3D"noreferrer">yann.morin.1998@free.fr</a>&gt;<br>
Cc: Norbert Lange &lt;<a href=3D"mailto:nolange79@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">nolange79@gmail.com</a>&gt;<br>
---<br>
Note: this is a prerequisite for the bump to systemd 252.4:<br>
=C2=A0 =C2=A0 <a href=3D"http://patchwork.ozlabs.org/project/buildroot/patc=
h/20230115114840.9027-1-nolange79@gmail.com/" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">http://patchwork.ozlabs.org/project/buildroot/patch/2023=
0115114840.9027-1-nolange79@gmail.com/</a><br>
---<br>
=C2=A0system/Config.in | 12 ++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
<br>
diff --git a/system/Config.in b/system/Config.in<br>
index 806a747315..963192cb3f 100644<br>
--- a/system/Config.in<br>
+++ b/system/Config.in<br>
@@ -320,6 +320,17 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the very least use a strong cryptographi=
c hash for your<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 password!<br>
<br>
+config BR2_SYSTEM_NEEDS_BIN_SH<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Busybox has a shell that does not need an MMU=
, but all the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# standalone shells need one. If BR2_PACKAGE_BU=
SYBOX is not<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# set, BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is set, =
so we just need<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# an MMU.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU || BR2_PACKAGE_BUSYBOX<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Have your package select this (and proap=
gate the dependencies)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if it absolutely needs /bin/sh to exist =
and be a valid shell.<br>
+<br>
=C2=A0choice<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;/bin/sh&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default BR2_SYSTEM_BIN_SH_DASH if !BR2_PACKAGE_=
BUSYBOX<br>
@@ -360,6 +371,7 @@ comment &quot;bash, dash, mksh, zsh need BR2_PACKAGE_BU=
SYBOX_SHOW_OTHERS&quot;<br>
<br>
=C2=A0config BR2_SYSTEM_BIN_SH_NONE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;none&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_SYSTEM_NEEDS_BIN_SH<br>
<br>
=C2=A0endchoice # /bin/sh<br>
<br>
-- <br>
2.25.1<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Hello Yann,</div><div dir=3D"auto"><br></div><div dir=3D"auto">I see =
the use of requiring /bin/sh, but that is as soon as any packet requires a =
shell script or wants to login.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Systemd allows configuring the paths of several tools that might =
or might not exist.</div><div dir=3D"auto">This doesn&#39;t itself change w=
hether=C2=A0 /bin/sh is needed or not (nor that 252.4 changes anything in t=
hat behavior). Am I missing something?</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Regards, Norbert=C2=A0</div></div>

--0000000000005f7fbc05f2d8ceab--

--===============0206469261086704922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0206469261086704922==--
