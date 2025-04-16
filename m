Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A35C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAC1D6077B;
	Wed, 16 Apr 2025 21:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WP6gIdcpPP7j; Wed, 16 Apr 2025 21:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F6B660D8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F6B660D8C;
	Wed, 16 Apr 2025 21:35:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3318811B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 199EC4013C
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSu1Nm9QvwvQ for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:35:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B66E140AED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B66E140AED
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B66E140AED
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:35:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B3EFA1C0083; Wed, 16 Apr 2025 23:35:02 +0200 (CEST)
Message-ID: <c69c579a-7933-4c6d-b155-be7203a2576b@rnout.be>
Date: Wed, 16 Apr 2025 23:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20250410201801.1150764-1-thomas.perale@mind.be>
Content-Language: en-GB
In-Reply-To: <20250410201801.1150764-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744839302; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=65UdI6ju/KpCjKRgh+IIqbpkwrH4vvlXbB32Wk9o+Ho=;
 b=A8JgxaSFZE76sOYpLHvIk8kR1Qw/DitZHOs0s95NZaApNcDqFBuOLw2GCTkOaUCIhEWB6w
 DFBAVEabKHgNxfKO9qWKat+7nYbkyq6MHtMwRsXOa5qya+ibnJIiw71/918aUpaV6uH671
 LNhTIVpCd+PHYxl8gkNqmiihCauFdNRqHbrLPPsi3VRx13BeJ6ur42znPYX7snN5Aclx8v
 pYvbgURuvyU+Pumqxq/s4z1HJkMhAvB+1Nh5vcbWE2XYboRKhNmUxfa1VMIs+R9n6v/Cve
 /RtRTph+TrjRmL/T03J7azSkgQ6JslTgdQM/lILVKzqrjOAQK7RuZMB9QU3/kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/augeas: add upstream security
 fix
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

