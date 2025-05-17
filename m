Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECAAC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E805802E9;
	Sat, 17 May 2025 10:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zyuza8EcN_jS; Sat, 17 May 2025 10:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E07181493
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E07181493;
	Sat, 17 May 2025 10:47:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DEDD1DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2378C40897
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmaD_n2QfkQh for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:47:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD42440896
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD42440896
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD42440896
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:47:27 +0000 (UTC)
Received: from [192.168.178.42] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A3A782C83022
 for <buildroot@buildroot.org>; Sat, 17 May 2025 12:47:24 +0200 (CEST)
Message-ID: <b2147ef7-206a-4dc9-be54-648922e75fe7@bubu1.eu>
Date: Sat, 17 May 2025 12:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250108105155.147046-1-buildroot@bubu1.eu>
 <2e0a1a9d-4779-474f-a622-e97417fa9339@rnout.be>
Content-Language: en-US
In-Reply-To: <2e0a1a9d-4779-474f-a622-e97417fa9339@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747478844; bh=WVn5Y1PLfdGtwOV37hst4GdLHgujQAoA02OF/D9RLtw=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=ePjiVAbvP4nppQ/97el7iaw84lUO607EoAiC1G01ImMX/kbLciI7k5ZI0pYxoOoL5
 Rnxz73f6z/5pQ7z8NNZb8BRDML3JWmiU1NAmkfAQicIB8nWGYXp1AbnP9VPf1FL5IC
 c7jNP9tihEhh9MReoXX9+9RNpdRJTR2MYqu/FiWGcIxwKUzrqPhJ5Kkby0i7odTt+J
 kPMNQ/N7y8wJTJKRH925OufAyRL/w2K0CnVMKAu9a71lQZz6smwOy35uAxg8jhMAjp
 TmTOTK8hKj35ycj8bqjxJYe05YmMbeQFiGmHNeCow0lFvjtjIu0JwDM3NZ4oEVcZx2
 IDdYV5U7+O4hA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ePjiVAbv
Subject: Re: [Buildroot] [PATCH] docs/manual/adding-packages-python.doc:
 clarify how _BUILD_OPTS work
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

