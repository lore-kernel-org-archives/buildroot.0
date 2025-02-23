Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D793C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 14:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 164E780EF5;
	Sun, 23 Feb 2025 14:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQbsi2jWceez; Sun, 23 Feb 2025 14:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1613D80EF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1613D80EF6;
	Sun, 23 Feb 2025 14:22:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FD9F920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 14:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F7DA606DC
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 14:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XxmXBYmcipL for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 14:22:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FD1C606E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FD1C606E1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FD1C606E1
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 14:22:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2F64960136;
 Sun, 23 Feb 2025 15:22:44 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 15:22:43 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 15:22:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>
In-Reply-To: <20250220042734.23880-1-christian@aperture.us>
References: <20250220042734.23880-1-christian@aperture.us>
User-Agent: Webmail Free/1.6.10
Message-ID: <bf1b2403419c499cf401e2e07fe6e5d1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740320568;
 bh=po+rE9z42ZIbxdqZhfk0S9s8JPUx7wfUbcMWptrDzOM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jjlB/P/elj7kcVtCh7nIwUdKMUFMvQ90nfa80vVvsC2hHSMxVgjPh31iwaGz/BURO
 dhTKzYIDiMfUtWwNNyYUSEGkxRnAZRwfvN0GFYbKNglAThgBLCB1T146fMQnxIpd12
 kaXjhA9bh+rdSHbXVx9idQQPUaXEWecM6/ZTSv35usm+sOxgBkzjzjvLgBpGhEh3s2
 RVBulll/H91Di5dJNBKJK22iBxJACFSa/r1KROFIS75hxZ9Q0B3dq9ZCN9ErQpqnDu
 YJeo4FgFQ5i3kIk591lLrU+LrdHb5c/iaJI1oMWmw8MMT/OABnVAIzZC2TctfO9pog
 WU1INGZouW7kQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jjlB/P/e
Subject: Re: [Buildroot] [PATCH v1 1/1] package/rpi-firmware: remove broken
 32-bit binary install steps
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian,

Thanks for the patch!

On 20/02/2025 05:27, Christian Stewart via buildroot wrote:
> rpi-firmware currently refers to the following version:
> 
> https://github.com/raspberrypi/firmware/tree/5476720
> 
> The "opt" directory no longer exists as rpi-firmware removed 32-bit 
> binaries.
> 
> Drop BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG as vcdbg no longer exists.
> 
> Drop the RPI_USERLAND conditional to install non-existent files in 
> opt/.
> 
> Fixes the build on 32-bit raspberry pi systems.
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/rpi-firmware/Config.in       | 12 ------------
>  package/rpi-firmware/rpi-firmware.mk | 20 --------------------
>  2 files changed, 32 deletions(-)
> 
> diff --git a/package/rpi-firmware/Config.in 
> b/package/rpi-firmware/Config.in
> index f99c116ca2..4dda33a713 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -100,16 +100,4 @@ config 
> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>  	  overlays, to support HATs (Hardware Attached on Top, add-on
>  	  modules).
> 
> -config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG

Since you are removing a configuration symbol, the corresponding
entry should be added in:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/Config.in.legacy
See also the comment in this file header for further details.

The entry in Config.in.legacy should be, for example:

config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
	bool "rpi-firmware vcdbg has been removed"
	select BR2_LEGACY
	help
	  The rpi-firmware vcdbg installation option has been removed
	  as it was removed from the upstream archive.

> -	bool "vcdbg"
> -	depends on BR2_arm # prebuilt arm binary, rpi-userland
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
> -	depends on BR2_INSTALL_LIBSTDCPP # rpi-userland
> -	help
> -	  Install vcdbg, to help debug communication with the GPU.
> -
> -comment "vcdbg needs a glibc toolchain w/ C++"
> -	depends on BR2_arm
> -	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
> -
>  endif # BR2_PACKAGE_RPI_FIRMWARE

Can you send an updated patch with that addition, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
