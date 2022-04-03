Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C4CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 15:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 350E260E1A;
	Sun,  3 Apr 2022 15:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id StHaWRrprGde; Sun,  3 Apr 2022 15:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 648E560E09;
	Sun,  3 Apr 2022 15:03:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFC2B1BF96B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE5B9832C6
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87x6NM0iKsnM for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 15:03:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C149832C2
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 15:03:21 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id d10so3441935edj.0
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 08:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=p6lRR67DqtTPoWGJWzVlXfsbgeu3c1NqzEXhX3QLsV0=;
 b=ZU+jgfzO7FSIUBGbGXxb5FBVflLg6PopGP19ZRjr//0zAXA/eP+tc4Y9lGHPmjLynK
 i+oVyUr0qraee4o5nFIIGCTou0lb+iOmVx9ETZhlNzIqdXeVsNturJMIvm1xKn9cejFi
 NF2Jn+/BvzvW8B0Xf5+IF4pe+AltGShA7XZnkvrWkH877cn6xI1MUXGC7CFMNw9A6Tkq
 WXb3ycLV+1kVFvGTbLu5UMmVTcshUiK+78GIV5EBn3d8bq/Nqf53VQ+bGQL3cH2IsHVB
 9Ap6C8StPhwFwxs3a4S91JGrusXcZFwyu0owNz02fZWTaV1UdW4N4NpSLlHTmszxHp96
 Wtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=p6lRR67DqtTPoWGJWzVlXfsbgeu3c1NqzEXhX3QLsV0=;
 b=HyNN6+E8t432D3gcog46XT4lnwMHUzP/czB55GlqOFmS/DKVmjZk1vxdd2XKc0WuuS
 Qj2kW0opj+vj/GI6DKHA2B4gEKeEiCKVfU6zm+/dY85dE5SSsXYQ7dlZl/qzfu42CLx+
 +Nnh3JUMaFggPYqWkqT7wS3sb0HhCtzzuWyXtZB3xJCHB73wt0xt83TXVqDWbxQ6bddH
 yezFeRNttXtDlYPriD20tO+PXQOI/G+CJpIJEI5iwSBEnpVg2Y344eQo0Z6BX9N8JgJs
 rqC/QEfFjDwhN2ghxMwq7D1j4iJFzbxp7SOIpC9AkV5KtnoITuFT1ae7THHn54VO0IJh
 wg5A==
X-Gm-Message-State: AOAM530AgO2G5uPDujjXq4FAocljUgDQ8aE6MDc7vJaQBvC40uPn3Dk7
 iEwOnK8FV2kV1UmWprFmmYCKTA==
X-Google-Smtp-Source: ABdhPJxy0fCF5jAvklGm7vwGusQahJ2f4Xs7E5MhJb2MUCyF8zKnXfvLkzRKXsFmUyLKntVijmo0bA==
X-Received: by 2002:a50:cd8d:0:b0:416:63d7:9326 with SMTP id
 p13-20020a50cd8d000000b0041663d79326mr28857849edi.233.1648998199750; 
 Sun, 03 Apr 2022 08:03:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425?
 (ptr-9fplejof7ird5pjql2d.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a50ed16000000b00419366b2146sm4046812eds.43.2022.04.03.08.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 08:03:19 -0700 (PDT)
Message-ID: <48a1ca74-1427-c1b0-c2af-7a9ba97dc7c3@mind.be>
Date: Sun, 3 Apr 2022 17:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220330071449.4060342-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220330071449.4060342-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.12.4
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/03/2022 09:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/cog/cog.hash | 8 ++++----
>   package/cog/cog.mk   | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/cog/cog.hash b/package/cog/cog.hash
> index 839b12e619..00d3a4e191 100644
> --- a/package/cog/cog.hash
> +++ b/package/cog/cog.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/cog-0.12.1.tar.xz.sums
> -md5  25a80a5a8a52b8873933a128151b8928  cog-0.12.1.tar.xz
> -sha1  3b9f67bc23cd9e3db2221366d6cde4ca0b06b811  cog-0.12.1.tar.xz
> -sha256  23caaafa2ef5c2f6a97d467fcce908ea71087ad03b72deb9280225c0dd561c91  cog-0.12.1.tar.xz
> +# From https://wpewebkit.org/releases/cog-0.12.4.tar.xz.sums
> +md5  cdb8acdc3acc9b5082e7db9c279155c3  cog-0.12.4.tar.xz
> +sha1  600b30efadf55bf94ea5062a0a1b2ea0b74053e5  cog-0.12.4.tar.xz
> +sha256  9983c621c8e14fca3792ff566cb6b86d6a1f17446eb4c083af4a5a749112982f  cog-0.12.4.tar.xz
>   
>   # Hashes for license files:
>   sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index 2f6ef402fb..f2ca0af93d 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -COG_VERSION = 0.12.1
> +COG_VERSION = 0.12.4
>   COG_SITE = https://wpewebkit.org/releases
>   COG_SOURCE = cog-$(COG_VERSION).tar.xz
>   COG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
