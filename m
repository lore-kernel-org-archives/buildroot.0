Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E66C8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 13:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4693541724;
	Mon,  7 Jul 2025 13:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YL07MOGdWvi0; Mon,  7 Jul 2025 13:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74C1C4169D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74C1C4169D;
	Mon,  7 Jul 2025 13:16:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E17315F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23B1F4169D
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfsJnExgWu8B for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 13:16:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C220B415E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C220B415E7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C220B415E7
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:16:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.75]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXuB-1uApKF1Cgh-00NOCq; Mon, 07
 Jul 2025 15:16:44 +0200
Message-ID: <64f42aec-d0a7-463e-8ac7-64f1272c80d4@gmx.de>
Date: Mon, 7 Jul 2025 15:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20250707115557.171144-1-fiona.klute@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250707115557.171144-1-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:CbGd0SgBNuDziVnNTjNjj4BIbahrt95YMPYNDRPlNGsJ8F1i+wD
 TZYcXBxkF7Xpv8XhRk4V8ZB9h1doWEJO+Vt+msqcVyWTeiW75jfUv3Lfph4FEH+4jGVqjNs
 4Rn74/+tPWfZVOKBG4cr/669oEoVUQxZj+EqlK49nsHi80Tmj+PQd7wGHjgbwjcmxURLw51
 MXaDrD017N4yYOvwsQS5Q==
UI-OutboundReport: notjunk:1;M01:P0:7kNZPJFQdKA=;afipJW7pTgaEEEV/64cKFgFJvW7
 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
 6Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1751894204; x=1752499004; i=fiona.klute@gmx.de;
 bh=X7YHXx2jSQ3wVInu6JPtjqzIN6V8a2ehVLu2YQFJZac=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=fcPYR40S5x1epQNH50uG5HDhZPP9B+pxr7O6H1XkoJ8DXHO7kvhfJMu6HVLTcvBE
 aw1FYBHKCljW+HPbVqHTiAYPaXlZLjxMiQfOR9HRfXv4mKGeCXWij4QBaBO9m0g/O
 3BF4Td+26jKcPDH2KT5qm9ZC4F5ibuFNvT36eoqtDLJzmyExlhq8D5TmonYwF0uMo
 SWr+YYaLtJlTl6Z9amUr52Qc9n033jkJrmGyjAK4wSB9A2T4JgU31szDLIrP018Pm
 TjQo/WOvG/2zo215ji3bWQJLbO3bPuuWaye9jUVGXS3rtFTJeuWpZzq0Cd8LdH57E
 J4lIM9aFJF39QHztqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=fcPYR40S
Subject: Re: [Buildroot] [PATCH 1/1] package/genimage: bump version to 19
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

I forgot to run "make legal-info" before sending, the COPYING hash 
changed. Will send an updated patch soon, sorry about the noise!

Best regards,
Fiona

Am 07.07.25 um 13:55 schrieb Fiona Klute:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> This adds support for btrfs partition images, among other things.
> 
> Upstream changelog: https://github.com/pengutronix/genimage/releases/tag/v19
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>   package/genimage/genimage.hash | 3 ++-
>   package/genimage/genimage.mk   | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
> index 232ba6ef66..7bfd6f5dad 100644
> --- a/package/genimage/genimage.hash
> +++ b/package/genimage/genimage.hash
> @@ -1,3 +1,4 @@
> +# From https://github.com/pengutronix/genimage/releases/tag/v19
> +sha256  7ec4fcb865662a8b2ff20284819044ffa84137bf3ca16fb749701291bc01f108  genimage-19.tar.xz
>   # Locally calculated
> -sha256  ebc3f886c4d80064dd6c6d5e3c2e98e5a670078264108ce2f89ada8a2e13fedd  genimage-18.tar.xz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
> index b8ce7ff3c9..5fa34d8eb9 100644
> --- a/package/genimage/genimage.mk
> +++ b/package/genimage/genimage.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GENIMAGE_VERSION = 18
> +GENIMAGE_VERSION = 19
>   GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
>   GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
>   HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
