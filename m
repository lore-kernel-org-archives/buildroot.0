Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA87C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 950F960C30;
	Tue, 15 Mar 2022 21:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8_NUiWSSEq7H; Tue, 15 Mar 2022 21:49:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC7260B83;
	Tue, 15 Mar 2022 21:49:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BFB61BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72F2581763
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdsjAKK-4nN4 for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:49:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60E3E8426E
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 21:49:51 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w25so490188edi.11
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 14:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ObRyFeP/6FM2p2MQHOFuRGL7qQGHPaC0JzXwL3to1vY=;
 b=RWS+GT5XvEdXKJDpqwFMd+MVMwFz7r0Q3dv6IXT3uAv8PGftT4HPmqwCdisdCvBsHA
 K63ohapSoy2NOPaqVFUzEbPIh+RVQQwe1WV7acHnaMbR5Guj5X0aKmZ4/yfAGb8QP9Or
 nNhHWeGcfQqAkxvfTMxAwT+z/TYhb37uST61BOuL+ffv+sdR/KgGHtI6w89v/7jlIb7w
 o7EdZ/10U94SoyyL3kWD7d4/1J+/CpXFPCrP/MdJ3TjKjzyvvbvyxFsJmxSSC7ttGELb
 lYUJWtlF8lvVfYO19yDXjZkLt+x2uMLjY3rOdQoDr48ZOIJR7trA4zJLowSrwYYjykGu
 esXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ObRyFeP/6FM2p2MQHOFuRGL7qQGHPaC0JzXwL3to1vY=;
 b=daxuKjy/eN+OZBJYXffuVve21ektq4T5XgEbfz+VXXG8wRmuSev/Ppx4Qz5/RwroIe
 yQh+rlwAWX+eM7XnROthcWq/YZJoJtSpd2UL5WWFPF7iP7RDlWjv6P/I4N2Hlml+BlaP
 aykEYH6FoGBOaX1H7eB9WrDmIm9w5jb9hgQIXOU5ukWLlN3esG7+54y4alEiaeFzxW3y
 2qmnAB0syLSzLPBuSjRmle5Iq40wBkPpL+W+h+Dln/nQY3tLGaOT76kue/ua3UMqU0wy
 IFkCqQP3D7QM9HsixWvde8V+o5H+zPEb/Fuc7pVaBnnY3yG7CaNqY4/owd2myFOGNx8i
 mzTA==
X-Gm-Message-State: AOAM533tv1aUL09r60qLSyYrqmRmJr3/q1AlplIUt9Ig5yqbTXpBJjYB
 v2cw7y3jevgjrjxuKDFG8gitacDp4hO13A==
X-Google-Smtp-Source: ABdhPJyff5fx1NIywy1q06HkDbW0JWEl0fZ1vHmFknIoApEgbscU6LzuayzRuKi80XOwjgmNcSUwww==
X-Received: by 2002:a05:6402:26c2:b0:416:4839:3df7 with SMTP id
 x2-20020a05640226c200b0041648393df7mr27533717edd.210.1647380989626; 
 Tue, 15 Mar 2022 14:49:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ec21-20020a170906b6d500b006d170a3444csm83557ejb.164.2022.03.15.14.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:49:49 -0700 (PDT)
Message-ID: <eb4d9a76-1887-0e4b-e96a-60c2e59d3037@mind.be>
Date: Tue, 15 Mar 2022 22:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220310114153.919891-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220310114153.919891-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/moarvm: bump to version 2022.02
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



On 10/03/2022 12:41, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/moarvm/moarvm.hash | 2 +-
>   package/moarvm/moarvm.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
> index 01e3ee4ae..58e3ce8ac 100644
> --- a/package/moarvm/moarvm.hash
> +++ b/package/moarvm/moarvm.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  7f3487a70e8b77be0e4e2f12b14c49f6a01d0378e0940c86958c9016c495ad75  MoarVM-2021.10.tar.gz
> +sha256  4f93cdce6b8a565a32282bb38cc971cefeb71f5d022c850c338ee8145574ee96  MoarVM-2022.02.tar.gz
>   sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
> diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
> index 99e26c73c..db336bfe4 100644
> --- a/package/moarvm/moarvm.mk
> +++ b/package/moarvm/moarvm.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MOARVM_VERSION = 2021.10
> +MOARVM_VERSION = 2022.02
>   MOARVM_SITE = http://moarvm.com/releases
>   MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
>   MOARVM_LICENSE = Artistic-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
