Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EEEC54FC6
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 02:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEB2F60658;
	Thu, 29 Aug 2024 02:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2R7-slmOCrRv; Thu, 29 Aug 2024 02:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 903DF60ABA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 903DF60ABA;
	Thu, 29 Aug 2024 02:35:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 282001BF859
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 02:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2E24811A7
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 02:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PT4MAebuGfnr for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 02:35:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.48;
 helo=mail-ed1-f48.google.com; envelope-from=fede.evol@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 663E780D30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 663E780D30
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 663E780D30
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 02:35:13 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5bf006f37daso273245a12.1
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 19:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724898911; x=1725503711;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O87E9FAPHPRbycLlnC/I8IgNJsYVCMFuuXNBu7H4Uco=;
 b=hwMrarvsGnoP3fZqM1p0UZL1AVGIJrVHvwd8R5fTOpXRAiYSFuSMaprbpWYEwYkxD0
 VhPa1iXOFk/lMV7X9fFO+yY6C0bPp1hE33cTbZv50ZJlMdnpWGOkn7G5ntbq9d40eaq1
 d9G/YE2HY5pxo5SPwHnxwfaHQdthDBPHitsHb8PYZ46Z/3Hj9S+7QnZN+t5BpNcXgAkd
 pWftwv7gnz8/JJAVKwjX5rDhnXIFa3AHQRZi34Z54hSgR6u1m7O17Dh7A7uyPn8Hgufs
 4RSL/OxoPYM74I3DdNoSFC6T6H2HKm8Hgvq8X+Blj+xa9PKPmCUbWVsQEPsImjud0qRg
 xzcQ==
X-Gm-Message-State: AOJu0Yx2dDhbWHFney5hsV4NO4aLNPmKonNce/N56c4yZKuax87xxvO5
 e0drXc31fynEKYm6ak3Wy0gTT9VkUbyD2x19Rap4fGc5TqzP7FtoQDkYHH4F8ILLiFoui5Oi7L2
 nwS54iq+5fD4w9sjtv0zz2+1uvvmWxg==
X-Google-Smtp-Source: AGHT+IEZE/uJ030nXbRsmTe4lINCv2ADOagA2RSAtQcuxfBWTvdNVZvy99xOWMWPmw02sRfop5BUSF7YA48Gyb+uSVA=
X-Received: by 2002:a05:6402:3903:b0:5c2:1071:b0d7 with SMTP id
 4fb4d7f45d1cf-5c22019e041mr1080265a12.17.1724898910778; Wed, 28 Aug 2024
 19:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240829023115.8437-1-fede@evolware.org>
In-Reply-To: <20240829023115.8437-1-fede@evolware.org>
From: Federico Pellegrin <fede@evolware.org>
Date: Thu, 29 Aug 2024 04:34:59 +0200
Message-ID: <CAM6O0Zjq3bEnpWTLAEe5jTRooP+qXHo2Eqj2pOXPurOmw6Nr3Q@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=evolware.org
Subject: Re: [Buildroot] [PATCH 1/1] package/netsniff-ng: fix install when
 building in parallel
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
Content-Type: multipart/mixed; boundary="===============7156073427800549939=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7156073427800549939==
Content-Type: multipart/alternative; boundary="000000000000d9ba7b0620c952a6"

--000000000000d9ba7b0620c952a6
Content-Type: text/plain; charset="UTF-8"