CgpPbiAxNi4wNS4yNSAxNjo0NSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCB3
cm90ZToKPiAKPiAKPiBPbiAwOC8wMS8yMDI1IDExOjUxLCBNYXJjdXMgSG9mZm1hbm4gdmlhIGJ1
aWxkcm9vdCB3cm90ZToKPj4gUFlUSE9OX0ZPT19CVUlMRF9PUFRTIGFyZSBwYXNzZWQgdG8gdGhl
IGJ1aWxkIG1vZHVsZSBjYWxsIG9mIHRoZSBwYWNrYWdlCj4+IGJ1aWxkLCB0aGlzIGFsbG93cyBw
YXNzaW5nIG9wdGlvbnMgdG8gdGhlIHB5dGhvbiBidWlsZCAqYmFja2VuZCogYnkKPj4gdXNpbmcg
dGhlIC0tY29uZmlnLXNldHRpbmc9IG9wdGlvbi4gc2V0dXAucHkgaXMgbm8gbG9uZ2VyIGludm9s
dmVkIHNpbmNlCj4+IGV2ZW4gdGhlIHNldHVwdG9vbHMgYmFja2VuZCBub3cgdXNlZCB0aGUgcGVw
NTE3IGJ1aWxkIG1ldGhvZC4KPj4KPj4gVGhlIG5vdGUgYWJvdXQgdGhlIG9wdGlvbnMgYmVpbmcg
cGFzc2VkIHRvCj4+IHN1cHBvcnQvc2NyaXB0cy9weWluc3RhbGxlci5weSBzZWVtcyB0byBiZSBu
byBsb25nZXIgYWNjdXJhdGUuCj4gCj4gIMKgWW91ciBTb0IgaXMgbWlzc2luZy4gSSBhZGRlZCBp
dCwgeW91IGFscmVhZHkgbWFkZSBwbGVudHkgb2Ygb3RoZXIgCj4gY29udHJpYnV0aW9ucyB3aXRo
IFNvQiB0aGF0IHN1Z2dlc3QgeW91IGFjdHVhbGx5IGRpZCBtZWFuIHRvIGFkZCBpdC4gCj4gUGxl
YXNlIGNvbmZpcm0gYnkgcmVwbHlpbmcgd2l0aCB5b3VyIFNvQiAoc28gdGhhdCBpdCBpcyB0cmFj
a2VkIAo+IGNvcnJlY3RseSBpbiB0aGUgbWFpbGluZyBsaXN0IGFyY2hpdmUgYW5kIGluIHBhdGNo
d29yaykuCgpUaGFua3MhCgpTaWduZWQtb2ZmLWJ5OiBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9v
dEBidWJ1MS5ldT4KCj4gCj4+IC0tLQo+PiDCoCBkb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMt
cHl0aG9uLmFkb2MgfCA2ICsrLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9tYW51YWwvYWRkaW5n
LXBhY2thZ2VzLXB5dGhvbi5hZG9jIGIvZG9jcy9tYW51YWwvIAo+PiBhZGRpbmctcGFja2FnZXMt
cHl0aG9uLmFkb2MKPj4gaW5kZXggYjQyYzA2ZTU0Yy4uNDNjZjBiYWVkNCAxMDA2NDQKPj4gLS0t
IGEvZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2VzLXB5dGhvbi5hZG9jCj4+ICsrKyBiL2RvY3Mv
bWFudWFsL2FkZGluZy1wYWNrYWdlcy1weXRob24uYWRvYwo+PiBAQCAtMTI4LDEwICsxMjgsOCBA
QCB0aGVyZWZvcmUgb25seSB1c2UgYSBmZXcgb2YgdGhlbSwgb3Igbm9uZS4KPj4gwqDCoMKgIGFu
ZCArSE9TVF9QS0dfUFlUSE9OX1BFUDUxN19FTlYrIChmb3IgZmxpdC9wZXA1MTcgaG9zdCBwYWNr
YWdlcykuCj4+IMKgICogK1BZVEhPTl9GT09fQlVJTERfT1BUUyssIHRvIHNwZWNpZnkgYWRkaXRp
b25hbCBvcHRpb25zIHRvIHBhc3MgdG8KPj4gLcKgIHRoZSBQeXRob24gK3NldHVwLnB5KyBzY3Jp
cHQgZHVyaW5nIHRoZSBidWlsZCBzdGVwLCB0aGlzIGdlbmVyYWxseQo+PiAtwqAgb25seSBtYWtl
cyBzZW5zZSB0byB1c2UgZm9yIHNldHVwdG9vbHMgYmFzZWQgcGFja2FnZXMgYXMgZmxpdC9wZXA1
MTcKPj4gLcKgIGJhc2VkIHBhY2thZ2VzIGRvIG5vdCBwYXNzIHRoZXNlIG9wdGlvbnMgdG8gYSAr
c2V0dXAucHkrIHNjcmlwdCBidXQKPj4gLcKgIGluc3RlYWQgcGFzcyB0aGVtIHRvICtzdXBwb3J0
L3NjcmlwdHMvcHlpbnN0YWxsZXIucHkrLgo+PiArwqAgdGhlIFB5dGhvbiArcHl0aG9uIC1tIGJ1
aWxkKyBjYWxsLiBUbyBwYXNzIGFkZGl0aW9uYWwgb3B0aW9ucyB0byB0aGUKPj4gK8KgIGJ1aWxk
IGJhY2tlbmQgdXNlIHRoZSArLS1jb25maWctc2V0dGluZz0rIGZsYWcgb2YgdGhlICtidWlsZCsg
bW9kdWxlLgo+IAo+ICDCoEkgYWxzbyBtZW50aW9uZWQgLUMgYXMgc3VnZ2VzdGVkIGJ5IEphbWVz
Lgo+IAo+ICDCoEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4gCj4gIMKgUmVnYXJkcywKPiAg
wqBBcm5vdXQKPiAKPj4gwqAgKiArUFlUSE9OX0ZPT19JTlNUQUxMX1RBUkdFVF9PUFRTKywgK1BZ
VEhPTl9GT09fSU5TVEFMTF9TVEFHSU5HX09QVFMrLAo+PiDCoMKgwqAgK0hPU1RfUFlUSE9OX0ZP
T19JTlNUQUxMX09QVFMrIHRvIHNwZWNpZnkgYWRkaXRpb25hbCBvcHRpb25zIHRvIHBhc3MKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
