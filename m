Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A305CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 16:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AB06400B8;
	Mon,  2 Sep 2024 16:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDv-PTNEuAZz; Mon,  2 Sep 2024 16:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B82440291
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B82440291;
	Mon,  2 Sep 2024 16:06:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD7A1BF38E
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C1F780D54
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uq9s9T2fPR8o for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 16:06:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.54;
 helo=mail-lf1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B764480C7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B764480C7C
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B764480C7C
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 16:06:50 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-533463f6b16so5592731e87.1
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 09:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725293208; x=1725898008;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H4uf7oilMoS5Mc4lPAm/oy9+tAWChBPQ0ANQTC8sxQg=;
 b=nprGewNlv8ktKnb+po0qO6SWppXsNqFt7tGqSAHUq5VJ6PCH0A8Vewo5zvEiP5NeNs
 7PPZmjFuEzWQHpmoQSjjz2FdD+BMq5heaKrGHSjzGklji6//IOblZURV30cMGthvW5qp
 R30md9HT9kP0vtKyBezwndjhq7OqkIcIFu6h36qw5EDC8F47OlBqHdBF01iyumSNNHiV
 D6olcP7bjNYT4NYYxSs7IBerzF7jhTjld2WpXM4F+hqamiiA0PvDaRKzMDBTr4phcoiT
 DXSSw/cZiZkysOefIzmSZ51Aif/bryN0Dl/mk5BNEOgyZCUd+TX0AznicBFd4Bhkk9/x
 Lw9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX61Z71njE8DHzdNJUhLs4QtHSi0UsFKHisvZcWfatSDypLbkW/Xci77vS4fE4yY23ne7E/JukxvPM=@buildroot.org
X-Gm-Message-State: AOJu0Yzj9o7m1HIm9CI137n7MSXtXGikpQU0q8fnGEMjH2UbR/vTS2F0
 op8h96YgI5kiKTylGEuyfUwKFc1sy7TZqusX7a7VNgmiFkmyeJbBF0/6DW+Bul8=
X-Google-Smtp-Source: AGHT+IEmCdRanUWi7DTGisD3jtvd/mnAmCiUalrE56hrw53yeGgE7krNPJnm/JpH2V/3QVE6y1JBjQ==
X-Received: by 2002:ac2:4c54:0:b0:533:455c:8a49 with SMTP id
 2adb3069b0e04-53546b91324mr7751544e87.38.1725293207691; 
 Mon, 02 Sep 2024 09:06:47 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354084dcd3sm1654137e87.262.2024.09.02.09.06.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 09:06:45 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5353cd18c20so5222933e87.0
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 09:06:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVsC8BSSIcUehdCewG9O8SqdCAXJfdf3KrA0c4EDfPKPTaiCb1bUhQK+bUOz8poGV03t7lqTk3Yo8I=@buildroot.org
X-Received: by 2002:a05:6512:31d0:b0:52f:c5c0:2879 with SMTP id
 2adb3069b0e04-53546b90cd5mr7439702e87.41.1725293205484; Mon, 02 Sep 2024
 09:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240829131232.2132854-2-thomas@devoogdt.com>
 <20240901121122.3113482-1-thomas@devoogdt.com>
 <ZtXcn-Jkl40CoZ5k@landeda>
In-Reply-To: <ZtXcn-Jkl40CoZ5k@landeda>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 2 Sep 2024 18:06:33 +0200
X-Gmail-Original-Message-ID: <CACXRmJgZSHFDjdsR8hVF1jE+SU=Ske20F2RLts5zLHjzBY8QVw@mail.gmail.com>
Message-ID: <CACXRmJgZSHFDjdsR8hVF1jE+SU=Ske20F2RLts5zLHjzBY8QVw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: restore libsoup
 support
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2421303096739586841=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2421303096739586841==
Content-Type: multipart/alternative; boundary="000000000000a5871f062125209f"

--000000000000a5871f062125209f
Content-Type: text/plain; charset="UTF-8"

Hi,

Libsoup2 is still supported by webkitgtk, so having support makes sense.
But given the fact that no complain arose since the bump to libsoup3, I
doubt the usage of it. So if someone really need it, then that person can
reply on this patch as well I guess.

