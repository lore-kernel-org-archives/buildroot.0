Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDE3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25A4D83E8B;
	Thu, 16 Dec 2021 20:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cNV6IRFsWsg5; Thu, 16 Dec 2021 20:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D5ED83F1A;
	Thu, 16 Dec 2021 20:14:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7281BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AEA583F1A
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JTb_8lryGFuk for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:14:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55C4B83E94
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:14:09 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y12so90224620eda.12
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=oE2NxSAPRIQhNv0++opYL8t/GiXCH60EKEkUTvbpTQE=;
 b=NWNWQ9nZvqRq1oiN/t1Uos3bPXsf8TcO19wr1CPWctc9k1nxXIsVImZB8+Cb5Q09k3
 zB/m0S3k/zKywTsfsbAecYfWFkYoadE2vvZA+OYOJHpTFUPqzgP2Fq2UwbJ5o3NiK7Pr
 yYaX7cXFc2D7L89d1mbwdAO0bHMU9B0ksw+gbIkL4zJo7IvHfzIOaAj3eiYoWPWiUByi
 wQlMjqKOqX0St2RkwRNNFBcgZQStMjs4EFH+c2IBVl62KkbEiu7s0HpgOK7iTFHE10L0
 Ak/r8cHRmaV5zMua6k7Q+uyrectKUr/LbdAMUz0Qb7N+yZTr5UU6hw2bR6oi4bJs4jsl
 OWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oE2NxSAPRIQhNv0++opYL8t/GiXCH60EKEkUTvbpTQE=;
 b=MDMFR4rzXvhuVALCWX5pZVvG2LGPtGRT8HUgm2javbeKRBC6PadaMCFFy+BIDMf5Qd
 aGbpphJv6WHEzzwo51StN40H3zfPruraIcAKfaPk3C7vR9yc+YhTiC8TEq2V7+L3Drap
 4pGBT1R5cyPfJOqUCD6/X3COCTtsKEqnuSjUmSPaEnneo1WsnGNg6Aw2/wYbfq2IHIuv
 MXign6QWHME4RrZ1inTkAGbFtGiUsg+ueMpNqZQfL6mG1g3Fttsn/+JdHieZuPqZY0Tf
 7qlV0SLomKgd2TmBzNfNoyASsRKu4taIcelyD2TUI9nv7yXU8yGG2P7ZDxf2xtGLPfn7
 B8Og==
X-Gm-Message-State: AOAM531OpVCTw6+fMRy1n7w9PyODnVnNmd82KbDRe+kuD9ovrif0jUSD
 tvcNLWQa/4CPMLhxAUcw+EEGBEj9oRS5LA==
X-Google-Smtp-Source: ABdhPJwdWDyYf1g6+IE78BBzULWWavsja/u8r0aW7YZC9ZZUBPInX3oJBwZx+u5iQ4fqntpg5vJ2/Q==
X-Received: by 2002:a17:906:974c:: with SMTP id
 o12mr16447224ejy.229.1639685647564; 
 Thu, 16 Dec 2021 12:14:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id sa3sm2120540ejc.113.2021.12.16.12.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:14:07 -0800 (PST)
Message-ID: <b6071a81-6f4c-0c9c-4c17-3145f2fd2840@mind.be>
Date: Thu, 16 Dec 2021 21:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
References: <20211215222507.762310-1-lothar.felten@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215222507.762310-1-lothar.felten@gmail.com>
Subject: Re: [Buildroot] [PATCH] configs/beaglebone_qt5_defconfig: bump to
 u-boot 2021.04
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



On 15/12/2021 23:25, Lothar Felten wrote:
> Fixes:
>    /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition...
>    scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
> 
>      Tested on beaglebone black and beaglebone white (A6)
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/beaglebone_qt5_defconfig | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
> index 5f084b77df..03b46e91a7 100644
> --- a/configs/beaglebone_qt5_defconfig
> +++ b/configs/beaglebone_qt5_defconfig
> @@ -32,13 +32,11 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>   BR2_TARGET_UBOOT_FORMAT_IMG=y
> -BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> -BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="MLO"
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
