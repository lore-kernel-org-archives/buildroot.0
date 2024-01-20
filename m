Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A67FC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 21:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A55ED40012;
	Sat, 20 Jan 2024 21:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A55ED40012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id adZKjaULUooh; Sat, 20 Jan 2024 21:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D9D94013F;
	Sat, 20 Jan 2024 21:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D9D94013F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A53A91BF20F
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F25B60F35
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F25B60F35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7gwbjTTuybvD for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 21:59:21 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AB0160F31
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 21:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AB0160F31
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BE1A913F861;
 Sat, 20 Jan 2024 22:59:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Jan 2024 22:59:17 +0100
Date: Sat, 20 Jan 2024 22:59:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZaxCNWaYXvkG3Mmv@landeda>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
 <20240117225049.28443-11-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240117225049.28443-11-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705787959;
 bh=WY41VjUsr0SVS6Zg0ch0bABsxaQOxTIMeUpIoPUCxyE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O9vFFvKN63DrHmgNa0XV56tZ9lYzsNuuT+cyQJKBzEO2KTmCkqkYG/hr0wGx6Po79
 9+bO/M/ufbcUcoQS22n5xp9JnVP0Sk960OI78hRAcPt/h4c7JlhlLVOJzlRUP5U6MC
 Ql8h8wgSGlHnunC/uuWOiR0wFGLTs1NoQ7QbsIDc9KHl1Tmp7brdvj/QZz0c5AhuDT
 TPiLl5Si7OFKPiloXEKh9DgCF8GzA9eZZymM2vK4YFhTVtWf0p5/sxoXscxpjhWMAV
 MejzYEHP+6vMa7dhNHfJXOniTaol9mJqA34Whk1Ux2ATkbSUh7f+bFW8UwTc1RVtzX
 DakR504YOQq8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O9vFFvKN
Subject: Re: [Buildroot] [PATCH v3 10/10] package/flutter-gallery: clean up
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

On 2024-01-17 15:50 -0700, Adam Duskett spake thusly:
> Remove and create the kernel_blob.bin file in the flutter_assets directory:
> 
>   When Flutter compiles the source code, it creates the kernel_blob.bin file,
>   a Dart Kernel Bytecode of the application.
> 
>   If kernel_blob.bin exists inside the flutter_assets directory, then the
>   application source code can be extracted with nothing more than apktool.
>   Not only is this a security risk, it's also redundant and a waste of space.
> 
>   Removing the kernel_blob.bin file generated for flutter-gallery saves 86M!
>   Because this package is a reference package, and some applications may check
>   if the kernel_blob.bin file exists, we also touch a blank kernel_blob.bin
>   file.
> 
> Do not use relative symlinks:
>   Users may not install their applications in the
>   /usr/share/flutter/${package_name} directory. Because this is a reference
>   application, using exact symlinks to icudtl.dat and libflutter_engine.so
>   is preferable.

It was not directly obvious to me what this section meant, so I reworded
it, and introduced a bad typo... At least I could only spot one...
Sorry... :-(

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/flutter-gallery/flutter-gallery.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
> index e23dc399da..6b0954cb32 100644
> --- a/package/flutter-gallery/flutter-gallery.mk
> +++ b/package/flutter-gallery/flutter-gallery.mk
> @@ -45,10 +45,12 @@ define FLUTTER_GALLERY_INSTALL_TARGET_CMDS
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
> 2.43.0
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
