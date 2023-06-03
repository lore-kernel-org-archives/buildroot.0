Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EAEC77B73
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6059641DD9;
	Sat,  3 Jun 2023 19:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6059641DD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjvIx2w2Gz8t; Sat,  3 Jun 2023 19:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34C7741DD2;
	Sat,  3 Jun 2023 19:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34C7741DD2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 564BF1BF487
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CCB741DD2
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CCB741DD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mFw6GhlNQ5BD for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:21:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE4F641D82
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE4F641D82
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:21:14 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51475e981f0so4725243a12.1
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 12:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685820073; x=1688412073;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NOGpXYMupwVDO94dUHgUkxOFBffGdQsXKV8owTZl0rc=;
 b=UK+IvsWFHb9wUnxSVlDTcEXCGeanJE3DIrF4hvYk4uPV8ohfnfDIX+SRCqNZDcbxzT
 lC6ZHI7tOVf8yKhHCqLmfP3wEFYtXW2WiYZne1nexLdtNPWszGXiOJwNP/ZVHnkO+3nH
 DtPucxEckK4mttoqvZtxOlZtw0+bkO5/aV0TFTvO8WNiODQzYv4bk5/LP7jmOyXy11CN
 WAefR2uclv+VOYwc3IIyil4c8RJy05zeRSW8eEW3YUFRHUCp0QtuCS69npg3kHCXnEqB
 d1OFiKigt5cL77paoDa72iqotXAwZQg6zEhk7Gr9YjveJbgLti3Qtw6TzyzP0xBuD18J
 NaJg==
X-Gm-Message-State: AC+VfDylOuou2RrDh2NZwu6vDpiQvzUPZ8U8fJ6UYmFCNQcb+byeOv4x
 rfkth+ZynCiiUNAU1ux8YHj9HA==
X-Google-Smtp-Source: ACHHUZ7RrDijEe/s5zp2Z8M3ujxBTG0vxhBsym2aWPHoEtk14Dx3smXo62jEPxjbBe8UXZj26hYDOw==
X-Received: by 2002:aa7:d0c4:0:b0:516:2e27:d845 with SMTP id
 u4-20020aa7d0c4000000b005162e27d845mr4337895edo.39.1685820072973; 
 Sat, 03 Jun 2023 12:21:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 r6-20020aa7da06000000b0051631130dc9sm2052496eds.54.2023.06.03.12.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 12:21:12 -0700 (PDT)
Message-ID: <510ba693-7acd-74cc-8f8f-c961fd34d20a@mind.be>
Date: Sat, 3 Jun 2023 21:21:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230524131642.88902-1-romain.naour@smile.fr>
In-Reply-To: <20230524131642.88902-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1685820073; x=1688412073;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NOGpXYMupwVDO94dUHgUkxOFBffGdQsXKV8owTZl0rc=;
 b=SKkjPdAF+Mf2MwsTX5/j4K+vW0hc59XPgnOwV6pfQbL4qXk/A0wre0vsU40Aem9jSC
 a8gUjllniq/RbM2MH3KwN4ZfzVvrZ1jeOjBPrHW/YWRELPM576nm7dkZT6U0rdoul1GS
 UQkYvKrzJ+RfgHHS+dxAxVooCwlC6qE0ZwDb9dFRpPafrnsYPVt+GBxc/8SYCAthNx5j
 Uso8RuO3JI/Gk3ldlsIHcy8WacmmQAUjm7Tw6qMjJO4il8q62wD5QJ9zwEisWT5iO8Ed
 2atecv3m4PU7RrAlTSNCARwRiofaKcvKUfA773A1yMAzsLzhDZw9h8h81dNzkhS1uX4e
 WFAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SKkjPdAF
Subject: Re: [Buildroot] [PATCH] support/testing: test_clang: update to the
 next LTS kernel (4.19.x)
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



On 24/05/2023 15:16, Romain Naour wrote:
> The kernel 4.16.7 curently used by the test doesn't build with host
> bison (GNU Bison 3.7.5) probably due a missing fix [1] in 4.16.x branch.
> 
> Since kernel 4.16 is EOL, bump to the next LTS kernel (4.19.x) in order
> to ease backport to previous Buildroot releases.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4114986744
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=d59fbbd09d5d6bdf4ea1f0b4090d175e081ff421
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

  Applied to master, thanks.

  We should really create more downloadable kernel and rely on those instead of 
building the kernel during the runtime test. It takes a lot of time with no 
merit. Unfortunately, those are on abo which only Thomas has access to...

  Regards,
  Arnout

> ---
>   support/testing/tests/package/test_clang.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
> index df3990c6be..f36faa059a 100644
> --- a/support/testing/tests/package/test_clang.py
> +++ b/support/testing/tests/package/test_clang.py
> @@ -14,7 +14,7 @@ class TestClangCompilerRT(infra.basetest.BRTest):
>           BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>           BR2_LINUX_KERNEL=y
>           BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.283"
>           BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>           BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>           BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
