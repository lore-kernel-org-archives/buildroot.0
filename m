Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90DCC433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 05:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A7CB41961;
	Thu,  7 Apr 2022 05:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DiwLWvXiboob; Thu,  7 Apr 2022 05:44:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01A2B41952;
	Thu,  7 Apr 2022 05:44:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B24C1BF95E
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 05:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 436F841952
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 05:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_rM8VIM3Hhk for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 05:44:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5030418F7
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 05:44:02 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id b21so6018411ljf.11
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 22:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Pw5yWBsfWR5zhaV8JIoqRcQyZjhgCbQHt8M1TZ19YuM=;
 b=4Hkv3zIwr4F+pQj7jypRlGLpPlbX+8SztO72pXVXtZoJZ2C+6BgolwB0ovcZE3kzPx
 xJyQz2jWR5fKmYKMhNpfejV13wqp0Q8g+o6auKQIii8Oq+jNPUdYwB7ki3cOZqq+Fqvw
 fiRkCSl5J3v+swIsHODkoulbzWO5MjZLEPLFupwm0bVI+hSmU9qiYkEYALQK5JV5OKHk
 rNK3t/smDPtziLG0QVXGCxj8iyZ8/i9iOvBu4kBh2sYWIgZ6oPdB/saCNjGnDN9ce6wL
 5k299uiiSrTzULg52g+MODuxEzvOkxdM/xFvaA7bjrnKS75T1si8PsAmPQPCjRYWNQeo
 1rgQ==
X-Gm-Message-State: AOAM53169+p6DhYu2UglY37fX3qQkotIOi8zw4UqZAYU8GZ+Gp7vvAZ8
 lcGb2S5v3f2VKPIyXtZDsD6OuWL77pzpq2mRRPLSiA==
X-Google-Smtp-Source: ABdhPJykrcP9PspAxvmkHqv7Z3vfw9W9HDCty2MPTTUQTMcMbptRfJivxXcaeb0ETibH3NwnAifMzr6kQY6Lz6dLV5g=
X-Received: by 2002:a2e:2f14:0:b0:24a:e877:7f19 with SMTP id
 v20-20020a2e2f14000000b0024ae8777f19mr7639975ljv.379.1649310240403; Wed, 06
 Apr 2022 22:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220406194148.39490-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220406194148.39490-1-fontaine.fabrice@gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 7 Apr 2022 07:43:48 +0200
Message-ID: <CAB0FRss=Wd+6OL6yAh541_z7ZtCj_unuTBe5OVsd_oMZ2v+fTw@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 1/1] package/libressl: bump to version 3.5.1
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
Content-Type: multipart/mixed; boundary="===============0349133275566272450=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0349133275566272450==
Content-Type: multipart/alternative; boundary="000000000000010baf05dc09f745"

--000000000000010baf05dc09f745
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This version 3.5.1 (like 3.5.0, 3.4.0) is a development release, not a
stable release.

Fran=C3=A7ois

Le mer. 6 avr. 2022 =C3=A0 21:43, Fabrice Fontaine <fontaine.fabrice@gmail.=
com>
a =C3=A9crit :

