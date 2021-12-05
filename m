Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CE1C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 15:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CB88605BC;
	Sun,  5 Dec 2021 15:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJcqcCK0VfsJ; Sun,  5 Dec 2021 15:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6057E60612;
	Sun,  5 Dec 2021 15:53:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EC3B1BF57C
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D0E960612
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eawqHXR7H-Zm for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 15:53:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E176605BC
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 15:53:38 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y12so32573947eda.12
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 07:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=9En4PM1zdz3po2Cdb8aH4E56/d/8IEzn/tuKwEGy074=;
 b=g2vR6OEqbGo1sYWkDL17mTzXIBnaypdkbEjT3p7Feu1sygz4cq9RTY0qkzqDDrGrlc
 alOds9b/VPnsRtqEUAyUS8rhQllWvlBFO15mw0h7KohN4e7cb7IWGQtMd+JTMA1upQcf
 kFQTVEJo+AX3XrddwcEjGm42M0nWRYPDa1CgbCmKTp6M6im6H4tqn3v1SOgXvyDZlQVj
 fA8ckfEa/VTMM+q/Llnyc5eVI8YO+Piqtyz5ltFmxxYMm38cBAKxlQXqucEdwxDBBK3o
 mIfIs3rAkdlwjORl5t3z/7I4cuMlVsSiPt5wtH9NjcaZfGRWf4ZgSfWrJesNklxpqbmp
 sSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9En4PM1zdz3po2Cdb8aH4E56/d/8IEzn/tuKwEGy074=;
 b=H8Vnx1G8HuwVZ0e03MRueDPnRUDzp4MY6biw2gMyFXHSZyCNnvTVSi1fyvWhk49qqR
 rjAAQKxCYCv1Z+L2Vip0e3ddlmY6PpDGTa2z84yynatWIWVk/iBAxMqJa83RwHZAEJQd
 6Ni0B0BBwIxoQ1Fg1J8+dmDdEWG0pioNVD5wqySg/WvtgWHfDRUWRBTMVRVsX7GVS/6i
 JyodHyYkZ9+9MDsTjzG9UoJjcidI1/JAX/LDvQfATYeM7UrcAcWF/LbBPTaoQpYkEOgF
 sQN9OwHEp4jODzYO2WtSpGeOie0kMyhxXzdC6+n3gdxjYdRKJ3nWqpX6dlkGryhr3Ikx
 3Gng==
X-Gm-Message-State: AOAM532whM4OfwgX50NX2ksJteXJH6oAO//nZCreHni4zRGecvzv3cSw
 nOOyJFjM/sWbmAoizZLi+g8orw==
X-Google-Smtp-Source: ABdhPJythiA0TGIT8S3TseuGHNwhQ7eIi37ikOouLP3/J5aL5VHwC3nkwsgRVcIZtb05t7a1TbAPUg==
X-Received: by 2002:a17:906:489b:: with SMTP id
 v27mr38164827ejq.567.1638719617149; 
 Sun, 05 Dec 2021 07:53:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e1sm6022509edc.27.2021.12.05.07.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Dec 2021 07:53:36 -0800 (PST)
Message-ID: <51b66ae2-74b4-264b-e996-d205996db773@mind.be>
Date: Sun, 5 Dec 2021 16:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
References: <20211123131039.20499-1-b.bilas@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211123131039.20499-1-b.bilas@grinn-global.com>
Subject: Re: [Buildroot] [PATCH] configs/liteboard: uboot needs openssl
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



On 23/11/2021 14:10, Bartosz Bilas wrote:
> Fixes:
>   include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
>   1178 | #  include <openssl/evp.h>
>        |            ^~~~~~~~~~~~~~~
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

  Applied to master, thanks.

  In the future, please use the full defconfig name in the summary:

configs/grinn_liteboard_defconfig: uboot needs openssl

  Regards,
  Arnout

> ---
>   configs/grinn_liteboard_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/grinn_liteboard_defconfig b/configs/grinn_liteboard_defconfig
> index f3173f2e40..9cad66e15a 100644
> --- a/configs/grinn_liteboard_defconfig
> +++ b/configs/grinn_liteboard_defconfig
> @@ -18,6 +18,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="liteboard"
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_FORMAT_IMG=y
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="SPL"
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
