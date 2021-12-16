Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577FEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA4683F62;
	Thu, 16 Dec 2021 20:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id izXvKt7X3I7q; Thu, 16 Dec 2021 20:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 730C483E8B;
	Thu, 16 Dec 2021 20:14:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D27701C113E
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFA4183E8B
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:14:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FC-FhHVizJpl for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:14:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF64A82640
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:14:49 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id y13so91041814edd.13
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1SOe5DeWHyITlP9At0dyFyN1YdNPJQs0iXuio36wDQU=;
 b=NN2m3Kj5E0Sw45UZrUDv0dB/GuDB2iy96jVcE35X+2y1cmPsnwiaJaVynToq188tkY
 TXSkuwhwHLyqztqzVO9TIcHdESmxKcFwypd4rnPsgoKZe9630/JWwDBeh0i4s559s4Qj
 11KIyAYcgJYY9AX3TZDWiU0kXfFl2oYhFPICVmroi8yaUmYqOo5b3bJIp27g6dw6qhhf
 DzeKeqoxGmsU4sLKBUf5GkWdWCl7Dm1o3wYOMF/kcLMMgrldP1ujZNuWvKoUiKDur084
 wng9MXlXc6aXf/XM7fMlpH/V25V1oxfq6DkhWE5ixPkkyIZupbJG/7vrBpM0tuBMUmUi
 yQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1SOe5DeWHyITlP9At0dyFyN1YdNPJQs0iXuio36wDQU=;
 b=kRUnRA3THyEwLxTWYKrspwQlfGN7UgCZnkk8c3VeJnqdHb3iIZQ41brV+Qz1ifUYfH
 RskJb9vcwtzPHdK/YcWxVP5xJLDxtZzfFK7A8KW/V5ilP7U+HNRuH6IBbB7QVmy2fpn6
 N2dRLNK4yNwwD6GgWc/v6gNLwh7S+fOWYCDdZllmWU9zUHA8moBgmRfKo45cCZH6KzRM
 RdZMkHEgM7WXKHOd+fqe/rlQJBrSeyHBqD7jQsvAiypxdxWCSUFmnxfNqFL6M/1VYhWK
 yJB2CT0IUqBouwwKeiHdGhDcnPFgwLkjYdnHaQzXx0zmSM9Fz6N9W+/rJsYp1R32Ui83
 RCNQ==
X-Gm-Message-State: AOAM530o+jblKO8Y0vkDTacFrn6a6sr2DNmkmevapfnTGYTtH8ZkJLqI
 XqCEF0Z/LjU0vRY+e7xtxeVVog+aR0H6Kw==
X-Google-Smtp-Source: ABdhPJxQ9lc7oNyzPMq1pNnFAzc3fk14ql9bRiKls/tOu1D6E831ZgjrsD2hCanXnlvkVmVPHLuRlg==
X-Received: by 2002:a05:6402:1d56:: with SMTP id
 dz22mr21577469edb.291.1639685687958; 
 Thu, 16 Dec 2021 12:14:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p4sm2136264eju.98.2021.12.16.12.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:14:47 -0800 (PST)
Message-ID: <f5026efd-5886-badd-a0b2-2c41d4b167c7@mind.be>
Date: Thu, 16 Dec 2021 21:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211216071959.128707-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216071959.128707-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/jansson: bump to version 2.14
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/12/2021 08:19, Fabrice Fontaine wrote:
> https://jansson.readthedocs.io/en/latest/changes.html#version-2-14
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/jansson/jansson.hash | 2 +-
>   package/jansson/jansson.mk   | 6 ++++--
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/jansson/jansson.hash b/package/jansson/jansson.hash
> index 5c19316981..0d9dc7b5a5 100644
> --- a/package/jansson/jansson.hash
> +++ b/package/jansson/jansson.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated after checking pgp signature
> -sha256  f4f377da17b10201a60c1108613e78ee15df6b12016b116b6de42209f47a474f  jansson-2.13.1.tar.gz
> +sha256  fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9  jansson-2.14.tar.bz2
>   sha256  1fff7d37d22157bcd81ab53b6c54da755d7c2f868f15807d9bde920f10730da0  LICENSE
> diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
> index 2761ce9b16..99e1817eef 100644
> --- a/package/jansson/jansson.mk
> +++ b/package/jansson/jansson.mk
> @@ -4,8 +4,10 @@
>   #
>   ################################################################################
>   
> -JANSSON_VERSION = 2.13.1
> -JANSSON_SITE = http://www.digip.org/jansson/releases
> +JANSSON_VERSION = 2.14
> +JANSSON_SOURCE = jansson-$(JANSSON_VERSION).tar.bz2
> +JANSSON_SITE = \
> +	https://github.com/akheron/jansson/releases/download/v$(JANSSON_VERSION)
>   JANSSON_LICENSE = MIT
>   JANSSON_LICENSE_FILES = LICENSE
>   JANSSON_CPE_ID_VENDOR = jansson_project
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
