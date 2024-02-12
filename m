Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8F1C4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 14:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98950401A4;
	Mon, 12 Feb 2024 14:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kiw5yXFSOlJK; Mon, 12 Feb 2024 14:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C32A440144
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C32A440144;
	Mon, 12 Feb 2024 14:19:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB2EF1BF28F
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 14:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7D5241D92
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 14:19:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6YBA8Vko_0B for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 14:19:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C47141D87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C47141D87
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C47141D87
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 14:19:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33b401fd72bso2162791f8f.3
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 06:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707747561; x=1708352361;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IgzzBsnqyQF3VBIShznZBBPPvMx/L5PYyB6xyP3AKV8=;
 b=oWkvaa3RkcacSdOV/8terK3Qapzpdhs8AX3vjVDxIP6f7sydwrcPG1AKe4qhJgDBOY
 /W35lnkK5/2qKBIX/+/+3iov7U9ULMazeDKyBVyxrtR5ymdTJew8yo6QLqt2eep70gib
 j9CAcB+jmqcmJvnmKncxrK9JAmq9JwN5yyvsegi5IF3VouZy9rHg5AAWNaew+ELKT2yZ
 SkvD/+tLkBfuyqyLRiyyg3pI5P8QlJucJEtI06fpGp9s2UGO6H8H2Z4udbOUq5tu0nlT
 KvspCaokIgC89oakhR4lF1JytSyuwzmCeQNh+tMibf6rP7KP1WRZQV+QAkC8KDImDumD
 bPZw==
X-Gm-Message-State: AOJu0YwXwQtEr/PAJhaR8kqZrDOwBJ9VjPvCtjkHd7TY3T2qWMbAUGpQ
 aioWqwHtaRb0Zfo9ltQUeh0eI+Yfn+02NJBJ8f+eShWVRtBF2p+CfjRrNJhiH1w=
X-Google-Smtp-Source: AGHT+IF1y5yNj9sbuzCghBR6L+mC8VM8JCqRcSGDDfp4XVmBoxPGhIs8/BuAbI/k873b47BSlL7p/g==
X-Received: by 2002:adf:fa49:0:b0:33b:4f08:ac9c with SMTP id
 y9-20020adffa49000000b0033b4f08ac9cmr4823626wrr.33.1707747561032; 
 Mon, 12 Feb 2024 06:19:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW88pVvkp/i5VgmbgFPA8UgiwH+Kl4bwI6qj6vW82qjs6VqXfs967QsB6e63epDJ0UQxo1S6KN2InJYj0PxKDOtulO/xE9dKUjKFR+Ua+wfhdYfLJSZY3rFZB8Fjqg5vMcBBDlNPmB7/zCjQZsow7WC
Received: from ?IPV6:2a01:cb08:8680:f100:ee18:d70:d8d8:5591?
 (2a01cb088680f100ee180d70d8d85591.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8680:f100:ee18:d70:d8d8:5591])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a056000038800b0033ae50e2c6asm7001625wrf.83.2024.02.12.06.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 06:19:20 -0800 (PST)
Message-ID: <8e198a6f-ccb7-4438-9a0d-e983a6fcc29a@smile.fr>
Date: Mon, 12 Feb 2024 15:19:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
 <20240202093625.1409559-6-antoine.coutant@smile.fr>
 <ZcOpY6BjPUgrj5r-@landeda>
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <ZcOpY6BjPUgrj5r-@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707747561; x=1708352361;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IgzzBsnqyQF3VBIShznZBBPPvMx/L5PYyB6xyP3AKV8=;
 b=zuQJRmdNNPb6eUdnQp1FIYtzOjfw9OLGThCLfWUA83IEBRJow8carrAldUorJQSkzJ
 krhF8RFDk1DKB60OwcecLjoEIiGbc7oV3wEaR2qfrO2nBqtWM8a1vNf5Btd/Tgw4l+Zk
 jHoiU9th0fymCFnovABAWyhNlXW5Hhay2GWkFYf9BHZCGFJbPm8UBv4YcqJ850wq3M3/
 UvgQ305wLXrJ8oosHJF+uss4z1+fZSN+5OudG19LGuP7+CwGr3c6wihlzVDY+Sw+tbe2
 mD2F0EuAJPOT5yRi/nUmhElDZADb//xKYRaG33dk8xDGrqWAjVaBheeNPlxLpd6SgBNH
 hnjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=zuQJRmdN
Subject: Re: [Buildroot] [PATCH v4 5/7] package/opencl-icd-loader: new
 package
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
Cc: sebastian.weyer@smile.fr, bernd@kuhls.net, romain.naour@smile.fr,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,


