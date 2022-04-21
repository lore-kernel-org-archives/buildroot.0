Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA83EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 07:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C17D41B73;
	Thu, 21 Apr 2022 07:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wmrbm3-nE53x; Thu, 21 Apr 2022 07:22:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4740419C2;
	Thu, 21 Apr 2022 07:22:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 427F41BF40B
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 07:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29E80419C2
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 07:22:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zz4thF7mVu3x for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 07:22:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5204B419AD
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 07:22:08 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id bv19so8133562ejb.6
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 00:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=eweUeIpwtMrMUFW+kJ6oqCjYHiaf26YMn70hSknlGgs=;
 b=aJTgLl2UZ2JDL4UMrgWq/FLKYprD0MIxNB0sQF6m7UBupOXii/LM9uaAqk84nZO9OE
 taCMFvEDnP7Cobofz/YL3EQwkQnctN2TLtxfh6b6RMbQjdFuC9gvV9WMznbayfjWbAQi
 QDlPb27AOFDhW/e1tYSND3mOyq09K7oleFd7bMet4mC/bfhe/PJslBy+/vllVqpeiFkc
 +DM1LmQObu/TCQ/MU6wPxBNlTmEisjhuxrQb2SRDhCe+Xz9+P7X2IUiguvBPen1Q52+y
 aajdGAxD3Vo8rGoKdqCGaDcsn4H6eq7s6YVtziM7jH03orWsZ8l4plbFq77Vh9YqNIqh
 F0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eweUeIpwtMrMUFW+kJ6oqCjYHiaf26YMn70hSknlGgs=;
 b=oqLBtDCtuoJneNFP//ztTZAkP79GNust9ZzosM+PqqrHkdz86sBQfqKJyPKkZOD/Z9
 WMyaLKJ+Bc/Lrvu8H9yoNKNLTHH4Xij4VP7Iid3SDvs93FY4N6pTMsdd39DFHPaaSak0
 QW05S2ifqbt9jkrhaVLr3WWNZsWhu/cBRAA9ibj8kCviQTOTG5XfHgpmwBFsxSmDWgRJ
 rwF0vNB5rR1/Ge7d8yx7P6Xitw1iIWYyg2NZuF2gvsCoJ27dqOpic0x2m/wFT91sa3Lk
 2vMfR+oi0Rw7reYUsvDBUyv7y7zN1Y+HpkmlQ9cwty+K8Qig9wDTIBD62bCEvr7PKJ6A
 BN+Q==
X-Gm-Message-State: AOAM531kB/0tw35TsOrAyJrwBZ4b5HY0UxX385fuMUvEDM2p0db4xNIN
 f51HQWwcH10dKYmdSPK9kNVEJKKoMO6KMw==
X-Google-Smtp-Source: ABdhPJyw6FtAX5aZo7AW3ZIvJNE60aAKSOupm4Hla7wAkA0GF7ko/766p5R4+JSkzuHSU/sfSx97xw==
X-Received: by 2002:a17:907:da6:b0:6ec:f599:b053 with SMTP id
 go38-20020a1709070da600b006ecf599b053mr21578742ejc.503.1650525726144; 
 Thu, 21 Apr 2022 00:22:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 kj23-20020a170907765700b006e8973a14d8sm7508079ejc.30.2022.04.21.00.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 00:22:05 -0700 (PDT)
Message-ID: <8b28d775-d65a-d6e2-2b50-6bfc6549df0b@mind.be>
Date: Thu, 21 Apr 2022 09:22:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220420200102.2420626-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220420200102.2420626-1-yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/wtfutil: new package
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



On 20/04/2022 22:01, Yann E. MORIN wrote:
> Some of wtfutils modules (i.e. plugins) can call to external tools, so

  Modules are not optional?

> it needs to fork(), so needs an MMU.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

[snip]
> diff --git a/package/wtfutil/Config.in b/package/wtfutil/Config.in
> new file mode 100644
> index 0000000000..8c3efcea5d
> --- /dev/null
> +++ b/package/wtfutil/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_WTFUTIL
> +	bool "wtfutil"
> +	depends on BR2_USE_MMU  # fork()
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	help
> +	  WTF is the personal information dashboard for your terminal.
> +
> +	  https://wtfutil.com/
> diff --git a/package/wtfutil/wtfutil.hash b/package/wtfutil/wtfutil.hash
> new file mode 100644
> index 0000000000..deb162794e
> --- /dev/null
> +++ b/package/wtfutil/wtfutil.hash
> @@ -0,0 +1,2 @@
> +sha256  d15b2e8833d31d5b1ad7b4317777dc7aa045124d1d91994f02c9b5709f09fef3  wtfutil-0.41.0.tar.gz
> +sha256  b59f3dbd83c6aa4e003b6eafa80bc53f0629e4d164e8b125c56869c2603dbc8f  LICENSE.md
> diff --git a/package/wtfutil/wtfutil.mk b/package/wtfutil/wtfutil.mk
> new file mode 100644
> index 0000000000..6e841411a9
> --- /dev/null
> +++ b/package/wtfutil/wtfutil.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# wtfutil
> +#
> +################################################################################
> +
> +WTFUTIL_VERSION = 0.41.0
> +WTFUTIL_SITE = $(call github,wtfutil,wtf,v$(WTFUTIL_VERSION))

  If the upstream repository is called wtf, and the help text says "WTF is ...", 
why do you call it wtfutil?

  Regards,
  Arnout

> +WTFUTIL_LICENSE = MPL-2.0
> +WTFUTIL_LICENSE_FILES = LICENSE.md
> +
> +$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
