Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9A3C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 18:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC29C409A0;
	Sun, 21 Aug 2022 18:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC29C409A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcTraVg6f3ya; Sun, 21 Aug 2022 18:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16793408CC;
	Sun, 21 Aug 2022 18:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16793408CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5D981BF421
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 18:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0BDA81C2F
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 18:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0BDA81C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2b-QnA1bGk0K for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 18:45:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B22881C21
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B22881C21
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 18:45:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C65FC13F92C;
 Sun, 21 Aug 2022 20:45:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Aug 2022 20:45:48 +0200
Date: Sun, 21 Aug 2022 20:45:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Message-ID: <20220821184548.GZ2775145@scaer>
References: <20220129214235.5133-1-thomas.devoogdt@gmail.com>
 <20220129214235.5133-2-thomas.devoogdt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220129214235.5133-2-thomas.devoogdt@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661107553;
 bh=nxaT82zeO0oWbGm9MPtO4maue/CWz6LUJRSbyGKEEmc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qFA5rL6z1xy7bFgRQnZ/WgmHcMAHTmWXbl7ZFRuSG5T/X+iY6LjUf6IoLetLTMpUk
 mUDEqUyF2Ovh1smk/QlEmT+2lVaCSLQZyP0ujWo3FMX/srM7DDL18r4ENldqezFrFH
 wzQ59gTa23vO2nW6VK2zRZLeepINy4+vkD9B66XFBwsCpsKuD25ZzOlc6m4Kjm9Jcb
 aZe2ainMqKBZqJl0K8g/34nij+oknBDaO4gvpV4/mHUu9jYjju650GQhcAZ/XYpe8Q
 qMG2W3HP3q42SAOJtaPozhoma2YkAVu9UUudwtPWO+t2W/Fg4lXtDltM29dRqZ4jHt
 NRN3/yIx2noIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qFA5rL6z
Subject: Re: [Buildroot] [PATCH 2/2] package/libsoup: add choice between
 libsoup2 and libsoup3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-01-29 22:42 +0100, Thomas Devoogdt spake thusly:
> Libsoup3 has a new API [1], packages using libsoup2 may not
> compile with libsoup3 or may crash at runtime in unexpected
> ways. So the default will (for now) stay on libsoup2.
> A tracking table for the migration can be found here [2].

Seeing the comment by Peter on a previous iteration [0]...

I investigated a bit, and found that both libsoup2 and libsoup3 will
detect one another and explicitly fail; these are commits:
  - 9596a869414b Detect if libsoup2 is loaded in the same process at init
  - e7f842c35e97 Error when libsoup3 is detected as already loaded in
    the same process

Also, I've checked, and the includes are instaleld in different
directories and shared libraries have different filenames and SONAMES.

