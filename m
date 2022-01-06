Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A04AC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 09:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19F7F428AA;
	Thu,  6 Jan 2022 09:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyHrE-izjDcz; Thu,  6 Jan 2022 09:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BC43428A4;
	Thu,  6 Jan 2022 09:45:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA7211BF868
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 09:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C69382786
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 09:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTrS2eV7kOxZ for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 09:45:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 563D782778
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 09:45:24 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so3379720wmk.1
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 01:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=y/5iV+8LJA/TVRVr1G0H46PMg+DQGdmoN+fUxdvj1Bs=;
 b=E5k71u2KqudYf0OeQwqXRKmX0uVMf/PXiVOba5bKDsGrkEUBqAU8yE3p7orlHB3vPe
 bq9M0N/+xSIHqUd87U9knXXqTpvzZlEwgDMyRdyhOOwIIulhr0cvryYbFsMQEPtrXf3B
 2ZfrW1mvk8zH4zEVXCsPR5Uy02hl/0Ev43boqvX2re+38p73e+Pj9zJsapsBhhsg4TRm
 sCtlM0Gz1lJHJvnfLLlxspuHn6+fsA/ol0dSzAQfRLUE24ATB5nhuhSBiPNZJWRlCTPb
 e95/Jyz4T9whupDA93bwOCDV1mc21xMecFBSsT9iQPrETcg1mvc5xIg0nEscHOw4t6QO
 l7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y/5iV+8LJA/TVRVr1G0H46PMg+DQGdmoN+fUxdvj1Bs=;
 b=L0eOW6N5Zqd6sGq/B3yhOWJLrvb+0PrE2riheswyfGfz2+exjzX6mEqhxxKrbW2cly
 Cb/DCimp8WCXcGOW1bNF9SbtbQawFM710wo6YTSDq2nMNDQFVkJRLe98mNKvUKzaxSDH
 I8MXvzFBH/ceQH25rKy+Rj5VIhxuRQJWuhozbax1l6p23TcV3Ya/Za+Q0+niOACcY9Ql
 Jo89ekHWQObo2AptoxufBQqdHMk68GyofmLWwdyKRtCVBs/DZWwKG6D35zBChJ2k/zVg
 EnFhcyUnl8uiQkRpWlaciVga/a9HxY0rm/n3LTrYx6Jj2t6qYzCo8VEk5D6v0CZFZzV0
 knQA==
X-Gm-Message-State: AOAM532YUiDNwClinfEMEdpEf2ckWLpnhy+E52c+M7A0MeFSzw6rJLDJ
 YhJ0q9hkPc2d51q7eRFdpflqSf/U135IUN94
X-Google-Smtp-Source: ABdhPJza0ysgWhZ8leT8JVDQzbQ6Hp+BjY+HjWTjjFqDHPia6MQzTg6E/H86Z3YSZWAWlsy5PWlZTQ==
X-Received: by 2002:a05:600c:3b24:: with SMTP id
 m36mr6204278wms.4.1641462322540; 
 Thu, 06 Jan 2022 01:45:22 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id u11sm5524026wmq.41.2022.01.06.01.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 01:45:22 -0800 (PST)
Message-ID: <09340549-99c9-b79c-17db-3967b1ab6335@mind.be>
Date: Thu, 6 Jan 2022 10:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Jesse Millwood <jesse_dev@fastmail.com>, buildroot@buildroot.org
References: <37282adb-8559-4124-874d-c1729bd3ce01@www.fastmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <37282adb-8559-4124-874d-c1729bd3ce01@www.fastmail.com>
Subject: Re: [Buildroot] Overriding Kconfig Values from external br2
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



On 05/01/2022 20:03, Jesse Millwood wrote:
> Hello,
> 
> I have an external C/C++ toolchain that I've put together that uses MUSL. I've 
> also built an external Rust toolchain that uses my MUSL toolchain.
> 
> My issue is that there is a Rust Kconfig variable that specifies if a specific 
> architecture supports Rust.
> 
> The Kconfig variable in question is BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS 
> in package/rustc/Config.in.host.

[snip]

> You may notice that I changed the libc depends line to be or'd with 
> BR2_TOOLCHAIN_USES_MUSL. It seems that this does not get considered when I 
> choose my external musl toolchain option. In the menuconfig when I search for 
> the BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS variable with the "/" key it 
> looks like it is only getting it from the original file. Does buildroot have a 
> mechanism for overwriting this kind of setting and if not, does anyone have an 
> idea of how I would accomplish what I am trying to do (make buildroot honor my 
> external rust toolchain)?

  No, there's no way to override the dependencies of an existing Config.in 
symbol in an external.

  However, this was corrected in upstream Buildroot in commit 
d69d40c029dc7d8199b745eaee759d92b66c5d17. So you can try to backport that commit 
instead, or just update Buildroot to something more recent.

  Regards,
  Arnout


> 
> Thanks,
> Jesse
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
