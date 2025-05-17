Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAECC3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8F8780F01;
	Sat, 17 May 2025 10:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIy4HvfdkvXQ; Sat, 17 May 2025 10:42:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9565C81836
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9565C81836;
	Sat, 17 May 2025 10:42:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 217F81DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DEA940718
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvLjFB1vOng8 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:42:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C27D840836
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C27D840836
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C27D840836
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:42:21 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e753fcae65eso383746276.2
 for <buildroot@buildroot.org>; Sat, 17 May 2025 03:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747478540; x=1748083340;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vjqX8YQEWLR/V0nYVcQN0nlbWfjBpV2NqHY0Wi21DMo=;
 b=rD5Ie6G/QGuA0CJqmlbtB/1FCGNbeeHKIerZNU3GITmlOo7laufyTTkZujaLkgEWhe
 tiWAakkMQJVMXnVWbhttAiCN3rVz5OYKZAJF+y2QuKDLqkul6VbvlDDay+xRM11LX1wJ
 hHh8WVU2nnIaU056vlZsN+ZCLBov5ArUJq+oUitYeTgwr63EKdVjxFmNiDS5q9ujZWwJ
 nvMy0nXCJgs7TchAn4EuHOWX9TGMM5Nv8zI6FRC5lsiX7P72gZfTYxOtX3qjj8Km44UQ
 x88HTfJixxb6CcLoVmV56PJtoJfYic6tltovdwdxhGQmSta7BqfjjWMgHhCYf8wLhOnz
 YCgQ==
X-Gm-Message-State: AOJu0YxXPowBO3ioSR7mnXBPxBR1iQvdlg9quF0J2m1DmS8Yvc800hXT
 exbodETCmbNaKC88kkg2yJBJ4Qct19J1NV6Z3+VAG/Iqg3+C+4Hw6FYED00BZLv/FOGXo1XButC
 KFkzHzh/gJV8Erm69H6IS+Q3ljfxYvdF31jSqv9A=
X-Gm-Gg: ASbGnculo7lHi1oSV0wwGQ5CB+OfgRiBuCLiWA9g7EsgoJVXCoCZPfH17y0khm2ORn3
 3twFyEO6quJus1MzoS13Wz6U1QAhizrv80lAFDP6qdT2xF7nxYNqeOaB7XCbIgpmoP2AS5gFaRQ
 ow0t2JAF9mHT0KI3t90fE+L85eB7/oLxA=
X-Google-Smtp-Source: AGHT+IGy/IgxS31K6D1rzFCrEb2dRCwVYSRB/MmYdEgwGESmdxJkBNjEIq6et/IuT330vZbYoUNyzqYQN1lunsAZ13o=
X-Received: by 2002:a05:690c:6c03:b0:6ef:5c7c:839a with SMTP id
 00721157ae682-70ca79e118cmr44742247b3.3.1747478540374; Sat, 17 May 2025
 03:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250426075000.314807-1-zik@jambula.net>
 <20250517115001.720af8ad@windsurf>
In-Reply-To: <20250517115001.720af8ad@windsurf>
From: Joseph Zikusooka <josephzik@gmail.com>
Date: Sat, 17 May 2025 13:42:08 +0300
X-Gm-Features: AX0GCFsdC54kNamqz01yusMrNnHMziHtA8o4VVPqJPCENn4GGmjtqI-Zb7cK63c
Message-ID: <CAPWx8vv_+AJjGKgTHqbiXuKYmTVHektNfdF=r-YN7ANhv52o0g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, "Joseph Zikusooka (ZIK)" <zik@jambula.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747478540; x=1748083340; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vjqX8YQEWLR/V0nYVcQN0nlbWfjBpV2NqHY0Wi21DMo=;
 b=Jb+gr0Eg31QV4PXNfKKO+bZ2DbMUMi5Or7ZEy7oXvk3OUl43YkoJf4itG43KKfOPN4
 AHYpWMIiinjdQK4YNML4ANHVlpxjVKIDPn6AoRIbp1LBEq/MQbFeA4s6k25HuojYsnZt
 hjvxEmcUqyWuYol5hhZfXEFrX3YhGaG7Mux6egAOkVzt4d3E4K5HCf81B+DAKf1WJMgk
 rWKykMzIMl9sk/MiIHk3XItrEvjekW1t2ZUVD3prEmhjyOgjmOL3a9ToP+UgWFJx+QMk
 9st90j4NSYWf1ZOO5uKqySLplJOw+4Tlkieb/Jmy0BXXIctEFigS0Z6x90Y9SPORLMCC
 jQ8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jb+gr0Eg
