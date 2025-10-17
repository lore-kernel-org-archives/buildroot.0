Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E993ACCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 13:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A34BF40AE0;
	Fri, 17 Oct 2025 13:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZwii-hUI8yf; Fri, 17 Oct 2025 13:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C575040AE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C575040AE3;
	Fri, 17 Oct 2025 13:49:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F260972
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 13:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10D1E40AE3
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 13:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqfB4qHGty0u for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 13:49:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8988840AE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8988840AE0
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8988840AE0
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 13:49:10 +0000 (UTC)
Received: from [192.168.109.49] (unknown [61.8.128.192])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 0EEA72C80CFD;
 Fri, 17 Oct 2025 15:49:07 +0200 (CEST)
Message-ID: <136a3c43-fded-4a0d-a52d-c98c25d0dd49@bubu1.eu>
Date: Fri, 17 Oct 2025 15:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20251009152813.1690704-1-vincent.stehle@arm.com>
 <13eefae6-0fb5-4e32-bca1-0ff35d13a5a0@bubu1.eu> <aOi9aehsauNaVtWI@debian>
 <1148a6fa-9de0-444f-9a4e-d6a91c598dc3@bubu1.eu> <aO0_KQPauWkz8Cye@debian>
Content-Language: en-US
In-Reply-To: <aO0_KQPauWkz8Cye@debian>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760708948; bh=JxvoN2WTnk1ouig6B7n70WDzCKZNOgOoRBCmYIEuD7E=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To;
 b=MV0PwxFhT0EO5KeHdda0X7/L1/g4/jYNT+kBetttX1W3eEZ98bnGNCTMzzF9BUuUG
 rmsN/l17H5uWZsMf5fMZ6oAgUHYXFm0lA/x4RnFnaXFcFBg0pwllVTYGxc4YOcp7zS
 aDF22f21MCFtusKJU3VStVMXzOeyfA0n7Scs0ePTw7/GiB794OXv3MACsLkE63u51+
 nI5Mbw2xfdBqODuL4QdU47cEjtmhawVReqh+h3SWzNgojIKkGf8aEAhxPuftr5ycAS
 7Xhz8sD6QrkQI5Q5gSdpxcabPR5hVaFZ2vrSq89PGmIPF25a8QBxCRDPoTpcYyzTBm
 fK0aG8/Ung5wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=MV0PwxFh
Subject: Re: [Buildroot] [PATCH] utils/brmake: filter output for parallel
 build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwKCk9uIDEwLzEzLzI1IDIwOjA0LCBWaW5jZW50IFN0ZWhsw6kgd3JvdGU6Cj4g
