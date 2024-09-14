Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACB9C02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 12:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 072B140284;
	Sat, 14 Sep 2024 12:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFUq_5eRXear; Sat, 14 Sep 2024 12:57:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C3114020B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C3114020B;
	Sat, 14 Sep 2024 12:57:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7B31BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A76A81EB0
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IY854nf85Oyb for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 12:57:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.51;
 helo=mail-ej1-f51.google.com; envelope-from=fede.evol@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88B6C81E9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88B6C81E9F
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88B6C81E9F
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:57:50 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so660893666b.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 05:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726318668; x=1726923468;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vwvUIqWRFE+2N/PUvtlLqsYZl3iaJAWS4+bOCZW7SWQ=;
 b=xNEPP0Es+87F1cGVkXI4o1chU7QDF3h9HHauVm4h4M+aEIHURNp2wGwvif5Ruyk4cq
 jMj9PJPp5rx57mFbxfvUHCk1XcZga7G1gWNDhSB88Qeo9/lW+5Mtsrkf6qmsFPIZJhG/
 9oQ05HFAmo8+EQQs0dmIRAuPqvOuFej9jUgdcOuCkxAUDvZq9ftk7wKAJ0cP1NK50RNo
 JpjLu589EoL1jvjE7Ek67wqv5wrbss+N7F5P11sSsdw0IKv0DRsoQ5D3SqbUq3Z4bAK5
 tlotY78KvPkxD2jccZ5nIXb0vJ9xFm3QTXliTP2l0iumbIjzpTe/IBPKHoWcXQ5idZEI
 VOEg==
X-Gm-Message-State: AOJu0Yx+deyq9Nj2Iq2JIKvIDVVq3DHOMkxwPWycKywlwpufaXyCpsSz
 kom6R/mh1NbpOv0/o71QUb7Kekqy35Uw+551n0lFZ0CU8LrjCit18++UKrnXUGzPEIS5wfnwVx3
 KhF7qb1R+TdGdHTlPS/Bu0E1s3draqQ==
X-Google-Smtp-Source: AGHT+IHO3r5qysods91J88CjVKELl+pqg91d0Wjo8qAZZobg+HcY5P8Ss25PeXuyW+YsA4io3M9NqOpHRM1czn/3wOk=
X-Received: by 2002:a17:907:6ea0:b0:a8d:4cec:fcec with SMTP id
 a640c23a62f3a-a8ffae0016cmr1710919266b.26.1726318667514; Sat, 14 Sep 2024
 05:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240914124337.1200461-1-peter@korsgaard.com>
 <20240914124337.1200461-13-peter@korsgaard.com>
In-Reply-To: <20240914124337.1200461-13-peter@korsgaard.com>
From: Federico Pellegrin <fede@evolware.org>
Date: Sat, 14 Sep 2024 14:57:36 +0200
Message-ID: <CAM6O0ZhnJrAYQSLSXWZsMBxc8hY8bRqwbUOuWvkR+PuKKrzPRA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=evolware.org
Subject: Re: [Buildroot] [PATCH 13/20] package/mrouted: fix typos
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
Cc: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4625228379304661278=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4625228379304661278==
Content-Type: multipart/alternative; boundary="000000000000f249b5062213e274"

--000000000000f249b5062213e274
Content-Type: text/plain; charset="UTF-8"

Hi,

Il giorno sab 14 set 2024 alle ore 14:44 Peter Korsgaard <
peter@korsgaard.com> ha scritto:

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/mrouted/Config.in  | 2 +-
>  package/mrouted/mrouted.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
> index 95b4fb3825..9a29985763 100644
> --- a/package/mrouted/Config.in
> +++ b/package/mrouted/Config.in
> @@ -8,6 +8,6 @@ config BR2_PACKAGE_MROUTED
>           source. This package comes with mrouted and mroutectl.  Where
>           the latter is used to query status and control operation.
>
> -         Note: at least two interfaces with MULTICAST flag is requried.
> +         Note: at least two interfaces with MULTICAST flag is required.
>

