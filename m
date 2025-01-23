Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2119C02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 20:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A491942454;
	Thu, 23 Jan 2025 20:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xj_irV8-ECP; Thu, 23 Jan 2025 20:42:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C0A542480
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C0A542480;
	Thu, 23 Jan 2025 20:42:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 457CA959
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 20:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3388984C7B
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 20:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsTzO-sf-PwE for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 20:42:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2597180D79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2597180D79
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2597180D79
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 20:42:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0A5835FFB1;
 Thu, 23 Jan 2025 21:42:15 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36960])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Jan 2025 21:42:15 +0100
MIME-Version: 1.0
Date: Thu, 23 Jan 2025 21:42:15 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>
Cc: buildroot@buildroot.org
In-Reply-To: <40e76586-651d-4318-a37e-043564b24ad7@dawncrow.de>
References: <20250122211009.1124558-1-ju.o@free.fr>
 <40e76586-651d-4318-a37e-043564b24ad7@dawncrow.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <1fff6d877d4cfd54b51d98154b587054@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737664937;
 bh=E6KW/wbla0Ymjn/LxCYMHtBzDttQCw1vqSiNqErJbEI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iEy0QkA7vyhPXVOQ7nlK+GVx+KxNNtOTSIgEnuuDGgDebCJvjYFjMoh/Z4nOgZsFH
 4mhNHHTIy6Qn9b+9wT2pVzsvswFdjA7Z2cPsbEPhR+xP2vPTWV/m4x0sM6czFkpCa+
 BJgcCGtzc4rb7pQcujmAg8xcI9kqiyVAgYCiQeK41TeSOvDtvyS/eIZOh8XrAG3O2+
 RhTJYwS41KfDADfwwAaVvsOr1scD42/lm03mhlmMmql74Szs1B+jaDl5rXFc5CBS/V
 Gnh9DrdGb/izAWXCJ4Cjy1dsdQCRTDV71L0D6Bf2o4ZHE8ON1y26yYawME0IYVOy/q
 cOoHqMHwjp2mQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iEy0QkA7
Subject: Re: [Buildroot] [PATCH 1/1] package/wine: bump to version 10.0
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

SGkgQW5kcsOpLAoKT24gMjIvMDEvMjAyNSAyMjo1MiwgQW5kcsOpIFp3aW5nIHdyb3RlOgo+IE5v
IHRpbWUgdG8gdGVzdCByaWdodCBub3csIGJ1dDoKPiAKPiBBY2tlZC1ieTogQW5kcsOpIFp3aW5n
IDxuZXJ2QGRhd25jcm93LmRlPgoKVGhhbmtzIGZvciB0aGUgQWNrLiBJIGFwcGxpZWQgdGhpcyBw
YXRjaCB0byBtYXN0ZXIuCgo+IEFtIDIyLjAxLjI1IHVtIDIyOjEwIHNjaHJpZWIgSnVsaWVuIE9s
aXZhaW46Cj4+IEZvciBhIHN1bW1hcnkgb2YgY2hhbmdlcyBzaW5jZSA5LjE5LCBzZWU6Cj4+IGh0
dHBzOi8vd3d3LndpbmVocS5vcmcvbmV3cy8KPj4gCj4+IFRoaXMgY29tbWl0IGFsc28gYWRkcyBh
IGNvbW1lbnQgbmVhciBfVkVSU0lPTiBkZXNjcmliaW5nIHRoZSBpbnRlbnQgdG8KPj4gc3RpY2sg
dGhlIHBhY2thZ2Ugb24gc3RhYmxlIHZlcnNpb25zLiBTZWUgWzFdLgo+PiAKPj4gWzFdIAo+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvZmY1Yzg4ZmItYzc0NS00ODNjLTlmOGUt
OGFhNDkxNjRlNzZiQGRhd25jcm93LmRlLwo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9s
aXZhaW4gPGp1Lm9AZnJlZS5mcj4KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