Hi!
If it is not a big hassle (the netsniff-ng version is the same and so the
receipe and so on, so it shouldn't be hopefully) would be great if applied
also to LTS 2024.02.x branch.
Not sure if I'd need to do another request, let me know if so!

Thanks!
Federico


Il giorno gio 29 ago 2024 alle ore 04:31 Federico Pellegrin <
fede@evolware.org> ha scritto:

> When building in parallel, the package will randomly fail in
> install phase due to a missing make dependency.
>
> Already submitted and merged upstream:
> https://github.com/netsniff-ng/netsniff-ng/pull/239
>
> Signed-off-by: Federico Pellegrin <fede@evolware.org>
> ---
>  .../0002-Fix_post_install_deps.patch          | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/netsniff-ng/0002-Fix_post_install_deps.patch
>
> diff --git a/package/netsniff-ng/0002-Fix_post_install_deps.patch
> b/package/netsniff-ng/0002-Fix_post_install_deps.patch
> new file mode 100644
> index 0000000000..9ed0744491
> --- /dev/null
> +++ b/package/netsniff-ng/0002-Fix_post_install_deps.patch
> @@ -0,0 +1,46 @@
> +From 18e111e06f5eaf074f1c1e0cff79a0e72dce7590 Mon Sep 17 00:00:00 2001
> +From: Federico Pellegrin <fede@evolware.org>
> +Date: Wed, 28 Aug 2024 06:23:35 +0200
> +Subject: [PATCH] build: fix install dependencies in Makefile template
> +
> +post_install should execute after do_install otherwise when building
> +in parallel (-j) this leads to sporadic failures of trafgen stddef
> +header, since it is installed in do_install but then post_install
> +does a mv supposing it is already there, for example:
> +
> +```
> +  INST netsniff-ng/netsniff-ng
> +  INST trafgen/trafgen
> +mv: cannot stat '/tmp/a/pref/etc/netsniff-ng/trafgen_stddef.h': No such
> file or directory
> +make: *** [trafgen/Makefile:57: trafgen_post_install] Error 1
> +make: *** Waiting for unfinished jobs....
> +  INST netsniff-ng/netsniff-ng.8.gz
> +  INST trafgen/trafgen.8.gz
> +  INST ether.conf
> +  INST tcp.conf
> +  INST trafgen_stddef.h
> +```
> +
> +(it is visible above that the stddef.h is installed later than the post
> +is trying to move it away)
> +
> +Forcing the order of post after do will guarantee that it will be there
> +when it needs to be moved and it will be safe to do a parallel install.
> +Just relying on the ordering of the $(1)_install definition is wrong and
> +dependant on make version (and luck!).
> +---
> + Template | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Template b/Template
> +index 056f594a2..54b597291 100644
> +--- a/Template
> ++++ b/Template
> +@@ -12,6 +12,7 @@ define TOOL_templ
> +       $(Q)eval GZIP= gzip $(GZIP_ENV) $(1).8 > $(1)/$(1).8.gz
> +       $(Q)$$(call INST,$(1)/$(1).8.gz,$$(DESTDIR)$$(MAN8DIR))
> +       $(Q)$$(foreach file,$$($(1)-confs),$$(call
> INST,$$(file),$$(DESTDIR)$$(ETCDIRE));)
> ++  $(1)_post_install: $(1)_do_install
> +   $(1)_install: $(1)_do_install $(1)_post_install
> +   $(1)_uninstall: $(1)_uninstall_custom
> +       $(Q)$$(call RM,$$(DESTDIR)$$(SBINDIR)/$(1))
> --
> 2.46.0
>
>

--000000000000d9ba7b0620c952a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hi!</div><div>If it is not a big hassl=
e (the netsniff-ng version is the same and so the receipe and so on, so it =
shouldn&#39;t be hopefully) would be great if applied also to LTS 2024.02.x=
 branch.=C2=A0</div><div>Not sure if I&#39;d need to do another request, le=
t me know if so!</div><div><br></div><div>Thanks!</div><div>Federico</div><=
div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Il giorno gio 29 ago 2024 alle ore 04:31 Federico Pellegrin=
 &lt;<a href=3D"mailto:fede@evolware.org">fede@evolware.org</a>&gt; ha scri=
tto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When buildi=
ng in parallel, the package will randomly fail in<br>
install phase due to a missing make dependency.<br>
<br>
Already submitted and merged upstream:<br>
<a href=3D"https://github.com/netsniff-ng/netsniff-ng/pull/239" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/netsniff-ng/netsniff-ng/pull/2=
39</a><br>
<br>
Signed-off-by: Federico Pellegrin &lt;<a href=3D"mailto:fede@evolware.org" =
target=3D"_blank">fede@evolware.org</a>&gt;<br>
---<br>
=C2=A0.../0002-Fix_post_install_deps.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 46 +++++++++++++++++++<br>
=C2=A01 file changed, 46 insertions(+)<br>
=C2=A0create mode 100644 package/netsniff-ng/0002-Fix_post_install_deps.pat=
ch<br>
<br>
diff --git a/package/netsniff-ng/0002-Fix_post_install_deps.patch b/package=
/netsniff-ng/0002-Fix_post_install_deps.patch<br>
new file mode 100644<br>
index 0000000000..9ed0744491<br>
--- /dev/null<br>
+++ b/package/netsniff-ng/0002-Fix_post_install_deps.patch<br>
@@ -0,0 +1,46 @@<br>
+From 18e111e06f5eaf074f1c1e0cff79a0e72dce7590 Mon Sep 17 00:00:00 2001<br>
+From: Federico Pellegrin &lt;<a href=3D"mailto:fede@evolware.org" target=
=3D"_blank">fede@evolware.org</a>&gt;<br>
+Date: Wed, 28 Aug 2024 06:23:35 +0200<br>
+Subject: [PATCH] build: fix install dependencies in Makefile template<br>
+<br>
+post_install should execute after do_install otherwise when building<br>
+in parallel (-j) this leads to sporadic failures of trafgen stddef<br>
+header, since it is installed in do_install but then post_install<br>
+does a mv supposing it is already there, for example:<br>
+<br>
+```<br>
+=C2=A0 INST netsniff-ng/netsniff-ng<br>
+=C2=A0 INST trafgen/trafgen<br>
+mv: cannot stat &#39;/tmp/a/pref/etc/netsniff-ng/trafgen_stddef.h&#39;: No=
 such file or directory<br>
+make: *** [trafgen/Makefile:57: trafgen_post_install] Error 1<br>
+make: *** Waiting for unfinished jobs....<br>
+=C2=A0 INST netsniff-ng/netsniff-ng.8.gz<br>
+=C2=A0 INST trafgen/trafgen.8.gz<br>
+=C2=A0 INST ether.conf<br>
+=C2=A0 INST tcp.conf<br>
+=C2=A0 INST trafgen_stddef.h<br>
+```<br>
+<br>
+(it is visible above that the stddef.h is installed later than the post<br=
>
+is trying to move it away)<br>
+<br>
+Forcing the order of post after do will guarantee that it will be there<br=
>
+when it needs to be moved and it will be safe to do a parallel install.<br=
>
+Just relying on the ordering of the $(1)_install definition is wrong and<b=
r>
+dependant on make version (and luck!).<br>
+---<br>
+ Template | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/Template b/Template<br>
+index 056f594a2..54b597291 100644<br>
+--- a/Template<br>
++++ b/Template<br>
+@@ -12,6 +12,7 @@ define TOOL_templ<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)eval GZIP=3D gzip $(GZIP_ENV) $(1).8 &gt; $=
(1)/$(1).8.gz<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$$(call INST,$(1)/$(1).8.gz,$$(DESTDIR)$$(M=
AN8DIR))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$$(foreach file,$$($(1)-confs),$$(call INST=
,$$(file),$$(DESTDIR)$$(ETCDIRE));)<br>
++=C2=A0 $(1)_post_install: $(1)_do_install<br>
+=C2=A0 =C2=A0$(1)_install: $(1)_do_install $(1)_post_install<br>
+=C2=A0 =C2=A0$(1)_uninstall: $(1)_uninstall_custom<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$$(call RM,$$(DESTDIR)$$(SBINDIR)/$(1))<br>
-- <br>
2.46.0<br>
<br>
</blockquote></div>

--000000000000d9ba7b0620c952a6--

--===============7156073427800549939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7156073427800549939==--
