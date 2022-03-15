Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A5FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B34B81349;
	Tue, 15 Mar 2022 21:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Y_TXVURVLRw; Tue, 15 Mar 2022 21:48:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A428481331;
	Tue, 15 Mar 2022 21:48:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C07661BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD881812F9
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:48:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JMNSVrI0ejt for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:48:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5CD9812DF
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:48:36 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id h13so517963ede.5
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RjlHo+cozOd+aIgZ4KzZ4lsyKvC1ukl6vWFARQwRMNI=;
 b=E6TtjpMRMf9Fi0BsvWcEIPUdNqlfP/oJsViIqAJ1oowPKgWVIX3vtppq+cowtNYfxa
 AJzd+W7inQFjn/AKkMoyrRFA8ftcMUCpCjgtXR71RW8CxRYif2cBD1ZoT3ywLFk9cvBn
 lESxD2s/b1THUSEHl4MlY5kPNwP72WCu/PF/1JSTJuVllrJ8vOmW6aKNu8IA+3qfyKMQ
 ydg3Q9NLN6WNabP/Pd72i/ao6GqX6eG7cFCGoXmyy0xsf85ku1QP8S8Ewr5sTIe6ODod
 g2G9eh76jBWFVgid6hkH8xl2Ugmh0YwTo1AMB6W+TzdlPucsLdI82R0FwX52woeC+BHV
 ACug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RjlHo+cozOd+aIgZ4KzZ4lsyKvC1ukl6vWFARQwRMNI=;
 b=OpFVWptjD+zMLjGbCA3xq7eH8OwouyuAC6NpZIe3Jk5fSS7BGbmDs/9xt7fKLtqDWH
 l2Kn9W8ii41c8aDNfqrHDoB1pBZbA0Mzo/e319T9JzNcBgpi/Mel5vbts2Omf2AU4HRu
 FdVvZ2cCz3cqhziufDVgegZQgz9F5uq/Lu809w3VgPrA3uBPCLz5qMXf50fEs9oFIJSR
 3ibpeXPFQ1undOGTeB/JtHzfaqgE9y+F4FElDGBXadweGq17eE11sDKBRMVVJRwGVBhl
 v6sRglKqw/d/PXlAUyBVKAk5YMvx1Eltb8ubreb+1ShnaTxC9HONOlLoA5RkwTxi9qlt
 rGmQ==
X-Gm-Message-State: AOAM531eCmfhG+jxwOhksM7JSxp531DvoOTCnEXHD9RrHn9JyO5WrLGA
 nvLzC8Ck53CEnRanHQtDan86XQ==
X-Google-Smtp-Source: ABdhPJzt1CB7UDqEkz3vv4gqezGAi4V8WhnKVMpaJ46eaO5vK3v/Tdus6ehcfMNRRuXUfzwpWg6fkA==
X-Received: by 2002:a05:6402:34d5:b0:416:201f:c636 with SMTP id
 w21-20020a05640234d500b00416201fc636mr27060997edc.293.1647380914768; 
 Tue, 15 Mar 2022 14:48:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a1709063e4700b006da6357b1c0sm79746eji.196.2022.03.15.14.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:48:34 -0700 (PDT)
Message-ID: <9e834c37-6052-93c5-9ee7-b73268a7389b@mind.be>
Date: Tue, 15 Mar 2022 22:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220309220219.787315-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220309220219.787315-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: bump to
 version LTS_01_2022_Ref01
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/03/2022 23:02, Fabrice Fontaine wrote:
> Drop patch (already in version)
> 
> https://github.com/Azure/azure-iot-sdk-c/releases/tag/LTS_01_2022_Ref01
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...c-fix-mismatching-function-prototype.patch | 35 -------------------
>   package/azure-iot-sdk-c/azure-iot-sdk-c.hash  |  2 +-
>   package/azure-iot-sdk-c/azure-iot-sdk-c.mk    |  2 +-
>   3 files changed, 2 insertions(+), 37 deletions(-)
>   delete mode 100644 package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
> 
> diff --git a/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch b/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
> deleted file mode 100644
> index 0c262e6c46..0000000000
> --- a/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 3a7997af72e7a4f70109d1639e6725b39046443e Mon Sep 17 00:00:00 2001
> -From: Francesco Giancane <30423178+fgiancane8@users.noreply.github.com>
> -Date: Fri, 2 Jul 2021 20:47:38 +0200
> -Subject: [PATCH] hmac.c: fix mismatching function prototype (#537)
> -
> -The reported function raises a warning when compilers assert the flag
> -`-Warray-parameter=`, signaling that an array-type argument was promoted
> -to a pointer-type argument.
> -
> -While in practice in most C implementations this is correct, fixing the
> -warning (and, in this case, indicating the maximum size for the array)
> -would represent a best-practice for finding out-of-bound accesses or
> -identifying wrongly-sized arrays passed in the function.
> -
> -Signed-off-by: Francesco Giancane <francesco.giancane@accenture.com>
> -[Retrieved from:
> -https://github.com/Azure/azure-c-shared-utility/commit/3a7997af72e7a4f70109d1639e6725b39046443e]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - src/hmac.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/hmac.c b/src/hmac.c
> -index 53f2411f8..160af9d2f 100644
> ---- a/c-utility/src/hmac.c
> -+++ b/c-utility/src/hmac.c
> -@@ -208,7 +208,7 @@ int hmacFinalBits(HMACContext *ctx,
> - *   sha Error Code.
> - *
> - */
> --int hmacResult(HMACContext *ctx, uint8_t *digest)
> -+int hmacResult(HMACContext *ctx, uint8_t digest[USHAMaxHashSize])
> - {
> -     if (!ctx) return shaNull;
> -
> diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
> index 72fa99c44d..5dbb530954 100644
> --- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
> +++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
> @@ -1,5 +1,5 @@
>   # Locally computed:
> -sha256  987b469aa76d6c81e5dbcd62e81f4ece0620770930cf65722754c76aedd6049f  azure-iot-sdk-c-LTS_01_2021_Ref01-br1.tar.gz
> +sha256  082e41f7cdf06fec036b8cfa1793f03e81ba527b55ea13c66be0e4cf9f20ff7b  azure-iot-sdk-c-LTS_01_2022_Ref01-br1.tar.gz
>   
>   # Hash for license files:
>   sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
> diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> index e6de8c851b..874646c445 100644
> --- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> +++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -AZURE_IOT_SDK_C_VERSION = LTS_01_2021_Ref01
> +AZURE_IOT_SDK_C_VERSION = LTS_01_2022_Ref01
>   AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
>   AZURE_IOT_SDK_C_SITE_METHOD = git
>   AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
