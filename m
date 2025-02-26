Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8084C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 22:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 703DA834BA;
	Wed, 26 Feb 2025 22:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ci3I9SArZpnN; Wed, 26 Feb 2025 22:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75E98834E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75E98834E1;
	Wed, 26 Feb 2025 22:03:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E9D069
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 22:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3343400B9
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 22:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2k05bOu2NeNo for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 22:03:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 44AD040026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44AD040026
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44AD040026
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 22:03:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2557513F86E;
 Wed, 26 Feb 2025 23:03:28 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Feb 2025 23:03:28 +0100
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 23:03:28 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250226-nxp-mwifiex-kconfig-fix-v1-1-5e2a46c520a5@armadeus.com>
References: <20250226-nxp-mwifiex-kconfig-fix-v1-0-5e2a46c520a5@armadeus.com>
 <20250226-nxp-mwifiex-kconfig-fix-v1-1-5e2a46c520a5@armadeus.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <6dc7e6c5d2cb400f9d55608971376083@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740607409;
 bh=Vl+wWXusJ/TtmWLMhq8o9ete6/Tc0LWi6gHm8ybd2aA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sqrK0JPlxs6YiA96eBBbntW+5aqIm+urbnFldoHvWiU1p9W/X2Qftam3boVMx8dGF
 +wWAqEe04CyfmFgUKRhkCzd7hI5FqR+XwyKT0bA+wETTTyceWWFcDxxfdxvBJlBDxr
 6ePx3uqLOd1q6KNy0snq8NvAT8A4/uCEtlhigNcf3EsDHgnl4V1OpzL82WIm4J2TFe
 prhqbsw4Gylz630s1hdFPVNmXuuCyr0VcSlKHe8nBpy6fDSimLt7YI6dWjNVCADScS
 2Feedv+iE3AQ1PXddwsGd5J4ZCKC1advLi/HMIZetWcPtyn8/gdU6K8+sv2TgSJtgY
 pKIm7nvlKyO2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sqrK0JPl
Subject: Re: [Buildroot] [PATCH 1/2] package/nxp-mwifiex: use right kernel
 config symbol to enable PCI
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjYvMDIvMjAyNSAxNToyOCwgU8OpYmFzdGllbiBTenltYW5za2kgd3JvdGU6Cj4gQ29tbWl0
IDYyMGQwZTg2ZWUxNiAoInBhY2thZ2UvbnhwLW13aWZpZXg6IGZpeCBidWlsZCBmYWlsdXJlIGR1
ZSB0bwo+IG1pc3NpbmcgTGludXggb3B0aW9ucyIpIGFkZGVkIGtjb25maWcgZml4dXAgdG8gZW5h
YmxlIFBDSSBzdXBwb3J0IGJ1dAo+IG1pc3R5cGVkIHRoZSBjb25maWcgc3ltYm9sLgo+IAo+IEZp
eCBpdC4KPiAKPiBGaXhlczoKPiAgIAo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcv
cmVzdWx0cy9lYjk3MmI3ODFlYWQzNTdjM2U0NGE4ODBjYzFiOGU0YWI0YjE1YjU4Cj4gCj4gU2ln
bmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJt
YWRldXMuY29tPgoKU2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
