Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F076C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06D378497A;
	Sat, 23 Jul 2022 12:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06D378497A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5s54xjD5vqQN; Sat, 23 Jul 2022 12:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF4A1848AE;
	Sat, 23 Jul 2022 12:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF4A1848AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 798C91BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53CB1848AE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53CB1848AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9QPhFxQP9RjL for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:36:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B1068487C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B1068487C
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:36:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso5531764wmq.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 05:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rK7zcuwZk+72wjFwW1y+Ua/JqyHNI1QqmO1xe6kBemY=;
 b=UpQtn3FZzMos3iK3me5MQPWZRPnbVrK02hgUyzjaFM6xqHeJQ+WChCnFQkQMw5RWnu
 9mJR2KI10d4/bCnAdfegUL04T/bwzcS0PC3KYwlLt3gMPHbciQCTbfi59ABPhFIbelvq
 swjcZIfi2Mcex5strxkYuZXQXPGWRIa4uR2WEV5/NWwDNN+B8O3333sDtXm4u3Ez7t10
 OdG9a8XsJBeZcj9iz5db1DzD77x/1ZWvp7RsvCGnyPr1Kei6sk+HaNTdkTr/V+1ZQp1p
 e/7MO6eUCdzqadFPyNQaozVADzZe2W+XOgRqevYhPeIJDJ0w6rvED1C5is+Zo2XMGAUJ
 xJiw==
X-Gm-Message-State: AJIora9yX/RzSJeg8LGgPqZnYnk2QjUcV4V1HPSD2C8jxuxqTRP0gc9d
 Ps5Vc5NwIPM4JUJFXT7RksThr71H7uj2bQ==
X-Google-Smtp-Source: AGRyM1smsQw1e7BvLgyp6ar0M/24eQhBGY80t9iCK8Fxp+gFJlImdb8oD4KZvpJmkN63CS8aNn3Sqg==
X-Received: by 2002:a1c:cc1a:0:b0:3a0:39b1:3408 with SMTP id
 h26-20020a1ccc1a000000b003a039b13408mr2786735wmb.157.1658579791259; 
 Sat, 23 Jul 2022 05:36:31 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm11701276wmn.47.2022.07.23.05.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 05:36:30 -0700 (PDT)
Message-ID: <018a86c7-4fb1-8398-8c9d-868b585eaf30@mind.be>
Date: Sat, 23 Jul 2022 14:36:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20220723121538.14409-1-heiko.thiery@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220723121538.14409-1-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rK7zcuwZk+72wjFwW1y+Ua/JqyHNI1QqmO1xe6kBemY=;
 b=Ang336z7ZiSN8j797Ua7o3JEv2IzsPBQTFg7KfpfNj2LsbBv9P8g/MLW4K5TU3HOpp
 9rq/goLklz8GqDquZm7O5niobLqDwVJuoIv2ZaFJ7hwAYUIeN3E3W6A/FppgJ/BF1+EM
 utkfbbu14MF7ic8R7woGtxEAyng3dJrVGYF2jkOWfkRFXycqB5l2ZyLvTs+VilEeZcx7
 RlgmdnXCM5v9mBPxQ584iecunZYkW0n0eXOLw4chmdMcxEsQshQ1bqgcAXooojVInld/
 wnN4KCCM58X4JGpSkvAyBRhoYVSCBUDVQN6SCUoxFYboddpUzk9z4TtcRRBuYUPMu5ZD
 Djcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ang336z7
Subject: Re: [Buildroot] [PATCH] package/nettle: switch _SITE to ftp.gnu.org
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/07/2022 14:15, Heiko Thiery wrote:
> The former _SITE is not longer accessible with authentication.

  I suppose the URL in Config.in should change as well then?

  Regards,
  Arnout

> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>   package/nettle/nettle.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
> index c3d5fcec64..05b8b0bea5 100644
> --- a/package/nettle/nettle.mk
> +++ b/package/nettle/nettle.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   NETTLE_VERSION = 3.8
> -NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
> +NETTLE_SITE = https://ftp.gnu.org/gnu/nettle
>   NETTLE_DEPENDENCIES = gmp
>   NETTLE_INSTALL_STAGING = YES
>   NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
