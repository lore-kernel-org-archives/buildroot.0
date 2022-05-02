Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2A0C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 007CF414CE;
	Mon,  2 May 2022 21:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzodUZBPHu6R; Mon,  2 May 2022 21:57:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA8D34109B;
	Mon,  2 May 2022 21:57:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1D451BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0E0460DC2
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zc4bgdrYXN7 for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:57:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6E6060F08
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:57:30 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id y3so30110719ejo.12
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZPzfIIriqY0Yf0kRAVn+KeVrxCxaJ8eTAdi2lKi1hIs=;
 b=DWEqGDL9tNRF98XUDJzuNWwJQ6by4G2VYV52h0tZbCVIvZW7a8mhTSzdkbdx6ThVW6
 nBsf+5uDE/b9OQjr2Y73a6csf+zJQvQHTbnzoyuP6KXrlBJh4RLaxnroatxZ3h1XLCh0
 LQrnbWkDD7hYL1VbBbbsAFGaOrdtzV/imSSzqSIaWrQ0f4R9mdxP5k3EEt9mg11V9Orb
 f+MGH7Wz4rpamG98K6saNEKBMgELV/5x14T29ntvzwInO5pO+aDHPNkS0SAOoZbtYrNG
 2/T5iQ6XgvyShyYOsgI8aefYyi+2BhBHdk1UOOCLDcpY/ie1zaD8j5OiOMTpJcjcXH7n
 24Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZPzfIIriqY0Yf0kRAVn+KeVrxCxaJ8eTAdi2lKi1hIs=;
 b=05kxq/LHXPyqZxBg0cICfZC7HlPzih6dvUZCqRWwQek2TMfKSkas4OYAOOvuVkzNZU
 yicwGoDiGAGbFEql7jovwvgR89gFQ4JDUgRefcEmvnB+5YOFziCBOOiNnsllS/azIVWX
 xkOkmLo6TVONJOP4TIUL6m1YpcUwIUGHge8MCFPbDkhv91MopGTXnMdMDwk/wKiiqU/W
 RMt6GrwvGSDGuzBr5b2m+JIUghRu4qdOTGXPtxdREup5C1WrdanbOaWdZP73F4gruiB6
 JTNa+iqNp6dKv8NbbenF81N4z36dazlDx11kpu9/ncyvGAMQHJn0xB+exC46t18LdFTH
 seQw==
X-Gm-Message-State: AOAM5305tWLX6KrbKzlzmc8CkcWKXfdGT82rjVqU9uxiSKH8znI1EpCk
 qAXWvLb/Rf858doBSao+ro17ug==
X-Google-Smtp-Source: ABdhPJxQNz5VR7mO0Y4ZkAgGOCsznKWtDud82EksB119qEI5sIuoyACcT/mXu8iYY0s09iupvwY0sg==
X-Received: by 2002:a17:906:2709:b0:6f0:13d5:d58f with SMTP id
 z9-20020a170906270900b006f013d5d58fmr13225600ejc.443.1651528649031; 
 Mon, 02 May 2022 14:57:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a056402125000b0041d527833b9sm7170782edw.3.2022.05.02.14.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:57:28 -0700 (PDT)
Message-ID: <e5ad685c-4cbe-0c79-c4b8-e6acf3df7b35@mind.be>
Date: Mon, 2 May 2022 23:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220502170912.412062-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502170912.412062-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: fix build with mbedtls
 when h2-enabled
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



On 02/05/2022 19:09, Bernd Kuhls wrote:
> Bug was introduced by bumping libcurl to 7.83.0 in
> https://git.busybox.net/buildroot/commit/?id=b0b25f145469a14e3d85becf19aaca0a40fd4e25
> 
> Fixes:
> http://autobuild.buildroot.net/results/825/825b0ae84d5212200710628689079ec54a4bda3f/
> http://autobuild.buildroot.net/results/881/8812ffdf42a3adf2df834c4b6e36316cd932821e/
> http://autobuild.buildroot.net/results/3e8/3e840c896e4b8aacc9d784f16a6388eac4178246/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-mbedtls-fix-compile-when-h2-enabled.patch | 32 +++++++++++++++++++
>   1 file changed, 32 insertions(+)
>   create mode 100644 package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch
> 
> diff --git a/package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch b/package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch
> new file mode 100644
> index 0000000000..61cbabd84a
> --- /dev/null
> +++ b/package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch
> @@ -0,0 +1,32 @@
> +From 6eb7fb37d901ed1e4ce07cbd628ee11bf02db1f3 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Thu, 28 Apr 2022 17:11:50 +0200
> +Subject: [PATCH] mbedtls: fix compile when h2-enabled
> +
> +Fixes #8766
> +Reported-by: LigH-de on github
> +Closes #8768
> +
> +Downloaded from upstream commit
> +https://github.com/curl/curl/commit/6eb7fb37d901ed1e4ce07cbd628ee11bf02db1f3
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + lib/vtls/mbedtls.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
> +index 64f57c5d8321..5f9b87e6b75b 100644
> +--- a/lib/vtls/mbedtls.c
> ++++ b/lib/vtls/mbedtls.c
> +@@ -815,8 +815,8 @@ mbed_connect_step2(struct Curl_easy *data, struct connectdata *conn,
> +     if(next_protocol) {
> +       infof(data, VTLS_INFOF_ALPN_ACCEPTED_1STR, next_protocol);
> + #ifdef USE_HTTP2
> +-      if(!strncmp(next_protocol, ALPN_H2, ALPN_H2_LEN) &&
> +-         !next_protocol[ALPN_H2_LEN]) {
> ++      if(!strncmp(next_protocol, ALPN_H2, ALPN_H2_LENGTH) &&
> ++         !next_protocol[ALPN_H2_LENGTH]) {
> +         conn->negnpn = CURL_HTTP_VERSION_2;
> +       }
> +       else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
