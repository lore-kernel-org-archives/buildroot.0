Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE45C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 11:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4545783FFA;
	Wed,  8 Jun 2022 11:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K9U8W-h6hyWA; Wed,  8 Jun 2022 11:11:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EB3983FE1;
	Wed,  8 Jun 2022 11:11:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 142231BF574
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 11:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10B5983FE1
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 11:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2AWm66bBua6r for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 11:11:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0846A83FBE
 for <buildroot@busybox.net>; Wed,  8 Jun 2022 11:11:20 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id i186so19343861vsc.9
 for <buildroot@busybox.net>; Wed, 08 Jun 2022 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=IeSNbld3hZYoBHRtLaujm3bFLXz5P16kBCCqD/kqe7w=;
 b=ESOWSVBsfdpraoTdSkhZdMWEI4xZrmTKp8gi0WFxJswjUTiu58Pkg+Y5Mhz09df7Ue
 EE/AhkAdUFIVvu48nnsWpsLwmHnx5uvIFufKZagASUNcNmYZDIeUO4c7VAbTz55P2NdJ
 XgXlrGVCQCf40fSdKJPKmy1ZPlk4GYigNCAI9lsRe4VOCw7AjjdsZAYe2J9nvRMwtATO
 hMNR0It6Q3CCPB7CwwHbMGHI4iyxnsXQy+OvQPujB07SDjn2ney579F9zi9BNqPvpX8c
 xzU1riDppFbikHUvL0/5u5k6zAWdK2N6C1Uy04kM3VueZmobdEgGwpAoyJd369wozcRW
 i7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=IeSNbld3hZYoBHRtLaujm3bFLXz5P16kBCCqD/kqe7w=;
 b=exsn9fCo3tFbV9/yUD7EB5wmO6kd99dr4tV0fdwO1sZvtRxH+oCQEoGPJpPMQ1/202
 Mw4AW/CbL/R6ebuwHqAy4sDxCzqQCIWb/5AVcs2aK5Oy4kn/3LoNu8Dvk+lLF1RizYX6
 eeoHkHDbEcjQ/mQcJa7QWF4QSeV3jADj8fWBRE3IyJ0PtcIcRmX6wO77/5aHFGBHGotm
 xFQiTDMPh4qTGm1L0+bZ3bdiU71LExaXXYD9HD91Z3sjItnLQnRC6Zf8aTZjVBr7Bha1
 QiIMWKag18wdlT7Hk9OpznPADNw5xfSH/55sEebTWziIev0egQXzfMFogT/J6AZiwe1z
 hmdA==
X-Gm-Message-State: AOAM533sUxwbq29vyE+eip/l70O1sVYWtBMnesqXgU/gQcsS0IZJL5cP
 KMh/xpsfvaIL0DcoZad2uiNOecWc0J+5JS3inIVo7zam/TMBbw==
X-Google-Smtp-Source: ABdhPJwnbz0YlpMbcciXlKzy6oxB+aggMpa+Xma3rNNodd+uBJXbhHH1pTXosC5yj8o7WuUP4pkx59DzmjETtUo+/WU=
X-Received: by 2002:a67:e019:0:b0:349:d44f:c843 with SMTP id
 c25-20020a67e019000000b00349d44fc843mr13981624vsl.54.1654686679724; Wed, 08
 Jun 2022 04:11:19 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Wed, 8 Jun 2022 13:11:08 +0200
Message-ID: <CAGhdn56+3FGsLJ0UmH1snEBdfwA5Fy_N881T_x6ybMqVKv5N7g@mail.gmail.com>
To: buildroot <buildroot@busybox.net>
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.34
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
Content-Type: multipart/mixed; boundary="===============7512935529526795561=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7512935529526795561==
Content-Type: multipart/alternative; boundary="000000000000c276e505e0edc314"

--000000000000c276e505e0edc314
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 23ce1f42b..c68c6e90f 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.33.sha256sum
-sha256  588b06522e25d1579e989b6f9d8a1bdbf2fe13cde01a04e904ff346a225e7801
 gtk+-3.24.33.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.34.sha256sum
+sha256  dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61edbe5eeefa852ec
 gtk+-3.24.34.tar.xz

 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c
 COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index cd0a75eb2..53d7f6898 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################

 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).33
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).34
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE =
http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.34.1

--000000000000c276e505e0edc314
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:f=
rancois.perrad@gadz.org">francois.perrad@gadz.org</a>&gt;<br>---<br>=C2=A0p=
ackage/libgtk3/libgtk3.hash | 4 ++--<br>=C2=A0package/libgtk3/<a href=3D"ht=
tp://libgtk3.mk">libgtk3.mk</a> =C2=A0 | 2 +-<br>=C2=A02 files changed, 3 i=
nsertions(+), 3 deletions(-)<br><br>diff --git a/package/libgtk3/libgtk3.ha=
sh b/package/libgtk3/libgtk3.hash<br>index 23ce1f42b..c68c6e90f 100644<br>-=
-- a/package/libgtk3/libgtk3.hash<br>+++ b/package/libgtk3/libgtk3.hash<br>=
@@ -1,5 +1,5 @@<br>-# From <a href=3D"https://download.gnome.org/sources/gt=
k+/3.24/gtk+-3.24.33.sha256sum">https://download.gnome.org/sources/gtk+/3.2=
4/gtk+-3.24.33.sha256sum</a><br>-sha256 =C2=A0588b06522e25d1579e989b6f9d8a1=
bdbf2fe13cde01a04e904ff346a225e7801 =C2=A0gtk+-3.24.33.tar.xz<br>+# From <a=
 href=3D"https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.34.sha256su=
m">https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.34.sha256sum</a><=
br>+sha256 =C2=A0dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61edbe5eeef=
a852ec =C2=A0gtk+-3.24.34.tar.xz<br>=C2=A0<br>=C2=A0# Hash for license file=
:<br>=C2=A0sha256 =C2=A0b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e=
29512acebd69c =C2=A0COPYING<br>diff --git a/package/libgtk3/<a href=3D"http=
://libgtk3.mk">libgtk3.mk</a> b/package/libgtk3/<a href=3D"http://libgtk3.m=
k">libgtk3.mk</a><br>index cd0a75eb2..53d7f6898 100644<br>--- a/package/lib=
gtk3/<a href=3D"http://libgtk3.mk">libgtk3.mk</a><br>+++ b/package/libgtk3/=
<a href=3D"http://libgtk3.mk">libgtk3.mk</a><br>@@ -5,7 +5,7 @@<br>=C2=A0##=
###########################################################################=
###<br>=C2=A0<br>=C2=A0LIBGTK3_VERSION_MAJOR =3D 3.24<br>-LIBGTK3_VERSION =
=3D $(LIBGTK3_VERSION_MAJOR).33<br>+LIBGTK3_VERSION =3D $(LIBGTK3_VERSION_M=
AJOR).34<br>=C2=A0LIBGTK3_SOURCE =3D gtk+-$(LIBGTK3_VERSION).tar.xz<br>=C2=
=A0LIBGTK3_SITE =3D <a href=3D"http://ftp.gnome.org/pub/gnome/sources/gtk+/=
$(LIBGTK3_VERSION_MAJOR)">http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIB=
GTK3_VERSION_MAJOR)</a><br>=C2=A0LIBGTK3_LICENSE =3D LGPL-2.0+<br>-- <br>2.=
34.1<br><br><br></div>

--000000000000c276e505e0edc314--

--===============7512935529526795561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7512935529526795561==--
