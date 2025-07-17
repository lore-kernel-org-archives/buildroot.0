Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F55C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7238883ED4;
	Thu, 17 Jul 2025 20:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6puNJ8gl_RG; Thu, 17 Jul 2025 20:03:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CC5983EDE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CC5983EDE;
	Thu, 17 Jul 2025 20:03:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F8CEDA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41DEF41176
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O57RNeM8IDWi for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:03:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52FC641131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52FC641131
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52FC641131
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:03:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B43BDB977A8D; Thu, 17 Jul 2025 22:03:41 +0200 (CEST)
Message-ID: <7941a33f-e145-42a0-a16f-138faf7c41b9@rnout.be>
Date: Thu, 17 Jul 2025 22:03:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
References: <20250708113328.2269438-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250708113328.2269438-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782621; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=gXZ5mJ5EGeOgwWrpU5h9v56p5YbhfP0os5FDF/lYcfo=;
 b=HpE6YxgbyQ2N4ZhxWQX6FJBoLizB85SYOz2twxAf30ZCzDayDDAuhOFIwCUJbeSGi6Tu4C
 Rv40U+mlGvqLbiiNBQBea4V2UlbPfWzdeCk3sOn6+Fqp7uYxFai5Qkx9O+YtKm/9ceXdxU
 SNXCO9LiL+Pky/ieD8f/LFd87dwCxrwFelLWC0KuCulgMmvb1ShyszdoowKQf4b2g7wTY8
 0ZopLpEQ1YXQzFZkMUEfqkaPiCJpXbk+CGGjo6GUPoAsMDJ8leJ4D5UApj1dGz5391jpia
 PxWI28NdER0qEor0O8XzssiIbvxtTFL7Z4I/vsuwz10jGZpEFQh/7Rmd3Lxd0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HpE6Yxgb
Subject: Re: [Buildroot] [PATCH] package/sngrep: security bump to v1.8.2
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

