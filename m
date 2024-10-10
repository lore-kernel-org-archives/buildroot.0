Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4802ACFC5EB
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 18:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06DA74108D;
	Thu, 10 Oct 2024 18:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1n6F_h9NfT_y; Thu, 10 Oct 2024 18:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC68E4027C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC68E4027C;
	Thu, 10 Oct 2024 18:25:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C3091BF3CA
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 18:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BF5181B8A
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 18:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5c6CJBGXXdc for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 18:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12BFA81B83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12BFA81B83
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12BFA81B83
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 18:25:13 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-716a5c58506so341626a34.2
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 11:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728584713; x=1729189513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pZfg3RgaqTLU5cmOa66kgQMwUo2ffWKc69M9dyFZMzQ=;
 b=r2BMWPK5zLODasxsasHbWEmHiTYwNakzIzt+2o0R+erUE79me9XyPHY2oAxS1t4B8E
 VSvB/m4g8xyJrlS1lBa6CgO1hJhfyHWTD2WIZIrYGTvVSzeibauL6Et10f4gfIHKzOn/
 Ic1SeVcdY983/fzc+oIzOz4UCvCNCnStMZju+ZBmCwrvAGLYrGMKypWfsiVprnd0op4C
 ODsO/XTbeaeKUs1kcSUS/v0wXoauD8Rwo6Z2IKSgggbkNvJXhKxdEPoq6Z00sCkFDXF0
 ott2aJVsWi76joBu6zlxd848NJvG9J7IEXZzCqwh9LNaehFa555XRHLi5LLtk6ucryYg
 poDQ==
X-Gm-Message-State: AOJu0YxwSlH9JGIbQ5ASGoJg0Zkanu52XCyvhpwlK6SiC8OtSkCMZtaP
 3xOoBydP3B51p/dbWuorlmP7+TDTwLJeG2McbZDxLcj+MTjLy3CrJyGFIklBdbFoI+gV2PVi795
 a
X-Google-Smtp-Source: AGHT+IEhdJP4niEP/NaeT8TqCXvfO4vxih3zbuMdop5VpjZLcUW02AWXsaZOpzqZy2PPDIoALLs95A==
X-Received: by 2002:a05:6830:3152:b0:715:4e38:a1ac with SMTP id
 46e09a7af769-717d6487bf5mr43049a34.23.1728584712722; 
 Thu, 10 Oct 2024 11:25:12 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com.
 [209.85.160.44]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-717cfee0bd4sm278032a34.5.2024.10.10.11.25.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 11:25:12 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-287278ec282so422194fac.2
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 11:25:12 -0700 (PDT)
X-Received: by 2002:a05:6870:4514:b0:261:e19:458d with SMTP id
 586e51a60fabf-2886dcf7206mr7072fac.4.1728584711779; Thu, 10 Oct 2024 11:25:11
 -0700 (PDT)
MIME-Version: 1.0
References: <20241010132912.3061663-1-fiona.klute@gmx.de>
In-Reply-To: <20241010132912.3061663-1-fiona.klute@gmx.de>
Date: Thu, 10 Oct 2024 11:25:01 -0700
X-Gmail-Original-Message-ID: <CA+h8R2o-RVvZToT597+Fsag3YO2PEiD35_9u7fcpdmu=L0dDdw@mail.gmail.com>
Message-ID: <CA+h8R2o-RVvZToT597+Fsag3YO2PEiD35_9u7fcpdmu=L0dDdw@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1728584713; x=1729189513; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pZfg3RgaqTLU5cmOa66kgQMwUo2ffWKc69M9dyFZMzQ=;
 b=dYPUCAYbs3kPgzRg9BrZv56Mv+TS2zOhJnFDDydj+en8G4I77YQqD+E9g3ReyR48g0
 dSdl1ujzyUCoeyZ/yUEfA8UW3ILI4YnM0nq//jwpeAqibtggwK/J54OwJvPiiaXJsSKA
 ZFdCk6lcxpjcpDTPhjymzwdPJUK/GueDXUYjL+Y5YPp4ynPCRF8N8v9aa7erL0pAs1Eh
 jdJzH7r8AqUQ1olxyaHdzX8a6yHVl9DdJoqNDilLpUuPwsKiTXxR36vvQiJXgCZmblT6
 Mie3GPEkKEuIN1/cvL5DdQtET3Hg6WvgURIslwTqzKxsSIrnK+2APPVd+w1RI9PuRgSd
 LEHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=dYPUCAYb
