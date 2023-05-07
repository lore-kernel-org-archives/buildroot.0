Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA973C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 18:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CF4D821C8;
	Sun,  7 May 2023 18:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CF4D821C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8K9S1nJXrf6Z; Sun,  7 May 2023 18:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7222282181;
	Sun,  7 May 2023 18:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7222282181
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C0021BF2E3
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 18:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 826F982174
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 18:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 826F982174
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0XpF5ztAQ9r1 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 18:56:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 828CA82110
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 828CA82110
 for <buildroot@buildroot.org>; Sun,  7 May 2023 18:56:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C911F19F743;
 Sun,  7 May 2023 20:56:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 20:56:15 +0200
Date: Sun, 7 May 2023 20:56:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20230507185615.GD252090@scaer>
References: <20230507181424.246228-1-ju.o@free.fr>
 <87zg6g6lmm.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zg6g6lmm.fsf@tarshish>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683485778;
 bh=os5tckz8F6o0E85KvxG7AO2dDDZFcZu5QgVwjxDQeg4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iYbas/7Nk7oIztQrr2QWUtV7YgTIcIcu8o/CgrRcNZAnxRB1A/efa19uvf7akrvSM
 k4PmfYm5NKhAbPATaPDiwzX47LqfrhijEdjqmgTigj7PxlXegPE01KI9jc0wxXCCI/
 c6LdGlFl4x+ZmFm8TOPsHsdr+wd2PfE+H3Gv4xkkA5D273ebgDGLalI2/mtSHsPKnI
 FNKVCGy/2NiQOBsviwQLy1rLkgJ+AHlEIZyZIVHhA30tZp6IhXTP08OKP8W+rjQRFs
 LGVu3kdwvlt7o80YxQynazM/Rnidf1VcqGPrq39LbnSAFDoeNkZSnczgnyLqNLAtB6
 5z2u0pQEERC0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iYbas/7N
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: bump to version
 v0.3.23
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, All,

On 2023-05-07 21:28 +0300, Baruch Siach via buildroot spake thusly:
> On Sun, May 07 2023, Julien Olivain wrote:
> > This commit also:
> > - adds the md5 from the release note in the package hash file,
> > - rebase the patch on the new version tag,
> > - adds the "Upstream:" tag in the patch.
> >
> > For change log since v0.3.22, see:
> > - https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.23
> >
> > Signed-off-by: Julien Olivain <ju.o@free.fr>
> > ---
> >  ...ile.system-don-t-specify-optimization-level-bui.patch | 9 +++++----
> >  package/openblas/openblas.hash                           | 4 +++-
> >  package/openblas/openblas.mk                             | 2 +-
> >  3 files changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch b/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
> > index e0c738748a..ed3cae82ef 100644
> > --- a/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
> > +++ b/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
> > @@ -1,4 +1,4 @@
> > -From d8ec4e4c6ef69165179f376e365034de10e6fee3 Mon Sep 17 00:00:00 2001
> > +From 89648b76e35dc4657942c861ed9dbfbfe5a3df28 Mon Sep 17 00:00:00 2001
> >  From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >  Date: Fri, 5 Mar 2021 14:09:23 +0100
> >  Subject: [PATCH] Makefile.system: don't specify optimization level
> > @@ -11,16 +11,17 @@ The CFLAGS/FFLAGS would e.g. contain '-Os -O2' in which -O2 survives.
> >  
> >  Remove the optimization level specified in openblas itself.
> >  
> > +Upstream: N/A, not upstreamable
> 
> With this change you can now remove this patch from the
> .checkpackageignore list.

Thanks for spotting. My post-applypatch hook also triggered, but it is
noce to see people actually paying attenti0on to such details! :-)

Regards,
Yann E. MORIN.

> baruch
> 
> >  Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >  ---
> >   Makefile.system | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >  
> >  diff --git a/Makefile.system b/Makefile.system
> > -index 438a8148..9de1bbd5 100644
> > +index 343b94bb3..c355ca5d9 100644
> >  --- a/Makefile.system
> >  +++ b/Makefile.system
> > -@@ -1519,11 +1519,11 @@ FCOMMON_OPT += -g
> > +@@ -1585,11 +1585,11 @@ FCOMMON_OPT += -g
> >   endif
> >   
> >   ifndef COMMON_OPT
> > @@ -35,5 +36,5 @@ index 438a8148..9de1bbd5 100644
> >   
> >   override CFLAGS     += $(COMMON_OPT) $(CCOMMON_OPT) -I$(TOPDIR)
> >  -- 
> > -2.35.1
> > +2.40.1
> >  
> > diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
> > index a8b5527e81..2e5fa8865f 100644
> > --- a/package/openblas/openblas.hash
> > +++ b/package/openblas/openblas.hash
> > @@ -1,3 +1,5 @@
> > +# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.23
> > +md5  115634b39007de71eb7e75cf7591dfb2  openblas-0.3.23.tar.gz
> >  # Locally calculated
> > -sha256  7fa9685926ba4f27cfe513adbf9af64d6b6b63f9dcabb37baefad6a65ff347a7  openblas-0.3.22.tar.gz
> > +sha256  5d9491d07168a5d00116cdc068a40022c3455bf9293c7cb86a65b1054d7e5114  openblas-0.3.23.tar.gz
> >  sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
> > diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
> > index 27f20654e7..f7a50d7bc7 100644
> > --- a/package/openblas/openblas.mk
> > +++ b/package/openblas/openblas.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -OPENBLAS_VERSION = 0.3.22
> > +OPENBLAS_VERSION = 0.3.23
> >  OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
> >  OPENBLAS_LICENSE = BSD-3-Clause
> >  OPENBLAS_LICENSE_FILES = LICENSE
> 
> 
> -- 
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
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