Kr,

Thomas

Op ma 2 sep. 2024 17:41 schreef Yann E. MORIN <yann.morin.1998@free.fr>:

> Thomas, All,
>
> On 2024-09-01 14:11 +0200, Thomas Devoogdt spake thusly:
> > The midori browser still uses libsoup and was broken since commit
> > 38a098df133aaa2ebf09742054b02db5a44f58e5. This commit allows the
> > use of libsoup, libsoup3 stays the default.
> >
> > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> > ---
> > This is a bit a replacement for
> https://patchwork.ozlabs.org/project/buildroot/patch/20240829131232.2132854-2-thomas@devoogdt.com/
> .
> > I don't use midori or libsoup2, and it's still not maintained, so it's
> also fine to accept the other commit and drop midori altogether.
>
> In the end, I applied the patch removing midori.
>
> And apart for midori, does it make sense to restore using libsoup at
> all, or should we drop this patch and keep only libsoup3?
>
> Thanks!
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/webkitgtk/Config.in    | 11 ++++++-----
> >  package/webkitgtk/webkitgtk.mk | 12 ++++++++++--
> >  2 files changed, 16 insertions(+), 7 deletions(-)
> >
> > diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> > index a556fec194..5f9c24d610 100644
> > --- a/package/webkitgtk/Config.in
> > +++ b/package/webkitgtk/Config.in
> > @@ -33,9 +33,9 @@ config BR2_PACKAGE_WEBKITGTK
> >       depends on BR2_PACKAGE_HAS_LIBEGL
> >       depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
> >       depends on BR2_INSTALL_LIBSTDCPP
> > -     depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu,
> libsoup/libsoup3
> >       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
> > -     depends on BR2_USE_WCHAR # icu, libsoup3
> > +     depends on BR2_USE_WCHAR # icu, libsoup/libsoup3
> >       depends on BR2_PACKAGE_LIBGTK3 || BR2_PACKAGE_LIBGTK4
> >       depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
> >       select BR2_PACKAGE_CAIRO
> > @@ -47,7 +47,7 @@ config BR2_PACKAGE_WEBKITGTK
> >       select BR2_PACKAGE_LIBEPOXY
> >       select BR2_PACKAGE_LIBGCRYPT
> >       select BR2_PACKAGE_LIBSECRET
> > -     select BR2_PACKAGE_LIBSOUP3
> > +     select BR2_PACKAGE_LIBSOUP3 if !BR2_PACKAGE_LIBSOUP
> >       select BR2_PACKAGE_LIBTASN1
> >       select BR2_PACKAGE_LIBXML2
> >       select BR2_PACKAGE_LIBXSLT
> > @@ -100,9 +100,10 @@ comment "sandboxing support needs a toolchain w/
> headers >= 3.12"
> >
> >  config BR2_PACKAGE_WEBKITGTK_HTTPS
> >       bool "HTTPS support"
> > -     depends on !BR2_STATIC_LIBS # libsoup3 -> glib-networking, gnutls
> > +     depends on !BR2_STATIC_LIBS # libsoup/libsoup3 -> glib-networking,
> gnutls
> >       select BR2_PACKAGE_CA_CERTIFICATES # runtime
> > -     select BR2_PACKAGE_LIBSOUP3_SSL
> > +     select BR2_PACKAGE_LIBSOUP_SSL if BR2_PACKAGE_LIBSOUP
> > +     select BR2_PACKAGE_LIBSOUP3_SSL if BR2_PACKAGE_LIBSOUP3
> >       help
> >         Enable HTTPS protocol support.
> >
> > diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/
> webkitgtk.mk
> > index ff39ee01e1..af49aad96e 100644
> > --- a/package/webkitgtk/webkitgtk.mk
> > +++ b/package/webkitgtk/webkitgtk.mk
> > @@ -14,8 +14,8 @@ WEBKITGTK_LICENSE_FILES = \
> >       Source/WebCore/LICENSE-LGPL-2.1
> >  WEBKITGTK_CPE_ID_VENDOR = webkitgtk
> >  WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef
> \
> > -     enchant harfbuzz icu jpeg libegl libepoxy libgcrypt libsecret \
> > -     libsoup3 libtasn1 libxml2 libxslt sqlite webp woff2
> > +     enchant harfbuzz icu jpeg libegl libepoxy libgcrypt libsecret
> libtasn1 \
> > +     libxml2 libxslt sqlite webp woff2
> >
> >  WEBKITGTK_CMAKE_BACKEND = ninja
> >
> > @@ -31,6 +31,14 @@ WEBKITGTK_CONF_OPTS = \
> >       -DUSE_LIBHYPHEN=OFF \
> >       -DUSE_WOFF2=ON
> >
> > +ifeq ($(BR2_PACKAGE_LIBSOUP),y)
> > +WEBKITGTK_CONF_OPTS += -DUSE_SOUP2=ON
> > +WEBKITGTK_DEPENDENCIES += libsoup
> > +else
> > +WEBKITGTK_CONF_OPTS += -DUSE_SOUP2=OFF
> > +WEBKITGTK_DEPENDENCIES += libsoup3
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_LIBGTK4),y)
> >  WEBKITGTK_CONF_OPTS += -DUSE_GTK4=ON
> >  WEBKITGTK_DEPENDENCIES += libgtk4
> > --
> > 2.43.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
>

