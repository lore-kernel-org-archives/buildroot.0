Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0520E9D408
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A313E40CFF;
	Wed,  4 Feb 2026 16:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhmK4pR7zBnY; Wed,  4 Feb 2026 16:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A878E40CF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770222338;
	bh=N3ORbRygIc0JRSyrXDjoGmtDaR+c1NDajlyCEMSDzEg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZoZI/M/6ZNTrAh3Rnzdzvg1aKnUNAgmutAC61yMBsnyv0kVC2o/YOOjG/e8j4NG11
	 H57eWBXxKZGZSwzkR2kO8y5F7VvvVZ5T8xPNuEr2KL4XPccLDTECJhjJkW2Q/tEx7h
	 sC7xamPjAzoaROyOLqssjcJY5YlAIRRgx5ejCIHauMcG9uZQaIz01VWj1mn/2KozFb
	 EamLaUME2LQ0PclBcCC21696+MUstLupJvZ6KGsvXatCGAQNECFOO/ZxDi33GtP/s4
	 0UY2s/1iN+Io1+/1vOCz8ZhW69ynIXtN4B8JiQa7P9c5+Suk4amHhCGnbiBe3A5ZvU
	 v51N/aIuM4PyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A878E40CF8;
	Wed,  4 Feb 2026 16:25:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79587F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D90E40CF8
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9UEEOUE1BqV for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:25:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FA5940CEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FA5940CEC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FA5940CEC
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:25:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 18B23B97ADDE; Wed,  4 Feb 2026 17:25:32 +0100 (CET)
Message-ID: <a980f4f5-27bb-4ae1-94ee-69f7abe96ae0@rnout.be>
Date: Wed, 4 Feb 2026 17:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Gregory Dymarek <gregd72002@gmail.com>
References: <20250224-libwebsockets-zlib-opt-v1-1-16419ae3e82b@cherry.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250224-libwebsockets-zlib-opt-v1-1-16419ae3e82b@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1770222333; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=EvkU8oWYcFDLzqexmRZwXc+mt7gF5hykPCakXwCtnPI=;
 b=Di9V9AiQP6HwumZZ4w9yjiZUhjBq+jebpHcKEagrRXA88r7uAY1v5z0Qn+cc54muO0gw8a
 wBAf9gLegdlY0Vz/3RpcNVVAspK7E823duic1lfUJGBbVDx5yzVP417B59K64JWtTFOASg
 r2WtXuXhybtTmTTF6GdeGnh8kXUrKUCFOMHtBEryn48I/d/prCh016WRJofeFVWpojx20x
 0uGK6eo3w+rJgfDd+WEQzgJVn4O6RrXDzP65VQLGKzsmkCpvEdXzHzumjKC/T74dIeChgd
 J0/xWMP2qlIj+Q1Ui9QYRqn/hIwdZ5nSsjSVSXXcE3dlGL1V8T5Q1HfYKofC2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Di9V9AiQ
Subject: Re: [Buildroot] [PATCH RFC] package/libwebsockets: make zlib
 dependency optional
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