CgpPbiAwOC8wNy8yMDI1IDEzOjMzLCBUaXRvdWFuIENocmlzdG9waGUgdmlhIGJ1aWxkcm9vdCB3
cm90ZToKPiBTZWUgdGhlIHJlbGVhc2Ugbm90ZXM6Cj4gCj4gLSBodHRwczovL2dpdGh1Yi5jb20v
aXJvbnRlYy9zbmdyZXAvcmVsZWFzZXMvdGFnL3YxLjcuMAo+IC0gaHR0cHM6Ly9naXRodWIuY29t
L2lyb250ZWMvc25ncmVwL3JlbGVhc2VzL3RhZy92MS44LjAKPiAtIGh0dHBzOi8vZ2l0aHViLmNv
bS9pcm9udGVjL3NuZ3JlcC9yZWxlYXNlcy90YWcvdjEuOC4xCj4gLSBodHRwczovL2dpdGh1Yi5j
b20vaXJvbnRlYy9zbmdyZXAvcmVsZWFzZXMvdGFnL3YxLjguMgo+IAo+IFRoaXMgZml4ZXMgdGhl
IGZvbGxvd2luZyB2dWxuZXJhYmlsaXRpZXM6Cj4gCj4gLSBDVkUtMjAyNC0zMTE5Ogo+ICAgICAg
QSBidWZmZXIgb3ZlcmZsb3cgdnVsbmVyYWJpbGl0eSBleGlzdHMgaW4gYWxsIHZlcnNpb25zIG9m
IHNuZ3JlcCBzaW5jZQo+ICAgICAgdjAuNC4yLCBkdWUgdG8gaW1wcm9wZXIgaGFuZGxpbmcgb2Yg
J0NhbGwtSUQnIGFuZCAnWC1DYWxsLUlEJyBTSVAKPiAgICAgIGhlYWRlcnMuIFRoZSBmdW5jdGlv
bnMgc2lwX2dldF9jYWxsaWQgYW5kIHNpcF9nZXRfeGNhbGxpZCBpbiBzaXAuYyB1c2UKPiAgICAg
IHRoZSBzdHJuY3B5IGZ1bmN0aW9uIHRvIGNvcHkgaGVhZGVyIGNvbnRlbnRzIGludG8gZml4ZWQt
c2l6ZSBidWZmZXJzCj4gICAgICB3aXRob3V0IGNoZWNraW5nIHRoZSBkYXRhIGxlbmd0aC4gVGhp
cyBmbGF3IGFsbG93cyByZW1vdGUgYXR0YWNrZXJzIHRvCj4gICAgICBleGVjdXRlIGFyYml0cmFy
eSBjb2RlIG9yIGNhdXNlIGEgZGVuaWFsIG9mIHNlcnZpY2UgKERvUykgdGhyb3VnaAo+ICAgICAg
c3BlY2lhbGx5IGNyYWZ0ZWQgU0lQIG1lc3NhZ2VzLgo+ICAgICAgaHR0cHM6Ly93d3cuY3ZlLm9y
Zy9DVkVSZWNvcmQ/aWQ9Q1ZFLTIwMjQtMzExOQo+IAo+IC0gQ1ZFLTIwMjQtMzEyMDoKPiAgICAg
IEEgc3RhY2stYnVmZmVyIG92ZXJmbG93IHZ1bG5lcmFiaWxpdHkgZXhpc3RzIGluIGFsbCB2ZXJz
aW9ucyBvZiBzbmdyZXAKPiAgICAgIHNpbmNlIHYxLjQuMS4gVGhlIGZsYXcgaXMgZHVlIHRvIGlu
YWRlcXVhdGUgYm91bmRzIGNoZWNraW5nIHdoZW4KPiAgICAgIGNvcHlpbmcgJ0NvbnRlbnQtTGVu
Z3RoJyBhbmQgJ1dhcm5pbmcnIGhlYWRlcnMgaW50byBmaXhlZC1zaXplIGJ1ZmZlcnMKPiAgICAg
IGluIHRoZSBzaXBfdmFsaWRhdGVfcGFja2V0IGFuZCBzaXBfcGFyc2VfZXh0cmFfaGVhZGVycyBm
dW5jdGlvbnMKPiAgICAgIHdpdGhpbiBzcmMvc2lwLmMuIFRoaXMgdnVsbmVyYWJpbGl0eSBhbGxv
d3MgcmVtb3RlIGF0dGFja2VycyB0bwo+ICAgICAgZXhlY3V0ZSBhcmJpdHJhcnkgY29kZSBvciBj
YXVzZSBhIGRlbmlhbCBvZiBzZXJ2aWNlIChEb1MpIHZpYSBjcmFmdGVkCj4gICAgICBTSVDCoG1l
c3NhZ2VzLgo+ICAgICAgaHR0cHM6Ly93d3cuY3ZlLm9yZy9DVkVSZWNvcmQ/aWQ9Q1ZFLTIwMjQt
MzEyMAo+IAo+IFNpZ25lZC1vZmYtYnk6IFRpdG91YW4gQ2hyaXN0b3BoZSA8dGl0b3Vhbi5jaHJp
c3RvcGhlQG1pbmQuYmU+CgogIEFwcGxpZWQgdG8gMjAyNS4wMi54IGFuZCAyMDI1LjA1LngsIHRo
YW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL3NuZ3JlcC9zbmdy
ZXAuaGFzaCB8IDYgKysrLS0tCj4gICBwYWNrYWdlL3NuZ3JlcC9zbmdyZXAubWsgICB8IDIgKy0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3NuZ3JlcC9zbmdyZXAuaGFzaCBiL3BhY2thZ2Uvc25ncmVw
L3NuZ3JlcC5oYXNoCj4gaW5kZXggYzliOWM4YmU4ZC4uYWVhOWQ5NTc3MCAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL3NuZ3JlcC9zbmdyZXAuaGFzaAo+ICsrKyBiL3BhY2thZ2Uvc25ncmVwL3NuZ3Jl
cC5oYXNoCj4gQEAgLTEsNiArMSw2IEBACj4gLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vaXJv
bnRlYy9zbmdyZXAvcmVsZWFzZXMvZG93bmxvYWQvdjEuNy4wL3NuZ3JlcC0xLjcuMC50YXIuZ3ou
bWQ1c3VtCj4gLW1kNSAgZWUzY2M3YmQ3NWFkZWI3MTM0MTFhYTY3OGU0NWFlNGMgIHNuZ3JlcC0x
LjcuMC50YXIuZ3oKPiArIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9pcm9udGVjL3NuZ3JlcC9y
ZWxlYXNlcy9kb3dubG9hZC92MS44LjIvc25ncmVwLTEuOC4yLnRhci5nei5tZDVzdW0KPiArbWQ1
ICBlYjJhMzk4ZTJlOTg5OTNlZTJhMTlhM2FmZGRmYzI4MiAgc25ncmVwLTEuOC4yLnRhci5nego+
ICAgCj4gICAjIExvY2FsbHkgY29tcHV0ZWQKPiAtc2hhMjU2ICAyZTViYTNhNGQ2NDg2ZWEwMGJk
NzNkMmNjZWZmMzgzYmExNjJkY2Q2ZDAxNzBhZTc0Y2ZhM2IxYzIwNmUyY2IxICBzbmdyZXAtMS43
LjAudGFyLmd6Cj4gK3NoYTI1NiAgMWNkMDViZGRkNTMxYjM1M2UzMDY5YzUyNDNlNzA3NmI2MGEz
ZWU5MDdkYmJjM2M5YzI4MzQ2NzZlZDhjNGJhYyAgc25ncmVwLTEuOC4yLnRhci5nego+ICAgc2hh
MjU2ICA4Y2ViNGI5ZWU1YWRlZGRlNDdiMzFlOTc1YzFkOTBjNzNhZDI3YjZiMTY1YTFkY2Q4MGM3
YzU0NWViNjViOTAzICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc25ncmVwL3NuZ3Jl
cC5tayBiL3BhY2thZ2Uvc25ncmVwL3NuZ3JlcC5tawo+IGluZGV4IGI4NmQ3ZTgzZjAuLjUzOTlk
MDQxYjUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zbmdyZXAvc25ncmVwLm1rCj4gKysrIGIvcGFj
a2FnZS9zbmdyZXAvc25ncmVwLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICAjCj4gICAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4gLVNOR1JFUF9WRVJTSU9OID0gMS43LjAKPiArU05HUkVQ
X1ZFUlNJT04gPSAxLjguMgo+ICAgU05HUkVQX1NJVEUgPSBcCj4gICAJaHR0cHM6Ly9naXRodWIu
Y29tL2lyb250ZWMvc25ncmVwL3JlbGVhc2VzL2Rvd25sb2FkL3YkKFNOR1JFUF9WRVJTSU9OKQo+
ICAgU05HUkVQX0xJQ0VOU0UgPSBHUEwtMy4wKwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
