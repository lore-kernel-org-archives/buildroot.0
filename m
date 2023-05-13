Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C606C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 10:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2832D82038;
	Sat, 13 May 2023 10:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2832D82038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znu1LAdCVf2Y; Sat, 13 May 2023 10:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BADE681FC8;
	Sat, 13 May 2023 10:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BADE681FC8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CF6A1BF424
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16EE581FC8
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16EE581FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id heXNp4Ll8V-t for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 10:54:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7196A81E40
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7196A81E40
 for <buildroot@buildroot.org>; Sat, 13 May 2023 10:54:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E1BC419F5AF;
 Sat, 13 May 2023 12:54:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 12:54:41 +0200
Date: Sat, 13 May 2023 12:54:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230513105441.GN2582048@scaer>
References: <20230511200257.607495-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230511200257.607495-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683975284;
 bh=XIFTBfaob5wrjg6raJO+JWUB+JgZIRG8PKSE6xPSOQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tDhwN+EuGLg/6oWIYCw7fzdb1wP8mMUQ2NhoJs0DUsksmujBdiVkNJzLRSqdgcWEt
 +jeThXtFjpU3fDGDWENaspML4564XABeY7Rd6wxF3ejgXtjFnzrPZm4J0u7hGOrbMQ
 z6HGlou5NcqxQaHjmOtmqsL1LlDLhzxduEu8lBnwvwd004lr8DAmOdrQoTIO+GyqMx
 hzy/UkQJwj61Urhe1M0WiuDz7kGnmiC8xJrB8pwAIlVICsziGAq7Nj5Uzjo/1sxaG2
 1bc27TcjoKKx6Q985dxvjvl0zC98iV3UK8c2WVelC9IiJ6YKNfKsWqRUJ64WaJF8Rh
 cb81Bd5qw1FLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tDhwN+Eu
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump to version 2.6.3
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

Giulio, All,

