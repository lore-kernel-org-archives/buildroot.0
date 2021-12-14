Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3826C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95DCA409AA;
	Tue, 14 Dec 2021 20:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_kc7T35IH8S; Tue, 14 Dec 2021 20:09:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F25F740948;
	Tue, 14 Dec 2021 20:09:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 244E31BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1377E605A5
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c9HU75si96Pb for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:09:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3123160596
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:09:53 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g14so66174267edb.8
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=b5j5uuLYbXtppwBDk8tiyH29bz93xKfLmlQodWnv6Vk=;
 b=gP4iAbNimeRixZS75WGnk63l862fGY1KpfCp2wv4yurBPoDCWTgGDWqmnKN+D7OwbP
 bJKTdQ8GBnfde08kPoge3d9Ao/SVE7Czo9C2sRHU2vTYwCY/CnSk0kMnACPvaTVNtZiF
 h++GPaPVqTf5Gq2kmj6lv1RWBm6o9NGhwkboegJyOG+Ds23jlGt3cEOuQnndBJHzu4/M
 6XCHHbliSCz/1SQnThxtQxpxE17DSmo+A+Y3xyh5lFmlP5SnqwwP3AfoucedlZvrbKyD
 aKomNVMYKWFNsNPMHdCFHqExyJceMjk1I46W2jeWb7WKmoFIfo41VHnZNePkOCZ2578x
 gMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b5j5uuLYbXtppwBDk8tiyH29bz93xKfLmlQodWnv6Vk=;
 b=CQWeMOI5aW2mrwscuQxz5NQOvFtrGepB0nF5q8S2n5FKt8CbvKznsdsQI39XdJVJkx
 hQb46Btv7B6yRGxOg79QcMWw6WVNPMyBBslynhx8Tfz9DlZPDEZYNzgPghsv3YCTeDHA
 pgm/5ixyiAz7fhCNtMS9mekOv8GSgKoLpyuPExtBy2q7Sax5wy3P0D0f0mxMgzh3t4tt
 fJ+X85Z0myir/kUGoUoX14N5L0Kqfa94Tb42G9D0L/DUVGwSCbujUZu0N8tYNG6DjSQv
 z/YO/Jn2dTMORcJLxDc8lJ1Qm0DEj06JQXbgbha/9bb9obqAyEBX0Ldsli87Y6w8y3M1
 TrIA==
X-Gm-Message-State: AOAM532HYELLL5ieGbnClkQ/RjgmNc87IL0Uz0ayCBIP0iHvVUgQdQB0
 PPnpkwBmMDBCWSAe7yPU1a6ID3gBA9GW8A==
X-Google-Smtp-Source: ABdhPJwjag7VPFowOnCboe7yahFZ5N096b1qeUjwjYCSqw1gdFFK6JIEhrUUgYgLOBrGHSMoiiDLiQ==
X-Received: by 2002:a17:907:961d:: with SMTP id
 gb29mr7917467ejc.102.1639512591325; 
 Tue, 14 Dec 2021 12:09:51 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z6sm323397edc.76.2021.12.14.12.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:09:51 -0800 (PST)
Message-ID: <421dbc0e-bbe3-dbbb-a7f9-8481ba1bfecb@mind.be>
Date: Tue, 14 Dec 2021 21:09:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20211214121123.6867-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211214121123.6867-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH] package/json-for-modern-cpp: bump to
 version 3.10.4
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



On 14/12/2021 13:11, Michael Nosthoff via buildroot wrote:
> This release fixes two bugs introduced in release 3.10.0 and fixes the
> conversion of std::filesystem::path. All changes are backward-compatible.
> 
> https://github.com/nlohmann/json/releases/tag/v3.10.4
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/json-for-modern-cpp/json-for-modern-cpp.hash | 2 +-
>   package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
> index 1a98971dbc..eb14d2fd6d 100644
> --- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
> +++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  e0d7c1b120cac47fa7f14a41d10a5d390f67d423d8e97b9d6834887285d6873c  json-3.10.3.tar.gz
> +sha256  1155fd1a83049767360e9a120c43c578145db3204d2b309eba49fbbedd0f4ed3  json-3.10.4.tar.gz
>   sha256  c983d69523377819db3c377b390d5644f5ec53bec9b7c4a0f1ed893bb743d045  LICENSE.MIT
> diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
> index 53cf17d2c6..428473db5a 100644
> --- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
> +++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -JSON_FOR_MODERN_CPP_VERSION = 3.10.3
> +JSON_FOR_MODERN_CPP_VERSION = 3.10.4
>   JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
>   JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
>   JSON_FOR_MODERN_CPP_LICENSE = MIT
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
