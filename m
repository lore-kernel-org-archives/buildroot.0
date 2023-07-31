Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B6BC04FDF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 14:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A32560AC6;
	Mon, 31 Jul 2023 14:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A32560AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWqdoqnT_FPa; Mon, 31 Jul 2023 14:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A3060AB7;
	Mon, 31 Jul 2023 14:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A3060AB7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 516BB1BF31B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AF3260AB7
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AF3260AB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7yiLFqmUZNE for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 14:22:44 +0000 (UTC)
X-Greylist: delayed 424 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 31 Jul 2023 14:22:43 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEC0B60A92
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEC0B60A92
 for <buildroot@busybox.net>; Mon, 31 Jul 2023 14:22:43 +0000 (UTC)
Received: from [172.25.4.220] ([212.103.203.10])
 by Aruba Outgoing Smtp  with ESMTPSA
 id QTgOqc7gTOldaQTgOqtonx; Mon, 31 Jul 2023 16:15:37 +0200
Message-ID: <b03b805c-0214-a118-dc2f-4643b43b96bc@benettiengineering.com>
Date: Mon, 31 Jul 2023 16:15:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US, it
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20230731140231.73516-1-francois.perrad@gadz.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230731140231.73516-1-francois.perrad@gadz.org>
X-CMAE-Envelope: MS4xfPNYiZ6v2xSYolkkJUnUSskrWT3K17aEgJOCwvp7mH/m3nj7uJ0Gymj+RCfLlODcv7hk7RTEstUg8BrzZ9YjAF1qysbEnbdpE2qDMaMnLuGKfGnq8Y9d
 aXMPhcMn8edyYzUOFAbLL6hWj1YxM3oLr6PM/KHY092a6t0tsycywFm7GkiUoznA4nACHzFl8IisD0KmyY7P1k1WI0QsMlpuAMqx1DBvWJmR9vB6ZQD9wYnL
 v1l8QxF/TsrXYc1Y4mE1QA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1690812937; bh=AfZ9PVkunzk2MQV9ty2dKPPUQXkyMrEXEFy8TFVIq6o=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Jo5iWVZwJx5ztv1BVLPGV3yNo7BG30bUV7HzikOaBLyObYb43rR6i/+GC25cKQmu/
 DJp7BApazupuOGkwZJmFFQW9a9ACLjc5qe3flnTb+0aaWOwdvRLx+/09qn2BRrIpW8
 i5y7Ewqmi5miMMixkSvPREknvDd6UDvQCsBZFmY1Jslb32gEEIdKlzFmSY+DwqnI68
 pulqg681jVcw2982oj/5uuFqlD2EUUSHzac/C9K7kF9CRxs79EHNwqL/MkczDw7iO0
 z380aL+OtKcrangXSGFT2LRdazNGut90LSBARhbFVZOxh5SilNaklPyiFQWup+Q6Vg
 u9/FxzGW51Qtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Jo5iWVZw
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.15.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

thank you,

On 31/07/23 16:02, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

-- 
CEO/CTO@Benetti Engineering sas

> ---
>   package/libfuse3/libfuse3.hash | 2 +-
>   package/libfuse3/libfuse3.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
> index 155c29ecd..0397efc54 100644
> --- a/package/libfuse3/libfuse3.hash
> +++ b/package/libfuse3/libfuse3.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated sha256 checksums
> -sha256  1e79f1dd60eaf79645c21411c4a7028c97b5e745ea677ac5bda747c90497a785  libfuse3-3.15.0.tar.gz
> +sha256  cb93e170288804d2e83da9b69925d968655ed75883476773ba5268d08bb1d335  libfuse3-3.15.1.tar.gz
>   sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
> diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
> index f1b294f74..32e35ff32 100644
> --- a/package/libfuse3/libfuse3.mk
> +++ b/package/libfuse3/libfuse3.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBFUSE3_VERSION = 3.15.0
> +LIBFUSE3_VERSION = 3.15.1
>   LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
>   LIBFUSE3_LICENSE = LGPL-2.1
>   LIBFUSE3_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
