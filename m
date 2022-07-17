Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185B3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 08:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A11BE416AF;
	Sun, 17 Jul 2022 08:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A11BE416AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X6kOIOvjn2SV; Sun, 17 Jul 2022 08:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F24FD41728;
	Sun, 17 Jul 2022 08:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F24FD41728
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 434691BF369
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 08:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CF0140190
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 08:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CF0140190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SRX--b5AKm0F for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 08:32:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 980CB40154
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 980CB40154
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 08:32:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 62A52780503;
 Sun, 17 Jul 2022 10:32:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 10:32:41 +0200
Date: Sun, 17 Jul 2022 10:32:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220717083241.GB2543@scaer>
References: <20220715053853.527195-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220715053853.527195-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658046764;
 bh=BRixf8PpfUBJxv6flx2h9uoZprpGPTK3b8esK46zcow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GWJrGQIb3nlJD22MoLJYgYDJROVxFpWkpdFT5Q5gq7P506IdT3HyKFXQ5FUOuNC+e
 4euQ+Cgbvc6WBJ8fzDQVUYb3K6VNbcEVu6gg1Dctw94ncH1uW3wnV+GDQONWlWYO39
 osQj4AeyICyxTlTyERFbboKzV7bw6pzEWmbdEl/CRGdWcE4BlQRxPdwKkOWZgDHzvA
 km7DzHamV76VYlaY/+rGoaO8oRwyCg1P3LTtrdiLXmPAAsd/YBZecwL5HlovLNKmfg
 NZQvRGD/ullp5HKJDV1RzlA8Z1L+RXB+mBtHVKuk1ZE0LgXYc0icYCGh64+N+VGjgw
 MnXwhypt70vwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GWJrGQIb
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: bump to version 2.72.3
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

James, All,

