Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C55EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEEEE60E30;
	Tue, 15 Mar 2022 21:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bFBatL2ZUdUP; Tue, 15 Mar 2022 21:20:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0679460D76;
	Tue, 15 Mar 2022 21:20:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5343A1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4017740154
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qKIMXFEQSiwD for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:20:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1F1440103
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:20:22 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id hw13so270699ejc.9
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iDqtKrmXCOD0pjWMvMHuQWSGIarE4eKg94KNp1PsZz4=;
 b=c0Her9nWWQM7qL/VZP+4XQ2Z7VOnYujFaJIONQLqJJZmqhfn4/f2eY66hMcMcwfxED
 IIApD2mvgo3V4BE7w/unpV71msc1FwtjT5ZO/VBDzIUIofogVVjD/dT3hYwhfdOe74Kx
 znvEzP84xg/E6HuwzY7I7A2zJgsVQJ6EzD75nhfuZ6BiSVOofjNSd017T8ck1e1xp/0A
 up0ZqzN9wU/seD2evxTYGQ0HHXF1V2x8/XmXdviFHwmEjnwo+kpzkj+XLPxu/aS+h2et
 EHHZ5wBylY1mhljQYzi8ny0oAYrYTN5lQ3o5K8tqV9k6aaJwB8TbRPjhIR0ndtE79HWN
 mWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iDqtKrmXCOD0pjWMvMHuQWSGIarE4eKg94KNp1PsZz4=;
 b=LGH7lCU4Isy38cW/uPjm/WlGA8nn/ym8jztWMnLRW0Z09dcjNJVcKJF2sEf7W3c4VL
 oGGS1xOF1VtH6a5TCRriwi3wYaGmjBTdJ5x6BJ87CaWvfcK0J96Ih0k8nhexK4xTzZUl
 1aY9iuqth7iJpa5KOoXCu2/Hho9xDhVl3thYCYQpYDQ3C+HzGYxLQx3ic2SYuenYGAc8
 eN2dbGzdtlmL0ZPktrvNnEzD0gBu92ZeL3zZo7k2RVITG18iMd8rc4Wiby5WVPmxHdb0
 gCiJJQ3381EqzdkoPEamMbgI9TeawNxobjaDq1MiADumx7noBdt3mn3UYvBXbAgM9ZCp
 I2QQ==
X-Gm-Message-State: AOAM530+/EPDxvZrLtUuLwPs/0xboSW528OjPFhzQ3UI1UtKH+f1xVyb
 EwMS5galUUtnJ5WyewgRhtjKc/fEObbcNA==
X-Google-Smtp-Source: ABdhPJzacACALMwKgreYSVNn4UxtVsU0UTq/1HvfEssYnnL3y2velcltSOEuYHMmlx0yXTiAtv1IkA==
X-Received: by 2002:a17:907:3f12:b0:6d8:bf7c:7672 with SMTP id
 hq18-20020a1709073f1200b006d8bf7c7672mr24146628ejc.686.1647379221079; 
 Tue, 15 Mar 2022 14:20:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a50eb08000000b00418b114469csm56759edp.52.2022.03.15.14.20.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:20:20 -0700 (PDT)
Message-ID: <42548c26-0cba-d9db-4069-30e82e83ce16@mind.be>
Date: Tue, 15 Mar 2022 22:20:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220304213828.3870123-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220304213828.3870123-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH/next] package/libnss: bump to version 3.76
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/03/2022 22:38, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libnss/libnss.hash | 4 ++--
>   package/libnss/libnss.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 07fb340c33..b4b8be11f6 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_75_RTM/src/SHA256SUMS
> -sha256  fd571507827284644f4dd522a032acda2286835f6683ed22a1c2d3878cc58582  nss-3.75.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_76_RTM/src/SHA256SUMS
> +sha256  1b8e0310add364d2ade40620cde0f1c37f4f00a6999b2d3e7ea8dacda4aa1630  nss-3.76.tar.gz
>   # Locally calculated
>   sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index a9549e48dd..2f7a265136 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSS_VERSION = 3.75
> +LIBNSS_VERSION = 3.76
>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
