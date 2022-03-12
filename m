Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D433C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C88BC60E6D;
	Sat, 12 Mar 2022 20:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lEuNo0bhHtBz; Sat, 12 Mar 2022 20:22:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D3B60E67;
	Sat, 12 Mar 2022 20:22:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBA561BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7F22410AE
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RbKxMN8-wXIw for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:22:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0035410AF
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:22:06 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id a8so26041285ejc.8
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 12:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=q/88i/JE9+sEFBLIuHCfj5bMJjHJV4zoHa64TQp3Xrg=;
 b=EVgGtDohEiyf1jhKv8/ND/l3NeN+VjdkR260NRRZ41CmD7SAjx16tXggQfY8mi41Dj
 frEyJJolZ1pHmIpcACbI2bGk69e2DN2VtANiJWSZAjJBUpAhH7DRndrSJuGbz7kgQCcs
 q/5QQg1CsjAnZgChFB562SqlUiXnQzt6wR2nNGYDv2+uOf5ts1BWBqa+yzMgpAHKCrQ/
 /F0DU6my8EnQxFeWbhvmk9S+q7X8EknnjIYJCoZPJ4ddFuPlswVhkp+3Kahu6dDwQ46X
 4mCa6CEKYbNrMgzXxoqGuhBtAIm3KL1UFHgK8mA4LGtFSegOkzfw811usJzWbTuFmebJ
 JK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=q/88i/JE9+sEFBLIuHCfj5bMJjHJV4zoHa64TQp3Xrg=;
 b=pFaMo20IqdGxdy+4D17sUf+UPUXS04QaY18Gw32BhS3y67+KIMdIjeJRBz404vG154
 6C8WtY+nigP9fdbah4SYJGa9Gh5lnmy7ng75DMaZggfPTHSTREc22aJuruYG5rPBY4ke
 MqX6uvgiVnc4AyLg4EV9flt7GQFKiluu2/+J+ySxYpKSKetBMXGPH3B44kGd1SJMMUha
 mcAMfO//fb7CjGoG8VsY7WDvpr2BZAMu8Dd3ZOl/KLdjIuUZFrK+Qu3wvrawWcomzTZC
 YHXAzdZB8jpPOKgdB2vxYXSHip0JRJS2dmdrwmuqsRc4UdqPOXO1eA8R+pxDrRKmVqSo
 cCgA==
X-Gm-Message-State: AOAM530OzHzNPzRRrEq8Zq/ycRa/P6foSsA+cuoEaS3K5A1Umsq0K/mI
 pJYivNLqR9heBwQao7KkWODW2Q==
X-Google-Smtp-Source: ABdhPJwUZaQ7MohOGWnALjsdk/Y7uiAdMGtQpMtYzIGJHR5whqYK6m2OUFtROlElMrz4JibFBlv8vw==
X-Received: by 2002:a17:906:58d2:b0:6da:b635:fbf3 with SMTP id
 e18-20020a17090658d200b006dab635fbf3mr13118444ejs.40.1647116524977; 
 Sat, 12 Mar 2022 12:22:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y41-20020a50bb2c000000b0041622779c50sm5077622ede.37.2022.03.12.12.22.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 12:22:04 -0800 (PST)
Message-ID: <651e1b1e-aef7-59af-c663-bdacb858bad3@mind.be>
Date: Sat, 12 Mar 2022 21:22:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220224173615.486414-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220224173615.486414-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix musl build
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
Cc: Marcin Bis <marcin@bis.org.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/02/2022 18:36, Fabrice Fontaine wrote:
> Fix the following musl build failure raised since commit
> 6fc5c8e92c1d7997e48b207187d2d3c7ad42819:
> 
> In file included from src/shared/queue.c:15:
> ./src/shared/util.h:106:1: error: unknown type name 'ssize_t'; did you mean 'size_t'?
>    106 | ssize_t util_getrandom(void *buf, size_t buflen, unsigned int flags);
>        | ^~~~~~~
>        | size_t
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/83eaeb3863040645409f5787fdbdde79385c5257
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...rc-shared-util.h-include-sys-types.h.patch | 39 +++++++++++++++++++
>   1 file changed, 39 insertions(+)
>   create mode 100644 package/bluez5_utils/0006-src-shared-util.h-include-sys-types.h.patch
> 
> diff --git a/package/bluez5_utils/0006-src-shared-util.h-include-sys-types.h.patch b/package/bluez5_utils/0006-src-shared-util.h-include-sys-types.h.patch
> new file mode 100644
> index 0000000000..8a5bd64d43
> --- /dev/null
> +++ b/package/bluez5_utils/0006-src-shared-util.h-include-sys-types.h.patch
> @@ -0,0 +1,39 @@
> +From 1d21878d84f16e28e16c61b36799a62e22732d97 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 24 Feb 2022 18:19:33 +0100
> +Subject: [PATCH] src/shared/util.h: include sys/types.h
> +
> +Include sys/types.h to avoid the following build failure on musl raised
> +since commit fb57ad9b9d107856e5f1c8135da04ffa2f7a11ac:
> +
> +In file included from src/shared/queue.c:15:
> +./src/shared/util.h:106:1: error: unknown type name 'ssize_t'; did you mean 'size_t'?
> +  106 | ssize_t util_getrandom(void *buf, size_t buflen, unsigned int flags);
> +      | ^~~~~~~
> +      | size_t
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/83eaeb3863040645409f5787fdbdde79385c5257
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Your upstream submission was missing the Sob, but apparently it got committed 
nonetheless.

  Applied to master, thanks.

  Regards,
  Arnout

> +[Upstream status:
> +https://patchwork.kernel.org/project/bluetooth/patch/20220224173104.479809-1-fontaine.fabrice@gmail.com]
> +---
> + src/shared/util.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/shared/util.h b/src/shared/util.h
> +index c01eccf8a..554481e1e 100644
> +--- a/src/shared/util.h
> ++++ b/src/shared/util.h
> +@@ -14,6 +14,7 @@
> + #include <alloca.h>
> + #include <byteswap.h>
> + #include <string.h>
> ++#include <sys/types.h>
> +
> + #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> + #define BIT(n)  (1 << (n))
> +--
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
