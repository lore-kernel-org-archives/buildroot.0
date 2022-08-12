Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652DEC00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 23:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A515341912;
	Fri, 12 Aug 2022 23:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A515341912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-ia5nZeSM9q; Fri, 12 Aug 2022 23:16:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D7D64190A;
	Fri, 12 Aug 2022 23:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D7D64190A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1E1E1BF27C
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 23:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D4FE83774
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 23:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D4FE83774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0i9kfZ0c5q9 for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 23:16:52 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA0DB831A0
Received: from smtpcmd02111.aruba.it (smtpcmd02111.aruba.it [62.149.158.111])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA0DB831A0
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 23:16:50 +0000 (UTC)
Received: from [192.168.8.155] ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MdmkoU3KJtk1HMdmkoBlsi; Sat, 13 Aug 2022 01:09:46 +0200
Message-ID: <1762f288-2d9b-4d33-6f15-8a5f58aa4d2a@benettiengineering.com>
Date: Sat, 13 Aug 2022 01:09:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: buildroot@buildroot.org
References: <20220806232132.1433066-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220806232132.1433066-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfE3QdDbjxcflvxHjneLjA8Dkf+VEEZRoy5LJ63hMwFZ4wk+ceKE3r0enIRwjYLFD5+eQXscFk+vjp7hFzydDJuS9iiRCUe/LF+SygY6HkSm3pTPOmyDY
 ZqYIgVo38L1S1NSaLpqm2r+8iUvBmVZqjqwNpCrC8ipnp4lDC1yB6K6SjE7M1quX0sRdbXL6rkHLpoyb7LhDa5T9JJqsWvpu2Rm86ZYLDVk3XFociRgImOBo
 zxPYQyWzs8HEMH8hcssjcdORDG3dHH1VDZAxMpA+DuXj2xjCdH0NXGFIGluXXeOh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660345786; bh=jpz+AbvFQ4ASFW8GHbcpBWhXU1Kw/dHWPRpdpjBo/NI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=inzozL5oAJvd56povPh7Y3qWBNHvTVKUaOfS4uPnkOYGoYjLvgIHJdDimrbyUt5pv
 axQQ83BWtzO891FGVZcHjT9j6Bq4ss5cStqtKPtcYHrDQNLO0qLeEkwZN/TAnL7M/r
 rG5oW8cQGiNXs4uptK9z2wit22tZ4C+YJdWAh2Bu67qLZTbIEMYO4EplehlI81+wUm
 ozxDRpvSv/zJEwShom/1pMW0GNxmzY6vDGxEgxToDNcevpn0/kZm8MEyOLIDdmcE47
 jw9lMlXxX6/vj40EMjGpDwOMwJXYjRyvyLHS/yt7O7c5Q/S3kXsyaHg6tiLjcNgSfs
 7cZKO/YtCBqhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=inzozL5o
Subject: Re: [Buildroot] [PATCH] package/mali-driver: fix build failure with
 Linux version >= 5.15
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

On 07/08/22 01:21, Giulio Benetti wrote:
> Add patch for fixing build failure with Linux version >= 5.15. As explained
> in the patch itself starting from Linux 5.15 if we use any DMA_BUF API
> (dma_buf_*()) then we must import the DMA_BUF module with:
> MODULE_IMPORT_NS(DMA_BUF);
> 
> Pending Pull Request:
> https://github.com/bootlin/mali-driver/pull/3

This ^^^ patch has been merged today, so please drop this patch in favor
of this one:
https://patchwork.ozlabs.org/project/buildroot/patch/20220812230643.95772-1-giulio.benetti@benettiengineering.com/
that bumps version to latest including this fix.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   ...linux-fix-build-failure-with-linux-v.patch | 31 +++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 package/mali-driver/0001-mali_kbase_core_linux-fix-build-failure-with-linux-v.patch
> 
> diff --git a/package/mali-driver/0001-mali_kbase_core_linux-fix-build-failure-with-linux-v.patch b/package/mali-driver/0001-mali_kbase_core_linux-fix-build-failure-with-linux-v.patch
> new file mode 100644
> index 0000000000..07f2a58c7d
> --- /dev/null
> +++ b/package/mali-driver/0001-mali_kbase_core_linux-fix-build-failure-with-linux-v.patch
> @@ -0,0 +1,31 @@
> +From 26979e5f030eab9cde8d4197a819bbaa4cc21188 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Sun, 7 Aug 2022 01:13:26 +0200
> +Subject: [PATCH] mali_kbase_core_linux: fix build failure with linux version
> + >= 5.15
> +
> +Since Linux 5.15 module using DMA_BUF needs to explictly MODULE_IMPORT_NS
> +it, so let's add MODULE_IMPORT_NS(DMA_BUF); if Linux version is >= 5.15.0.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + r8p0/drivers/gpu/arm/midgard/mali_kbase_core_linux.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/r8p0/drivers/gpu/arm/midgard/mali_kbase_core_linux.c b/r8p0/drivers/gpu/arm/midgard/mali_kbase_core_linux.c
> +index d920f8d..d87bb8c 100644
> +--- a/r8p0/drivers/gpu/arm/midgard/mali_kbase_core_linux.c
> ++++ b/r8p0/drivers/gpu/arm/midgard/mali_kbase_core_linux.c
> +@@ -4913,6 +4913,9 @@ module_exit(kbase_driver_exit);
> +
> + #endif /* CONFIG_OF */
> +
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 15, 0)
> ++MODULE_IMPORT_NS(DMA_BUF);
> ++#endif
> + MODULE_LICENSE("GPL");
> + MODULE_VERSION(MALI_RELEASE_NAME " (UK version " \
> + 		__stringify(BASE_UK_VERSION_MAJOR) "." \
> +--
> +2.34.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
