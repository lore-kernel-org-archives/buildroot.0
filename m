Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329E8C43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 11:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB23584000;
	Wed,  8 Jun 2022 11:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8HVU-qpJheb; Wed,  8 Jun 2022 11:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF2E883FE1;
	Wed,  8 Jun 2022 11:09:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D0731BF574
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 11:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22F1A83FE1
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 11:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gK7RMbAoB0q7 for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 11:09:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7532283FBE
 for <buildroot@busybox.net>; Wed,  8 Jun 2022 11:09:53 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id bj33so8430220vkb.12
 for <buildroot@busybox.net>; Wed, 08 Jun 2022 04:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ePARWCXARzZyENiezD119vidJdWRosClaipgwJx0Tqs=;
 b=l1KrDrwB+BtPVNP0w85kguOFUwgiFcrOgl0uxnLVlg010rafvQWJb0g74FUVWpjUB+
 m+ACkAcdLrldMcJnZvsdE1u+6miPTF8ZIzszS14yggNlE/UXw8elNfAcDT5wHGuhfBFm
 0Qm/g8cUw//LDuvsTTsFhr7F0qQOQiSwXjEthRuShVi+bGWSyzX5yzUjQwqH4Gh+qByF
 CW36XxctnWYgWFcg43XZ7NN9H75XPQVdqQWKtBJatnjnvLx/AalhAnsIfC6d0LxsdxqA
 lagq681EPkgmJALt0mCEeFZnv/f+rg21iAj0XDWfG39DZXcWvqclnRUdG4bAtO0JIZcf
 z++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ePARWCXARzZyENiezD119vidJdWRosClaipgwJx0Tqs=;
 b=M9WMbDSa+X9Hxw8iOwxzvhGVmTHtRGyi8ytvjoKxKCA4V96ad1jAVKuhJeVlGenEuV
 hYNerio7Yy9afWnksuN55zWx6yDO4xY+x5OWbiX/QEhTOtuUFG1pICz1N784irrVlCVG
 T7EHfkKKRxDbv1ZjX5W1tuCDHZm/P8c/KneusF/VV7kGHWS9hIoSphaF+eI/I24WpsnN
 bN1//0Fna5rd979qPkuSSqHuwpVBBBH1JJIOqIcFPeCm9ib1PsESnxbDsiT8PJVQY0dh
 SVqoSwuLhXwgHkq7Tomt911aQYajPrWvomlePYE4HOEVypbk+i1baVRf2oh1k7HfVYjQ
 ZaeA==
X-Gm-Message-State: AOAM532UYHPtgtwXD9+KDR546actn3HsZePQkuz+e4cXhfUZm2t0H82d
 ZHQP36ZO0U4OTjI/BkUms2Rd/gA7AachBtchkN/0wyxaodk=
X-Google-Smtp-Source: ABdhPJzMfpO2ZExxtmEh8TmNMAouP3c0ELe0xFkBqffafsARSUlinxF/p099nqyoL3kh1GE/2kCIoNkLwGFdkEBMnD8=
X-Received: by 2002:ac5:cff0:0:b0:35d:c9ae:119 with SMTP id
 m48-20020ac5cff0000000b0035dc9ae0119mr8098278vkf.5.1654686592250; Wed, 08 Jun
 2022 04:09:52 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Wed, 8 Jun 2022 13:09:40 +0200
Message-ID: <CAGhdn573s=DNrt3XBY9ZSKgf1tzh6tjnoqbmVRp14XtumeVGDQ@mail.gmail.com>
To: buildroot <buildroot@busybox.net>
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.2.1
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
Content-Type: multipart/mixed; boundary="===============2083284887219543367=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2083284887219543367==
Content-Type: multipart/alternative; boundary="0000000000008bb9e005e0edbe22"

--0000000000008bb9e005e0edbe22
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 908dd32c4..d43da1344 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From
https://github.com/htop-dev/htop/releases/download/3.2.0/htop-3.2.0.tar.xz.sha256
-sha256  e0f645d4ac324f2c4c48aaa7a3a96d007b95516559550be0b56e423fc5b6d783
 htop-3.2.0.tar.xz
