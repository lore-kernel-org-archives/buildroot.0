Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB25C46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 22:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56F3B41BEB;
	Wed, 27 Dec 2023 22:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56F3B41BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mx0zEr3MSQm; Wed, 27 Dec 2023 22:15:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B26E941BAA;
	Wed, 27 Dec 2023 22:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B26E941BAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4B3A1BF2E4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C90C610F9
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 22:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C90C610F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9BR4Q-BpLd2 for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 22:15:43 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8479D610B8
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 22:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8479D610B8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1CBCEB00539;
 Wed, 27 Dec 2023 23:15:36 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Dec 2023 23:15:35 +0100
Date: Wed, 27 Dec 2023 23:15:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sebastian Bauer <mail@sebastianbauer.info>
Message-ID: <ZYyiB4POkcCnTbd6@landeda>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
 <20231227182429.1215185-2-mail@sebastianbauer.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231227182429.1215185-2-mail@sebastianbauer.info>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703715341;
 bh=mZBymF1FELgxBd6pvZvtqiKZYt/eQMe7lOoceIVVD/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jMTaM8+fgcn59FJsbQ32l8zTfOd3kgSYVzIaVz63yEgaH75ndqFmsEHZNErWc0T1T
 Q6QkQ9UhEJMnBu0BNAl1MH14IvQObAXdZbMvC6NORpa2XaLvRANcXUg97066mbLXzy
 QTlp7Zh64q5OiI/QuP0WCvtf9kNow4j97xptYnVjOYNv2kUePtA/AXoVfxy0ZWYONJ
 XJ8qAGbYccnx8VxP2KveNl9EXXumzbeN5H2vFLbKo4udIREsYdivDPRFrQ+fqMe5/l
 J8nI9GD9CON0bZY+juMn+7ORTH6FlXlyEh3czAMQeuJvoVY0o+DLAFcoVK9dlovK2f
 ZCeZzoNC8svcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jMTaM8+f
Subject: Re: [Buildroot] [PATCH 2/3] packages/libcamera: Fix libcamera build
 with rpi pipeline
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
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sebastien, All,

Thanks for this patch!

On 2023-12-27 19:24 +0100, Sebastian Bauer spake thusly:
> The name of the pipeline was renamed from raspberrypi to rpi/vc4 in
> version 0.1.0 of libcamera, which is why, without this fix, the build is
> broken.

As Peter pointed out, his patch is a bit more complete, so I ended up
applying his patch.

Regards,
Yann E. MORIN.

> Signed-off-by: Sebastian Bauer <mail@sebastianbauer.info>
> ---
>  package/libcamera/libcamera.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 8dce67f60f..c0c5a02368 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -52,7 +52,7 @@ endif
>  
>  LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
>  ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI),y)
> -LIBCAMERA_PIPELINES-y += raspberrypi
> +LIBCAMERA_PIPELINES-y += rpi/vc4
>  LIBCAMERA_DEPENDENCIES += boost
>  endif
>  LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
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