T24gRnJpLCBPY3QgMTAsIDIwMjUgYXQgMDM6NDc6MzJQTSArMDIwMCwgTWFyY3VzIEhvZmZtYW5u
IHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gKGdyZXAgLS1saW5lLWJ1ZmZlcmVkIG9wdGlvbikKPj4g
QWgsIHRoaXMgbWFrZXMgc2Vuc2UsIEkgdGhpbmsgSSBoYXZlIG5vdGljZXMgdGhpcyBkZWxheSBo
ZXJlIG1vc3RseSBpbiBDSSwKPj4gd2hlcmUgc29tZXRpbWVzIHRoZXJlJ3Mgbm8gb3V0cHV0IGZv
ciBtaW51dGVzLiBUaGlzIHNlZW1zIHRvIGltcHJvdmUgdGhhdC4KPiAKPiBIaSBNYXJjdXMsCj4g
Cj4gVGhpcyBjaGFuZ2Ugb2YgYmVoYXZpb3VyIGluIHlvdXIgQ0kgbWVzc2FnZXMgb3V0cHV0IHJh
dGUgaXMgYW4gdW5leHBlY3RlZCBzaWRlCj4gZWZmZWN0IQo+IAo+IEkgdGhpbmsgdGhhdCB3aXRo
b3V0IGFueSBvcHRpb24sIGdyZXAgYW5kIHNlZCBhZGFwdCB0aGVpciBvdXRwdXQgYnVmZmVyaW5n
Cj4gcG9saWN5IGF1dG9tYXRpY2FsbHkgaW4gdGhlIHNhbWUgd2F5LCBkZXBlbmRpbmcgb24gd2hh
dCB0aGV5IGFyZSBjb25uZWN0ZWQgdG8gKGEKPiB0ZXJtaW5hbCBvciBzb21ldGhpbmcgZWxzZSku
Cj4gCj4gTm93IHRoYXQgc2VkIGlzIHRoZSBsYXN0IHByb2dyYW0gaW4gdGhlIHBpcGVsaW5lLCBJ
IHdvdWxkIGV4cGVjdCB0aGF0IGl0IHdvdWxkCj4gc3RpbGwgYnVmZmVyIGl0cyBvdXRwdXQgaW4g
eW91ciBDSSBjYXNlLCBhcyBncmVwIHdhcyBkb2luZy4KCkkgc2VlLiBTbyBlaXRoZXIgc2VkIGlz
IGJlaGF2aW5nIHNsaWdodGx5IGRpZmZlcmVudGx5IGZyb20gZ3JlcCBoZXJlIG9yIAp0aGlzIHdh
cyBqdXN0IHRoZSBwbGFjZWJvIGVmZmVjdCBhdCB3b3JrIGhlcmUuIDopCgo+IAo+IElmIHlvdSBm
YW5jeSwgeW91IGNvdWxkIHRyeSB0byBhZGQgdGhlICItLXVuYnVmZmVyZWQiIG9wdGlvbiB0byBz
ZWQgY29tbWFuZCBsaW5lCj4gYW5kIHNlZSBpZiB0aGF0IGNoYW5nZXMgaXRzIGJlaGF2aW91ciBp
biB5b3VyIENJOgo+IAo+ICAgIHxzZWQgLS11bmJ1ZmZlcmVkIC1FICdzL14oWzAtOVQ6LV17MTl9
KSBbWzpwcmludDpdXSooLio+Pj4gKS9cMSBcMi8nCj4gCgpJIHRlc3RlZCB0aGlzIHNpZGUtYnkt
c2lkZSAod2l0aCBvciBhbmQgd2l0aG91dCB1bmJ1ZmZlcmVkIHNlZCkgbm93IGFuZCAKdGhpcyBk
ZWZpbml0ZWx5IG1ha2VzIGEgc2lnbmlmaWNhbnQgZGlmZmVyZW5jZSBpbiBvdXRwdXQgcmVhY3Rp
dml0eSBpbiAKb3VyIGdpdGxhYiBDSS4gQnV0IGFzIHlvdSBzYWlkLCB0aGlzIGlzIGtpbmQgb2Yg
dW5yZWxhdGVkIHRvIHRoZSBhY3R1YWwgCmNoYW5nZSB5b3Ugd2FudGVkIHRvIG1ha2UuIChJIGhh
dmUgYW5vdGhlciBjb21tZW50IG9uIHRoYXQgYXMgd2VsbCwgYnV0IApJJ2xsIHNlbmQgdGhhdCBp
biBhIHNlcGFyYXRlIGVtYWlsKS4KCj4+Cj4+IFRoaXMgc2hvdWxkIHByb2JhYmx5IG1lbnRpb25l
ZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4gCj4gVGhlIGludGVudGlvbiB3YXMgdG8gYXZvaWQg
YW55IHZpc2libGUgY2hhbmdlIGluIHRlcm0gb2YgYnVmZmVyaW5nOyBzZWQgc2hvdWxkCj4gaGF2
ZSByZXBsYWNlZCBncmVwIGluIHRoYXQgc2Vuc2UuCgpJIHNlZSwgbWF5YmUgc3RpbGwgbWVudGlv
bmluZyB3aHkgdGhpcyBpcyBuZWVkZWQgZm9yIGdyZXAgaGVyZSwgbWlnaHQgYmUgCmhlbHBmdWwg
Zm9yIHJlYWRlcnMgb2YgdGhlIGNvZGUvY29tbWl0IG1lc3NhZ2UuPgo+IEJlc3QgcmVnYXJkcywK
PiBWaW5jZW50LgpCZXN0LApNYXJjdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
