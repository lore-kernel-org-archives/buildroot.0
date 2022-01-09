Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0D4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 07:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C134840360;
	Sun,  9 Jan 2022 07:27:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Izo31SYU9maI; Sun,  9 Jan 2022 07:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B98140295;
	Sun,  9 Jan 2022 07:27:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DC301BF473
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 07:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 614CC402DC
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 07:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ogAgGfOK-ptD for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 07:27:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54847400F5
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 07:27:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l25so9582766wrb.13
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 23:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2oyc0euA61HVnNJIm5JXsJYzfnaqf1kyg9z30RsIMWc=;
 b=hk9qguaJeqWdKRqJuNdGSYPLwzhAXYPz7pu/oON+Lo9yd3ej7Ep+mI27mAbnWuXl5d
 tqzwvN8X7u/deC7KWwmAJr/oA5RGklXIzmI62SxjUGnsW8k/t4Lvu0Jg+9HsB2Srs7h5
 5Uhx7NTonOCij1ksc6kOevu/UX+aP5SB7qU4K2Awjh0RY6X8JmSgA7U9UWvN/mykHj9H
 9vl9dVGFKISh4kkfhOW4K+O1K6/FzV1rYKvhg3E0akLtf8LcGU7U/yJAn9LU5rA2c91I
 JEcA7nEkXjm9u4WuMfQ27qOBVG742DK9Ff8CtOsCAs+P1uRPvm432vpjUQKw6O0LOJBH
 LceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2oyc0euA61HVnNJIm5JXsJYzfnaqf1kyg9z30RsIMWc=;
 b=uC3C7FgPKSMwIjFFrlsQ1rAZxhRRlYCidu0aMomggJtUi47rrXMIVpLOYfw6S29tSd
 j649T/DQLc0l7vuvPxLqqyebSTS5yPVG3R0dxw73Y7INiTmCvlFw7UZ7APSR6NE6yT2r
 oMz52JOVgHplYmrDy9Q1W/7xWnaNs//yutTlx4alSkvD++miAZsprKjHRHpohf8PaMQI
 86A5duRpAzpng8JTUF/DIstv+D7RyyJGsPX8EHDe+DiYmkOv2UbTy0Sg4f7pYxIOlHFG
 5KYM8QRQunf28N3Nqq3uCAjAKOzz1viAXJkR7KOj1cvzgYkyKRO3c3UH0eizKpfpS/9n
 HrCg==
X-Gm-Message-State: AOAM531is7zZxuUSGY1liSMX+usRKRB898kcTMO7I5l9XWCLF7r7/FRj
 UIYwGO7Ejno+BjkCfJdnYimXvA==
X-Google-Smtp-Source: ABdhPJw8b3+GRX+lQcC/Zgy5Yq+BqpQFBhviogjsQG/vbveyIE6zgP052ZgEXLncdUVuP2rkoeEoBw==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr58405887wrz.666.1641713231328; 
 Sat, 08 Jan 2022 23:27:11 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id j11sm3507343wrt.5.2022.01.08.23.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 23:27:10 -0800 (PST)
Message-ID: <d54507f8-49c7-5079-fb2f-e942de33b525@mind.be>
Date: Sun, 9 Jan 2022 08:27:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220109064406.122409-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109064406.122409-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] core/pkg-utils: add missing
 bracket/sep
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



On 09/01/2022 07:44, James Hilliard wrote:
> This appears to have been incorrectly removed in:
> 03aa3e6ac71a0fe1ff87fe192c8de0b1acebd0df
> 
> Fixes:
> package/pkg-utils.mk:212: *** unterminated call to function 'foreach': missing ')'.  Stop.
> make: *** [Makefile:84: _all] Error 2
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - add sep as well
> ---
>   package/pkg-utils.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 6aa64a2096..7d1aea7710 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -214,7 +214,7 @@ define per-package-rsync
>   	$(foreach pkg,$(1),\
>   		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
>   			$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
> -			$(3)
> +			$(3)$(sep))
>   endef
>   
>   # prepares the per-package HOST_DIR and TARGET_DIR of the current
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
