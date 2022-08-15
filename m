Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6C7C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9478841583;
	Mon, 15 Aug 2022 16:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9478841583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iLIVB069jq2M; Mon, 15 Aug 2022 16:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54FD140993;
	Mon, 15 Aug 2022 16:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54FD140993
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5AF5F1BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36122400FD
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36122400FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C13VUvLGGSpw for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:46:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1908B400A6
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1908B400A6
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 16:46:47 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id w196so9114327oiw.10
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=cYfNONXhaKjUt4Ra/vvhWACkc+amLB2WjFmn9aTQojE=;
 b=i+ZR+BLSjAEh4u6fn5YzjR6211eMg+asjw7PopvzHaeba4rHb8qYV66Vy2a4bmRADB
 sEqp1g2ictmyWZas6hHu1lh3+VDJuIbpXoYhEAPlvOZ5MnJB/CRwLZGQOSECqF+5abdo
 kL7ZxSRTn5HfVFbk1yzKoe5Vls1D4e0zPG+NU9F7OX8ME6Nzhn1y8xtXS66PrzlQfLXp
 VbYL2udIZjIirkvRNHOg4pqHC8X1FR+oawfJU2lc7tbhIWkhcZA11qFqs3U/6EONnhDB
 V3lUor/ccbyLVbsBsF/mhj752HTyIUO15RpbPLpkOUj6TZr2d44V+6vzxkhXRZrEmoEc
 mU0g==
X-Gm-Message-State: ACgBeo3JjB0UbXPwaMb2rR8syCRs9YBB5vCS+jMuXQ2oZZMgJpZDbxFr
 se5G7oeiT5hCQGH7vjVTLuZMYSFd9qlSxb4WRdTZv8qK2Lw=
X-Google-Smtp-Source: AA6agR78NsV/jqumvL37GGszVlWrHOgvXUFEphRHgjq9gfd1wufIzK/ETPCza+NfPqGuKuzXfTfPIGJ6WmsXttUDgIY=
X-Received: by 2002:a05:6808:210d:b0:343:1027:2e63 with SMTP id
 r13-20020a056808210d00b0034310272e63mr7402624oiw.228.1660582005919; Mon, 15
 Aug 2022 09:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220815163456.31474-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220815163456.31474-1-fontaine.fabrice@gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Aug 2022 18:46:35 +0200
Message-ID: <CAPi7W82EF5u7Nh5FO5TezHTX54XnQxCHeFH28tyS5oQufB8stA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc;
 bh=cYfNONXhaKjUt4Ra/vvhWACkc+amLB2WjFmn9aTQojE=;
 b=LzG/8SWwPjctdd/pT0f3COYuardqBSxHz7HVqA9XVV/mNZcpHG+BFyTgR5XdRlpvYh
 rR6fyeX4I1gv4s5MOzyfj2EPAPjYEnfk2wXmMoFuQb6lguii46Hgc6iwvkzNhMrMAalf
 qhW+NVkeq5nLCkL0tqPoE/19ZDr6hTFEx5sQfaljv7OAczbR42ziemomNBTEpn2l1Sn7
 Ujbh02bPLqHe43psfFYnvAHkPHSXzOmoaVsFNlSQ0NhQ/Uee7VF7BOiqirgLIGM4OfDb
 IMs/EHVgtyU7KuckGU3i2b7aGaZHizGhMfZ8YmkKI9rW2NKI7pPuNyJE4HdR5RafK7LF
 JSkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LzG/8SWw
Subject: Re: [Buildroot] [PATCH 1/1] package/lshw: fix NLS build
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
Content-Type: multipart/mixed; boundary="===============3702949918896739672=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3702949918896739672==
Content-Type: multipart/alternative; boundary="0000000000009552e105e64a600c"

--0000000000009552e105e64a600c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le lun. 15 ao=C3=BBt 2022 =C3=A0 18:34, Fabrice Fontaine <fontaine.fabrice@=
gmail.com>
a =C3=A9crit :

> Fix the following NLS build failure:
>
> In file included from hw.cc:5:
> config.h:10:10: fatal error: libintl.h: No such file or directory
>    10 | #include <libintl.h>
>       |          ^~~~~~~~~~~
>
> Strangely enough this build failure is only raised by the autobuilders
> since bump to latest head in commit
> 72a009fa98a37825624f70dc2a1cf825a5999a0a. However,libintl.h is
> unconditionally used since version B.02.15 and
>
> https://github.com/lyonel/lshw/commit/792eba3da1c38a164ddde999d188b11bc0e=
5abb0
> so the build failure can be reproduced even when
> 72a009fa98a37825624f70dc2a1cf825a5999a0a is reverted
>

I found out that this patch is basically reverting
aac99867ce9c4b72e55bb886e9a6600c6407d3eb.
I don't master NLS enough but I assume it shouldn't be applied.
Perhaps, the issue is on the toolchain side?


