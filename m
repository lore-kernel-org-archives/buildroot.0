Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31AFC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7137E41739;
	Mon,  7 Mar 2022 21:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2a9kDPWqiYX; Mon,  7 Mar 2022 21:46:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA9B41722;
	Mon,  7 Mar 2022 21:46:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADFB01BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB12560EF3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AuPmyso3wdYK for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:46:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2A8760EE3
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:46:15 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g3so9660167edu.1
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 13:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hmzV4PSdRofdzLZdqQ1TTx+5qykGCvFQSCCprGpVkC4=;
 b=hCbWAPzYvzgU3LyfxeMAn7FSg8tYVfI0OH69QjnJAeJ5GHN2LUUsj/+zbYVIqSSWp7
 jRYcvrW4vj4VzcqOL4AB1IHuDipCVNZCctP2Ip37o80scgQu84cRPdBWF60ADInU5um6
 2MGBMw7lPq05Sm98AotMSphYKzIT21Df4+pqNPoX4fXbZcyzHWet8Kestkn1C3djoJ4Q
 2KF9nkCh4XFzUm9kmfmR9QduRWCAmxZ0GtMZx94+CQOkXVBkRiUQuRO0cDzYb2UWKAQ6
 siX6Y9Ckc9jmg5qLhJCBQ523b8ujKQTwiSFHFWMmDbjQnQBsEBi20hSXlgj2VyHu71b/
 jobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hmzV4PSdRofdzLZdqQ1TTx+5qykGCvFQSCCprGpVkC4=;
 b=XKeU2buvLewBwIOcv4BEThJ9hqR3DLY20grJmX5PzoUT0un+5YzCeEv9ZecP5uvd9i
 mg/744jHoaXSg7yENhTdwiE+ZqpWC4+lO/cm8u9AkMM6IrvvVc9/ffSU6qSW/ZBQeqXi
 gZXbTsb6c9OOwGv09SB9BFdTxgLE6XODOkKTmr6UJo/pLqsCwqZSrdZdhvt4TJUcL8Hx
 qgkD0+TKslI35fRVif+r6S8PsJaxkdJNx6MPuADjZzKgqColCwaQooDIubxHDOGxtAU+
 VdDld4isqriJpC5cAksmF8OIkR8rpseK+XoQfDJPuakcQVYo8MiKU394tKTwykEhoIKh
 4EDg==
X-Gm-Message-State: AOAM5309qsIQFf0wvM0b2yclrIQ3Mwokk5rqmFv8XE4+dODZBykWkKz5
 M9nKAYkD8oDQX9hPIus7XSe5bw==
X-Google-Smtp-Source: ABdhPJzB/LsTM5I7+1zOtfMlnrMHcSottcLkNfZUdEtSn3j/v0cMgASFVrecC4fANaQT0/STrwIuAQ==
X-Received: by 2002:aa7:ca43:0:b0:415:df31:b061 with SMTP id
 j3-20020aa7ca43000000b00415df31b061mr13089365edt.376.1646689573964; 
 Mon, 07 Mar 2022 13:46:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a056402268f00b00416474fbb42sm2180808edd.19.2022.03.07.13.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 13:46:13 -0800 (PST)
Message-ID: <67313303-db84-93cd-d96b-56db0c73976b@mind.be>
Date: Mon, 7 Mar 2022 22:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220218110914.3098061-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220218110914.3098061-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH]
 configs/microchip_sam9x60ek_mmc_dev_defconfig: fix build failure due to
 previous wrong commit
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/02/2022 12:09, Giulio Benetti wrote:
> Commit 616ba9c90b014637dc9925fa442a0af4a11f04b8 extended rootfs size, but
> the option was listed in the wrong place. Options must be set in the order

  Order doesn't matter in kconfig. The problem was the lack of quotes.

  Updated the commit message and applied to master, thanks.

  Regards,
  Arnout

> they are specified by Config.in files. So let's move
> BR2_TARGET_ROOTFS_EXT2_SIZE="120M" right after BR2_TARGET_ROOTFS_EXT2_4=y
> as it should be.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784289
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   configs/microchip_sam9x60ek_mmc_dev_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
> index 00ccd784b5..06e03967c4 100644
> --- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
> +++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
> @@ -7,7 +7,6 @@ BR2_TARGET_GENERIC_HOSTNAME="sam9x60ek"
>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sam9x60ek_mmc/genimage.cfg"
> -BR2_TARGET_ROOTFS_EXT2_SIZE=120M
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
> @@ -67,6 +66,7 @@ BR2_PACKAGE_HTOP=y
>   BR2_PACKAGE_VIM=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>   BR2_TARGET_AT91BOOTSTRAP3=y
>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
>   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap-v4.0.1.tar.gz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
