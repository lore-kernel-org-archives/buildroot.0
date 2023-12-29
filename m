Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F038C47073
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 18:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD741813FD;
	Fri, 29 Dec 2023 18:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD741813FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivIqlaxJ1fck; Fri, 29 Dec 2023 18:09:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E7728142F;
	Fri, 29 Dec 2023 18:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E7728142F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC2CB1BF2CF
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 18:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DCEE60A89
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 18:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DCEE60A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UIufkc2YqqXT for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 18:09:48 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16DB560A59
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 18:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16DB560A59
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 03B112096F02;
 Fri, 29 Dec 2023 19:09:46 +0100 (CET)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id hS16ASr_j3ZD; Fri, 29 Dec 2023 19:09:42 +0100 (CET)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
 by mx.kolabnow.com (Postfix) with ESMTPS id 7186520C81F3;
 Fri, 29 Dec 2023 19:09:41 +0100 (CET)
Received: from int-subm015.mykolab.com (unknown [10.9.37.15])
 by int-mx009.mykolab.com (Postfix) with ESMTPS id 61952217142A;
 Fri, 29 Dec 2023 19:09:41 +0100 (CET)
MIME-Version: 1.0
Date: Fri, 29 Dec 2023 19:09:41 +0100
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20231229131931.1103804-1-zgyarmati@zgyarmati.de>
References: <20231229131931.1103804-1-zgyarmati@zgyarmati.de>
Message-ID: <76a9e8217214b99451dd6711a21257c0@zgyarmati.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-type:content-type:message-id:references:in-reply-to
 :subject:subject:from:from:date:date:mime-version:received
 :received:received; s=dkim20160331; t=1703873382; x=1705687783;
 bh=sOF8rBxr0KxB6nPVUdwneWMiStNhJeH2vQhHTHJN1mM=; b=dk9qYZbeg+zk
 uYIFC6klDTBjUB2IBrfYf4nXyRFgXFiOAsjiuJOjSIII5WOxHO9lsxuHji0Kgodx
 TqTcNmN3yDNJSOLmEI5yZO7AeB8mhukM2n/M+tPuMPMPEAH6xFhv5XpBKjXtEobp
 yZz3Sy5mm6GSjqc7/l9cQgu/GH36OiAfIc6eSqdxnKv276c7u80kMBuwymALcDmN
 oPomc3nSa4LMLdcLzmn/vLXkThyn3t7BncvuoInmPL5cEwZ1F/A0SVat70zmYjFg
 JhuxfXf8F23ZJirMzrqDNZ1bATVwtv/WwuZjbcfa2xvCQ93lxB7nRnOuyG80UOmW
 MBp/XnzmyQ5A7Vlk/rGkhv5Ou5A54lDm80/dN5VxTtdgrDEx98RUnE3SXUUV1wbS
 RWE+Y8L3zxBhb2GXOZRF4J4ifTmVLPohNiF4BczI74xnm0RSioJWQP0/uwP4NTJi
 ZSqmX29/alTNiC/wUDMQtzX+nyGIpNV4tQwj+sl1byzgvMl1666ztvzaU8A7qxta
 QTN+ymA2Jcn57TMswdTmJWUs0tXdkz6296P/tad2Ehigy1Rl0iMr5GK4KrGiUwKY
 pSnL2z6bOqSyImRxkELiACCrKC4WOSmj5g7jSGTHAnstOcoZvz+fiVaN005XYN8u
 Jt5pkjL0psbUU4nfWSwpvUuajl4iigg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com
 header.a=rsa-sha256 header.s=dkim20160331 header.b=dk9qYZbe
