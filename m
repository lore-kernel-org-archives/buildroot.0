Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38008C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 23:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A462B60AF2;
	Fri,  5 Aug 2022 23:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A462B60AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ibmv_4gc2TDh; Fri,  5 Aug 2022 23:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D0F460ADC;
	Fri,  5 Aug 2022 23:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D0F460ADC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 574C81BF267
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 23:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BD4683F6C
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 23:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BD4683F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FcXIqXfegQnm for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 23:40:18 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD26483F6B
Received: from smtpcmd11126.aruba.it (smtpcmd11126.aruba.it [62.149.156.126])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD26483F6B
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 23:40:17 +0000 (UTC)
Received: from [192.168.8.155] ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id K6oao1f59AaN9K6oaoXOB5; Sat, 06 Aug 2022 01:33:13 +0200
Message-ID: <4dbee7a8-c8c1-0e50-9d04-d5b7b26195d2@benettiengineering.com>
Date: Sat, 6 Aug 2022 01:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: buildroot@buildroot.org
References: <20220804223617.3554355-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220804223617.3554355-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfA6Y8t557XW6g9bnxgbX4bn8FKvZgPG+V1+UH3P4Z0giOur/AVaqYy5EylHKz+bwU0kg4ibHgvRKye6ifIBWcHUvXbgCl1FIdbuQt2GtyC3eBsjluuxH
 MosHoH1cZtwLZyOn7+FyIG2DhVQyGyQJShAzZBTs7OIpdqEDga+M74pf5qBUz/pjgLklSCQgx65quxxbP01NbUiiY282aLlvxLhSgCSTSNbEZTKOc9a37xty
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659742393; bh=+BnW/T8152DC1obsVnJjU3qtQ30H0zhuBbjvEjPvxQM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=KvCUmOGJnpvUQ90qKK1mdhPG7yhyWaeXsWPsHp767l7rfoyckq0xso9lbRyt9t+vp
 hAIHh2GB6B3hD+6238m1lGBSMHSwoLg22kVQMHITctOgcVC+Xtnn5wSg2XBBnFP8AZ
 RO7eZxDeUx0LDZq5Jki0TgcaobwapVDb7qQiYSJ7LXGjBtVqFEzPFthAafdVkxnvYi
 dGjZhDkMsqxfW1Ao/8BBlx2he8WxyJ5FwWi74B2OCALWP389LoTb5FNCDYHt7+Ud2e
 a3BgyX3GVzmHraJF+UobnPOU68coKLr4sRdMN4Tb9XX4LnU2jq5WkrKbOUumohLH3R
 RzXgDlccHVkjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=KvCUmOGJ
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: fix build
 failure with linux version >= 5.15
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

Hi All,