On 2023-05-11 22:02 +0200, Giulio Benetti spake thusly:
> Drop local patches since they have been upstreamed but add a new local
> patch already upstreamed that checks for libevent and sqlite since with the
> adding of reexport they became mandatory. This is because it's not possible
> to disable reexport.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...event-and-libsqlite3-checked-when-nf.patch | 79 +++++++++++++++++++
>  ...ead-fix-linking-while-static-linking.patch | 49 ------------
>  ...e.ac-allow-to-disable-nfsrahead-tool.patch | 68 ----------------

    $ ./utils/docker-run make check-package
    .checkpackageignore:1078: ignored file package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch is missing
    .checkpackageignore:1079: ignored file package/nfs-utils/0002-configure.ac-allow-to-disable-nfsrahead-tool.patch is missing

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  package/nfs-utils/Config.in                   |  4 +-
>  package/nfs-utils/nfs-utils.hash              |  4 +-
>  package/nfs-utils/nfs-utils.mk                |  6 +-
>  6 files changed, 86 insertions(+), 124 deletions(-)
>  create mode 100644 package/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
>  delete mode 100644 package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
>  delete mode 100644 package/nfs-utils/0002-configure.ac-allow-to-disable-nfsrahead-tool.patch
> 
> diff --git a/package/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch b/package/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
> new file mode 100644
> index 0000000000..a6a6d56d7f
> --- /dev/null
> +++ b/package/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
> @@ -0,0 +1,79 @@
> +From bc4a5deef9f820c55fdac3c0070364c17cd91cca Mon Sep 17 00:00:00 2001
> +From: Wiktor Jaskulski <wjaskulski@adva.com>
> +Date: Thu, 11 May 2023 15:28:23 -0400
> +Subject: [PATCH] configure.ac: libevent and libsqlite3 checked when nfsv4 is
> + disabled
> +
> +Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=bc4a5deef9f820c55fdac3c0070364c17cd91cca
> +
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + configure.ac | 38 +++++++++++++++-----------------------
> + 1 file changed, 15 insertions(+), 23 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 9df52e9c..6fbcb974 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -338,42 +338,34 @@ CPPFLAGS="${nfsutils_save_CPPFLAGS}"
> + AC_CHECK_HEADER(uuid/uuid.h, ,
> + 	AC_MSG_ERROR([Cannot find needed header file uuid/uuid.h. Install libuuid-devel]))
> + 
> ++dnl check for libevent libraries and headers
> ++AC_LIBEVENT
> ++
> ++dnl Check for sqlite3
> ++AC_SQLITE3_VERS
> ++
> ++case $libsqlite3_cv_is_recent in
> ++yes) ;;
> ++unknown)
> ++   dnl do not fail when cross-compiling
> ++   AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
> ++*)
> ++   AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
> ++esac
> ++
> + if test "$enable_nfsv4" = yes; then
> +-  dnl check for libevent libraries and headers
> +-  AC_LIBEVENT
> + 
> +   dnl check for the keyutils libraries and headers
> +   AC_KEYUTILS
> + 
> +-  dnl Check for sqlite3
> +-  AC_SQLITE3_VERS
> +-
> +   if test "$enable_nfsdcld" = "yes"; then
> + 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
> + 		AC_MSG_ERROR([Cannot find header needed for nfsdcld]))
> +-
> +-    case $libsqlite3_cv_is_recent in
> +-    yes) ;;
> +-    unknown)
> +-      dnl do not fail when cross-compiling
> +-      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
> +-    *)
> +-      AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
> +-    esac
> +   fi
> + 
> +   if test "$enable_nfsdcltrack" = "yes"; then
> + 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
> + 		AC_MSG_ERROR([Cannot find header needed for nfsdcltrack]))
> +-
> +-    case $libsqlite3_cv_is_recent in
> +-    yes) ;;
> +-    unknown)
> +-      dnl do not fail when cross-compiling
> +-      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
> +-    *)
> +-      AC_MSG_ERROR([nfsdcltrack requires sqlite-devel]) ;;
> +-    esac
> +   fi
> + 
> + else
> +-- 
> +2.34.1
> +
> diff --git a/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
> deleted file mode 100644
> index e1d57f30cf..0000000000
> --- a/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From d9abb221cea81dee5956bd987c6efa680c03571a Mon Sep 17 00:00:00 2001
> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -Date: Wed, 10 Aug 2022 23:38:17 +0200
> -Subject: [PATCH] nfsrahead: fix linking while static linking
> -
> --lmount must preceed -lblkid and to obtain this let's add in configure.ac:
> -PKG_CHECK_MODULES([LIBMOUNT], [mount])
> -and in tools/nfsrahead/Makefile.am let's substitute explicit `-lmount`
> -with:
> -$(LIBMOUNT_LIBS)
> -This way all the required libraries will be present and in the right order
> -when static linking.
> -
> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -[Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=627c95b2b853161b359095e7fdf05d3b07d51379]
> ----
> - configure.ac                | 3 +++
> - tools/nfsrahead/Makefile.am | 2 +-
> - 2 files changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index f1c46c5c..ff85200b 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -273,6 +273,9 @@ AC_LIBCAP
> - dnl Check for -lxml2
> - AC_LIBXML2
> - 
> -+dnl Check for -lmount
> -+PKG_CHECK_MODULES([LIBMOUNT], [mount])
> -+
> - # Check whether user wants TCP wrappers support
> - AC_TCP_WRAPPERS
> - 
> -diff --git a/tools/nfsrahead/Makefile.am b/tools/nfsrahead/Makefile.am
> -index 845ea0d5..7e08233a 100644
> ---- a/tools/nfsrahead/Makefile.am
> -+++ b/tools/nfsrahead/Makefile.am
> -@@ -1,6 +1,6 @@
> - libexec_PROGRAMS = nfsrahead
> - nfsrahead_SOURCES = main.c
> --nfsrahead_LDFLAGS= -lmount
> -+nfsrahead_LDFLAGS= $(LIBMOUNT_LIBS)
> - nfsrahead_LDADD = ../../support/nfs/libnfsconf.la
> - 
> - man5_MANS = nfsrahead.man
> --- 
> -2.34.1
> -
> diff --git a/package/nfs-utils/0002-configure.ac-allow-to-disable-nfsrahead-tool.patch b/package/nfs-utils/0002-configure.ac-allow-to-disable-nfsrahead-tool.patch
> deleted file mode 100644
> index ee5e3fa251..0000000000
> --- a/package/nfs-utils/0002-configure.ac-allow-to-disable-nfsrahead-tool.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From 9a0002978eb32b78d22f053302e012a4255dc4ef Mon Sep 17 00:00:00 2001
> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -Date: Mon, 19 Sep 2022 23:43:28 +0200
> -Subject: [PATCH] configure.ac: allow to disable nfsrahead tool
> -
> -This allows to make libmount not mandatory but depending on nfsrahead
> -since it only requires it. This is useful when cross-compiling because
> -in that case we need rpcgen only built for host but not nfsrahead that
> -also require libmount. So this reduces the dependencies for host
> -building.
> -
> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -[Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=844d3ad5376603bc9c205a6084d38a2d25146179]
> ----
> - configure.ac      | 13 ++++++++++---
> - tools/Makefile.am |  6 +++++-
> - 2 files changed, 15 insertions(+), 4 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index ff85200b..5d9cbf31 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -249,6 +249,16 @@ AC_ARG_ENABLE(nfsdcld,
> - 	enable_nfsdcld=$enableval,
> - 	enable_nfsdcld="yes")
> - 
> -+AC_ARG_ENABLE(nfsrahead,
> -+	[AS_HELP_STRING([--disable-nfsrahead],[disable nfsrahead command @<:@default=no@:>@])],
> -+	enable_nfsrahead=$enableval,
> -+	enable_nfsrahead="yes")
> -+	AM_CONDITIONAL(CONFIG_NFSRAHEAD, [test "$enable_nfsrahead" = "yes" ])
> -+	if test "$enable_nfsrahead" = yes; then
> -+		dnl Check for -lmount
> -+		PKG_CHECK_MODULES([LIBMOUNT], [mount])
> -+	fi
> -+
> - AC_ARG_ENABLE(nfsdcltrack,
> - 	[AS_HELP_STRING([--disable-nfsdcltrack],[disable NFSv4 clientid tracking programs @<:@default=no@:>@])],
> - 	enable_nfsdcltrack=$enableval,
> -@@ -273,9 +283,6 @@ AC_LIBCAP
> - dnl Check for -lxml2
> - AC_LIBXML2
> - 
> --dnl Check for -lmount
> --PKG_CHECK_MODULES([LIBMOUNT], [mount])
> --
> - # Check whether user wants TCP wrappers support
> - AC_TCP_WRAPPERS
> - 
> -diff --git a/tools/Makefile.am b/tools/Makefile.am
> -index 40c17c37..48fd0cdf 100644
> ---- a/tools/Makefile.am
> -+++ b/tools/Makefile.am
> -@@ -12,6 +12,10 @@ if CONFIG_NFSDCLD
> - OPTDIRS += nfsdclddb
> - endif
> - 
> --SUBDIRS = locktest rpcdebug nlmtest mountstats nfs-iostat rpcctl nfsdclnts nfsrahead $(OPTDIRS)
> -+if CONFIG_NFSRAHEAD
> -+OPTDIRS += nfsrahead
> -+endif
> -+
> -+SUBDIRS = locktest rpcdebug nlmtest mountstats nfs-iostat rpcctl nfsdclnts $(OPTDIRS)
> - 
> - MAINTAINERCLEANFILES = Makefile.in
> --- 
> -2.34.1
> -
> diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
> index f3cb17918e..b4568dc6f3 100644
> --- a/package/nfs-utils/Config.in
> +++ b/package/nfs-utils/Config.in
> @@ -6,7 +6,9 @@ config BR2_PACKAGE_NFS_UTILS
>  	bool "nfs-utils"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
>  	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBEVENT
>  	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
> +	select BR2_PACKAGE_SQLITE
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>  	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> @@ -24,9 +26,7 @@ config BR2_PACKAGE_NFS_UTILS_NFSV4
>  	bool "NFSv4/NFSv4.1"
>  	depends on !BR2_STATIC_LIBS # keyutils, lvm2
>  	select BR2_PACKAGE_KEYUTILS
> -	select BR2_PACKAGE_LIBEVENT
>  	select BR2_PACKAGE_LVM2
> -	select BR2_PACKAGE_SQLITE
>  	help
>  	  Enable NFSv4/NFSv4.1/NFSv4.2 support
>  
> diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
> index 2efe693875..015906553d 100644
> --- a/package/nfs-utils/nfs-utils.hash
> +++ b/package/nfs-utils/nfs-utils.hash
> @@ -1,4 +1,4 @@
> -# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.2/sha256sums.asc
> -sha256  5200873e81c4d610e2462fc262fe18135f2dbe78b7979f95accd159ae64d5011  nfs-utils-2.6.2.tar.xz
> +# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.3/sha256sums.asc
> +sha256  38d89e853a71d3c560ff026af3d969d75e24f782ff68324e76261fe0344459e1  nfs-utils-2.6.3.tar.xz
>  # Locally computed
>  sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 1a4a99f566..2f2e200bb5 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -4,12 +4,12 @@
>  #
>  ################################################################################
>  
> -NFS_UTILS_VERSION = 2.6.2
> +NFS_UTILS_VERSION = 2.6.3
>  NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
>  NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
>  NFS_UTILS_LICENSE = GPL-2.0+
>  NFS_UTILS_LICENSE_FILES = COPYING
> -NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libtirpc util-linux
> +NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libtirpc sqlite util-linux
>  NFS_UTILS_CPE_ID_VENDOR = linux-nfs
>  NFS_UTILS_AUTORECONF = YES
>  
> @@ -47,7 +47,7 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_NFSD) += usr/sbin/exportfs \
>  
>  ifeq ($(BR2_PACKAGE_NFS_UTILS_NFSV4),y)
>  NFS_UTILS_CONF_OPTS += --enable-nfsv4 --enable-nfsv41
> -NFS_UTILS_DEPENDENCIES += keyutils libevent lvm2 sqlite
> +NFS_UTILS_DEPENDENCIES += keyutils lvm2
>  else
>  NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-nfsv41
>  endif
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
