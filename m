Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A105BCD37BC
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 13:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DFB540C2B;
	Sat, 16 Sep 2023 13:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DFB540C2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2t12QW1txqfx; Sat, 16 Sep 2023 13:22:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97EE840C29;
	Sat, 16 Sep 2023 13:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97EE840C29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74FFC1BF41D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C2B440C82
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C2B440C82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUcA50-B5ZRP for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 13:22:00 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4794C40C5C
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 13:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4794C40C5C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6CF892003C3;
 Sat, 16 Sep 2023 15:21:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 15:21:55 +0200
Date: Sat, 16 Sep 2023 15:21:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230916132155.GF415981@scaer>
References: <20230916125132.1509289-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916125132.1509289-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694870518;
 bh=sxgI6JR8Bvvqh+N+6FrY70Oy6MlSquoerDQv6lg1rjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m5l9sNX9zvwfAx4c9LvrEl2mBAHOv22jlsis9+h/UWKTliCC/nREP+vlxY6Brjsy3
 FVYCR0wxlGl9Xw9NyOgxXfHgjElsr+ax0o5GR8CNNG5My2he9HGzs3EBZgid4RMYiJ
 Fi0BB7EsIHY1IIatFQZYl92M2+s6bH3F/9D5+IVkT14Rh7EWpHbG4hVvvYPZYig9c2
 PguLHqR6atC+X8GXokBfSOTMKOdNKs+jz0OR0El6tFhda47MKO+djECOLi0q+RbbTj
 7g0wRAFrTR7/7/iLXzFRuAeIRqRlrJveZlNn0GINsc7aL1iDl5TIJCvX98+nhcnnE8
 8tJmlK98DrSKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m5l9sNX9
Subject: Re: [Buildroot] [PATCH 1/1] package/conmon: fix libseccomp shared
 build
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-16 14:51 +0200, Fabrice Fontaine spake thusly:
> Drop patch and disable libseccomp when building statically to avoid the
> following build failure raised since commit
> 29834d8a12d984e8efe05398c5aaa6a61f7880e0:
> 
> src/seccomp_notify.c: In function 'seccomp_notify_plugins_load':
> src/seccomp_notify.c:136:42: warning: implicit declaration of function 'dlopen'; did you mean 'popen'? [-Wimplicit-function-declaration]
>   136 |                 ctx->plugins[s].handle = dlopen(it, RTLD_NOW);
>       |                                          ^~~~~~
>       |                                          popen
> src/seccomp_notify.c:136:53: error: 'RTLD_NOW' undeclared (first use in this function)
>   136 |                 ctx->plugins[s].handle = dlopen(it, RTLD_NOW);
>       |                                                     ^~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/13d3b46990720bba8621c922b5dce54ab650e96d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...01-remove-unused-dlfcn.h-header-file.patch | 26 -------------------
>  package/conmon/conmon.mk                      |  2 +-
>  2 files changed, 1 insertion(+), 27 deletions(-)
>  delete mode 100644 package/conmon/0001-remove-unused-dlfcn.h-header-file.patch
> 
> diff --git a/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch b/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch
> deleted file mode 100644
> index 14f817942e..0000000000
> --- a/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From e28634a0e847a14c58482f962bc9b1d69937387f Mon Sep 17 00:00:00 2001
> -From: Waldemar Brodkorb <wbx@openadk.org>
> -Date: Sat, 12 Aug 2023 12:53:37 +0200
> -Subject: [PATCH] remove unused dlfcn.h header file
> -
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> -Upstream: https://github.com/containers/conmon/issues/443
> ----
> - src/seccomp_notify.c | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/src/seccomp_notify.c b/src/seccomp_notify.c
> -index 8d34d9d..2a8371d 100644
> ---- a/src/seccomp_notify.c
> -+++ b/src/seccomp_notify.c
> -@@ -7,7 +7,6 @@
> - 
> - #include <errno.h>
> - #include <sys/ioctl.h>
> --#include <dlfcn.h>
> - #include <sys/wait.h>
> - #include <sys/mount.h>
> - #include <signal.h>
> --- 
> -2.39.2
> -
> diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
> index 29deb2af47..50807f8c6a 100644
> --- a/package/conmon/conmon.mk
> +++ b/package/conmon/conmon.mk
> @@ -11,7 +11,7 @@ CONMON_LICENSE_FILES = LICENSE
>  
>  CONMON_DEPENDENCIES = host-pkgconf libglib2
>  
> -ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP):$(BR2_STATIC_LIBS),y:)
>  CONMON_DISABLE_SECCOMP = 0
>  CONMON_DEPENDENCIES += libseccomp
>  else
> -- 
> 2.40.1
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
