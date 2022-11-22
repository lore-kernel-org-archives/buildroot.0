Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D08C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 06:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2416F81F30;
	Tue, 22 Nov 2022 06:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2416F81F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWB71_sv56xR; Tue, 22 Nov 2022 06:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 432D181F24;
	Tue, 22 Nov 2022 06:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 432D181F24
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E433F1BF333
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 06:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5B1A60FC0
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 06:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5B1A60FC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g1NEwDy1RWTL for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 06:36:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93D7A60FB5
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93D7A60FB5
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 06:36:51 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id vv4so24242751ejc.2
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 22:36:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vu77RaefAw3WoNAxKrsbWSbqMvIPjrjytVlscQQPe74=;
 b=dtC+05hWj6p0fz4ZF/BLDWTgwZIePMClYAl1wrrZ9XH4FQUOkJmyAxgqSvUoU/nAyL
 /Jx5cMKaQuPi8fRt5v3PfcVNouSdTXaGy8JiH0VUaboYf4oiqZAi+3Ez4CkOp8GfSC1e
 mHReOOIBVNAoIsRxf9SmdS0OD/3xVmYPSd60lblqaDONr0WpNkULANchbQIFKfnTGB9L
 ezYXsHHLhUacEFGz+AEFwzpbiM4yBRqwkI8ZnHa1BLSIGn917K7//r3CYojfKj629i2N
 YXbHstfSfHcTU3nrf+DNNjJ1F7ULKeRQfIpd1CBrVUJq5lH1aqq5e36xKj6URWkbXf+e
 b/lQ==
X-Gm-Message-State: ANoB5pmlAmRaMSqinAlPCjWfTl3okS78z++vAgXx10Hhu7/d2OQ7Bc87
 s2jT5RS1nLtAJsn5BdR2v39p1XSlWNWAKh2P
X-Google-Smtp-Source: AA0mqf5kUm36JFKbtNsJPHJ9m9bc8xO4k92s0gF77/jo391Qh4IibwuYRp7X/vmQ6iumBzPef/m+dg==
X-Received: by 2002:a17:906:198d:b0:7a5:f8a5:6f84 with SMTP id
 g13-20020a170906198d00b007a5f8a56f84mr1889264ejd.569.1669099009472; 
 Mon, 21 Nov 2022 22:36:49 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 kw10-20020a170907770a00b0078d4ee47c82sm5720261ejc.129.2022.11.21.22.36.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 22:36:49 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id b8so8470737edf.11
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 22:36:48 -0800 (PST)
X-Received: by 2002:a50:aa8f:0:b0:469:c5cc:855e with SMTP id
 q15-20020a50aa8f000000b00469c5cc855emr5034418edc.307.1669099008496; Mon, 21
 Nov 2022 22:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20221121224955.951056-1-anisse@astier.eu>
In-Reply-To: <20221121224955.951056-1-anisse@astier.eu>
Date: Mon, 21 Nov 2022 22:36:38 -0800
X-Gmail-Original-Message-ID: <CA+h8R2okD2ipf1yfS7rUbWLYQZ5+Cz-wJvwL+=3gpvQY3LRQeA@mail.gmail.com>
Message-ID: <CA+h8R2okD2ipf1yfS7rUbWLYQZ5+Cz-wJvwL+=3gpvQY3LRQeA@mail.gmail.com>
To: Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vu77RaefAw3WoNAxKrsbWSbqMvIPjrjytVlscQQPe74=;
 b=ZhrQFSqTmShMp8WMu1atgqN7IpyEuKosjuLjYpbSeopNOFnDhysZ4gdPEBzDLvYhxP
 QIKJuDxWMBt+1KaVXVOtHJKg1W87Dw/wOo7DwJOPJap/Dqij2qG8mfsxrLdM+vQV83bh
 D2Jbe8NbY/1V80nRgF6bFt23V+rzIChJRfjB7xZUCBjlIknqo1U+zFTCfqWoIf9JmdXq
 D4GQKHqZ7hUPR+35d2U/N1OqUVDps69bBrpBoY0j/FmwwXZof96BqcVdabFPRexoe4uD
 CB9rYWtE36p1TumvWYOmHeNvDVKWAvXSSGZpCEX2AUU9KwoDDiguKa28UCmTZGGsMROI
 yYJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=ZhrQFSqT
Subject: Re: [Buildroot] [PATCH v2] package/go: disable cgo support with
 static libs
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4706970446772166567=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4706970446772166567==
Content-Type: multipart/alternative; boundary="0000000000007f26c305ee096503"

--0000000000007f26c305ee096503
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Christian Stewart <christian@paral.in>

Thanks!


