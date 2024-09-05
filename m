Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18B5CD5BAE
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 12:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5300880C3E;
	Thu,  5 Sep 2024 12:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0f2oEV-Zvi-x; Thu,  5 Sep 2024 12:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E91C80BA6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E91C80BA6;
	Thu,  5 Sep 2024 12:05:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F35B1BF403
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 12:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF3A180BA6
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 12:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkIJJNzEdeiy for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 12:05:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE7AF80B9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE7AF80B9F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE7AF80B9F
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 12:05:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1CD4D13F89C;
 Thu,  5 Sep 2024 14:04:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 05 Sep 2024 14:04:58 +0200
Date: Thu, 5 Sep 2024 14:04:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Message-ID: <ZtmeaiPGkdpfNW1T@landeda>
References: <20240905094828.1313494-1-guillaume.chaye@zeetim.com>
 <20240905094828.1313494-2-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240905094828.1313494-2-guillaume.chaye@zeetim.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725537905;
 bh=tcBJb1YouX77eHw1HLE3YrdX3lti2JfB7ymfbvkJLI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IZkLcqEyAsFvzsrd+7WK+0cpxYz9kegf+Hs11PfeUE3Y5jtUXb1Kg6Nm6okxV0+Dz
 RoliXGoDP4Z7BEI0K3k02jAJDIxuSjwqvy9HRM/APvK+dyr5DzYGQQrbFO+2NePU0v
 Ocm0h5KTQxbQk1JQOKga/PDAMmg5lTi7d7e9bfQHWNhuPnodyh4XRNAfe0TEE7gREE
 cUUe4rJHELXBpH3cusGdt2CSx7eb9DNY/RoAmOXXuJOPLnoVRx42oUYa++C61VGo3I
 C1lLIf8zb6Uz7EKDQPQjSCG61t/KOuv/y3rUc4UosQlJUYwiQwlpqhm1AxJlIvKXnB
 Zbv1JYYJIgdeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IZkLcqEy
Subject: Re: [Buildroot] [PATCH 2/2] package/systemd: add efi support option
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
Cc: Christopher McCrory <chrismcc@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Guillsume, All,

On 2024-09-05 11:48 +0200, Guillaume GC. Chaye spake thusly:
> We need to compile systemd with -Defi=true flag to mount automatically efivarfs in /sys/firmware/efi/efivars

Please, wrap your commitlogs to 72 char-wide lines.

> Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
> ---
>  package/systemd/Config.in  | 3 +++
>  package/systemd/systemd.mk | 7 ++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 345f08590e..d1ca6e7f85 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -161,6 +161,9 @@ config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
>  	default "x64"   if BR2_x86_64
>  	depends on BR2_PACKAGE_SYSTEMD_BOOT
>  
> +config BR2_PACKAGE_SYSTEMD_EFI
> +	bool "enable EFI support"

With this, when the user enables BR2_PACKAGE_SYSTEMD_BOOT but does not
enable BR2_PACKAGE_SYSTEMD_EFI, then -Defi=true is still passed, and
systemd still has EFI support. This is misleading, because the user sees
"enale EFI support" disabled.

But see below..

>  config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
>  	bool "enable journal remote tools"
>  	select BR2_PACKAGE_LIBCURL
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 5dca8681bc..7b3eabbd0d 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -660,7 +660,12 @@ define SYSTEMD_INSTALL_BOOT_FILES
>  endef
>  
>  else
> -SYSTEMD_CONF_OPTS += -Defi=false -Dbootloader=disabled
> +SYSTEMD_CONF_OPTS += -Dbootloader=disabled
> +ifeq ($(BR2_PACKAGE_SYSTEMD_EFI),y)
> +SYSTEMD_CONF_OPTS += -Defi=true
> +else
> +SYSTEMD_CONF_OPTS += -Defi=false
> +endif
>  endif # BR2_PACKAGE_SYSTEMD_BOOT == y

The -Defi option should be moved outside the bootloader conditional
block altogether, and BR2_PACKAGE_SYSTEMD_BOOT should select
BR2_PACKAGE_SYSTEMD_EFI.

Regards,
Yann E. MORIN.

>  SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
> -- 
> 2.39.2
> 

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
