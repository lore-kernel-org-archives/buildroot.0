Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6C8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E01B440360;
	Sun, 13 Feb 2022 11:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znqoNbU_3Lma; Sun, 13 Feb 2022 11:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 284074033A;
	Sun, 13 Feb 2022 11:21:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 72CCB1BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F8EA401F8
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LNt5uAdxEDNf for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:21:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CF5940181
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:21:22 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id p14so7620524ejf.11
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 03:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4+HyAMGpeUTyCfLt9xxxPCuRwemrZ7485AD1pXFQptY=;
 b=e+PeIUkwaox4klhJMnnVUkcjfIjJ2y/bNXyQSPHpZTGAjd0mO3AJipqSKQ6T0wFjZU
 bR3WR9mZTXpTifJRCf3hV0X27Ft7uG1LByFNm4Zc8g0YFUcXHteLTT45KBTNP/EQODht
 A4f5KmHQjJck9Q/fjaKvy3OSe+ABm1Me8cUheShCZRiSMvOzJ0ZrG9tzSnujrEhkCJi3
 Ft7P95m+QjGs8GaMkPWgAhi//kc9vIStrOJ3xaeFIFejLkATMRAtZhD2fhMYrnn9CWm2
 YVf9Jtt5X7IKHPzoriTLNCtHKD8xMGY0cX8EmifLhm4eWHRs2QttjQ5k6yjRdGECkh/e
 iOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4+HyAMGpeUTyCfLt9xxxPCuRwemrZ7485AD1pXFQptY=;
 b=OdUP2VUSSxDEG4kL6MrDJelzAG3NgPBy+t+8oUABSWzmVrEE27DrZzddjzmn1HhW0h
 LRNqFcmT4+3jGWl4m3ARnngXxyTHJKBwr78Tl7kcK71aMDsnBOuAlKtRiAt4nX7cvK9c
 HNRNYGdjS4T3lEVGNwDgh572vP8vhQVNlyeOy6YNlh7ElRxFcPFd98fTQPuqu7qc4MDy
 PEjx3820rLWCEeF++/3xCpK+DoOy7DbEn0B1f26vb109zHZIw6RMGL6Pml0+vw+kylQJ
 EfUix7aYYIxALh+kRhkty8Al7biQwzrdsHFqMgFGCbbCx04f+93RGklBAdic0X/06t66
 ZyAw==
X-Gm-Message-State: AOAM530Vxqx1FzChybtXMFmJIxIVmjWze4ySNnS+kgDpvAPrhbyykap8
 kJSUdIT4r42aCugT0gIDJ/+nOQ==
X-Google-Smtp-Source: ABdhPJyv+yaqvfGzxpFFiCbeZ3B9PeMcYbwKkO3+wrlT6DDCUmpTOTjyY3mKwBM++UWsNOMlXo7Svw==
X-Received: by 2002:a17:906:4b44:: with SMTP id
 j4mr2480941ejv.223.1644751280450; 
 Sun, 13 Feb 2022 03:21:20 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n25sm8733ejl.82.2022.02.13.03.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 03:21:20 -0800 (PST)
Message-ID: <a24263ab-0a69-f6cd-56aa-ef92696e184a@mind.be>
Date: Sun, 13 Feb 2022 12:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220201173352.160244-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220201173352.160244-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/cryptsetup: bump version to
 2.4.3
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
Cc: Martin Hicks <mort@bork.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/02/2022 18:33, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/cryptsetup/cryptsetup.hash | 2 +-
>   package/cryptsetup/cryptsetup.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
> index b3bb859bdc..dce2686d31 100644
> --- a/package/cryptsetup/cryptsetup.hash
> +++ b/package/cryptsetup/cryptsetup.hash
> @@ -1,4 +1,4 @@
>   # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.4/sha256sums.asc
> -sha256  170cc2326a9daeeeb578579176bd10d4a60ee5c4fc5bc69018ce67dafc540b9c  cryptsetup-2.4.2.tar.xz
> +sha256  fc0df945188172264ec5bf1d0bda08264fadc8a3f856d47eba91f31fe354b507  cryptsetup-2.4.3.tar.xz
>   sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
>   sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 9cfd647ac6..2e06047c56 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   CRYPTSETUP_VERSION_MAJOR = 2.4
> -CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
> +CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
>   CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
>   CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
>   CRYPTSETUP_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
