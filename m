Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C81C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 04:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7958340C6A;
	Wed, 30 Mar 2022 04:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kw-3dypHeYA4; Wed, 30 Mar 2022 04:05:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E78D40C5B;
	Wed, 30 Mar 2022 04:05:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 549BC1BF5EA
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 04:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40B30844F4
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 04:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AAnwxBMTg8yd for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 04:05:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAED7844F3
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 04:05:47 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id x20so34824170ybi.5
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 21:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=TK5keihkWXiB+JVdU6OVza3eIyQK+A535Td05h0xBmw=;
 b=ZUOHR4crEuqgWFp4VkyDSzNciTelEodxm+0w1AhuMYxEW6q2xAhielLsap5pJermmH
 LJftcjIXidUEgqz0EBI1fDDvOMua3sUTqbnM49FTZCvm36CL3AQHgo1M7fkPcS/G3zDc
 X+VfaHLtzNb5BsOeeDQondArAfQ0B9EPeoeOvdEezR0I8o8w57v5jNbjtMlqnxyn5ASx
 DUaJlkI/XH4M2PcyeJJgJ6fPOyy4mRCo3eg94r8QbM8nSU7nVpJhcLMp7S6ojz3er/6g
 KbCDxnUFKF36lb0NF/FTCyUpvgJR43w4HVCYcjbEAggq9EwQzdbhPACu8PhJQAotI9J2
 +JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TK5keihkWXiB+JVdU6OVza3eIyQK+A535Td05h0xBmw=;
 b=v13A+pAX+WE5FldkR+Zl8yKekHFUQvU7pW1r03W0DirJGlUe3mqx2BkHy0KG1/nZNq
 kk1wp6xAZ8xnHlBsBK4PDZ8/LhZ+066wKeMsZlTwaRCxbZGNtvc65DKQcoh1IoP8+DeB
 AZ/P0t1l4Vn6pj6Aw+eXp7wTKTUhyhBc43BQzZgkpdTLmUOTF/OHauWKLS+EgffWrtOE
 kb9WgOI6nym4aoPalze5xLNPWy6IBT2fORDlWsFPZcOX5UDvuKYuRfpzOPIbFMvTpRSV
 WanvridCKiqB+SeaZ/EQn6ZKwS65OzK1lJeD4GwzzVI4/FoB/6hwFCrddfArZ12Dvc12
 HSyA==
X-Gm-Message-State: AOAM531BdFOn+RFjujVKvbBDtOIIn5Phml3eJQBjIb0c/mrgLS1BIcZE
 TxNuObDMenpR6ocXg3YZBL3H788adaBA9LmnPeIqYw5AYDU=
X-Google-Smtp-Source: ABdhPJyaMgomd6ol/SBYs4H6dYGdLnP1Zv6GHg0Se9z92QymFETVPFQL0Ydm88YBif3PqsuGOKEFI/oFZgy1jFyXggE=
X-Received: by 2002:a25:cf56:0:b0:633:8fbc:774c with SMTP id
 f83-20020a25cf56000000b006338fbc774cmr31201896ybg.570.1648613146737; Tue, 29
 Mar 2022 21:05:46 -0700 (PDT)
MIME-Version: 1.0
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Wed, 30 Mar 2022 01:05:36 -0300
Message-ID: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] [PATCH 1/1] package/pkg-python.mk: fix PEP517 purelib
 deployment path
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
Content-Type: multipart/mixed; boundary="===============5932845222325806382=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5932845222325806382==
Content-Type: multipart/alternative; boundary="000000000000fbc13005db67a87e"

--000000000000fbc13005db67a87e
Content-Type: text/plain; charset="UTF-8"

package/pkg-python.mk: fix PEP517 purelib deployment path

This allows the Python interpreter to find packages built via the new Flit
infrastructure and fixes bug #14721.
Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 52ce402281..6aaca1f465 100644
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
@@ -149,7 +149,7 @@ HOST_PKG_PYTHON_PEP517_ENV = \
 HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
  --interpreter=/usr/bin/python \
  --script-kind=posix \
- --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+
--purelib=$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
  --headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
  --scripts=$(HOST_DIR)/usr/bin \
  --data=$(HOST_DIR)/usr

--000000000000fbc13005db67a87e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">package/<a href=3D"http://pkg-python.mk">pkg-python.mk</a>=
: fix PEP517 purelib deployment path<br><br>This allows the Python interpre=
ter to find packages built via the new Flit<br>infrastructure and fixes bug=
 #14721.<br>Signed-off-by: Emile Cormier &lt;<a href=3D"mailto:emile.cormie=
r.jr@gmail.com">emile.cormier.jr@gmail.com</a>&gt; <br><br>diff --git a/pac=
kage/<a href=3D"http://pkg-python.mk">pkg-python.mk</a> b/package/<a href=
=3D"http://pkg-python.mk">pkg-python.mk</a><br>index 52ce402281..6aaca1f465=
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
IR)/usr<br>@@ -149,7 +149,7 @@ HOST_PKG_PYTHON_PEP517_ENV =3D \<br>=C2=A0HO=
ST_PKG_PYTHON_PEP517_INSTALL_OPTS =3D \<br>=C2=A0	--interpreter=3D/usr/bin/=
python \<br>=C2=A0	--script-kind=3Dposix \<br>-	--purelib=3D$(HOST_DIR)/lib=
/python$(PYTHON3_VERSION_MAJOR)/site-packages \<br>+	--purelib=3D$(HOST_DIR=
)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \<br>=C2=A0	--header=
s=3D$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) =C2=A0\<br>=C2=
=A0	--scripts=3D$(HOST_DIR)/usr/bin \<br>=C2=A0	--data=3D$(HOST_DIR)/usr</d=
iv>

--000000000000fbc13005db67a87e--

--===============5932845222325806382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5932845222325806382==--