>
> Fixes:
>  -
> http://autobuild.buildroot.org/results/09fbc4948650f8f756cb5a9ca4b5c687cd=
2edc6c
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lshw/lshw.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
> index bf286647b6..c6c1ac671d 100644
> --- a/package/lshw/lshw.mk
> +++ b/package/lshw/lshw.mk
> @@ -11,12 +11,18 @@ LSHW_LICENSE_FILES =3D COPYING
>
>  LSHW_DEPENDENCIES =3D $(TARGET_NLS_DEPENDENCIES)
>
> +LSHW_CFLAGS =3D $(TARGET_CFLAGS)
> +
> +ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
> +LSHW_CFLAGS +=3D -DNONLS
> +endif
> +
>  LSHW_MAKE_OPTS =3D \
>         CC=3D"$(TARGET_CC)" \
>         CXX=3D"$(TARGET_CXX)" \
>         AR=3D"$(TARGET_AR)" \
>         LANGUAGES=3D \
> -       RPM_OPT_FLAGS=3D"$(TARGET_CFLAGS)"
> +       RPM_OPT_FLAGS=3D"$(LSHW_CFLAGS)"
>
>  LSHW_MAKE_ENV =3D \
>         $(TARGET_MAKE_ENV) \
> --
> 2.35.1
>
> Best Regards,

Fabrice

--0000000000009552e105e64a600c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 15 ao=C3=BBt 2022 =C3=
=A0=C2=A018:34, Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gma=
il.com">fontaine.fabrice@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Fix the following NLS build =
failure:<br>
<br>
In file included from hw.cc:5:<br>
config.h:10:10: fatal error: libintl.h: No such file or directory<br>
=C2=A0 =C2=A010 | #include &lt;libintl.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~<br>
<br>
Strangely enough this build failure is only raised by the autobuilders<br>
since bump to latest head in commit<br>
72a009fa98a37825624f70dc2a1cf825a5999a0a. However,libintl.h is<br>
unconditionally used since version B.02.15 and<br>
<a href=3D"https://github.com/lyonel/lshw/commit/792eba3da1c38a164ddde999d1=
88b11bc0e5abb0" rel=3D"noreferrer" target=3D"_blank">https://github.com/lyo=
nel/lshw/commit/792eba3da1c38a164ddde999d188b11bc0e5abb0</a><br>
so the build failure can be reproduced even when<br>
72a009fa98a37825624f70dc2a1cf825a5999a0a is reverted<br></blockquote><div><=
br></div><div><div>I found out that this patch is basically reverting aac99=
867ce9c4b72e55bb886e9a6600c6407d3eb.</div><div>I don&#39;t master NLS enoug=
h but I assume it shouldn&#39;t be applied.</div><div>Perhaps, the issue is=
 on the toolchain side?<br></div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Fixes:<br>
=C2=A0- <a href=3D"http://autobuild.buildroot.org/results/09fbc4948650f8f75=
6cb5a9ca4b5c687cd2edc6c" rel=3D"noreferrer" target=3D"_blank">http://autobu=
ild.buildroot.org/results/09fbc4948650f8f756cb5a9ca4b5c687cd2edc6c</a><br>
<br>
Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmai=
l.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/lshw/<a href=3D"http://lshw.mk" rel=3D"noreferrer" target=3D"=
_blank">lshw.mk</a> | 8 +++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/package/lshw/<a href=3D"http://lshw.mk" rel=3D"noreferrer" tar=
get=3D"_blank">lshw.mk</a> b/package/lshw/<a href=3D"http://lshw.mk" rel=3D=
"noreferrer" target=3D"_blank">lshw.mk</a><br>
index bf286647b6..c6c1ac671d 100644<br>
--- a/package/lshw/<a href=3D"http://lshw.mk" rel=3D"noreferrer" target=3D"=
_blank">lshw.mk</a><br>
+++ b/package/lshw/<a href=3D"http://lshw.mk" rel=3D"noreferrer" target=3D"=
_blank">lshw.mk</a><br>
@@ -11,12 +11,18 @@ LSHW_LICENSE_FILES =3D COPYING<br>
<br>
=C2=A0LSHW_DEPENDENCIES =3D $(TARGET_NLS_DEPENDENCIES)<br>
<br>
+LSHW_CFLAGS =3D $(TARGET_CFLAGS)<br>
+<br>
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)<br>
+LSHW_CFLAGS +=3D -DNONLS<br>
+endif<br>
+<br>
=C2=A0LSHW_MAKE_OPTS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CC=3D&quot;$(TARGET_CC)&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CXX=3D&quot;$(TARGET_CXX)&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AR=3D&quot;$(TARGET_AR)&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LANGUAGES=3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0RPM_OPT_FLAGS=3D&quot;$(TARGET_CFLAGS)&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0RPM_OPT_FLAGS=3D&quot;$(LSHW_CFLAGS)&quot;<br>
<br>
=C2=A0LSHW_MAKE_ENV =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_MAKE_ENV) \<br>
-- <br>
2.35.1<br>
<br></blockquote><div><div>Best Regards,<br></div><div dir=3D"ltr"><br></di=
v><div>Fabrice<br></div>=C2=A0</div></div></div>

--0000000000009552e105e64a600c--

--===============3702949918896739672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3702949918896739672==--
