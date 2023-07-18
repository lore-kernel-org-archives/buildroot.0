Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E328EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5146460D62;
	Tue, 18 Jul 2023 20:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5146460D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BDkNzWRSJmlc; Tue, 18 Jul 2023 20:38:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7833A60BFB;
	Tue, 18 Jul 2023 20:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7833A60BFB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C87A1BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 200884054B
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 200884054B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EXmq5rXnxyVj for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:38:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD20D4032A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD20D4032A
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:38:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5802F240003;
 Tue, 18 Jul 2023 20:37:58 +0000 (UTC)
Date: Tue, 18 Jul 2023 22:37:56 +0200
To: Cherniaev Andrei <dungeonlords789@naver.com>
Message-ID: <20230718223756.7788399d@windsurf>
In-Reply-To: <20230716110038.16200-1-dungeonlords789@naver.com>
References: <20230716110038.16200-1-dungeonlords789@naver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689712678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/3lFSeJb8zaSOAUbtPpmaoL97m0+Q1aLJf7I28NG+Oo=;
 b=EqXyK6y52o5jmYOoOguf0aWDmAgJD41U/ewKMpjqG6glfnQcFM49qf89SvEJUv+3L9JQnP
 6gU4il68mgb/JoyMyz+Yxs2EJOaQ7RUJAfVm123+stuInwLwHwFKLHnOWXp5x0rOH390Yk
 LLBl66s2fhda/hdFKHpp+TNcGORSV538nwp4j1ARMvOMv9PRKMIr9CGjh8u702vP5QtFbB
 KAWXFppsG56e+Xe0WEOf7hCWk0JlxAuNvPRevR317OBa1KJyqL6G3KTbvCz9ImI7vZ/BR1
 G+hYQ5/4dXjB+6I7t/rNo40YixVJ+lXgnCekm7nbXwIvbiOwvhFCf7SJCohlDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EqXyK6y5
Subject: Re: [Buildroot] [PATCH 1/1] arch/Config.in.x86: add MMX instruction
 set capability for Geode CPU
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
Cc: bagasdotme@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andrei,

Thanks for your patch! See some comments below.

On Sun, 16 Jul 2023 20:00:38 +0900
Cherniaev Andrei <dungeonlords789@naver.com> wrote:

> From: AndreiCherniaev <dungeonlords789@naver.com>
> 
> Currently, there is no MMX support for modern GEODE processors in Buildroot.
> Yet, some packages like ffmpeg can leverage it when the package is built.
> 
> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>

Could you please adjust your git configuration so that the From: field
value and the Signed-off-by: field value are matching?

> ---
>  arch/Config.in.x86 | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index c770ae3ffe..595db48d91 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -521,11 +521,10 @@ config BR2_x86_steamroller
>  	select BR2_X86_CPU_HAS_SSE4
>  	select BR2_X86_CPU_HAS_SSE42
>  config BR2_x86_geode
> -	bool "geode"
> -	# Don't include MMX support because there several variant of geode
> -	# processor, some with MMX support, some without.
> -	# See: http://en.wikipedia.org/wiki/Geode_%28processor%29
> -	depends on !BR2_x86_64
> +        bool "geode"
> +        depends on !BR2_x86_64
> +        help
> +          see also BR2_x86_geode_with_MMX

Please don't change the indentation. Also, please keep the comment,
but adapt it to the new reality. The help text that you have added is
not very useful, just don't add a help text in this case.

>  config BR2_x86_c3
>  	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
>  	depends on !BR2_x86_64
> @@ -633,5 +632,16 @@ config BR2_READELF_ARCH_NAME
>  	default "Intel 80386"			if BR2_i386
>  	default "Advanced Micro Devices X86-64" if BR2_x86_64
>  
> +config BR2_x86_geode_with_MMX

This should go inside the choice...endchoice to select the CPU variant,
i.e it should be treated as another CPU variant.

Please name the option BR2_x86_geode_mmx

> +        bool "GEODE with MMX"

	   bool "geode with MMX"

> +        depends on BR2_x86_geode

Drop this, not relevant once it is part of the choice...endchoice of
CPU variants.

> +        default n

Not needed, a boolean is already disabled by default.

> +        select BR2_X86_CPU_HAS_MMX
> +        help
> +          there several variant of geode processor,
> +          some with MMX support, some without.
> +          See: http://en.wikipedia.org/wiki/Geode_%28processor%29
> +          And decide can you use MMX or not

Either convert that into a comment, or if it's a help text, there
should also be a help text for the Geode without MMX option, and it
should probably be something like this:

	  There are several variants of the Geode processors, some
	  supporting MMX instructions, some not. See
	  https://en.wikipedia.org/wiki/Geode_%28processor%29 to
	  determine if your particular Geode processor supports MMX or
	  not.

Could you adjust your patch according to those suggestions and send a
new iteration?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
