Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D526CC4826B
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 19:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63F6D403C0;
	Fri, 15 Sep 2023 19:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63F6D403C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cP1eyIFOPvN6; Fri, 15 Sep 2023 19:30:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FFAA40153;
	Fri, 15 Sep 2023 19:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FFAA40153
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7ABC81BF5D7
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 19:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5419140153
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 19:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5419140153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AE7s6hB_EJMs for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 19:30:11 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44618400D7
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 19:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44618400D7
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 591C3B004FF;
 Fri, 15 Sep 2023 21:30:07 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:55796])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 Sep 2023 21:30:07 +0200
MIME-Version: 1.0
Date: Fri, 15 Sep 2023 21:30:07 +0200
From: Julien Olivain <ju.o@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20230914215606.309735-1-fontaine.fabrice@gmail.com>
References: <20230914215606.309735-1-fontaine.fabrice@gmail.com>
User-Agent: Webmail Free/1.6.1
Message-ID: <80eccb888c17302f362990c956de8529@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694806208;
 bh=o/ZiSHEkwljqfzE9ZAoTHHfpOvFoT8s2XjjP+v7+3vU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H82/5Ngwjj1ytfWxY+vcoWzA6Xk0NG+SUJvMiuiDCY6lHjX4b5X9Ol8VQ78ERs8hY
 YZ5/LTgPzQW9ej42SfehSsiip6P16BwCCLQ1I9CIj6BKoUK4z0qxwt1qtPIFLffR7/
 BuV3RcBm7sQ1424DLw58MPWIs1a8v1m3vbQR88Jpo1oWbv2UMF7ucpEbF06Q7Q6jX6
 BQBYXS2RBxndyGD0iTicl6q9F0hpiL6mt6AyziupPTvBiNsKeN3+obPAMB4k9LYsE6
 kHXl7avCA5CzAixF3H3f08hmL57FAWCTkkrxQemBnwFrxM0tyocGPcfwXS55VjRfiY
 hKt5pkUkmwG5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H82/5Ngw
Subject: Re: [Buildroot] [PATCH 1/1] package/libjxl: security bump to
 version 0.8.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

I tested this patch on branch master at commit 3557a7b
with commands:

     support/testing/run-tests \
         -d dl -o output_folder \
         tests.package.test_libjxl
     ...
     OK

While trying with:

     utils/test-pkg -a -p libjxl
     ...
         bootlin-riscv32-glibc [17/45]: FAILED
         bootlin-riscv64-glibc [18/45]: FAILED
          bootlin-riscv64-musl [19/45]: FAILED
     ...
     45 builds, 11 skipped, 3 build failed, 0 legal-info failed, 0 
show-info failed

I had those 3 build failures. They were introduced by v0.8.1 and are
unrelated to this patch. I proposed a fix at:
https://patchwork.ozlabs.org/project/buildroot/patch/20230915192308.1432032-1-ju.o@free.fr/

and also made sure this fix works for both v0.8.1 and v0.8.2 proposed in
this patch.

On 14/09/2023 23:56, Fabrice Fontaine wrote:
> Fix CVE-2023-35790: An issue was discovered in dec_patch_dictionary.cc
> in libjxl before 0.8.2. An integer underflow in patch decoding can lead
> to a denial of service, such as an infinite loop.
> 
> https://github.com/libjxl/libjxl/releases/tag/v0.8.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Julien Olivain <ju.o@free.fr>
Tested-by: Julien Olivain <ju.o@free.fr>

> ---
>  package/libjxl/libjxl.hash | 2 +-
>  package/libjxl/libjxl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
> index 6b4c9d8d0a..c8f98d10ea 100644
> --- a/package/libjxl/libjxl.hash
> +++ b/package/libjxl/libjxl.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  
> 60f43921ad3209c9e180563025eda0c0f9b1afac51a2927b9ff59fff3950dc56  
> libjxl-0.8.1.tar.gz
> +sha256  
> c70916fb3ed43784eb840f82f05d390053a558e2da106e40863919238fa7b420  
> libjxl-0.8.2.tar.gz
>  sha256  
> 8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  
> LICENSE
>  sha256  
> 91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  
> PATENTS
> diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
> index f603327bf6..47c110eb53 100644
> --- a/package/libjxl/libjxl.mk
> +++ b/package/libjxl/libjxl.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBJXL_VERSION = 0.8.1
> +LIBJXL_VERSION = 0.8.2
>  LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
>  LIBJXL_LICENSE = BSD-3-Clause
>  LIBJXL_LICENSE_FILES = LICENSE PATENTS

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
