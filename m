Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E4EC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 22:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78CBC4017B;
	Mon,  1 Aug 2022 22:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78CBC4017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DpjHIJOZQQjR; Mon,  1 Aug 2022 22:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 507244015E;
	Mon,  1 Aug 2022 22:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 507244015E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF8DD1BF31F
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 22:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9D3F6068B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 22:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D3F6068B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LatNzRag8omj for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 22:16:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B2F960675
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B2F960675
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 22:16:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2042C60003;
 Mon,  1 Aug 2022 22:16:31 +0000 (UTC)
Date: Tue, 2 Aug 2022 00:16:29 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20220802001629.111c5177@windsurf>
In-Reply-To: <20220511114508.3617270-1-tianyuanhao3@163.com>
References: <20220511114508.3617270-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659392191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XPIGbnBd3KWlcTsp2EAEmVmz8DZalS0oZ2SX+B3JH0A=;
 b=fZBT9l1qUwpHegLjhHaSPIj42LEzMysl6vYE9CvO5zM45J7lI+3EdSIdOwIG5/YROsaLVq
 SIr7WMnq+6uu568a100rDL3SldJeaFat9VSckDv6mTi7BgfIx+kCA3+ro/rDvdu5e/v0VM
 vnjLGTjJ/DciX6yK56YWtJGYKKsdCLHfvk70I0+rMLcbetk+R9hy+U2VSKBwQYpfoC45bA
 p71EA8lN3uQWHl08Sy71BWhg7v6swsL3oCvXAHvI5r+zprQFD2Ey/DE33dl0ET+5yIgrUA
 /AKro6e7qIbPN4gkVOE0492E3ehwhpA0mGWdp//DaYmlp89Rh77+p0j+syESKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fZBT9l1q
Subject: Re: [Buildroot] [PATCH 1/1] package/apk-tools: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for your contribution.

On Wed, 11 May 2022 04:45:08 -0700
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> Alpine Package Keeper (apk) is a package manager developed for Alpine
> Linux.
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
> 
> I did read [1] before I submitted this patch.
> 
> I need a package manager in an embedded system and I found there are
> some Buildroot based projects having similar things like [2] and [3].
> Given the popularity of Alpine Linux in containers, I would like to
> choose apk as the package manager.
> 
> There is a performance comparison of package managers at [4].
> 
> An interesting finding is that OpenWrt seems to be planning to switch
> from opkg to apk [5].
> 
> In conclusion, I think Buildroot should have apk.
> 
> [1]: http://patchwork.ozlabs.org/project/buildroot/patch/1426736888-29437-5-git-send-email-steven@uplinklabs.net/
> [2]: https://github.com/batocera-linux/batocera.linux/blob/5.27/package/batocera/utils/pacman/pacman.mk
> [3]: https://github.com/gportay/linux-distros-br2-external/blob/master/package/apk-tools/apk-tools.mk
> [4]: https://michael.stapelberg.ch/posts/2019-08-17-linux-package-managers-are-slow/#measurements
> [5]: https://github.com/openwrt/openwrt/pull/4294

Thanks for your contribution and this argumentation. I will need some
feedback from other Buildroot maintainers before we can merge this
patch.

Could you describe a bit more how you are going to use it in the
context of Buildroot (which, as a reminder, doesn't support generate
binary packages) ?


> diff --git a/package/apk-tools/Config.in b/package/apk-tools/Config.in
> new file mode 100644
> index 0000000000..a7926a7c70
> --- /dev/null
> +++ b/package/apk-tools/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_APK_TOOLS
> +	bool "apk-tools"
> +	depends on !BR2_STATIC_LIBS # unconditionally shared
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # compound literals

Then you need a Config.in "comment", look at how other packages do this.

> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  Alpine Package Keeper (apk) is a package manager developed for
> +	  Alpine Linux.
> +
> +	  https://gitlab.alpinelinux.org/alpine/apk-tools
> diff --git a/package/apk-tools/apk-tools.hash b/package/apk-tools/apk-tools.hash
> new file mode 100644
> index 0000000000..a9ec2fb2ce
> --- /dev/null
> +++ b/package/apk-tools/apk-tools.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  6362d8a14bb0460f15a041754148344cbfc0a953461c702717e0d263d054db4d  apk-tools-v2.12.9.tar.bz2
> +sha256  b3c87315aae4c9f276c37168f2655dd8bd990544d7a0bbfb929664155c7ab257  LICENSE
> diff --git a/package/apk-tools/apk-tools.mk b/package/apk-tools/apk-tools.mk
> new file mode 100644
> index 0000000000..b92092cd73
> --- /dev/null
> +++ b/package/apk-tools/apk-tools.mk
> @@ -0,0 +1,53 @@
> +################################################################################
> +#
> +# apk-tools
> +#
> +################################################################################
> +
> +# Regenerate help.h when changing the version number
> +APK_TOOLS_VERSION = 2.12.9
> +APK_TOOLS_SITE = https://gitlab.alpinelinux.org/alpine/apk-tools/-/archive/v$(APK_TOOLS_VERSION)
> +APK_TOOLS_SOURCE = apk-tools-v$(APK_TOOLS_VERSION).tar.bz2
> +APK_TOOLS_LICENSE = GPL-2.0
> +APK_TOOLS_LICENSE_FILES = LICENSE
> +
> +APK_TOOLS_DEPENDENCIES = host-pkgconf openssl zlib
> +
> +APK_TOOLS_MAKE_OPTS = \
> +	CROSS_COMPILE="$(TARGET_CROSS)" \
> +	LUA=no \
> +	SCDOC=: \
> +	V=1 \

V=1 should probably be conditional on the $(QUIET) variable.

> +	cmd_genhelp=:

I think we prefer to use /bin/true instead of : in such situations.

> +
> +ifeq ($(BR2_SHARED_LIBS),y)
> +APK_TOOLS_MAKE_OPTS += \
> +	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)"
> +else
> +APK_TOOLS_MAKE_OPTS += \
> +	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY) --static" \

This should not be needed, in the BR2_STATIC_LIBS case, pkg-config
already uses --static.

> +	STATIC=y

Isn't this forcing static linking? Your Config.in prevents
BR2_STATIC_LIBS=y configuration, so in the else clause of
BR2_SHARED_LIBS, you only have BR2_SHARED_STATIC_LIBS=y, a case where
we want to link dynamically but (ideally) build/install both shared and
static libraries (even though clearly many of our packages do not
comply with this).

> +endif
> +
> +define APK_TOOLS_CONFIGURE_CMDS
> +	$(SED) 's/#\S\+\s\(APK_DEFAULT_ARCH\)\s.*/#define \1 $(BR2_ARCH)/' \
> +		$(@D)/src/apk_defines.h
> +	# Copy the pre-generated help.h so we don't need host-lua
> +	$(INSTALL) -D -m 644 $(APK_TOOLS_PKGDIR)/help.h $(@D)/src/help.h

Please add host-lua as a dependency. This pre-generated help.h is
really horrible :-/

> +define APK_TOOLS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(APK_TOOLS_MAKE_OPTS)
> +endef
> +
> +define APK_TOOLS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install \
> +		$(APK_TOOLS_MAKE_OPTS) \
> +		DESTDIR=$(TARGET_DIR)
> +	# Prepare an empty apk database
> +	$(INSTALL) -D -m 644 /dev/null $(TARGET_DIR)/etc/apk/world

What are you trying to do here? Seems weird to install /dev/null.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
