Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933A5C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 21:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17C7C8118F;
	Fri, 25 Sep 2026 21:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGjt34FLo7o9; Fri, 25 Sep 2026 21:09:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4FB9181325
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790370561;
	b=fQ8sbr2Ksg6yPlzCQ7BpWYn94X9b0TycnAsu+qUzkQNrFVX9RrxLh5Xl6u60/jNfOrBn
	 ydeTDj/UHVg6ZIAI7aaIJU1918kcplZeypj+prVlaLHlcjOLQD5d7Yu6UG4aNHRiaUPoC
	 FpOPtvx3afDzRwA4sCfCAlxH7AKB1HluQdeT46+XfUZaLfmNuDW5W8oluOhWZ8t9FJGu0
	 psCcXX4uF4g37Qr8by007AFHulZwlncux/jQeqjwOzC3uLlvxr+kqdnoq9uNfBC269Oeq
	 njLk69FYV/S5UJ9bnz4tA7+a8QtLCiX9qfihFgLPhVDcRq1LJTW3SnBcPo62pwtHhEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790370561;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=lOg0yPI/awHFs95ikLIGBcsQimpLH5oHk2r8CxI7eU0=;
	b=W7Tdw4wKaqIxS1mK9y+ub2zOukeAinxPNG/RHjlBI+IterDol6E3FkSTgCBBg3vP49v3
	 1//BLCJnHrnSLRsnhzsE90ZS2x2UX4bJoBaEJ+C+E0uCbzXdZs12wxGWxE3tnqOsHLBYJ
	 Joz5qLqwfQl6vEXRwIy3hVfac1JCB9OZlfTeYaAS+bJVDI/6uB+LaIHFLCa4meodl8xzd
	 huxAxOFB+GIRgxwJOcd0yMBEemI7kRFssisYZRSBxZzlyXcfSD1FpKP2Hi/TnaIUkG2qd
	 uea8zY5eLus9DyXs1SqphGnTw8lvtJZG9/rESRi/cVz8UWRCOuG/LDu5BejsA45xSqg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790370561;
	bh=lOg0yPI/awHFs95ikLIGBcsQimpLH5oHk2r8CxI7eU0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=T2GxuBkryNDMLgrKqWE8pwraFEINw7I7xI48wogjVRdOWgLDiqWO56hB88TVy6Qax
	 bNGrvD7OjWU0k8gN/HllU5Bhgyhya0+N5e+GgPUPkYPYUAobNmfb7WcG5tU52D4hIm
	 d32muf8lhDMWdsPUmpjJkG1sXDayDVur+WXBsSp4ydyzoiiZLHZXpP+5BnqLQ4Ywce
	 VE0jGaBhRr+pVuC9cf2xipA1pnk+4rAqjQaYkVLWEhAwiYp19TdgREI29+nY3P7Cg5
	 azVuyJfOoixj0BAHd5Q5Ag/GNeGw/NudyEVH16uY8NzP2zfPD30e1/3NPJDYN/bw64
	 yKd00JiIPZ2Bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FB9181325;
	Fri, 25 Sep 2026 21:09:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5E63F4A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 21:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B25D040B84
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 21:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCP4OlO3SG_X for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 21:09:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C203440B71
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790370559;
 b=MzqM9gF58g1zeFiufXCAlfyNnrXS17pac3ltYWMsl7i9I9FSVqzitCiHPx2kEVZQGe6k
 km9Lwv7uvjxwPJ197p1DxjGLRo104+RdroopgOV6t54uMFzEU25yA2tV/N6WlQzDu3cJI
 ZZd6g6OSInTU/XQbQv6I7TX+gj4N3fVsMCqBkLFCIt5byslRDpoods56YltDdVlGgz9EE
 8scFtgLEyhCpIZciqLShjfNyAIyAe3edR13MvGqSB4qW2iD9Fpr4B3CLofyfJI+QmwHnn
 vCPGQh6T3rw2YbB+S9hiHTkZLvpHzjk/DdLQgv2DWPqlPc4U18pbauQTjAtO0KcNaPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790370559;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=wq4N7+b/Fwc8jNCBZ2YZn97HhVEhKTct8rRMAuGQSe4=;
 b=fp1ib1R5sJXeehuxCPP6ogPu3E5XkNplxB9fLO9SlxS5mOBVGCiw4GTB3hgLbBNEsJ1F
 oFTkpDmBTjQJ5a9dP/L/wWYeNyd1a8K8KOVHiC6ipazUZ0oeZwMQf9gp8sJTAjWlx4GCI
 j41zuS57K0/u6rp900TKP7XyvrcQAcW6uPd6FmQeulwGbCL2We60Bl9kxbgQNasyOVoud
 fG9NOTVDFMNpCVTu3+kYleQXvQ7tOqcRvrwLeEI2AxI06UEycOKmFCP59p9PDMNMU4vHx
 9Dy0aaXfxDwh6kqB+QhF/Tz9vm9SnSBf3pgPUjMjtMtrWJOeCiwNyz8+rY4pT9TmNrA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=RYm9Qc+U; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C203440B71
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 21:09:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH9Y-1wbzLE0Ng4-00jVQ2; Fri, 25
 Sep 2026 23:09:16 +0200