Subject: Re: [Buildroot] [PATCH 1/2] package/tini: restore use as docker-init
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1740663110700277623=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1740663110700277623==
Content-Type: multipart/alternative; boundary="000000000000b5d2e60624237d9c"

--000000000000b5d2e60624237d9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, Oct 10, 2024, 6:29=E2=80=AFAM Fiona Klute <fiona.klute@gmx.de> wrot=
e:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>
> Commit 24cac9c4e6a36fd14b263a8eecf7ae7d58ab5a59 "system: add tini as
> init system" made BR2_PACKAGE_TINI depend on BR2_INIT_TINI. This is
> incorrect: tini is not only needed when building a container image
> using Buildroot, but also to run Docker containers on Buildroot
> systems using another another init system, if Docker is configured to
> provide an init process for the container (e.g. with "docker run
> --init"). The tini package already provides the "docker-init" symlink
> required for that.
>
> Example error without tini installed:
>
> $ docker run --rm -ti --init alpine
> docker: Error response from daemon: exec: "docker-init": executable file
> not found in $PATH.
>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  package/tini/Config.in | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/tini/Config.in b/package/tini/Config.in
> index bca8ad8e96..719e1e1f22 100644
> --- a/package/tini/Config.in
> +++ b/package/tini/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_TINI
>         bool "tini"
>         depends on BR2_USE_MMU # fork()
> -       depends on BR2_INIT_TINI
>         help
>           tini is a simple but valid init binary to
>           act as PID 1 for containers.
>

Agreed

Reviewed-by: Christian Stewart <christian@aperture.us>

Best regards,
Christian

--000000000000b5d2e60624237d9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi all,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Oct 10, 2024, 6:29=E2=80=AFAM Fiona K=
lute &lt;<a href=3D"mailto:fiona.klute@gmx.de">fiona.klute@gmx.de</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">From: &quot;Fiona Klute (WIWA=
)&quot; &lt;<a href=3D"mailto:fiona.klute@gmx.de" target=3D"_blank" rel=3D"=
noreferrer">fiona.klute@gmx.de</a>&gt;<br>
<br>
Commit 24cac9c4e6a36fd14b263a8eecf7ae7d58ab5a59 &quot;system: add tini as<b=
r>
init system&quot; made BR2_PACKAGE_TINI depend on BR2_INIT_TINI. This is<br=
>
incorrect: tini is not only needed when building a container image<br>
using Buildroot, but also to run Docker containers on Buildroot<br>
systems using another another init system, if Docker is configured to<br>
provide an init process for the container (e.g. with &quot;docker run<br>
--init&quot;). The tini package already provides the &quot;docker-init&quot=
; symlink<br>
required for that.<br>
<br>
Example error without tini installed:<br>
<br>
$ docker run --rm -ti --init alpine<br>
docker: Error response from daemon: exec: &quot;docker-init&quot;: executab=
le file not found in $PATH.<br>
<br>
Signed-off-by: Fiona Klute (WIWA) &lt;<a href=3D"mailto:fiona.klute@gmx.de"=
 target=3D"_blank" rel=3D"noreferrer">fiona.klute@gmx.de</a>&gt;<br>
---<br>
=C2=A0package/tini/Config.in | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/package/tini/Config.in b/package/tini/Config.in<br>
index bca8ad8e96..719e1e1f22 100644<br>
--- a/package/tini/Config.in<br>
+++ b/package/tini/Config.in<br>
@@ -1,7 +1,6 @@<br>
=C2=A0config BR2_PACKAGE_TINI<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;tini&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_USE_MMU # fork()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INIT_TINI<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tini is a simple but valid init binary t=
o<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 act as PID 1 for containers.<br></blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Agreed</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: Christian Stewar=
t &lt;<a href=3D"mailto:christian@aperture.us">christian@aperture.us</a>&gt=
;</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,</div><di=
v dir=3D"auto">Christian</div></div>

--000000000000b5d2e60624237d9c--

--===============1740663110700277623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1740663110700277623==--
