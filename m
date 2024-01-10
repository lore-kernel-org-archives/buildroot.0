Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3557EC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 22:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEA1543727;
	Wed, 10 Jan 2024 22:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEA1543727
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KV3rKWZyEncF; Wed, 10 Jan 2024 22:05:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80E554379C;
	Wed, 10 Jan 2024 22:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80E554379C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 064151BF304
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3FDE83C43
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3FDE83C43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFh6ajsxq7xW for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 22:05:18 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7CC783C31
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7CC783C31
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AED9FB00539;
 Wed, 10 Jan 2024 23:05:10 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Jan 2024 23:05:10 +0100
Date: Wed, 10 Jan 2024 23:05:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZZ8UlugEjZxp2w9O@landeda>
References: <20240110211223.791548-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110211223.791548-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704924315;
 bh=rywEFoi+5tl/N1MIgcE28guEsjJ4Tw8NkGIw5AlO7DU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fMRURCmKE/+CCrxNlxotLRUNwhGxvfU4TEABJGJzjIlqJzgsGKqJ0kAaGHcb0WDYq
 YszHPM679MHAMvCouNXjc+t4HusvV9v46zU5V78o5cquDfMovzMl+tn9Eu2EWk9MBR
 3mfMtxeB1LmJpEDdaZU3QTWwgPqyZzZC7NJEC1ECEeg28YTKNtvHayz49MpBIGoIry
 OjR4N9ALxXedtus8ITRq73h9xlG97gp9+cp87yjMWN+sJHi9ewD0QBxtqKTURHuWRD
 seyuF3L0Adgj5FN7hZDNtUTTNnVx57I1680Ux+niTr3i/mPnZUxm8QH6AC0yT00Wl5
 Fu3am1Ims2mXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fMRURCmK
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libtracefs: bump to version
 1.8.0
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2024-01-10 22:12 +0100, Giulio Benetti spake thusly:
> Let's drop local patch thas has been upstreamed but another one to fix
> linking failure due to meson and Makefile unalignment. Also, now libtracefs
> samples require pthread, but we don't want samples to be built to save
> target size and reduce dependencies counot, so let's disable it by setting
> meson samples variable to false in LIBTRACEFS_CONF_OPTS.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
[--SNIP--]
> diff --git a/package/libtracefs/0001-libtracefs-meson-build-tracefs-mmap-by-default.patch b/package/libtracefs/0001-libtracefs-meson-build-tracefs-mmap-by-default.patch
> new file mode 100644
> index 0000000000..caa8b1a05e
> --- /dev/null
> +++ b/package/libtracefs/0001-libtracefs-meson-build-tracefs-mmap-by-default.patch
> @@ -0,0 +1,30 @@
> +From 2ff02ff91b5dc81b7cc253f88c9fce15664daeba Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 10 Jan 2024 21:38:51 +0100
> +Subject: [PATCH] libtracefs meson: build tracefs-mmap by default
> +
> +Accordingly to Makefile let's add tracefs-mmap.c to build, this is needed
> +for linking by other object files.
> +
> +Upstream: https://patchwork.kernel.org/project/linux-trace-devel/patch/20240110203925.266999-1-giulio.benetti@benettiengineering.com/

It has been applied now, so I made a p[roper backport.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + src/meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/meson.build b/src/meson.build
> +index 5b76554..f7a98b9 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -11,6 +11,7 @@ sources= [
> +    'tracefs-instance.c',
> +    'tracefs-kprobes.c',
> +    'tracefs-marker.c',
> ++   'tracefs-mmap.c',
> +    'tracefs-record.c',
> +    'tracefs-sqlhist.c',
> +    'tracefs-tools.c',
> +-- 
> +2.34.1
> +
> diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
> index 040467af08..ebc562eb40 100644
> --- a/package/libtracefs/libtracefs.hash
> +++ b/package/libtracefs/libtracefs.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  411fcbf3434ecbaefa6c2b1bf092266293a672e2d7ee46fdd6b402753cb8bd16  libtracefs-1.7.0.tar.gz
> +sha256  f92475d5c4cb509983697fb359ee615bef4f08ed8bdc9c690f6118ba68886de0  libtracefs-1.8.0.tar.gz
>  sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
>  sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
> diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
> index 1e6e19a234..ed45fcbc50 100644
> --- a/package/libtracefs/libtracefs.mk
> +++ b/package/libtracefs/libtracefs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBTRACEFS_VERSION = 1.7.0
> +LIBTRACEFS_VERSION = 1.8.0
>  LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
>  LIBTRACEFS_INSTALL_STAGING = YES
>  LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
> @@ -13,6 +13,7 @@ LIBTRACEFS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
>  LIBTRACEFS_DEPENDENCIES = host-bison host-flex host-pkgconf libtraceevent
>  
>  LIBTRACEFS_CONF_OPTS = \
> -	-Ddoc=false
> +	-Ddoc=false \
> +	-Dsamples=false
>  
>  $(eval $(meson-package))
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