--000000000000a5871f062125209f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi,</p>
<p dir=3D"ltr">Libsoup2 is still supported by webkitgtk, so having support =
makes sense. But given the fact that no complain arose since the bump to li=
bsoup3, I doubt the usage of it. So if someone really need it, then that pe=
rson can reply on this patch as well I guess.</p>
<p dir=3D"ltr">Kr,</p>
<p dir=3D"ltr">Thomas </p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Op ma =
2 sep. 2024 17:41 schreef Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.19=
98@free.fr">yann.morin.1998@free.fr</a>&gt;:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Thomas, All,<br>
<br>
On 2024-09-01 14:11 +0200, Thomas Devoogdt spake thusly:<br>
&gt; The midori browser still uses libsoup and was broken since commit<br>
&gt; 38a098df133aaa2ebf09742054b02db5a44f58e5. This commit allows the<br>
&gt; use of libsoup, libsoup3 stays the default.<br>
&gt; <br>
&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoogdt.c=
om" target=3D"_blank" rel=3D"noreferrer">thomas@devoogdt.com</a>&gt;<br>
&gt; ---<br>
&gt; This is a bit a replacement for <a href=3D"https://patchwork.ozlabs.or=
g/project/buildroot/patch/20240829131232.2132854-2-thomas@devoogdt.com/" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/=
project/buildroot/patch/20240829131232.2132854-2-thomas@devoogdt.com/</a>.<=
br>
&gt; I don&#39;t use midori or libsoup2, and it&#39;s still not maintained,=
 so it&#39;s also fine to accept the other commit and drop midori altogethe=
