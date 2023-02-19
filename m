Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8603C61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C86A40B59;
	Sun, 19 Feb 2023 17:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C86A40B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLV05j16zsR9; Sun, 19 Feb 2023 17:07:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BDA5404A5;
	Sun, 19 Feb 2023 17:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BDA5404A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3115F1BF423
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16FEB416CC
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16FEB416CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3T-zDVkYxVBH for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 17:07:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC2604168D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC2604168D
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 17:07:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.6])
 by smtp1-g21.free.fr (Postfix) with ESMTP id 9CA39B00571;
 Sun, 19 Feb 2023 18:07:12 +0100 (CET)
Received: from 37-174-20-96.coucou-networks.fr ([37.174.20.96])
 by webmail.free.fr
MIME-Version: 1.0
Date: Sun, 19 Feb 2023 18:07:12 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20230219164822.142283-3-fontaine.fabrice@gmail.com>
References: <20230219164822.142283-1-fontaine.fabrice@gmail.com>
 <20230219164822.142283-3-fontaine.fabrice@gmail.com>
Message-ID: <701823a1b87f5b99a6bdb21aa8b573d7@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676826432;
 bh=+CRizHb6q6IQ+MN4DyBcomVrYFYootTPV8XdsgBc9rg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IJ9wC1Bv3HdlIgAlg++mQ65gK5Ct+ZxUIvwwWZ05JX2Kg/7eT02Sx+Mxqd8DIwaOZ
 EWrjMcJpXgs/Vkb+OoRMKhtrgzIxyC5QGEL+l9mCrzH0mTwyuejGvJcr6gmpImKrZi
 23TAQpz1SGGoHpyJ85OnAGRAsIibiJKBh1yWFM/PUlUXqFJlnbnQy/xAYVVT/mVu7p
 vI+D/25R/tlt3A4VqwrjzC83S8NRzlz5CIwOpaefoPBf5aYdRelVSvyiTemyi7DCnF
 DaRyg3ZhlQsqEsZLr2sOLn029foOiRA0Iw12iPEfcgPehMcUSvYCI5MhlRcJLgmlX4
 H2AWiRMrukRpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IJ9wC1Bv
Subject: Re: [Buildroot] [PATCH v2,
 3/3] package/libjxl: security bump to version 0.8.1
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

Hi Fabrice,

Thanks for the quick update!

I successfully tested with the command:

     support/testing/run-tests \
         -d dl -o output_folder \
         tests.package.test_libjxl

On 19/02/2023 17:48, Fabrice Fontaine wrote:
> Security: Fix OOB read in exif.h
> 
> https://github.com/libjxl/libjxl/releases/tag/v0.8.1
> https://github.com/libjxl/libjxl/releases/tag/v0.8.0
> 

Tested-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Julien Olivain <ju.o@free.fr>

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Julien Olivain):
>  - Add patch to fix crash
> 
>  ...entation-fault-when-JPEG-is-disabled.patch | 44 +++++++++++++++++++
>  package/libjxl/libjxl.hash                    |  2 +-
>  package/libjxl/libjxl.mk                      |  2 +-
>  3 files changed, 46 insertions(+), 2 deletions(-)
>  create mode 100644
> package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch
> 
> diff --git
> a/package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch
> b/package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch
> new file mode 100644
> index 0000000000..3d709c956b
> --- /dev/null
> +++
> b/package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch
> @@ -0,0 +1,44 @@
> +From 504f35c8204248ae6f97278e8b7c6cc5853a1b94 Mon Sep 17 00:00:00 2001
> +From: Julien Olivain <ju.o@free.fr>
> +Date: Fri, 10 Feb 2023 21:31:30 +0100
> +Subject: [PATCH] djxl: fix segmentation fault when JPEG is disabled
> +
> +When libjxl is compiled without JPEG support, by configuring for 
> example
> +with:
> +
> +    cmake -DCMAKE_DISABLE_FIND_PACKAGE_JPEG=TRUE ...
> +
> +djxl crashes with a segmentation fault at:
> +https://github.com/libjxl/libjxl/blob/v0.8.1/tools/djxl_main.cc#L367
> +
> +The crash can be reproduced with the sequence:
> +
> +    gm convert IMAGE:LOGO ref.ppm
> +    cjxl ref.ppm enc.jxl
> +    djxl enc.jxl dec.ppm
> +
> +The crash happen because opt_jpeg_quality_id does not get
> +initialized at:
> +https://github.com/libjxl/libjxl/blob/v0.8.1/tools/djxl_main.cc#L107
> +
> +This commit fixes the crash by adding a test on opt_jpeg_quality_id.
> +
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +[Retrieved from:
> +https://github.com/libjxl/libjxl/pull/2178/commits/504f35c8204248ae6f97278e8b7c6cc5853a1b94]
> +---
> + tools/djxl_main.cc | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tools/djxl_main.cc b/tools/djxl_main.cc
> +index b755301fcb..42b889e7ce 100644
> +--- a/tools/djxl_main.cc
> ++++ b/tools/djxl_main.cc
> +@@ -370,6 +370,7 @@ int main(int argc, const char* argv[]) {
> +     args.color_space = force_colorspace;
> +   }
> +   if (codec == jxl::extras::Codec::kPNM && extension != ".pfm" &&
> ++      args.opt_jpeg_quality_id != -1 &&
> +       !cmdline.GetOption(args.opt_jpeg_quality_id)->matched()) {
> +     args.bits_per_sample = 0;
> +   }
> diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
> index e71d32e61d..6b4c9d8d0a 100644
> --- a/package/libjxl/libjxl.hash
> +++ b/package/libjxl/libjxl.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256
> 3114bba1fabb36f6f4adc2632717209aa6f84077bc4e93b420e0d63fa0455c5e
> libjxl-0.7.0.tar.gz
> +sha256
> 60f43921ad3209c9e180563025eda0c0f9b1afac51a2927b9ff59fff3950dc56
> libjxl-0.8.1.tar.gz
>  sha256
> 8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede
> LICENSE
>  sha256
> 91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575
> PATENTS
> diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
> index b4dfbecf82..f603327bf6 100644
> --- a/package/libjxl/libjxl.mk
> +++ b/package/libjxl/libjxl.mk
> @@ -4,7 +4,7 @@
>  #
> 
> ################################################################################
> 
> -LIBJXL_VERSION = 0.7.0
> +LIBJXL_VERSION = 0.8.1
>  LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
>  LIBJXL_LICENSE = BSD-3-Clause
>  LIBJXL_LICENSE_FILES = LICENSE PATENTS

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
