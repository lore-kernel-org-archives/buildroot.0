Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF27E7543D
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 09:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21E2A81EC9;
	Tue,  3 Oct 2023 09:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21E2A81EC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VV4lN-H7sWvv; Tue,  3 Oct 2023 09:41:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B62B81EEB;
	Tue,  3 Oct 2023 09:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B62B81EEB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 064D21BF410
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 09:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0BC681EC9
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 09:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0BC681EC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpLF8GrszoxF for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 09:41:12 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D7EA81E87
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 09:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D7EA81E87
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-503065c4b25so882375e87.1
 for <buildroot@buildroot.org>; Tue, 03 Oct 2023 02:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696326070; x=1696930870;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kc3jZGQgkVN+AM4NEbycpIQvTbDUWCgykgj3Z1r8+kk=;
 b=eTl+hJiRYGiclBbTZuqt84mRHAMNOebKxt3tYelwt2xr1zGrX4jg7F2bACEtgWOF6y
 Llb4Y9lYaq4Op2NqhKiF9oB4CY9JGNUn4TvnspMe+qM1cueJ5w+YZlWO/OmtztsiQ8z0
 k2/IeV0JfItpqmB4VIy7P9K7NOIQvR+tvzpFRnk9BBvBdMjrefYJKurfb/4RF8rVKVvC
 ryn8ATMgFF+N+C1jOaVyTaybkN88unUtd8YnWac0kHPhWhbwXfewLg3H+Ql0h1IJSm0v
 KYJ3hKLxO/kPaQfF0sIol1v+VrX2QFe9R72M2bMscJMiN6USjFA56eb0Mz7LYozEe+mc
 rh3Q==
X-Gm-Message-State: AOJu0Yxygfslz4GjIWeoy8+/ADjgzQMTy14bQ7BCyVA3m+UL2lg8BYP7
 bp6STOTg5nepIwTf36FTGRiE3kaXPoKW7FA2yWwH0iqZ
X-Google-Smtp-Source: AGHT+IHDV7fyFNVlc9XNeFd7HjzjnbRJWIMVXX8G/jdZieJO3XiKO1vRt0GXhAYqX0Yci4g9jTnMY2zGXy9Yn1ozbeA=
X-Received: by 2002:a05:6512:1383:b0:503:59d:fbff with SMTP id
 fc3-20020a056512138300b00503059dfbffmr14903723lfb.2.1696326069856; Tue, 03
 Oct 2023 02:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231002135147.2707988-1-julien.boibessot@armadeus.com>
 <CAPi7W82neHWtun3WS8ZO1jOaEfWarwEnSvQdXLV9qHx=r7=cLw@mail.gmail.com>
 <4b75128a7a53e2fed27a1799f97a7828@armadeus.com>
In-Reply-To: <4b75128a7a53e2fed27a1799f97a7828@armadeus.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 3 Oct 2023 11:40:58 +0200
Message-ID: <CAPi7W81=Vqc63FOHbXA97g_jx9V--in+Ou3cxaC0Htv1XLzMYw@mail.gmail.com>
To: julien.boibessot@armadeus.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696326070; x=1696930870; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kc3jZGQgkVN+AM4NEbycpIQvTbDUWCgykgj3Z1r8+kk=;
 b=UXtLA+VqdXX4KsQd10fGE5axnumhVGJ4FiUgZQozD3x98NZBK1jImSA6rwEdq8pHNe
 nwDVjjv1uRrNPdI4VGoCIU1EcfYumTAv8fcFzWfl4pg3WtPgqY0rhpBUTnyyur1z684b
 CiS4uJKKG1IGwa9e9H9iZKTkBMPd9z+95f4rgGlKNON1UhXVWlOKbZ2go1ZRuIBOZUtB
 pBEzVU6nPptUfzHAmn8J7WYv6boiuUySoNCcQsE65t2H8pZFvl+b8Uin7PTm7mK8H3BX
 9NmeIH8iHWp43RTybIFY2Rv2tbi2d4EUJodhEqGXD1WyHEEClpYsHZJciOcxqAFLg7+Z
 5SIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UXtLA+Vq
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
Content-Type: multipart/mixed; boundary="===============7662422460882664730=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7662422460882664730==
Content-Type: multipart/alternative; boundary="000000000000d12c280606ccb0e8"

--000000000000d12c280606ccb0e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Julien,

Le mar. 3 oct. 2023 =C3=A0 11:36, <julien.boibessot@armadeus.com> a =C3=A9c=
rit :

> Hello Fabrice,
>
> Thanks for the feedback !
>
> Le 2023-10-02 15:55, Fabrice Fontaine a =C3=A9crit :
>
> > Hello Julien,
> >
> > Le lun. 2 oct. 2023 =C3=A0 15:52, Julien BOIBESSOT
> > <julien.boibessot@armadeus.com> a =C3=A9crit :
> >
> >> Latest release. Asked by autobuild.buildroot.net.
> >> Remove integrated fix.
> >
> > You forgot to update .checkpackageignore
> >
>
> Oups, I've missed that feature in BR. Am I supposed to remove file entry
> in this file and that's it ?
>
Yes, just remove the entry.

