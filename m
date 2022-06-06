Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524E2C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16F2860BE0;
	Mon,  6 Jun 2022 13:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r93PgwiDXhlA; Mon,  6 Jun 2022 13:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1186060BDC;
	Mon,  6 Jun 2022 13:03:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00ABD1BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3B0641703
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3knvQYj2io9 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:03:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A481416F3
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:03:18 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id q21so28856573ejm.1
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 06:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=nwtAp159Jy6NseR56xCKP0w/CZ646G3lVm6qmZApZuo=;
 b=eGNfQiETs1dMKs/LkXivGAPO/oVNnhECLRALBcf6E4SzNyHvA0WIG930RQWjSK9yIH
 dlq5yWlpwfnSn1twh4PoK93H+ZBwaPNyA2CNknhdvunBTWYRwI13lhROF2CPAJ1k6Nhq
 01PZrN4/KUhO+nS9yq5HQf1HuUKTqgaSh959zOKq6vOajXgrEhjKdlAye2Altz5HGMp4
 lAYXjsfaTmGFXTGODGOIts8z3vu6ijOAhAliq8btVzQ+sX9e+jNOxgcL2ou0dZcRVS6C
 JjIXChPrDUYalPSDPEn8KZ1kElZfm4LIvSUlmn2gpFM+9fBIySAbP9M+ehKTTC12/Vzg
 s5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nwtAp159Jy6NseR56xCKP0w/CZ646G3lVm6qmZApZuo=;
 b=6VHtzP8seFSNeSSt2Pt0ueOqUxsKfbI4F8reg+fXuVTc4pU+VPcCWTuX9jNXJfC9Yi
 Z8gCCWR2/aEF6jBS5Vlmxdl8Gjfp5kU06D6Rn6v3QvufW1lk0ytRsCZkqRNIWyH4UaCH
 DgSc+M4u1I7QMdXu4Io/ltZOpESg3aw9mNFGNW4QCB4lfF20bbMf4Ga7gmFy1Uk3SHJi
 P3oN4hABWDV0fgQeSrk0TxAjsPBQReudlFEqNpB7xU+EpOxSQmx6odfhK/eVQaU5dEee
 8ii2wa54lCS9tGYbHh8vRmOebPDeVVsKToSGD1EHvu/5r6xu1LckTTDyd+7fF8/t8m71
 RMgg==
X-Gm-Message-State: AOAM531MyVqTWaMVxH8cqI2m/WKVlj7UW/6NUl9wtZ5A95pfL7RKhf2R
 89YMtjLO5rXl+qvgcR2mEPZMG847ppKaEA==
X-Google-Smtp-Source: ABdhPJzDHxJESZ+u6N15QlQV53WTBvk66bvqcK8Obs+sgnGZ8yEJegVxSjPo8R43b8EoyiOkmCzoVQ==
X-Received: by 2002:a17:906:8501:b0:711:bf65:2a47 with SMTP id
 i1-20020a170906850100b00711bf652a47mr7456756ejx.150.1654520596826; 
 Mon, 06 Jun 2022 06:03:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 lk24-20020a170906cb1800b006fa84a0af2asm6424261ejb.16.2022.06.06.06.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 06:03:16 -0700 (PDT)
Message-ID: <6942fb2b-66c5-0d3e-3021-0460229b0152@mind.be>
Date: Mon, 6 Jun 2022 15:03:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220606114905.444147-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220606114905.444147-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: security bump to
 version 10.3.35
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



On 06/06/2022 13:49, Fabrice Fontaine wrote:
> Fix CVE-2021-46669, CVE-2022-21427, CVE-2022-27376, CVE-2022-27377,
> CVE-2022-27378, CVE-2022-27379, CVE-2022-27380, CVE-2022-27381,
> CVE-2022-27383, CVE-2022-27384, CVE-2022-27386, CVE-2022-27387,
> CVE-2022-27445, CVE-2022-27447, CVE-2022-27448, CVE-2022-27449,
> CVE-2022-27452, CVE-2022-27456 and CVE-2022-27458
> 
> https://mariadb.com/kb/en/mariadb-10335-release-notes
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mariadb/mariadb.hash | 4 ++--
>   package/mariadb/mariadb.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
> index 4da26bdf94..f7e3c7b744 100644
> --- a/package/mariadb/mariadb.hash
> +++ b/package/mariadb/mariadb.hash
> @@ -1,5 +1,5 @@
> -# From https://dlm.mariadb.com/2117287/MariaDB/mariadb-10.3.34/source/sha512sums.txt
> -sha512  46d4575ec1afb68510652a4bb31ca5ce83a2f5f61048a6e9c1487b0ba58f079465a8b72518d44043cd42c631b19ff50b5498584676ac6473705b138fe3300741  mariadb-10.3.34.tar.gz
> +# From https://downloads.mariadb.org/mariadb/10.3.35
> +sha512  9355de944eccef4e0bc01b19ffc3c0c72cf88befae7385c6f0ee1ea47dbd98d23f6bb46af9c140acc48d9d9613552870684bc0b7ca1f3cff1dc09c1a2c801573  mariadb-10.3.35.tar.gz
>   
>   # Hash for license files
>   sha256  084aa0007efac6dda6aafffb3f3ef8b66b105862dad7ee23f6a4b52813f84464  README.md
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index 18667e7e70..06fd1484b6 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -MARIADB_VERSION = 10.3.34
> -MARIADB_SITE = https://dlm.mariadb.com/2117285/MariaDB/mariadb-$(MARIADB_VERSION)/source
> +MARIADB_VERSION = 10.3.35
> +MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
>   MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
>   # Tarball no longer contains LGPL license text
>   # https://jira.mariadb.org/browse/MDEV-12297
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
