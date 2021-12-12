Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1055BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A3574014E;
	Sun, 12 Dec 2021 14:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rm6DP_SF6YWk; Sun, 12 Dec 2021 14:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BD9F4019A;
	Sun, 12 Dec 2021 14:09:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CE381BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C67D85493
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8p1AP7S7GbO9 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:09:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F23FC823DD
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:09:01 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z5so44947580edd.3
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9qOCw/k1hzDCglBxa+1CBBFyvuSZVyLo9FYCkjAyqHc=;
 b=Ym6dIn4dlh+3hxnL1mCSnm0TFJmXhqpd+fj0j2TxOWt2V4LfpxeRPEarVMH8pa/MDG
 /5WDsN3ZriI/A/5j3eZNN9ts7JuTtFH4EDA0yLJm7XL8OIrawiohCIJl857w0H5RGdWQ
 x34YD4IZli2G2mLdg/vgX7CYIz9tl9P4cGJar4RYkHMa3Xk2Fj05Yw+7g2lQ4SuLVlSG
 iMDd9Qyf3RVtj3wOcFB4AiKRL2Ouqir/W8ZZhs7ZWcSLXTi/ROt7k2hv1YMn61IlUg8/
 mZemx41/m4ON4wae4rdC2VKwLr0bXgsl4og4aL62bY4lNGW0+JSciS/yDqJDw4v4eVIs
 pX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9qOCw/k1hzDCglBxa+1CBBFyvuSZVyLo9FYCkjAyqHc=;
 b=rCIq/qguT28oGVSykDDSgxE/aI7h7v4hwuI9dE8VEgMlc+0j7c5FVaUQnKxwAQgnJC
 ef1xPsE9LKn4P5Gy/pN1fEa8hN1DmRT4rbge9kd2BhGtmTpE2CgfwbmtncNBOrvuX3Y3
 lv/51J3j3sQM3e4j+plX7cndh56N2BU+701EMCd0rZyOAH1zFP4yAu2KuC8ltzNv0c3X
 77zQbqCWC/F2VuFvZpK6jfyvvEsJ99N+UW3cHuErRCvo1BxcHm5CKCc8G+/ACxiDqV/E
 911ZcP6fzogU5EEdsyTVlTvgQDVDSW5EfKMcSKVVStYThcMGgd88OR6EB4///4iV2rkE
 p9VQ==
X-Gm-Message-State: AOAM532CbNztpYq+qotIf9xwjWgCdDBKfzBO3MwUumB8szl4+NUjbZrC
 oDguhPR5VoR/oeY4hiaz1rQ5VIxGOsyTxg==
X-Google-Smtp-Source: ABdhPJx05bBnHPuOUQ6qVgmht0xnS1WIcv2bsvSx0ukHMylgGZTXKYJGObgjvwhaXA5JKjG2dXmehA==
X-Received: by 2002:a05:6402:2547:: with SMTP id
 l7mr55687941edb.301.1639318140190; 
 Sun, 12 Dec 2021 06:09:00 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z6sm4789773edc.76.2021.12.12.06.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:08:59 -0800 (PST)
Message-ID: <5af6fe6f-dda2-482b-b2c4-96cab01ae516@mind.be>
Date: Sun, 12 Dec 2021 15:08:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>, buildroot@buildroot.org
References: <20211209141410.694868-1-gwenj@trabucayre.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211209141410.694868-1-gwenj@trabucayre.com>
Subject: Re: [Buildroot] [PATCH v2] package/openfpgaloader: add cmsis-dap
 support option
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
Cc: Jean Burgat <jeanburgat33@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/12/2021 15:14, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> CMSIS-DAP support depends on hidapi, but this package has depends on
> udev so instead of adding this option by default, this let user decide.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v1 -> v2:
> - use select BR2_PACKAGE_HIDAPI and add depends on BR2_PACKAGE_HAS_UDEV (Thomas)
> ---
>   package/openfpgaloader/Config.in         | 14 ++++++++++++++
>   package/openfpgaloader/openfpgaloader.mk |  7 +++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
> index c998369bed..792ba918aa 100644
> --- a/package/openfpgaloader/Config.in
> +++ b/package/openfpgaloader/Config.in
> @@ -10,6 +10,20 @@ config BR2_PACKAGE_OPENFPGALOADER
>   
>   	  https://github.com/trabucayre/openFPGALoader/
>   
> +if BR2_PACKAGE_OPENFPGALOADER
> +
> +config BR2_PACAKGE_OPENFPGALOADER_CMSIS
> +	bool "CMSIS-DAP support"
> +	depends on BR2_PACKAGE_HAS_UDEV

  This should have a comment fo the provenance (i.e.: # hidapi)

  Also, hidapi depends on NPTL threads, not simply threads, so that should be 
propagated as well.

  And we anyway usually propagate *all* dependencies for suboptions, even the 
ones that are already covered by the outer config symbol.

  So I fixed that and applied to master, thanks.

  Regards,
  Arnout

> +	select BR2_PACKAGE_HIDAPI
> +	help
> +	  openfpgaloader CMSIS-DAP support
> +
> +comment "openfpgaloader CMSIS-DAP needs udev /dev management"
> +	depends on !BR2_PACKAGE_HAS_UDEV
> +
> +endif
> +
>   comment "openfpgaloader needs a toolchain w/ threads, C++, gcc >= 4.9"
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
>   		!BR2_INSTALL_LIBSTDCPP || \
> diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
> index 73117cb994..0c39aad687 100644
> --- a/package/openfpgaloader/openfpgaloader.mk
> +++ b/package/openfpgaloader/openfpgaloader.mk
> @@ -17,4 +17,11 @@ else
>   OPENFPGALOADER_CONF_OPTS += -DENABLE_UDEV=OFF
>   endif
>   
> +ifeq ($(BR2_PACAKGE_OPENFPGALOADER_CMSIS),y)
> +OPENFPGALOADER_DEPENDENCIES += hidapi
> +OPENFPGALOADER_CONF_OPTS += -DENABLE_CMSISDAP=ON
> +else
> +OPENFPGALOADER_CONF_OPTS += -DENABLE_CMSISDAP=OFF
> +endif
> +
>   $(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