+# From
https://github.com/htop-dev/htop/releases/download/3.2.1/htop-3.2.1.tar.xz.sha256
+sha256  5a17121cf1c69d2f2e557c0b29d45a2c353ab983f644742e1c2e4ece15aa6cbb
 htop-3.2.1.tar.xz

 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
 COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index cb8170a0a..df2ec2590 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-HTOP_VERSION = 3.2.0
+HTOP_VERSION = 3.2.1
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE =
https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-- 
2.34.1

--0000000000008bb9e005e0edbe22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:f=
rancois.perrad@gadz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;=
<br>---<br>=C2=A0package/htop/htop.hash | 4 ++--<br>=C2=A0package/htop/<a h=
ref=3D"http://htop.mk" target=3D"_blank">htop.mk</a> =C2=A0 | 2 +-<br>=C2=
=A02 files changed, 3 insertions(+), 3 deletions(-)<br><br>diff --git a/pac=
kage/htop/htop.hash b/package/htop/htop.hash<br>index 908dd32c4..d43da1344 =
100644<br>--- a/package/htop/htop.hash<br>+++ b/package/htop/htop.hash<br>@=
@ -1,5 +1,5 @@<br>-# From <a href=3D"https://github.com/htop-dev/htop/relea=
ses/download/3.2.0/htop-3.2.0.tar.xz.sha256" target=3D"_blank">https://gith=
ub.com/htop-dev/htop/releases/download/3.2.0/htop-3.2.0.tar.xz.sha256</a><b=
r>-sha256 =C2=A0e0f645d4ac324f2c4c48aaa7a3a96d007b95516559550be0b56e423fc5b=
6d783 =C2=A0htop-3.2.0.tar.xz<br>+# From <a href=3D"https://github.com/htop=
-dev/htop/releases/download/3.2.1/htop-3.2.1.tar.xz.sha256" target=3D"_blan=
k">https://github.com/htop-dev/htop/releases/download/3.2.1/htop-3.2.1.tar.=
xz.sha256</a><br>+sha256 =C2=A05a17121cf1c69d2f2e557c0b29d45a2c353ab983f644=
742e1c2e4ece15aa6cbb =C2=A0htop-3.2.1.tar.xz<br>=C2=A0<br>=C2=A0# Locally c=
alculated<br>=C2=A0sha256 =C2=A08177f97513213526df2cf6184d8ff986c675afb514d=
4e68a404010521b880643 =C2=A0COPYING<br>diff --git a/package/htop/<a href=3D=
"http://htop.mk" target=3D"_blank">htop.mk</a> b/package/htop/<a href=3D"ht=
tp://htop.mk" target=3D"_blank">htop.mk</a><br>index cb8170a0a..df2ec2590 1=
00644<br>--- a/package/htop/<a href=3D"http://htop.mk" target=3D"_blank">ht=
op.mk</a><br>+++ b/package/htop/<a href=3D"http://htop.mk" target=3D"_blank=
">htop.mk</a><br>@@ -4,7 +4,7 @@<br>=C2=A0#<br>=C2=A0######################=
##########################################################<br>=C2=A0<br>-HT=
OP_VERSION =3D 3.2.0<br>+HTOP_VERSION =3D 3.2.1<br>=C2=A0HTOP_SOURCE =3D ht=
op-$(HTOP_VERSION).tar.xz<br>=C2=A0HTOP_SITE =3D <a href=3D"https://github.=
com/htop-dev/htop/releases/download/$(HTOP_VERSION)" target=3D"_blank">http=
s://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)</a><br>=C2=
=A0HTOP_DEPENDENCIES =3D ncurses<br>-- <br>2.34.1<br><br><br></div>

--0000000000008bb9e005e0edbe22--

--===============2083284887219543367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2083284887219543367==--
