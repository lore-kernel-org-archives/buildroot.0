Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28143C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 08:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1D0B40128;
	Sun, 11 Dec 2022 08:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1D0B40128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U9y7yVyPYHkQ; Sun, 11 Dec 2022 08:21:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD1DD404CF;
	Sun, 11 Dec 2022 08:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD1DD404CF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19D6E1BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8BB660757
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8BB660757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysnsE6NrEZ1w for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:21:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9085D60A91
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9085D60A91
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:21:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9fcf:911b:99f4:8b0a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A62D05FF96;
 Sun, 11 Dec 2022 09:21:39 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 09:21:39 +0100
Date: Sun, 11 Dec 2022 09:21:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221211082139.GJ1044805@scaer>
References: <20221210220550.84041-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221210220550.84041-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670746901;
 bh=KXtHkU2AMm1yiRDhCi0glU4YMej44xbY+blAPcasVg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SaGAEhZtZWILAefvuHssyEsZC7CjwdJU2zQzjlcOd15135KPm7gY2DlJRTg08I0lQ
 UqWsp0jZovYYsUdJSqUwyqwAbtibfqNLQVQ6NBLIT0NZ/WTPqDTIwv866/7bC3EgNX
 78ZuOz+jjMNndugCglxemRTGx1xP7nDV4dsGXpXDMCtoHnQgJ2F6rKL7Tkzmand2LW
 Z11ZM2p8LW6gDVNE0KAVjAluNPCk0iMIAghRVW8oAE8iA3vS3c5iRfgegomwQNDfRM
 1eFX+6k6wiS5RrUOdKsQBfN5xAGde11E/YijeVEn/naT7Tltjjpf0At2i5QBA+Wyiz
 OitUM3KxTy5uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SaGAEhZt
Subject: Re: [Buildroot] [PATCH 1/1] package/ulogd: bump to version 2.0.8
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