So, in case both are enabeld at the same time, what would fail is only
trhe case of a package loading one or the other via a third-party shared
library, e.g.:

    my-exec -> libA -> libsoup2
           `-> libsoup3

(or the other way around, or both through a library).

I don't think that is going to be a very common situation.

So, I think we should introduce libsoup3 as a different package. We have
only 10 packages in Buildroot that use libsoup, with the following
status (also looking at [2])

  - gmpc: 2.4 only

  - gssdp: should be 3.0 compatible since e3598a582783 (ci: Track
    libsoup master again) which is a few days old, so not in a relase
    yet (but at least, we could backport something...)

  - gst1-plugins-good: it should be in-tree with c3455def2e7b (soup:
    Runtime compatibility support for libsoup2 and libsoup3)

  - gstd-1.x: 2.4 only

  - gupnp-tools: 3.0 only since 09dfcdc65568 (Merge branch
    'wip/gupnp-1.6' into 'master') and 7ee5fd9beb04 (Port to GUPnP 1.6
    and libsoup 3), but no release yet.

  - gvfs: 2.4 only for now

  - libostree: 2.4 only

  - midori: uses webkitgtk, so I expect like webkitgtk?

  - webkitgtk: you seemed to imply that was OK [1]?

  - wpewebkit: this being webkit stuff, I would guess OK like webkitgtk?

So, the only one I can see conflicting is gstd: it links with libsoup3,
but I expect it also links or loads gstreamer libs or plugins, so there
will be a conflict.

So, if we need libsoup3 for a package that has no libsoup2 support, then
I think we should introduce a separate package. If we do not yet have a
need for libsoup3, let's postpone the introdution of it.

[0] https://lore.kernel.org/buildroot/87o83v7m5c.fsf@dell.be.48ers.dk/
[1] https://lore.kernel.org/buildroot/CACXRmJjSOrww35YVVmkg_DEHDaG3ngQts4obTeDUsfsigM4cBQ@mail.gmail.com/
[2] https://gitlab.gnome.org/GNOME/libsoup/-/issues/218

Regards,
Yann E. MORIN.

> Changes for libsoup3:
> - "0001-meson.build-set-c_std-to-gnu99.patch" is upstream now [3].
> - The "gnome" option was dropped in [4].
> - A new "libnghttp2" dependency is added since libsoup 2.99.6 (HTTP2 backend) [5].
> 
> [1] https://libsoup.org/libsoup-3.0/ch02.html
> [2] https://gitlab.gnome.org/GNOME/libsoup/-/issues/218
> [3] https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c3d431bdb094c59997f2a23e31e83f815ab667c
> [4] https://gitlab.gnome.org/GNOME/libsoup/-/commit/3fcaa882c4eb29fd754cdb6dd06195632cb4b52a
> [5] https://gitlab.gnome.org/GNOME/libsoup/-/commit/1a1d29c3114ca86c673d0c0b02a492d0962dcfe8
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
> ---
>  .../0001-meson.build-set-c_std-to-gnu99.patch    |  0
>  package/libsoup/Config.in                        | 16 ++++++++++++++++
>  package/libsoup/libsoup.hash                     |  2 ++
>  package/libsoup/libsoup.mk                       | 11 +++++++++++
>  4 files changed, 29 insertions(+)
>  rename package/libsoup/{ => 2.74.0}/0001-meson.build-set-c_std-to-gnu99.patch (100%)
> 
> diff --git a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch b/package/libsoup/2.74.0/0001-meson.build-set-c_std-to-gnu99.patch
> similarity index 100%
> rename from package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
> rename to package/libsoup/2.74.0/0001-meson.build-set-c_std-to-gnu99.patch
> diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
> index 02e8e8b578..959ddedef5 100644
> --- a/package/libsoup/Config.in
> +++ b/package/libsoup/Config.in
> @@ -16,8 +16,24 @@ config BR2_PACKAGE_LIBSOUP
>  
>  if BR2_PACKAGE_LIBSOUP
>  
> +choice
> +	prompt "libsoup version"
> +	default BR2_PACKAGE_LIBSOUP_VERSION_2
> +	help
> +	  Select the version of libsoup you wish to use.
> +
> +config BR2_PACKAGE_LIBSOUP_VERSION_3
> +	select BR2_PACKAGE_NGHTTP2
> +	bool "libsoup3"
> +
> +config BR2_PACKAGE_LIBSOUP_VERSION_2
> +	bool "libsoup2"
> +
> +endchoice
> +
>  config BR2_PACKAGE_LIBSOUP_GNOME
>  	bool "libsoup-gnome"
> +	depends on BR2_PACKAGE_LIBSOUP_VERSION_2
>  	help
>  	  Build libsoup-gnome library.
>  
> diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
> index 95c1c26eb4..6d87cc67e8 100644
> --- a/package/libsoup/libsoup.hash
> +++ b/package/libsoup/libsoup.hash
> @@ -1,3 +1,5 @@
> +# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/3.0/libsoup-3.0.0.sha256sum
> +sha256  cde05f3e20114ce985cbd03d575ff74e5e41e70a218e5eb3068c4bf4710dbf2b  libsoup-3.0.0.tar.xz
>  # From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.74/libsoup-2.74.0.sha256sum
>  sha256  33b1d4e0d639456c675c227877e94a8078d731233e2d57689c11abcef7d3c48e  libsoup-2.74.0.tar.xz
>  # Locally calculated
> diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
> index 1a26714992..bd8ce40643 100644
> --- a/package/libsoup/libsoup.mk
> +++ b/package/libsoup/libsoup.mk
> @@ -4,8 +4,13 @@
>  #
>  ################################################################################
>  
> +ifeq ($(BR2_PACKAGE_LIBSOUP_VERSION_3),y)
> +LIBSOUP_VERSION_MAJOR = 3.0
> +LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
> +else
>  LIBSOUP_VERSION_MAJOR = 2.74
>  LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
> +endif
>  LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
>  LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
>  LIBSOUP_LICENSE = LGPL-2.0+
> @@ -55,10 +60,16 @@ else
>  LIBSOUP_CONF_OPTS += -Dgssapi=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBSOUP_VERSION_2),y)
>  ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
>  LIBSOUP_CONF_OPTS += -Dgnome=true
>  else
>  LIBSOUP_CONF_OPTS += -Dgnome=false
>  endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBSOUP_VERSION_3),y)
> +LIBSOUP_DEPENDENCIES += nghttp2
> +endif
>  
>  $(eval $(meson-package))
> -- 
> 2.17.1
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