On 07/02/2024 17:01, Yann E. MORIN wrote:
> Antoine, All,
>
> On 2024-02-02 10:36 +0100, Antoine Coutant spake thusly:
>> From: Sebastian Weyer <sebastian.weyer@smile.fr>
>>
>> With this package it is possible to have multiple implementations of
>> OpenCL at the same time. This package provides a libOpenCL.so file that
>> captures the OpenCL API calls and forwards them to the correct
>> implementation of OpenCL. OpenCL implementations can be manually
>> registered by creating a file containing its full file path in
>> /etc/OpenCL/vendors/<implementation>.icd[1]
>>
>> This package is required by certain OpenCL implementations, for example
>> Mesa3D's Clover implementation if it is not built in standalone mode.
>>
>> [1] https://github.com/KhronosGroup/OpenCL-ICD-Loader#registering-icds
>>
>> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
>> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
>> ---
> [--SNIP--]
>> diff --git a/package/opencl-icd-loader/Config.in b/package/opencl-icd-loader/Config.in
>> new file mode 100644
>> index 0000000000..405dc5401a
>> --- /dev/null
>> +++ b/package/opencl-icd-loader/Config.in
>> @@ -0,0 +1,12 @@
>> +config BR2_PACKAGE_OPENCL_ICD_LOADER
>> +	bool "OpenCL-ICD-Loader"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_PACKAGE_HAS_LIBOPENCL
>> +	select BR2_PACKAGE_OPENCL_HEADERS
> Following on the review of the previous patch: maybe that could rely on
> mesa3d-headers, and if so, we'ds not need to introduce a new
> opencl-headers package.

As I answered to the previous patch review, the headers installed

by mesa differ from those installed by OpenCL-Headers. Indeed,

mesa headers are fetched from OpenCL-Headers by [1] but

nothing guarantees that their version will match OpenCL-ICD-Loader

version. Therefore, the OpenCL-ICD-Loader build fails with mesa

headers. That's why we need OpenCL-Headers here.


I'll explain it in the v5 commit message.


[1}: 
https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/bin/khronos-update.py


Regards,

Antoine Coutant

>
> Regards,
> Yann E. MORIN.
>
>> +	help
>> +	  OpenCL defines an Installable Client Driver (ICD) mechanism to
>> +	  allow developers to build applications against an Installable
>> +	  Client Driver loader (ICD loader) rather than linking their
>> +	  applications against a specific OpenCL implementation.
>> +
>> +	  https://github.com/KhronosGroup/OpenCL-ICD-Loader
>> diff --git a/package/opencl-icd-loader/opencl-icd-loader.hash b/package/opencl-icd-loader/opencl-icd-loader.hash
>> new file mode 100644
>> index 0000000000..1c894f1293
>> --- /dev/null
>> +++ b/package/opencl-icd-loader/opencl-icd-loader.hash
>> @@ -0,0 +1,3 @@
>> +# locally generated
>> +sha256  af8df96f1e1030329e8d4892ba3aa761b923838d4c689ef52d97822ab0bd8917  OpenCL-ICD-Loader-2023.12.14.tar.gz
>> +sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
>> diff --git a/package/opencl-icd-loader/opencl-icd-loader.mk b/package/opencl-icd-loader/opencl-icd-loader.mk
>> new file mode 100644
>> index 0000000000..04f6fb4b85
>> --- /dev/null
>> +++ b/package/opencl-icd-loader/opencl-icd-loader.mk
>> @@ -0,0 +1,19 @@
>> +################################################################################
>> +#
>> +# opencl-icd-loader
>> +#
>> +################################################################################
>> +
>> +OPENCL_ICD_LOADER_VERSION = 2023.12.14
>> +OPENCL_ICD_LOADER_SOURCE = OpenCL-ICD-Loader-$(OPENCL_ICD_LOADER_VERSION).tar.gz
>> +OPENCL_ICD_LOADER_SITE = $(call github,KhronosGroup,OpenCL-ICD-Loader,v$(OPENCL_ICD_LOADER_VERSION))
>> +OPENCL_ICD_LOADER_LICENSE = Apache-2.0
>> +OPENCL_ICD_LOADER_LICENSE_FILES = LICENSE
>> +OPENCL_ICD_LOADER_INSTALL_STAGING = YES
>> +
>> +OPENCL_ICD_LOADER_DEPENDENCIES = opencl-headers
>> +
>> +OPENCL_ICD_LOADER_CONF_OPTS += -DOPENCL_ICD_LOADER_HEADERS_DIR=$(STAGING_DIR)/usr/include
>> +
>> +$(eval $(cmake-package))
>> +$(eval $(host-cmake-package))
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