Subject: Re: [Buildroot] [PATCH] Kea: new package - kea version 2.6.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8393226752540692659=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8393226752540692659==
Content-Type: multipart/alternative; boundary="000000000000a6da820635528d27"

--000000000000a6da820635528d27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thank you very much for taking the time to review my patch and provide such
detailed and helpful feedback. I truly appreciate your thorough comments
and suggestions. I will address all the points you raised and update the
patch accordingly. Once the necessary changes are made, I will submit a
revised version. Thanks again,

Joseph Zik

On Sat, May 17, 2025 at 12:50=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Joseph,
>
> Thanks for your contribution! See below a number of comments.
>
> On Sat, 26 Apr 2025 10:50:00 +0300
> "Joseph Zikusooka (ZIK)" <josephzik@gmail.com> wrote:
>
> > Add Kea, an open-source Dynamic Host Configuration Protocol (DHCP)
> > server developed by the Internet Systems Consortium (ISC).
> > It's designed to provide dynamic IP address allocation and
> > configuration for devices on a network. Kea is known for its
> > modular architecture, allowing for easy extension and integration
> > with other services.
> >
> > Supersedes: a015291dc94b5497ac1fd60a2e4cf84fe3c82cb5
>
> This is missing your Signed-off-by line, so unfortunately, we can't
> apply it.
>
> This "Supersedes:" line doesn't make sense, because
> a015291dc94b5497ac1fd60a2e4cf84fe3c82cb5 isn't a reference that is
> meaningful.
>
> Also, the commit title should be:
>
>         package/kea: new package
>
> >  package/kea/Config.in | 17 +++++++++++++++++
> >  package/kea/kea.hash  |  3 +++
> >  package/kea/kea.mk    | 22 ++++++++++++++++++++++
> >  3 files changed, 42 insertions(+)
>
> You need to add an entry in the DEVELOPERS file.
>
> > diff --git a/package/kea/Config.in b/package/kea/Config.in
> > new file mode 100644
> > index 0000000000..1b3bbe2e50
> > --- /dev/null
> > +++ b/package/kea/Config.in
> > @@ -0,0 +1,17 @@
> > +config BR2_PACKAGE_KEA
> > +
>
> This empty line shouldn't be there.
>
> > +     bool "kea"
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
> > +     depends on BR2_USE_MMU
>
> Indicate in a comment why those dependencies are present.
>
> > +     select BR2_PACKAGE_BOOST
>
> Boost also depends on BR2_INSTALL_LIBSTDCPP.
>
> > +     select BR2_PACKAGE_OPENSSL
> > +     select BR2_PACKAGE_LOG4CPLUS
>
> This one depends on a lot of stuff:
>
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_USE_WCHAR
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>         depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
>
> So basically, you should have:
>
>         depends on BR2_INSTALL_LIBSTDCPP # boost, log4cplus
>         depends on BR2_USE_WCHAR # log4cplus, boost
>         depends on BR2_TOOLCHAIN_HAS_THREADS # log4cplus, boost
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # log4cplus
>         depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # log4cplus
>
> I'm not sure where your BR2_USE_MMU dependencies comes from. Maybe from
> the kea code itself?
>
> > +     help
> > +       DHCP implementation from Internet Systems Consortium, Inc. that
> features fully
> > +       functional DHCPv4, DHCPv6 and Dynamic DNS servers.
> > +       Both DHCP servers fully support server discovery, address
> assignment, renewal,
> > +       rebinding and release. The DHCPv6 server supports prefix
> delegation. Both
> > +       servers support DNS Update mechanism, using stand-alone DDNS
> daemon
>
> Please wrap at 72 columns. Run "make check-package" to check the coding
> style.
>
> > +          https://www.isc.org/kea
>
> You also need a Config.in comment to explain the dependencies. Along
> the lines of:
>
> comment "kea needs a toolchain w/ C++, wchar, threads, gcc >=3D 4.8"
>         depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>                 !BR2_TOOLCHAIN_HAS_THREADS ||
> !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>
> comment "kea needs a toolchain not affected by GCC bug 64735"
>         depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
>
> > diff --git a/package/kea/kea.mk b/package/kea/kea.mk
> > new file mode 100644
> > index 0000000000..d589d2c1c2
> > --- /dev/null
> > +++ b/package/kea/kea.mk
> > @@ -0,0 +1,22 @@
> >
> +########################################################################=
########
> > +#
> > +# kea
> > +#
> >
> +########################################################################=
########
> > +
> > +KEA_VERSION =3D 2.6.2
> > +KEA_SOURCE =3D kea-$(KEA_VERSION).tar.gz
> > +KEA_SITE =3D
> https://dl.cloudsmith.io/public/isc/kea-2-6/raw/versions/$(KEA_VERSION)
> > +KEA_LICENSE =3D MPL 2.0
> > +KEA_LICENSE_FILES =3D COPYING
> > +
> > +KEA_DEPENDENCIES =3D host-pkgconf openssl boost log4cplus
> > +
> > +KEA_CONF_OPTS =3D "--with-openssl=3D$(STAGING_DIR)/usr"
> > +KEA_CONF_OPTS =3D "--with-log4cplus=3D$(STAGING_DIR)/usr"
> > +#KEA_CONF_OPTS =3D "--with-boost-include=3D$(STAGING_DIR)/usr"
>
> Comment lines are weird, if it's not needed, drop it. Also please write
> this like this:
>
> KEA_CONF_OPTS =3D \
>         --with-openssl=3D$(STAGING_DIR)/usr \
>         --with-log4cplus=3D$(STAGING_DIR)/usr
>
> > +KEA_INSTALL_STAGING =3D YES
> > +KEA_INSTALL_TARGET =3D YES
>
> KEA_INSTALL_TARGET =3D YES is definitely not needed, as it's the default.
>
> Why is KEA_INSTALL_STAGING =3D YES needed? Is kea installing some
> libraries?
>
> Could you fix those different issues, and come back with an updated
> patch? Make sure to name it [PATCH v2], and provide a changelog. See
> https://buildroot.org/downloads/manual/manual.html#submitting-patches
> for some good description on how to contribute.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>


