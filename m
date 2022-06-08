Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D32C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 13:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5A1360D69;
	Wed,  8 Jun 2022 13:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czl7nPNTdLHj; Wed,  8 Jun 2022 13:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFD4560BE6;
	Wed,  8 Jun 2022 13:35:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 728EF1BF3AE
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 13:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EE1A60BE6
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 13:35:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aKpnL2jE1FQI for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 13:35:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CAE360B97
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 13:35:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 413351BF20B;
 Wed,  8 Jun 2022 13:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654695312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0i22uLmEYDZ0RemC+XRejDpYnvmgTt+VsM7YFjVi6u0=;
 b=OmNA+ZNzyiQ07u1Hv+mo/iVOc2kKLH8Z9IF96KSXTn9b+3xAoBKH8iBjuYtaoArfBP1aHo
 zFlk9yShw/msJT6Npcyo1BYQNzglT8iUAVCYMBIvNtOryV+8XJgrPNDNpzlQGYGyFPwhd8
 pCmd3ajI6kSajtJI/+IyNuMsYjdnz//kOKtvoC+6SV4wjqweEyabZh9P4Kc3LWxF5FXCPH
 dAgySKumbovadm9XC612tZ054QhX64ZqRRY+0cPvp3xCpSTZiZtoO/MN6LBGD1ai4y4TcH
 X0DhA4YVxGnFTL65xLJ+vJXhppwZcfTT0n71BMjrPrs3tK8dAFQYGir+K+7fvQ==
Date: Wed, 8 Jun 2022 15:35:11 +0200
To: kory.maincent@bootlin.com
Message-ID: <20220608153511.76266cac@windsurf>
In-Reply-To: <20220608132957.68895-1-kory.maincent@bootlin.com>
References: <20220608132957.68895-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gcnano-binaries: bump version to
 4.3.7
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
Cc: scooby22@web.de, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Commit title has an issue, you're bumping to 6.4.7

On Wed,  8 Jun 2022 15:29:57 +0200
kory.maincent@bootlin.com wrote:

> -GCNANO_BINARIES_LIBRARIES = \
> -	libgbm_viv libEGL libGAL libgbm libGLESv1_CM \
> -	libGLESv2 libGLSLC libOpenVG libVSC
> -
>  GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
>  
> -GCNANO_BINARIES_PKG_CONFIGS = egl gbm glesv1_cm glesv2 vg
> -
>  define GCNANO_BINARIES_INSTALL
> -	$(foreach lib,$(GCNANO_BINARIES_LIBRARIES), \
> -		$(INSTALL) -D -m 0755 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so \
> -			$(1)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so ; \
> -		cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).so* $(1)/usr/lib
> -	)
> +	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/drivers/ ; \
> +	find . -type f -exec $(INSTALL) -D -m 0755 {} $(1)/usr/lib/{} \; ; \
> +	find . -type l -exec cp -a {} $(1)/usr/lib \; ; \

The ; \ at the end is not needed, it is the last line of the command.

> +	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
> +	ln -s gbm/gbm.h $(1)/usr/include/gbm.h
> +	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
> +	for file in * ; do \
> +		sed -e "s|#PREFIX#|/usr|" $$file > $$file.temp ; \
> +		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
> +		rm $$file.temp ; \

I'd say you can leave the $$file.tmp around in the build directory, it
will not cause any problem.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
