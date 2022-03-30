Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA34C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 18:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89F85610A2;
	Wed, 30 Mar 2022 18:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fiKCv10Z5GGb; Wed, 30 Mar 2022 18:52:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9299B60AC9;
	Wed, 30 Mar 2022 18:52:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10BE91BF45A
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 18:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F33EA848E6
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 18:52:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cATjrwiNsGeD for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 18:52:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06BEC848D7
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 18:52:37 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2e612af95e3so229495327b3.9
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 11:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TVMdVsX845MV6qlBR6BcC1RzkA4tRjoYJZQerJvpk8o=;
 b=GrI3nIfENhVofCyj2XB4OFQfxdGheC0uz1eRXWUPUrBgvy3fxVbw8Y0UvL9r2EjPk6
 02osm3ggTW5EZ5C9l4V5wIguTRic5Q07+xEQFbswTBnSQh2gQ2SWtA+2eYehvYoGKJdg
 /+JGiBXeScDYHODPbN8ZKxZfFIOFLucy8GlUiBB349XQETlC7rqsedEnnMjiuVYw/hiJ
 5YUfDWi8XlrzBu8jFhjpNG0u1kCavHx+YZStozmme/QdIjyCBA5UXCeo8+2RNGeXW4LP
 +Rs4pyfGDhtMcpPvTTkteR8xM4A7nwFzSTiqZReChQW7npqWsPKBwQ+lkPFDcWYHEcPm
 QOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TVMdVsX845MV6qlBR6BcC1RzkA4tRjoYJZQerJvpk8o=;
 b=fWk1W7pAqbWzC81Sbe1KlIJHXXPa5sEGPMS+orp0nmH4v5ReER7yLYFpMpn2UGx9Jz
 GpnA0ABqu87e63Ox8/vGSVg0aXPOmUuXhfF04uUteBnL415YGW3BdbuBaZP+hBRxcGBw
 Y/OecilUeKPw48USXtPvh3jjqUR00Wdzijiynd3lZ/kz94ojDhW+dEnKdvLWhpuAzMTm
 Y4UjF81y4piy5yxSqSXcw8BDbXw86MIMDcDQ9PZoDAwc/dwr5XGYa0MOoFqgYwYJunJg
 EhXjUeDg+CzlZvPWTEDAXMjPCl6+QmIWyB2PofHrh3Shw7cQYkg79HL2QXJ/nvpHZzlz
 bZDg==
X-Gm-Message-State: AOAM532vnTOjncRmuBhkrXkt+ex9lDyTHSSj+73+WRHTRdkwEOmELu3M
 2pfSJyBeTFdmXDGxIJfHWreB66R48N7Lqx1qKrMmwYW++Bk=
X-Google-Smtp-Source: ABdhPJwyhlan8fd4Ryq3OM5TNH4Nkn7/tOsT8kiPWxp97dbMgnLaJvMBBaTuSkpnt1pAlh59/Tnbg16zRi9mbSdZmBA=
X-Received: by 2002:a81:9249:0:b0:2e6:5068:88d with SMTP id
 j70-20020a819249000000b002e65068088dmr1247860ywg.222.1648666357053; Wed, 30
 Mar 2022 11:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
 <CADvTj4qWax3zJXamtBgGEyPE31Pp-fH6Ge=ZYvk1c7XzcisntQ@mail.gmail.com>
 <CAM70yxB3EJmtX6PtBMB0UJtrzX6_8yhnRWBkGhbgK1Hxcm7fAA@mail.gmail.com>
 <CADvTj4rNA_vsqU5-2Hu6XT4LjpRhmuO09FsZOEk8w16VMri6xw@mail.gmail.com>
 <CAM70yxD=tU7FK1uf2iEpFVK_jDQyHv6j8xAdW9nEDz0r8njz6w@mail.gmail.com>
 <CADvTj4qo_ac-wizQH_xvMbn5Y7urEHnNyopLGTmF4RJ3HP=+Hw@mail.gmail.com>
 <CAM70yxB61g2r5+aHZYPbit+3TjaWG4khnb71vHC-2pfF+WoyfQ@mail.gmail.com>
In-Reply-To: <CAM70yxB61g2r5+aHZYPbit+3TjaWG4khnb71vHC-2pfF+WoyfQ@mail.gmail.com>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Wed, 30 Mar 2022 15:52:26 -0300
Message-ID: <CAM70yxCMj-_4q_Rix-PK2=sG+RcfVE0GQr8FK4UqrRT6c7AsSw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python.mk: fix PEP517
 purelib deployment path
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6780873968191426514=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6780873968191426514==
Content-Type: multipart/alternative; boundary="00000000000090bad605db740ccd"

--00000000000090bad605db740ccd
Content-Type: text/plain; charset="UTF-8"

package/pkg-python.mk: fix PEP517 purelib deployment path

This allows the Python interpreter to find packages built via the new Flit
infrastructure and fixes bug #14721.
Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 52ce402281..ab4f7af6a6 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -127,7 +127,7 @@ PKG_PYTHON_PEP517_ENV = \
 PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
  --interpreter=/usr/bin/python \
  --script-kind=posix \
