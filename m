Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCE4C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 22:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 898B041726;
	Fri, 29 Dec 2023 22:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 898B041726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0aTeRe9Nn6y; Fri, 29 Dec 2023 22:00:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 512A041548;
	Fri, 29 Dec 2023 22:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 512A041548
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C1A71BF5AA
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 22:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 648BE41BFF
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 22:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 648BE41BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RfsaxXxIRE5D for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 22:00:33 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A39FC41BF4
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 22:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A39FC41BF4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E5D14B004FF;
 Fri, 29 Dec 2023 23:00:28 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Dec 2023 23:00:28 +0100
Date: Fri, 29 Dec 2023 23:00:28 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <ZY9BfE33KCFqdVqY@landeda>
References: <20231229131931.1103804-1-zgyarmati@zgyarmati.de>
 <76a9e8217214b99451dd6711a21257c0@zgyarmati.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <76a9e8217214b99451dd6711a21257c0@zgyarmati.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703887232;
 bh=inH6PPQZPJQtpq8KGRDW5SKagNJAgTOPw4btMCgc+20=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lsqRkoegxiF0H2PjWD5UvvzcCQVAcBlnNOn1VgwhcoQEaltSqIKcSWBTjEJrvdO41
 N38xhjdSzI5N0/VGWqYVyjySEQfGJf++eJ/7HrTfksme/HVOQ3beLgdQ5XnmdFGJ9Z
 lS+vdE0kaOZrW6TyZCGhADvSUwVx7ByNt4b5Ayl/lnMvDehV5w4KQpkVy3EIl/NLfj
 lzdBJqzQC+q7+yjDhPOzy7e/dGOnuRslq7XaAGkZeLN+FR+GKCYpfvTdtLbEm6RDI6
 yxvG3PsoeP7ZX0u52H/qd2oLl3vZdwLh0dBCTS1GG5tQ64LgY0WiljBYscXvym0pBg
 bgsotQ6V46ZjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lsqRkoeg
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Zoltan, All,

On 2023-12-29 19:09 +0100, Zoltan Gyarmati spake thusly:
> please ignore this, i just wanted to add an Acked-by: trailer and not resend
> the patch.

Argh, too bad that I saw your patch after I applied Frabice's patch.

