Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1540CC02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 20:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFED4418A1;
	Wed, 15 Jan 2025 20:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_b_9Th1v3eG; Wed, 15 Jan 2025 20:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97E0F418CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97E0F418CA;
	Wed, 15 Jan 2025 20:24:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 969A1B89
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77A1684A4B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GrujF3PGTjS for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 20:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9555184A47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9555184A47
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9555184A47
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 20:24:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 70D975FF88;
 Wed, 15 Jan 2025 21:24:40 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46454])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Jan 2025 21:24:40 +0100
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 21:24:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <7cf74222-01c9-48ac-a965-aeeb0bd6ce08@smile.fr>
References: <20250113212414.137066-1-ju.o@free.fr>
 <7cf74222-01c9-48ac-a965-aeeb0bd6ce08@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <74b3e7195258780123ea2221e7a24bd7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736972681;
 bh=6BOinoR4wHSOQ96v6l49YuXPiMb3uxt+XvEXwWtmEz8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J9SKR6XytV6Ia7uRIWoaFU2I0kVrSBNOgC9ibPNQZz+TU++IrxQYaBy27b7sCBhFV
 ThO6iCxEUcrUIfL0Q4x2xRemwTl9QHm5knoeAJLpHFQWxbA38sUkim9n5NWQR1ugyg
 O14YvA6lt2W0FN7mqgGJr/Rmp5Jsm3bLQZnqLHNkEW3npKFFO71SwkRTfuFOb0AmTW
 2ZuKG1Zh5B0PEnUEzDz+0cOL4Jn9fC8fIm1xIFkWF7SgzLMAFm9vtYkZoRNQAqG7da
 ZnBDMf0srXbqmSPpKYvOQCmomM7DJ/NTFLnMnBfSUsNDFn0+aK6VX35grNLjveDarT
 bLuUrwcUFqb0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J9SKR6Xy
Subject: Re: [Buildroot] [PATCH 1/1] Config.in: introduce the BR2_BROKEN
 hidden symbol
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

SGkgUm9tYWluLAoKT24gMTQvMDEvMjAyNSAyMjo0MiwgUm9tYWluIE5hb3VyIHdyb3RlOgo+IEhl
bGxvIEp1bGllbiwgQWxsLAo+IAo+IExlIDEzLzAxLzIwMjUgw6AgMjI6MjQsIEp1bGllbiBPbGl2
YWluIGEgw6ljcml0wqA6Cj4+IENvbW1pdCBbMV0KPj4gInRvb2xjaGFpbi90b29sY2hhaW4tZXh0
ZXJuYWwvdG9vbGNoYWluLWV4dGVybmFsLXN5bm9wc3lzLWFyYzogbWFyawo+PiBhcyBicm9rZW4i
IGRpc2FibGVkIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfU1lOT1BTWVNfQVJDIGJ5IGFkZGluZyBh
Cj4+IGRlcGVuZHMgb24gQlIyX0JST0tFTi4gVGhpcyBzeW1ib2wgZG9lcyBub3QgZXhpc3QgYW5k
IGdlbmVyYXRlcwo+PiBjaGVjay1zeW1ib2wgZmFpbHVyZXMsIHNlZSBbMl0uCj4+IAo+PiBUaGlz
IGNvbW1pdCBmaXhlcyB0aGlzIGlzc3VlIGJ5IGludHJvZHVjaW5nIHRoZSBCUjJfQlJPS0VOIGhp
ZGRlbiAKPj4gc3ltYm9sCj4+IHRoYXQgd2lsbCBiZSB1c2VkIHRvIHRyYWNrIHRob3NlIGtub3du
IHRvIGJlIGJyb2tlbiBmZWF0dXJlcy4gVGhpcwo+PiBzeW1ib2wgd2lsbCBoZWxwIHRvIHRyYWNr
IGZlYXR1cmVzIHRoYXQgd2VyZSBicm9rZW4gZm9yIHRvbyBsb25nIGFuZAo+PiByZW1vdmUgdGhl
bS4KPj4gCj4+IEZpeGVzOiBbMl0KPj4gCj4+IFsxXSAKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzExYThjZGQyYmJiZDBlZjRhZGY2MDBlNDc5
MmQ3NWY2ZjIxMjJlYzgKPj4gWzJdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC8tL2pvYnMvODg0MDQ3NjUxMQo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9s
aXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAKPiBMYXN0IHRpbWUgQlIyX0JST0tFTiB3YXMgdXNlZCB3
YXMgZm9yIEJsYWNrZmluIHJlbW92YWwsIG9uZSBvciB0d28gCj4gcGFja2FnZXMgYW5kCj4gdGhl
biBhdnIzMiByZW1vdmFsIDopCj4gCj4gSG9wZWZ1bGx5IGl0J3MgcmFyZWx5IHVzZWQuCj4gCj4g
UmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKVGhhbmtz
IGZvciByZXZpZXdpbmcuCkkgYXBwbGllZCB0aGUgcGF0Y2ggdG8gbWFzdGVyLgoKPiBCZXN0IHJl
Z2FyZHMsCj4gUm9tYWluCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