r.<br>
<br>
In the end, I applied the patch removing midori.<br>
<br>
And apart for midori, does it make sense to restore using libsoup at<br>
all, or should we drop this patch and keep only libsoup3?<br>
<br>
Thanks!<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 package/webkitgtk/Config.in=C2=A0 =C2=A0 | 11 ++++++-----<br>
&gt;=C2=A0 package/webkitgtk/<a href=3D"http://webkitgtk.mk" rel=3D"norefer=
rer noreferrer" target=3D"_blank">webkitgtk.mk</a> | 12 ++++++++++--<br>
&gt;=C2=A0 2 files changed, 16 insertions(+), 7 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in=
<br>
&gt; index a556fec194..5f9c24d610 100644<br>
&gt; --- a/package/webkitgtk/Config.in<br>
&gt; +++ b/package/webkitgtk/Config.in<br>
&gt; @@ -33,9 +33,9 @@ config BR2_PACKAGE_WEBKITGTK<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HAS_LIBEGL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, =
host-ruby<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
&gt; -=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, i=
cu, libsoup3<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, i=
cu, libsoup/libsoup3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10<br>
&gt; -=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # icu, libsoup3<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_WCHAR # icu, libsoup/libsoup3<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBGTK3 || BR2_PACKAG=
E_LIBGTK4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPOR=
TS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_CAIRO<br>
&gt; @@ -47,7 +47,7 @@ config BR2_PACKAGE_WEBKITGTK<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBEPOXY<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBGCRYPT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBSECRET<br>
&gt; -=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBSOUP3<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBSOUP3 if !BR2_PACKAGE_LIBSO=
UP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBTASN1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBXML2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBXSLT<br>
&gt; @@ -100,9 +100,10 @@ comment &quot;sandboxing support needs a toolchai=
n w/ headers &gt;=3D 3.12&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 config BR2_PACKAGE_WEBKITGTK_HTTPS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;HTTPS support&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # libsoup3 -&gt; glib=
-networking, gnutls<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # libsoup/libsoup3 -&=
gt; glib-networking, gnutls<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_CA_CERTIFICATES # runtime=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBSOUP3_SSL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBSOUP_SSL if BR2_PACKAGE_LIB=
SOUP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LIBSOUP3_SSL if BR2_PACKAGE_LI=
BSOUP3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable HTTPS protocol support.<br>
&gt;=C2=A0 <br>
&gt; diff --git a/package/webkitgtk/<a href=3D"http://webkitgtk.mk" rel=3D"=
noreferrer noreferrer" target=3D"_blank">webkitgtk.mk</a> b/package/webkitg=
tk/<a href=3D"http://webkitgtk.mk" rel=3D"noreferrer noreferrer" target=3D"=
_blank">webkitgtk.mk</a><br>
&gt; index ff39ee01e1..af49aad96e 100644<br>
&gt; --- a/package/webkitgtk/<a href=3D"http://webkitgtk.mk" rel=3D"norefer=
rer noreferrer" target=3D"_blank">webkitgtk.mk</a><br>
&gt; +++ b/package/webkitgtk/<a href=3D"http://webkitgtk.mk" rel=3D"norefer=
rer noreferrer" target=3D"_blank">webkitgtk.mk</a><br>
&gt; @@ -14,8 +14,8 @@ WEBKITGTK_LICENSE_FILES =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Source/WebCore/LICENSE-LGPL-2.1<br>
&gt;=C2=A0 WEBKITGTK_CPE_ID_VENDOR =3D webkitgtk<br>
&gt;=C2=A0 WEBKITGTK_DEPENDENCIES =3D host-ruby host-python3 host-gperf hos=
t-unifdef \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0enchant harfbuzz icu jpeg libegl libepoxy libgcry=
pt libsecret \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0libsoup3 libtasn1 libxml2 libxslt sqlite webp wof=
f2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enchant harfbuzz icu jpeg libegl libepoxy libgcry=
pt libsecret libtasn1 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0libxml2 libxslt sqlite webp woff2<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 WEBKITGTK_CMAKE_BACKEND =3D ninja<br>
&gt;=C2=A0 <br>
&gt; @@ -31,6 +31,14 @@ WEBKITGTK_CONF_OPTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DUSE_LIBHYPHEN=3DOFF \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DUSE_WOFF2=3DON<br>
&gt;=C2=A0 <br>
&gt; +ifeq ($(BR2_PACKAGE_LIBSOUP),y)<br>
&gt; +WEBKITGTK_CONF_OPTS +=3D -DUSE_SOUP2=3DON<br>
&gt; +WEBKITGTK_DEPENDENCIES +=3D libsoup<br>
&gt; +else<br>
&gt; +WEBKITGTK_CONF_OPTS +=3D -DUSE_SOUP2=3DOFF<br>
&gt; +WEBKITGTK_DEPENDENCIES +=3D libsoup3<br>
&gt; +endif<br>
&gt; +<br>
&gt;=C2=A0 ifeq ($(BR2_PACKAGE_LIBGTK4),y)<br>
&gt;=C2=A0 WEBKITGTK_CONF_OPTS +=3D -DUSE_GTK4=3DON<br>
&gt;=C2=A0 WEBKITGTK_DEPENDENCIES +=3D libgtk4<br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"no=
referrer">buildroot@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=
=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
<br>
</blockquote></div>

--000000000000a5871f062125209f--

--===============2421303096739586841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2421303096739586841==--
