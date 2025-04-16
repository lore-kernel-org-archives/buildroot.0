Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1125C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8974160A51;
	Wed, 16 Apr 2025 21:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lg4QvmwVUvK0; Wed, 16 Apr 2025 21:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BAE161136
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BAE161136;
	Wed, 16 Apr 2025 21:01:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D33A920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82B62844CD
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sb19aP-og4vh for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:01:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C4EB82F8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C4EB82F8B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C4EB82F8B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:01:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37CAD1C00C0; Wed, 16 Apr 2025 23:01:27 +0200 (CEST)
Message-ID: <e6463621-dfd3-4592-a606-c1fd33e79a3c@rnout.be>
Date: Wed, 16 Apr 2025 23:01:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250327182808.944041-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20250327182808.944041-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837287; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DIDCuKgp7zoVd0MZeJx/032waat/tq7pklRAH8aiN0s=;
 b=XjRCPdBS+R4j99H2lcZXtDJIREudUPNJ2RKa/dYLEGVvE/nFgV8H1MCKs6sUIe934Zq+YW
 dzZz85CTegQgW8OMZhaTu2dcXj/7ktyIc1lkj+sVW6bbUvKiDaFRzomwk/OeIs4B7l1PPv
 O+7I8a4qdpE7ZfDK/pozd+2/SMQpQud/OjzPOwk/FruXvZyugvw9kXy/VVYaTmoptRhYqA
 0sMLhtewsB1iaSNhkKBApEn6v0Hm8xEqx7ehKyOanC0YfTfqdgwK8plTC5uVFBrbwszwvx
 MdGyqaxTl01LZLU1j7MVaD8hZdTQ5BCEe5gp0zQ38dpPvLqPturUYlGvmfK3lA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.16
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDI3LzAzLzIwMjUgMTk6MjgsIEJlcm5kIEt1aGxzIHdyb3RlOgo+IFJlbGVhc2Ugbm90ZXM6
Cj4gaHR0cHM6Ly9naXRsYWIudG9ycHJvamVjdC5vcmcvdHBvL2NvcmUvdG9yLy0vcmF3L3JlbGVh
c2UtMC40LjgvUmVsZWFzZU5vdGVzCj4gaHR0cHM6Ly9mb3J1bS50b3Jwcm9qZWN0Lm9yZy90L3N0
YWJsZS1yZWxlYXNlLTAtNC04LTE2LzE4MDYyCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhs
cyA8YmVybmRAa3VobHMubmV0PgoKIMKgQXBwbGllZCB0b8KgMjAyNS4wMi54LCAyMDI0LjExLngg
YW5kIDIwMjQuMDIueCwgdGhhbmtzLgoKIMKgUmVnYXJkcywKIMKgQXJub3V0Cgo+IC0tLQo+ICAg
cGFja2FnZS90b3IvdG9yLmhhc2ggfCA0ICsrLS0KPiAgIHBhY2thZ2UvdG9yL3Rvci5tayAgIHwg
MiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS90b3IvdG9yLmhhc2ggYi9wYWNrYWdlL3Rvci90b3Iu
aGFzaAo+IGluZGV4IGQyZTNjYzUzM2QuLjM0YzdjMGYwOTcgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS90b3IvdG9yLmhhc2gKPiArKysgYi9wYWNrYWdlL3Rvci90b3IuaGFzaAo+IEBAIC0xLDQgKzEs
NCBAQAo+IC0jIEZyb20gaHR0cHM6Ly9kaXN0LnRvcnByb2plY3Qub3JnL3Rvci0wLjQuOC4xNS50
YXIuZ3ouc2hhMjU2c3VtCj4gLXNoYTI1NiAgNWQ1ZDk5ZTIxOTkyYzRjNzFhZjFhZmNlZjE2Yzcw
ZjRjNWU3ZWUwMjE2MzNhYzEzOGIyYTI3NjFiZTc1MDY0YiAgdG9yLTAuNC44LjE1LnRhci5nego+
ICsjIEZyb20gaHR0cHM6Ly9kaXN0LnRvcnByb2plY3Qub3JnL3Rvci0wLjQuOC4xNi50YXIuZ3ou
c2hhMjU2c3VtCj4gK3NoYTI1NiAgNjU0MGRkMzc3YTEyMGZiOGU3ZDI3NTMwYWEzYjdmZjcyYTBm
YTViNGY2NzBmZTFkNjRjOTg3YzFjZmQzOTBjYiAgdG9yLTAuNC44LjE2LnRhci5nego+ICAgIyBM
b2NhbGx5IGNvbXB1dGVkCj4gICBzaGEyNTYgIDQ3YjU0ZWQxN2U4ZmRjYWIzYzQ0NzI5YTE3ODlh
MDliMjA4ZjlhNjNhODQ1YTdlNTBkZWY5ZGY3MjllZWJhZDAgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS90b3IvdG9yLm1rIGIvcGFja2FnZS90b3IvdG9yLm1rCj4gaW5kZXggZThlNzY5
YmRlZi4uNWYzNzZkMTM2ZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3Rvci90b3IubWsKPiArKysg
Yi9wYWNrYWdlL3Rvci90b3IubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtVE9SX1ZFUlNJT04gPSAwLjQuOC4xNQo+ICtUT1JfVkVS
U0lPTiA9IDAuNC44LjE2Cj4gICBUT1JfU0lURSA9IGh0dHBzOi8vZGlzdC50b3Jwcm9qZWN0Lm9y
Zwo+ICAgVE9SX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKPiAgIFRPUl9MSUNFTlNFX0ZJTEVTID0g
TElDRU5TRQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