> This bump will fix the following build failure with pure-ftpd thanks to
>
> https://github.com/libressl-portable/openbsd/commit/f5674b4e2330b382bacef=
d3393affc8eb2ee2ba8
> :
>
> tls.c: In function 'tls_init_options':
> tls.c:329:5: warning: implicit declaration of function
> 'SSL_CTX_set_num_tickets'; did you mean 'SSL_CTX_set_options'?
> [-Wimplicit-function-declaration]
>      SSL_CTX_set_num_tickets(tls_ctx, 0);
>      ^~~~~~~~~~~~~~~~~~~~~~~
>      SSL_CTX_set_options
>
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.5.0-relnotes.txt
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.5.1-relnotes.txt
>
> Fixes:
>  -
> http://autobuild.buildroot.org/results/f5d36180949278510199aa499e25378055=
8c6ffe
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libressl/libressl.hash | 2 +-
>  package/libressl/libressl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libressl/libressl.hash
> b/package/libressl/libressl.hash
> index e923998713..5474d8e537 100644
> --- a/package/libressl/libressl.hash
> +++ b/package/libressl/libressl.hash
> @@ -1,4 +1,4 @@
>  # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
> -sha256  ff88bffe354818b3ccf545e3cafe454c5031c7a77217074f533271d63c37f08d
> libressl-3.4.3.tar.gz
> +sha256  a7d0026f67622275ec8f8239ded422a653d5ccc84df55dea2acd406017185608
> libressl-3.5.1.tar.gz
>  # Locally computed
>  sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1
> COPYING
> diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
> index 0bb468cedb..81b0163b93 100644
> --- a/package/libressl/libressl.mk
> +++ b/package/libressl/libressl.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -LIBRESSL_VERSION =3D 3.4.3
> +LIBRESSL_VERSION =3D 3.5.1
>  LIBRESSL_SITE =3D https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
>  LIBRESSL_LICENSE =3D ISC (new additions), OpenSSL or SSLeay (original
> OpenSSL code)
>  LIBRESSL_LICENSE_FILES =3D COPYING
> --
> 2.35.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000010baf05dc09f745
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div>This version 3.5.1 (l=
ike 3.5.0, 3.4.0) is a development release, not a stable release.</div><div=
><br></div><div>Fran=C3=A7ois</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 6 avr. 2022 =C3=A0=C2=A021:=
43, Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com">font=
aine.fabrice@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">This bump will fix the following build f=
ailure with pure-ftpd thanks to<br>
<a href=3D"https://github.com/libressl-portable/openbsd/commit/f5674b4e2330=
b382bacefd3393affc8eb2ee2ba8" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/libressl-portable/openbsd/commit/f5674b4e2330b382bacefd3393affc8=
eb2ee2ba8</a>:<br>
<br>
tls.c: In function &#39;tls_init_options&#39;:<br>
tls.c:329:5: warning: implicit declaration of function &#39;SSL_CTX_set_num=
_tickets&#39;; did you mean &#39;SSL_CTX_set_options&#39;? [-Wimplicit-func=
tion-declaration]<br>
=C2=A0 =C2=A0 =C2=A0SSL_CTX_set_num_tickets(tls_ctx, 0);<br>
=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0SSL_CTX_set_options<br>
<br>
<a href=3D"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.5.0-reln=
otes.txt" rel=3D"noreferrer" target=3D"_blank">https://ftp.openbsd.org/pub/=
OpenBSD/LibreSSL/libressl-3.5.0-relnotes.txt</a><br>
<a href=3D"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.5.1-reln=
otes.txt" rel=3D"noreferrer" target=3D"_blank">https://ftp.openbsd.org/pub/=
OpenBSD/LibreSSL/libressl-3.5.1-relnotes.txt</a><br>
<br>
Fixes:<br>
=C2=A0- <a href=3D"http://autobuild.buildroot.org/results/f5d36180949278510=
199aa499e253780558c6ffe" rel=3D"noreferrer" target=3D"_blank">http://autobu=
ild.buildroot.org/results/f5d36180949278510199aa499e253780558c6ffe</a><br>
<br>
Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmai=
l.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/libressl/libressl.hash | 2 +-<br>
=C2=A0package/libressl/<a href=3D"http://libressl.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">libressl.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.has=
h<br>
index e923998713..5474d8e537 100644<br>
--- a/package/libressl/libressl.hash<br>
+++ b/package/libressl/libressl.hash<br>
@@ -1,4 +1,4 @@<br>
=C2=A0# From <a href=3D"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256=
" rel=3D"noreferrer" target=3D"_blank">https://ftp.openbsd.org/pub/OpenBSD/=
LibreSSL/SHA256</a><br>
-sha256=C2=A0 ff88bffe354818b3ccf545e3cafe454c5031c7a77217074f533271d63c37f=
08d=C2=A0 libressl-3.4.3.tar.gz<br>
+sha256=C2=A0 a7d0026f67622275ec8f8239ded422a653d5ccc84df55dea2acd406017185=
608=C2=A0 libressl-3.5.1.tar.gz<br>
=C2=A0# Locally computed<br>
=C2=A0sha256=C2=A0 5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec=
6e5955b1=C2=A0 COPYING<br>
diff --git a/package/libressl/<a href=3D"http://libressl.mk" rel=3D"norefer=
rer" target=3D"_blank">libressl.mk</a> b/package/libressl/<a href=3D"http:/=
/libressl.mk" rel=3D"noreferrer" target=3D"_blank">libressl.mk</a><br>
index 0bb468cedb..81b0163b93 100644<br>
--- a/package/libressl/<a href=3D"http://libressl.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">libressl.mk</a><br>
+++ b/package/libressl/<a href=3D"http://libressl.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">libressl.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-LIBRESSL_VERSION =3D 3.4.3<br>
+LIBRESSL_VERSION =3D 3.5.1<br>
=C2=A0LIBRESSL_SITE =3D <a href=3D"https://ftp.openbsd.org/pub/OpenBSD/Libr=
eSSL" rel=3D"noreferrer" target=3D"_blank">https://ftp.openbsd.org/pub/Open=
BSD/LibreSSL</a><br>
=C2=A0LIBRESSL_LICENSE =3D ISC (new additions), OpenSSL or SSLeay (original=
 OpenSSL code)<br>
=C2=A0LIBRESSL_LICENSE_FILES =3D COPYING<br>
-- <br>
2.35.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000010baf05dc09f745--

--===============0349133275566272450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0349133275566272450==--
