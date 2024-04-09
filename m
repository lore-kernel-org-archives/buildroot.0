Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5538ACD1284
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 12:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E924B4019A;
	Tue,  9 Apr 2024 12:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90-2EBJ1wfzj; Tue,  9 Apr 2024 12:23:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0465B40420
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0465B40420;
	Tue,  9 Apr 2024 12:23:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B75101BF315
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 12:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3E6540625
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 12:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8A8Rdb_ZVO9 for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 12:23:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D84A405A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D84A405A2
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D84A405A2
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 12:23:53 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d47a92cfefso69877821fa.1
 for <buildroot@buildroot.org>; Tue, 09 Apr 2024 05:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712665431; x=1713270231;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HfxFnjhaaTRbbpDqkDPy9Pr4hO4OvE8+WfRP79RpnwI=;
 b=jq7QM6BFH9oKEmyTZxRryxWO6kPYNI1C78/MOhnprUKWuT7Y4+o/IxIv1yoH1f6myp
 NR2AtowPNCUjBUXwR+d6vzNftxeUG9HdrWH2krC6zOtB386HBmXppGRAHBc7hkJs8vQ4
 gCWtc2NIXDlwb7VMiGSp/dpnZT5neXUKZ+Vg1Ws0kjqhpjJj3BOMRflOWTdP1Tqydst2
 vhVte8zdcf5Iqi6P9XFyqJ9UzoCr0F3d9gc83oCJSZ/TJ1lpWkRsBLSuBbQ7YrIGdzey
 4d470laSsl2bfnDO06HUs3QJPyAkBs1Yd2gbXoIWrKmEaRV1n9cGx80ipI62pZTj9GUj
 7d9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO2VLx7h3BV043q4SfCFh8x8ObFwn9N5FRQ4bWHvpa0pkHhLd+gTEQn101X7+/Cu78fQdLBWS+bZVdVcDdhqz35hfy9qkUWQ==
X-Gm-Message-State: AOJu0YxBArUmnDW60wr45gamUTPbE4rmd0Plac9jllLaEbvRHbhuso2B
 1plLVo6/DxI2m/RLjGDhHY5t+keACO9VXv7iWD9oYhmP6pAxu1+GsmV/JF5Rk/wGjkqqZ+MT5sx
 d
X-Google-Smtp-Source: AGHT+IHLma0R/mfCzUvz56KXMeQWksZN3abAuLnBDN4T31Tn7QUNZ2cGD148xv9ZcwdkxNTxMk6GSQ==
X-Received: by 2002:a2e:22c6:0:b0:2d6:d8a3:8c08 with SMTP id
 i189-20020a2e22c6000000b002d6d8a38c08mr6774009lji.12.1712665430654; 
 Tue, 09 Apr 2024 05:23:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ju8-20020a05600c56c800b00416253a0dbdsm20233225wmb.36.2024.04.09.05.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 05:23:50 -0700 (PDT)
Message-ID: <103fb922-5b18-4b5c-84d3-ea550ade5afd@mind.be>
Date: Tue, 9 Apr 2024 14:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240406154308.3336009-1-chinhuat@gmail.com>
 <20240406233701.036e7ca8@windsurf> <ZhLcHN3heQjqZvCD@NUC7CJYS>
 <6e119079-bbae-49dd-b3f7-f8117e8a201e@mind.be>
 <20240407231146.0b9fcf12@windsurf>
Content-Language: en-GB
In-Reply-To: <20240407231146.0b9fcf12@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712665431; x=1713270231; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HfxFnjhaaTRbbpDqkDPy9Pr4hO4OvE8+WfRP79RpnwI=;
 b=W3ot8b/a3Rj5gXhKSFQrVOcJYw2bpkhK+2zWT7sAUUL/db9pe9o3g0SadOjBNl/F/4
 nx1FfmCbI7y5uIMqppq90v1ULfsXJ/IuY7ry6/ZGqnqw1fSot8D7rqvbQRZNCnMps/ID
 hoa362GSMXYVcvID6EAr+EPN5DcV/fayXPqUqN/Q1clVV7fi0SvkXj0CoxC/DRz/HM/i
 DYSvYWUPBbzTiH1s97i6RUfX6TrWRChTLj/vQkXszbWFgckMTin0crBa1Z0a84TLjkM1
 I1KwJcrmR9zWpl4TDn+wj7e9tMurbj/f/OZxR4ldLRzohq09xIzU83jY+udnEevv4An/
 st0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W3ot8b/a
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to version 1.0.47,
 add Y2038 config option
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
Cc: buildroot@buildroot.org, Chin Huat Ang <chinhuat@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 23:11, Thomas Petazzoni wrote:
> On Sun, 7 Apr 2024 21:30:09 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>    IMHO the question is if uClibc acts like musl (i.e. unconditionally enable
>> 64-bit time, which breaks binaries that were compiled with 32-bit time) or like
>> glibc (i.e. the compiled library supports both 32-bit and 64-bit time, and
>> applications use the one or other version depending on _TIME_BITS).
>>
>>    I _think_ that uClibc acts like musl. In that case, passing -D_TIME_BITS=64
>> doesn't make any sense. And therefore, having the option at uClibc level makes
>> more sense. However, I don't think it's very useful to have this configuration
>> knob in Buildroot's config. What I would do instead is to unconditionally change
>> our bundled uClibc config to enable 64-bit time, and let people provide their
>> own config if for some reason they don't want 64-bit time.
> 
> If we go this way, then we should also do it for glibc, and drop
> BR2_TIME_BITS_64.

  glibc is different though: it always supports both 32-bit and 64-bit time, and 
you have to supply the -D_TIME_BITS=64 explicitly. You can't force glibc to 
always have 64-bit time, individual packages will always be able to override it.

  On the other hand, in uClibc, it _is_ still possible for a user to configure 
the library with 32-bit time (only). We just default to 64-bit time.

  We could unconditionally enable -D_TIME_BITS=64, similar to how we do it for 
largefile. But that's pretty much independent of what we do with uClibc.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
