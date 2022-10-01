Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C28C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 21:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01655409AC;
	Sat,  1 Oct 2022 21:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01655409AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w23A1RqaGtne; Sat,  1 Oct 2022 21:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95D8940984;
	Sat,  1 Oct 2022 21:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95D8940984
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C47941BF4E6
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A000383104
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A000383104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8NnGV4Cy_qC4 for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 21:42:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61BD781A12
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61BD781A12
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 21:42:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 66680780346;
 Sat,  1 Oct 2022 23:41:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 23:41:57 +0200
Date: Sat, 1 Oct 2022 23:41:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20221001214157.GZ30794@scaer>
References: <1664265949-22692-1-git-send-email-gwenj@trabucayre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1664265949-22692-1-git-send-email-gwenj@trabucayre.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664660520;
 bh=EvlqxJmMMmCfaJSq2eJ9sGRy8N3ieYo/MJkcdkOnILw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fd+FrgKGGyCpg+1zgscWIxpdNpVtNWK90/p8+Q1RP9nqyJvylEIDYlxar0i1qL2E4
 8EOuF6Ut1Jr32Fg8n6xAi1q2ERiQ13vyxwHHDe/mYDf4G5iDtret3Z2VvrlQV97dYC
 wfp1OmRlEFFWodLZecl6fx7ylWLk2cIEvDCdvtel8ugJtKjToOQud2ga7qrYv6/fPO
 GEAyjgXlsfh7NvW1dIs42Z81rCOC2Q9YXXlYKxkmJ6avBJcMxPak+V04QYaBg39b4U
 roBGNYgMwQe9OTxcSj4hcN/j+g3aiEMZ6qIw0aPTT7jQ5098fIjlYhXSp5dljFKTYo
 wF57/7mu987Sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fd+FrgKG
Subject: Re: [Buildroot] [PATCH] package/volk: bump version to 2.5.2
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gwenhael, All,

On 2022-09-27 10:05 +0200, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> - with this release boost has been dropped: all select BR2_PACKAGE_BOOST_XXX
>   are removed
> - volk now uses functions only available with c++17: adds a depends on for
>   gcc > 7.0
> - COPYING-GPL is added to volk.hash
> - VOLK_LICENSE is updated with LGPL-3.0+

In fact, the licensing and boost and C++17 changes were already present
in the 2.5.2 version, so I've split this patch in three:
  - drop Boost, require C++17
  - fix licensing
  - bump to 2.5.2

Pleas review the licensing changes, I did quite some substantial
rewrites of the corresponding commit log.

The three resulting patches: applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/volk/Config.in | 9 ++-------
>  package/volk/volk.hash | 3 ++-
>  package/volk/volk.mk   | 8 ++++----
>  3 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/package/volk/Config.in b/package/volk/Config.in
> index 95b4a8bdb5..83d58d64ab 100644
> --- a/package/volk/Config.in
> +++ b/package/volk/Config.in
> @@ -1,20 +1,15 @@
>  comment "volk needs a toolchain w/ C++, NPTL, wchar, dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
>  		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
>  
>  config BR2_PACKAGE_VOLK
>  	bool "volk"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_USE_MMU # use fork()
> -	depends on BR2_USE_WCHAR # boost
> -	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
> -	select BR2_PACKAGE_BOOST
> -	select BR2_PACKAGE_BOOST_FILESYSTEM
> -	select BR2_PACKAGE_BOOST_SYSTEM
>  	help
>  	  VOLK is the Vector-Optimized Library of Kernels. It is a
>  	  library that contains kernels of hand-written SIMD code
> diff --git a/package/volk/volk.hash b/package/volk/volk.hash
> index 0ec96d22ff..b334a7613b 100644
> --- a/package/volk/volk.hash
> +++ b/package/volk/volk.hash
> @@ -1,4 +1,5 @@
>  # Locally computed
> -sha256  3f092737006ad2b7d24852833cf040e725c6f47d68ec2f4197895f84c6400bd8  volk-2.5.1.tar.xz
> +sha256  eff53206cd1ec3314755e0b2bde3c7aaea21dd0f0ad8d753bff07d98e93ddee2  volk-2.5.2.tar.xz
>  sha256  6dcdafa9e750545f5f65c2e6f53820184822db728ac2b8bfe1d4a47da09ec0d6  COPYING
> +sha256  6dcdafa9e750545f5f65c2e6f53820184822db728ac2b8bfe1d4a47da09ec0d6  COPYING-GPL
>  sha256  258f450f060a161fb9f9e2e7c07c6b1ee73e5142297e6792dc1ee76b028cf0ca  COPYING-LGPL
> diff --git a/package/volk/volk.mk b/package/volk/volk.mk
> index e7b004b87f..571a5477b1 100644
> --- a/package/volk/volk.mk
> +++ b/package/volk/volk.mk
> @@ -4,18 +4,18 @@
>  #
>  ################################################################################
>  
> -VOLK_VERSION = 2.5.1
> +VOLK_VERSION = 2.5.2
>  VOLK_SITE = https://github.com/gnuradio/volk/releases/download/v$(VOLK_VERSION)
>  VOLK_SOURCE = volk-$(VOLK_VERSION).tar.xz
>  # See https://github.com/gnuradio/volk/tree/v2.5.1#license for some
>  # details on the licensing.
> -VOLK_LICENSE = GPL-3.0+
> -VOLK_LICENSE_FILES = COPYING COPYING-LGPL
> +VOLK_LICENSE = GPL-3.0+ LGPL-3.0+
> +VOLK_LICENSE_FILES = COPYING COPYING-GPL COPYING-LGPL
>  
>  VOLK_SUPPORTS_IN_SOURCE_BUILD = NO
>  
>  # host-python-mako are needed for volk to compile
> -VOLK_DEPENDENCIES = host-python3 host-python-mako boost
> +VOLK_DEPENDENCIES = host-python3 host-python-mako
>  
>  VOLK_CONF_OPTS = \
>  	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
> -- 
> 2.30.2
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
