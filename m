Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1DEC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 578EE60F2E;
	Tue,  3 May 2022 20:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWf0putalZAV; Tue,  3 May 2022 20:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DD1F60EAF;
	Tue,  3 May 2022 20:27:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4927F1BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33EA460EAF
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6tpt-1trMbvX for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:27:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04A4360E87
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:27:12 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id j6so35525538ejc.13
 for <buildroot@buildroot.org>; Tue, 03 May 2022 13:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=seXurFc+tAWY9sdm36VwetyyHYAQ5Q/oSHJpHYflfdE=;
 b=IXTL7Eas1kKvFQhwf7wRQ42joUrAYa75sliE2qnU6iWq9Lkduv0miRywZAc/ytfTnX
 QxDHNarDxKaCSZzBlSpupOG+oHulTAEIdlWDMOq7cuCbWXBWhglQ0/aaE00aMDgSUKCK
 5xLzIF1NtTdJeEMPIw2qX8GtVpsWldpvailnAHcXRV4ij/6RFY2o5u2Q5wGr+vbbR929
 nre70sKKyh1IlUOgy7SB+a2QnF8VMArHoLbX7ceZ04txL2eKB3yheSmxWJrpdf1Pi6Ow
 mpX+/XozqhsoJPlyKMcKs9cAJM/ReOnoHgdZcQx5FamBV8+HQ6dmdwljvF8APBBrksNU
 CgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=seXurFc+tAWY9sdm36VwetyyHYAQ5Q/oSHJpHYflfdE=;
 b=WoUYyeSBQg3vRcGzeiCDCA/+vRnNVBHTiC/7YyU4p8GEdbFkR7a1Uge5YNxSpQ5h9R
 9lHvKF50d/2KtFck3k5bivNjx5GEhyQX9+JTGzQXHX9J8tFcCvaj6CbwVhbtQgkauB27
 GzHzGFOVo1MADe3s3KoJeJEAZ7b5v0lBav21DuCP0rU3hyvpKotaiYMhFnrOKbSKKC9R
 6ixNZ8jwRUDs3q+vrcte/mXjlulU4AsXs5l8eauAP65Z/lYNulYK88AQnfCchQOnlqhj
 Y1lHC2GnVsMBRSHpkS/+SwcF0A1BEo6fgD2DkqvP42WXIPqbxYWWemyGYh6hhDPz8Ipf
 c8xA==
X-Gm-Message-State: AOAM5334/0jfY6Gwd7Uli9LilG2zTx6eMdhUWLzW9BVIXRq4QKQWfjO5
 sOMRf9kFf57DAF33WKfVqwyh0g==
X-Google-Smtp-Source: ABdhPJzT1tkIwEk3g8N3OzBU7/pCYlSClzCaSJp6TIwtuTDr9DScDQ1J3hoE0sbr6dzaUEUEjpyJOw==
X-Received: by 2002:a17:907:3d89:b0:6f4:7e66:b500 with SMTP id
 he9-20020a1709073d8900b006f47e66b500mr5739122ejc.134.1651609631042; 
 Tue, 03 May 2022 13:27:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gv19-20020a1709072bd300b006f3ef214df4sm5027176ejc.90.2022.05.03.13.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:27:10 -0700 (PDT)
Message-ID: <8d65e380-2cef-1387-811e-31d616d7e5dc@mind.be>
Date: Tue, 3 May 2022 22:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220503163008.3959966-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220503163008.3959966-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/aircrack-ng: fix build with
 libressl >= 3.5.0
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



On 03/05/2022 18:30, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since bump to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> lib/crypto/crypto.c: In function 'calc_mic':
> lib/crypto/crypto.c:203:2: error: variable 'ctx' has initializer but incomplete type
>    203 |  HMAC_CTX ctx = {0};
>        |  ^~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d8444dada84a54205273ac627d3e4f4692a55364
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...rypto.c-fx-build-with-libressl-3.5.0.patch | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch
> 
> diff --git a/package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch b/package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch
> new file mode 100644
> index 0000000000..da1549df5b
> --- /dev/null
> +++ b/package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch
> @@ -0,0 +1,35 @@
> +From cbfe47193bbab1f82fafb4b83c3d159a0f1fe03d Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 3 May 2022 01:34:41 +0200
> +Subject: [PATCH] lib/crypto/crypto.c: fx build with libressl >= 3.5.0 (#2310)
> +
> +Fix the following build failure with libressl >= 3.5.0:
> +
> +lib/crypto/crypto.c: In function 'calc_mic':
> +lib/crypto/crypto.c:203:2: error: variable 'ctx' has initializer but incomplete type
> +  203 |  HMAC_CTX ctx = {0};
> +      |  ^~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/d8444dada84a54205273ac627d3e4f4692a55364
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/aircrack-ng/aircrack-ng/commit/cbfe47193bbab1f82fafb4b83c3d159a0f1fe03d]
> +---
> + lib/crypto/crypto.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/crypto/crypto.c b/lib/crypto/crypto.c
> +index df2c1bf41..52bc5e5ac 100644
> +--- a/lib/crypto/crypto.c
> ++++ b/lib/crypto/crypto.c
> +@@ -196,7 +196,7 @@ void calc_mic(struct AP_info * ap,
> + 	int i;
> + 	unsigned char pke[100];
> + #if defined(USE_GCRYPT) || OPENSSL_VERSION_NUMBER < 0x10100000L                \
> +-	|| defined(LIBRESSL_VERSION_NUMBER)
> ++	|| (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
> + #define HMAC_USE_NO_PTR
> + #endif
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
