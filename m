Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D89C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9389481427;
	Mon,  4 Apr 2022 18:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BvMM-yOV-Il7; Mon,  4 Apr 2022 18:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8C8281419;
	Mon,  4 Apr 2022 18:13:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 174DF1BF294
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0748081419
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K1WZWqB01y5B for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:13:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3964681418
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:13:48 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id n6so7653204ejc.13
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 11:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7rjE+kY3uvmq/y6WYpy4XQJMDJC3V1/hcFb6NzoDLxM=;
 b=H9cFUHt+PJMDG5aCQjuFGLgII2Z6RqDGWxAJr5HGp5AQ7IZ0EhJSjnIOqqn+0Roxm2
 nvo1T3E593Q43h6UkOIim4AcWaXQv/VoRGBtKE2lyYzUHJdVwwDMHxsEUZRfLD/2AOC+
 sbC5AI74NEuFj5dlleH/A6NV9nZ47XxfK3KAUI8U9umrgYB1FtGgYmh8YQQAEQHuz1ue
 y4u9bRiGqAqvZMiskTwxBlL0aLYP5YocV75FeNd9IqMeIXSKcmnjEm0GGFkl2vmW5mO4
 84d+RMt/oi3qyjHL5TpvdsTKeXKgIBrDVvGJ9L7UBP+QFc3HTJ+Jcevfv33zfVEGt+Sn
 GWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7rjE+kY3uvmq/y6WYpy4XQJMDJC3V1/hcFb6NzoDLxM=;
 b=beZhaq74wzMddE+YDKxYVouQg34WAwub0rtqJmQdh03o2824t3zQ7eAm/J0n5RP595
 Q3j1QjKyTS189qk5kq1jw1DZY6vkCnQcF6mIyoeNNOERRvVima0e496mUGZrgKbZbdwU
 +6NMu7P036cN2cGa15BadeYGAqtURLzvNg5/wZQlTGiPJHQitjLOE/CcVk3unpa0Hdw7
 bXYBi5P8sF9xj15smylmZFLLNZjIRUlQtWCim0creXD0p6lhtU8f2KTrB6GXdGYfTHgV
 wnGJNhBFZES3vsv5G7q/tUuQdBgdqxYdXcS+LHUBrVahUijJRrk0u5zaTekZhayDdFyY
 fAyg==
X-Gm-Message-State: AOAM531AkXkalswRNTUu+dVQEdQDGn8nECc1o/+wYfZq7POZbj0z99cv
 v3J5RpY8CE9Bw+dp9y+R8mOioqJgh6Vyiw==
X-Google-Smtp-Source: ABdhPJx3AzZzvc3PQmkbrfR+LeWkzLtTTm9Sj9unUJBWARMq08JnH1r/1z7hjXBbr6xyKh88ud1fnw==
X-Received: by 2002:a17:907:6d23:b0:6d9:ac9d:222 with SMTP id
 sa35-20020a1709076d2300b006d9ac9d0222mr1331867ejc.595.1649096026364; 
 Mon, 04 Apr 2022 11:13:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 lb4-20020a170907784400b006e0d13f65e5sm4630691ejc.167.2022.04.04.11.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 11:13:45 -0700 (PDT)
Message-ID: <dd8db7be-f000-da4f-f231-dd872ee55f44@mind.be>
Date: Mon, 4 Apr 2022 20:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220401212606.1059177-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220401212606.1059177-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libnids: drop
 $(LIBNIDS_VERSION).tar.gz
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/04/2022 23:26, Fabrice Fontaine wrote:
> Drop unneeded $(LIBNIDS_VERSION).tar.gz added by commit
> f8aefa8807ecaf219b0dc7988e6bd14c70c9c761
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libnids/libnids.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
> index 57e68654dc..40620eca57 100644
> --- a/package/libnids/libnids.mk
> +++ b/package/libnids/libnids.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBNIDS_VERSION = 1.26
> -LIBNIDS_SITE = $(call github,MITRECND,libnids,$(LIBNIDS_VERSION),$(LIBNIDS_VERSION).tar.gz)
> +LIBNIDS_SITE = $(call github,MITRECND,libnids,$(LIBNIDS_VERSION))
>   LIBNIDS_LICENSE = GPL-2.0
>   LIBNIDS_LICENSE_FILES = COPYING
>   LIBNIDS_CPE_ID_VENDOR = libnids_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