X-Mailman-Original-Authentication-Results: ext-mx-out011.mykolab.com (amavis); 
 dkim=pass (4096-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: Re: [Buildroot] [PATCH] package/shapelib: bump to version 1.6.0
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
Content-Type: multipart/mixed; boundary="===============4487778090292854144=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4487778090292854144==
Content-Type: multipart/alternative;
 boundary="=_e372fb917f27dbe1193f41ec30f50b17"

--=_e372fb917f27dbe1193f41ec30f50b17
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed



Dear Fabrice&All,

please ignore this, i just wanted to add an Acked-by: trailer and not 
resend the patch. Sorry about the noise...

On 2023-12-29 14:19, Zoltan Gyarmati wrote:

> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> - Drop patch (already in version)
> - Update hash of web/license.html because SPDX identifier is used since
> https://github.com/OSGeo/shapelib/commit/6bf68d3086f49245470fc24b121afbbeb8e9c4f2
> - COPYING has been replaced by LICENSE-LGPL and LICENSE-MIT since
> https://github.com/OSGeo/shapelib/commit/1638416feefcee4a1eeef9aab573a5ce44be1f3e
> 
> https://github.com/OSGeo/shapelib/releases/tag/v1.6.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Acked-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
> .checkpackageignore                           |  1 -
> ...Remove-double-free-in-contrib-shpsrt.patch | 26 -------------------
> package/shapelib/shapelib.hash                |  7 ++---
> package/shapelib/shapelib.mk                  |  7 ++---
> 4 files changed, 6 insertions(+), 35 deletions(-)
> delete mode 100644 
> package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 0868593a92..dd5d2735fe 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1259,7 +1259,6 @@ 
> package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch 
> Upstream
> package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch 
> Upstream
> package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch 
> Upstream
> package/shairport-sync/S99shairport-sync Indent Shellcheck Variables
> -package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch 
> Upstream
> package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch 
> Upstream
> package/shellinabox/0001-Makefile-disable-always-building-statically.patch 
> Upstream
> package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch 
> Upstream
> diff --git 
> a/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch 
> b/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
> deleted file mode 100644
> index a565874b8c..0000000000
> --- a/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From c75b9281a5b9452d92e1682bdfe6019a13ed819f Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Albin=20Eldst=C3=A5l-Ahrens?= <laeder.keps@gmail.com>
> -Date: Mon, 3 Jan 2022 12:34:41 +0100
> -Subject: [PATCH] Remove double free() in contrib/shpsrt, issue #39
> -
> -This fixes issue #39
> -
> -[Retrieved from:
> -https://github.com/OSGeo/shapelib/commit/c75b9281a5b9452d92e1682bdfe6019a13ed819f]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - contrib/shpsort.c | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/contrib/shpsort.c b/contrib/shpsort.c
> -index e21e9e0..920cd8c 100644
> ---- a/contrib/shpsort.c
> -+++ b/contrib/shpsort.c
> -@@ -113,7 +113,6 @@ static char ** split(const char *arg, const char 
> *delim) {
> -     free(result[--i]);
> -       }
> -       free(result);
> --      free(copy);
> -       return NULL;
> -     }
> -     result = tmp;
> diff --git a/package/shapelib/shapelib.hash 
> b/package/shapelib/shapelib.hash
> index b016fef5cf..f542ee79ac 100644
> --- a/package/shapelib/shapelib.hash
> +++ b/package/shapelib/shapelib.hash
> @@ -1,4 +1,5 @@
> # Locally computed
> -sha256  
> 1fc0a480982caef9e7b9423070b47750ba34cd0ba82668f2e638fab1d07adae1  
> shapelib-1.5.0.tar.gz
> -sha256  
> 7eb803a70990017a1c4e38a8342d7413c5dfeec3ed1ac407e15ae2c274e560ff  
> COPYING
> -sha256  
> a638278f7f1cb7d0cdc73b47a6c87261b882e356a8e79922e90d44d7ef1dd2c7  
> web/license.html
> +sha256  
> 19528b24377241705637320c367943031ad5088665d1fb0e1eaa52a71264a6c4  
> shapelib-1.6.0.tar.gz
> +sha256  
> 681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  
> LICENSE-LGPL
> +sha256  
> 67f1348ec73ef6343f0dbb3fa0612c321da4073e1ee68ffc99fcd3f2d2a65813  
> LICENSE-MIT
> +sha256  
> 15e1205bb007d4d7821f7b1cc461ba8d051647e86dbc9baf1bb6f68b10588eeb  
> web/license.html
> diff --git a/package/shapelib/shapelib.mk 
> b/package/shapelib/shapelib.mk
> index 37d2d9ae64..a36a65f80e 100644
> --- a/package/shapelib/shapelib.mk
> +++ b/package/shapelib/shapelib.mk
> @@ -4,14 +4,11 @@
> #
> ################################################################################
> 
> -SHAPELIB_VERSION = 1.5.0
> +SHAPELIB_VERSION = 1.6.0
> SHAPELIB_SITE = http://download.osgeo.org/shapelib
> SHAPELIB_LICENSE = MIT or LGPL-2.0
> -SHAPELIB_LICENSE_FILES = web/license.html COPYING
> +SHAPELIB_LICENSE_FILES = LICENSE-LGPL LICENSE-MIT web/license.html
> SHAPELIB_CPE_ID_VENDOR = osgeo
> SHAPELIB_INSTALL_STAGING = YES
> 
> -# 0001-Remove-double-free-in-contrib-shpsrt.patch
> -SHAPELIB_IGNORE_CVES += CVE-2022-0699
> -
> $(eval $(autotools-package))
> --
> 2.39.2

-- 
https://zgyarmati.de
--=_e372fb917f27dbe1193f41ec30f50b17
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt; font-family: Verdana,Gen=
eva,sans-serif'>
<p>Dear Fabrice&amp;All,</p>
<p><br /></p>
<p>please ignore this, i just wanted to add an Acked-by: trailer and not re=
send the patch. Sorry about the noise...</p>
<p><br /></p>
<p id=3D"reply-intro">On 2023-12-29 14:19, Zoltan Gyarmati wrote:</p>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
From: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com">fo=
ntaine.fabrice@gmail.com</a>&gt;<br /><br />- Drop patch (already in versio=
n)<br />- Update hash of web/license.html because SPDX identifier is used s=
ince<br />&nbsp;&nbsp;<a href=3D"https://github.com/OSGeo/shapelib/commit/6=
bf68d3086f49245470fc24b121afbbeb8e9c4f2" target=3D"_blank" rel=3D"noopener =
noreferrer">https://github.com/OSGeo/shapelib/commit/6bf68d3086f49245470fc2=
4b121afbbeb8e9c4f2</a><br />- COPYING has been replaced by LICENSE-LGPL and=
 LICENSE-MIT since<br />&nbsp;&nbsp;<a href=3D"https://github.com/OSGeo/sha=
pelib/commit/1638416feefcee4a1eeef9aab573a5ce44be1f3e" target=3D"_blank" re=
l=3D"noopener noreferrer">https://github.com/OSGeo/shapelib/commit/1638416f=
eefcee4a1eeef9aab573a5ce44be1f3e</a><br /><br /><a href=3D"https://github.c=
om/OSGeo/shapelib/releases/tag/v1.6.0" target=3D"_blank" rel=3D"noopener no=
referrer">https://github.com/OSGeo/shapelib/releases/tag/v1.6.0</a><br /><b=
r />Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@=
gmail.com">fontaine.fabrice@gmail.com</a>&gt;<br />Acked-by: Zoltan Gyarmat=
i &lt;<a href=3D"mailto:zgyarmati@zgyarmati.de">zgyarmati@zgyarmati.de</a>&=
gt;<br />---<br />&nbsp;.checkpackageignore &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;1 -<br />&nbsp;..=
=2ERemove-double-free-in-contrib-shpsrt.patch | 26 -------------------<br /=
>&nbsp;package/shapelib/shapelib.hash &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;7 ++---<br />&=
nbsp;package/shapelib/shapelib.mk &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;7 ++--=
-<br />&nbsp;4 files changed, 6 insertions(+), 35 deletions(-)<br />&nbsp;d=
elete mode 100644 package/shapelib/0001-Remove-double-free-in-contrib-shpsr=
t.patch<br /><br />diff --git a/.checkpackageignore b/.checkpackageignore<b=
r />index 0868593a92..dd5d2735fe 100644<br />--- a/.checkpackageignore<br /=
>+++ b/.checkpackageignore<br />@@ -1259,7 +1259,6 @@ package/shadowsocks-l=
ibev/0002-fix-maybe-uninitialized-errors.patch Upstream<br />&nbsp;package/=
shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch Ups=
tream<br />&nbsp;package/shairport-sync/0001-configure.ac-find-sndfile-thro=
ugh-pkg-config.patch Upstream<br />&nbsp;package/shairport-sync/S99shairpor=
t-sync Indent Shellcheck Variables<br />-package/shapelib/0001-Remove-doubl=
e-free-in-contrib-shpsrt.patch Upstream<br />&nbsp;package/shared-mime-info=
/0001-Remove-incorrect-dependency-from-install-data-hook.patch Upstream<br =
/>&nbsp;package/shellinabox/0001-Makefile-disable-always-building-staticall=
y.patch Upstream<br />&nbsp;package/shellinabox/0002-CVE-2018-16789-fix-for=
-broken-multipart-form-data.patch Upstream<br />diff --git a/package/shapel=
ib/0001-Remove-double-free-in-contrib-shpsrt.patch b/package/shapelib/0001-=
Remove-double-free-in-contrib-shpsrt.patch<br />deleted file mode 100644<br=
 />index a565874b8c..0000000000<br />--- a/package/shapelib/0001-Remove-dou=
ble-free-in-contrib-shpsrt.patch<br />+++ /dev/null<br />@@ -1,26 +0,0 @@<b=
r />-From c75b9281a5b9452d92e1682bdfe6019a13ed819f Mon Sep 17 00:00:00 2001=
<br />-From: =3D?UTF-8?q?Albin=3D20Eldst=3DC3=3DA5l-Ahrens?=3D &lt;<a href=
=3D"mailto:laeder.keps@gmail.com">laeder.keps@gmail.com</a>&gt;<br />-Date:=
 Mon, 3 Jan 2022 12:34:41 +0100<br />-Subject: [PATCH] Remove double free()=
 in contrib/shpsrt, issue #39<br />-<br />-This fixes issue #39<br />-<br /=
>-[Retrieved from:<br />-<a href=3D"https://github.com/OSGeo/shapelib/commi=
t/c75b9281a5b9452d92e1682bdfe6019a13ed819f" target=3D"_blank" rel=3D"noopen=
er noreferrer">https://github.com/OSGeo/shapelib/commit/c75b9281a5b9452d92e=
1682bdfe6019a13ed819f</a>]<br />-Signed-off-by: Fabrice Fontaine &lt;<a hre=
f=3D"mailto:fontaine.fabrice@gmail.com">fontaine.fabrice@gmail.com</a>&gt;<=
br />----<br />- contrib/shpsort.c | 1 -<br />- 1 file changed, 1 deletion(=
-)<br />-<br />-diff --git a/contrib/shpsort.c b/contrib/shpsort.c<br />-in=
dex e21e9e0..920cd8c 100644<br />---- a/contrib/shpsort.c<br />-+++ b/contr=
ib/shpsort.c<br />-@@ -113,7 +113,6 @@ static char ** split(const char *arg=
, const char *delim) {<br />- &nbsp;&nbsp;&nbsp;&nbsp;free(result[--i]);<br=
 />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />- &nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;free(result);<br />-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;free(copy);<=
br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return NULL;<br />- &nbsp;&nbsp;=
&nbsp;&nbsp;}<br />- &nbsp;&nbsp;&nbsp;&nbsp;result =3D tmp;<br />diff --gi=
t a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash<br />in=
dex b016fef5cf..f542ee79ac 100644<br />--- a/package/shapelib/shapelib.hash=
<br />+++ b/package/shapelib/shapelib.hash<br />@@ -1,4 +1,5 @@<br />&nbsp;=
# Locally computed<br />-sha256 &nbsp;1fc0a480982caef9e7b9423070b47750ba34c=
d0ba82668f2e638fab1d07adae1 &nbsp;shapelib-1.5.0.tar.gz<br />-sha256 &nbsp;=
7eb803a70990017a1c4e38a8342d7413c5dfeec3ed1ac407e15ae2c274e560ff &nbsp;COPY=
ING<br />-sha256 &nbsp;a638278f7f1cb7d0cdc73b47a6c87261b882e356a8e79922e90d=
44d7ef1dd2c7 &nbsp;web/license.html<br />+sha256 &nbsp;19528b24377241705637=
320c367943031ad5088665d1fb0e1eaa52a71264a6c4 &nbsp;shapelib-1.6.0.tar.gz<br=
 />+sha256 &nbsp;681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42=
e85366 &nbsp;LICENSE-LGPL<br />+sha256 &nbsp;67f1348ec73ef6343f0dbb3fa0612c=
321da4073e1ee68ffc99fcd3f2d2a65813 &nbsp;LICENSE-MIT<br />+sha256 &nbsp;15e=
1205bb007d4d7821f7b1cc461ba8d051647e86dbc9baf1bb6f68b10588eeb &nbsp;web/lic=
ense.html<br />diff --git a/package/shapelib/shapelib.mk b/package/shapelib=
/shapelib.mk<br />index 37d2d9ae64..a36a65f80e 100644<br />--- a/package/sh=
apelib/shapelib.mk<br />+++ b/package/shapelib/shapelib.mk<br />@@ -4,14 +4=
,11 @@<br />&nbsp;#<br />&nbsp;############################################=
####################################<br /><br />-SHAPELIB_VERSION =3D 1.5.0=
<br />+SHAPELIB_VERSION =3D 1.6.0<br />&nbsp;SHAPELIB_SITE =3D <a href=3D"h=
ttp://download.osgeo.org/shapelib" target=3D"_blank" rel=3D"noopener norefe=
rrer">http://download.osgeo.org/shapelib</a><br />&nbsp;SHAPELIB_LICENSE =
=3D MIT or LGPL-2.0<br />-SHAPELIB_LICENSE_FILES =3D web/license.html COPYI=
NG<br />+SHAPELIB_LICENSE_FILES =3D LICENSE-LGPL LICENSE-MIT web/license.ht=
ml<br />&nbsp;SHAPELIB_CPE_ID_VENDOR =3D osgeo<br />&nbsp;SHAPELIB_INSTALL_=
STAGING =3D YES<br /><br />-# 0001-Remove-double-free-in-contrib-shpsrt.pat=
ch<br />-SHAPELIB_IGNORE_CVES +=3D CVE-2022-0699<br />-<br />&nbsp;$(eval $=
(autotools-package))<br />--<br />2.39.2<br /><br /></div>
</blockquote>
<p><br /></p>
<div id=3D"signature">-- <br />
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
<a href=3D"https://zgyarmati.de" target=3D"_blank" rel=3D"noopener noreferr=
er">https://zgyarmati.de</a></div>
</div>
</body></html>

--=_e372fb917f27dbe1193f41ec30f50b17--

--===============4487778090292854144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4487778090292854144==--