ICBIaSBRdWVudGluLAoKT24gMjQvMDIvMjAyNSAxNDoxMCwgUXVlbnRpbiBTY2h1bHogd3JvdGU6
Cj4gRnJvbTogUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4KPiAKPiB6
bGliIGlzIGEgZGVwZW5kZW5jeSBvZiBleHRlbnNpb25zIGFuZCBIVFRQIHN0cmVhbSBjb21wcmVz
c2lvbiBmZWF0dXJlcy4KPiBUaGUgbGF0dGVyIGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQgaW4gQ01h
a2UgaW4gdGhlIHByb2plY3QuIFRoZSBzYW1lIGNhbgo+IGJlIHNhaWQgb2YgdGhlIGZvcm1lciBi
dXQgQnVpbGRyb290IGN1cnJlbnRseSBlbmFibGVzIGl0Cj4gdW5jb25kaXRpb25hbGx5LCBtYWtp
bmcgdGhlIHpsaWIgZGVwZW5kZW5jeSBhIHJlcXVpcmVtZW50LgoKICBXaHkgd291bGQgeW91IHdh
bnQgdG8gZG8gdGhhdD8gSXQgYWN0dWFsbHkgYnJlYWtzIGFueSAob3V0IG9mIHRyZWUpIHVzZXIg
dGhhdCAKaW1wbGljaXRseSBvciBleHBsaWNpdGx5IHVzZXMgdGhlIGNvbXByZXNzaW9uIGV4dGVu
c2lvbiAoc2ltaWxhciB0byAKamFudXMtZ2F0ZXdheSkuIElzIHRoZSBpbXBhY3Qgb24gcm9vdGZz
IHNpemUgc28gc2lnbmlmaWNhbnQgdGhhdCBpdCdzIHJlbGV2YW50PyAKT3IgaXMgdGhlcmUgYW5v
dGhlciByZWFzb24gdG8gcmVtb3ZlIHpsaWI/CgogIEdpdmVuIHRoZSBicmVha2FnZSBvZiBleHRl
cm5hbCBwYWNrYWdlcywgSSB0aGluayB0aGlzIG5lZWRzIGFuIGV4cGxpY2l0IApDb25maWcuaW4g
b3B0aW9uIHRoYXQgZGVmYXVsdHMgdG8geS4gQnV0IEkgcmVhbGx5IGRvbid0IHNlZSB0aGUgcG9p
bnQgYXQgdGhpcyB0aW1lLgoKICBSZWdhcmRzLAogIEFybm91dAoKICBQUyBTb3JyeSBmb3IgdGhl
IGxhdGUgcmVzcG9uc2UsIHlvdSBrbm93IGhvdyBmbG9vZGVkIHdlIGFyZSB3aXRoIHBhdGNoZXMg
Oi0pCgoKPiAKPiBJbnN0ZWFkLCBsZXQncyBtYWtlIGV4dGVuc2lvbnMgZGVwZW5kZW50IG9uIHRo
ZSBwcmVzZW5jZSBvZiB6bGliLAo+IGFsbG93aW5nIHpsaWIgKGFuZCB0aHVzIGV4dGVuc2lvbnMp
IHRvIG5vdCBiZSBpbnN0YWxsZWQuCj4gCj4gVGhpcyBkb2VzIGRpc2FibGUgZXh0ZW5zaW9ucyBi
eSBkZWZhdWx0IG5vdywgZHVlIHRvIHRoZSByZW1vdmFsIG9mIHRoZQo+IHNlbGVjdCBCUjJfUEFD
S0FHRV9aTElCIGZvciBCUjJfUEFDS0FHRV9MSUJXRUJTT0NLRVRTLiBUaGUgcGFja2FnZXMKPiBj
dXJyZW50bHkgYW5kIGRpcmVjdGx5IGRlcGVuZGluZyBvbiBsaWJ3ZWJzb2NrZXRzIGFyZSB0dHlk
LCBzd3VwZGF0ZSwKPiBtb3NxdWl0dG8sIGtpc21ldCwgamFudXMtZ2F0ZXdheSwgZ3RraW9zdHJl
YW0uIEFjY29yZGluZyB0byBteSByZWFkaW5nCj4gb2YgbGlid2Vic29ja2V0cyBkb2N1bWVudGF0
aW9uWzFdLCBleHRlbnNpb25zIGFyZSB1c2VkIG9ubHkgd2hlbiBvbmUgb2YKPiBsd3Nfc2V0X2V4
dGVuc2lvbl9vcHRpb24sIGx3c19leHRfcGFyc2Vfb3B0aW9ucyBvcgo+IGx3c19leHRlbnNpb25f
Y2FsbGJhY2tfcG1fZGVmbGF0ZSBhcmUgdXNlZC4KPiBBbW9uZyB0aGUgcGFja2FnZXMgZGVwZW5k
aW5nIG9uIGxpYndlc29ja2V0cywgb25seSB0dHlkIGFuZAo+IGphbnVzLWdhdGV3YXkgc2VlbSB0
byBiZSB1c2luZyB0aGUgZXh0ZW5zaW9ucy4gdHR5ZCBsaXN0cyB6bGliIGFzIGEKPiBkaXJlY3Qg
ZGVwZW5kZW5jeSBzbyBpdCdsbCBlbmFibGUgbGlid2Vic29ja2V0cyBleHRlbnNpb25zIHN1cHBv
cnQgYnkKPiBleHRlbnNpb24uIGphbnVzLWdhdGV3YXkgZG9lcyBub3QsIHRoZXJlZm9yZSB0aGUg
ZGVwZW5kZW5jeSBpcyBhZGRlZAo+IHRvIGl0cyBDb25maWcuaW4uCj4gCj4gWzFdIGh0dHBzOi8v
bGlid2Vic29ja2V0cy5vcmcvbHdzLWFwaS1kb2MtbWFpbi9odG1sL2dyb3VwX19leHRlbnNpb25z
Lmh0bWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpA
Y2hlcnJ5LmRlPgo+IC0tLQo+IE1hcmtlZCBhcyBSRkMgYmVjYXVzZSBJJ20gbm90IGZvbmQgb2Yg
YWRkaW5nIHRoZSBaTElCIGRlcGVuZGVuY3kgdG8KPiBqYW51cy1nYXRld2F5IHRvIGVuYWJsZSBs
aWJ3ZWJzb2NrZXRzIGV4dGVuc2lvbnMgc3VwcG9ydC4KPiAKPiBBbm90aGVyIHNvbHV0aW9uIGlz
IHRvIGFkZCBhIG5ldyBvcHRpb24gw6AtbGEKPiBCUjJfUEFDS0FHRV9MSUJXRUJTT0NLRVRTX0FT
WU5DX0ROUyBmb3IgZXh0ZW5zaW9ucyBzdXBwb3J0LiBJdCdzIGp1c3QKPiB0aGF0IHVzdWFsbHkg
b3B0aW9ucyB0aGF0IGRlcGVuZCBvbiBhIHNpbmdsZSBwYWNrYWdlIHByZXNlbmNlIGFyZQo+IGhh
bmRsZWQgbGlrZSBpbiB0aGlzIHBhdGNoIGlmIEkgdW5kZXJzdG9vZCBjb3JyZWN0bHk/Cj4gCj4g
VGhpcyB3YXMgb25seSBidWlsZCB0ZXN0ZWQuCj4gLS0tCj4gICBwYWNrYWdlL2phbnVzLWdhdGV3
YXkvQ29uZmlnLmluICAgICAgICB8ICAxICsKPiAgIHBhY2thZ2UvbGlid2Vic29ja2V0cy9Db25m
aWcuaW4gICAgICAgIHwgIDEgLQo+ICAgcGFja2FnZS9saWJ3ZWJzb2NrZXRzL2xpYndlYnNvY2tl
dHMubWsgfCAxMSArKysrKysrKy0tLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvamFudXMtZ2F0ZXdh
eS9Db25maWcuaW4gYi9wYWNrYWdlL2phbnVzLWdhdGV3YXkvQ29uZmlnLmluCj4gaW5kZXggY2Nm
MDY1ZDIxMWU2YmFmYzYxYTEyM2U2Mjg2OGMxY2NkMTI0ZWIyMC4uYjhhYzk0NjM5YzU0YWUxNTcw
ZThjZjU5M2Y5ZGU4NzExMWQ3MjQxZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2phbnVzLWdhdGV3
YXkvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9qYW51cy1nYXRld2F5L0NvbmZpZy5pbgo+IEBA
IC05OSw2ICs5OSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9KQU5VU19HQVRFV0FZX1VOSVhfU09D
S0VUUwo+ICAgY29uZmlnIEJSMl9QQUNLQUdFX0pBTlVTX0dBVEVXQVlfV0VCU09DS0VUUwo+ICAg
CWJvb2wgIldlYlNvY2tldHMiCj4gICAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQldFQlNPQ0tFVFMK
PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9aTElCICMgbGlid2Vic29ja2V0cyB3aXRoIGV4dGVuc2lv
bnMKPiAgIAo+ICAgZW5kaWYKPiAgIAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYndlYnNvY2tl
dHMvQ29uZmlnLmluIGIvcGFja2FnZS9saWJ3ZWJzb2NrZXRzL0NvbmZpZy5pbgo+IGluZGV4IDYx
MTZjZmVjYjU4YjcxY2Q3Mzc5OGU3MTUzZmZmM2UxNzQ3YmY0NjUuLjYzMWYwZDhlNjUwZDY5YjQ1
MjI3NDlmNTY5NGMwY2JlOWE4YmQ2Y2EgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJ3ZWJzb2Nr
ZXRzL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbGlid2Vic29ja2V0cy9Db25maWcuaW4KPiBA
QCAtMSw3ICsxLDYgQEAKPiAgIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJXRUJTT0NLRVRTCj4gICAJ
Ym9vbCAibGlid2Vic29ja2V0cyIKPiAgIAlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMKPiAt
CXNlbGVjdCBCUjJfUEFDS0FHRV9aTElCCj4gICAJaGVscAo+ICAgCSAgTGlid2Vic29ja2V0cyBp
cyBhIGxpZ2h0d2VpZ2h0IHB1cmUgQyBsaWJyYXJ5IGJ1aWx0IHRvIHVzZQo+ICAgCSAgbWluaW1h
bCBDUFUgYW5kIG1lbW9yeSByZXNvdXJjZXMsIGFuZCBwcm92aWRlIGZhc3QgdGhyb3VnaHB1dAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYndlYnNvY2tldHMvbGlid2Vic29ja2V0cy5tayBiL3Bh
Y2thZ2UvbGlid2Vic29ja2V0cy9saWJ3ZWJzb2NrZXRzLm1rCj4gaW5kZXggZTUzZmViZmNlNDU1
MWI1YzYyZDUzNGY5YzViMjk3ZjU1ODZkODcyNC4uZTEyOWIwYmQ2Y2JiNDVhOGRmZmUwM2Q2MWFj
ZTk5MDYwYzliN2NjOCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYndlYnNvY2tldHMvbGlid2Vi
c29ja2V0cy5tawo+ICsrKyBiL3BhY2thZ2UvbGlid2Vic29ja2V0cy9saWJ3ZWJzb2NrZXRzLm1r
Cj4gQEAgLTgsMTQgKzgsMTIgQEAgTElCV0VCU09DS0VUU19WRVJTSU9OID0gNC4zLjMKPiAgIExJ
QldFQlNPQ0tFVFNfU0lURSA9ICQoY2FsbCBnaXRodWIsd2FybWNhdCxsaWJ3ZWJzb2NrZXRzLHYk
KExJQldFQlNPQ0tFVFNfVkVSU0lPTikpCj4gICBMSUJXRUJTT0NLRVRTX0xJQ0VOU0UgPSBNSVQg
d2l0aCBleGNlcHRpb25zCj4gICBMSUJXRUJTT0NLRVRTX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
Cj4gLUxJQldFQlNPQ0tFVFNfREVQRU5ERU5DSUVTID0gemxpYgo+ICAgTElCV0VCU09DS0VUU19J
TlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAgIExJQldFQlNPQ0tFVFNfQ09ORl9PUFRTID0gXAo+ICAg
CS1ERElTQUJMRV9XRVJST1I9T04gXAo+ICAgCS1ETFdTX1dJVEhPVVRfVEVTVEFQUFM9T04gXAo+
ICAgCS1ETFdTX0lQVjY9T04gXAo+IC0JLURMV1NfVU5JWF9TT0NLPU9OIFwKPiAtCS1ETFdTX1dJ
VEhPVVRfRVhURU5TSU9OUz1PRkYKPiArCS1ETFdTX1VOSVhfU09DSz1PTgo+ICAgCj4gICAjIElm
IExXU19NQVhfU01QPTEsIHRoZW4gdGhlcmUgaXMgbm8gY29kZSByZWxhdGVkIHRvIHB0aHJlYWRz
IGNvbXBpbGVkCj4gICAjIGluIHRoZSBsaWJyYXJ5LiBJZiB1bnNldCwgTFdTX01BWF9TTVAgZGVm
YXVsdHMgdG8gMzIgYW5kIGEgc21hbGwKPiBAQCAtMTAyLDQgKzEwMCwxMSBAQCBpZmVxICgkKEJS
Ml9QQUNLQUdFX0xJQldFQlNPQ0tFVFNfQVNZTkNfRE5TKSx5KQo+ICAgTElCV0VCU09DS0VUU19D
T05GX09QVFMgKz0gLURMV1NfV0lUSF9TWVNfQVNZTkNfRE5TPU9OCj4gICBlbmRpZgo+ICAgCj4g
K2lmZXEgKCQoQlIyX1BBQ0tBR0VfWkxJQikseSkKPiArTElCV0VCU09DS0VUU19ERVBFTkRFTkNJ
RVMgKz0gemxpYgo+ICtMSUJXRUJTT0NLRVRTX0NPTkZfT1BUUyArPSAtRExXU19XSVRIT1VUX0VY
VEVOU0lPTlM9T0ZGCj4gK2Vsc2UKPiArTElCV0VCU09DS0VUU19DT05GX09QVFMgKz0gLURMV1Nf
V0lUSE9VVF9FWFRFTlNJT05TPU9OCj4gK2VuZGlmCj4gKwo+ICAgJChldmFsICQoY21ha2UtcGFj
a2FnZSkpCj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6IDU0NDI0OWZmNzc2MWRiMmRmNjE3ODNjODcz
MWU4MzQ1NzRkZjk1N2EKPiBjaGFuZ2UtaWQ6IDIwMjUwMjI0LWxpYndlYnNvY2tldHMtemxpYi1v
cHQtNTMyNTQ0ZjgwMWUwCj4gCj4gQmVzdCByZWdhcmRzLAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
