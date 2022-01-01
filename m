Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EF3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85342400D9;
	Sat,  1 Jan 2022 10:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQKjMxFo0eai; Sat,  1 Jan 2022 10:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5706A4012F;
	Sat,  1 Jan 2022 10:13:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 826FC1BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F51660E1B
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjU8a2-QVN7H for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:13:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66DC460E25
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:13:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 28A045FF7A;
 Sat,  1 Jan 2022 11:13:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641032005;
 bh=U1+5AeG58NjgVQf9z541rDflqiqVbazJsZmGBQbg00M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HzstNM6RixCGpLVidm4Wo9b78l8SbOxfApMeqp1v/UisMxe8v2fpea1nafmpWErN5
 2kNsdFYxBSXlz5dzBe8S9v3PGe7f/oysWpAWQEvLKfbpsQfhONGuFZpafl/GF6PeT1
 5Zs4xyJd7wkhv9j2LDknPv843CDRVf5Tx7GPrpIuGJgB0gflFfVesxoz1spBuP9bfA
 fiF6D1y9t9Y5gZQfGvblS1pNmLNzJcP3KSm5UwR45q6TrSphW6KVqRkrvA76L47Sin
 HwhbtGyFsio+BAXknJjjbx8Oh+woxp0UHDZobYLLCbeweGmrsqE+gjZynldnxIpUIr
 F8BsWcNZNJeWA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 11:13:18 +0100
Date: Sat, 1 Jan 2022 11:13:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220101101318.GY3390456@scaer>
References: <20211230230701.3177447-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230230701.3177447-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/shairport-sync: bump to version
 3.3.9
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
Cc: =?utf-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-31 00:07 +0100, Fabrice Fontaine spake thusly:
> Drop second patch (already in version)
> 
> https://github.com/mikebrady/shairport-sync/releases/tag/3.3.9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...re.ac-fix-build-with-automake-1.16.5.patch | 48 -------------------
>  package/shairport-sync/shairport-sync.hash    |  2 +-
>  package/shairport-sync/shairport-sync.mk      |  2 +-
>  3 files changed, 2 insertions(+), 50 deletions(-)
>  delete mode 100644 package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch
> 
> diff --git a/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch b/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch
> deleted file mode 100644
> index 2ee8f59fee..0000000000
> --- a/package/shairport-sync/0002-configure.ac-fix-build-with-automake-1.16.5.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From ad22edb303a470b6f9eda9fd9d3f588bb2eff8cb Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Fri, 15 Oct 2021 08:02:23 +0200
> -Subject: [PATCH] configure.ac: fix build with automake 1.16.5
> -
> -Fix the following build failure with convolution raised since automake
> -1.16.5 and
> -https://git.savannah.gnu.org/cgit/automake.git/commit/?id=f4a3a70f69e1dbccb6578f39ef47835098a04624:
> -
> -configure.ac:305: error: AM_INIT_AUTOMAKE expanded multiple times
> -/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
> -configure.ac:6: the top level
> -/home/giuliobenetti/autobuild/run/instance-1/output-1/host/share/aclocal-1.16/init.m4:29: AM_INIT_AUTOMAKE is expanded from...
> -configure.ac:305: the top level
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/464148bdccb705d8992dc860262bfdeb01b7e2a1
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/mikebrady/shairport-sync/pull/1314]
> ----
> - configure.ac | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index f77087c5..aa533a2d 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -3,7 +3,7 @@
> - 
> - AC_PREREQ([2.50])
> - AC_INIT([shairport-sync], [3.3.8], [4265913+mikebrady@users.noreply.github.com])
> --AM_INIT_AUTOMAKE
> -+AM_INIT_AUTOMAKE([subdir-objects])
> - AC_CONFIG_SRCDIR([shairport.c])
> - AC_CONFIG_HEADERS([config.h])
> - AC_PROG_RANLIB
> -@@ -302,7 +302,6 @@ AM_CONDITIONAL([USE_PA], [test "x$with_pa" = "xyes"])
> - # Look for Convolution flag
> - AC_ARG_WITH(convolution, [AS_HELP_STRING([--with-convolution],[choose audio DSP convolution support])])
> - if test "x$with_convolution" = "xyes" ; then
> --  AM_INIT_AUTOMAKE([subdir-objects])
> -   AC_DEFINE([CONFIG_CONVOLUTION], 1, [Include audio DSP convolution support.])
> -   AC_CHECK_LIB([sndfile], [sf_open], , AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
> - fi
> --- 
> -2.33.0
> -
> diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
> index ebc81dedc1..331866a379 100644
> --- a/package/shairport-sync/shairport-sync.hash
> +++ b/package/shairport-sync/shairport-sync.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  c92f9a2d86dd1138673abc66e0010c94412ad6a46da8f36c3d538f4fa6b9faca  shairport-sync-3.3.8.tar.gz
> +sha256  17990cb2620551caa07a1c3b371889e55803071eaada04e958c356547a7e1795  shairport-sync-3.3.9.tar.gz
>  sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
> diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
> index ba8b44a621..cf49f2b2ed 100644
> --- a/package/shairport-sync/shairport-sync.mk
> +++ b/package/shairport-sync/shairport-sync.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SHAIRPORT_SYNC_VERSION = 3.3.8
> +SHAIRPORT_SYNC_VERSION = 3.3.9
>  SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
>  
>  SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
> -- 
> 2.33.0
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
