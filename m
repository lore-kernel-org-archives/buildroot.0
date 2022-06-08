Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3C1C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 11:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21682607C0;
	Wed,  8 Jun 2022 11:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39tuqA6y50zP; Wed,  8 Jun 2022 11:12:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D479F60D58;
	Wed,  8 Jun 2022 11:12:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EADF21BF574
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 11:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D63B083FFA
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 11:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iSOG8zRyQ4Ti for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 11:12:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 082F883FF6
 for <buildroot@busybox.net>; Wed,  8 Jun 2022 11:12:37 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id r22so6803470ual.3
 for <buildroot@busybox.net>; Wed, 08 Jun 2022 04:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=CKNzrn1mi3XbbcIIsChVYGjfurBYaGCrqHHu+gXXSkc=;
 b=czQZY+yCw4tEqR5IUigxvRfyIPYG3FD9UodGPNUgcTS77Tz69LTfV2PiDkuv8AKtSJ
 A5mgsQt3BJ6LGmgEpp/Id9dQc3qc7EjLUfo2caLP4uIndfkJC3AEreSqnTskH/PVbBMP
 5Q3cM0pq9NifEp/bAcywcVjumU1fu1uFiCelKvCF3d+j/JXplB4ySXwwRFIsptKdW2TH
 62WPhYqw3ep6A8XjdhuFRgByvKf+zTZI6AprOA7EwQu/IV5S8pRHndzVny9e29PcbPvz
 +PXE2f+M/bVLedN05RoOMKwx3o9M5gBPVm89xDO7mhVkjtKf/T4u6UfhBknGlIvXYr/p
 NYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=CKNzrn1mi3XbbcIIsChVYGjfurBYaGCrqHHu+gXXSkc=;
 b=cN9RV9PVvsq8jznGMFTBJZxoJuNJPKmrugoMEq3+YdGc1Z9ypOju5xvURohglGSPrr
 Xt7HFkdlmcFPlbp6AIi3eCpKuSnU+6zO4NQl2guCXK0GtKZUR4QNCO7R9Zz1FNQrmSY5
 tiR/r2k5zhzOd5L6U8OxkzKs5nXM/X58o0gKFePHfIOlchhGc7eneyK6yDUL8HpkRj+r
 PjYnEcM58x2qdVBgckgRde51HVqaOgdjGXMfLAC68Q9ilBoRCoKDMEhkpzB764w4A08h
 d3XMBtVEZQ2QMNxP5EcTqcqqtvW6+JRajdzC4m7J3Fr1Qh7yopaGMzxQV7MdcW9zN0IK
 vwzQ==
X-Gm-Message-State: AOAM530lvR0LW36SUnTJisL3PzmGIobDBSHZBzUghN12cl1GtL63wlLv
 W6CXVeWq9sNkZLaC1O+fWnoNCCsqHKGe3maKskRzerZU4eIQRQ==
X-Google-Smtp-Source: ABdhPJyy2wWUpv1eeaGWBGJT1JhZGq/ErM9o4OC0xSdnDXMUV+6gkz1FtkONwdT6UD6QITdKgBVGj1Ja/JfNDLdlG04=
X-Received: by 2002:ab0:2747:0:b0:373:5408:d086 with SMTP id
 c7-20020ab02747000000b003735408d086mr18913188uap.12.1654686756744; Wed, 08
 Jun 2022 04:12:36 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Wed, 8 Jun 2022 13:12:25 +0200
Message-ID: <CAGhdn56=cLpRmgV0HQW3r1DPECZs_R-LZt8xJ88yfSNwjoL6=g@mail.gmail.com>
To: buildroot <buildroot@busybox.net>
Subject: [Buildroot] [PATCH] package/nettle: bump to version 3.8
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
Content-Type: multipart/mixed; boundary="===============8144307278179490825=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8144307278179490825==
Content-Type: multipart/alternative; boundary="00000000000059b54905e0edc879"

