Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C29606A680
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RScGC/hG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FE178203A;
	Wed,  4 Nov 2026 18:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbKRU-bAtTxM; Wed,  4 Nov 2026 18:04:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E96368203B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793815449;
	b=K67WDQ3c3mtQzqgSGEHwhodkJXMgr0ubLmCcQfrRa6GvCVVnKJVcZNOBfxbcyBOIIXD8
	 qOHbw2esOeL+xmMEZ0kLYHypd3fHBiSvarVSWlNe/6U2Q6g0f/2R2rhQ04SXps6Dwntt3
	 ywUWUXv4dmVyytaqzDfPltV34bedCRq8vhlLJCejo/TtrtcDcgEVpMEL9W+ZP6W1csNh+
	 FGMKSXjNlsQaBoWk/5d5DZZM3xu2n3xeH6iVjTDpBnRLs+2nyF8KBEdd+hKPkZNes+lip
	 wM7fnF+/crfSeQ35xxdPxZbwvuSG3H3a057HSOuBAS5nBBDRSjUm6RyE3V+8aZDiVIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793815449;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=n2vMYL7a+Mdx9dhOceV0mFCDzlfFH9M+/gc5gWftezQ=;
	b=fH/HcHFFk3oe5e4s+05pTZGxppBx05e9wiyQRLV1RCTMfAWh/Py2YKr/moPnExpO0c+h
	 bpe8PN3iJ50DQ8gAsagg5Gu8jYHWxPBe2zINHOSq925LGwCGNyycZSOrY61hXT7Nu2dJ0
	 L6YUrIkmly0bllYEd5S6FSsPtJ3M/4+V/OCGm3y2KwA27u5ePMod38yeiTzEw9GaoQ5Bi
	 jQPL9J3GM+4aaacvw/AvryK0gHL2TaCkLDHStq9wdBR2CAIPn1bjMGacxoBtRkrfFXgL/
	 SJshVeT+iDKJnDUccnG82Zkf5nmsWjqZomZK7qYMd5l+dyn438EqXnTw1CAIZxgzjOg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793815449;
	bh=n2vMYL7a+Mdx9dhOceV0mFCDzlfFH9M+/gc5gWftezQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RScGC/hGVGlDky/TJxxhvwgPibzaVTJT0WbpSbtcigCbt0OgxyBM7XhN6clc3VfSD
	 S+dGfZjmVU+c2bZfreoMFUouAJlJ0r1/F0HQVCPNp6O3lHohDyXJep4gd5tSPBYQUM
	 lzxcs/haXWXlM72k0lJ6mgdkZnAd/Qpkgha4FnBAN/Evm51Ce12FLxEdh7K5UeQOKC
	 Zwr7uqpWSAjeuHIHfq1pJbXPVU/SqQRrmQ9wN4Px4X9obOpRS9GkDYKpVsHWrrR92U
	 bdujpBiD4AzW65LYJM6djGFxqg/WDpDIaaT+lmoW5r00krGT/dBYrNckySed8xlM11
	 Vuuo4CbO1/E3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E96368203B;
	Wed,  4 Nov 2026 18:04:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CE563A7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69F7881ED3
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ie3ubVnCRM3C for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 18:04:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E995281FCF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E995281FCF
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 18:03:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 825A3B00596;
 Wed,  4 Nov 2026 19:03:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 04 Nov 2026 19:03:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 19:03:34 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>, Sen
 Hastings <sen@hastings.org>
In-Reply-To: <20261102142418.2544020-2-fiona.klute@gmx.de>
References: <20261102142418.2544020-1-fiona.klute@gmx.de>
 <20261102142418.2544020-2-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.20
Message-ID: <c3033a767357b7f708f5f05d759d4b83@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/5] package/systemd: sort {,
 HOST_}SYSTEMD_CONF_OPTS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 15:24, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> The same was done before in 15b4d396b9431634d339dde61cb1d52dcf9e0746
> ("systemd: sort SYSTEMD_CONF_OPTS"), but ordering was partially lost
> since.
> 
> Also assign ("=") instead of append ("+=") for unconditional options.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
