Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059FBC4167D
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 22:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B12DB8224A;
	Fri,  3 Nov 2023 22:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B12DB8224A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyrC6vSJie2F; Fri,  3 Nov 2023 22:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA62C82022;
	Fri,  3 Nov 2023 22:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA62C82022
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96AEE1BF616
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7ACCE40499
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ACCE40499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XSeJ7XpuhvVc for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 22:01:23 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D470F40182
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 22:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D470F40182
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:207e:5629:5034:6d7b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6F83CB004FF;
 Fri,  3 Nov 2023 23:01:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 03 Nov 2023 23:01:17 +0100
Date: Fri, 3 Nov 2023 23:01:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231103220117.GC2875@scaer>
References: <20231103201131.80826-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231103201131.80826-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699048879;
 bh=uuZrQITPxe12rQIBcvKoPEKy215hKTIgT4SAXhskIP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tZDAsZXEFUTKqS5SmfZ4CAIC9wBF4GWhKOJiGsfiLpmJnAZF1iqaLNRyEOwHGRFqQ
 UpF4Dxm7PyGeGL/VMXj0dfzdnJGAVYnAv78kwAKpT9cgpJeSuTbWeDN+5nyVomQH0y
 +vw23q7F+9v7jcTZRJ06mO9459lM2tVTa2prVTQPKtvCoCrk8vDgYuwvyD85ubhOV/
 CZA6Ni4K98hHH6bCaBqqCTjA7YqFkePrMd4ZrIPNFX5Yl2uWvxiYbsYEI2vuPYX6dM
 5IjhCDLbRAlGMZnDtKIegsivAVCHoEfJRGqCFB5s/4wiqZ3onz5MFxz9htI2zSmtJQ
 Udq1qVxFd+LPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tZDAsZXE
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20231030
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-11-03 21:11 +0100, Bernd Kuhls spake thusly:
> Updated license hash due to various commits:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/WHENCE
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-firmware/linux-firmware.hash | 4 ++--
>  package/linux-firmware/linux-firmware.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
> index 31bbfddfaa..6722aa14c6 100644
> --- a/package/linux-firmware/linux-firmware.hash
> +++ b/package/linux-firmware/linux-firmware.hash
> @@ -1,5 +1,5 @@
>  # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
> -sha256  88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688  linux-firmware-20230804.tar.xz
> +sha256  c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7  linux-firmware-20231030.tar.xz
>  
>  # Hash for license files
>  sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
> @@ -36,6 +36,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
>  sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
>  sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
>  sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
> -sha256  0f87f8f67de39828d8e59c69369f850e0a80de638795e22ddfdd1f7f31cdf889  WHENCE
> +sha256  697134859b663bc110d57275a7a7862bba21c4425266aac8c62bee18202aac20  WHENCE
>  sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
>  sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 0cd1f30c16..c2cf0fec19 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LINUX_FIRMWARE_VERSION = 20230804
> +LINUX_FIRMWARE_VERSION = 20231030
>  LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
>  LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
>  LINUX_FIRMWARE_INSTALL_IMAGES = YES
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
