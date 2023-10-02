Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75B7E7849A
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 13:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42131418FD;
	Mon,  2 Oct 2023 13:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42131418FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ndtOFFlYXHsU; Mon,  2 Oct 2023 13:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24A9141ADE;
	Mon,  2 Oct 2023 13:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24A9141ADE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B3F71BF283
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 13:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 805A4418FD
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 13:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 805A4418FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1v3IOigQWsJ5 for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 13:56:06 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFDC441E41
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 13:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFDC441E41
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50567477b29so5441978e87.3
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 06:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696254963; x=1696859763;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nXKItotBcwAxvhflMROJzZYatRa6agKBm5bI142cGJ4=;
 b=mJdjP+Xbj+nedWdap6iKsjNhsa8+ivU79rub1Tk3APXGDtRFGf6IjDP7EsFt5bfBi1
 amOVBrLWzleJxRZDCGA8aMgWPWRDBgw/MxOompRQ2APJARJdKJR4MBSSmkjLWwnnVPZa
 CDdK9wIKz08UmzRo1FDT4cN0LI5NKSfX8ePBjRN2O5i0ARImcYT08sSdB/rJXkb2JwmA
 NzIpXbsiZ8vCu3DDa1ZnF0DQ7EMDUKEvkJhQxOJp6Qj3nXJFhCo+P6oWDVc7OEZk4VqJ
 oqkd/cHaO1ITUTJhPyRN8yheZiryTZ22jlnXVfYH6anLXb5AEJNCogsKtRpCrhWpwIjY
 cj8A==
X-Gm-Message-State: AOJu0YxHBzG3BL7mGPQBjsVVEtI6r5AXj8VzU8EqE6uReRnJKpqD/Zlj
 olS9UtAo4wxUJ8iUN+dWwZHV+FcytUYV95d47QE=
X-Google-Smtp-Source: AGHT+IEywVXUNgKtPczMTWqGn7HCnP1Wf7Ao1rhiNGJiWhDhPHPxU1vKc84zffW850HTHMA9LK9H2qVyGMo10zGQWyE=
X-Received: by 2002:a05:6512:3095:b0:500:b56d:e11a with SMTP id
 z21-20020a056512309500b00500b56de11amr11311652lfd.43.1696254963102; Mon, 02
 Oct 2023 06:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231002135147.2707988-1-julien.boibessot@armadeus.com>
In-Reply-To: <20231002135147.2707988-1-julien.boibessot@armadeus.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 2 Oct 2023 15:55:51 +0200
Message-ID: <CAPi7W82neHWtun3WS8ZO1jOaEfWarwEnSvQdXLV9qHx=r7=cLw@mail.gmail.com>
To: Julien BOIBESSOT <julien.boibessot@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696254963; x=1696859763; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nXKItotBcwAxvhflMROJzZYatRa6agKBm5bI142cGJ4=;
 b=cun5GxIyK1ia1UcBt0XNChmDvvpakq/FYjOSpEXCtySbqsbAhhpgnBsaB1nHXME2hc
 IheM3rb+5MIPagtNz+xo9Pe//BBZPTnsCb/mrHK9xGbG2+tJ4TNU2/nUzY/Dh3qq0iR8
 j5HsdH0BxtAVJPAEBQMeDcP2pvnO3siqGnWDrUH/bFkQeQeV50UOe7vxogQzhiaRpCme
 XcKQhp0/sxXRyLAAHN7HT+FXBJlpvwjtNQ12V59H8sreaHT63hiGmvPK1BxMzrJBevP3
 7cN8tmChdX2lHslQhCthEck1Kix0xkFqbRyLO17zfU7IyV6JtkiGAIdMs8Whvm/g3jbc
 QlbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cun5GxIy
Subject: Re: [Buildroot] [PATCH 1/1] package/ltris: bump to version 1.2.7
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
Content-Type: multipart/mixed; boundary="===============5328909726767896615=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5328909726767896615==
Content-Type: multipart/alternative; boundary="00000000000086384d0606bc2241"

