Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF70C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90B6D41F8A;
	Thu,  9 Nov 2023 21:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90B6D41F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7rnOO__5Ent; Thu,  9 Nov 2023 21:52:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B9AC4209D;
	Thu,  9 Nov 2023 21:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B9AC4209D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04C001BF312
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D25AC60736
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D25AC60736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uGBTSF90UpSh for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:52:48 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 667656062F
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 667656062F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:bf98:93a4:26f0:a873])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2550413F88F;
 Thu,  9 Nov 2023 22:52:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 09 Nov 2023 22:52:41 +0100
Date: Thu, 9 Nov 2023 22:52:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231109215241.GF996011@scaer>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
 <20231105202555.359391-19-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231105202555.359391-19-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699566766;
 bh=tucoY+48gr2BdvC64wNBbtDzlN/8VIktFli+SOyC+kM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bXZnriSQMkDn6npdiqntWG4zELVmZGdj+1EEPTGl7iuK/pO4JxoPM0ODAr5v7Q3Yz
 +TJXtQrGWd/ji7XrQUnWcgQMED2qEXk+xTci5O6V4wszRjVmxyd2jctvlQrCN+ZsqV
 64oURsbC81ATCtWJgwtF4JdKtT5KyNbgCvZ0VODFZxaZ3adLtDZyMw6m/lz1ysi5zX
 wF9Bdjy2eHJyPmgc/wfCi9OjM9H5jmneh85Fpe070Mq9/EPyFGsMRiV6XjOflXFu3A
 QDAtY8JpxZJYH/slByV9b7mmkAzVRSrl5zKqVCImcZ1DFAjCa8Rl/qrl8HrQ/2yxs7
 vcnGwSIxnrBFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bXZnriSQ
Subject: Re: [Buildroot] [PATCH v2 19/24] package/python-pygame: drop package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-11-05 13:25 -0700, Adam Duskett spake thusly:
> The python-pygame package has not recieved any update since
> Sun May 1 22:15:17 2016 (commit: a9ec96e545102ae5ccd4280323d35360b0a5072d)
> As python 3.12.0 no longer supports distutils, drop the package as the package
> is clearly unmaintained.
> 
> If someone wants to re-introduce this package at a later date they are more
> than welcome to do so!

Thet got a respite, as I applied James patch to switch to setuptools
instead of distutils:

    e759e927b344  package/python-pygame: switch from distutils to setuptools

So, this patch that drops pyhon-pygame is no longer needed; I've marked
it rekected in patchwork.

Thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v1 -> v2:
>  - Remove python-pygame from the DEVELOPERS file
>  - Don't remove python-pyxb from Config.in in this patch.
> 
>  DEVELOPERS                               |   1 -
>  package/Config.in                        |   1 -
>  package/python-pygame/Config.in          |  50 ----------
>  package/python-pygame/python-pygame.hash |   3 -
>  package/python-pygame/python-pygame.mk   | 111 -----------------------
>  5 files changed, 166 deletions(-)
>  delete mode 100644 package/python-pygame/Config.in
>  delete mode 100644 package/python-pygame/python-pygame.hash
>  delete mode 100644 package/python-pygame/python-pygame.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3334cad77f..b890fb2586 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1687,7 +1687,6 @@ F:	package/libcddb/
>  F:	package/libmodbus/
>  F:	package/ltris/
>  F:	package/opentyrian/
> -F:	package/python-pygame/
>  
>  N:	Julien Corjon <corjon.j@ecagroup.com>
>  F:	package/qt5/
> diff --git a/package/Config.in b/package/Config.in
> index 32347fe4e8..19e5035878 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1228,7 +1228,6 @@ menu "External python modules"
>  	source "package/python-pydyf/Config.in"
>  	source "package/python-pyelftools/Config.in"
>  	source "package/python-pyftpdlib/Config.in"
> -	source "package/python-pygame/Config.in"
>  	source "package/python-pygments/Config.in"
>  	source "package/python-pyhamcrest/Config.in"
>  	source "package/python-pyicu/Config.in"
> diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
> deleted file mode 100644
> index 57eb020742..0000000000
> --- a/package/python-pygame/Config.in
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -config BR2_PACKAGE_PYTHON_PYGAME
> -	bool "python-pygame"
> -	select BR2_PACKAGE_SDL
> -	help
> -	  Pygame is a cross-platfrom library designed to make it easy
> -	  to write multimedia software, such as games, in
> -	  Python. Pygame requires the Python language and SDL
> -	  multimedia library.
> -	  It can also make use of several other popular libraries.
> -
> -	  http://www.pygame.org/
> -
> -if BR2_PACKAGE_PYTHON_PYGAME
> -config BR2_PACKAGE_PYTHON_PYGAME_IMAGE
> -	bool "pygame.image"
> -	select BR2_PACKAGE_SDL_IMAGE
> -	select BR2_PACKAGE_SDL_IMAGE_PNG
> -	select BR2_PACKAGE_SDL_IMAGE_JPEG
> -	help
> -	  pygame module for loading, saving and transfering images.
> -	  Will autoselect sdl_image with png and jpeg support.
> -
> -config BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES
> -	bool "pygame.examples"
> -	help
> -	  Include examples.
> -	  Selecting this option adds about 1.5 MB to the target file
> -	  system.
> -
> -config BR2_PACKAGE_PYTHON_PYGAME_FONT
> -	bool "pygame.font"
> -	select BR2_PACKAGE_SDL_TTF
> -	help
> -	  pygame module for loading and rendering fonts.
> -	  Will autoselect sdl_ttf.
> -
> -config BR2_PACKAGE_PYTHON_PYGAME_MIXER
> -	bool "pygame.mixer"
> -	select BR2_PACKAGE_SDL_MIXER
> -	help
> -	  pygame module for loading and playing sounds.
> -	  Will autoselect sdl_mixer.
> -
> -config BR2_PACKAGE_PYTHON_PYGAME_SCRAP
> -	bool "pygame.scrap"
> -	depends on BR2_PACKAGE_SDL_X11
> -	help
> -	  pygame module for clipboard support (X11 needed)
> -
> -endif
> diff --git a/package/python-pygame/python-pygame.hash b/package/python-pygame/python-pygame.hash
> deleted file mode 100644
> index c0496515e2..0000000000
> --- a/package/python-pygame/python-pygame.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally computed
> -sha256  f95a7dd68ea294d415e36e068d2f533c5a01c67773452d14a535c5c7455681fe  pygame-d61ea8eabd56.tar.gz
> -sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  LGPL
> diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
> deleted file mode 100644
> index 600dd9e743..0000000000
> --- a/package/python-pygame/python-pygame.mk
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -################################################################################
> -#
> -# python-pygame
> -#
> -################################################################################
> -
> -# stable 1.9.1 release requires V4L which has been wiped out of recent Linux
> -# kernels, so use latest mercurial revision until next stable release is out.
> -PYTHON_PYGAME_VERSION = d61ea8eabd56
> -PYTHON_PYGAME_SOURCE = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
> -PYTHON_PYGAME_SITE = https://bitbucket.org/pygame/pygame
> -PYTHON_PYGAME_SITE_METHOD = hg
> -PYTHON_PYGAME_SETUP_TYPE = distutils
> -PYTHON_PYGAME_LICENSE = LGPL-2.1+
> -PYTHON_PYGAME_LICENSE_FILES = LGPL
> -
> -ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
> -PYTHON_PYGAME_OPT_DEPENDS += sdl_image
> -endif
> -
> -ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)
> -PYTHON_PYGAME_OPT_DEPENDS += sdl_ttf
> -endif
> -
> -ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)
> -PYTHON_PYGAME_OPT_DEPENDS += sdl_mixer
> -endif
> -
> -PYTHON_PYGAME_DEPENDENCIES = sdl $(PYTHON_PYGAME_OPT_DEPENDS)
> -
> -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
> -define PYTHON_PYGAME_UNCONFIGURE_IMAGE
> -	$(SED) 's/^imageext/#imageext/' $(@D)/Setup
> -endef
> -endif
> -
> -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)
> -define PYTHON_PYGAME_UNCONFIGURE_FONT
> -	$(SED) 's/^font/#font/' $(@D)/Setup
> -endef
> -endif
> -
> -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)
> -define PYTHON_PYGAME_UNCONFIGURE_MIXER
> -	$(SED) 's/^mixer/#mixer/g' $(@D)/Setup
> -endef
> -endif
> -
> -# Both require numpy or numeric python module
> -define PYTHON_PYGAME_UNCONFIGURE_SNDARRAY
> -	$(SED) 's/^_numericsndarray/#_numericsndarray/' $(@D)/Setup
> -endef
> -
> -define PYTHON_PYGAME_UNCONFIGURE_SURFARRAY
> -	$(SED) 's/^_numericsurfarray/#_numericsurfarray/' $(@D)/Setup
> -endef
> -
> -# Requires smpeg
> -define PYTHON_PYGAME_UNCONFIGURE_MOVIE
> -	$(SED) 's/^movie/#movie/' $(@D)/Setup
> -endef
> -
> -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_SCRAP),y)
> -define PYTHON_PYGAME_UNCONFIGURE_SCRAP
> -	$(SED) 's/^scrap/#scrap/' $(@D)/Setup
> -endef
> -endif
> -
> -define PYTHON_PYGAME_UNCONFIGURE_FREETYPE
> -	$(SED) 's/^_freetype/#_freetype/' $(@D)/Setup
> -endef
> -
> -PYTHON_PYGAME_SDL_FLAGS = `$(STAGING_DIR)/usr/bin/sdl-config --cflags`
> -PYTHON_PYGAME_SDL_FLAGS += `$(STAGING_DIR)/usr/bin/sdl-config --libs`
> -
> -# Pygame needs a Setup file where options should be commented out if
> -# dependencies are not available
> -define PYTHON_PYGAME_CONFIGURE_CMDS
> -	cp -f $(@D)/Setup.in $(@D)/Setup
> -	$(SED) "s~^SDL = ~SDL = $(PYTHON_PYGAME_SDL_FLAGS) \n#~" $(@D)/Setup
> -	$(SED) 's/^pypm/#pypm/' $(@D)/Setup
> -	$(PYTHON_PYGAME_UNCONFIGURE_IMAGE)
> -	$(PYTHON_PYGAME_UNCONFIGURE_FONT)
> -	$(PYTHON_PYGAME_UNCONFIGURE_MIXER)
> -	$(PYTHON_PYGAME_UNCONFIGURE_SNDARRAY)
> -	$(PYTHON_PYGAME_UNCONFIGURE_SURFARRAY)
> -	$(PYTHON_PYGAME_UNCONFIGURE_MOVIE)
> -	$(PYTHON_PYGAME_UNCONFIGURE_SCRAP)
> -	$(PYTHON_PYGAME_UNCONFIGURE_FREETYPE)
> -endef
> -
> -define PYTHON_PYGAME_REMOVE_DOC
> -	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/docs
> -endef
> -
> -PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_DOC
> -
> -define PYTHON_PYGAME_REMOVE_TESTS
> -	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/tests
> -endef
> -
> -PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_TESTS
> -
> -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES),y)
> -define PYTHON_PYGAME_REMOVE_EXAMPLES
> -	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pygame/examples
> -endef
> -PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_EXAMPLES
> -endif
> -
> -$(eval $(python-package))
> -- 
> 2.41.0
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