Message-ID: <9dc406bd-a684-4114-9b49-7d4787c108d9@gmx.de>
Date: Fri, 25 Sep 2026 23:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260925195847.3565381-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260925195847.3565381-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:AitUE7OlTqZ0leacX8DEzoHu4RYk4+wj3FUHoRs0eNPtJLQPq9O
 KMvuKxWP5yE+ZkA1DC6ieNEfB9nSBDEkm35JO4lFcE+G7IxABJFeq3pB6iCTi20ttespVKB
 ASOuUG6M9T237paRqI12J/w6a93If0cThj/aJ+YJCN++NdgEIBa3VG9IsTYPY3FLd/WdRcS
 IekmXJ+o3fPOxZfH4YlPQ==
UI-OutboundReport: notjunk:1;M01:P0:JPVAhIZ0HXQ=;SOzDmD44mbH2xDo28tcvSZa0ogq
 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
 M8aQcb6O7P0gSMBOQ==
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x,
 6.18.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 25.09.26 um 21:58 schrieb Bernd Kuhls:
> Update the latest kernel releases to:
> - 7.2.7 -> 7.2.8
> - 6.18.53 -> 6.18.54
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
>   linux/{7.2.7 => 7.2.8}                     | 0
>   linux/Config.in                            | 2 +-
>   linux/from-6.17/linux.hash                 | 4 ++--
>   package/linux-headers/{6.18.53 => 6.18.54} | 0
>   package/linux-headers/{7.2.7 => 7.2.8}     | 0
>   package/linux-headers/Config.in.host       | 4 ++--
>   6 files changed, 5 insertions(+), 5 deletions(-)
>   rename linux/{7.2.7 => 7.2.8} (100%)
>   rename package/linux-headers/{6.18.53 => 6.18.54} (100%)
>   rename package/linux-headers/{7.2.7 => 7.2.8} (100%)
> 
> diff --git a/linux/7.2.7 b/linux/7.2.8
> similarity index 100%
> rename from linux/7.2.7
> rename to linux/7.2.8
> diff --git a/linux/Config.in b/linux/Config.in
> index be3fa803cb..291d41b897 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "7.2.7" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "7.2.8" if BR2_LINUX_KERNEL_LATEST_VERSION
>   	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
> index 7ed646686c..d5e874c113 100644
> --- a/linux/from-6.17/linux.hash
> +++ b/linux/from-6.17/linux.hash
> @@ -1,8 +1,8 @@
>   # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
> -sha256  4ac34c47db2540ffb2713943f8d891ff1702e0ba6934525a493b7d1cad43145a  linux-7.2.7.tar.xz
> +sha256  12e8d5a973d1ad7c5a5c69882e4022b131ed715db7003fdcd760ddf8c3e51941  linux-7.2.8.tar.xz
>   
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  4d6fba95c2244b08a7b4144a4d38b9be4fb31abb5e7682ae40bb5cb11374cfe0  linux-6.18.53.tar.xz
> +sha256  9df30b02dd8102bbd0be52556288ef6889ddbe7f1ddb96fbf847d0becf3eacac  linux-6.18.54.tar.xz
>   
>   # Licenses hashes
>   sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
> diff --git a/package/linux-headers/6.18.53 b/package/linux-headers/6.18.54
> similarity index 100%
> rename from package/linux-headers/6.18.53
> rename to package/linux-headers/6.18.54
> diff --git a/package/linux-headers/7.2.7 b/package/linux-headers/7.2.8
> similarity index 100%
> rename from package/linux-headers/7.2.7
> rename to package/linux-headers/7.2.8
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index dfad885f1a..88ee7ab17a 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -481,8 +481,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
>   	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
>   	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
>   	default "6.12.111"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.18.53"	if BR2_KERNEL_HEADERS_6_18
> -	default "7.2.7"		if BR2_KERNEL_HEADERS_7_2
> +	default "6.18.54"	if BR2_KERNEL_HEADERS_6_18
> +	default "7.2.8"		if BR2_KERNEL_HEADERS_7_2
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
