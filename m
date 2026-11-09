Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52A6606A333
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 13:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bex43LUN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=iu7ge1D5
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B42B80F6E;
	Mon,  9 Nov 2026 13:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMYXp6MUJNfp; Mon,  9 Nov 2026 13:23:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E2E3A80F24
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794230588;
	b=YiZl1yjIG11rGpD4WmIdQJMu6VidYE9BEsYuT+9nHe2P7iySHT+Ci0Hd6EUvSyREBqVo
	 yBk91o9g2dxytN0XOI+G2vwn7uF+h8OsLkjHsYNAVb8cB0qWV22IV8/ECBY+THWPnwVEB
	 TuYEBANLr+wLjioUeu5Z4cXINewOKmKDfca7D1Bfy+r6d28O0/M0SWzGTla5Ew1P2RTi3
	 c0d4FlcC7ExxPnDumWopR9U0aPCmeCYWsGbH7pFgFMsP0JcRoNUhJ0lAt+1WWKBP82O0m
	 whkOC5fCiYu5Q4BDiyG9qjaq/C4ph230BpAUWDGis/NKAnERKTggV6IfV4xrHrWN2xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794230588;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:From:In-Reply-To:X-CMAE-Envelope:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=xmvKh8e4UCiW5esXRkHh84SNSsKDNyphBcvh7a6eIVI=;
	b=NshAO2clUB71HiiuAbcNechCUHueEISuobt9XytZm+QJrx/sUHsGTOT1WGMPkqzj5OUj
	 Womz5fEJ2s7VYTf9HdeUT7Jv/fOfILAULUZqJxWfBODEwPrOETBRB1jn2iZsdBTfOTiIz
	 oC7KKYBYs/RzCoB4f7b3tyggZCG3JPtwkV2LF7c0OJnGd2RSLFbG/1HyJOpAsCTq4ZMMT
	 l2uUXA5KzCL2kLTqyxJtxOUAQxySX1yi43htuFYojCFXLHrYJUnwUP23ns+awNFx1qJYB
	 r+DILxGvFCmv34eNdlO0T2TF+5185pz+SHccvxDbWP6lXYSktZNunSXiP0U0ANrzu0g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794230588;
	bh=xmvKh8e4UCiW5esXRkHh84SNSsKDNyphBcvh7a6eIVI=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bex43LUNhx/7ywNDsvOXWQgFRPUChWOMGrvNE75lCKj5qaOldH4DsUdhvDGnoQfIV
	 HprtYDu0nlKyZRmFudmQFlmONkjr65YqAqdquPPGIvd7yjQ8Ip84ZmaiAg4pKzZ3M/
	 JFwsZkd1shQjIF3lwowBbTi9mN8l3+NUb9tvXs2XN2sWmWz4x/7iWd3hQZ12TMzBaJ
	 KGlNbogpOHq0fPGg5Gua2lfZzxjdqUA55KK0rmWVaZWHkHiqCafpkUl/4iwmdjmawa
	 H6Kv2TavyDCsaRaQz5WsTsr/RAYtH/RhIskBOCw3diJxRU70J5i/YntndzBYQk0bTm
	 levWkhJrOA6Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2E3A80F24;
	Mon,  9 Nov 2026 13:23:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A6BA251
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5090B60744
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gA6HzkE93mF4 for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 13:23:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C315B60741
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.147
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=iu7ge1D5
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C315B60741
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:23:02 +0000 (UTC)
Received: from [192.168.1.115] ([151.95.84.63]) by Aruba SMTP with ESMTPSA
 id QPKuxtpBjyeI3QPKuxMnk2; Mon, 09 Nov 2026 14:23:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794230580; bh=+SDttmEBz4GAEoDntdayYIHf0TkWckHgYRz60MWmQHM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=iu7ge1D5pRv3YfaMD+ZART/pnvxgsu3iHnxLl5lLSxkvTBt/sT5BLNO9rWReXSTBa
 Z9MZ6gNki6vOjokIzwMHnk8Tgzpi2A7Uq8lbu2KncHgH2RCSxle/2u0vpLks0ubJLG
 GidhorocZsDaW2JSXxRMw1BnFXChWI1br0EmQMEfq5qnJXkfOab96WHP/72iM6G6Gx
 uPu+h6hGGRJlkdAvOFDZoJ/s4Y5aGlTvKOMBoarnyFBsiwy6/H7OIc/SvoAST7KgN9
 5eaB5Ptazvymrvwt8EtkLKC8HyQF3Pzsa5D1fnRMdeKiY4jQ2PqkTgQeWZ4l+pd0xx
 bI2vD11SKBcqw==
Message-ID: <397db084-f5c3-4e61-940f-e170849d8442@benettiengineering.com>
Date: Mon, 9 Nov 2026 14:22:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
References: <20261109110029.1306930-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20261109110029.1306930-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfPLoi6abqA5gTQvXQZ+unoDI2zWAdbu+QFBdVQ56oCufBbdvVsMWssTQ51PHEaH54QGJAd3yGxXs/B0nLnTNsN+YKggNDViLFQzJ3SPkAfuRrMEnc6f3
 FM11XsykL46mDJ0NmHoMqqg3uLWwj9d4wfs6vi6BwLwnZQVeotDg3LN9FlNnxc+8jsYdUYJ91k1PzoJeqr+YM4TFN+ZOc9IqUB3iN+0aSZYiaH2sSdeD8LL3
 H3rkXdo+8GlKIjLJmw0KpA==
Subject: Re: [Buildroot] [PATCH] package/rtl8821au: bump to version
 2025-12-13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/9/26 12:00, Giulio Benetti wrote:
> This commit allows to build with Linux up to version 7.3.

Fixes:
https://autobuild.buildroot.org/results/bb893e7cab68477a5e3000d3fefabd4ee7094f24/

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/rtl8821au/rtl8821au.hash | 2 +-
>   package/rtl8821au/rtl8821au.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
> index ca5f9f15df..0eeb72288a 100644
> --- a/package/rtl8821au/rtl8821au.hash
> +++ b/package/rtl8821au/rtl8821au.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  1d9f87c7a30d54f67cb09e98a436565ba9c64a28feca95205f66212d8833836c  rtl8821au-bb26b6b06c47b79c17426ef186f44a608dbed7a0.tar.gz
> +sha256  866b642868faf6844f7e2c7f83f05f965355eacb51c7d07e24ab6ed9df22bbc4  rtl8821au-3eee07cb78dd0bc9a89b7fe383e467403efb3b97.tar.gz
>   sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
> diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
> index 4e7aee4204..7c5a3dfa50 100644
> --- a/package/rtl8821au/rtl8821au.mk
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8821AU_VERSION = bb26b6b06c47b79c17426ef186f44a608dbed7a0
> +RTL8821AU_VERSION = 3eee07cb78dd0bc9a89b7fe383e467403efb3b97
>   RTL8821AU_SITE = $(call github,benetti-engineering,rtl8821au,$(RTL8821AU_VERSION))
>   RTL8821AU_LICENSE = GPL-2.0
>   RTL8821AU_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