On 2022-12-10 23:05 +0100, Fabrice Fontaine spake thusly:
> - Drop patch (already in version)
> - Update configure options due to
>   https://git.netfilter.org/ulogd2/commit/?id=794f0385ab60fd8c52ff3ce498c8aac78b58ac20
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-ulogd-fix-build-with-musl-libc.patch | 32 -------------------
>  package/ulogd/ulogd.hash                      |  6 ++--
>  package/ulogd/ulogd.mk                        | 26 +++++++--------
>  3 files changed, 15 insertions(+), 49 deletions(-)
>  delete mode 100644 package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch
> 
> diff --git a/package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch b/package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch
> deleted file mode 100644
> index af6e13648c..0000000000
> --- a/package/ulogd/0001-ulogd-fix-build-with-musl-libc.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 675e762091380590f78ff07a94a25caa459b786b Mon Sep 17 00:00:00 2001
> -From: Cameron Norman <camerontnorman@gmail.com>
> -Date: Sat, 27 Oct 2018 13:05:45 -0700
> -Subject: ulogd: fix build with musl libc
> -
> -The attached patch fixes building ulogd2 with musl libc. It is being
> -used on Void Linux right now.
> -
> -Closes: https://bugzilla.netfilter.org/show_bug.cgi?id=1278
> -Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrrieved from:
> -https://git.netfilter.org/ulogd2/commit/?id=675e762091380590f78ff07a94a25caa459b786b]
> ----
> - src/ulogd.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/ulogd.c b/src/ulogd.c
> -index b8bc57c..9cd64e8 100644
> ---- a/src/ulogd.c
> -+++ b/src/ulogd.c
> -@@ -65,6 +65,7 @@
> - #include <sys/time.h>
> - #include <sys/stat.h>
> - #include <sched.h>
> -+#include <limits.h>
> - #include <ulogd/conffile.h>
> - #include <ulogd/ulogd.h>
> - #ifdef DEBUG
> --- 
> -cgit v1.2.1
> -
> diff --git a/package/ulogd/ulogd.hash b/package/ulogd/ulogd.hash
> index 0e07a714ee..35b518b9ce 100644
> --- a/package/ulogd/ulogd.hash
> +++ b/package/ulogd/ulogd.hash
> @@ -1,7 +1,5 @@
> -# From ftp://ftp.netfilter.org/pub/ulogd/ulogd-2.0.7.tar.bz2.{md5sum,sha1sum}
> -md5  2bb2868cf51acbb90c35763c9f995f31  ulogd-2.0.7.tar.bz2
> -sha1  f2d90469e2842e2bfbe19c55cf6d56ac107aa4b9  ulogd-2.0.7.tar.bz2
> +# From ftp://ftp.netfilter.org/pub/ulogd/ulogd-2.0.8.tar.bz2.sha256sum
> +sha256  4ead6c3970c3f57fa1e89fe2d7cc483ba6fe2bd1b08701521e0b3afd667df291  ulogd-2.0.8.tar.bz2
>  
>  # Locally calculated
> -sha256  990a05494d9c16029ba0a83f3b7294fc05c756546b8d60d1c1572dc25249a92b  ulogd-2.0.7.tar.bz2
>  sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
> diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
> index c00a53f3d5..65280a2ba6 100644
> --- a/package/ulogd/ulogd.mk
> +++ b/package/ulogd/ulogd.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -ULOGD_VERSION = 2.0.7
> +ULOGD_VERSION = 2.0.8
>  ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
>  ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
> -ULOGD_CONF_OPTS = --without-dbi
> +ULOGD_CONF_OPTS = --disable-dbi
>  ULOGD_DEPENDENCIES = host-pkgconf \
>  	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
>  	libnfnetlink
> @@ -18,39 +18,39 @@ ULOGD_SELINUX_MODULES = ulogd
>  # DB backends need threads
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  ifeq ($(BR2_PACKAGE_MYSQL),y)
> -ULOGD_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
> +ULOGD_CONF_OPTS += --enable-mysql
>  ULOGD_DEPENDENCIES += mysql
>  else
> -ULOGD_CONF_OPTS += --without-mysql
> +ULOGD_CONF_OPTS += --disable-mysql
>  endif
>  ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
> -ULOGD_CONF_OPTS += --with-pgsql
> +ULOGD_CONF_OPTS += --enable-pgsql
>  ULOGD_DEPENDENCIES += postgresql
>  else
> -ULOGD_CONF_OPTS += --without-pgsql
> +ULOGD_CONF_OPTS += --disable-pgsql
>  endif
>  ifeq ($(BR2_PACKAGE_SQLITE),y)
> -ULOGD_CONF_OPTS += --with-sqlite
> +ULOGD_CONF_OPTS += --enable-sqlite3
>  ULOGD_DEPENDENCIES += sqlite
>  else
> -ULOGD_CONF_OPTS += --without-sqlite
> +ULOGD_CONF_OPTS += --disable-sqlite3
>  endif
>  else
> -ULOGD_CONF_OPTS += --without-mysql --without-pgsql --without-sqlite
> +ULOGD_CONF_OPTS += --disable-mysql --disable-pgsql --disable-sqlite3
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBPCAP),y)
> -ULOGD_CONF_OPTS += --with-pcap
> +ULOGD_CONF_OPTS += --enable-pcap
>  ULOGD_DEPENDENCIES += libpcap
>  else
> -ULOGD_CONF_OPTS += --without-pcap
> +ULOGD_CONF_OPTS += --disable-pcap
>  endif
>  
>  ifeq ($(BR2_PACKAGE_JANSSON),y)
> -ULOGD_CONF_OPTS += --with-jansson
> +ULOGD_CONF_OPTS += --enable-json
>  ULOGD_DEPENDENCIES += jansson
>  else
> -ULOGD_CONF_OPTS += --without-jansson
> +ULOGD_CONF_OPTS += --disable-json
>  endif
>  
>  $(eval $(autotools-package))
> -- 
> 2.35.1
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