>
> Best regards,
>
> Julien
>
> >> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> >> ---
> >> .../ltris/0001-fix-build-with-gcc-4.8.patch   | 20 -------------------
> >> package/ltris/ltris.hash                      |  2 +-
> >> package/ltris/ltris.mk                        |  2 +-
> >> 3 files changed, 2 insertions(+), 22 deletions(-)
> >> delete mode 100644 package/ltris/0001-fix-build-with-gcc-4.8.patch
> >>
> >> diff --git a/package/ltris/0001-fix-build-with-gcc-4.8.patch
> >> b/package/ltris/0001-fix-build-with-gcc-4.8.patch
> >> deleted file mode 100644
> >> index d6bbf6a946..0000000000
> >> --- a/package/ltris/0001-fix-build-with-gcc-4.8.patch
> >> +++ /dev/null
> >> @@ -1,20 +0,0 @@
> >> -Fix build with gcc 4.8
> >> -
> >> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >> -[Upstream status: https://sourceforge.net/p/lgames/patches/28]
> >> -Index: ltris/src/bowl.c
> >> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> ---- ltris/src/bowl.c   (r=C3=A9vision 421)
> >> -+++ ltris/src/bowl.c   (copie de travail)
> >> -@@ -828,9 +828,10 @@
> >> - */
> >> - void bowl_init_block_masks()
> >> - {
> >> -+      int i;
> >> -       int masksize =3D sizeof(block_masks[0].mask); // same for all
> >> -
> >> --      for (int i =3D 0; i < 7; i++) {
> >> -+      for (i =3D 0; i < 7; i++) {
> >> -               block_masks[i].rx =3D 2;
> >> -               block_masks[i].ry =3D 2;
> >> -               memset(block_masks[i].mask, 0, masksize );
> >> diff --git a/package/ltris/ltris.hash b/package/ltris/ltris.hash
> >> index f696e3af17..abe6853d9b 100644
> >> --- a/package/ltris/ltris.hash
> >> +++ b/package/ltris/ltris.hash
> >> @@ -1,3 +1,3 @@
> >> # Locally computed:
> >> -sha256
> >> a7bc6c5fc6539b88505077a1b4580edc9b179ce0a6b829c58fbd9416cf456195
> >> ltris-1.2.tar.gz
> >> +sha256
> >> 1291c6a642d06b9ee153ac0a2e7855a2c983e839c618f1a294df04d829525cb0
> >> ltris-1.2.7.tar.gz
> >> sha256
> >> 67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34
> >> COPYING
> >> diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
> >> index 9b59613417..98902de44c 100644
> >> --- a/package/ltris/ltris.mk
> >> +++ b/package/ltris/ltris.mk
> >> @@ -5,7 +5,7 @@
> >>
> #########################################################################=
#######
> >>
> >> LTRIS_SITE =3D http://downloads.sourceforge.net/lgames/ltris
> >> -LTRIS_VERSION =3D 1.2
> >> +LTRIS_VERSION =3D 1.2.7
> >> LTRIS_LICENSE =3D GPL-2.0+
> >> LTRIS_LICENSE_FILES =3D COPYING
> >>
> >> --
> >> 2.25.1
> >
> > Best Regards,
> >
> > Fabrice
>

Best Regards,

Fabrice

--000000000000d12c280606ccb0e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Julien,<br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 3 oct. 2023 =C3=A0=C2=
=A011:36, &lt;<a href=3D"mailto:julien.boibessot@armadeus.com">julien.boibe=
ssot@armadeus.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hello Fabrice,<br>
<br>
Thanks for the feedback !<br>
<br>
Le 2023-10-02 15:55, Fabrice Fontaine a =C3=A9crit :<br>
<br>
&gt; Hello Julien,<br>
&gt; <br>
&gt; Le lun. 2 oct. 2023 =C3=A0 15:52, Julien BOIBESSOT <br>
&gt; &lt;<a href=3D"mailto:julien.boibessot@armadeus.com" target=3D"_blank"=
>julien.boibessot@armadeus.com</a>&gt; a =C3=A9crit :<br>
&gt; <br>
&gt;&gt; Latest release. Asked by <a href=3D"http://autobuild.buildroot.net=
" rel=3D"noreferrer" target=3D"_blank">autobuild.buildroot.net</a>.<br>
&gt;&gt; Remove integrated fix.<br>
&gt; <br>
&gt; You forgot to update .checkpackageignore<br>
&gt; <br>
<br>
Oups, I&#39;ve missed that feature in BR. Am I supposed to remove file entr=
y <br>
in this file and that&#39;s it ?<br></blockquote><div>Yes, just remove the =
entry. <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
<br>
Julien<br>
<br>
&gt;&gt; Signed-off-by: Julien BOIBESSOT &lt;<a href=3D"mailto:julien.boibe=
ssot@armadeus.com" target=3D"_blank">julien.boibessot@armadeus.com</a>&gt;<=
br>
&gt;&gt; ---<br>
&gt;&gt; .../ltris/0001-fix-build-with-gcc-4.8.patch=C2=A0 =C2=A0| 20 -----=
--------------<br>
&gt;&gt; package/ltris/ltris.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;&gt; package/ltris/<a href=3D"http://ltris.mk" rel=3D"noreferrer" targe=
t=3D"_blank">ltris.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;&gt; 3 files changed, 2 insertions(+), 22 deletions(-)<br>
&gt;&gt; delete mode 100644 package/ltris/0001-fix-build-with-gcc-4.8.patch=
<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/package/ltris/0001-fix-build-with-gcc-4.8.patch <br>
&gt;&gt; b/package/ltris/0001-fix-build-with-gcc-4.8.patch<br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index d6bbf6a946..0000000000<br>
&gt;&gt; --- a/package/ltris/0001-fix-build-with-gcc-4.8.patch<br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,20 +0,0 @@<br>
&gt;&gt; -Fix build with gcc 4.8<br>
&gt;&gt; -<br>
&gt;&gt; -Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fa=
brice@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt;&gt; -[Upstream status: <a href=3D"https://sourceforge.net/p/lgames/pat=
ches/28" rel=3D"noreferrer" target=3D"_blank">https://sourceforge.net/p/lga=
mes/patches/28</a>]<br>
&gt;&gt; -Index: ltris/src/bowl.c<br>
&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; ---- ltris/src/bowl.c=C2=A0 =C2=A0(r=C3=A9vision 421)<br>
&gt;&gt; -+++ ltris/src/bowl.c=C2=A0 =C2=A0(copie de travail)<br>
&gt;&gt; -@@ -828,9 +828,10 @@<br>
&gt;&gt; - */<br>
&gt;&gt; - void bowl_init_block_masks()<br>
&gt;&gt; - {<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int masksize =3D sizeof(block_masks[0]=
.mask); // same for all<br>
&gt;&gt; -<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; 7; i++) {<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; 7; i++) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block_mask=
s[i].rx =3D 2;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block_mask=
s[i].ry =3D 2;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(blo=
ck_masks[i].mask, 0, masksize );<br>
&gt;&gt; diff --git a/package/ltris/ltris.hash b/package/ltris/ltris.hash<b=
r>
&gt;&gt; index f696e3af17..abe6853d9b 100644<br>
&gt;&gt; --- a/package/ltris/ltris.hash<br>
&gt;&gt; +++ b/package/ltris/ltris.hash<br>
&gt;&gt; @@ -1,3 +1,3 @@<br>
&gt;&gt; # Locally computed:<br>
&gt;&gt; -sha256=C2=A0 <br>
&gt;&gt; a7bc6c5fc6539b88505077a1b4580edc9b179ce0a6b829c58fbd9416cf456195=
=C2=A0 <br>
&gt;&gt; ltris-1.2.tar.gz<br>
&gt;&gt; +sha256=C2=A0 <br>
&gt;&gt; 1291c6a642d06b9ee153ac0a2e7855a2c983e839c618f1a294df04d829525cb0=
=C2=A0 <br>
&gt;&gt; ltris-1.2.7.tar.gz<br>
&gt;&gt; sha256=C2=A0 <br>
&gt;&gt; 67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34=
=C2=A0 <br>
&gt;&gt; COPYING<br>
&gt;&gt; diff --git a/package/ltris/<a href=3D"http://ltris.mk" rel=3D"nore=
ferrer" target=3D"_blank">ltris.mk</a> b/package/ltris/<a href=3D"http://lt=
ris.mk" rel=3D"noreferrer" target=3D"_blank">ltris.mk</a><br>
&gt;&gt; index 9b59613417..98902de44c 100644<br>
&gt;&gt; --- a/package/ltris/<a href=3D"http://ltris.mk" rel=3D"noreferrer"=
 target=3D"_blank">ltris.mk</a><br>
&gt;&gt; +++ b/package/ltris/<a href=3D"http://ltris.mk" rel=3D"noreferrer"=
 target=3D"_blank">ltris.mk</a><br>
&gt;&gt; @@ -5,7 +5,7 @@<br>
&gt;&gt; ##################################################################=
##############<br>
&gt;&gt; <br>
&gt;&gt; LTRIS_SITE =3D <a href=3D"http://downloads.sourceforge.net/lgames/=
ltris" rel=3D"noreferrer" target=3D"_blank">http://downloads.sourceforge.ne=
t/lgames/ltris</a><br>
&gt;&gt; -LTRIS_VERSION =3D 1.2<br>
&gt;&gt; +LTRIS_VERSION =3D 1.2.7<br>
&gt;&gt; LTRIS_LICENSE =3D GPL-2.0+<br>
&gt;&gt; LTRIS_LICENSE_FILES =3D COPYING<br>
&gt;&gt; <br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt; <br>
&gt; Best Regards,<br>
&gt; <br>
&gt; Fabrice<br></blockquote><div><br></div><div>Best Regards,</div><div><b=
r></div><div>Fabrice <br></div></div></div>

--000000000000d12c280606ccb0e8--

--===============7662422460882664730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7662422460882664730==--