On Mon, Nov 21, 2022, 2:50 PM Anisse Astier <anisse@astier.eu> wrote:

> The go stdlib "plugin"=E2=80=AFpackage relies on dlfcn.h which isn't avai=
lable
> when we have BR2_STATIC_LIBS=3Dy.
>
> This should fix this build error from autobuilders:
>
> /buildroot/build/host-go-1.19.3/src/plugin/plugin_dlopen.go:11:10: fatal
> error: dlfcn.h: No such file or directory
>    11 | #include <dlfcn.h>
>
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
>  package/go/Config.in.host | 1 +
>  package/go/go.mk          | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index ded02d3b3a..9e79a7dfd5 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -23,6 +23,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>         # Go doesn't support CGO linking on MIPS64x platforms
>         # See: https://github.com/karalabe/xgo/issues/46
>         depends on !BR2_mips64 && !BR2_mips64el
> +       depends on !BR2_STATIC_LIBS
>
>  # Host go packages should depend on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPOR=
TS
>  config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> diff --git a/package/go/go.mk b/package/go/go.mk
> index fd4caa2e5a..d54be8cd78 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -87,7 +87,7 @@ HOST_GO_TARGET_ENV =3D \
>  # set, build in cgo support for any go programs that may need it.  Note
> that
>  # any target package needing cgo support must include
>  # 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS):$(BR2_STATIC_LIBS),y:)
>  HOST_GO_CGO_ENABLED =3D 1
>  else
>  HOST_GO_CGO_ENABLED =3D 0
> --
> 2.38.1
>
>

--0000000000007f26c305ee096503
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Reviewed-by: Christian Stewart &lt;<a href=3D"mailto=
:christian@paral.in">christian@paral.in</a>&gt;<div dir=3D"auto"><br></div>=
<div dir=3D"auto">Thanks!</div><br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Nov 21, 2022, 2:50 PM Anisse Astier &=
lt;<a href=3D"mailto:anisse@astier.eu">anisse@astier.eu</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">The go stdlib &quot;plugin&quot;=E2=80=
=AFpackage relies on dlfcn.h which isn&#39;t available<br>
when we have BR2_STATIC_LIBS=3Dy.<br>
<br>
This should fix this build error from autobuilders:<br>
<br>
/buildroot/build/host-go-1.19.3/src/plugin/plugin_dlopen.go:11:10: fatal er=
ror: dlfcn.h: No such file or directory<br>
=C2=A0 =C2=A011 | #include &lt;dlfcn.h&gt;<br>
<br>
Signed-off-by: Anisse Astier &lt;<a href=3D"mailto:anisse@astier.eu" target=
=3D"_blank" rel=3D"noreferrer">anisse@astier.eu</a>&gt;<br>
---<br>
=C2=A0package/go/Config.in.host | 1 +<br>
=C2=A0package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">go.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/package/go/Config.in.host b/package/go/Config.in.host<br>
index ded02d3b3a..9e79a7dfd5 100644<br>
--- a/package/go/Config.in.host<br>
+++ b/package/go/Config.in.host<br>
@@ -23,6 +23,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Go doesn&#39;t support CGO linking on MIPS64x=
 platforms<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # See: <a href=3D"https://github.com/karalabe/x=
go/issues/46" rel=3D"noreferrer noreferrer" target=3D"_blank">https://githu=
b.com/karalabe/xgo/issues/46</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_mips64 &amp;&amp; !BR2_mips64el=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS<br>
<br>
=C2=A0# Host go packages should depend on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUP=
PORTS<br>
=C2=A0config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS<br>
diff --git a/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferr=
er" target=3D"_blank">go.mk</a> b/package/go/<a href=3D"http://go.mk" rel=
=3D"noreferrer noreferrer" target=3D"_blank">go.mk</a><br>
index fd4caa2e5a..d54be8cd78 100644<br>
--- a/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">go.mk</a><br>
+++ b/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">go.mk</a><br>
@@ -87,7 +87,7 @@ HOST_GO_TARGET_ENV =3D \<br>
=C2=A0# set, build in cgo support for any go programs that may need it.=C2=
=A0 Note that<br>
=C2=A0# any target package needing cgo support must include<br>
=C2=A0# &#39;depends on BR2_TOOLCHAIN_HAS_THREADS&#39; in its config file.<=
br>
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)<br>
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS):$(BR2_STATIC_LIBS),y:)<br>
=C2=A0HOST_GO_CGO_ENABLED =3D 1<br>
=C2=A0else<br>
=C2=A0HOST_GO_CGO_ENABLED =3D 0<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div></div></div>

--0000000000007f26c305ee096503--

--===============4706970446772166567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4706970446772166567==--
