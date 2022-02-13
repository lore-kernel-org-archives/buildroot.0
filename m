Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF82C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 16:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDFCF4022E;
	Sun, 13 Feb 2022 16:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2ULkm4xaiVU; Sun, 13 Feb 2022 16:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3096401FC;
	Sun, 13 Feb 2022 16:42:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41C7A1BF421
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E9CE401D2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jnD5BtO-IuG1 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 16:42:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4780C401B9
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 16:42:58 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id d10so32819956eje.10
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 08:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Tnua2VuJbPuB5bzTCIzbA9JHSmX0SAnCbG9lXpXG14Q=;
 b=CMB7RlhVgHw8+cCy1InSNxf6xsHNwjPTHduy3rOixhq3dZly8OwmT0D6y3Ml1pMF1M
 VUC0R0ErljMLLqRTH2jChcmXfUzfDYty2wVOkB6Wx5QrZzkJAal8z4cQwpwHmxDRry2P
 ENShEye/gQKNnxk8Egn0ND9VVAHTcNHuJSfxcGAZ55fUz7iW5DpkWiygHBMYjoGJdhfL
 ZpW9OJKOcPmXhtfg4jXJbVpy8bOU/HasPA1g/whrOy0r98s59/UpgiqaxsG5jzV1D/2P
 6qDWMFFRuMfb6XN7GDGqi7PHzKng1tmHknwfCY5EwcBSe3i/wAVf1L9vGrvCMOhE2pe2
 q6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Tnua2VuJbPuB5bzTCIzbA9JHSmX0SAnCbG9lXpXG14Q=;
 b=vVa04vKf4ckVsGxf3TRK1Z7fKw+IG2lNFPvh0Xsdws8g0sxlYI9otTpxAOE/JRhON6
 W4YXIwIrfk+9vGnSZ6uv36OgS9dQ9PUNjHOzHEzw1WOw3BOAYZXZMCN5Bm4eseNNYTMd
 Y8uxScbJz6uu0j0DXgvMQFqX9/MnfEDGQrQxqynZo+hNL47omRBz3sTJZ4Wz5F3wW8ec
 1jbLfVc1JVD2uWz9hyNA1nm9MYMyCMsPE+gQuD2RbcvsialoliRZJ57tgaD0QKaNzF1r
 5niOuVCkdc84d68X2fTiUbSHwgyVmVqfYpoDzVe3mc0I12PAAxVC3YkneLaWGS8iXdND
 Epfg==
X-Gm-Message-State: AOAM533+69e9tKleW8NrycstZoqIyYznggRnqNVUnrc+pUDS4tDNkjez
 AWSYAUM4PalZeG48qjhq6fwtYw==
X-Google-Smtp-Source: ABdhPJxgvkhohUmXOfIwADicMc4C00T1M/7bW5rhXPq7JAkhqrkRb+v7mUro+Oe02kiGA4DdIjr6qA==
X-Received: by 2002:a17:907:1b16:: with SMTP id
 mp22mr8703212ejc.537.1644770576504; 
 Sun, 13 Feb 2022 08:42:56 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u27sm1529617ejc.220.2022.02.13.08.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 08:42:55 -0800 (PST)
Message-ID: <5cbbc353-0bd4-6bfd-c18a-d2d29d419dd5@mind.be>
Date: Sun, 13 Feb 2022 17:42:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220213155208.560001-1-geomatsi@gmail.com>
 <20220213155208.560001-3-geomatsi@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213155208.560001-3-geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/wpa_supplicant: fix mesh
 configuration build
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2022 16:52, Sergey Matyukevich wrote:
> Consider the following wpa_supplicant configuration:
> 
> BR2_PACKAGE_WPA_SUPPLICANT=y
> BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
> BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
> BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING=y
> BR2_PACKAGE_WPA_SUPPLICANT_EAP=y
> 
> This configuration fails to build with the following error:
> 
> /path/to/output/build/wpa_supplicant-2.10/build/wpa_supplicant/src/common/sae.o: in function `hkdf_expand':
> sae.c:(.text+0x3c8): undefined reference to `hmac_sha384_kdf'
> collect2: error: ld returned 1 exit status
> make[1]: *** [Makefile:1894: wpa_supplicant] Error 1
> 
> Looking into wpa_supplicant Makefile:
> - CONFIG_MESH for some reason needs SAE, so it enables CONFIG_SAE
> - CONFIG_SAE enables only HMAC_SHA256_KDF
> 
> This is apparently not enough. At least HMAC_SHA384_KDF is required
> for successful build. This commit adds a minimal patch for
> wpa_supplicant that fixes specified build configuration.
> 
> Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>   .../0001-mesh-enable-HMAC_SHA384_KDF.patch    | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
>   create mode 100644 package/wpa_supplicant/0001-mesh-enable-HMAC_SHA384_KDF.patch
> 
> diff --git a/package/wpa_supplicant/0001-mesh-enable-HMAC_SHA384_KDF.patch b/package/wpa_supplicant/0001-mesh-enable-HMAC_SHA384_KDF.patch
> new file mode 100644
> index 0000000000..d765c1dbbc
> --- /dev/null
> +++ b/package/wpa_supplicant/0001-mesh-enable-HMAC_SHA384_KDF.patch
> @@ -0,0 +1,30 @@
> +From 08986b7da7e580f5deb570aaa654df38fb23397a Mon Sep 17 00:00:00 2001
> +From: Sergey Matyukevich <geomatsi@gmail.com>
> +Date: Sun, 13 Feb 2022 18:26:23 +0300
> +Subject: [PATCH] mesh: enable HMAC_SHA384_KDF
> +
> +Mesh support CONFIG_MESH needs SAE, so it enables CONFIG_SAE.
> +In its turn, CONFIG_SAE enables only HMAC_SHA256_KDF option.
> +This is apparently not enough for successful build. At least
> +HMAC_SHA384_KDF is required for successful build.
> +

  You said that this patch was sent to hostapd. If that is true, please add a 
patchwork link for it, like:

Upstream: 
https://patchwork.ozlabs.org/project/hostap/patch/20220130074139.2972-1-yegorslists@googlemail.com/


  However, that patch looks a bit different, so you'll need to explain why. 
Also, you dropped Yegor as an author, that's not very nice...

  Regards,
  Arnout

> +Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> +---
> + wpa_supplicant/Makefile | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
> +index cb66defac..c8e53a3c9 100644
> +--- a/wpa_supplicant/Makefile
> ++++ b/wpa_supplicant/Makefile
> +@@ -246,6 +246,7 @@ endif
> + ifdef CONFIG_MESH
> + NEED_80211_COMMON=y
> + NEED_AES_SIV=y
> ++NEED_HMAC_SHA384_KDF=y
> + CONFIG_SAE=y
> + CONFIG_AP=y
> + CFLAGS += -DCONFIG_MESH
> +--
> +2.35.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
