Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E87BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBA8F4036A;
	Wed, 27 Apr 2022 19:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p1RXBZF-vEHn; Wed, 27 Apr 2022 19:40:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4FFE4010D;
	Wed, 27 Apr 2022 19:40:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 654D21BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 540C380C7B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JepnimvhNZ18 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:40:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F92380C58
 for <buildroot@busybox.net>; Wed, 27 Apr 2022 19:40:52 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id d6so3125109ede.8
 for <buildroot@busybox.net>; Wed, 27 Apr 2022 12:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2TP+F7I/nStbhGno5FaK6ZF91Zaq4v9ziAQ7epakQ4w=;
 b=WyRjbu2XlFBjwmj5OQibu3frsd+eLuY0lyk/dH4BuD8MZjDpD3C+7lRTgbgCQ5vCyF
 iESuEsFpis9mr1ydNSCUjJ/JGCht7vp9CNRUN13/bS05/96LlvXh/F04UTDSSjsmVQ2B
 qkmT95lugFToeTTDuIj7BGPYIcwismrImE8MnueCNG711TGd9tT+hl+Od1gZfYJbqIGo
 NEsie6SjnL4tAnsD2AKtzcoUUwk5252Vn3XozR7yAStTFu0gOnV7I8hvup81tnBko0i0
 Gdwv0kSJUMLd+RRjXqMArqYBncfSzoW0olDeFb0Qj55iBUOkHGcWj1lcPxoaW4p5O3ZL
 tVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2TP+F7I/nStbhGno5FaK6ZF91Zaq4v9ziAQ7epakQ4w=;
 b=Ur0MYXwvRz1nXAI5HnDWkfPrsEvgAmf9oAT8eYaaeaYI8+G4E/30itLj2rWBk8o1Z9
 wKfb/5kWZaaODsDjGztn2mOkYdkISWhJPNEs+1rmCDb+3nhwSA7oOHo7N9pzRwtR8Kgy
 RKht6ESU2+p/77VvI30glGCpsnvQfj/XSPHRqjTGpp+SHcyL9qf+EjUoR2Xvuye2x4ud
 rjIZBoxnRbk7pvN//4nSMDX1jV7pvud7UvJ4AduSLQ+oeVtN+yVKLPNX0SeQDm0gIaVU
 eVXjd++GtjhcX0567ij9Pquiebk7Ku63as++n7Jn9Ec9q3VD3W8DeCmmDmwhcj8qmPnN
 DG5Q==
X-Gm-Message-State: AOAM533FsF0lNyCPQbXk6KF+dnMz41qM0B5hze3HlinEk7QsbGltedcH
 TxVy7NuSKjO0H5IWz5bdiDwIjg==
X-Google-Smtp-Source: ABdhPJyzSoyWwBUR6veYnjWQuOgjC4ZZ+4qYvnWzKL1qNd1tCU7UtGHrnCL3WxUlM4Pp3bVJbSPFww==
X-Received: by 2002:a05:6402:2741:b0:41f:69dc:9bcd with SMTP id
 z1-20020a056402274100b0041f69dc9bcdmr32321870edd.239.1651088450425; 
 Wed, 27 Apr 2022 12:40:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a50fd8f000000b0042617ba63b0sm85192edt.58.2022.04.27.12.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:40:50 -0700 (PDT)
Message-ID: <1fa2031a-41cd-4b08-35c2-db55b1e4ab2c@mind.be>
Date: Wed, 27 Apr 2022 21:40:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220427143712.55713-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427143712.55713-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] configs/olimex_stmp157: bump Linux and
 U-Boot
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



On 27/04/2022 16:37, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/olimex_stmp157_olinuxino_lime_defconfig | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
> index f9b31bbdc..a63394fa0 100644
> --- a/configs/olimex_stmp157_olinuxino_lime_defconfig
> +++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
> @@ -16,8 +16,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_GIT=y
>   BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/OLIMEX/linux-olimex.git"
> -# branch release-20220321-v5.10.105
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="82a1d20f488b895ffe817c5692a631237e257b7d"
> +# branch release-20220413-v5.10.105
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d417808c240d55576ee76e5cbb40413ad444ecfd"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -34,8 +34,8 @@ BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_GIT=y
>   BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/OLIMEX/u-boot-olinuxino.git"
> -# release-20211130, based on 2021.04
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1c29714bc643c299e2ed4ba870be8d4538124144"
> +# release-20220413, based on 2021.04
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="b39c5a7c93a2d8efaecc9cad4284378af857c3f7"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
>   # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>   BR2_TARGET_UBOOT_FORMAT_IMG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
