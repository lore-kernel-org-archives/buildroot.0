Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1996CF884D
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 15:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F3CD412F4;
	Fri,  4 Oct 2024 15:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0m0eUF5rd50S; Fri,  4 Oct 2024 15:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D88412F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16D88412F1;
	Fri,  4 Oct 2024 15:55:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45D1D1BF3D2
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 15:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 411CC412F1
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 15:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7T67Cg1VdqF for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 15:55:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:0:465::201; helo=mout-p-201.mailbox.org;
 envelope-from=hypnotoad@lindra.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08BC9412ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08BC9412ED
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08BC9412ED
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 15:55:47 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XKtRz2K0Dz9sh8;
 Fri,  4 Oct 2024 17:55:43 +0200 (CEST)
Message-ID: <682fd7d5-18cf-4aca-92b8-0b0718276f40@lindra.de>
Date: Fri, 4 Oct 2024 17:55:41 +0200
MIME-Version: 1.0
To: Andreas Naumann <dev@andin.de>, buildroot@buildroot.org
References: <20240401084841.439073-1-hypnotoad@lindra.de>
 <20240405175454.14431-2-hypnotoad@lindra.de>
 <6b23799f-7a89-4665-935f-22176901d87e@andin.de>
Content-Language: en-US, de-DE
From: Ralf Dragon <hypnotoad@lindra.de>
In-Reply-To: <6b23799f-7a89-4665-935f-22176901d87e@andin.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1728057343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHsXtqJCOXkFgI3NKrKumg/pYJmIBaGvzHAyicOQgpU=;
 b=R5nmT4FJuR/09gsx5Hd9XoWJ7LqmqJwNf+8Ns6NEGcc0itV8H1EVBmVXy8X1XC+DP7RG2G
 EY+Mu3cJwgTzGj0w4/JT7fh7ANgxHxpZkWS/eJ/8UjBnQmEgU7ClzAyYkZHtZh8gPkfrrV
 LmMwRPQ4KhpdzJ3mXPl+GTOoYLxUfZGAuAQszH/sbKid7ldohd7G4TbRF0un/L2PPYLDwS
 Rcc7MCShjxftBUvfcTZCPkIqovAhZ5xYj7Xsk+3BCDsenMhCuW8lUdGowc8S7AZtS/0DJt
 KfhcFRLR09OoDZ8J7W15GS7nY1rZuhQbczFFcvsJii36ZDDmwJ3HEr6iJolOMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=lindra.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lindra.de header.i=@lindra.de header.a=rsa-sha256
 header.s=MBO0001 header.b=R5nmT4FJ
Subject: Re: [Buildroot] [PATCH v3 2/2] add missing SIP module for PyQt5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SXQgd291bGQgYmUgZ3JlYXQgaWYgc29tZW9uZSBjb3VsZCBoZWxwIGdldHRpbmcgdGhlIGZpeGVz
IG1lcmdlZC4gSSAKZG9uJ3Qga25vdyB3aGF0IGlzIHN0aWxsIG5lZWRlZCBhbmQgSSBkaWQgbm90
IGZpbmQgYW55IGFkZGl0aW9uIGluZm8gaW4gCnRoZSBidWlsZHJvb3QgdXNlciBtYW51YWwuIFRv
IG1lLCBpdCBkb2VzIG5vdCBzZWVtIGNvbXBsaWNhdGVkIG9yIApjb250cm92ZXJzaWFsIHRvIGdl
dCB0aGlzIG1lcmdlZC4KCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWls
ZHJvb3QvcGF0Y2gvMjAyNDA0MDUxNzU0NTQuMTQ0MzEtMS1oeXBub3RvYWRAbGluZHJhLmRlLwpo
dHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQw
NDA1MTc1NDU0LjE0NDMxLTItaHlwbm90b2FkQGxpbmRyYS5kZS8KCkJlc3QsClJhbGYKCkFtIDEy
LjA5LjI0IHVtIDIxOjIzIHNjaHJpZWIgQW5kcmVhcyBOYXVtYW5uOgo+Cj4KPiBBbSAwNS4wNC4y
NCB1bSAxOTo1NCBzY2hyaWViIFJhbGYgRHJhZ29uOgo+PiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dp
bmcgcnVudGltZSBlcnJvciB3aGVuIGltcG9ydGluZyBQeVF0NSBpbiBweXRob246Cj4+Cj4+IGZy
b20gUHlRdDUuUXRDb3JlIGltcG9ydCAqCj4+IE1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVs
ZSBuYW1lZCAnUHlRdDUuc2lwJwo+Pgo+PiBUaGUgcHJvYmxlbSB3YXMgbGlrZWx5IHRyaWdnZXJl
ZCBieSB0aGUgYXRvbWljIHVwZ3JhZGUgZnJvbSA1LjcgdG8KPj4gNS4xNSBpbiBiMzZjZTdlLiBU
aGlzIGNvbW1pdCBpcyBwYXJ0IG9mIHRoZSAyMDIyLTIwMjQgTFRTLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBSYWxmIERyYWdvbiA8aHlwbm90b2FkQGxpbmRyYS5kZT4KPgo+IFJhbiBpbnRvIHRoZSBz
YW1lIHByb2JsZW0sIGZvdW5kIGFuZCBhcHBsaWVkIGJvdGggcGF0Y2hlcyBvbiAyMDI0LjAyLCAK
PiBjb21waWxlZCBhIHF0NSBjb25maWcgaW5jbHVkaW5nIHB5cXQ1IGZvciBpbXg4bXAgYW5kIHN1
Y2Nlc3NmdWxseSByYW4gCj4gaXQgb24gdGhlIHRhcmdldC4KPgo+IFRlc3RlZC1ieTogQW5kcmVh
cyBOYXVtYW5uIDxhbmF1bWFubkB1bHRyYXRyb25pay5kZT4KPgo+Cj4+IC0tLQo+PiDCoCBwYWNr
YWdlL3B5dGhvbi1weXF0NS9Db25maWcuaW4gfCAxICsKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weXF0NS9Db25m
aWcuaW4gCj4+IGIvcGFja2FnZS9weXRob24tcHlxdDUvQ29uZmlnLmluCj4+IGluZGV4IDlmYTc2
NzZmOTguLjBiMzdmMTQzMTcgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXB5cXQ1L0Nv
bmZpZy5pbgo+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1weXF0NS9Db25maWcuaW4KPj4gQEAgLTUs
NiArNSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fUFlRVDUKPj4gwqDCoMKgwqDCoCBi
b29sICJweXRob24tcHlxdDUiCj4+IMKgwqDCoMKgwqAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9R
VDUKPj4gwqDCoMKgwqDCoCBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1NJUAo+PiArwqDCoMKg
IHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fUFlRVDVfU0lQICMgcnVudGltZQo+PiDCoMKgwqDC
oMKgIHNlbGVjdCBCUjJfUEFDS0FHRV9RVDVCQVNFX0dVSQo+PiDCoMKgwqDCoMKgIGhlbHAKPj4g
wqDCoMKgwqDCoMKgwqAgUHl0aG9uIGJpbmRpbmdzIGZvciBRdCA1CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
