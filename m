Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8BCC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 17:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F9FD60A74;
	Tue,  9 Jan 2024 17:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F9FD60A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VbaB_kKbDb2T; Tue,  9 Jan 2024 17:56:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8405660A6D;
	Tue,  9 Jan 2024 17:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8405660A6D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4203D1BF3C8
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 17:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27D9382796
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 17:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D9382796
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L4dDCh7dmziv for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 17:56:25 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3783882681
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 17:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3783882681
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 02B062C801DE;
 Tue,  9 Jan 2024 18:56:22 +0100 (CET)
Message-ID: <151dd1a8-4860-454c-a04a-fb109268c73d@bubu1.eu>
Date: Tue, 9 Jan 2024 18:56:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240109074222.4046259-1-james.hilliard1@gmail.com>
In-Reply-To: <20240109074222.4046259-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1704822983; bh=g36TaOZzdr/0WdnLZJJTU82NGathkEsxBl0pKMG+8Z8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=j1F3NfPPWY8ICc7pUuLeo8CjtfNx4dt1fXZl4HhnEPIgyVQcvlaaPVNIiFZnESNEf
 WgviYr22l7+bXZafmkqWFM5hPsoMuw3LpWr9j3Nnw4Mm5VqgIS6vAhdvLUHyPLulX5
 1LmSXXeDPG55TL5HYzp+ar4zhqInGNCS5iecjmlLg9bZmI927U/KYubUIQHGCAdosH
 zWwzNTrIXAxBe8h1FAWZJMJ/o1lzbs4tyP0lLTm9BQD5igHjtlqIh9Z98si7DaH+Fj
 xe0zaXdc4IS/THeEZFChYM4a4cnHodxnaR68v3EmLJ8KOZBwLelHYN9F+xniwJbmNe
 bflCH8QrTdu5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=j1F3NfPP
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-fastapi: bump to
 version 0.108.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On 09.01.24 08:42, James Hilliard wrote:
> Remove no longer required python-anyio runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>    - fix commit message
> ---
>   package/python-fastapi/Config.in           | 1 -
>   package/python-fastapi/python-fastapi.hash | 4 ++--
>   package/python-fastapi/python-fastapi.mk   | 4 ++--
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
> index 7d376d3dd7..d4a527c601 100644
> --- a/package/python-fastapi/Config.in
> +++ b/package/python-fastapi/Config.in
> @@ -1,7 +1,6 @@
>   config BR2_PACKAGE_PYTHON_FASTAPI
>   	bool "python-fastapi"
>   	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
> -	select BR2_PACKAGE_PYTHON_ANYIO # runtime
>   	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
>   	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
>   	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
> diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
> index 3dc1578cb7..8c578a386f 100644
> --- a/package/python-fastapi/python-fastapi.hash
> +++ b/package/python-fastapi/python-fastapi.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/fastapi/json
> -md5  06bfa7c610fc9e81d05b0319eb70cae7  fastapi-0.105.0.tar.gz
> -sha256  4d12838819aa52af244580675825e750ad67c9df4614f557a769606af902cf22  fastapi-0.105.0.tar.gz
> +md5  6dd5b159f2d6a7c405b4cb5cb9afb564  fastapi-0.108.0.tar.gz
> +sha256  5056e504ac6395bf68493d71fcfc5352fdbd5fda6f88c21f6420d80d81163296  fastapi-0.108.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
> diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
> index dc6d919926..dd435445cb 100644
> --- a/package/python-fastapi/python-fastapi.mk
> +++ b/package/python-fastapi/python-fastapi.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_FASTAPI_VERSION = 0.105.0
> +PYTHON_FASTAPI_VERSION = 0.108.0

fastapi 0.108.0 requires starlette>=0.29.0,<0.33.0: 
https://github.com/tiangolo/fastapi/blob/0.108.0/pyproject.toml#L43


So I think they should be bumped together?

>   PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
> -PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/77/bb/5941e6e2ce3020f64b539a49d39f49be05de17d0c47fea95012589f812a5
> +PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/cb/0d/ec01761249b228f288b693a7ad6b2e695af521ca0f32dd09aef58890d9a4
>   PYTHON_FASTAPI_SETUP_TYPE = pep517
>   PYTHON_FASTAPI_LICENSE = MIT
>   PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
