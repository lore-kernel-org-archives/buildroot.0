Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F5BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F38640239;
	Mon, 14 Feb 2022 20:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pWAapBdXWvhN; Mon, 14 Feb 2022 20:01:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9A554031E;
	Mon, 14 Feb 2022 20:01:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 123C21BF316
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00CA681D18
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRt3n6U73LjJ for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:01:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D348C81C56
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:01:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so208966wmb.1
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xJugc220ezZiIsLtEuO4mIX5sOCBzKSQ4d6CRZMUToI=;
 b=Zu5STH8fumrMGlZrOr2WAPZJsP1N5S+VLbgF3jlGtjUSJg5GHz0DJQWUklNQT31PV+
 8zkxj0lXTh0nNlXKBJcQr3jMs+5L/de6KxFUo2svVFRB0vD/KdUNXM7TU82gMapCZa9H
 Ph00bBC6+G5ZjENzdpJoOAz2YryyRQcsOEUR7v1mf+yDtiDYcuSNKMkmcnsOc6+K7qih
 Cw2KmOHFokGNM4baGkQt5bU3NO7pWFMnkkKaRwK1dLBokX99+hz70U6yThKo+erdzMBq
 ZNw2mHioUkpE77YMoYjzBW6Co8V8PfUd9QceLh5LDbiRz8S2afTtoIqRtzrdEZhV4hSC
 86uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xJugc220ezZiIsLtEuO4mIX5sOCBzKSQ4d6CRZMUToI=;
 b=XZvnJMJWzMVkH3quEthPM+CndWsoBHrMnzsyGNt3Dwqt4Y702MitNrf1Opn95mPe8U
 GLCSwZ2kvY66F7ktlf1DStb5IHxoJdEK1xBVneKcA/sJfZEy/6lak6VIIexAOPmYvlC9
 C5sKteYY2E6gkYqcA39LdN2l8fmh0fnrC5XYLhX0xZZPFj5s0d4u9ZbvspDuN2Aytg82
 z6BLX5WWCpdJO+S2HzI3zaPim58GB55KS+MgLWsLFmtEjbpLAIXU8zwAWkoMkgJ5en1G
 N8bg8yWDDpPo7OVI6aPoLQqRaXXZV18PzPIA/WLYVInvtzRC1hmJb8FsAUIaq+WqSbEC
 RQfA==
X-Gm-Message-State: AOAM530TWt1KQBKc1+4Ywe3NLueDZQS3Ce9CCYyNjkOP0Ws60ol/tPW3
 7FI42RNaVyiFCKReLZVx2lKo7Q==
X-Google-Smtp-Source: ABdhPJyybbaY8wCGxoNm+Qc+G0G5dsm/Drz4T61VRzJXVVIPTOzU3wMHWnmD10O2zT2CMTKZ9wtPsQ==
X-Received: by 2002:a7b:cc8f:0:b0:37b:dcdf:cf40 with SMTP id
 p15-20020a7bcc8f000000b0037bdcdfcf40mr228628wma.99.1644868863922; 
 Mon, 14 Feb 2022 12:01:03 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o14sm12739560wms.4.2022.02.14.12.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:01:03 -0800 (PST)
Message-ID: <e3fedbe7-4727-77cf-3c1a-f35e84ab2551@mind.be>
Date: Mon, 14 Feb 2022 21:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220206195106.2520033-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206195106.2520033-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/guile: fix build with glibc 2.34
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
Cc: Pedro Aguilar <paguilar@paguilar.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2022 20:51, Fabrice Fontaine wrote:
> Fix the following build failure with glibc 2.34 raised since bump to
> version 3.0.7 in commit d8bee3950aa851620d6a954aebad1f984caa105a:
> 
> In file included from regexec.c:1368,
>                   from regex.c:74:
> ./malloc/dynarray-skeleton.c:195:24: error: expected declaration specifiers or '...' before '(' token
>    195 | __attribute_nonnull__ ((1))
>        |                        ^
> 
> https://lists.gnu.org/archive/html/bug-guile/2021-08/msg00003.html
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/27a2a69e1177f15daec65eca035b99ea5355c34b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks. Pity about the huge patch, but it is what it is.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
