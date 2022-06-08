Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1A6C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 11:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E816B842A7;
	Wed,  8 Jun 2022 11:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fj84-EBpnAbS; Wed,  8 Jun 2022 11:12:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00F4D84004;
	Wed,  8 Jun 2022 11:12:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11AFC1BF574
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 11:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0044184004
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 11:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QpTOm4xZ8EJU for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 11:12:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D739C83FE1
 for <buildroot@busybox.net>; Wed,  8 Jun 2022 11:12:00 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id m10so6777892uao.11
 for <buildroot@busybox.net>; Wed, 08 Jun 2022 04:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Qp2zMRY8vHiux1M4INi8JvBm+DM1auB0xcnGpBAi2xo=;
 b=GE1Fhg55V3h9v9/8ZSXEjDKhYaOGrKDxAYj1v4l6CghkN5puk2/JDpdbeAULohEHq4
 PfUyNcTE6jk670KFCGhWug60/fGhKczlPlutBdpSeLJ+3FD7qTm6NiWqij6AzofOLTdt
 zDgIIaZTmSc0mlP7/7xlcWRPD7XRVLz80uoCMrYbtvbhqcmSpASlBWZFoYDsPJfNTarc
 65719mLSbTrAcUN2Tqhl0c49t76xwMFv6kNKO0lqG8ABP+kefx6s4Ul1vaFhnymCve1C
 uIeJkjxrGEoCggxF05/LzsCjoBGPwyjUc74n6/CVBh2ZE/91FMTzKvNfM0nwUdCjuUCC
 7Xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Qp2zMRY8vHiux1M4INi8JvBm+DM1auB0xcnGpBAi2xo=;
 b=e/n/1Kvn4PMWE/2qQHQFKPV8XMHIyQaIIA8fGz9ZuUHaU+I5Q/HWcByA1eETEQJgWW
 u9zpmsU8B4Ypp4ws9YbyauJ8QptTUFmCX2ADqvChdjo7kJgVV5QXGQ2v6P+R5x27hfwc
 PHB+3+ci7d3B8oSx3lAZN8nfkz3huBz1UAq17nz+f6tC0mPFy4tChTWQ5+INgFaeHY7H
 Ll0R01I4DD9DfpnRTX8NL+oRUSzPLStlyPJA0TS0oUQdG7wNm0EFOtN9NoI+oTOWUBVR
 eAwvPu+H2Sc/WdtLID4+rdkHeUTj10GIb6bW9zzvDlCYz0H7y137k/Bgyvsv8cce76Oz
 sB5w==
X-Gm-Message-State: AOAM531Z5RfmVFny6IhsB7Z6VpGKQT0ReJGjcHblPJgruwSprAtED35N
 H61BNWkZvnDlnFW+nT77iYFd2H+C6HjVpbeanrBwEKz17Dalwg==
X-Google-Smtp-Source: ABdhPJwxrS/oL8KnNFcG7HmWuQwunQyM47x+F5BoCEUQtC9P5T1CIOQ0ZNkCEkvlK+coYbVnviO+wMHRqpPr9q9KHIA=
X-Received: by 2002:ab0:5967:0:b0:373:5dab:784b with SMTP id
 o36-20020ab05967000000b003735dab784bmr18200052uad.99.1654686719700; Wed, 08
 Jun 2022 04:11:59 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Wed, 8 Jun 2022 13:11:48 +0200
Message-ID: <CAGhdn54P8xW5iv5TJbQ5+RktPjUz4c8aY3rue_W4VQoedmdRyA@mail.gmail.com>
To: buildroot <buildroot@busybox.net>
Subject: [Buildroot] [PATCH] package/lsof: bump to version 4.95.0
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
Content-Type: multipart/mixed; boundary="===============1212374255787175893=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1212374255787175893==
Content-Type: multipart/alternative; boundary="00000000000024726905e0edc697"

--00000000000024726905e0edc697
Content-Type: text/plain; charset="UTF-8"

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lsof/0001-remove-susvlegacy-funcs.patch | 12 ------------
 package/lsof/lsof.hash                          |  2 +-
 package/lsof/lsof.mk                            |  2 +-
 3 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 package/lsof/0001-remove-susvlegacy-funcs.patch

diff --git a/package/lsof/0001-remove-susvlegacy-funcs.patch
b/package/lsof/0001-remove-susvlegacy-funcs.patch
deleted file mode 100644
index fca66aee5..000000000
--- a/package/lsof/0001-remove-susvlegacy-funcs.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -rdup lsof_4.81.orig/lsof_4.81_src/dialects/linux/machine.h
lsof_4.81/lsof_4.81_src/dialects/linux/machine.h
---- a/dialects/linux/machine.h 2007-04-24 18:20:58.000000000 +0200
-+++ b/dialects/linux/machine.h 2007-05-15 12:17:03.000000000 +0200
-@@ -616,6 +616,6 @@
-  * zeromem is a macro that uses bzero or memset.
-  */
-
--#define zeromem(a, l) bzero(a, l)
-+#define zeromem(a, l) memset(a, 0, l)
-
- #endif /* !defined(LSOF_MACHINE_H) */
-
diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index 9e72023d3..7318c608c 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c41709c2543ecf9de1e950795790a9786a2f225e51c3cc53d6a9a256f872472b
 lsof_4.94.0.linux.tar.bz2
