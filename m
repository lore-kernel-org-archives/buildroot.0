Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48274C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E820441939;
	Tue, 25 Jul 2023 21:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E820441939
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FoTX4ZAVqpa; Tue, 25 Jul 2023 21:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FEAB4193D;
	Tue, 25 Jul 2023 21:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FEAB4193D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9ACFB1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 741FD40291
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 741FD40291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qnu0Q7EYisLG for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:01:18 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65E214014B
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65E214014B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A7C2E7802D7;
 Tue, 25 Jul 2023 23:01:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 23:01:14 +0200
Date: Tue, 25 Jul 2023 23:01:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230725210114.GQ3544423@scaer>
References: <20230725144951.941225-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725144951.941225-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690318876;
 bh=NTZUq3+kD52wzTPWWvjrqprLIsYTxzcxCEv21tTXHc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sQ/as3QLLUfdO08lAjB93s6gLP0mexQYqNYdgkqOaOGmtdOky55gGk3DviPRJEm6+
 G0BA6P8ojVpBiP0sAJtFyj8b1yhONcMm3xlYSJfxZ1QRxuPUntF2FJZzGSXFo3c5Ps
 ytPUqKphLzHSGuAi7+raO9nbkOZUpvPIqA8eqi2MEDgJaqUnUgFJ9Kfz7pIYPKLfoy
 7BHbVbN1ZYBH99mzRp6Qktzd+Kj+w+Dvi06dHnZBjZPV4PkAtJyZVkOYgGuHPlwnxu
 5YLUVnPWplxvca/UbR0VCQnKXyaJUjiGOnp0kRnPbk7lCSE3bzcFbk3HF2PuIxSYj/
 RLj0UnIxskKKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sQ/as3QL
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland-utils: bump to version
 1.2.0
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

James, All,

On 2023-07-25 08:49 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...ayland-info-Fix-build-without-libdrm.patch | 46 -------------------
>  package/wayland-utils/wayland-utils.hash      |  8 ++--
>  package/wayland-utils/wayland-utils.mk        |  2 +-
>  3 files changed, 4 insertions(+), 52 deletions(-)
>  delete mode 100644 package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch
> 
> diff --git a/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch b/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch
> deleted file mode 100644

    $ make check-package
    .checkpackageignore:1570: ignored file package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch is missing

I've fixed that and applied to master, thanks.

Regards,
Yann E. MORIN.

> index 2d4591f785..0000000000
> --- a/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 3657a11d45f133776b50c716d99f37965eb07ed1 Mon Sep 17 00:00:00 2001
> -From: Olivier Fourdan <ofourdan@redhat.com>
> -Date: Wed, 14 Sep 2022 09:07:10 +0200
> -Subject: [PATCH] wayland-info: Fix build without libdrm
> -
> -wayland-info can optionally use libdrm to provide a description of the
> -dmabuf format modifiers.
> -
> -When not using libdrm however, the build fails because "dev_t" is not
> -defined.
> -
> -The definition of "dev_t" comes from <sys/types.h> which is included
> -from <libdrm.h>, which is not included without libdrm support, hence the
> -build failure.
> -
> -Simply include <sys/types.h> unconditionally to make sure "dev_t" is
> -defined regardless of libdrm support, to fix the build failure.
> -
> -Closes: https://gitlab.freedesktop.org/wayland/wayland-utils/-/issues/6
> -Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
> -Fixes: 240cb739 - "Add support for linux_dmabuf version 4"
> -Reviewed-by: Simon Ser <contact@emersion.fr>
> -Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> -(cherry picked from commit baa65ba9f62e6a05c32b9202b524158a21f24245)
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> -[james.hilliard1@gmail.com: backport from upstream commit
> -3657a11d45f133776b50c716d99f37965eb07ed1]
> ----
> - wayland-info/wayland-info.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/wayland-info/wayland-info.c b/wayland-info/wayland-info.c
> -index 53cd04b..98ff205 100644
> ---- a/wayland-info/wayland-info.c
> -+++ b/wayland-info/wayland-info.c
> -@@ -34,6 +34,7 @@
> - #include <ctype.h>
> - #include <unistd.h>
> - #include <sys/mman.h>
> -+#include <sys/types.h>
> - 
> - #include <wayland-client.h>
> - #if HAVE_HUMAN_FORMAT_MODIFIER
> --- 
> -2.34.1
> -
> diff --git a/package/wayland-utils/wayland-utils.hash b/package/wayland-utils/wayland-utils.hash
> index c9b16e0535..fd14b986bc 100644
> --- a/package/wayland-utils/wayland-utils.hash
> +++ b/package/wayland-utils/wayland-utils.hash
> @@ -1,6 +1,4 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2022-September/042399.html
> -md5  1a398cbb75c3ac1ac231b2a8f84bd6d6  wayland-utils-1.1.0.tar.xz
> -sha1  38e5c37f5b35b86a84289659b4b0796811eb66cd  wayland-utils-1.1.0.tar.xz
> -sha256  9e685863025b4feade36d53bbc8e31b43e26498be743dea84c7a84912959410a  wayland-utils-1.1.0.tar.xz
> -sha512  5b841ecb9b534a9b353e104dda9410961495495380fa65e32ef40855750609b03942a87c2fd66339aab57c05b3b8699e2bee055cfd44151f9609a5f6c53349df  wayland-utils-1.1.0.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2023-June/042736.html
> +sha256  d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4  wayland-utils-1.2.0.tar.xz
> +sha512  dc69a2d88215b54486954bd9f6e91cd158b0c0b94dccd2c863477cf6b1e83a83db4466f0718aa7d2be4de8d06484c0672c79318bc5c2b1f082f893fe795c2c00  wayland-utils-1.2.0.tar.xz
>  sha256  1eba39c11640014a5841dd3017e5245fc31f47e1cf43a3287a286dd6a8de8a1a  COPYING
> diff --git a/package/wayland-utils/wayland-utils.mk b/package/wayland-utils/wayland-utils.mk
> index bc648a6904..efeb7e57a8 100644
> --- a/package/wayland-utils/wayland-utils.mk
> +++ b/package/wayland-utils/wayland-utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WAYLAND_UTILS_VERSION = 1.1.0
> +WAYLAND_UTILS_VERSION = 1.2.0
>  WAYLAND_UTILS_SITE = https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/$(WAYLAND_UTILS_VERSION)/downloads
>  WAYLAND_UTILS_SOURCE = wayland-utils-$(WAYLAND_UTILS_VERSION).tar.xz
>  WAYLAND_UTILS_LICENSE = MIT
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
