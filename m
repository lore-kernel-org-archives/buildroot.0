Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D93E7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D20D560683;
	Thu, 12 Dec 2024 21:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WaGOr4gEPuOC; Thu, 12 Dec 2024 21:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAEBF60602
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAEBF60602;
	Thu, 12 Dec 2024 21:37:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F34D1146
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F078280C90
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kegxVBZoWk0 for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:37:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFA0580C5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFA0580C5A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFA0580C5A
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:37:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A57A9780368;
 Thu, 12 Dec 2024 22:37:20 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54152])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Dec 2024 22:37:20 +0100
MIME-Version: 1.0
Date: Thu, 12 Dec 2024 22:37:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Sergio Prado <sergio.prado@e-labworks.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20241212155228.885926-1-dario.binacchi@amarulasolutions.com>
References: <20241212155228.885926-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8680f58e9a978f25124fb966d6ea1443@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734039443;
 bh=0yBKxMt++XxE/tsUbaQAEasaw8Nm2S4mPNF+/tAxWww=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sbVIgYvXBoEtSd1I4j4/2eIYKG8uiAyQFQzvu1v3i1c80MzCFOY9E+FeIyQi1NJEe
 b40CIjKw4q9z/xx7QJD1FEusnfjHFWimBpBIQQ7Ve2GE098GC9u+ZsKBgcqq0jfmIS
 y+EVuzpZp/wKfNArCRYgjjm8FF9rzwypzrZ0gpUv7tqxj3dsRrBLLjT7cL6No2hK/v
 SmgkvqgjENR4AQne+kzcRxwOdhyYYb9toDDmicflGh36lnDmp92L2nzdDVr3tsfdLO
 ip4TRDpbwqWba1a5SdVQnxTWjTc+v8NDfhJVS6ff4kqnoDsf4QYVPuf6zehrDIs+Dr
 XXd2238m4+4lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sbVIgYvX
Subject: Re: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: bump to
 version LTS_08_2024
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

On 12/12/2024 16:52, Dario Binacchi wrote:
> Release notes:
> https://github.com/Azure/azure-iot-sdk-c/releases/tag/LTS_08_2024
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

> ---
>  package/azure-iot-sdk-c/azure-iot-sdk-c.hash | 2 +-
>  package/azure-iot-sdk-c/azure-iot-sdk-c.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash 
> b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
> index fdc1acc62401..cc6b6589adf3 100644
> --- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
> +++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  
> 73bf42846089152d298d4a3810df274820aa84013943676eb71a7d4131a4a769  
> azure-iot-sdk-c-LTS_08_2023-git4.tar.gz
> +sha256  
> 3dbb005bfadc6162906d4ba3c8599b4ec39025d474fc5337546f7447584041bc  
> azure-iot-sdk-c-LTS_08_2024-git4.tar.gz
> 
>  # Hash for license files:
>  sha256  
> be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  
> LICENSE
> diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk 
> b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> index 4d0ecb077f8b..909b3d6b83ce 100644
> --- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> +++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -AZURE_IOT_SDK_C_VERSION = LTS_08_2023
> +AZURE_IOT_SDK_C_VERSION = LTS_08_2024
>  AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
>  AZURE_IOT_SDK_C_SITE_METHOD = git
>  AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
