Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B082BC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79F2A404ED;
	Fri, 12 Jul 2024 20:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NaqjMJ6W6HKQ; Fri, 12 Jul 2024 20:12:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CE7941A2F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CE7941A2F;
	Fri, 12 Jul 2024 20:12:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D256C1BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB63C4011F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHuBsPW9yA2c for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:12:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72E8B404ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E8B404ED
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72E8B404ED
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:12:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-367a9ab4d81so1424004f8f.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720815156; x=1721419956;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZrRb+T5o9tsckiEGI5CRvZqXLG7HaxX0Edp937ykg9Y=;
 b=ZQ2wtkpS6xQAZLVOKVrsVjO48R/UQTWUPvw/Mt9Ju6GMKmmnpbheYmlxAE+Tn7x5T8
 LUM4QzFVPDtHVEpAsEWU61NFJNeQ5xHaWuRpISua3/wSWehGuK8q0Had0qZYKNv8hE/1
 ATdmi308GOpAaXALtIWEPs+1SP6rhOKkW5KxfqpmVBC/zeKELF2m3vVYhIVZtF0aUnJ1
 OkCShUErCpZCAtW+lB6EzO93KpHg5Y3cFPzWL3Pey+5bXwdDkLBejY4aokyeSJZPBg0X
 Fppjgs8u+yl2b4BbZ7Zqowrn8Xv63FqN6cNZeLx4y9kq59mgc7yWVKHTXO9ZaJhVeN8a
 J0Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI4w/xxMaZqiTEfYNloUbSUWLgsPXK1uEgTMVlnw5IKbfG6oPvB5RGBxKcUeR561o6Sk5DR8kUqFB0oJqHX8vzZZTtewZ/5A==
X-Gm-Message-State: AOJu0YxcfS0cOzkTV1MgbH+8l8g4WQ/w3ZrxbSkPM/xwgVGR/hAXtgxH
 kGBsq0u3/66W2vjWz+tMuqpMJIHf+TnvNTJ44HiN9YbD5hd9h2ec0s0z7zNZsJIBw2Dl5e+O49N
 zrgw=
X-Google-Smtp-Source: AGHT+IE5WMVMxonsqxi+48pP0r4mneknGehI+YmzM2ONMLkJSZcmhRNczRIkwGdae264+TMLf5vHvA==
X-Received: by 2002:adf:fcce:0:b0:367:909b:8281 with SMTP id
 ffacd0b85a97d-367cead9313mr7585249f8f.59.1720815156456; 
 Fri, 12 Jul 2024 13:12:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab80asm10848349f8f.109.2024.07.12.13.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 13:12:36 -0700 (PDT)
Message-ID: <e87e2b6d-7591-43e9-ba17-b0d99bc869e2@mind.be>
Date: Fri, 12 Jul 2024 22:12:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230916142256.384319-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20230916142256.384319-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720815156; x=1721419956; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZrRb+T5o9tsckiEGI5CRvZqXLG7HaxX0Edp937ykg9Y=;
 b=P87jGSYCtk3aX4yS2rDzuPua8t770hoVyNgnwDcsCOUUC4aVAxNHliR+91Z3HG5HXT
 8wTdfjM1/959W9BUYu8xXb6upJgUw5wrrmhMmnBKGhz5VMPAWUyV3gQB37Ql6fDt6/F+
 mnXX6Me521crNXIkvuWYhZoiUlaZWKsgWxsmzMK+yhT6z2HwbQI6Hwlmp9RhAyn8/rvM
 PluV7kgmGCMZMNO8YsI3xv3T/7DvOtQpkNYzTrvbATPusjEEnsU3DA0tzoIpivfp3J0x
 O9My0JwR/lB6EZLhYJAc8YaafGo1EpVQoziX5AL/BsSY+k7hXGeLLyy/zd9NDySV0J1b
 aYRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P87jGSYC
Subject: Re: [Buildroot] [PATCH 1/1] package/check: disable static build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/09/2023 16:22, Fabrice Fontaine wrote:
> check can't be built statically since switch to cmake in commit
> 6dfc789f4f21367bc5f4b5454db0922821a765bc:
> 
> /home/autobuild/autobuild/instance-2/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/12.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: libcheck.so.0.15.2: hidden symbol `__fini_array_end' isn't defined
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/0d6/0d6fcbedef29bf0d6a1d9ecb8e4d82b4ad06cfa8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/check/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/check/Config.in b/package/check/Config.in
> index 2312fbf81c..a3a7ff1f11 100644
> --- a/package/check/Config.in
> +++ b/package/check/Config.in
> @@ -1,6 +1,10 @@
>   config BR2_PACKAGE_CHECK
>   	bool "check"
> +	depends on !BR2_STATIC_LIBS
>   	help
>   	  Check is a unit testing framework for C.
>   
>   	  https://libcheck.github.io/check/
> +
> +comment "check needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
