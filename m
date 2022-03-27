Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94257C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29743409A7;
	Sun, 27 Mar 2022 15:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q14EQTNDX5pa; Sun, 27 Mar 2022 15:35:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C044D409A0;
	Sun, 27 Mar 2022 15:35:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CA3A1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2914681A6F
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6X24HW4m4zlQ for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:35:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A82681A65
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:35:07 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id yy13so24007415ejb.2
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bKtVjVd34KA7XFRD0dI5iB8Ce3GRMTnSIs52vJXqfs4=;
 b=EX+5aI0ih7KBQawphAbBtQMevyMGbCdsf1w0UJ8O4jSlJb1x4hhWFYrIGcPZU2ibNa
 hkLxV6MceEO+gzOg2DUYBHRQHDyhUBIRbHX54CnjEuowxupmt/TSDq3JrgThR0SDwt+r
 6tJ9Xo6I3AgJ6RzU6jaICdyuim21Gz23Y4LP7BfK5AEDAo3cf/rT07YT+1idLPP2Hu2p
 1OAyerHcxM98uXFdMjBe0vbLt13vONM9xg0tIApvdnoyMPePVt6b64ZC42EuDZsCmdus
 QIbQW+4EObho2BGb04U9TEF1x2LpA6+FI402azgcz8P2fXbT6WDR4in1CsYiSg8s+cR0
 kFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bKtVjVd34KA7XFRD0dI5iB8Ce3GRMTnSIs52vJXqfs4=;
 b=KMF966E7DhAV9K5YLwEXpxBDhBtC06Cmy8NSkblhlxKUgbnxbGYnhAp7DsWXa1tdAm
 7MFSSrqz07pMkZDvqGpoMoZ/ZZywU/KMVy1N4TIWqJHeczXzRMCd3ugTDuxMSAI0dTDp
 N5GW89aV/sbOQn0J7J7C+82rUHwlAPptp8Infxneiu1oJbuvage5CeZXXFZhFdN6TyXT
 k88Tw28BU3zUTyURNjU2PCU5KV4dDzP1aDaktNhzeVgFj39j4+8Psp//8Qtm4+q9zwl0
 nv63CCOcW87gAlzjZM7gi/jSJMAXA3UiR5GxChNyBj1+WOOF/YfS8tDe8zyE2z/V+3a8
 ucTw==
X-Gm-Message-State: AOAM532s96MX7C+E00acHEc6G9mWAgcVqZJhsZGq+ipEGeC9zBtddyPq
 pk58sHKCyekmEd+X8mZQbVfC8A==
X-Google-Smtp-Source: ABdhPJwO5iq+nrNnFnWIRVCia4ClYDW0qDJr+7IYaYTE0H7fRMfqHNfwuX6eUpFaxQ0j6T6IzjtHgA==
X-Received: by 2002:a17:907:9801:b0:6db:ab31:96f4 with SMTP id
 ji1-20020a170907980100b006dbab3196f4mr22568649ejc.571.1648395305962; 
 Sun, 27 Mar 2022 08:35:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a170906365700b006e0acdf5541sm2849679ejb.106.2022.03.27.08.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:35:05 -0700 (PDT)
Message-ID: <3567fd8c-8c60-874d-2137-df028cf22b62@mind.be>
Date: Sun, 27 Mar 2022 17:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220317185842.183700-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220317185842.183700-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ola: usbpro needs gcc >= 4.9
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/03/2022 19:58, Fabrice Fontaine wrote:
> Fix the following build failure with usbpro raised since re-introduction
> of the package in commit 16ff948444c3978d63f483344a3d92d994c64312:
> 
> configure: error: compiler with C11 support is required to build libusb
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e9239403bb13d3468db01a952da8c695c0e5ea30
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ola/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/ola/Config.in b/package/ola/Config.in
> index 36b175138f..e59637b57f 100644
> --- a/package/ola/Config.in
> +++ b/package/ola/Config.in
> @@ -164,8 +164,12 @@ config BR2_PACKAGE_OLA_PLUGIN_USBDMX
>   
>   config BR2_PACKAGE_OLA_PLUGIN_USBPRO
>   	bool "usbpro"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
>   	select BR2_PACKAGE_LIBUSB
>   	help
>   	  Build UsbPro plugin for OLA.
>   
> +comment "usbpro needs a toolchain w/ gcc >= 4.9"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
