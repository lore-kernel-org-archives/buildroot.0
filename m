Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5315C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 13:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C82E4182D;
	Sat, 18 Nov 2023 13:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C82E4182D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8bZU9b0hmkPZ; Sat, 18 Nov 2023 13:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EB6A41827;
	Sat, 18 Nov 2023 13:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EB6A41827
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DFF21BF2C2
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 13:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5798760806
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 13:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5798760806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4f1wA5NWCaS for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 13:52:02 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 655A960797
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 13:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 655A960797
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A8D7878034D;
 Sat, 18 Nov 2023 14:51:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 14:51:58 +0100
Date: Sat, 18 Nov 2023 14:51:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231118135158.GR996011@scaer>
References: <20231118015456.2629144-1-adam.duskett@amarulasolutions.com>
 <20231118015456.2629144-7-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231118015456.2629144-7-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700315520;
 bh=IzVKk+Lk9ljmiCDDAVjOYNMehAsR6zK6UZVsCES2ovQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oUcjLrwYRG8xG6teKCquHKskBiEtG3ZiHm9JXGaCLTHKhdtMHK+Z4IMdpRtvj3nF/
 vwOtxIki/QoQ9vuyMDs5ntNmItqPO4C6ipee3DZTAgQZMOIkKYxlFf5CsGOJrP6ICG
 uYKXGYHo7DkuwdEbkVIAhlNM7Y2yGiZi6PCXDR2uzlN1/QoAu+8jutKJpUglbnjG7X
 erJ01dPyQM4S6RrZlykW1XQBebvjOZBTeMhCX3xUpFDZIA0coJzJ45tve4XgzsjuCv
 jj6xvIAzQ8i2Uzqo0kciRt3nATdvXB45Y+HCB6rIaOoE3pmnXiIsJqnw8Dp6RTUdh0
 skEYkiF7ay3IA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oUcjLrwY
Subject: Re: [Buildroot] [PATCH/next 7/7] package/flutter-gallery: clean up
 install_target_cmds
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

Adam, All,

On 2023-11-17 18:54 -0700, Adam Duskett spake thusly:
>   - Don't use relative symlinks.

Why not? We do that a bit all over the place already...

>   - Remove kernel_blob.bin and instead touch a blank one in case an
>     application checks for kernel_blob.bin. This saves 86M of space!

Why is it OK to remove that file? And will there ever be applictions
that will require an actual one rather than our dummy empty file?

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/flutter-gallery/flutter-gallery.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
> index 5299b18134..492b426510 100644
> --- a/package/flutter-gallery/flutter-gallery.mk
> +++ b/package/flutter-gallery/flutter-gallery.mk
> @@ -46,10 +46,12 @@ define FLUTTER_GALLERY_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/libapp.so \
>  		$(FLUTTER_GALLERY_INSTALL_DIR)/lib/libapp.so
>  
> -	ln -sf ../../../$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
> +	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
>  	$(FLUTTER_GALLERY_INSTALL_DIR)/data/
>  
> -	ln -sf ../../../../../lib/libflutter_engine.so $(FLUTTER_GALLERY_INSTALL_DIR)/lib/
> +	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_GALLERY_INSTALL_DIR)/lib/
> +	$(RM) $(FLUTTER_GALLERY_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
> +	touch $(FLUTTER_GALLERY_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.42.0
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
