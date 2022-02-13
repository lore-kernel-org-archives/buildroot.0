Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3738C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A12F81846;
	Sun, 13 Feb 2022 15:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bGh-pDlq7JuV; Sun, 13 Feb 2022 15:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D2DB81836;
	Sun, 13 Feb 2022 15:32:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1046A1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F40FE81836
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUEJ8jZ6-SyT for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:31:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EA47817D3
 for <buildroot@busybox.net>; Sun, 13 Feb 2022 15:31:00 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id p9so9745926ejd.6
 for <buildroot@busybox.net>; Sun, 13 Feb 2022 07:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=YXaB+qJIE+SQNLPhGfB7FDj9hn5aoRqda4teVM57d/s=;
 b=YzvWTaZfAmgCztAkwbQ3rON9Iyt+W+M1DWZeqAcF1PYsvKbJmE6POCusINURD4UvUH
 3hHSuWyOyQUx5w46QXoX2A9W2w3dYOo3h2iAL6O2YJ987qm4qxzYVOj2T1s3b0RZ1iBU
 V5QXNfzt5KmaOmT9Duj1qfjoFsN5foh9L93cQeB15p9DDAUXBqc9UookEsEVDqrsmRmU
 hEoY2uYskpTmE8Y7i5sABo8tRf6MuWJKcKIYjs08qRjeqmSf65O7Sn3J/BZ0aUHhwGBp
 EJ+5kv3Ojtm53txRMuY0lSQMa51UsUOsN//Y548hrXFDg98UKdZtl52lX2juex449XGT
 ukJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YXaB+qJIE+SQNLPhGfB7FDj9hn5aoRqda4teVM57d/s=;
 b=rSPbjcBKI8t0LOauEACfu0tQ1wlUdzac50brSPfhJXLX65bez+i4eVIk28FslSz8vX
 qsH41h8R+ei7Lu1RFFsL9CRchxZ+FzGkq2wfglY4k4O09OhxDa4dwhkZTJ7UX3pzn8bP
 oKpzWTPTizl5Gh9KUmMUpsRzju3YMEtU7lsx3sCuYrI4KgEHPNPoip0nZPQi50byrmAL
 UwOiOU7BApB/yg+AcwQnB81garQyfHikvLvVH5f65IsvrjbOr9I4PSJ88c+P2nDN5Zjs
 lcMsj8Rnzwuvr8ZjaxHRAO6CK0BZjZu76xPCmfG3Iro/5aBJrho+R4NXC51waduk/ut3
 zAVw==
X-Gm-Message-State: AOAM530JS/m7mstZv+CxNk6vXQGNZrtXyd7f3BHsoZWpdc0Ns6hw57ak
 uLn3N/ufwKcKYPDLaHfLZzaMiYgd42CTtg==
X-Google-Smtp-Source: ABdhPJwIkn950kFOMCu9tqcMdi+QmXinyG7v90kJz8RWPSaBoX8JHu9v2z1XaifMm1px3aG7Mf2UkA==
X-Received: by 2002:a17:906:c452:: with SMTP id
 ck18mr1616299ejb.46.1644766259402; 
 Sun, 13 Feb 2022 07:30:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h2sm1753675ejo.73.2022.02.13.07.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:30:59 -0800 (PST)
Message-ID: <fd415cf7-1999-40eb-1041-8f14497e090e@mind.be>
Date: Sun, 13 Feb 2022 16:30:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220207122423.1561946-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220207122423.1561946-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/zstd: bump to version 1.5.2
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



On 07/02/2022 13:24, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/zstd/zstd.hash | 4 ++--
>   package/zstd/zstd.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
> index d7d8a448f..eca44b89f 100644
> --- a/package/zstd/zstd.hash
> +++ b/package/zstd/zstd.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/facebook/zstd/releases/download/v1.5.1/zstd-1.5.1.tar.gz.sha256
> -sha256  e28b2f2ed5710ea0d3a1ecac3f6a947a016b972b9dd30242369010e5f53d7002  zstd-1.5.1.tar.gz
> +# From https://github.com/facebook/zstd/releases/download/v1.5.2/zstd-1.5.2.tar.gz.sha256
> +sha256  7c42d56fac126929a6a85dbc73ff1db2411d04f104fae9bdea51305663a83fd0  zstd-1.5.2.tar.gz
>   
>   # License files (locally computed)
>   sha256  2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b  LICENSE
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index 476190e9a..a4bbada82 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ZSTD_VERSION = 1.5.1
> +ZSTD_VERSION = 1.5.2
>   ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
>   ZSTD_INSTALL_STAGING = YES
>   ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
