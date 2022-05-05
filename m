Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D87C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 12:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B7EE419BD;
	Thu,  5 May 2022 12:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSnbJcOH2y09; Thu,  5 May 2022 12:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D321419BC;
	Thu,  5 May 2022 12:35:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED8551BF318
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 12:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA4FE419B7
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 12:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1nMHveP7oD9 for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 12:35:43 +0000 (UTC)
X-Greylist: delayed 00:08:03 by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A69D2419B6
 for <buildroot@buildroot.org>; Thu,  5 May 2022 12:35:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D196492;
 Thu,  5 May 2022 14:27:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1651753655;
 bh=xu376rAd5I4CixAM5T5bAtoq30q5I/PRW9uDuSZb94w=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Q9xcyKVSjhsLvVhMVkS4CnsDNRDVaTGu02wJD7k+ffbDebnRaem/sJHu/lLN1U5Bi
 dCGG9/DHHmuD+1q5SOqgc6qQfJ59FQRT8IyHhEcDri2Nor+eJt8bqu693o9DCmrIFQ
 JHVFg7wyftQq1ZGZ7dyiL8aCSpLGNGLhT4fDize8=
MIME-Version: 1.0
In-Reply-To: <20220505120233.494216-1-foss+buildroot@0leil.net>
References: <20220505120233.494216-1-foss+buildroot@0leil.net>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Date: Thu, 05 May 2022 13:27:32 +0100
Message-ID: <165175365275.1217485.5481935830109566528@Monstersaurus>
User-Agent: alot/0.10
Subject: Re: [Buildroot] [PATCH] package/libcamera: bump to latest master
 commit 8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Quentin Schulz (2022-05-05 13:02:33)
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> This brings in numerous improvements in ipu3 and rpi IPAs as well as
> adding support for Black Level Correction, auto gain and auto white
> balance algorithms to rkisp IPA. A handful of new camera sensors are
> also supported.

You've got three patches that got merged to master yesterday too
(presumably after you created this patch) ... but they are only
documentation patches so I don't think it's anything to warrant
refreshing this patch, unless you wish to.

Acked-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  package/libcamera/libcamera.hash | 2 +-
>  package/libcamera/libcamera.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
> index 8d5abf0e62..181bb1349a 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,4 +1,4 @@
> -sha256  3624c71ba492c602c5335aab3dc87798193f7596c6cc75f7cfb847165f180930  libcamera-1966b9a58436fab51f8270aad6a228b935e4fac4-br1.tar.gz
> +sha256  9aa62d41470238ac8c3bb847601d1a803ac7a270d3b5e87f722e9c93c867d18d  libcamera-8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98-br1.tar.gz
>  
>  # license files
>  sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 9cbb1910dc..77381ab3ca 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
> -LIBCAMERA_VERSION = 1966b9a58436fab51f8270aad6a228b935e4fac4
> +LIBCAMERA_VERSION = 8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98
>  LIBCAMERA_SITE_METHOD = git
>  LIBCAMERA_DEPENDENCIES = \
>         host-openssl \
> -- 
> 2.35.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
