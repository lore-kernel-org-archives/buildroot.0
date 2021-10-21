Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB58C433FE
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 18:09:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2858061B00
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 18:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2858061B00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC12F40674;
	Thu, 21 Oct 2021 18:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHOGsT1Pqsxb; Thu, 21 Oct 2021 18:09:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A94640537;
	Thu, 21 Oct 2021 18:09:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48B751BF8B4
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 18:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37E2A606E5
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 18:09:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MHd-jKtzVy08 for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 18:09:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CA5560585
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 18:09:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e8e5:5688:10fe:8b80])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 81BF2780340;
 Thu, 21 Oct 2021 20:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634839750;
 bh=jn0dsT+pFds7/iUQY8ZC6kT8M9c+XCD5eD8MxTUsJ6E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i8/g3YgPdfit+lcC0pbFG7REMfoo8RFK4apsut+ZhfiFmBq8qrAjOTPl6LS+x6nxy
 HLkWBTrDMIjXNE/wi/cl39cGR4ZL8HBtJ2NB2zQ1QPoa5++75QsBHncqJrC54hdBiQ
 5BWzlhLsV6+AAx3BgDypbA2P07J+qGfwrR84OXo3l80TuOojhWto7xYUi8phWduBqa
 6VX0PJvMS2UD6R+cBBsWKthRnDWJHJkFzXPjPMAYY86yxfteKsZDivRBvKyBKYGepH
 +Uf7QGJqzpLrvSKNYcFE79lrVHw4mOhMtTUzLdX0rFtrnUxe9V2wl96rCI56dzeBol
 uWf3bQzKXC4TA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 21 Oct 2021 20:09:02 +0200
Date: Thu, 21 Oct 2021 20:09:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20211021180902.GF2400@scaer>
References: <20211021160612.475456-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021160612.475456-1-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boot/grub2/grub2.mk: Fix the installation
 of target tools
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
Cc: aduskett@gmail.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2021-10-21 18:06 +0200, Kory Maincent spake thusly:
> The tools was not installed anymore since we move from autotools to
            were
> generic-package. This patch fixes their installation.
> 
> We have decided to implement the install tool process by running the "make
> install" command for each tuples. This allows to have all different
                            tuple ('each' is a singular)

> platforms Grub modules installed in the target. The drawback is the
> overwrite of Grub2 binaries tools during each "make install" command. This
> drawback is not really important as it happens in the same package. This is
s/not really/absolutely not/  ;-)

> the best option to avoid unnecessary and more complexity to this package.

Yes, agreed.

> Yann adds also mixes fixes, like no semi-colons but separate lines, or
                 misc
> using && not sime-colon, and the calls to MESSAGE to explicit the different
               semi

Yeah, another guy doing typoes like I do! I like that! :-)

> step of the parallel build.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Tested-by: Adam Duskett <aduskett@gmail.com>

As Thomas already replied, this should be done in separate patches:
  - fix the tools installation
  - remove the unnecessary \-continuations
  - adding the MESSAGES calls

Regards,
Yann E. MORIN.

> ---
>  boot/grub2/grub2.mk | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index e01ebb2edb..19047d02f7 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -149,8 +149,9 @@ HOST_GRUB2_CONF_OPTS = \
>  
>  define GRUB2_CONFIGURE_CMDS
>  	$(foreach tuple, $(GRUB2_TUPLES-y), \
> -		mkdir -p $(@D)/build-$(tuple) ; \
> -		cd $(@D)/build-$(tuple) ; \
> +		@$(call MESSAGE,Configuring $(tuple))
> +		mkdir -p $(@D)/build-$(tuple)
> +		cd $(@D)/build-$(tuple) && \
>  		$(TARGET_CONFIGURE_OPTS) \
>  		$(TARGET_CONFIGURE_ARGS) \
>  		$(GRUB2_CONF_ENV) \
> @@ -172,13 +173,15 @@ endef
>  
>  define GRUB2_BUILD_CMDS
>  	$(foreach tuple, $(GRUB2_TUPLES-y), \
> +		@$(call MESSAGE,Building $(tuple))
>  		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build-$(tuple)
>  	)
>  endef
>  
>  define GRUB2_INSTALL_IMAGES_CMDS
>  	$(foreach tuple, $(GRUB2_TUPLES-y), \
> -		mkdir -p $(dir $(GRUB2_IMAGE_$(tuple))) ; \
> +		@$(call MESSAGE,Installing $(tuple) to images directory)
> +		mkdir -p $(dir $(GRUB2_IMAGE_$(tuple)))
>  		$(HOST_DIR)/usr/bin/grub-mkimage \
>  			-d $(@D)/build-$(tuple)/grub-core/ \
>  			-O $(tuple) \
> @@ -186,14 +189,23 @@ define GRUB2_INSTALL_IMAGES_CMDS
>  			-p "$(GRUB2_PREFIX_$(tuple))" \
>  			$(if $(GRUB2_BUILTIN_CONFIG_$(tuple)), \
>  				-c $(GRUB2_BUILTIN_CONFIG_$(tuple))) \
> -			$(GRUB2_BUILTIN_MODULES_$(tuple)) ; \
> -		$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG_$(tuple)) ; \
> +			$(GRUB2_BUILTIN_MODULES_$(tuple))
> +		$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG_$(tuple))
>  		$(if $(findstring $(GRUB2_PLATFORM_$(tuple)), pc), \
>  			cat $(HOST_DIR)/lib/grub/$(tuple)/cdboot.img $(GRUB2_IMAGE_$(tuple)) > \
> -				$(BINARIES_DIR)/grub-eltorito.img ; \
> +				$(BINARIES_DIR)/grub-eltorito.img
>  		) \
>  	)
>  endef
>  
> +ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
> +define GRUB2_INSTALL_TARGET_CMDS
> +	$(foreach tuple, $(GRUB2_TUPLES-y), \
> +		@$(call MESSAGE,Installing $(tuple) to target directory)
> +		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build-$(tuple) DESTDIR=$(TARGET_DIR) install
> +	)
> +endef
> +endif
> +
>  $(eval $(generic-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.25.1
> 

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
