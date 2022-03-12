Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677BDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 19:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16BA4403ED;
	Sat, 12 Mar 2022 19:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hR-jnEJuh4kw; Sat, 12 Mar 2022 19:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CF6040363;
	Sat, 12 Mar 2022 19:43:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7ED21BF3E8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9775B40321
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 19:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbZZm13nNZNU for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 19:43:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE385402F3
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 19:43:09 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y8so9765911edl.9
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 11:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=EzwBNbbSVj1spui+D7SoL58v2pKLtADNElE/ab5ZAJQ=;
 b=P73ekXJyYJAxVksYepm48J+v19iRIs98Sra2eRdqLKa3qm4BekpBqwXDjFFk06RtEU
 v1CvzyA9z7USctwNviSxSOqkRwYhTZV6WtOnuvkKXYIySxzjHCwy7a6nqqz+5yyJVP3T
 RD2aVgcEa1nwG62VUjEJX+LFtmils3oAcQoD1gfem+8sQjK3k5ja/OHeAQob5AneDw9m
 9msk9e1YX3zGoKmUUo+1H2X7lVZ6XcplG21PbNptZYChIDTHkDwjusP76IOawf2HKpfq
 8oJMZ3GRnX00F8LQbn9cfmZUNr/lysF4G4kIf8Lp2XQlnK/je3sumHKpXAgiy6GLWBZn
 vzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EzwBNbbSVj1spui+D7SoL58v2pKLtADNElE/ab5ZAJQ=;
 b=O7rSd7sVwpfiltlT1RiTmcHococlGPDRQlfnaJ11dqxI3MUXqYbzpWYgux+qRU/POj
 IXE/9CLrMEiSqpnHlaiVbKxqiREn/hbAAUykoqnx0OdhXDg92qbYqK+JWbrYuEvFJsuo
 LaCxg1LEUbEXjCI2aF28EG7AYyKuBKbFjiFbhWQIdjUyi0s4h0hSsoOat5+0qt9qnGF7
 I3TUbCdcW+v1F6+CDoMA1I9wf+B+ghOGGMnkDbC8qIbLCiYtVgQPijOruG34rNhFvv/L
 v6TovZpHA1xopCRJ+dP7pyHSeRsnDh9SbiilRQ0m4+ubzO2zVOb1qY8cd03QC8l9911S
 2h0Q==
X-Gm-Message-State: AOAM533i/WlBXQdSI5csKhkyhNMe0afKIRputQhNmXQHKXTLvXZIEsuI
 eN1P7tmb9p4uOsHlXv76bQ53feoEgGfCeQ==
X-Google-Smtp-Source: ABdhPJxYQdJm0lURrmsZH82zYNPHpERtHmcaNKs3UIwViWwJFpt5Btl6fMSI8TEew1zdkfQSW/N7LQ==
X-Received: by 2002:a05:6402:c0a:b0:416:4f23:ebdf with SMTP id
 co10-20020a0564020c0a00b004164f23ebdfmr13820026edb.245.1647114187886; 
 Sat, 12 Mar 2022 11:43:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a1709061b5800b006da6435cedcsm4604260ejg.132.2022.03.12.11.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 11:43:07 -0800 (PST)
Message-ID: <40127387-dd75-3cd9-b0ea-00944c4b2f6e@mind.be>
Date: Sat, 12 Mar 2022 20:43:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220222214247.3163690-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222214247.3163690-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/duktape: bump to version
 2.7.0
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



On 22/02/2022 22:42, Fabrice Fontaine wrote:
> Update hash of license file (update in year:
> https://github.com/svaarala/duktape/commit/03d4d728f8365021de6955c649e6dcd05dcca99f)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/duktape/duktape.hash | 4 ++--
>   package/duktape/duktape.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/duktape/duktape.hash b/package/duktape/duktape.hash
> index 4c55e39888..ef6f55aa9d 100644
> --- a/package/duktape/duktape.hash
> +++ b/package/duktape/duktape.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  96f4a05a6c84590e53b18c59bb776aaba80a205afbbd92b82be609ba7fe75fa7  duktape-2.6.0.tar.xz
> -sha256  5b42d02dbd084fd6d7e61d93f52e02b596f25400e54e0f86d5780045e5b754c8  LICENSE.txt
> +sha256  90f8d2fa8b5567c6899830ddef2c03f3c27960b11aca222fa17aa7ac613c2890  duktape-2.7.0.tar.xz
> +sha256  c6b6659630ca6cb837afe982ecc79511bfca878b56296d628b02eb6f18789c29  LICENSE.txt
> diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
> index 89a6e451f5..674c5e9323 100644
> --- a/package/duktape/duktape.mk
> +++ b/package/duktape/duktape.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DUKTAPE_VERSION = 2.6.0
> +DUKTAPE_VERSION = 2.7.0
>   DUKTAPE_SOURCE = duktape-$(DUKTAPE_VERSION).tar.xz
>   DUKTAPE_SITE = \
>   	https://github.com/svaarala/duktape/releases/download/v$(DUKTAPE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