Should that say instead:

Note: at least two interfaces with MULTICAST flag are required.

? (so is -> are)

Cheers,
Federico



>
>           http://github.com/troglobit/mrouted
> diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
> index 0d2071c4f0..7b5f5039f6 100644
> --- a/package/mrouted/mrouted.mk
> +++ b/package/mrouted/mrouted.mk
> @@ -23,7 +23,7 @@ define MROUTED_INSTALL_INIT_SYSTEMD
>                 $(TARGET_DIR)/usr/lib/systemd/system/mrouted.service
>  endef
>
> -# We will asume that CONFIG_NET and CONFIG_INET are already
> +# We will assume that CONFIG_NET and CONFIG_INET are already
>  # set in the kernel configuration provided by the user.
>  define MROUTED_LINUX_CONFIG_FIXUPS
>         $(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTICAST)
> --
> 2.39.2
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000f249b5062213e274
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div>Hi,<br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il giorn=
o sab 14 set 2024 alle ore 14:44 Peter Korsgaard &lt;<a href=3D"mailto:pete=
r@korsgaard.com">peter@korsgaard.com</a>&gt; ha scritto:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Peter Korsgaard &lt=
;<a href=3D"mailto:peter@korsgaard.com" target=3D"_blank">peter@korsgaard.c=
om</a>&gt;<br>
---<br>
=C2=A0package/mrouted/Config.in=C2=A0 | 2 +-<br>
=C2=A0package/mrouted/<a href=3D"http://mrouted.mk" rel=3D"noreferrer" targ=
et=3D"_blank">mrouted.mk</a> | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in<br>
index 95b4fb3825..9a29985763 100644<br>
--- a/package/mrouted/Config.in<br>
+++ b/package/mrouted/Config.in<br>
@@ -8,6 +8,6 @@ config BR2_PACKAGE_MROUTED<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 source. This package comes with mrouted =
and mroutectl.=C2=A0 Where<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the latter is used to query status and c=
ontrol operation.<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Note: at least two interfaces with MULTI=
CAST flag is requried.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Note: at least two interfaces with MULTI=
CAST flag is required.<br></blockquote><div><br></div><div>Should that say =
instead:</div><div><br></div><div>Note: at least two interfaces with MULTIC=
AST flag are required.</div><div><br></div><div>? (so is -&gt; are)</div><d=
iv><br></div><div>Cheers,</div><div>Federico</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/troglobit/m=
routed" rel=3D"noreferrer" target=3D"_blank">http://github.com/troglobit/mr=
outed</a><br>
diff --git a/package/mrouted/<a href=3D"http://mrouted.mk" rel=3D"noreferre=
r" target=3D"_blank">mrouted.mk</a> b/package/mrouted/<a href=3D"http://mro=
uted.mk" rel=3D"noreferrer" target=3D"_blank">mrouted.mk</a><br>
index 0d2071c4f0..7b5f5039f6 100644<br>
--- a/package/mrouted/<a href=3D"http://mrouted.mk" rel=3D"noreferrer" targ=
et=3D"_blank">mrouted.mk</a><br>
+++ b/package/mrouted/<a href=3D"http://mrouted.mk" rel=3D"noreferrer" targ=
et=3D"_blank">mrouted.mk</a><br>
@@ -23,7 +23,7 @@ define MROUTED_INSTALL_INIT_SYSTEMD<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_DIR)/usr/l=
ib/systemd/system/mrouted.service<br>
=C2=A0endef<br>
<br>
-# We will asume that CONFIG_NET and CONFIG_INET are already<br>
+# We will assume that CONFIG_NET and CONFIG_INET are already<br>
=C2=A0# set in the kernel configuration provided by the user.<br>
=C2=A0define MROUTED_LINUX_CONFIG_FIXUPS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTICAST)<=
br>
-- <br>
2.39.2<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000f249b5062213e274--

--===============4625228379304661278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4625228379304661278==--
