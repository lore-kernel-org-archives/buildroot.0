Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79466C36008
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 00:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F1EA6111B;
	Thu, 27 Mar 2025 00:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XGm-5xoWUKB; Thu, 27 Mar 2025 00:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E1666116B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E1666116B;
	Thu, 27 Mar 2025 00:23:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AA2312A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 00:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B2F840592
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 00:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEj3RBcItpWE for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 00:23:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5141E403E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5141E403E2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5141E403E2
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 00:23:12 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:70e4:c237:6624:9e80])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 66DBC13F88F;
 Thu, 27 Mar 2025 01:23:07 +0100 (CET)
Date: Thu, 27 Mar 2025 01:23:07 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Robin Jarry <robin@jarry.cc>, 
 Julien Olivain <ju.o@free.fr>
Message-ID: <hyhfbqubhdfkvvuwolfo4sktdvg724wuekfxodpgmfygjl5ijd@lqiukqjstzba>
References: <20250326111651.23707-1-maxime@leroys.fr>
 <20250326132655.35729-1-maxime@leroys.fr>
 <20250326132655.35729-2-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326132655.35729-2-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743034990;
 bh=8XhaW62IsV82+7uxcltbqrZx6YZexEo7R+m9cSYgkyE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gKA88IKtZ4yZcfmSgMbk0YFu1QhmD4QTOnhelsGBxaqPzMo2zZNMmA6EHz5bpFfZg
 hfZjLHPoxltZ52/FQyHalCO1fPQhP8OGqBpYA0QcwEmQ14rFrN4EtoUqxHL9BA0PA/
 C2McBz2h/IZDNIUUiOHnhD1FTo3ZpftK4MZ3P6w12s6iYmC5KsD1J6cf8cvdBaVVUl
 tXohG6ivgBw4b4eOjo7QA/IgN4lhSwoc2kBK3jeWu+84o3SXeDdTR+q1yb6mOfr/vI
 clTQFpuVkdqybQIrFs6+T2klYAsYbRn00EO6oqTsaKs+XPtKL5IItR5FSyiG1wjC+x
 LW/JLUlY3Akzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gKA88IKt
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libecoli: bump version to
 0.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Mar 26, 2025 at 02:26:54PM +0100, Maxime Leroy wrote:
> This new version is required to compile grout v8.4.0.
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>

It was already stated OK for me:
  https://lists.buildroot.org/pipermail/buildroot/2025-March/775904.html

> ---
>  package/libecoli/libecoli.hash | 2 +-
>  package/libecoli/libecoli.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
> index 433550f91b..f973b6f254 100644
> --- a/package/libecoli/libecoli.hash
> +++ b/package/libecoli/libecoli.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  e66a85a35bae644b0baf9a4e6d084ff926ebaa12023f9df9f34e8f7a46834da8  libecoli-0.3.0.tar.gz
> +sha256  bc9ca742f32dc7787146de4cbc3997b28356adaf219049304bbc3368d25b7395  libecoli-0.5.0.tar.gz
>  sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
> diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
> index f260467d1f..f989e7b9cd 100644
> --- a/package/libecoli/libecoli.mk
> +++ b/package/libecoli/libecoli.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBECOLI_VERSION = 0.3.0
> +LIBECOLI_VERSION = 0.5.0
>  LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
>  LIBECOLI_INSTALL_STAGING = YES
>  LIBECOLI_LICENSE = BSD-3-Clause
> -- 
> 2.43.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