On 2022-07-14 23:38 -0600, James Hilliard spake thusly:
> Rebase remove cpp requirement patch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0002-remove-cpp-requirement.patch         | 49 ++++++++-----------
>  package/libglib2/libglib2.hash                |  4 +-
>  package/libglib2/libglib2.mk                  |  4 +-
>  3 files changed, 24 insertions(+), 33 deletions(-)
> 
> diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
> index b5603c92f4..84511dea32 100644
> --- a/package/libglib2/0002-remove-cpp-requirement.patch
> +++ b/package/libglib2/0002-remove-cpp-requirement.patch
> @@ -1,4 +1,4 @@
> -From 2f168951df1feebeac549ada1ea44ea092484c54 Mon Sep 17 00:00:00 2001
> +From dd65a8cfdeafeb18b72d8d1eb676c7ca43ae505f Mon Sep 17 00:00:00 2001
>  From: Adam Duskett <Aduskett@gmail.com>
>  Date: Mon, 16 Sep 2019 10:12:38 -0700
>  Subject: [PATCH] remove cpp requirement
> @@ -12,15 +12,14 @@ Upstream status: Denied (Buildroot specific)
>  https://gitlab.gnome.org/GNOME/glib/issues/1748
>  ---
>   glib/glibconfig.h.in |  1 -
> - meson.build          | 18 +-----------------
> - tests/meson.build    |  5 -----
> - 3 files changed, 1 insertion(+), 23 deletions(-)
> + meson.build          | 19 +------------------
> + 2 files changed, 1 insertion(+), 19 deletions(-)
>  
>  diff --git a/glib/glibconfig.h.in b/glib/glibconfig.h.in
> -index 7ef8c48..128e65d 100644
> +index e66748d95..2173d8be6 100644
>  --- a/glib/glibconfig.h.in
>  +++ b/glib/glibconfig.h.in
> -@@ -117,7 +117,6 @@ typedef unsigned @glib_intptr_type_define@ guintptr;
> +@@ -119,7 +119,6 @@ typedef unsigned @glib_intptr_type_define@ guintptr;
>   @glib_vacopy@
>   
>   @g_have_iso_c_varargs@
> @@ -29,15 +28,15 @@ index 7ef8c48..128e65d 100644
>   /* gcc-2.95.x supports both gnu style and ISO varargs, but if -ansi
>    * is passed ISO vararg support is turned off, and there is no work
>  diff --git a/meson.build b/meson.build
> -index 4bbf4c2..ac59f4e 100644
> +index 48fdfe864..5df242e39 100644
>  --- a/meson.build
>  +++ b/meson.build
>  @@ -1,4 +1,4 @@
>  -project('glib', 'c', 'cpp',
>  +project('glib', 'c',
> -   version : '2.70.4',
> -   # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
> -   meson_version : '>= 0.49.2',
> +   version : '2.72.3',
> +   # NOTE: We keep this pinned at 0.52 because that's what Debian Stable ships
> +   meson_version : '>= 0.52.0',
>  @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
>   )
>   
> @@ -46,7 +45,15 @@ index 4bbf4c2..ac59f4e 100644
>   
>   cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
>   
> -@@ -1696,20 +1695,6 @@ if g_have_iso_c_varargs
> +@@ -495,7 +494,6 @@ else
> + endif
> + 
> + add_project_arguments(cc.get_supported_arguments(warning_c_args), language: 'c')
> +-add_project_arguments(cxx.get_supported_arguments(warning_cxx_args), language: 'cpp')
> + 
> + # FIXME: We cannot build some of the GResource tests with -z nodelete, which
> + # means we cannot use that flag in add_project_link_arguments(), and must add
> +@@ -1734,20 +1732,6 @@ if g_have_iso_c_varargs
>   #endif''')
>   endif
>   
> @@ -67,7 +74,7 @@ index 4bbf4c2..ac59f4e 100644
>   g_have_gnuc_varargs = cc.compiles('''
>     void some_func (void) {
>       int a(int p1, int p2, int p3);
> -@@ -2339,7 +2324,6 @@ subdir('gobject')
> +@@ -2381,7 +2365,6 @@ subdir('gobject')
>   subdir('gthread')
>   subdir('gmodule')
>   subdir('gio')
> @@ -75,22 +82,6 @@ index 4bbf4c2..ac59f4e 100644
>   if build_tests
>     subdir('tests')
>   endif
> -diff --git a/tests/meson.build b/tests/meson.build
> -index e4ea226..7fd974c 100644
> ---- a/tests/meson.build
> -+++ b/tests/meson.build
> -@@ -55,11 +55,6 @@ tests = {
> -     'source': 'module-test.c',
> -     'c_args': ['-DMODULE_TYPE="plugin"'],
> -   },
> --  'cxx-test' : {
> --    'source' : 'cxx-test.cpp',
> --    'include_directories' : gmoduleinc,
> --    'dependencies' : [libgio_dep],
> --  },
> - }
> - 
> - test_extra_programs = {
>  -- 
> -2.23.0
> +2.34.1
>  
> diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> index f0f0cb55ad..0395ff234a 100644
> --- a/package/libglib2/libglib2.hash
> +++ b/package/libglib2/libglib2.hash
> @@ -1,4 +1,4 @@
> -# https://download.gnome.org/sources/glib/2.70/glib-2.70.4.sha256sum
> -sha256  ab3d176f3115dcc4e5d02db795984e04e4f4b48d836252e23e8c468e9d423c33  glib-2.70.4.tar.xz
> +# https://download.gnome.org/sources/glib/2.72/glib-2.72.3.sha256sum
> +sha256  4a39a2f624b8512d500d5840173eda7fa85f51c109052eae806acece85d345f0  glib-2.72.3.tar.xz
>  # License files, locally calculated
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 18f5b329c7..2970d5a7a9 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBGLIB2_VERSION_MAJOR = 2.70
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
> +LIBGLIB2_VERSION_MAJOR = 2.72
> +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>  LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
>  LIBGLIB2_LICENSE = LGPL-2.1+
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