--00000000000086384d0606bc2241
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Julien,

Le lun. 2 oct. 2023 =C3=A0 15:52, Julien BOIBESSOT <julien.boibessot@armade=
us.com>
a =C3=A9crit :

> Latest release. Asked by autobuild.buildroot.net.
> Remove integrated fix.
>

You forgot to update .checkpackageignore


>
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  .../ltris/0001-fix-build-with-gcc-4.8.patch   | 20 -------------------
>  package/ltris/ltris.hash                      |  2 +-
>  package/ltris/ltris.mk                        |  2 +-
>  3 files changed, 2 insertions(+), 22 deletions(-)
>  delete mode 100644 package/ltris/0001-fix-build-with-gcc-4.8.patch
>
> diff --git a/package/ltris/0001-fix-build-with-gcc-4.8.patch
> b/package/ltris/0001-fix-build-with-gcc-4.8.patch
> deleted file mode 100644
> index d6bbf6a946..0000000000
> --- a/package/ltris/0001-fix-build-with-gcc-4.8.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Fix build with gcc 4.8
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://sourceforge.net/p/lgames/patches/28]
> -Index: ltris/src/bowl.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- ltris/src/bowl.c   (r=C3=A9vision 421)
> -+++ ltris/src/bowl.c   (copie de travail)
> -@@ -828,9 +828,10 @@
> - */
> - void bowl_init_block_masks()
> - {
> -+      int i;
> -       int masksize =3D sizeof(block_masks[0].mask); // same for all
> -
> --      for (int i =3D 0; i < 7; i++) {
> -+      for (i =3D 0; i < 7; i++) {
> -               block_masks[i].rx =3D 2;
> -               block_masks[i].ry =3D 2;
> -               memset(block_masks[i].mask, 0, masksize );
> diff --git a/package/ltris/ltris.hash b/package/ltris/ltris.hash
> index f696e3af17..abe6853d9b 100644
> --- a/package/ltris/ltris.hash
> +++ b/package/ltris/ltris.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  a7bc6c5fc6539b88505077a1b4580edc9b179ce0a6b829c58fbd9416cf456195
> ltris-1.2.tar.gz
> +sha256  1291c6a642d06b9ee153ac0a2e7855a2c983e839c618f1a294df04d829525cb0
> ltris-1.2.7.tar.gz
>  sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34
> COPYING
> diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
> index 9b59613417..98902de44c 100644
> --- a/package/ltris/ltris.mk
> +++ b/package/ltris/ltris.mk
> @@ -5,7 +5,7 @@
>
>  ########################################################################=
########
>
>  LTRIS_SITE =3D http://downloads.sourceforge.net/lgames/ltris
> -LTRIS_VERSION =3D 1.2
> +LTRIS_VERSION =3D 1.2.7
>  LTRIS_LICENSE =3D GPL-2.0+
>  LTRIS_LICENSE_FILES =3D COPYING
>
> --
> 2.25.1
>

Best Regards,

Fabrice

--00000000000086384d0606bc2241
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Julien,<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 2 oct. 2023=
 =C3=A0=C2=A015:52, Julien BOIBESSOT &lt;<a href=3D"mailto:julien.boibessot=
@armadeus.com">julien.boibessot@armadeus.com</a>&gt; a =C3=A9crit=C2=A0:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Latest release. As=
ked by <a href=3D"http://autobuild.buildroot.net" rel=3D"noreferrer" target=
=3D"_blank">autobuild.buildroot.net</a>.<br>
Remove integrated fix.<br></blockquote><div><br></div><div>You forgot to up=
date .checkpackageignore<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Signed-off-by: Julien BOIBESSOT &lt;<a href=3D"mailto:julien.boibessot@arma=
deus.com" target=3D"_blank">julien.boibessot@armadeus.com</a>&gt;<br>
---<br>
=C2=A0.../ltris/0001-fix-build-with-gcc-4.8.patch=C2=A0 =C2=A0| 20 --------=
-----------<br>
=C2=A0package/ltris/ltris.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0package/ltris/<a href=3D"http://ltris.mk" rel=3D"noreferrer" target=
=3D"_blank">ltris.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A03 files changed, 2 insertions(+), 22 deletions(-)<br>
=C2=A0delete mode 100644 package/ltris/0001-fix-build-with-gcc-4.8.patch<br=
>
<br>
diff --git a/package/ltris/0001-fix-build-with-gcc-4.8.patch b/package/ltri=
s/0001-fix-build-with-gcc-4.8.patch<br>
deleted file mode 100644<br>
index d6bbf6a946..0000000000<br>
--- a/package/ltris/0001-fix-build-with-gcc-4.8.patch<br>
+++ /dev/null<br>
@@ -1,20 +0,0 @@<br>
-Fix build with gcc 4.8<br>
-<br>
-Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gma=
il.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
-[Upstream status: <a href=3D"https://sourceforge.net/p/lgames/patches/28" =
rel=3D"noreferrer" target=3D"_blank">https://sourceforge.net/p/lgames/patch=
es/28</a>]<br>
-Index: ltris/src/bowl.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- ltris/src/bowl.c=C2=A0 =C2=A0(r=C3=A9vision 421)<br>
-+++ ltris/src/bowl.c=C2=A0 =C2=A0(copie de travail)<br>
-@@ -828,9 +828,10 @@<br>
- */<br>
- void bowl_init_block_masks() <br>
- {<br>
-+=C2=A0 =C2=A0 =C2=A0 int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int masksize =3D sizeof(block_masks[0].mask); /=
/ same for all<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; 7; i++) {<br>
-+=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; 7; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block_masks[i].rx =
=3D 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block_masks[i].ry =
=3D 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(block_masks[=
i].mask, 0, masksize );<br>
diff --git a/package/ltris/ltris.hash b/package/ltris/ltris.hash<br>
index f696e3af17..abe6853d9b 100644<br>
--- a/package/ltris/ltris.hash<br>
+++ b/package/ltris/ltris.hash<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally computed:<br>
-sha256=C2=A0 a7bc6c5fc6539b88505077a1b4580edc9b179ce0a6b829c58fbd9416cf456=
195=C2=A0 ltris-1.2.tar.gz<br>
+sha256=C2=A0 1291c6a642d06b9ee153ac0a2e7855a2c983e839c618f1a294df04d829525=
cb0=C2=A0 ltris-1.2.7.tar.gz<br>
=C2=A0sha256=C2=A0 67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a8=
7c4b6c34=C2=A0 COPYING<br>
diff --git a/package/ltris/<a href=3D"http://ltris.mk" rel=3D"noreferrer" t=
arget=3D"_blank">ltris.mk</a> b/package/ltris/<a href=3D"http://ltris.mk" r=
el=3D"noreferrer" target=3D"_blank">ltris.mk</a><br>
index 9b59613417..98902de44c 100644<br>
--- a/package/ltris/<a href=3D"http://ltris.mk" rel=3D"noreferrer" target=
=3D"_blank">ltris.mk</a><br>
+++ b/package/ltris/<a href=3D"http://ltris.mk" rel=3D"noreferrer" target=
=3D"_blank">ltris.mk</a><br>
@@ -5,7 +5,7 @@<br>
=C2=A0#####################################################################=
###########<br>
<br>
=C2=A0LTRIS_SITE =3D <a href=3D"http://downloads.sourceforge.net/lgames/ltr=
is" rel=3D"noreferrer" target=3D"_blank">http://downloads.sourceforge.net/l=
games/ltris</a><br>
-LTRIS_VERSION =3D 1.2<br>
+LTRIS_VERSION =3D 1.2.7<br>
=C2=A0LTRIS_LICENSE =3D GPL-2.0+<br>
=C2=A0LTRIS_LICENSE_FILES =3D COPYING<br>
<br>
-- <br>
2.25.1<br></blockquote><div><br></div><div>Best Regards,</div><div><br></di=
v><div>Fabrice <br></div></div></div>

--00000000000086384d0606bc2241--

--===============5328909726767896615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5328909726767896615==--
