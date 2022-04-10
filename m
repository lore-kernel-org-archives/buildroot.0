Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753FAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34B7184036;
	Sun, 10 Apr 2022 14:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vkATqYxHCXCd; Sun, 10 Apr 2022 14:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5405D8331B;
	Sun, 10 Apr 2022 14:52:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DBB11BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A7A7817D3
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZnsvyCNo1vum for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:52:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5700F8402C
 for <buildroot@busybox.net>; Sun, 10 Apr 2022 14:52:43 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id r13so26105904ejd.5
 for <buildroot@busybox.net>; Sun, 10 Apr 2022 07:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=i4cUVpEsnwAgbHBAvVOycB18okdA1YetQvJM08m4jEg=;
 b=PlMM4NbQLZfyvUKk9TfuKH+FAAjFiGAQ8k0c4PoWY3XN2PvV3h2D7S8M5bu9tKbh/h
 toM0t8QtdL4h4jutxSg7oe3/04sOmdr+qtfA8aabG59wkXmiCdl7c2avoB8BCu62DViI
 1s+ioyVXbTQxiwSR3SbfG4NHrNYh2LJpqLZGDG33By+V966xZlHKvdP94guPN1R5v/Oa
 1+fsfo5T0PtreWymfmz/IDd5IXlxY/7nvVXtstbnT/n7PwCqrUqBmXMRJQDZqT/lOSdp
 kSOV5ed3p3dYtq5AHz4hrRVlvXMnTa4u8l3QfyqBsbXkQ/bA0HhM1QtDw5roh8ObcudE
 zWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=i4cUVpEsnwAgbHBAvVOycB18okdA1YetQvJM08m4jEg=;
 b=EleJwWUVOqEYHFfPYn2CcB0ZUHi5LuuJUYjsWDs/HJ5P+aRaDoXpeRk84cXWWZBKsv
 HHuDHKym29TAVFHuCGi6rc96tBdVJfMX4edgN+2AD14KeBzBGdjgCNEY6vJGsCDvwyyy
 uJjWiel3pw3LtKs+4MY7iJzen3fmsAU3IsqRRbQ2pFnire6wCzPZz8pwpBnlhwJp5/hm
 npgzD+NKnGjolPL4gqTGQZ63rEDWqw7+B4TQkZTD95zLhgVit29GlZ4paOU1YB0jJM+s
 eYjkbYaCtGDdIjfoy8XVxGeAFjtGiIL6fT+rrJfqWm1wtURukKWESLXhJHZCcmToZiNq
 aT1g==
X-Gm-Message-State: AOAM533QS/OPKwBv99qunIPcCIvQsJVYJiVdLVxebBbAQiL34zt82icz
 MRWb7tiUeuTtBKdCAfqsG74Xqg==
X-Google-Smtp-Source: ABdhPJx1GZFrvWMq495tsBJDHljJSK8zK5yxN5j1cC1gZ3CIffc0z65EDiGk8ApF20p8ACLwY9rqfg==
X-Received: by 2002:a17:907:969e:b0:6e8:12a1:b5ae with SMTP id
 hd30-20020a170907969e00b006e812a1b5aemr24742103ejc.127.1649602361618; 
 Sun, 10 Apr 2022 07:52:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 do8-20020a170906c10800b006dfe2af50d8sm10830807ejc.121.2022.04.10.07.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 07:52:41 -0700 (PDT)
Message-ID: <072f11d2-9996-086c-276e-c3e5629c2c3b@mind.be>
Date: Sun, 10 Apr 2022 16:52:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220404183535.2392985-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404183535.2392985-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] configs/mx6cubox: bump Linux and U-Boot
 versions
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



On 04/04/2022 20:35, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/mx6cubox_defconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
> index 6ea4f6e41..a9cea73fb 100644
> --- a/configs/mx6cubox_defconfig
> +++ b/configs/mx6cubox_defconfig
> @@ -17,7 +17,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.13"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.32"
>   BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-cubox-i imx6dl-cubox-i-emmc-som-v15 imx6dl-cubox-i-som-v15 imx6dl-hummingboard imx6dl-hummingboard-emmc-som-v15 imx6dl-hummingboard-som-v15 imx6q-cubox-i imx6q-cubox-i-emmc-som-v15 imx6q-cubox-i-som-v15 imx6q-hummingboard imx6q-hummingboard-emmc-som-v15 imx6q-hummingboard-som-v15"
> @@ -32,7 +32,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6cuboxi"
>   BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
