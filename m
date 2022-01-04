Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA89C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 20:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 906DC410D7;
	Tue,  4 Jan 2022 20:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P7AuT8FjFnfX; Tue,  4 Jan 2022 20:03:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C291541526;
	Tue,  4 Jan 2022 20:03:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16C071BF35E
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04C2F405B6
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NJck1g96Q9M8 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 20:03:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 828604063E
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 20:03:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:dd8f:11a1:7592:f85e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 7311A2003A4;
 Tue,  4 Jan 2022 21:03:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641326604;
 bh=fVMbhCAPv/iQocg9HMWfqJSgTZ/Y0D0YOt2UeVD3LzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ewjk38W2AdiENv2OZMxfLmBFmURuofHNJBlt53BqZYwerrxEdDxiau+RptNTgLviJ
 8aG+kYDboGhI84KImAinoEZoFogmWB0U7XrJcgUBk2A/M9mlfBZFISabJ+2wXYSk+w
 fUwdR4ET3p3HSQJ9oCPSno+xSI6aZv8Wa6XUhYbXqNWMSKWNVODTiTyZWhslkjNyKu
 ems+qRlWuEszGWiBJ5g8B+yWzlhUh1g7e3LUyQdpunwKzcM89Nea4KieeuvA/9FzXT
 DKw1N0xKw/rLJkd5VSWBQZRRWNaS5j0zab6p00LeNGcDdixDb2WUIQuj7EJJVlaHU5
 vJsI+GOvH0Lsg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jan 2022 21:03:20 +0100
Date: Tue, 4 Jan 2022 21:03:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220104200320.GB614810@scaer>
References: <20220104182037.3292464-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104182037.3292464-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/openipmi: bump to version 2.0.32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-04 19:20 +0100, Fabrice Fontaine spake thusly:
> - Refresh patch and send it upstream
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...01-Avoid-searching-host-library-path.patch | 27 ++++++++++---------
>  package/openipmi/openipmi.hash                | 12 ++++-----
>  package/openipmi/openipmi.mk                  |  2 +-
>  3 files changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/package/openipmi/0001-Avoid-searching-host-library-path.patch b/package/openipmi/0001-Avoid-searching-host-library-path.patch
> index 44a57dcfb4..15b4510f67 100644
> --- a/package/openipmi/0001-Avoid-searching-host-library-path.patch
> +++ b/package/openipmi/0001-Avoid-searching-host-library-path.patch
> @@ -10,6 +10,9 @@ $(libdir) in the library search path.
>  
>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  Signed-off-by: Joel Stanley <joel@jms.id.au>
> +[Fabrice: refresh patch for 2.0.32]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://sourceforge.net/p/openipmi/patches/35]
>  ---
>   cmdlang/Makefile.am | 3 +--
>   unix/Makefile.am    | 6 ++----
> @@ -19,13 +22,12 @@ diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
>  index 264ee12be79f..0b3843784656 100644
>  --- a/cmdlang/Makefile.am
>  +++ b/cmdlang/Makefile.am
> -@@ -15,8 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.c cmd_domain.c cmd_entity.c cmd_mc.c \
> - libOpenIPMIcmdlang_la_LIBADD = -lm \
> +@@ -15,7 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.c cmd_domain.c cmd_entity.c cmd_mc.c \
>   	$(top_builddir)/utils/libOpenIPMIutils.la \
>   	$(top_builddir)/lib/libOpenIPMI.la
> --libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
> --	-L$(libdir)
> -+libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
> + libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
> +-	-L$(libdir) -no-undefined
> ++	-no-undefined
>   
>   bin_PROGRAMS = openipmish
>   
> @@ -33,20 +35,19 @@ diff --git a/unix/Makefile.am b/unix/Makefile.am
>  index 5128839dad13..bd0f897ba8d6 100644
>  --- a/unix/Makefile.am
>  +++ b/unix/Makefile.am
> -@@ -10,14 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la libOpenIPMIpthread.la
> - libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
> +@@ -10,12 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la libOpenIPMIpthread.la
>   libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
>   	$(top_builddir)/utils/libOpenIPMIutils.la $(RT_LIB)
> --libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
> --	-L$(libdir)
> -+libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
> + libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
> +-	-L$(libdir) -no-undefined
> ++	-no-undefined
>   
>   libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
>   libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
>   	$(GDBM_LIB) $(RT_LIB)
> --libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
> --	-L$(libdir)
> -+libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
> + libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
> +-	-L$(libdir) -no-undefined
> ++	-no-undefined
>   
>   noinst_HEADERS = heap.h
>   
> diff --git a/package/openipmi/openipmi.hash b/package/openipmi/openipmi.hash
> index 2ec9dd31af..eded076ade 100644
> --- a/package/openipmi/openipmi.hash
> +++ b/package/openipmi/openipmi.hash
> @@ -1,8 +1,8 @@
>  # From http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
> -sha1 be0c87743a38e2fa00586df931f021c0b480385b OpenIPMI-2.0.28.tar.gz
> -md5 ba37f08e306062ec73c7ed2a2bd4d5f4 OpenIPMI-2.0.28.tar.gz
> +sha1  73d7dce4312b006983b11367e4a43d4ec52cf888  OpenIPMI-2.0.32.tar.gz
> +md5  532404c9df7d0e8bde975b95b9e6775b  OpenIPMI-2.0.32.tar.gz
>  # Locally computed
> -sha256	8e8b1de2a9a041b419133ecb21f956e999841cf2e759e973eeba9a36f8b40996	OpenIPMI-2.0.28.tar.gz
> -sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
> -sha256	185323a62589e7ee80f86bf2ea29caad9a09fdda0ea3f1c00db8b778c7edf60e	COPYING.BSD
> -sha256	5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509	COPYING.LIB
> +sha256  f6d0fd4c0a74b05f80907229d0b270f54ca23294bcc11979f8b8d12766786945  OpenIPMI-2.0.32.tar.gz
> +sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> +sha256  185323a62589e7ee80f86bf2ea29caad9a09fdda0ea3f1c00db8b778c7edf60e  COPYING.BSD
> +sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING.LIB
> diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
> index 3240b89894..ad2f2d2f4f 100644
> --- a/package/openipmi/openipmi.mk
> +++ b/package/openipmi/openipmi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENIPMI_VERSION = 2.0.28
> +OPENIPMI_VERSION = 2.0.32
>  OPENIPMI_SITE = https://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
>  OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
>  OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3-Clause
> -- 
> 2.34.1
> 
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
