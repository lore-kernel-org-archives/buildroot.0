Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D285CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 10:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D715418D1;
	Sun, 24 Sep 2023 10:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D715418D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wh_WhEvK2kSv; Sun, 24 Sep 2023 10:36:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02C7D4193C;
	Sun, 24 Sep 2023 10:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02C7D4193C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5041BF365
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06FB7414C8
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06FB7414C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysvfHz_9_i89 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 10:34:45 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09053400EC
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 10:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09053400EC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:bf8d:df06:37bc:41df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3BA95780395;
 Sun, 24 Sep 2023 12:34:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Sep 2023 12:34:39 +0200
Date: Sun, 24 Sep 2023 12:34:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230924103439.GJ1469982@scaer>
References: <20230923140324.3168518-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923140324.3168518-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695551683;
 bh=1ITIFffPHF1/l2rNr1AzaxWRjqrJTgHfbILMsso4Pxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uLiqybffbxQb9g95DpRdZnkPL4pf9qoi6ObPsJmr7J9I+hedq4N49uv741zK1Cu2c
 0+jBbFcguwgUH7pSjYNDOrDcii93m2OHlRY37GiuNmEEjtwoxe1vjJ3Lj4B7wFW7X0
 f0u4mfUoZqiH1K/IMfgAgKRziQ9FYfr9Gwh7/g8q5w2lbFUHF+zBoBGSLp8RLZd4kv
 dhoTxZPqmt9z7ZDLVJ6mUadP210yXxZtNyKPB16eJc3zpuqQfGG4q8mAgeytpXhxbC
 W3NJjW7+Qv6yTOJyIyMJOM5kmU+U5i9vRGm/LIdytJgDwyLHxGiDwbTAJtezBghykH
 KuByDQEI9in+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uLiqybff
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.27.6
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-09-23 16:03 +0200, Bernd Kuhls spake thusly:
> Changelog: https://cmake.org/cmake/help/v3.27/release/3.27.html#updates
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cmake/cmake.hash | 4 ++--
>  package/cmake/cmake.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> index 35f25c0066..8b1ae5b4a6 100644
> --- a/package/cmake/cmake.hash
> +++ b/package/cmake/cmake.hash
> @@ -1,5 +1,5 @@
> -# From https://cmake.org/files/v3.27/cmake-3.27.3-SHA-256.txt
> -sha256  66afdc0f181461b70b6fedcde9ecc4226c5cd184e7203617c83b7d8e47f49521  cmake-3.27.3.tar.gz
> +# From https://cmake.org/files/v3.27/cmake-3.27.6-SHA-256.txt
> +sha256  ef3056df528569e0e8956f6cf38806879347ac6de6a4ff7e4105dc4578732cfb  cmake-3.27.6.tar.gz
>  
>  # Locally calculated
>  sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index a0c775e37c..3bb2c4bffb 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
>  CMAKE_VERSION_MAJOR = 3.27
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
>  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3-Clause
>  CMAKE_LICENSE_FILES = Copyright.txt
> -- 
> 2.39.2
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
