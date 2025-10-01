Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3479ECCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 15:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1E2E613C4;
	Wed,  1 Oct 2025 15:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4wfwN6SLh3ls; Wed,  1 Oct 2025 15:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17215613C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17215613C6;
	Wed,  1 Oct 2025 15:44:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2EC62A6
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4AE881C11
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0F4iUCWufAW1 for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 15:44:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F079181BC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F079181BC6
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F079181BC6
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:44:49 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:a14e:ad95:d6a9:3433] (unknown
 [IPv6:2a01:e0a:12:eba0:a14e:ad95:d6a9:3433])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id E6BAABFA4E;
 Wed,  1 Oct 2025 17:44:44 +0200 (CEST)
Message-ID: <fb085f40-4394-4870-996a-515af302fe39@grenoble.cnrs.fr>
Date: Wed, 1 Oct 2025 17:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Alistair Francis <alistair@alistair23.me>, Dick Olsson <hi@senzilla.io>,
 Sergey Matyukevich <geomatsi@gmail.com>, Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251001-fix_license-v2-0-bf18911c835d@bootlin.com>
 <20251001-fix_license-v2-7-bf18911c835d@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251001-fix_license-v2-7-bf18911c835d@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1759333485;
 bh=ebvElOb0KSqA2TAMAZRmMsywMpIs7wLns8yYisXVmsU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nQKVcG4Rrw3CjVdGgj0DmIY6orvLV4OQlko2a5JeLQJl8Gu/ilAnBtKWVUf/1HCL9
 IB7p7HL+nOqRS4XxEvcCKoODk2rSwiieutok5tqPI9lGf6NCxDztHou1lwXmc1OZ8+
 m7EBAUKD+smF9CjsUoJhjmV1Y1aQFOmRQpOUcmvXMre/yeG9St38f9zAiVKMZmTiQi
 7AnirY8cOXy4uGnXV8jGkkYiElb8dTZwK44u/eSLDbygKhdgSlrXc/GHeAriIxQMM7
 NtLfxe7pt7gyLC7Ro4IQ/ei/MOJBQVnEIBTw4kkO31TlqgtYSF68G7eJeldsSCldGK
 ppqD0KhkiGwog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=nQKVcG4R
Subject: Re: [Buildroot] [PATCH v2 7/7] at91bootstrap3: Add support for
 custom license files
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everybody!

On 01/10/2025, Kory Maincent wrote:
> The AT91Bootstrap3 package was not providing any license file when a custom
> Linux version was selected.
> 
> Fix this by adding a Kconfig option to specify the license file,
> with a default value set to the commonly used license paths.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change in v2:
> - Do not show license option if it is not a custom repo
> ---
>  boot/at91bootstrap3/Config.in         | 19 +++++++++++++++++++
>  boot/at91bootstrap3/at91bootstrap3.mk |  3 ++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
> index 35bdb28162beda956ff4ffd17772b491bf5f5ca0..987b5eb7efd3d845865d34afaca4f35ae5e88f80 100644
> --- a/boot/at91bootstrap3/Config.in
> +++ b/boot/at91bootstrap3/Config.in
> @@ -66,6 +66,25 @@ config BR2_TARGET_AT91BOOTSTRAP3_VERSION
>  		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
>  	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
>  
> +config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_LICENSE_FILES
> +	string "AT91Bootstrap3 license files"
> +	default "LICENSES/MIT.txt"
> +	depends on BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || \
> +		   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN || \
> +		   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
> +	help
> +	  A space-separated list of license files related to the
> +	  AT91Bootstrap3 kernel package.

s/kernel package/package/

Regards,

Edgar.

> +
> +config BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES
> +	string
> +	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_LICENSE_FILES \
> +		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || \
> +		   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN || \
> +		   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
> +	default "" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
> +	default "LICENSES/MIT.txt"
> +
>  config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
>  	string "custom patch dir"
>  	help
> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> index 4bbe7cc71819bb5841deac0ca9b513e7189796f4..2ed34f3de4d7285f9b14386fe3c21241b65aa4b1 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.mk
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> @@ -25,11 +25,12 @@ endif
>  
>  ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
>  AT91BOOTSTRAP3_LICENSE = MIT
> -AT91BOOTSTRAP3_LICENSE_FILES = LICENSES/MIT.txt
>  else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X),y)
>  AT91BOOTSTRAP3_LICENSE = Atmel License
>  endif
>  
> +AT91BOOTSTRAP3_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES))
> +
>  AT91BOOTSTRAP3_CPE_ID_VENDOR = linux4sam
>  AT91BOOTSTRAP3_CPE_ID_PRODUCT = at91bootstrap
>  
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
