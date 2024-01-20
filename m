Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7156BC47DDC
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 21:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06EA241D74;
	Sat, 20 Jan 2024 21:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06EA241D74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tT88Ij-DbgHP; Sat, 20 Jan 2024 21:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 467A541934;
	Sat, 20 Jan 2024 21:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 467A541934
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 290E11BF346
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F19554013F
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F19554013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zVGPTTOyAcTM for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 21:46:41 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD85540012
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 21:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD85540012
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A1EB913F81D;
 Sat, 20 Jan 2024 22:46:36 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Jan 2024 22:46:36 +0100
Date: Sat, 20 Jan 2024 22:46:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <Zaw_PDsLArK-KQj-@landeda>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
 <20240117225049.28443-9-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240117225049.28443-9-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705787198;
 bh=JWxu9nLkuwnqffEOnPFHBmfCnEEJxSyDGr8NICyXZog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aU/rRcfC/vd8q3lqXdwm8NTmB7Ffth1u0i7bKrgCvIENaGJWYPD9MW/yj6tVqIc2z
 hgbvLdTZ1Aq3yfbKdD+pAfDed6ho7wmZMkI/q2b/MVFmvlP8985pXXu2l984Ic2SKW
 plEpRu4ZUbBkwglFy+hKCeuF7xqK5Sos7qRM83k2u9DpeIS/28B7kcIkiBbYbdTvsA
 ibDhFVVF1ZAw9WguB21KZxAHxDAw10+pxbgOJWcVsceR6Uyz9ObGosP2i41AFb4tnZ
 CPM2BaLUPz5JQmxtWKmZdWlrSknznxe6v6nR9Vq3mr17EKCvmupSt3sxK/XhMGCee3
 ar6R/Ui5JhJiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aU/rRcfC
Subject: Re: [Buildroot] [PATCH v3 08/10] package/flutter-gallery: add a
 configure step
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
> To make the next patch easier to understand, add a configure step to the
> flutter-gallery.mk file. The `$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle`
> command is placed in the configure step because it generates several files
> needed for the flutter_gen_snapshot tool to generate the target .so file.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/flutter-gallery/flutter-gallery.mk | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
> index 57a476b1ab..50ddd9ffba 100644
> --- a/package/flutter-gallery/flutter-gallery.mk
> +++ b/package/flutter-gallery/flutter-gallery.mk
> @@ -14,12 +14,17 @@ FLUTTER_GALLERY_DEPENDENCIES = \
>  
>  FLUTTER_GALLERY_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/gallery/$(FLUTTER_ENGINE_RUNTIME_MODE)
>  
> -define FLUTTER_GALLERY_BUILD_CMDS
> +define FLUTTER_GALLERY_CONFIGURE_CMDS
>  	cd $(@D) && \
>  		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
>  		$(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
> -		$(HOST_FLUTTER_SDK_BIN_FLUTTER) packages get && \
> +		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \

As disucssed on IRC< that belonged to a spearate patch, so I split this
patch int two, and applied to master, thanks.

Regards,
Yann E. MORIN.

> -		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle && \
> +		$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle
> +endef
> +
> +define FLUTTER_GALLERY_BUILD_CMDS
> +	cd $(@D) && \
> +		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
>  		$(HOST_FLUTTER_SDK_BIN_DART_BIN) package:gallery/main.dart && \
>  		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
>  			--deterministic \
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
