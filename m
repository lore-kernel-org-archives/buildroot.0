Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1971BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 20:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55C0041C12;
	Mon,  6 Jun 2022 20:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C3mjltzrrvJH; Mon,  6 Jun 2022 20:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13BD941C0C;
	Mon,  6 Jun 2022 20:24:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A14B31BF297
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FB4E41C0C
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ezg6ZDs5mNnc for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 20:24:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4216941C09
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 20:24:32 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id v1so20451557ejg.13
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LeyiNmk1USVD7Qjql81qjojg7TpS2qhGL7+nbqj7J3c=;
 b=NYVIR7MbFC10TnaNXArHTU5xk3KpygDWq0aRxtA14qYK2vjLMrDDkeC1AkDiCErLGE
 F0y/vVD7QN1rfyeJDxPgdPcWPWDPfwflFVRHBaUbGCc+YNVBPzce+GZjixH5TrH4oqSm
 asCwNw1LfXT7JOftgn9WR2tZLD40np9oSAwcT3UCL68jpGePPfrBAcCq1bamZ3oUvGeI
 U9gIRqTi+Lk8jd2VfWnCS7B1RMOMdWzq0v+wX3XyCOT2oK60YJSEfY1bTKHwdREgxQv7
 bf0feARGs3lZSNj7QDlPF0c5VFFcHN+lQcI7dihH5QSWQ1ukgwtihrZ8Tu0bZQG2sDQK
 iZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LeyiNmk1USVD7Qjql81qjojg7TpS2qhGL7+nbqj7J3c=;
 b=MSwIAurnqIsCt14QfdwaXzArL/P57gb/Cv3tZwfRBcVDqrBmoM+hqVrKr/ZHzXPf1e
 rnYcCN4OLMpO/6hNxHrBrbQ91myvQ7D44cMQuqq+eogfzf+SoV9iQytVfFIlE0EfWA27
 OC2Ib/KPbEX2yFpoRzr1q8XabPfzw5b5hEQzOs3rb0xb693y6QUAQzQZGDYLnU2VWE9Q
 brvtAc7AYaANvdN/3gHCI2iF5ZbMylu+MHcQawW0bvNb2lKPKvbT6Z2TsuVvW+HKL4P2
 mKuHjrdrEQNL5qRqzTGQY/CgLTn/vqeku9WSto1gPkyd9c+A9aWnkkRsuhrbRcNQa1bS
 G6EA==
X-Gm-Message-State: AOAM531BVrIRbUIdIxSzKJRD5qX4zJnn/45o3rAjCSzovtdBPWtDdNKA
 zxT1qWgh6Xx3o2ud7CYhhKnnzQ==
X-Google-Smtp-Source: ABdhPJzlq+Q8ioN8oAALXB/KkBtz1fQ7Z6WcuAFLM1IWweQO34ysDuTCTjzBoTm4B4tU5DW5JZFuEQ==
X-Received: by 2002:a17:906:6a28:b0:711:d032:caa4 with SMTP id
 qw40-20020a1709066a2800b00711d032caa4mr6069245ejc.80.1654547070281; 
 Mon, 06 Jun 2022 13:24:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 qu19-20020a170907111300b006fe960c5c5asm6747412ejb.126.2022.06.06.13.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 13:24:29 -0700 (PDT)
Message-ID: <a13f8876-f325-4aa8-49a0-695d03b85a30@mind.be>
Date: Mon, 6 Jun 2022 22:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
 <20220514175612.2510884-7-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220514175612.2510884-7-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 07/19]
 package/x11r7/xdriver_xf86-video-imx-viv: switch dependency from mesa3d to
 libgl
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2022 19:56, Bernd Kuhls wrote:
> DRI support for this driver is provided by the xserver_xorg-server
> package when BR2_PACKAGE_HAS_LIBGL is enabled:
> https://git.busybox.net/buildroot/tree/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#n91
> 
> Change the dependency to follow the logic of xserver_xorg-server.
> 
> Also fix a typo in the Config.in help text while being at it.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   package/x11r7/xdriver_xf86-video-imx-viv/Config.in | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> index 13cee14deb..292fdd05a4 100644
> --- a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
> @@ -1,10 +1,9 @@
>   config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
>   	bool "xf86-video-imx-viv"
> +	depends on BR2_PACKAGE_HAS_LIBGL
>   	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
>   	depends on BR2_PACKAGE_IMX_GPU_G2D
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
> -	select BR2_PACKAGE_MESA3D # Needed in order to compile xorg with glx/dri
> -	select BR2_PACKAGE_MESA3D_DRI_DRIVER
>   	select BR2_PACKAGE_LIBDRM
>   	select BR2_PACKAGE_XORGPROTO
>   	help
> @@ -26,7 +25,10 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
>   
>   	  Don't forget to load galcore.ko and create /dev/galcore
>   	  before using this driver (else, Xorg will exit with an
> -	  obscur message like "Segmentation fault at address 0xc").
> +	  obscure message like "Segmentation fault at address 0xc").
> +
> +comment "xf86-video-imx-viv needs an OpenGL backend"
> +	depends on !BR2_PACKAGE_HAS_LIBGL

  This should also retain the arch dependencies: BR2_arch and 
BR2_TOOLCHAIN_HAS_SYNC_1.

  Regards,
  Arnout

>   
>   comment "xf86-video-imx-viv depends on imx-gpu-viv with X11 output"
>   	depends on BR2_arm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
