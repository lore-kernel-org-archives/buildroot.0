Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25889C61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 17:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2E3C813D6;
	Sun, 29 Jan 2023 17:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2E3C813D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id viv1iOvGH_v4; Sun, 29 Jan 2023 17:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C91FA813D8;
	Sun, 29 Jan 2023 17:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C91FA813D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA3561BF35F
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 17:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84C8E404D1
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 17:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84C8E404D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M1g6SE7X3GzQ for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 17:11:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B6FB400D9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B6FB400D9
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 17:11:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 224E05FF9E;
 Sun, 29 Jan 2023 18:11:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 18:11:32 +0100
Date: Sun, 29 Jan 2023 18:11:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alessandro Partesotti <a.partesotti@gmail.com>
Message-ID: <20230129171132.GO2632@scaer>
References: <20230128094119.10660-1-a.partesotti@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230128094119.10660-1-a.partesotti@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675012296;
 bh=XqXk9dDbRsij/teW+p+ZFxpovl1SxrqfZ1o8VQVhE2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CuIvWwzhRPxCxo9ANrXtPP9zaIzqhAMHxrH5kNf601b0Mb4OskALiLYNmQDl2S/pw
 733pnd3ReIw7kd0kI+3okKv/VU2rJjdvLHV/Zsr5jWW8shcamENg1scRSN1e8w5+pi
 ck4LeYCEivlDGlREqVhT5iiq3bQ77/CkkgcUciOrasQSGb1bTGIwbUMnRW4Zaz69YQ
 yeC33e2B+FoA+RDMOIZo0hivsKzjmkpcKcHQHU0vZEi0u0d+JLaBQC7NXby3PDGFPQ
 LdSieEg0zuO8QXFjo/tXRcpDT6csa+WhKApFpLsYz+oWfgOIuLsDZCU/SkqSoDMWL8
 AKzJM7/5BdYnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CuIvWwzh
Subject: Re: [Buildroot] [PATCH 1/1] package/oatpp:: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alessandro, All,

Thanks for this patc; please find my review and comments below.

On 2023-01-28 10:41 +0100, Alessandro Partesotti spake thusly:
> This package introduce oatpp in BR buildsystem. oatpp must be used as static library in $(STAGING_DIR)/usr/include/oatpp-$(OATPP_VERSION)/oatpp for user that want to build therir own application by linking oatpp in a buildroot build system.

Please, wrap your commit log to about 72 chars.

Why does it need to be a static library? Why does a shared library not
work? I see tht upstream suggests that, so maybe just state so.

> Signed-off-by: Alessandro Partesotti <a.partesotti@gmail.com>
> ---
>  package/Config.in       |  3 +++
>  package/oatpp/Config.in | 14 ++++++++++++++
>  package/oatpp/oatpp.mk  | 16 ++++++++++++++++

You are missing a hash file, which contains the hashes for the source
archive and the license file(s). See below.

> diff --git a/package/Config.in b/package/Config.in
> index 995dae2c57..481876a278 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1941,6 +1941,7 @@ menu "Networking"
>  	source "package/nss-mdns/Config.in"
>  	source "package/nss-myhostname/Config.in"
>  	source "package/nss-pam-ldapd/Config.in"
> +	source "package/oatpp/Config.in"
>  	source "package/omniorb/Config.in"
>  	source "package/open-isns/Config.in"
>  	source "package/open62541/Config.in"
> @@ -2702,4 +2703,6 @@ menu "Text editors and viewers"
>  	source "package/vim/Config.in"
>  endmenu
>  
> +
>  endmenu
> +

Two spurious empty lines added.

> diff --git a/package/oatpp/Config.in b/package/oatpp/Config.in
> new file mode 100644
> index 0000000000..86eb4573a6
> --- /dev/null
> +++ b/package/oatpp/Config.in
> @@ -0,0 +1,14 @@
> +comment "Oat++ needs a toolchain w/ C++, threads and Paranoid Unsafe Path compiler flag disabled"
> +        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || BR2_COMPILER_PARANOID_UNSAFE_PATH

If the paranoid unsafe paths check triggers, it means that the target
build is using headers (or libraries) from the host, and that is
definitely not correct, as those are not suitable to generate target
code.

Instead, the package must be fixed.

Long-term, we may even make that check mandatory and not configurable,
see:
    http://patchwork.ozlabs.org/project/buildroot/patch/20221107214903.1565321-1-yann.morin.1998@free.fr/

> +config BR2_PACKAGE_OATPP
> +	bool "Oat++"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_COMPILER_PARANOID_UNSAFE_PATH
> +	help
> +		Oat++ is an open-source C++ web framework for highly scalable and resource-efficient web applications.
> +		It provides all the necessary components for production-grade development.
> +		This package allows you to use oatpp to statically build this a project inside the staging directory.
> +		See https://oatpp.io/docs/start

Help text should be indented with a TAB and two spaces, and wrapped at
72 chars; running "make check-package" will point to coding style
issues.

> diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
> new file mode 100644
> index 0000000000..7abdeb6de5
> --- /dev/null
> +++ b/package/oatpp/oatpp.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# oatpp
> +#
> +################################################################################
> +
> +OATPP_VERSION= 1.3.0

Spaces around the equal sign; "make check-package" points to it too.

> +OATPP_SOURCE= $(OATPP_VERSION).tar.gz
> +OATPP_SITE= https://github.com/oatpp/oatpp/archive/refs/tags
> +#OATPP_SITE= git://github.com/oatpp/oatpp.git

Don't keep commented-out code; just remove it.

For github, we have two options:
  - if the package has been "released" by upstream, then they pushed a
    tarball and we must use it;
  - otherwise, we have a macro that assembles a proper URL.

In this case, there is no archive published by upstream, so we must use
the macro:

    OATPP_VERSION = 1.3.0
    OATPP_SITE = $(call github,oatpp,oatpp,$(OATPP_VERSION))

And that's all (no _SOURCE, no _SITE_METHOD).

https://buildroot.org/downloads/manual/manual.html#github-download-url

You are also missing the license declaration:
    OATPP_LICENSE = Apache-2.0
    OATPP_LICENSE_FILES = LICENSE

> +OATPP_INSTALL_STAGING= YES
> +OATPP_INSTALL_TARGET= NO

Shy no installation in target? Ah, yes, it's a static lib. Usually, we
like a small reminder about that:

    # Only builds a static lib:
    OATPP_INSTALL_TARGET= NO

> +OATPP_MAKE=make

Why do you need to force make? If that's because of a parallel build
issue, then use $(MAKE1) instead, and explain it in the commit message.

As it is supposed to be a static-only lib (as per upstream suggestion),
you probably also need to tell cmake to not build shared libs, which is
otherwise what Buildroot enforces:

    # As per upstream, oat++ is meant to be a static-only lib
    OATPP_CMAKE_OPTS = -DBUILD_SHARED_LIBS=OFF

Can you address those and respin an updated patch, please?

Regards,
Yann E. MORIN.

> +$(eval $(cmake-package))
> +
> -- 
> 2.25.1
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
