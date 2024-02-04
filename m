Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159CBC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA4E585200;
	Sun,  4 Feb 2024 10:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA4E585200
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HPv5D8fSmcfK; Sun,  4 Feb 2024 10:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDD23851CD;
	Sun,  4 Feb 2024 10:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDD23851CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 511091BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2931844A94
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2931844A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9M3cykw9Nj4 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:07:48 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 022ED44A2F
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 022ED44A2F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CE75BB0053E;
 Sun,  4 Feb 2024 11:07:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Feb 2024 11:07:42 +0100
Date: Sun, 4 Feb 2024 11:07:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zb9h7gMNs8MMK6nz@landeda>
References: <20240201174432.182161-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240201174432.182161-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707041266;
 bh=dz5lKKqngYuejDcQ25OXWh5vCcgU7mIc+2waxELSu9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GeKW8eP1JLMcQBBUwxqK2wtFTmXmarmAHZHrg6dr9oNb3a60r1H8CVGk1AiKMn6Qy
 RTLqs8RUKrs0fsDG0cci3zmU9w6IlW29NoDywN3pntN64maFYjnxAFOvES0TQ0Ynrg
 od/qSdEuggIW9iIbjXNc/mJ3mx4TzIZRDcofM/chUDxjX9vKHqmiavLJGm3wpJnvqO
 0BKXiO+dWJ3hSMAjejz54CQdyALxaFhS2XiXGnuCTUh7/IkGTesBMAKqUeQc9ssFbP
 /wJ8Gy5affLEu4Q2l7M49QNyehZCtE8jRxhWyipAlNDIHIbpc386qvGrFj0OHxnnNf
 IChi4+tjihhjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GeKW8eP1
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: drop
 LINUX_FIRMWARE_CPE_ID_VENDOR
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-02-01 18:44 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:kernel:linux-firmware added by commit
> 63332c33aa0771532807fd2684d4eee4eb952435 has never been a valid CPE ID
> for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:kernel:linux-firmware
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-firmware/linux-firmware.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 58fbaab1d7..60e8861abe 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -9,8 +9,6 @@ LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
>  LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
>  LINUX_FIRMWARE_INSTALL_IMAGES = YES
>  
> -LINUX_FIRMWARE_CPE_ID_VENDOR = kernel
> -
>  # Intel SST DSP
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP),y)
>  LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
