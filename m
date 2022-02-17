Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A27BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D63E40227;
	Thu, 17 Feb 2022 20:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9gB5puzK4sdT; Thu, 17 Feb 2022 20:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7408740391;
	Thu, 17 Feb 2022 20:55:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB5321BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3E6260AD4
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sj6_wgpD9ZxV for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:55:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CCDE60A8A
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:55:04 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4K06XP6Pb9z9slf
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:55:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1645131299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UEdCMlsQ6D90dXekDXiXXy7cUif/rhJT4jhjXPhSzd0=;
 b=OL86deVDA/76qVVsyg1gBs8jZy/x+b9yKHiOGoHRXpibAjV6wzae12MBFnJGnM6/vMFT0m
 g9QlLlncjoRO55Fqxvg/6RWvfYEUW5HJMfYvP0gHwVzisyeALzx47lWEZ8G3/CXlVvGYHU
 EbIY/ZRBYpJQMUJYocLu2kridmgZDIo5CiEYKT7dLrItzwUVshJwpo7Lu7mD1u3RDzFfjt
 w3jfS+wnwTCUo6zCCgUKG8uVBq3kvpffqontdB5/uHuIaXigAJrkJZoMmoEGdfSEQGC4wx
 HM9F6GnhYUjHqBjxgixZJ4EZLdFhL4XLTvZGmL2YZtM7oEWpLTJ9dDNnstcbKQ==
Message-ID: <09bdaefa-5364-c7cb-b001-47fa5af72a11@othermo.de>
Date: Thu, 17 Feb 2022 21:54:54 +0100
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220217201001.1859113-1-giulio.benetti@benettiengineering.com>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20220217201001.1859113-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: U-Boot
 requires OpenSSL
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

On 17.02.22 21:10, Giulio Benetti wrote:
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784267
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

> ---
>   configs/kontron_bl_imx8mm_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
> index 57e7e9683d..2b7e121e25 100644
> --- a/configs/kontron_bl_imx8mm_defconfig
> +++ b/configs/kontron_bl_imx8mm_defconfig
> @@ -45,6 +45,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>   BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
>   BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