please discard this patch in favor of this one:
https://patchwork.ozlabs.org/project/buildroot/patch/20220805232404.3586797-1-giulio.benetti@benettiengineering.com/

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 05/08/22 00:36, Giulio Benetti wrote:
> Add a patch to fix missing DMA_BUF module inclusion that leads to build
> failure. The patch includes DMA_BUF by using:
> MODULE_IMPORT_NS(DMA_BUF);
> 
> Fixes:
> http://autobuild.buildroot.net/results/8f25c26de737c358b3b43a10737609465b4e1398/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   ...1-mali-support-building-against-5.15.patch | 93 +++++++++++++++++++
>   1 file changed, 93 insertions(+)
>   create mode 100644 package/sunxi-mali-utgard-driver/0001-mali-support-building-against-5.15.patch
> 
> diff --git a/package/sunxi-mali-utgard-driver/0001-mali-support-building-against-5.15.patch b/package/sunxi-mali-utgard-driver/0001-mali-support-building-against-5.15.patch
> new file mode 100644
> index 0000000000..39709a3107
> --- /dev/null
> +++ b/package/sunxi-mali-utgard-driver/0001-mali-support-building-against-5.15.patch
> @@ -0,0 +1,93 @@
> +From e5f387146fb2e14c4785e84e239a3de6da1312c3 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Fri, 5 Aug 2022 00:26:42 +0200
> +Subject: [PATCH] mali: support building against 5.15
> +
> +Add patch to fix build failure with Linux version 5.15 due to missing
> +MODULE_IMPORT_NS(DMA_BUF);
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + ...6-mali-support-building-against-5.15.patch | 30 +++++++++++++++++++
> + patches/r6p0/series                           |  1 +
> + patches/r6p2/series                           |  1 +
> + patches/r8p1/series                           |  1 +
> + patches/r9p0/series                           |  1 +
> + 5 files changed, 34 insertions(+)
> + create mode 100644 patches/0026-mali-support-building-against-5.15.patch
> +
> +diff --git a/patches/0026-mali-support-building-against-5.15.patch b/patches/0026-mali-support-building-against-5.15.patch
> +new file mode 100644
> +index 0000000..2e05c43
> +--- /dev/null
> ++++ b/patches/0026-mali-support-building-against-5.15.patch
> +@@ -0,0 +1,30 @@
> ++From 57999c7d17fabc53c684304e83571db7f6cfb656 Mon Sep 17 00:00:00 2001
> ++From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ++Date: Fri, 5 Aug 2022 00:20:00 +0200
> ++Subject: [PATCH] mali: support building against 5.15
> ++
> ++Since Linux 5.15 module using DMA_BUF needs to explictly MODULE_IMPORT_NS
> ++it, so let's add MODULE_IMPORT_NS(DMA_BUF); if Linux version is >= 5.15.0.
> ++
> ++Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ++---
> ++ src/devicedrv/mali/linux/mali_kernel_linux.c | 3 +++
> ++ 1 file changed, 3 insertions(+)
> ++
> ++diff --git a/src/devicedrv/mali/linux/mali_kernel_linux.c b/src/devicedrv/mali/linux/mali_kernel_linux.c
> ++index 9bfa2bd..27ec709 100755
> ++--- a/src/devicedrv/mali/linux/mali_kernel_linux.c
> +++++ b/src/devicedrv/mali/linux/mali_kernel_linux.c
> ++@@ -1129,6 +1129,9 @@ static int mali_ioctl(struct inode *inode, struct file *filp, unsigned int cmd,
> ++ module_init(mali_module_init);
> ++ module_exit(mali_module_exit);
> ++
> +++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 15, 0)
> +++MODULE_IMPORT_NS(DMA_BUF);
> +++#endif
> ++ MODULE_LICENSE(MALI_KERNEL_LINUX_LICENSE);
> ++ MODULE_AUTHOR("ARM Ltd.");
> ++ MODULE_VERSION(SVN_REV_STRING);
> ++--
> ++2.34.1
> ++
> +diff --git a/patches/r6p0/series b/patches/r6p0/series
> +index 5d4883f..c5d3568 100644
> +--- a/patches/r6p0/series
> ++++ b/patches/r6p0/series
> +@@ -19,3 +19,4 @@ r6p0/0022-mali-support-building-against-5.6.patch
> + 0023-mali-support-building-against-5.7.patch
> + r6p0/0024-mali-support-building-against-5.9.patch
> + 0025-mali-support-building-against-5.10.patch
> ++0026-mali-support-building-against-5.15.patch
> +diff --git a/patches/r6p2/series b/patches/r6p2/series
> +index e19cf11..dcc0c8e 100644
> +--- a/patches/r6p2/series
> ++++ b/patches/r6p2/series
> +@@ -22,3 +22,4 @@ r6p2/0022-mali-support-building-against-5.6.patch
> + 0023-mali-support-building-against-5.7.patch
> + r6p2/0024-mali-support-building-against-5.9.patch
> + 0025-mali-support-building-against-5.10.patch
> ++0026-mali-support-building-against-5.15.patch
> +diff --git a/patches/r8p1/series b/patches/r8p1/series
> +index 4ad43c1..c03d4e0 100644
> +--- a/patches/r8p1/series
> ++++ b/patches/r8p1/series
> +@@ -17,3 +17,4 @@ r6p2/0022-mali-support-building-against-5.6.patch
> + 0023-mali-support-building-against-5.7.patch
> + 0024-mali-support-building-against-5.9.patch
> + 0025-mali-support-building-against-5.10.patch
> ++0026-mali-support-building-against-5.15.patch
> +diff --git a/patches/r9p0/series b/patches/r9p0/series
> +index dca4e02..913edd4 100644
> +--- a/patches/r9p0/series
> ++++ b/patches/r9p0/series
> +@@ -14,3 +14,4 @@ r6p2/0022-mali-support-building-against-5.6.patch
> + 0023-mali-support-building-against-5.7.patch
> + 0024-mali-support-building-against-5.9.patch
> + 0025-mali-support-building-against-5.10.patch
> ++0026-mali-support-building-against-5.15.patch
> +--
> +2.34.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
