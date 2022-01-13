Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE19C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 17:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13F614011B;
	Thu, 13 Jan 2022 17:48:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QyMKjwlRxdCv; Thu, 13 Jan 2022 17:48:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3F6F40A62;
	Thu, 13 Jan 2022 17:48:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 259D41BF4DA
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12A6640A5E
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5E3n_3XueUqq for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 17:48:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C42AB4011B
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 17:48:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:84d2:7b0:3327:1b6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C32E219F522;
 Thu, 13 Jan 2022 18:48:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642096102;
 bh=AQe/0vPYoeEQdYSKmBT5uDmI2DbfkWJcSW3m2Qzed3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HzxXFWWYXsaxKJCm7cnVsgdIbLADxXZ0fBPmCbOOWQmrm6RLCiRkiHUDuvhmBNMWq
 7Tq+cwUN1A8QeIyF6riUe4xTDqRN4GD1QMyZ5KwKIWaSSEyjwP7go0Tli2wMRsyMW9
 nkzPR+5r7Gte4gbsbCgaApNM0xjVlhGVolWpoWhS/npr2bJAwd8mbMogsdPcHMHZ6j
 fFljlbneyNRugD1GPhLMkb9ZTPxD/MYoCo06yuq/Dj7IWw6k7YxVT1snffho8+EI41
 MmYrxBPEkOPXN4ntEd71vWKWGGKQ1SDJWwXeoPlAK44nVlR2Ds6ufmeuvQ2Z8X71JL
 qaNwQ5+TF2A6g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 13 Jan 2022 18:48:20 +0100
Date: Thu, 13 Jan 2022 18:48:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220113174820.GJ1477939@scaer>
References: <20220113094630.2322090-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220113094630.2322090-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gcr: add upstream patch to fix
 build with meson 0.61
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

Adrian, All,

On 2022-01-13 11:46 +0200, Adrian Perez de Castro spake thusly:
> Import an upstream patch which removes usage of an invalid keyword that
> was being passed to Meson's gnome.generate_gir() function.
> 
> This fixes the following autobuilder issues:
> 
>   http://autobuild.buildroot.net/results/cdd5c721544d6f07c51be536e414fa474f4b907b
>   http://autobuild.buildroot.net/results/8cecd33d7772b19d60f70a097dcb1623bb3ee7de
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...wn-kw-argument-in-gnome.generate_gir.patch | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch
> 
> diff --git a/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch b/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch
> new file mode 100644
> index 0000000000..e672b5e2ac
> --- /dev/null
> +++ b/package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch
> @@ -0,0 +1,62 @@
> +From 145bea264bed98cd435d8babfdee702c06c0afaa Mon Sep 17 00:00:00 2001
> +From: Jakub Jirutka <jakub@jirutka.cz>
> +Date: Wed, 12 Jan 2022 00:24:20 +0100
> +Subject: [PATCH 1/1] meson: Fix unknown kw argument in gnome.generate_gir

    $ make check-package
    package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch:4: generate your patches with 'git format-patch -N'

So I've done that, and done a proper backport.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +This argument has been removed in Meson 0.61.0:
> +
> +    gck/meson.build:130:2: ERROR: gnome.generate_gir got unknown keyword arguments "packages"
> +
> +https://github.com/mesonbuild/meson/commit/f8fc5cb860465718fe7c79a1bf1fe00659f138de:
> +
> +> The packages argument to gnome.generate_gir was allowed, but never did anything, so stop passing it.
> +
> +Fixes #89
> +
> +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> +Upstream-Status: https://gitlab.gnome.org/GNOME/gcr/-/merge_requests/81
> +---
> + gck/meson.build | 1 -
> + gcr/meson.build | 1 -
> + ui/meson.build  | 1 -
> + 3 files changed, 3 deletions(-)
> +
> +diff --git a/gck/meson.build b/gck/meson.build
> +index 756b486..a21a1e9 100644
> +--- a/gck/meson.build
> ++++ b/gck/meson.build
> +@@ -131,7 +131,6 @@ if get_option('introspection')
> +     sources: gck_gir_sources,
> +     namespace: 'Gck',
> +     nsversion: '@0@'.format(gck_major_version),
> +-    packages: gck_deps,
> +     export_packages: 'gck-@0@'.format(gck_major_version),
> +     includes: [ 'GObject-2.0', 'Gio-2.0' ],
> +     header: 'gck/gck.h',
> +diff --git a/gcr/meson.build b/gcr/meson.build
> +index 06c3a63..f998336 100644
> +--- a/gcr/meson.build
> ++++ b/gcr/meson.build
> +@@ -189,7 +189,6 @@ if get_option('introspection')
> +     sources: [ gcr_base_public_sources, gcr_base_headers ],
> +     namespace: 'Gcr',
> +     nsversion: '@0@'.format(gcr_major_version),
> +-    packages: gcr_base_deps,
> +     export_packages: 'gcr-base-@0@'.format(gcr_major_version),
> +     includes: [
> +       'GObject-2.0',
> +diff --git a/ui/meson.build b/ui/meson.build
> +index e656ea2..32ee057 100644
> +--- a/ui/meson.build
> ++++ b/ui/meson.build
> +@@ -152,7 +152,6 @@ if get_option('introspection')
> +     export_packages: 'gcr-ui-@0@'.format(gcr_major_version),
> +     identifier_prefix: 'Gcr',
> +     symbol_prefix: 'gcr',
> +-    packages: gcr_ui_deps,
> +     includes: [
> +       'GObject-2.0',
> +       'Gio-2.0',
> +-- 
> +2.34.1
> +
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