--=20
Joseph Zikusooka

--000000000000a6da820635528d27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas,<br><br>Thank you very much for taking the time =
to review my patch and provide such detailed and helpful feedback. I truly =
appreciate your thorough comments and suggestions. I will address all the p=
oints you raised and update the patch accordingly. Once the necessary chang=
es are made, I will submit a revised version. Thanks again,<br><br>Joseph Z=
ik</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, May 17, 2025 at 12:50=E2=80=AFPM Thomas Pet=
azzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni=
@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hello Joseph,<br>
<br>
Thanks for your contribution! See below a number of comments.<br>
<br>
On Sat, 26 Apr 2025 10:50:00 +0300<br>
&quot;Joseph Zikusooka (ZIK)&quot; &lt;<a href=3D"mailto:josephzik@gmail.co=
m" target=3D"_blank">josephzik@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Add Kea, an open-source Dynamic Host Configuration Protocol (DHCP)<br>
&gt; server developed by the Internet Systems Consortium (ISC).<br>
&gt; It&#39;s designed to provide dynamic IP address allocation and<br>
&gt; configuration for devices on a network. Kea is known for its<br>
&gt; modular architecture, allowing for easy extension and integration<br>
&gt; with other services.<br>
&gt; <br>
&gt; Supersedes: a015291dc94b5497ac1fd60a2e4cf84fe3c82cb5<br>
<br>
This is missing your Signed-off-by line, so unfortunately, we can&#39;t<br>
apply it.<br>
<br>
This &quot;Supersedes:&quot; line doesn&#39;t make sense, because<br>
a015291dc94b5497ac1fd60a2e4cf84fe3c82cb5 isn&#39;t a reference that is<br>
meaningful.<br>
<br>
Also, the commit title should be:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/kea: new package<br>
<br>
&gt;=C2=A0 package/kea/Config.in | 17 +++++++++++++++++<br>
&gt;=C2=A0 package/kea/kea.hash=C2=A0 |=C2=A0 3 +++<br>
&gt;=C2=A0 package/kea/<a href=3D"http://kea.mk" rel=3D"noreferrer" target=
=3D"_blank">kea.mk</a>=C2=A0 =C2=A0 | 22 ++++++++++++++++++++++<br>
&gt;=C2=A0 3 files changed, 42 insertions(+)<br>
<br>
You need to add an entry in the DEVELOPERS file.<br>
<br>
&gt; diff --git a/package/kea/Config.in b/package/kea/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1b3bbe2e50<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/kea/Config.in<br>
&gt; @@ -0,0 +1,17 @@<br>
&gt; +config BR2_PACKAGE_KEA<br>
&gt; +<br>
<br>
This empty line shouldn&#39;t be there.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;kea&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU<br>
<br>
Indicate in a comment why those dependencies are present.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_BOOST<br>
<br>
Boost also depends on BR2_INSTALL_LIBSTDCPP.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_OPENSSL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_LOG4CPLUS<br>
<br>
This one depends on a lot of stuff:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_INSTALL_LIBSTDCPP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_USE_WCHAR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_THREADS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++=
11<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # s=
td::future<br>
<br>
So basically, you should have:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_INSTALL_LIBSTDCPP # boost, log4c=
plus<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_USE_WCHAR # log4cplus, boost<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_THREADS # log4cplu=
s, boost<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # log=
4cplus<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # l=
og4cplus<br>
<br>
I&#39;m not sure where your BR2_USE_MMU dependencies comes from. Maybe from=
<br>
the kea code itself?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DHCP implementation from Internet Systems =
Consortium, Inc. that features fully<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0functional DHCPv4, DHCPv6 and Dynamic DNS =
servers.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Both DHCP servers fully support server dis=
covery, address assignment, renewal,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rebinding and release. The DHCPv6 server s=
upports prefix delegation. Both<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0servers support DNS Update mechanism, usin=
g stand-alone DDNS daemon<br>
<br>
Please wrap at 72 columns. Run &quot;make check-package&quot; to check the =
coding<br>
style.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://www.isc.org/kea=
" rel=3D"noreferrer" target=3D"_blank">https://www.isc.org/kea</a><br>
<br>
You also need a Config.in comment to explain the dependencies. Along<br>
the lines of:<br>
<br>
comment &quot;kea needs a toolchain w/ C++, wchar, threads, gcc &gt;=3D 4.8=
&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_W=
CHAR || \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !BR2_TOOLCHAIN_HAS_=
THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8<br>
<br>
comment &quot;kea needs a toolchain not affected by GCC bug 64735&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735<br>
<br>
&gt; diff --git a/package/kea/<a href=3D"http://kea.mk" rel=3D"noreferrer" =
target=3D"_blank">kea.mk</a> b/package/kea/<a href=3D"http://kea.mk" rel=3D=
"noreferrer" target=3D"_blank">kea.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d589d2c1c2<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/kea/<a href=3D"http://kea.mk" rel=3D"noreferrer" target=
=3D"_blank">kea.mk</a><br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# kea<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +KEA_VERSION =3D 2.6.2<br>
&gt; +KEA_SOURCE =3D kea-$(KEA_VERSION).tar.gz<br>
&gt; +KEA_SITE =3D <a href=3D"https://dl.cloudsmith.io/public/isc/kea-2-6/r=
aw/versions/$(KEA_VERSION)" rel=3D"noreferrer" target=3D"_blank">https://dl=
.cloudsmith.io/public/isc/kea-2-6/raw/versions/$(KEA_VERSION)</a><br>
&gt; +KEA_LICENSE =3D MPL 2.0<br>
&gt; +KEA_LICENSE_FILES =3D COPYING<br>
&gt; +<br>
&gt; +KEA_DEPENDENCIES =3D host-pkgconf openssl boost log4cplus<br>
&gt; +<br>
&gt; +KEA_CONF_OPTS =3D &quot;--with-openssl=3D$(STAGING_DIR)/usr&quot; <br=
>
&gt; +KEA_CONF_OPTS =3D &quot;--with-log4cplus=3D$(STAGING_DIR)/usr&quot;<b=
r>
&gt; +#KEA_CONF_OPTS =3D &quot;--with-boost-include=3D$(STAGING_DIR)/usr&qu=
ot;<br>
<br>
Comment lines are weird, if it&#39;s not needed, drop it. Also please write=
<br>
this like this:<br>
<br>
KEA_CONF_OPTS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-openssl=3D$(STAGING_DIR)/usr \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-log4cplus=3D$(STAGING_DIR)/usr<br>
<br>
&gt; +KEA_INSTALL_STAGING =3D YES<br>
&gt; +KEA_INSTALL_TARGET =3D YES<br>
<br>
KEA_INSTALL_TARGET =3D YES is definitely not needed, as it&#39;s the defaul=
t.<br>
<br>
Why is KEA_INSTALL_STAGING =3D YES needed? Is kea installing some<br>
libraries?<br>
<br>
Could you fix those different issues, and come back with an updated<br>
patch? Make sure to name it [PATCH v2], and provide a changelog. See<br>
<a href=3D"https://buildroot.org/downloads/manual/manual.html#submitting-pa=
tches" rel=3D"noreferrer" target=3D"_blank">https://buildroot.org/downloads=
/manual/manual.html#submitting-patches</a><br>
for some good description on how to contribute.<br>
<br>
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Joseph Zikusooka</div></div>

--000000000000a6da820635528d27--

--===============8393226752540692659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8393226752540692659==--
