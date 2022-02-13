Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370EFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E04E160B5D;
	Sun, 13 Feb 2022 11:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uK8fhzopL9d0; Sun, 13 Feb 2022 11:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 190FC60A9C;
	Sun, 13 Feb 2022 11:35:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B5131BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 821E681970
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VVoZ1I8f3Rcg for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:35:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A10DA81948
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:35:36 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id h8so5377101ejy.4
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 03:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=B1asz1bX/zDBvN1MHeTSI+12qMXTLUcDxapZ4B+HoqQ=;
 b=MnMVk8V+dlHQoOzqeo2PW56HkXb6KuY7nPKW+CbMoo3J9cmWJyNdm8HsEKYgS1q7kD
 OdHs1dhAiCgnuP3EJL6/1psVVPee09fR0MvIjklSj8scthAbuzqhnIWbAvmyGujYDk1S
 mfGEr/jKL0OMP6KCFu9cFZX8CE1cOFfbO8f4PuTOXOz+OfwaWEHo5Y3eL9hMiyZrYfMS
 Vxm29y5dyAhNda1fmn3ck77HIFSZmXpfXVEq2e2c7/pQ0kwp9mVDh077VGziFiOlIDOA
 bSMear2oms9E2EmYKnEZ27WYDUE5ye1Ag6eKg/iis/wL9HWwhD+yT4VboLiAZ4P5PNiL
 iLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=B1asz1bX/zDBvN1MHeTSI+12qMXTLUcDxapZ4B+HoqQ=;
 b=nxGHSY+eBcKKYq15xSu562WThCrv8sy6Bgbtf5f9Zos8RRrBCjJ4A1RJoUpXdWLjjy
 QQLsz8H+PlkYO+SV0/ObU7ChSwTvidDde47JB2QsAzeuytokjLE8lITD4EpXZIJUM5YS
 VbfLYU7DANaFrWrLtC+CPp97N+CimvBy4MOl/NqqNw1nOmPhkX1x+4RHIwAyjMdmowc9
 sIo3Qk/hqEkax7Zpmh40pe49u+60kaSyRHCLNJp8bbaYkRdVNK+bVGnuMvMvBebd0em1
 scATsQjcqWOwp+glm3d/Axo2Fy5C68VMzII7JmI8mCvQKSskDIRFkJ3lDxsb0DYttnCT
 gNJA==
X-Gm-Message-State: AOAM530ClfOGqzufFIDCZzwvT5Ef5Ry4fayU2A4Bjmwl9VXdC0dQFFoI
 m5BWUAfgI6Px6asp2y2XjfhIxA==
X-Google-Smtp-Source: ABdhPJzec+kb8afZpIIpAWHb/g0PdodK/Q/M2h7SApSBevr2BtLAwrHNez8RbCpmT+ksyj/YPXyfcQ==
X-Received: by 2002:a17:906:5344:: with SMTP id
 j4mr7419874ejo.253.1644752134907; 
 Sun, 13 Feb 2022 03:35:34 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b15sm1811121edd.60.2022.02.13.03.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 03:35:34 -0800 (PST)
Message-ID: <c3a9cf08-fb79-580d-f1e6-79ef28b46263@mind.be>
Date: Sun, 13 Feb 2022 12:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220202171035.1740791-1-giulio.benetti@benettiengineering.com>
 <20220202171035.1740791-2-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220202171035.1740791-2-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] configs/roc_pc_rk3399_defconfig: expand
 rootfs size to 120M
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
Cc: Danilo Bargen <mail@dbrgn.ch>, Suniel Mahesh <sunil@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/02/2022 18:10, Giulio Benetti wrote:
> Default 60M for rootfs are not enough and generate a build failure, so
> let's expand rootfs size to 120M.

  Did you find out _why_ 64M wasn't enough for just the kernel and busybox? Is 
it because of all the stupid modules in the default arm64 defconfig? But most 
other arm64 defconfigs don't seem to need this...

> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   configs/roc_pc_rk3399_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
> index dfbc5e4f47..ae7cf19a80 100644
> --- a/configs/roc_pc_rk3399_defconfig
> +++ b/configs/roc_pc_rk3399_defconfig
> @@ -45,7 +45,7 @@ BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
>   BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
> -BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
>   BR2_PACKAGE_HOST_MTOOLS=y

  Unrelated by this patch, but the image doesn't have a FAT partition so 
dosfstols and mtools aren't needed.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
