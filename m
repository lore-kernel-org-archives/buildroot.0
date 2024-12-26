Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012DCE77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 21:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C0E240082;
	Thu, 26 Dec 2024 21:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8V3kC00LWeyc; Thu, 26 Dec 2024 21:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 442A4401B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 442A4401B4;
	Thu, 26 Dec 2024 21:17:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0DFCF1B
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8587804C5
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4e3ekZWpZgea for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 21:17:41 +0000 (UTC)
X-Greylist: delayed 497 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 26 Dec 2024 21:17:40 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 55EC980545
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55EC980545
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.130.47;
 helo=dd5108.kasserver.com; envelope-from=dev@andin.de; receiver=<UNKNOWN> 
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55EC980545
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:17:40 +0000 (UTC)
Received: from [192.168.178.58] (54f72cad.static.cust.trined.nl
 [84.247.44.173])
 by dd5108.kasserver.com (Postfix) with ESMTPSA id D457052474D6;
 Thu, 26 Dec 2024 22:09:20 +0100 (CET)
Message-ID: <f76a3128-eff4-4148-aa20-f9358c159846@andin.de>
Date: Thu, 26 Dec 2024 22:09:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Daniel Lang <dalang@gmx.at>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20241203220949.1073051-1-bernd@kuhls.net>
 <20241203220949.1073051-6-bernd@kuhls.net>
Content-Language: en-US
From: Andreas Naumann <dev@andin.de>
In-Reply-To: <20241203220949.1073051-6-bernd@kuhls.net>
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=andin.de; 
 s=kas202409091056; t=1735247361;
 bh=Ox1juzKSKrIgOHGn6uELcrJOiEXtVrHtlP5kqHv5Rtw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ocxA54dgCCKfcXQqYmaokKsxtVV44hxtKUXf88WFS/FDIoL1Foa0m6cvKHD7E6UQx
 YMGpJUKTwYvPoFIpkaB3DsKjYYqy4/tCtEg1FF0x0QSvesnARQsMGlzbPMCZM8GeDo
 WrmKuokaP3fBVvcPwGZp4MbesWYnQVBc1rLuY1PtCft/CigV3O5deRp7u0buj5iOm0
 RGNpH+SOcX7bF3WPJxFt5lS8id9oghp+4O9p2NFm7wlpKYnCEur9p1UiHoQ//7ZsDp
 /BdK1juWnXtQeYVBV23czA2OE5UmNGQDo/REHL3ontuN3jzMC+P2F1v406c+Jt6IHY
 /TKPNhsB4OSyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=andin.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=andin.de header.i=@andin.de header.a=rsa-sha256
 header.s=kas202409091056 header.b=ocxA54dg
Subject: Re: [Buildroot] [PATCH v2 6/7] package/{mesa3d,
 mesa3d-headers}: bump version to 24.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,


On 12/3/24 23:09, Bernd Kuhls wrote:
> Release notes:
<snip>

>  
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE
> +	bool "Gallium llvmpipe driver"
> +	depends on BR2_PACKAGE_MESA3D_LLVM
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	help
> +	  This is a llvm opengl implementation using the Gallium3D
> +	  infrastructure.
> +
> +comment "llvmpipe driver needs llvm"
> +	depends on !BR2_PACKAGE_MESA3D_LLVM
> +
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
>  	bool "Gallium nouveau driver"
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> @@ -212,8 +232,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
>  	help
>  	  This is a virtual GPU driver for VMWare virtual machines.
>  
> -config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
> -	bool "Gallium swrast driver"
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE
> +	bool "Gallium softpipe driver"

I found two remaining occurences where
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST is selected and probably should
be renamed, e.g.

 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST
        bool "Vulkan swrast driver"
        depends on BR2_PACKAGE_MESA3D_LLVM
-       select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
+       select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE
        select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
        help
          Vulkan swrast driver.
@@ -344,7 +344,7 @@ comment "Off-screen Rendering"

 config BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
        bool "OSMesa (Gallium) library"
-       select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
+       select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE


In addition, looking at the commit you refered to above, it seems to me
that now it's possible to use either softpipe or llvmpipe for those
options. But I'm not sure if I understand things correctly here.

Anyway, thank you very much for this series as it allows me to fiddle
with the new -Dteflon option.


regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