- --purelib=$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+
--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
\
  --headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
  --scripts=$(TARGET_DIR)/usr/bin \
  --data=$(TARGET_DIR)/usr
@@ -135,7 +135,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
 PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
  --interpreter=/usr/bin/python \
  --script-kind=posix \
- --purelib=$(STAGING_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
\
+
--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
\
  --headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
  --scripts=$(STAGING_DIR)/usr/bin \
  --data=$(STAGING_DIR)/usr
@@ -150,8 +150,8 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
  --interpreter=/usr/bin/python \
  --script-kind=posix \
  --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
- --headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
- --scripts=$(HOST_DIR)/usr/bin \
+ --headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)  \
+ --scripts=$(HOST_DIR)/bin \
  --data=$(HOST_DIR)/usr

 ################################################################################

On Wed, Mar 30, 2022 at 3:51 PM Emile Cormier <emile.cormier.jr@gmail.com>
wrote:

> On Wed, Mar 30, 2022 at 3:01 PM James Hilliard <james.hilliard1@gmail.com>
> wrote:
>
>> I think keep /usr for STAGING/TARGET OPTS but remove for HOST OPTS.
>>
>
> Alright, I've changed it as you suggested and it still works for me. I'll
> post an updated patch.
>

--00000000000090bad605db740ccd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">package/<a href=3D"http://pkg-python.mk">pkg-python.mk</a>=
: fix PEP517 purelib deployment path<br><br>This allows the Python interpre=
ter to find packages built via the new Flit<br>infrastructure and fixes bug=
 #14721.<br>Signed-off-by: Emile Cormier &lt;<a href=3D"mailto:emile.cormie=
r.jr@gmail.com">emile.cormier.jr@gmail.com</a>&gt; <br><br>diff --git a/pac=
kage/<a href=3D"http://pkg-python.mk">pkg-python.mk</a> b/package/<a href=
=3D"http://pkg-python.mk">pkg-python.mk</a><br>index 52ce402281..ab4f7af6a6=
 100644<br>--- a/package/<a href=3D"http://pkg-python.mk">pkg-python.mk</a>=
<br>+++ b/package/<a href=3D"http://pkg-python.mk">pkg-python.mk</a><br>@@ =
-127,7 +127,7 @@ PKG_PYTHON_PEP517_ENV =3D \<br>=C2=A0PKG_PYTHON_PEP517_INS=
TALL_TARGET_OPTS =3D \<br>=C2=A0	--interpreter=3D/usr/bin/python \<br>=C2=
=A0	--script-kind=3Dposix \<br>-	--purelib=3D$(TARGET_DIR)/lib/python$(PYTH=
ON3_VERSION_MAJOR)/site-packages \<br>+	--purelib=3D$(TARGET_DIR)/usr/lib/p=
ython$(PYTHON3_VERSION_MAJOR)/site-packages \<br>=C2=A0	--headers=3D$(TARGE=
T_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) =C2=A0\<br>=C2=A0	--scrip=
ts=3D$(TARGET_DIR)/usr/bin \<br>=C2=A0	--data=3D$(TARGET_DIR)/usr<br>@@ -13=
5,7 +135,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS =3D \<br>=C2=A0PKG_PYTH=
ON_PEP517_INSTALL_STAGING_OPTS =3D \<br>=C2=A0	--interpreter=3D/usr/bin/pyt=
hon \<br>=C2=A0	--script-kind=3Dposix \<br>-	--purelib=3D$(STAGING_DIR)/lib=
/python$(PYTHON3_VERSION_MAJOR)/site-packages \<br>+	--purelib=3D$(STAGING_=
DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \<br>=C2=A0	--hea=
ders=3D$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) =C2=A0\<br=
>=C2=A0	--scripts=3D$(STAGING_DIR)/usr/bin \<br>=C2=A0	--data=3D$(STAGING_D=
IR)/usr<br>@@ -150,8 +150,8 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS =3D \<br=
>=C2=A0	--interpreter=3D/usr/bin/python \<br>=C2=A0	--script-kind=3Dposix \=
<br>=C2=A0	--purelib=3D$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-=
packages \<br>-	--headers=3D$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION=
_MAJOR) =C2=A0\<br>-	--scripts=3D$(HOST_DIR)/usr/bin \<br>+	--headers=3D$(H=
OST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) =C2=A0\<br>+	--scripts=3D$(=
HOST_DIR)/bin \<br>=C2=A0	--data=3D$(HOST_DIR)/usr<br>=C2=A0<br>=C2=A0#####=
###########################################################################=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Mar 30, 2022 at 3:51 PM Emile Cormier &lt;<a href=3D"mailto:emile.c=
ormier.jr@gmail.com">emile.cormier.jr@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 30, 2022=
 at 3:01 PM James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com"=
 target=3D"_blank">james.hilliard1@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">I think keep /usr for STAGING/T=
ARGET OPTS but remove for HOST OPTS.<br></blockquote><div><br></div><div>Al=
right, I&#39;ve changed it as you suggested and it still works for me. I&#3=
9;ll post an updated patch.<br></div></div></div>
</blockquote></div>

--00000000000090bad605db740ccd--

--===============6780873968191426514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6780873968191426514==--