Ck9uIDEwLzA0LzIwMjUgMjI6MTgsIFRob21hcyBQZXJhbGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlOgo+Cj4gLSBDVkUtMjAyNS0yNTg4
OiBUaGlzIHZ1bG5lcmFiaWxpdHkgYWZmZWN0cyB0aGUgZnVuY3Rpb24KPiAgICAgIHJlX2Nhc2Vf
ZXhwYW5kIG9mIHRoZSBmaWxlIHNyYy9mYS5jLiBUaGUgbWFuaXB1bGF0aW9uIG9mIHRoZQo+ICAg
ICAgYXJndW1lbnQgcmUgbGVhZHMgdG8gbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlCj4KPiBGb3Ig
bW9yZSBpbmZvcm1hdGlvbiwgc2VlOgo+ICAgIC0gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9k
ZXRhaWwvQ1ZFLTIwMjUtMjU4OAo+ICAgIC0gaHR0cHM6Ly9naXRodWIuY29tL2hlcmN1bGVzLXRl
YW0vYXVnZWFzL2NvbW1pdC9hZjJhYTg4YWIzN2ZjNDgxNjdkOGM1ZTQzYjE3NzBhNGJhMmZmNDAz
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+
CgogwqBBcHBsaWVkIHRvwqAyMDI1LjAyLngsIDIwMjQuMTEueCBhbmQgMjAyNC4wMi54LCB0aGFu
a3MuIEJ1dCBJIGd1ZXNzIHlvdSBrbmV3IAp0aGF0IGFscmVhZHkgc2luY2UgeW91J3JlIHRoZSBv
bmUgd2hvIGRpZCBpdCA6LSkKCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAgIC4uLnJy
b3Itd2FzLXNldC15ZXQtcGFyc2VfcmVnZXhwLWZhaWxlZC5wYXRjaCB8IDc3ICsrKysrKysrKysr
KysrKysrKysKPiAgIHBhY2thZ2UvYXVnZWFzL2F1Z2Vhcy5tayAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICsKPiAgIDIgZmlsZXMgY2hhbmdlZCwgNzkgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvYXVnZWFzLzAwMDEtQ1ZFLTIwMjUtMjU4OC1yZXR1cm4tX1JF
R19FTk9TWVMtaWYtbm8tc3BlY2lmaWMtZXJyb3Itd2FzLXNldC15ZXQtcGFyc2VfcmVnZXhwLWZh
aWxlZC5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXVnZWFzLzAwMDEtQ1ZFLTIwMjUt
MjU4OC1yZXR1cm4tX1JFR19FTk9TWVMtaWYtbm8tc3BlY2lmaWMtZXJyb3Itd2FzLXNldC15ZXQt
cGFyc2VfcmVnZXhwLWZhaWxlZC5wYXRjaCBiL3BhY2thZ2UvYXVnZWFzLzAwMDEtQ1ZFLTIwMjUt
MjU4OC1yZXR1cm4tX1JFR19FTk9TWVMtaWYtbm8tc3BlY2lmaWMtZXJyb3Itd2FzLXNldC15ZXQt
cGFyc2VfcmVnZXhwLWZhaWxlZC5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMC4uMDcxNjIxMTM4Nwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2F1
Z2Vhcy8wMDAxLUNWRS0yMDI1LTI1ODgtcmV0dXJuLV9SRUdfRU5PU1lTLWlmLW5vLXNwZWNpZmlj
LWVycm9yLXdhcy1zZXQteWV0LXBhcnNlX3JlZ2V4cC1mYWlsZWQucGF0Y2gKPiBAQCAtMCwwICsx
LDc3IEBACj4gK0Zyb20gYWYyYWE4OGFiMzdmYzQ4MTY3ZDhjNWU0M2IxNzcwYTRiYTJmZjQwMyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogQWxleGFuZGVyIEJva292b3kgPGFiYnJh
QHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbT4KPiArRGF0ZTogU3VuLCAzMCBNYXIgMjAyNSAxMjoy
NzowNCArMDMwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIENWRS0yMDI1LTI1ODg6IHJldHVybiBfUkVH
X0VOT1NZUyBpZiBubyBzcGVjaWZpYyBlcnJvciB3YXMKPiArIHNldCB5ZXQgcGFyc2VfcmVnZXhw
IGZhaWxlZCAoIzg1NCkKPiArCj4gK3BhcnNlX3JlZ2V4cCgpIHN1cHBvc2VkIHRvIHNldCBhbiBl
cnJvciBvbiB0aGUgcGFyc2VyIHN0YXRlIGluIGNhc2Ugb2YgYQo+ICtmYWlsdXJlLiBJZiBubyBz
cGVjaWZpYyBlcnJvciB3YXMgc2V0LCByZXR1cm4gX1JFR19FTk9TWVMgdG8gaW5kaWNhdGUgYQo+
ICtnZW5lcmljIGZhaWx1cmUuCj4gKwo+ICtGaXhlczogaHR0cHM6Ly9naXRodWIuY29tL2hlcmN1
bGVzLXRlYW0vYXVnZWFzL2lzc3Vlcy82NzEKPiArRml4ZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9o
ZXJjdWxlcy10ZWFtL2F1Z2Vhcy9pc3N1ZXMvNzc4Cj4gK0ZpeGVzOiBodHRwczovL2dpdGh1Yi5j
b20vaGVyY3VsZXMtdGVhbS9hdWdlYXMvaXNzdWVzLzg1Mgo+ICsKPiArU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIEJva292b3kgPGFib2tvdm95QHJlZGhhdC5jb20+Cj4gKwo+ICtVcHN0cmVhbTog
aHR0cHM6Ly9naXRodWIuY29tL2hlcmN1bGVzLXRlYW0vYXVnZWFzL2NvbW1pdC9hZjJhYTg4YWIz
N2ZjNDgxNjdkOGM1ZTQzYjE3NzBhNGJhMmZmNDAzCj4gK0NWRTogQ1ZFLTIwMjUtMjU4OAo+ICtT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Cj4gKwo+
ICstLS0KPiArIHNyYy9mYS5jICAgICAgIHwgMiArKwo+ICsgc3JjL2ZhLmggICAgICAgfCAzICsr
LQo+ICsgdGVzdHMvZmF0ZXN0LmMgfCA2ICsrKysrKwo+ICsgMyBmaWxlcyBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvc3JjL2ZhLmMg
Yi9zcmMvZmEuYwo+ICtpbmRleCA2NmFjNzA3ODQuLjRkZTU2NzViOSAxMDA2NDQKPiArLS0tIGEv
c3JjL2ZhLmMKPiArKysrIGIvc3JjL2ZhLmMKPiArQEAgLTM1NTAsNiArMzU1MCw4IEBAIHN0YXRp
YyBzdHJ1Y3QgcmUgKnBhcnNlX3JlZ2V4cChzdHJ1Y3QgcmVfcGFyc2UgKnBhcnNlKSB7Cj4gKyAg
ICAgcmV0dXJuIHJlOwo+ICsKPiArICBlcnJvcjoKPiArKyAgICBpZiAocmUgPT0gTlVMTCAmJiBw
YXJzZS0+ZXJyb3IgPT0gUkVHX05PRVJST1IpCj4gKysgICAgICAgIHBhcnNlLT5lcnJvciA9IF9S
RUdfRU5PU1lTOwo+ICsgICAgIHJlX3VucmVmKHJlKTsKPiArICAgICByZXR1cm4gTlVMTDsKPiAr
IH0KPiArZGlmZiAtLWdpdCBhL3NyYy9mYS5oIGIvc3JjL2ZhLmgKPiAraW5kZXggMWZkNzU0YWQw
Li44OWM5YjE3ZTkgMTAwNjQ0Cj4gKy0tLSBhL3NyYy9mYS5oCj4gKysrKyBiL3NyYy9mYS5oCj4g
K0BAIC04MSw3ICs4MSw4IEBAIGV4dGVybiBpbnQgZmFfbWluaW1pemF0aW9uX2FsZ29yaXRobTsK
PiArICAqCj4gKyAgKiBPbiBzdWNjZXNzLCBGQSBwb2ludHMgdG8gdGhlIG5ld2x5IGFsbG9jYXRl
ZCBhdXRvbWF0b24gY29uc3RydWN0ZWQgZm9yCj4gKyAgKiBSRSwgYW5kIHRoZSBmdW5jdGlvbiBy
ZXR1cm5zIFJFR19OT0VSUk9SLiBPdGhlcndpc2UsIEZBIGlzIE5VTEwsIGFuZCB0aGUKPiArLSAq
IHJldHVybiB2YWx1ZSBpbmRpY2F0ZXMgdGhlIGVycm9yLgo+ICsrICogcmV0dXJuIHZhbHVlIGlu
ZGljYXRlcyB0aGUgZXJyb3IuIFNwZWNpYWwgdmFsdWUgX1JFR19FTk9TWVMgaW5kaWNhdGVzCj4g
KysgKiBmYV9jb21waWxlKCkgY291bGRuJ3QgaWRlbnRpZnkgdGhlIHN5bnRheCBpc3N1ZSB3aXRo
IHJlZ2V4cC4KPiArICAqCj4gKyAgKiBUaGUgRkEgaXMgY2FzZSBzZW5zaXRpdmUuIENhbGwgRkFf
Tk9DQVNFIHRvIHN3aXRjaCBpdCB0bwo+ICsgICogY2FzZS1pbnNlbnNpdGl2ZS4KPiArZGlmZiAt
LWdpdCBhL3Rlc3RzL2ZhdGVzdC5jIGIvdGVzdHMvZmF0ZXN0LmMKPiAraW5kZXggMGM5Y2E3Njk2
Li42NzE3YWY4ZjQgMTAwNjQ0Cj4gKy0tLSBhL3Rlc3RzL2ZhdGVzdC5jCj4gKysrKyBiL3Rlc3Rz
L2ZhdGVzdC5jCj4gK0BAIC01ODksNiArNTg5LDcgQEAgc3RhdGljIHZvaWQgdGVzdEV4cGFuZE5v
Q2FzZShDdVRlc3QgKnRjKSB7Cj4gKyAgICAgY29uc3QgY2hhciAqcDEgPSAiYUIiOwo+ICsgICAg
IGNvbnN0IGNoYXIgKnAyID0gIlthLWNVVl0iOwo+ICsgICAgIGNvbnN0IGNoYXIgKnAzID0gIlte
YS16XSI7Cj4gKysgICAgY29uc3QgY2hhciAqd3JvbmdfcmVnZXhwID0gInsmLnsiOwo+ICsgICAg
IGNoYXIgKnM7Cj4gKyAgICAgc2l6ZV90IGxlbjsKPiArICAgICBpbnQgcjsKPiArQEAgLTYwNyw2
ICs2MDgsMTEgQEAgc3RhdGljIHZvaWQgdGVzdEV4cGFuZE5vQ2FzZShDdVRlc3QgKnRjKSB7Cj4g
KyAgICAgQ3VBc3NlcnRJbnRFcXVhbHModGMsIDAsIHIpOwo+ICsgICAgIEN1QXNzZXJ0U3RyRXF1
YWxzKHRjLCAiW15BLVphLXpdIiwgcyk7Cj4gKyAgICAgZnJlZShzKTsKPiArKwo+ICsrICAgIC8q
IFRlc3QgdGhhdCBmYV9leHBhbmRfbm9jYXNlIGRvZXMgcmV0dXJuIF9SRUdfRU5PU1lTICovCj4g
KysgICAgciA9IGZhX2V4cGFuZF9ub2Nhc2Uod3JvbmdfcmVnZXhwLCBzdHJsZW4od3JvbmdfcmVn
ZXhwKSwgJnMsICZsZW4pOwo+ICsrICAgIEN1QXNzZXJ0SW50RXF1YWxzKHRjLCBfUkVHX0VOT1NZ
Uywgcik7Cj4gKysgICAgZnJlZShzKTsKPiArIH0KPiArCj4gKyBzdGF0aWMgdm9pZCB0ZXN0Tm9D
YXNlQ29tcGxlbWVudChDdVRlc3QgKnRjKSB7Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXVnZWFz
L2F1Z2Vhcy5tayBiL3BhY2thZ2UvYXVnZWFzL2F1Z2Vhcy5tawo+IGluZGV4IGFjNGJjN2QwYmUu
Ljg4ZTk2YTkxYmMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9hdWdlYXMvYXVnZWFzLm1rCj4gKysr
IGIvcGFja2FnZS9hdWdlYXMvYXVnZWFzLm1rCj4gQEAgLTE0LDYgKzE0LDggQEAgQVVHRUFTX0RF
UEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiByZWFkbGluZSBsaWJ4bWwyCj4gICAKPiAgIEFVR0VB
U19DT05GX09QVFMgPSAtLWRpc2FibGUtZ251bGliLXRlc3RzCj4gICAKPiArQVVHRUFTX0lHTk9S
RV9DVkVTICs9IENWRS0yMDI1LTI1ODgKPiArCj4gICAjIFJlbW92ZSB0aGUgdGVzdCBsZW5zZXMg
d2hpY2ggb2NjdXB5IGFib3V0IDEuNCBNQiBvbiB0aGUgdGFyZ2V0Cj4gICBkZWZpbmUgQVVHRUFT
X1JFTU9WRV9URVNUX0xFTlNFUwo+ICAgCXJtIC1yZiAkKFRBUkdFVF9ESVIpL3Vzci9zaGFyZS9h
dWdlYXMvbGVuc2VzL2Rpc3QvdGVzdHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