To add your Acked-by tag, just reply to the mail, and just add your tag
(anywhere in the mail will do; I have the habbit of doing so right bewlo
the Signed-off-by line, but that's not a rule).

> Sorry about the noise...

No worries!

Thanks!

Regards,
Yann E. MORIN.

> On 2023-12-29 14:19, Zoltan Gyarmati wrote:
> 
> > From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > 
> > - Drop patch (already in version)
> > - Update hash of web/license.html because SPDX identifier is used since
> > https://github.com/OSGeo/shapelib/commit/6bf68d3086f49245470fc24b121afbbeb8e9c4f2
> > - COPYING has been replaced by LICENSE-LGPL and LICENSE-MIT since
> > https://github.com/OSGeo/shapelib/commit/1638416feefcee4a1eeef9aab573a5ce44be1f3e
> > 
> > https://github.com/OSGeo/shapelib/releases/tag/v1.6.0
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > Acked-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> > ---
> > .checkpackageignore                           |  1 -
> > ...Remove-double-free-in-contrib-shpsrt.patch | 26 -------------------
> > package/shapelib/shapelib.hash                |  7 ++---
> > package/shapelib/shapelib.mk                  |  7 ++---
> > 4 files changed, 6 insertions(+), 35 deletions(-)
> > delete mode 100644
> > package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
> > 
> > diff --git a/.checkpackageignore b/.checkpackageignore
> > index 0868593a92..dd5d2735fe 100644
> > --- a/.checkpackageignore
> > +++ b/.checkpackageignore
> > @@ -1259,7 +1259,6 @@
> > package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
> > Upstream
> > package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch
> > Upstream
> > package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
> > Upstream
> > package/shairport-sync/S99shairport-sync Indent Shellcheck Variables
> > -package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
> > Upstream
> > package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch
> > Upstream
> > package/shellinabox/0001-Makefile-disable-always-building-statically.patch
> > Upstream
> > package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
> > Upstream
> > diff --git
> > a/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
> > b/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
> > deleted file mode 100644
> > index a565874b8c..0000000000
> > --- a/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
> > +++ /dev/null
> > @@ -1,26 +0,0 @@
> > -From c75b9281a5b9452d92e1682bdfe6019a13ed819f Mon Sep 17 00:00:00 2001
> > -From: =?UTF-8?q?Albin=20Eldst=C3=A5l-Ahrens?= <laeder.keps@gmail.com>
> > -Date: Mon, 3 Jan 2022 12:34:41 +0100
> > -Subject: [PATCH] Remove double free() in contrib/shpsrt, issue #39
> > -
> > -This fixes issue #39
> > -
> > -[Retrieved from:
> > -https://github.com/OSGeo/shapelib/commit/c75b9281a5b9452d92e1682bdfe6019a13ed819f]
> > -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ----
> > - contrib/shpsort.c | 1 -
> > - 1 file changed, 1 deletion(-)
> > -
> > -diff --git a/contrib/shpsort.c b/contrib/shpsort.c
> > -index e21e9e0..920cd8c 100644
> > ---- a/contrib/shpsort.c
> > -+++ b/contrib/shpsort.c
> > -@@ -113,7 +113,6 @@ static char ** split(const char *arg, const char
> > *delim) {
> > -     free(result[--i]);
> > -       }
> > -       free(result);
> > --      free(copy);
> > -       return NULL;
> > -     }
> > -     result = tmp;
> > diff --git a/package/shapelib/shapelib.hash
> > b/package/shapelib/shapelib.hash
> > index b016fef5cf..f542ee79ac 100644
> > --- a/package/shapelib/shapelib.hash
> > +++ b/package/shapelib/shapelib.hash
> > @@ -1,4 +1,5 @@
> > # Locally computed
> > -sha256
> > 1fc0a480982caef9e7b9423070b47750ba34cd0ba82668f2e638fab1d07adae1
> > shapelib-1.5.0.tar.gz
> > -sha256
> > 7eb803a70990017a1c4e38a8342d7413c5dfeec3ed1ac407e15ae2c274e560ff
> > COPYING
> > -sha256
> > a638278f7f1cb7d0cdc73b47a6c87261b882e356a8e79922e90d44d7ef1dd2c7
> > web/license.html
> > +sha256
> > 19528b24377241705637320c367943031ad5088665d1fb0e1eaa52a71264a6c4
> > shapelib-1.6.0.tar.gz
> > +sha256
> > 681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366
> > LICENSE-LGPL
> > +sha256
> > 67f1348ec73ef6343f0dbb3fa0612c321da4073e1ee68ffc99fcd3f2d2a65813
> > LICENSE-MIT
> > +sha256
> > 15e1205bb007d4d7821f7b1cc461ba8d051647e86dbc9baf1bb6f68b10588eeb
> > web/license.html
> > diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
> > index 37d2d9ae64..a36a65f80e 100644
> > --- a/package/shapelib/shapelib.mk
> > +++ b/package/shapelib/shapelib.mk
> > @@ -4,14 +4,11 @@
> > #
> > ################################################################################
> > 
> > -SHAPELIB_VERSION = 1.5.0
> > +SHAPELIB_VERSION = 1.6.0
> > SHAPELIB_SITE = http://download.osgeo.org/shapelib
> > SHAPELIB_LICENSE = MIT or LGPL-2.0
> > -SHAPELIB_LICENSE_FILES = web/license.html COPYING
> > +SHAPELIB_LICENSE_FILES = LICENSE-LGPL LICENSE-MIT web/license.html
> > SHAPELIB_CPE_ID_VENDOR = osgeo
> > SHAPELIB_INSTALL_STAGING = YES
> > 
> > -# 0001-Remove-double-free-in-contrib-shpsrt.patch
> > -SHAPELIB_IGNORE_CVES += CVE-2022-0699
> > -
> > $(eval $(autotools-package))
> > --
> > 2.39.2
> 
> -- 
> https://zgyarmati.de

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
