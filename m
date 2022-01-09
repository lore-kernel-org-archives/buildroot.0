Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4DCC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC71481A34;
	Sun,  9 Jan 2022 15:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hgcPvBp6_AOA; Sun,  9 Jan 2022 15:47:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFC41812D1;
	Sun,  9 Jan 2022 15:47:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58F151BF4D5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 472E0812D1
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A3bYbjnx2PHC for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:47:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7ECD080BB7
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 15:47:45 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l25so11204448wrb.13
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 07:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=YJPbInVENBKvj8b/mupKmiCspb/W5zQDfcmzZfRH/mo=;
 b=hjuIDp59oW+zsRVwqyX+b7xQSfiNLvT3HkaAQHvPpmVC5xltnABc7rxMlWPjqAgfcn
 fwaWXqeQbUpHoNjLoZC4DbnY+W1LHIOTE8u+Y4/54qL0zdx76wujp5SviIdfHmtxZopb
 o8YZ9jbPiRiufY5dIE00kQoEA7D4bWiByipDEgSdcviadDzrpMf95MzYMJoPMqvy9cW1
 qRGjVNl4QO/ryvOnA2lIaK8M3UMe5wsKrekgN0nPWVKFZpWQD2af8iZmxVFLmxSeGb33
 uPjJjg4dXDy+791D2agzoD6T9rejl+0TJksngl6RapW9j/SuCbLFeLBuRM93kSvkLyC8
 WdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YJPbInVENBKvj8b/mupKmiCspb/W5zQDfcmzZfRH/mo=;
 b=nKH5u/TIZ3g8IRpNULUsgqa9ds7gOGYK39YtcWo7x2EYTUhB+fe/vjgFILrvwlrQXg
 9VaHdMKRXfSSifSwkQr+OmTENfZ4WAIpMrVMn9Uw02SUIKDU4Iv+cClDD4Nd7GBN0PQD
 qc5w14cbTXIyYL3ytp/EgMgArkZsUunL5xSaNxtpTEdgRA1Qrzl0NrXM5VDsHAC6/Gwi
 h5q5Qhosh33PFqJVy6hC8KSxAvUlrLRZhDMkjB0UdDY+ISk/PHM4YJkibtqNa2OkTspt
 bBxD3CC2QTLDORPz1+rehyWr3JPAjbD4kv1hJI2DB3MY+O0pvppxO3xBjP+wvwXOeNPv
 p+DA==
X-Gm-Message-State: AOAM532Pq7NsAl97I+gkfgEiLyQnjZbfRByjESi/tQ3ZfWzkTCGjEjfv
 arbwtInnatzkh23bwBqELlJvcA==
X-Google-Smtp-Source: ABdhPJyEIFwa9YHieOTt/xSBg93/OKE2T/hIOlpDQtdylEqGoUf3C0+hPIeQpmWb+W2SGJYajG81KQ==
X-Received: by 2002:a5d:5709:: with SMTP id a9mr1405861wrv.707.1641743263758; 
 Sun, 09 Jan 2022 07:47:43 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id i15sm4761863wrf.6.2022.01.09.07.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 07:47:43 -0800 (PST)
Message-ID: <44832a2e-18c5-568d-9085-73efce59b1fc@mind.be>
Date: Sun, 9 Jan 2022 16:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Howard Mitchell <hm@hmbedded.co.uk>, buildroot@busybox.net
References: <20200306092504.30340-1-hm@hmbedded.co.uk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200306092504.30340-1-hm@hmbedded.co.uk>
Subject: Re: [Buildroot] [PATCH 1/2] package/mesa3d: select vc4 and kmsro
 driver for gallium v3d
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



On 06/03/2020 10:25, Howard Mitchell wrote:
> Currently, when building for rpi2/3 it is only necessary to to select
> vc4 to get acceleration working. However, when building for rpi4 v3d,
> vc4 and kmsro have to be selected. Therefore this commit forces the
> selection of vc4 and kmsro when v3d is selected.
> 
> Signed-off-by: Howard Mitchell <hm@hmbedded.co.uk>

  (Finally) applied to master, thanks. I had to fix it up a little since the 
KMSRO option was removed.

  Regards,
  Arnout

> ---
>   package/mesa3d/Config.in | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 13e516e452..3950170533 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -257,12 +257,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
>   config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
>   	bool "Gallium v3d driver"
>   	depends on BR2_arm || BR2_aarch64
> -	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> -	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
> -	select BR2_PACKAGE_LIBDRM_VC4
> -	select BR2_PACKAGE_MESA3D_OPENGL_EGL
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
>   	help
> -	  Driver for Broadcom VC6 (rpi4) GPUs (needs kmsro and vc4).
> +	  Driver for Broadcom VC6 (rpi4) GPUs.
>   
>   	  It requires a kernel 4.18+ with DRM V3D support enabled:
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
