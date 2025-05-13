Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA13C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 21:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D399360610;
	Tue, 13 May 2025 21:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYn4cM2UVvTU; Tue, 13 May 2025 21:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B9FE6061E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B9FE6061E;
	Tue, 13 May 2025 21:56:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 348C312A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ACF941A46
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G92sKwi1zumy for <buildroot@buildroot.org>;
 Tue, 13 May 2025 21:56:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75E8E40135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75E8E40135
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75E8E40135
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:56:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A102C780316;
 Tue, 13 May 2025 23:56:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 May 2025 23:56:25 +0200
MIME-Version: 1.0
Date: Tue, 13 May 2025 23:56:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250512211344.721883-6-buildroot@bubu1.eu>
References: <20250512211344.721883-1-buildroot@bubu1.eu>
 <20250512211344.721883-6-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <701b26c227f8f2d005f772a76cc54eaa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747173387;
 bh=OM/HR6ts1dpvO6WchaDNAHRcS5CIJmknGhAJz3+aWzY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NlPFSU7jsCplOqls5hfvpW/hES/gk+J2jsrsE7OzUNgXOqbMUH5t64kml0gsUJH1s
 QbWjVaR/IoI+nLH3x/IzO0VvxXloqNwh8/EQeLu7yJk7JEraMZKNySKYN26LMcwQ2z
 4RQb5SE6NZjKvu3EcizMvmKGnkZR9Y73OQ5N7/kdd3hI5w6mgl5MKVqyYTsKhXJ1qB
 FNfXqRL5WR1A8/VwepWvQ8NRv31+B+MbeNfnos3syigbC9b0e54OsbVYBT6hXw93k7
 TCo4OO5+Pb7HKuCqBUuSF7/CyZjD9wEiInOcKTnlKrcoKiIELaoORWF0txozl4dHbg
 KudPkPYbZClWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NlPFSU7j
Subject: Re: [Buildroot] [PATCH 6/7] package/python-pydantic-settings: bump
 to 2.9.1
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
>  package/python-pydantic-settings/Config.in                    | 1 +
>  .../python-pydantic-settings/python-pydantic-settings.hash    | 4 ++--
>  package/python-pydantic-settings/python-pydantic-settings.mk  | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pydantic-settings/Config.in 
> b/package/python-pydantic-settings/Config.in
> index 0e8dbc29b5..76cf564f0c 100644
> --- a/package/python-pydantic-settings/Config.in
> +++ b/package/python-pydantic-settings/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_PYDANTIC_SETTINGS
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # 
> python-pydantic -> python-pydantic-core
>  	select BR2_PACKAGE_PYTHON_DOTENV # runtime
>  	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
> +	select BR2_PACKAGE_PYTHON_TYPING_INSPECTION # runtime

The check-symbol script generates an error here:

     utils/docker-run utils/check-symbols
     package/python-pydantic-settings/Config.in:6: 
BR2_PACKAGE_PYTHON_TYPING_INSPECTION referenced but not defined

>  	help
>  	  Settings management using Pydantic.
> 

Can you send an updated patch addressing this issue, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