+sha256  e9faa0fbcc48638c1d1f143e93573ac43b65e76646150f83e24bd8c18786303c
 lsof_4.95.0.linux.tar.bz2
 sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1
 dialects/linux/dproto.h
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index feb6a744e..21a327b99 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LSOF_VERSION = 4.94.0
+LSOF_VERSION = 4.95.0
 LSOF_SOURCE = lsof_$(LSOF_VERSION).linux.tar.bz2
 LSOF_SITE =
https://github.com/lsof-org/lsof/releases/download/$(LSOF_VERSION)
 LSOF_LICENSE = lsof license
-- 
2.34.1

--00000000000024726905e0edc697
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>remove merged patch<br><br>Signed-off-by: Francois Per=
rad &lt;<a href=3D"mailto:francois.perrad@gadz.org">francois.perrad@gadz.or=
g</a>&gt;<br>---<br>=C2=A0package/lsof/0001-remove-susvlegacy-funcs.patch |=
 12 ------------<br>=C2=A0package/lsof/lsof.hash =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02=
 +-<br>=C2=A0package/lsof/<a href=3D"http://lsof.mk">lsof.mk</a> =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A02 +-<br>=C2=A03 files changed, 2 insertions(+), 14 del=
etions(-)<br>=C2=A0delete mode 100644 package/lsof/0001-remove-susvlegacy-f=
uncs.patch<br><br>diff --git a/package/lsof/0001-remove-susvlegacy-funcs.pa=
tch b/package/lsof/0001-remove-susvlegacy-funcs.patch<br>deleted file mode =
100644<br>index fca66aee5..000000000<br>--- a/package/lsof/0001-remove-susv=
legacy-funcs.patch<br>+++ /dev/null<br>@@ -1,12 +0,0 @@<br>-diff -rdup lsof=
_4.81.orig/lsof_4.81_src/dialects/linux/machine.h lsof_4.81/lsof_4.81_src/d=
ialects/linux/machine.h<br>---- a/dialects/linux/machine.h	2007-04-24 18:20=
:58.000000000 +0200<br>-+++ b/dialects/linux/machine.h	2007-05-15 12:17:03.=
000000000 +0200<br>-@@ -616,6 +616,6 @@<br>- =C2=A0* zeromem is a macro tha=
t uses bzero or memset.<br>- =C2=A0*/<br>- <br>--#define	zeromem(a, l)	bzer=
o(a, l)<br>-+#define	zeromem(a, l)	memset(a, 0, l)<br>- <br>- #endif	/* !de=
fined(LSOF_MACHINE_H) */<br>-<br>diff --git a/package/lsof/lsof.hash b/pack=
age/lsof/lsof.hash<br>index 9e72023d3..7318c608c 100644<br>--- a/package/ls=
of/lsof.hash<br>+++ b/package/lsof/lsof.hash<br>@@ -1,3 +1,3 @@<br>=C2=A0# =
Locally calculated<br>-sha256 =C2=A0c41709c2543ecf9de1e950795790a9786a2f225=
e51c3cc53d6a9a256f872472b =C2=A0lsof_4.94.0.linux.tar.bz2<br>+sha256 =C2=A0=
e9faa0fbcc48638c1d1f143e93573ac43b65e76646150f83e24bd8c18786303c =C2=A0lsof=
_4.95.0.linux.tar.bz2<br>=C2=A0sha256 =C2=A032a728188b19bf86917659d904ab29d=
0a294b4506e1c98b8b7f1c70ab4975fe1 =C2=A0dialects/linux/dproto.h<br>diff --g=
it a/package/lsof/<a href=3D"http://lsof.mk">lsof.mk</a> b/package/lsof/<a =
href=3D"http://lsof.mk">lsof.mk</a><br>index feb6a744e..21a327b99 100644<br=
>--- a/package/lsof/<a href=3D"http://lsof.mk">lsof.mk</a><br>+++ b/package=
/lsof/<a href=3D"http://lsof.mk">lsof.mk</a><br>@@ -4,7 +4,7 @@<br>=C2=A0#<=
br>=C2=A0##################################################################=
##############<br>=C2=A0<br>-LSOF_VERSION =3D 4.94.0<br>+LSOF_VERSION =3D 4=
.95.0<br>=C2=A0LSOF_SOURCE =3D lsof_$(LSOF_VERSION).linux.tar.bz2<br>=C2=A0=
LSOF_SITE =3D <a href=3D"https://github.com/lsof-org/lsof/releases/download=
/$(LSOF_VERSION)">https://github.com/lsof-org/lsof/releases/download/$(LSOF=
_VERSION)</a><br>=C2=A0LSOF_LICENSE =3D lsof license<br>-- <br>2.34.1<br><b=
r><br></div>

--00000000000024726905e0edc697--

--===============1212374255787175893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1212374255787175893==--
