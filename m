Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E794CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 950E382F20;
	Sun, 10 Apr 2022 14:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VOUoVmcwbV_p; Sun, 10 Apr 2022 14:51:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F02E83FBA;
	Sun, 10 Apr 2022 14:51:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E534D1BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D06E741554
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LiZtoeo9vqhC for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:51:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FF2841547
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:51:00 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id r13so26101281ejd.5
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 07:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Rolp4fFmONC7mOeJe37lvr3rt4VXDEp/rChPbckorNw=;
 b=APFiO0Q5tinMK057OZwqpnsVmPuPMpf/Nz2SBdKZmj4G5lNtDz3KjjciyUJerLhWi/
 FQQrc/aZMHkLVBBAlMh8SEH98quCajn8gqDez8Hp3EqlPtPJZAQ+tY3F9lvvuincrmbQ
 K0lclff8fJvE63L7SviWOGvQ2Lrw8EacCK6t3RivPsrjtggqoa9ZDdhY3h9byZu1b5lc
 3ySLpDEGHzbtcWg5EW9LT5424cZgkUrA1FNBaFibDqCT5j27DvPXoNnW0dGfPXttQLJh
 xsD3zhG/0TrW0di6YS11WeZACdFTxPU2PxgiPcSDQDFUbBoM9Apm02wEYPwaMpo6rwKJ
 +2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Rolp4fFmONC7mOeJe37lvr3rt4VXDEp/rChPbckorNw=;
 b=XAeM83Jv4RHytR9UbQBpxqk79ExWTY2ZyHY4dkLQAiy/KS6uNbMJ3UXHAqPtpWnb4p
 4afmlTGfjUhnD1+Ny3XIrVVELIf5es5ybZon+K79spiIFa/xK5akSKVwVmIL7OvPgVKu
 MmQpopAm56X802gczDc6roQ3HVNXiKp+H03g/nubuu01TCDiZnAD5v1aEBS8YZTo5zUI
 HBvOX0/vMth4Zhhr0Tzkc/LRtM+uiOodcN9wFTbZ+G2Gwu7s1WdWCVKtb20H9gDBx/h6
 Ywrc9SyKh8Tq5Q2Ct1YQiUuzPlQMnEiTS5D4CSVaNuxgt7UZzegnO2wlAMbyf+Sqf197
 tJPg==
X-Gm-Message-State: AOAM533Bf5HT79utaeoJ1Pe4eq5R4C4DB0DMS8xk8oTuUxQOdS2xw0iH
 R4FdI12pqN+PUw9G/H38xUJ9UVQ9QX4YSQ==
X-Google-Smtp-Source: ABdhPJyFU2A+4niD2VxNmBONsn2Aqqzo2aa6Q0OTZ6wz+bnHHHAOJ3OiO6Hz6fTYLkEuePrS+cFNFQ==
X-Received: by 2002:a17:907:d02:b0:6e0:4f1d:7ab1 with SMTP id
 gn2-20020a1709070d0200b006e04f1d7ab1mr26094926ejc.716.1649602258855; 
 Sun, 10 Apr 2022 07:50:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 jt8-20020a170906ca0800b006df9b29eaf1sm10790873ejb.8.2022.04.10.07.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 07:50:58 -0700 (PDT)
Message-ID: <dad52dec-6bcc-f639-9628-02d4b5004930@mind.be>
Date: Sun, 10 Apr 2022 16:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220405012059.2680327-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405012059.2680327-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] linux/linux.mk: ensure custom kernel
 version is set
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



On 05/04/2022 03:20, James Hilliard wrote:
> Validate that BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE is set when
> required.
> 
> Fixes:
> http://autobuild.buildroot.net/results/117/117c08e414776202446a9fdb96d084aa3c16af48
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   linux/linux.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 102b7a15d4..7ff7b05042 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -566,6 +566,12 @@ endif
>   
>   ifeq ($(BR_BUILDING),y)
>   
> +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
> +ifeq ($(LINUX_VERSION),)
> +$(error No custom kernel version set. Check your BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE setting)
> +endif
> +endif
> +
>   ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
>   # We must use the user-supplied kconfig value, because
>   # LINUX_KCONFIG_DEFCONFIG will at least contain the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
