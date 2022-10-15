Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B25C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 22:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7277818CD;
	Sat, 15 Oct 2022 22:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7277818CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQg8h_zGegyZ; Sat, 15 Oct 2022 22:14:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A776F81656;
	Sat, 15 Oct 2022 22:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A776F81656
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5F191BF35C
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 22:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A17EA40483
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 22:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A17EA40483
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DTJsOlNCeAj4 for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 22:14:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8153B400D9
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8153B400D9
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 22:14:42 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id f37so12251308lfv.8
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JNCzIejEOFkYRhepo3gOJFZ0dDLD8LsCaOaBdlGSGBc=;
 b=J0/T+OziZCqVJYX+BCS2IyPtgp7VZkSBo5ATU363bTHNcvGMOBxM4srewd6rNzTNhj
 PTSWMkvl7acedz1LpBN6OpLGzQDmzIohJu/NishASnYAwyyD+kEWcJlrjvhOTX+4It1E
 D4OWlXMW1lNaiaUcG+58A2DnNjuzYl663DhkJc1kMVOxZiydKbubvx48JNQLIz+qeEk6
 PDnhC0Czy9O8OdkxWDOc+tNmi2VNYEO0fzsGhtFUIYYjw+mMmPglxtQrQtmMhadsohcZ
 sG0n8r1QtXBhuBrEA5PYii63H9jYfkFPJ8HiE+10EH4bbGQqBE/ExuzJednq5xWtknS5
 jZsQ==
X-Gm-Message-State: ACrzQf0yOPM91MJamKf+pEkWiKSuhhM5qjONPcA+zD1vSshFJjvi32bK
 E5mbx6k9UrX1+9Wg1XH8D5payxCzKH5RBqE0tCWZf2Nh
X-Google-Smtp-Source: AMsMyM6DcUZUC9chiLJifRoATvaYNPMo9dchuaO5zPXfYNEDuROptwe02axBv/4sXHiNSQEL40aKn9CxbLoC/DkLR/o=
X-Received: by 2002:a05:6512:2144:b0:4a2:3c2b:f694 with SMTP id
 s4-20020a056512214400b004a23c2bf694mr1608034lfr.642.1665872080052; Sat, 15
 Oct 2022 15:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221015005813.4055238-1-james.hilliard1@gmail.com>
In-Reply-To: <20221015005813.4055238-1-james.hilliard1@gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Oct 2022 00:14:28 +0200
Message-ID: <CAPi7W828RqJOB3wUx3y68PFHE+M+pt5Ohck+-E-YzPim-C54eQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JNCzIejEOFkYRhepo3gOJFZ0dDLD8LsCaOaBdlGSGBc=;
 b=n210qQxAEWYtcWm2N+1dBVxnAfFVozJNHB9uKNDgyY/N8xOaKCdCbEJo7gycgeithj
 em3WY/QvUUd2jvV2MRrPmpvpoHCAmWIA7xjkMNo5fFFT4OadgwBhmpOzAaTo782ScHaZ
 U0saBbRILUHxHI2jAY2GHLY2TevSu1LFi0x9/zZNYIdidMy0RR7vGkWgmfZ2GzkYw35d
 1XM0MnQWAr9NlblEFitf1JIRXDdJMIRRSb1rxZwQWsnxX3k/aD6uS0x/RRYcpgAVlwns
 +0apGhsD2x4TIenc4W9CQJGCAGl2jfVWVux7S5f+zBqp7DxUhNOhufbO7F571GFo2noN
 Oayw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n210qQxA
Subject: Re: [Buildroot] [PATCH 1/1] package/bearssl: disable parallel build
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3643157622266401369=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3643157622266401369==
Content-Type: multipart/alternative; boundary="00000000000092a4fb05eb1a1140"

--00000000000092a4fb05eb1a1140
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi James,

Le sam. 15 oct. 2022 =C3=A0 02:58, James Hilliard <james.hilliard1@gmail.co=
m> a
=C3=A9crit :

> The bearssl package is not compatible with parallel builds.
>

bearssl was building perfectly fine up until now and it seems there are a
lot of packages that are affected by parallel build issues (e.g. dmraid,
musepack, slang, etc).
Did we change something recently on the autobuilders?


>
> Fixes:
>  -
> http://autobuild.buildroot.net/results/5e1/5e1b72db206b2d17fa5ce378a70fdc=
2f3f5bf773
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/bearssl/bearssl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/bearssl/bearssl.mk b/package/bearssl/bearssl.mk
> index ff5f4e87b7..c2a5760af5 100644
> --- a/package/bearssl/bearssl.mk
> +++ b/package/bearssl/bearssl.mk
> @@ -24,7 +24,7 @@ BEARSSL_TARGETS +=3D lib
>  endif
>
>  define BEARSSL_BUILD_CMDS
> -       $(TARGET_MAKE_ENV) $(MAKE) $(BEARSSL_MAKE_OPTS) -C $(@D) \
> +       $(TARGET_MAKE_ENV) $(MAKE1) $(BEARSSL_MAKE_OPTS) -C $(@D) \
>                 $(BEARSSL_TARGETS)
>  endef
>
> --
> 2.34.1
>
> Best Regards,

Fabrice

--00000000000092a4fb05eb1a1140
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi James,<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 15 oct. 2022 =
=C3=A0=C2=A002:58, James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gma=
il.com">james.hilliard1@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">The bearssl package is not co=
mpatible with parallel builds.<br></blockquote><div><br></div><div>bearssl =
was building perfectly fine up until now and it seems there are a lot of pa=
ckages that are affected by parallel build issues (e.g. dmraid, musepack, s=
lang, etc).</div><div>Did we change something recently on the autobuilders?=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Fixes:<br>
=C2=A0- <a href=3D"http://autobuild.buildroot.net/results/5e1/5e1b72db206b2=
d17fa5ce378a70fdc2f3f5bf773" rel=3D"noreferrer" target=3D"_blank">http://au=
tobuild.buildroot.net/results/5e1/5e1b72db206b2d17fa5ce378a70fdc2f3f5bf773<=
/a><br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/bearssl/<a href=3D"http://bearssl.mk" rel=3D"noreferrer" targ=
et=3D"_blank">bearssl.mk</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/package/bearssl/<a href=3D"http://bearssl.mk" rel=3D"noreferre=
r" target=3D"_blank">bearssl.mk</a> b/package/bearssl/<a href=3D"http://bea=
rssl.mk" rel=3D"noreferrer" target=3D"_blank">bearssl.mk</a><br>
index ff5f4e87b7..c2a5760af5 100644<br>
--- a/package/bearssl/<a href=3D"http://bearssl.mk" rel=3D"noreferrer" targ=
et=3D"_blank">bearssl.mk</a><br>
+++ b/package/bearssl/<a href=3D"http://bearssl.mk" rel=3D"noreferrer" targ=
et=3D"_blank">bearssl.mk</a><br>
@@ -24,7 +24,7 @@ BEARSSL_TARGETS +=3D lib<br>
=C2=A0endif<br>
<br>
=C2=A0define BEARSSL_BUILD_CMDS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) $(BEARSSL_MAKE_OPTS)=
 -C $(@D) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE1) $(BEARSSL_MAKE_OPTS=
) -C $(@D) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(BEARSSL_TARGETS)<=
br>
=C2=A0endef<br>
<br>
-- <br>
2.34.1<br><br></blockquote><div>Best Regards,</div><div><br></div><div>Fabr=
ice <br></div></div></div>

--00000000000092a4fb05eb1a1140--

--===============3643157622266401369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3643157622266401369==--
