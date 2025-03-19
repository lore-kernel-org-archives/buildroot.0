Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3A8C35FFA
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 19:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEE344111F;
	Wed, 19 Mar 2025 19:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4iX2Tly3XUB; Wed, 19 Mar 2025 19:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E3514112B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E3514112B;
	Wed, 19 Mar 2025 19:52:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3176E1A7
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7617A40114
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 19:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0Q8raLLyhFZ for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 19:52:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 535BD40191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 535BD40191
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 535BD40191
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 19:52:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E8F7F19F59C;
 Wed, 19 Mar 2025 20:52:08 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 19 Mar 2025 20:52:08 +0100
MIME-Version: 1.0
Date: Wed, 19 Mar 2025 20:52:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20250313-kconfig-backspace-fix-v1-1-47261aaed357@armadeus.com>
References: <20250313-kconfig-backspace-fix-v1-1-47261aaed357@armadeus.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <15b3401faf43f1c095581e577ccfb8e0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742413931;
 bh=+NmxZwumu0TPvOY10gU3oEFUET19LPSbnkdqlJ+riKU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lNZk9DYrFjO5J97duDg//lclzjWvUjoxEHqPUWIeccqkiqDhYy+qEj+UCOA+Y5G6P
 cUbnadTN1xUNrykteUrlKMVYYmdoVNZS9FOKLZEweKKHefBxm12RESKDdNQQJMYD79
 PT5jwNyUdEHTcNSv98S+XH2hJC2fjelvQI3MjjqMfnTBQ3PimBmdvRuzWOf8lTIm1N
 i4nJlx4nOG0UFZQJO8+g0VjOugxHLFaWqShov+mu78Tb0irMqi/GgK/zA0IU2xQzIX
 YtRWS9LQtvIRMx0NitiXjOjiifKeroXBJLMpucfg0ta/CYr+ET9dToVEJvj0tjUgaB
 HN4ghIBZDDH0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lNZk9DYr
Subject: Re: [Buildroot] [PATCH] support/kconfig: handle backspace (^H) key
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

T24gMTMvMDMvMjAyNSAxODo0NCwgU8OpYmFzdGllbiBTenltYW5za2kgd3JvdGU6Cj4gVGhpcyBp
cyBpbiB0aGUgbWFpbmxpbmUga2VybmVsIHNpbmNlIHY1LjEtcmMzOgo+IDljMzhmMWYwNDQwOCAo
Imtjb25maWcvW21uXWNvbmY6IGhhbmRsZSBiYWNrc3BhY2UgKF5IKSBrZXkiKQo+IAo+IFF1b3Rp
bmcgdGhlIGNvbW1pdCdzIGxvZzoKPiAKPiAiCj4gQmFja3NwYWNlIGlzIG5vdCB3b3JraW5nIG9u
IHNvbWUgdGVybWluYWwgZW11bGF0b3JzIHdoaWNoIGRvIG5vdCBzZW5kIAo+IHRoZQo+IGtleSBj
b2RlIGRlZmluZWQgYnkgdGVybWluZm8uIFRlcm1pbmFscyBlaXRoZXIgc2VuZCAnXkgnICg4KSBv
ciAnXj8nIAo+ICgxMjcpLgo+IEJ1dCBjdXJyZW50bHkgb25seSAnXj8nIGlzIGhhbmRsZWQuIExl
dCdzIGFsc28gaGFuZGxlICdeSCcgZm9yIHRob3NlCj4gdGVybWluYWxzLgo+ICIKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1h
ZGV1cy5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
