Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28BEC43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 11:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EBCB4014D;
	Wed,  8 Jun 2022 11:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zn-AkJGy7Ch5; Wed,  8 Jun 2022 11:10:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71A9E40025;
	Wed,  8 Jun 2022 11:10:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 995871BF574
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 11:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8808484000
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 11:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WgqaZLDPDBME for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 11:09:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05FF583FF6
 for <buildroot@busybox.net>; Wed,  8 Jun 2022 11:09:56 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id 63so6793607uaw.10
 for <buildroot@busybox.net>; Wed, 08 Jun 2022 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=/pWZEtQva03k5rnAEFvYA4AixCI9hBmVXcv8KK5jB4M=;
 b=RR/B6YPyOz4GfplwHoKUhJTce53BMrE/MGR0E9QYM+L7dkvQGq4cHgx5icskDcfkOq
 R8CIqxUl9wm9xPBh9xUgM8Qh31dbqJn/FMC64PRarzYLfqAr5veGXdx4FDf4xsua5m9C
 ZSGLNIWK00wWIUl3nq27TbsNHC/ASjDC750y0X1yG3n+sr8BcS7wtslAlk0x2sXl4OZy
 iOqRBUn8Um3KKrRVB66XzRcZkrOkLBPtp5EEfORdmEVUKrHVvGGxjaKWtfgoNmGR4GzI
 zInCkRBWyPSNl/nZSz9KqWtgpCD/nSnNVaHnbuYuSGMtqKzV6jS3CqygzcbbXUMpmStz
 SiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=/pWZEtQva03k5rnAEFvYA4AixCI9hBmVXcv8KK5jB4M=;
 b=IBLdWvqrsN1WAM4oxZJ18Ht4CKwGfueh6uZEHoO4zqr8yle76doIwFMf/JDSwrxd32
 s1m4Ggl0Sl++6MHWY6fBVKct6knv//VqdfINf34ltGpDtzqvOCEkQ/tKa8qCawiqvtVr
 X6Zybgm35ioQX/JUXSr6jVZXlQRzKJdWKJ+u/xqGjKqgk8P+qL/zS1JHx14NY62k7e6J
 BbvySZnOZavEDqjlc3kiID5npq0EG/W7zp7iJeliLA9pAdPDFtk4N8DJ+ErU2ACkKbTy
 4WA/i3n2QotDEM2X4u2eN81flAbhUUHTlOVbXiCam3j/v/ATyaXuMzd7pwH7QcsJBV74
 Kleg==
X-Gm-Message-State: AOAM531EZUg0QNf/TqwNRhlnzbeTGBqhDnZgsMgYqrPT1ZzcomB814Ks
 lETgVEIT46z6o4ha/N4wYjG5qO2xflqHobPQUDKAgd8rhxA=
X-Google-Smtp-Source: ABdhPJzcWft061xyfIxNAbO0oGvAquAq8eEVuhkjbvyF9iCOl1x79dPfwdwn9C7Uir8rObc8r/VZn8zmIER/XEauCvU=
X-Received: by 2002:ab0:6594:0:b0:378:d566:e982 with SMTP id
 v20-20020ab06594000000b00378d566e982mr7749109uam.22.1654686595799; Wed, 08
 Jun 2022 04:09:55 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Wed, 8 Jun 2022 13:09:44 +0200
Message-ID: <CAGhdn543kyd=cz3i1TWcbb=CtWj-4Bco6XgZ5PyUXmgzXx6E-A@mail.gmail.com>
To: buildroot <buildroot@busybox.net>
Subject: [Buildroot] [PATCH] package/iptables: bump to version 1.8.8
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
Content-Type: multipart/mixed; boundary="===============6187681385067844078=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6187681385067844078==
Content-Type: multipart/alternative; boundary="000000000000c1ddf705e0edbeb7"

--000000000000c1ddf705e0edbeb7
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/iptables/iptables.hash | 2 +-
 package/iptables/iptables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index 7f1441393..f4e5ae159 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/iptables/downloads.html
-sha256  c109c96bb04998cd44156622d36f8e04b140701ec60531a10668cfdff5e8d8f0
 iptables-1.8.7.tar.bz2
+sha256  71c75889dc710676631553eb1511da0177bbaaf1b551265b912d236c3f51859f
 iptables-1.8.8.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
 COPYING
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 555bb384f..a54194a8c 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-IPTABLES_VERSION = 1.8.7
+IPTABLES_VERSION = 1.8.8
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = https://netfilter.org/projects/iptables/files
 IPTABLES_INSTALL_STAGING = YES
-- 
2.34.1

--000000000000c1ddf705e0edbeb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:f=
rancois.perrad@gadz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;=
<br>---<br>=C2=A0package/iptables/iptables.hash | 2 +-<br>=C2=A0package/ipt=
ables/<a href=3D"http://iptables.mk" target=3D"_blank">iptables.mk</a> =C2=
=A0 | 2 +-<br>=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br><br=
>diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.ha=
sh<br>index 7f1441393..f4e5ae159 100644<br>--- a/package/iptables/iptables.=
hash<br>+++ b/package/iptables/iptables.hash<br>@@ -1,4 +1,4 @@<br>=C2=A0# =
From <a href=3D"https://netfilter.org/projects/iptables/downloads.html" tar=
get=3D"_blank">https://netfilter.org/projects/iptables/downloads.html</a><b=
r>-sha256 =C2=A0c109c96bb04998cd44156622d36f8e04b140701ec60531a10668cfdff5e=
8d8f0 =C2=A0iptables-1.8.7.tar.bz2<br>+sha256 =C2=A071c75889dc710676631553e=
b1511da0177bbaaf1b551265b912d236c3f51859f =C2=A0iptables-1.8.8.tar.bz2<br>=
=C2=A0# Locally calculated<br>=C2=A0sha256 =C2=A08177f97513213526df2cf6184d=
8ff986c675afb514d4e68a404010521b880643 =C2=A0COPYING<br>diff --git a/packag=
e/iptables/<a href=3D"http://iptables.mk" target=3D"_blank">iptables.mk</a>=
 b/package/iptables/<a href=3D"http://iptables.mk" target=3D"_blank">iptabl=
es.mk</a><br>index 555bb384f..a54194a8c 100644<br>--- a/package/iptables/<a=
 href=3D"http://iptables.mk" target=3D"_blank">iptables.mk</a><br>+++ b/pac=
kage/iptables/<a href=3D"http://iptables.mk" target=3D"_blank">iptables.mk<=
/a><br>@@ -4,7 +4,7 @@<br>=C2=A0#<br>=C2=A0################################=
################################################<br>=C2=A0<br>-IPTABLES_VER=
SION =3D 1.8.7<br>+IPTABLES_VERSION =3D 1.8.8<br>=C2=A0IPTABLES_SOURCE =3D =
iptables-$(IPTABLES_VERSION).tar.bz2<br>=C2=A0IPTABLES_SITE =3D <a href=3D"=
https://netfilter.org/projects/iptables/files" target=3D"_blank">https://ne=
tfilter.org/projects/iptables/files</a><br>=C2=A0IPTABLES_INSTALL_STAGING =
=3D YES<br>-- <br>2.34.1<br><br><br></div>

--000000000000c1ddf705e0edbeb7--

--===============6187681385067844078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6187681385067844078==--
