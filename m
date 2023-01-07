Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFEAC54EBC
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 11:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42D2D403C9;
	Sat,  7 Jan 2023 11:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42D2D403C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75A_kGdy8RSc; Sat,  7 Jan 2023 11:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 960FC40339;
	Sat,  7 Jan 2023 11:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 960FC40339
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C714C1BF47A
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 11:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1F0C60BFC
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 11:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1F0C60BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EhXxntVqJh1p for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 11:01:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CB8060BE8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CB8060BE8
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 11:01:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.54])
 by smtp1-g21.free.fr (Postfix) with ESMTP id 47A78B00563;
 Sat,  7 Jan 2023 12:01:36 +0100 (CET)
Received: from [37.169.185.64]
	by webmail.free.fr
MIME-Version: 1.0
Date: Sat, 07 Jan 2023 12:01:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20230107082710.2609784-3-peter@korsgaard.com>
References: <20230107082710.2609784-1-peter@korsgaard.com>
 <20230107082710.2609784-3-peter@korsgaard.com>
Message-ID: <cfaa380ea00ddb9a5f562d370a105c31@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673089296;
 bh=E+hWpz4lUkGv0/B7/PWJVqPuXVjY9x6p4Enh3vlHUps=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pxgz0dp3wGuBg0zIbj1w5TP0kkI9gdMgjarad340nwlwNBM7lI4kNoYiW5ZHNeGVX
 h7PY1buUQ3c4jijwF6iNmxKep0abgLw9kozbPi0geAsUz+Wz41AfnQxgwwJd4R5TGq
 wR0c2LDEV3qSlbfhZru7YgIdj6zXyVOMfGamcoSsQJ3yj17Y8JT/3LXu3i6yYYAkwp
 c4ZXHEEKRzrZws0oPSvfyJ5KM08t8NxaYT+64v2qFpfSpnFJ4j7neMvX/vkwi7K8Pi
 SkMvK87mclM5+KFGsLg8QRFyikRMSKkiB/bbXGpuGEoRjStzn82ubyC9CqwUaWsrDt
 K2ZUVUtMDT1mA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pxgz0dp3
Subject: Re: [Buildroot] [PATCH 3/4] configs/spike_riscv64_defconfig: use
 OpenSBI 1.2
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

I successfully tested this patch on top of branch master
at commit a0a428f with commands:

     make spike_riscv64_defconfig
     make
     ./board/spike/riscv64/start.sh

On 07/01/2023 09:27, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Julien Olivain <ju.o@free.fr>
Tested-by: Julien Olivain <ju.o@free.fr>

> ---
>  configs/spike_riscv64_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/spike_riscv64_defconfig 
> b/configs/spike_riscv64_defconfig
> index 26103682f9..e23f1ce32c 100644
> --- a/configs/spike_riscv64_defconfig
> +++ b/configs/spike_riscv64_defconfig
> @@ -9,7 +9,7 @@ BR2_TARGET_ROOTFS_CPIO=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_OPENSBI=y
>  BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.1"
> +BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
>  BR2_TARGET_OPENSBI_PLAT="generic"
>  BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
>  BR2_PACKAGE_HOST_RISCV_ISA_SIM=y

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
