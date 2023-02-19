Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D64C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 15:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EEBC41571;
	Sun, 19 Feb 2023 15:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EEBC41571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGfk_hS07BkP; Sun, 19 Feb 2023 15:37:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AC0D4157D;
	Sun, 19 Feb 2023 15:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC0D4157D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 196F91BF426
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 15:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4246404A5
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 15:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4246404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5MdFGtt7NSUw for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 15:37:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93E6B401AE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93E6B401AE
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 15:37:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp1-g21.free.fr (Postfix) with ESMTP id 1B34FB00548;
 Sun, 19 Feb 2023 16:37:07 +0100 (CET)
Received: from 37-174-20-96.coucou-networks.fr ([37.174.20.96])
 by webmail.free.fr
MIME-Version: 1.0
Date: Sun, 19 Feb 2023 16:37:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20230219140051.80647-3-fontaine.fabrice@gmail.com>
References: <20230219140051.80647-1-fontaine.fabrice@gmail.com>
 <20230219140051.80647-3-fontaine.fabrice@gmail.com>
Message-ID: <7155523cf22f19d3f27a454d8a8767e2@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676821027;
 bh=ZzE3HoUQVVZllq2dkfTfDRWlgbV1M6ynL3WvVVffLys=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H3h0ujp5yroBFPbyT9m3SI8Cf9yqcpidpI3lNP/YidkYmx0ItkkWRkTjM30OiAwDM
 Ycox4ZrfQDtdY1DByOMH/xqZZEBje+R736P2gGhK+Gbd1WrG+NP55EfCu2gC61u8Po
 UQdCVd000ZkK/OH4r4GC4gdLqI+cfiGfr48Nw4Fz1Gfjf3+iV/l3keqURdHyUUWNZU
 zEC+GWSQg76+5sf0Z6zwcYcpaEESixmCgCYG4ukMsUUSiN5br/itrqoUQIibE5Cgua
 6QSvLOwSwklfUA0lyRkXGH/F4khDkXJ5SirahgDQ40fgDFxpHO6+1rdTk70EFdblqB
 NU7vnWR1i9zqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H3h0ujp5
Subject: Re: [Buildroot] [PATCH 3/3] package/libjxl: security bump to
 version 0.8.1
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

On 19/02/2023 15:00, Fabrice Fontaine wrote:
> Security: Fix OOB read in exif.h
> 
> https://github.com/libjxl/libjxl/releases/tag/v0.8.1
> https://github.com/libjxl/libjxl/releases/tag/v0.8.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libjxl/libjxl.hash |  2 +-
>  package/libjxl/libjxl.mk   | 10 +++++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
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
> index 77405e4f11..095dc06764 100644
> --- a/package/libjxl/libjxl.mk
> +++ b/package/libjxl/libjxl.mk
> @@ -4,7 +4,7 @@
>  #
> 
> ################################################################################
> 
> -LIBJXL_VERSION = 0.7.0
> +LIBJXL_VERSION = 0.8.1

When bumping to version 0.8.1, I observed a segmentation fault crash 
while
running the package runtime test with the command:

     support/testing/run-tests \
         -d dl -o output_folder \
         tests.package.test_libjxl

The issue happen only when the libjxl tools are enabled AND there is
no jpeg support enabled.

I have a pull-request upstream which is not merged yet, at:
https://github.com/libjxl/libjxl/pull/2178

Maybe this patch could be included, to make sure the runtime test
will still work?

>  LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
>  LIBJXL_LICENSE = BSD-3-Clause
>  LIBJXL_LICENSE_FILES = LICENSE PATENTS
> @@ -34,9 +34,13 @@ LIBJXL_CONF_OPTS = \
> 
>  ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
>  LIBJXL_DEPENDENCIES += jpeg-turbo
> -LIBJXL_CONF_OPTS += -DJPEGXL_ENABLE_TOOLS=ON
> +LIBJXL_CONF_OPTS += \
> +	-DJPEGXL_ENABLE_JPEGLI=ON \
> +	-DJPEGXL_ENABLE_TOOLS=ON
>  else
> -LIBJXL_CONF_OPTS += -DJPEGXL_ENABLE_TOOLS=OFF
> +LIBJXL_CONF_OPTS += \
> +	-DJPEGXL_ENABLE_JPEGLI=OFF \
> +	-DJPEGXL_ENABLE_TOOLS=OFF
>  endif
> 
>  $(eval $(cmake-package))

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
