Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C0DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 06:09:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7734B610A1
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 06:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7734B610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gadz.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 161CB6081A;
	Tue, 19 Oct 2021 06:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXLvsulFr06f; Tue, 19 Oct 2021 06:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63EA96078D;
	Tue, 19 Oct 2021 06:09:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC3DA1BF2B7
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 06:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A76EC83005
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 06:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SihFllVn1ezS for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 06:09:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BEB082F0F
 for <buildroot@busybox.net>; Tue, 19 Oct 2021 06:09:31 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id y15so4958804lfk.7
 for <buildroot@busybox.net>; Mon, 18 Oct 2021 23:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=I14GIPPi8d1rTzPvglZddY9+bD+aam7xsXwoABGmWGY=;
 b=rlUaFrz6JnewmBD6QL9Zgm2HRWl/9Cn5pOO5LkD3KNFqPMVn5g0LjztsaZGt8CS8mu
 +5cl+r9CleVq3vM+YvrxpvSLz3kEfU67j1xIxUeH+6tkIehWzBf1isi6I6lZSFU8RtoC
 B5qJxO/oh+mjyraU65TFlm0ubPgDeUbGUvJ7jJSH59K3fh5SpebGJtBT4yUb1z/yOhRh
 AwfgujJ9df3RRaghJzg7xuaF+QIRlDUrBLitER+uiuebUr0z8QqsKe6vYjQDbKpoF8sS
 6kqZ4ZnP/pZqBmY2TsCIS97gaK75447PEwEirr4NzcINrV8kU4plvSm/99vfFiREESP+
 kD4Q==
X-Gm-Message-State: AOAM533NMyZ9FWW2ifqLT4N5vaFKRFrZjoSjoP8400Wwmhpwf3M7NcxT
 B3Y7NxyOoZgSnCY5NCnBFTANm5uwZK6nkb3kCjUDT7ZVoac=
X-Google-Smtp-Source: ABdhPJzJPX0097Ce4Q0RWjCe1aX7qEoB4DbTWrQNpCYJaEEKM1rQRdh3WC/r5L9s/twryG749sUDP8H4LqUDvLEldAM=
X-Received: by 2002:a05:6512:3f8b:: with SMTP id
 x11mr4420313lfa.486.1634623769153; 
 Mon, 18 Oct 2021 23:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210901141029.892409-1-francois.perrad@gadz.org>
In-Reply-To: <20210901141029.892409-1-francois.perrad@gadz.org>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 19 Oct 2021 08:09:18 +0200
Message-ID: <CAB0FRssKymXrjzPyAm19TFtn-8oidfTB0fvkb5YW4xRy8r=GWQ@mail.gmail.com>
To: buildroot <buildroot@busybox.net>
Subject: Re: [Buildroot] [PATCH v2] support/scripts/pkg-stats: prefers
 stable version from release-monitoring.org
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
Content-Type: multipart/mixed; boundary="===============5921459024074689978=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5921459024074689978==
Content-Type: multipart/alternative; boundary="0000000000001a28bb05ceae8130"

--0000000000001a28bb05ceae8130
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

Le mer. 1 sept. 2021 =C3=A0 16:10, Francois Perrad <fperrad@gmail.com> a =
=C3=A9crit :

> for example with libpng: 1.6.37 instead of 1.7.0beta89
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  support/scripts/pkg-stats | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index cc91d1316..249cc6afe 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -485,6 +485,7 @@ async def
> check_package_get_latest_version_by_distro(session, pkg, retry=3DTrue):
>
>              data =3D await resp.json()
>              version =3D data['version'] if 'version' in data else None
> +            version =3D data['stable_versions'][0] if 'stable_versions' =
in
> data else version
>              check_package_latest_version_set_status(pkg,
>
>  RM_API_STATUS_FOUND_BY_DISTRO,
>                                                      version,
> --
> 2.30.2
>
>

--0000000000001a28bb05ceae8130
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div>ping<br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 1 sep=
t. 2021 =C3=A0=C2=A016:10, Francois Perrad &lt;<a href=3D"mailto:fperrad@gm=
ail.com">fperrad@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">for example with libpng: 1.6.37 inst=
ead of 1.7.0beta89<br>
<br>
Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.o=
rg" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
---<br>
=C2=A0support/scripts/pkg-stats | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats<br>
index cc91d1316..249cc6afe 100755<br>
--- a/support/scripts/pkg-stats<br>
+++ b/support/scripts/pkg-stats<br>
@@ -485,6 +485,7 @@ async def check_package_get_latest_version_by_distro(se=
ssion, pkg, retry=3DTrue):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D await resp.json()<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version =3D data[&#39;versi=
on&#39;] if &#39;version&#39; in data else None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version =3D data[&#39;stable_ver=
sions&#39;][0] if &#39;stable_versions&#39; in data else version<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_package_latest_versio=
n_set_status(pkg,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RM_API_STATUS_FOUND_BY_DISTRO,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version,<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--0000000000001a28bb05ceae8130--

--===============5921459024074689978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5921459024074689978==--