--00000000000059b54905e0edc879
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/nettle/nettle.hash | 4 ++--
 package/nettle/nettle.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index cd32ad442..14467977b 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/nettle/nettle-3.7.3.tar.gz.sig
-sha256  661f5eb03f048a3b924c3a8ad2515d4068e40f67e774e8a26827658007e3bcf0
 nettle-3.7.3.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.8.tar.gz.sig
+sha256  7576c68481c198f644b08c160d1a4850ba9449e308069455b5213319f234e8e6
 nettle-3.8.tar.gz
 # Locally calculated
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c
 COPYING.LESSERv3
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
 COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 3dbd0cb94..7520fb9fd 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-NETTLE_VERSION = 3.7.3
+NETTLE_VERSION = 3.8
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
-- 
2.34.1

--00000000000059b54905e0edc879
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:f=
rancois.perrad@gadz.org">francois.perrad@gadz.org</a>&gt;<br>---<br>=C2=A0p=
ackage/nettle/nettle.hash | 4 ++--<br>=C2=A0package/nettle/<a href=3D"http:=
//nettle.mk">nettle.mk</a> =C2=A0 | 2 +-<br>=C2=A02 files changed, 3 insert=
ions(+), 3 deletions(-)<br><br>diff --git a/package/nettle/nettle.hash b/pa=
ckage/nettle/nettle.hash<br>index cd32ad442..14467977b 100644<br>--- a/pack=
age/nettle/nettle.hash<br>+++ b/package/nettle/nettle.hash<br>@@ -1,6 +1,6 =
@@<br>=C2=A0# Locally calculated after checking pgp signature<br>-# <a href=
=3D"https://ftp.gnu.org/gnu/nettle/nettle-3.7.3.tar.gz.sig">https://ftp.gnu=
.org/gnu/nettle/nettle-3.7.3.tar.gz.sig</a><br>-sha256 =C2=A0661f5eb03f048a=
3b924c3a8ad2515d4068e40f67e774e8a26827658007e3bcf0 =C2=A0nettle-3.7.3.tar.g=
z<br>+# <a href=3D"https://ftp.gnu.org/gnu/nettle/nettle-3.8.tar.gz.sig">ht=
tps://ftp.gnu.org/gnu/nettle/nettle-3.8.tar.gz.sig</a><br>+sha256 =C2=A0757=
6c68481c198f644b08c160d1a4850ba9449e308069455b5213319f234e8e6 =C2=A0nettle-=
3.8.tar.gz<br>=C2=A0# Locally calculated<br>=C2=A0sha256 =C2=A0a853c2ffec17=
057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c =C2=A0COPYING.LESSERv3=
<br>=C2=A0sha256 =C2=A08177f97513213526df2cf6184d8ff986c675afb514d4e68a4040=
10521b880643 =C2=A0COPYINGv2<br>diff --git a/package/nettle/<a href=3D"http=
://nettle.mk">nettle.mk</a> b/package/nettle/<a href=3D"http://nettle.mk">n=
ettle.mk</a><br>index 3dbd0cb94..7520fb9fd 100644<br>--- a/package/nettle/<=
a href=3D"http://nettle.mk">nettle.mk</a><br>+++ b/package/nettle/<a href=
=3D"http://nettle.mk">nettle.mk</a><br>@@ -4,7 +4,7 @@<br>=C2=A0#<br>=C2=A0=
###########################################################################=
#####<br>=C2=A0<br>-NETTLE_VERSION =3D 3.7.3<br>+NETTLE_VERSION =3D 3.8<br>=
=C2=A0NETTLE_SITE =3D <a href=3D"http://www.lysator.liu.se/~nisse/archive">=
http://www.lysator.liu.se/~nisse/archive</a><br>=C2=A0NETTLE_DEPENDENCIES =
=3D gmp<br>=C2=A0NETTLE_INSTALL_STAGING =3D YES<br>-- <br>2.34.1<br><br><br=
></div>

--00000000000059b54905e0edc879--

--===============8144307278179490825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8144307278179490825==--
