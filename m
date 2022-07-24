Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B17C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 15:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9534840C4C;
	Sun, 24 Jul 2022 15:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9534840C4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZdXzW1Jh70P; Sun, 24 Jul 2022 15:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 760F140490;
	Sun, 24 Jul 2022 15:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 760F140490
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAB211BF282
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 15:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EDBA83EF4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 15:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EDBA83EF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eEUBUTFhwqXy for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 15:37:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27E8782F57
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27E8782F57
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 15:37:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:88cd:5a50:8d8a:801])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F161813FA3B;
 Sun, 24 Jul 2022 17:37:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Jul 2022 17:37:36 +0200
Date: Sun, 24 Jul 2022 17:37:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220724153736.GY2641@scaer>
References: <20220722060936.566534-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220722060936.566534-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658677063;
 bh=/rw4YfRH20Ia2xJO9UwJlU2GRa22XIT96UTseJfLgVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MxUbOP/Fj9h90X+qssI4ln5FFwnw+JX2iR6FWjpJYNZvYaFU2ju4V4nP5IKqhxj4J
 7mX5PAe4eALk/K5cx3Au6722FpnfKdDBk68Z74ubNenh58WwUpTP4E7q0qNToJxsoo
 5Z0RRSQarliCyjAF8qb/A8Wa4RZ+OL2mXYmqjU0kBBfnxn+fFuVeiS69Pg+auK5LHE
 cZ5XOk8mvotlWrmG+0YzBi9L7e20Ug2fqpMlyowgh6jv+seA2h7MLJ7Oou9AQlnvtx
 xNnnWh+8pbyn8glVa+ZKaIdE2cZPrMNtXMUdDyy9AkarD/PpCBg2P2hUr+lEoTPFeA
 wRiPB+XH+VcXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MxUbOP/F
Subject: Re: [Buildroot] [PATCH v3 1/1] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-07-22 00:09 -0600, James Hilliard spake thusly:
> As of version 0.54.0 meson has had the ability to build and install
> packages rather than having to run ninja directly as before.
> 
> This will allow us to use features such as meson install tags in
> the future which require meson to be used for the installation.
> 
> It appears we need to ensure the cmake prefix path is set for the
> meson generated relocatable pkg-config format to work properly.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
> index 029c8c2488..c8aed65c2f 100644
> --- a/docs/manual/adding-packages-meson.txt
> +++ b/docs/manual/adding-packages-meson.txt
> @@ -125,8 +125,8 @@ will therefore only use a few of them.
>    +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
>    +pkg_config_libdir+.
>  
> -* +FOO_NINJA_ENV+, to specify additional environment variables to pass to
> -  +ninja+, meson companion tool in charge of the build operations. By default,
> +* +FOO_MESON_ENV+, to specify additional environment variables to pass to
> +  +meson+, meson tool in charge of the build/install operations. By default,
>    empty.

IIRC, the topic of what to do about external packages that set their
FOO_NINJA_ENV, was raised in a previous iteration.

I understand that the conclusion was basically "the probability is low,
we don't handle it". This should have been noted in the commit log.

>  * +FOO_NINJA_OPTS+, to specify a space-separated list of targets to build. By

Now that we use meson to build and instal, does it still make sense to
have FOO_NINJA_OPTS to be the list of targets to install?

I mean, isn't there a way to tell meson what to install, instead?

[--SNIP--]
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 3b1db35fb6..4fa620080d 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -90,6 +90,8 @@ define $(2)_CONFIGURE_CMDS
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
> +		-DCMAKE_PREFIX_PATH="$$(STAGING_DIR)/usr" \
> +		-DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=ON \

But doesn't that needs to be in a separate patch? I mean, does it not
make sense opn its own?

[--SNIP--]
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 0835e08e3a..de5817d5da 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
[--SNIP--]
> @@ -138,6 +138,7 @@ define $(2)_CONFIGURE_CMDS
>  	$$(MESON) \
>  		--prefix=/usr \
>  		--libdir=lib \
> +		--pkgconfig.relocatable \

Please explain what that means and why this is needed in the context of
a target package.

>  		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
>  		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
>  		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
> @@ -156,10 +157,11 @@ define $(2)_CONFIGURE_CMDS
>  	mkdir -p $$($$(PKG)_SRCDIR)/build
>  	$$(HOST_CONFIGURE_OPTS) \
>  	$$($$(PKG)_CONF_ENV) $$(MESON) \
> -		--prefix=$$(HOST_DIR) \
> +		--prefix=/ \

It is very weird that host packages are configured with / as prefix, and
then installed in HOST_DIR set as DEST_DIR.

I guess this is working thanks to --pkgconfig.relocatable a few lines
below?

This must be explained in the commit log (and probably a little comment
above $(2)_CONFIGURE_CMDS for host packages.

>  		--libdir=lib \
> -		--sysconfdir=$$(HOST_DIR)/etc \
> -		--localstatedir=$$(HOST_DIR)/var \
> +		--pkgconfig.relocatable \
> +		--sysconfdir=etc \
> +		--localstatedir=var \

Ditto for etc and var?

So, to make it easier to follow, I'd change the ordering:

    --pkgconfig.relocatable \
    --prefix=/ \
    --sysconfdir=etc \
    --localstatedir=var \

Regards,
Yann E. MORIN.

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
