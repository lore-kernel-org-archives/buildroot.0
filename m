Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2CEC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 21:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7829181156;
	Fri, 10 Jul 2026 21:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzuuVC_cyyU7; Fri, 10 Jul 2026 21:59:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90DF781157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783720780;
	bh=Dliu5l0g4XC1wYTCMhFVCkvfWk5iXQH1m6kl69jYoGo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WVygreCfR8hDdn56eBa2P5o6ZQ+h65J6sTlY5kV5Yjy0xIf3VvVkTuoacUuoJj61C
	 36WjU/n5yXnyxAwk5Kgey3DR+aXgHnhwkHx5hOcBTTquSvDxdP5AsiGcpOd2O5DhPn
	 R3anvf8Zc6xvQhaK0UxNHyxCXkIG3VuZD8vddqDxxSX8ssMbZFhEmTcnCfbkv535j0
	 UjUTeQOe/IFS7Y0IN4QvwxeNgne938KeC7nltCEeDr946aJhdHOBJM5bKHhsYpxzgd
	 pFz7BcuU2+XON4MJF6sRR04YMyPGfgafUfOVz/MAJMZqIheUl6wG3ceM50fKfOyo4q
	 6zaVyhRyYod9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90DF781157;
	Fri, 10 Jul 2026 21:59:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 696842EE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 21:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A33A81156
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 21:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfo-xizYPjJg for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 21:59:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CFCA81150
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CFCA81150
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CFCA81150
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 21:59:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCpb-1xJ1Nv2nO3-00gs6a; Fri, 10
 Jul 2026 23:59:28 +0200
Message-ID: <afb9a54e-f5bc-4c84-8844-8244ebaf69f3@gmx.de>
Date: Fri, 10 Jul 2026 23:59:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260709131720.1250301-1-dario.binacchi@amarulasolutions.com>
 <20260709131720.1250301-3-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260709131720.1250301-3-dario.binacchi@amarulasolutions.com>
X-Provags-ID: V03:K1:fgRmDNve5T1vcUwL6wwWit9g66aDtPonEIaZ4rieb4x3HD5g5z2
 8dFrwKmjLBToe+ms6asYDkBkJgi/xZhnpKTe6XUliSgwn4B+Av7e0bNRV6/KRo3wc5nzOB2
 sabomN3botfV8if8g8yL5mFu5OLcZZnI+PsXkhWkPlY60hM36kuE1TEliLYxZ8aSs+/RD/Y
 AmRZ/6ugD+5+XB6f+2Q/Q==
UI-OutboundReport: notjunk:1;M01:P0:834DUpLZhzA=;nkNc1u4hlsC2lfKJ3idqxcK8liu
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1783720768; x=1784325568; i=fiona.klute@gmx.de;
 bh=sLOf2imYKC2DibwULcNLamTzZig7/a/M+pJgK0QC0dk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Cu+UjcSFN6/O7It0MqqyXQguKdcnh7hPw9mGhDKpUHRnKSEDIY21vH5aIBXuK757
 lkOGv5HszWvgbdUNy+HGw6AEnpjIRzcF6kFBK4HAMiP0cxyZ3Ru2ZFtx+2m0ObIKu
 nrXW3Ri8CWZqJkA6dEO1PmVoWCg+LVk8Ghzj8ndQJKl2WPjYZU1JjRoUFPBkFC8Cu
 GfkZxE0OsUxBeN5aZLPpxOi8F1frafN7JpDLQZOP+IiWf6VjC6uxwwYX+KkfH9r1/
 cGC8+9njsGOhNQU1UtkBEzhn8M8OBowEUP7XA80U4Fz52YiWti0dD5rL6+9halijS
 0gygFIgB8XpXdrblLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Cu+UjcSF
Subject: Re: [Buildroot] [PATCH v2 3/3] boot/uboot: bump to version 2026.07
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 09.07.26 um 15:17 schrieb Dario Binacchi:
> Release announcement:
> https://lists.denx.de/pipermail/u-boot/2026-July/624082.html
> 
> Changelog:
> https://github.com/u-boot/u-boot/compare/v2026.04...v2026.07
> 
> Select BR2_PACKAGE_HOST_GNUTLS_P11_KIT when U-Boot requires GnuTLS,
> since U-Boot 2026.07 adds PKCS#11 support to tools/mkeficapsule.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Tested-by: Fiona Klute <fiona.klute@gmx.de>

Tested in Qemu (aarch64) and on RPi Zero 2W.

> ---
> 
> (no changes since v1)
> 
>   boot/uboot/Config.in  | 7 ++++---
>   boot/uboot/uboot.hash | 2 +-
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 2d2c3f9d4154..69d4e97e7af9 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -41,7 +41,7 @@ choice
>   	  Select the specific U-Boot version you want to use
>   
>   config BR2_TARGET_UBOOT_LATEST_VERSION
> -	bool "2026.04"
> +	bool "2026.07"
>   
>   config BR2_TARGET_UBOOT_CUSTOM_VERSION
>   	bool "Custom version"
> @@ -85,7 +85,7 @@ endif
>   
>   config BR2_TARGET_UBOOT_VERSION
>   	string
> -	default "2026.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
> +	default "2026.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
>   	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
>   		if BR2_TARGET_UBOOT_CUSTOM_VERSION
>   	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
> @@ -228,6 +228,7 @@ config BR2_TARGET_UBOOT_NEEDS_LZOP
>   
>   config BR2_TARGET_UBOOT_NEEDS_GNUTLS
>   	bool "U-Boot needs gnutls"
> +	select BR2_PACKAGE_HOST_GNUTLS_P11_KIT
>   	help
>   	  Select this option if your U-Boot board configuration
>   	  requires gnutls to be available on the host. This is
> @@ -368,7 +369,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
>   	help
>   	  Use binman tool for generation and signing of boot images.
>   
> -	  https://docs.u-boot.org/en/v2026.04/develop/package/binman.html
> +	  https://docs.u-boot.org/en/v2026.07/develop/package/binman.html
>   
>   menu "U-Boot binary format"
>   
> diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
> index 691649825605..e992835582db 100644
> --- a/boot/uboot/uboot.hash
> +++ b/boot/uboot/uboot.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
> +sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
