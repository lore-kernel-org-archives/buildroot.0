Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA63C3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 21:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AD5C6064E;
	Tue, 13 May 2025 21:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7G_rAGBl-pSE; Tue, 13 May 2025 21:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE5CA6061E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE5CA6061E;
	Tue, 13 May 2025 21:54:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 601A571E
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 458374126B
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_iHTRfxV-TD for <buildroot@buildroot.org>;
 Tue, 13 May 2025 21:54:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A94941208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A94941208
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A94941208
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:54:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 12E0C780316;
 Tue, 13 May 2025 23:54:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 May 2025 23:54:25 +0200
MIME-Version: 1.0
Date: Tue, 13 May 2025 23:54:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250512211344.721883-5-buildroot@bubu1.eu>
References: <20250512211344.721883-1-buildroot@bubu1.eu>
 <20250512211344.721883-5-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <c5dd507add15a5f36631bb4b1ac30bda@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747173268;
 bh=ItFK5LXJh/FS+pAJjsDEzn3G/WFmJewr0d9AtN9dEDg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d9/pnl+ILmTthBfctJKknivulcHwTTAt1M+hK3NwhMXoDgJEaKzWFUfW4fywfhE3J
 b9XvsE1FrJ3BRFIt1vojM+YiAb6SCFHMCqh8gkyzQTU1WfGhhXds0SbxNT843QvVnU
 6HQFq7T3RyP6Fa3FoZjWy3TQL2p0dWw59zy3VqTlqjfFZGYs97pDpkAjFOc4R8qgrf
 vlOdfz1WLsawsTBETGSW9/u5ybHAYXYaNYt4lvQ5kCrqLIYUWUT+tm5EmIoyJjeiot
 6Yy+9oBE3wVSSikcxx2NN5mWfGkW8B9x62kBUFQzM8Kbpe5u+x9F4UOLyOysyoYn1D
 xMBiEmIwu/F1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d9/pnl+I
Subject: Re: [Buildroot] [PATCH 5/7] package/python-pydantic: bump 2.11.4
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

Hi Marcus,

On 12/05/2025 23:13, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-pydantic/Config.in            | 4 ++--
>  package/python-pydantic/python-pydantic.hash | 4 ++--
>  package/python-pydantic/python-pydantic.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-pydantic/Config.in 
> b/package/python-pydantic/Config.in
> index e9cd2e6780..eebfb3a1f7 100644
> --- a/package/python-pydantic/Config.in
> +++ b/package/python-pydantic/Config.in
> @@ -4,8 +4,8 @@ config BR2_PACKAGE_PYTHON_PYDANTIC
>  	select BR2_PACKAGE_PYTHON_ANNOTATED_TYPES # runtime
>  	select BR2_PACKAGE_PYTHON_PYDANTIC_CORE # runtime
>  	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
> +	select BR2_PACKAGE_PYTHON_TYPING_INSPECTION # runtime

Here, the Kconfig check-symbols script generates an error:

     utils/check-symbols
     package/python-pydantic/Config.in:7: 
BR2_PACKAGE_PYTHON_TYPING_INSPECTION referenced but not defined

This package does not exist in Buildroot. There is a 
"python-typing-inspect" package:
https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.1/package/python-typing-inspect
but it is not the one needed here. The required one seems to be:
https://github.com/pydantic/typing-inspection

>  	help
> -	  Data validation and settings management using python 3.6
> -	  type hinting.
> +	  Data validation using Python type hints.

Could you send a revised patch series addressing this issue, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
