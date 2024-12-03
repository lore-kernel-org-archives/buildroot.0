Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D172E74AD8
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 21:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDBBF60035;
	Tue,  3 Dec 2024 21:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rsga0PSB_Y8o; Tue,  3 Dec 2024 21:32:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F17FC6113F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F17FC6113F;
	Tue,  3 Dec 2024 21:32:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDCF72073
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A107242A79
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAiSN-9N7rBQ for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 21:32:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6727B42A78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6727B42A78
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6727B42A78
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:32:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3626F19F5BE;
 Tue,  3 Dec 2024 22:32:19 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35042])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Dec 2024 22:32:19 +0100
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 22:32:19 +0100
From: Julien Olivain <ju.o@free.fr>
To: Jannik Becher <becher.jannik@gmail.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
In-Reply-To: <fc665ebd-3ac6-4893-b8e0-b8a832ea2d7a@gmail.com>
References: <fc665ebd-3ac6-4893-b8e0-b8a832ea2d7a@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f9e68df5f1c87081a02e6343b1ed1b45@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733261541;
 bh=MtcNFEMHCObv/rKB+MhDAHsren1oZg5TYAA59pL8CKY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I6pKhu4vM+MyMW32Xu1npABANULtFM/kPHXP0bwGjeQ8Ql5hxFTXoUG2IVXJ8c4/h
 ZEWkrO1k2sQ/6wAudMoUb7Mk9mISbsWEItdIggNOflAfBMX5NX9qbQZulUOflaZ8Vc
 QuS43Zlkg3ur0W98v7ow+/Hy7rQBUft3psigliXY21L90ULU+HiZcArsI3+cUqi/Mu
 muO1+0tDXziFfAQ2C+Jog4IyOjc2rptmQt3KflmQuaZZtvGFctXjKZfd3ZapjUwYn4
 EO4eM2U2TPEG6rPK7uTaf+ITF51diFhV9ETwOj77ggYVokh/NERjhB1HUOuPSzluli
 gx8aUhWfnx6Nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I6pKhu4v
Subject: Re: [Buildroot] [PATCH 2/2] package/igh-ethercat: add configuration
 options
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

SGkgSmFubmlrLAoKVGhhbmtzIGZvciB0aGUgcGF0Y2ghCgpJIGhhdmUgZmV3IGNvbW1lbnRzLiBT
ZWUgYmVsb3cuCgpPbiAwMy8xMi8yMDI0IDA2OjA3LCBKYW5uaWsgQmVjaGVyIHdyb3RlOgo+IEZy
b20gYjUyYmViNTY4NzA1MDliOTgzYjliYmIyMDc0MDBiYzkwYzIxNjEyMCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKPiBGcm9tOiBKYW5uaWsgQmVjaGVyIDxiZWNoZXIuamFubmlrQGdtYWlsLmNv
bT4KPiBEYXRlOiBNb24sIDIgRGVjIDIwMjQgMTk6NTA6MjQgKzAxMDAKPiBTdWJqZWN0OiBbUEFU
Q0ggMi8yXSBwYWNrYWdlL2lnaC1ldGhlcmNhdDogYWRkIGNvbmZpZ3VyYXRpb24gb3B0aW9ucwo+
IAo+IEFkZCBjb25maWd1cmF0aW9uIG9wdGlvbnMgYW5kIGRlc2NyaXB0aW9uIGZvciBFdGhlckNB
VCB1c2VybGliLCAKPiBjbGl0b29sLAo+IHR0eSBhbmQgYWRkaXRpb25hbCBkcml2ZXJzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEphbm5payBCZWNoZXIgPGJlY2hlci5qYW5uaWtAZ21haWwuY29tPgo+
IC0tLQo+IHBhY2thZ2UvaWdoLWV0aGVyY2F0L0NvbmZpZy5pbiDCoMKgwqDCoMKgwqB8IDc4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrLS0KPiBwYWNrYWdlL2lnaC1ldGhlcmNhdC9pZ2gtZXRo
ZXJjYXQubWsgfCAxNSArKysrLS0KPiAyIGZpbGVzIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvaWdoLWV0aGVyY2F0L0Nv
bmZpZy5pbiAKPiBiL3BhY2thZ2UvaWdoLWV0aGVyY2F0L0NvbmZpZy5pbgo+IGluZGV4IGU2MDBl
ZjVmY2QuLjIxZWNhNDZjODAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9pZ2gtZXRoZXJjYXQvQ29u
ZmlnLmluCj4gKysrIGIvcGFja2FnZS9pZ2gtZXRoZXJjYXQvQ29uZmlnLmluCj4gQEAgLTExLDE5
ICsxMSw4NyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfSUdIX0VUSEVSQ0FUCj4gCj4gaWYgQlIyX1BB
Q0tBR0VfSUdIX0VUSEVSQ0FUCj4gCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9JR0hfRVRIRVJDQVRf
Q0xJVE9PTAo+ICsgwqDCoMKgwqDCoMKgYm9vbCAiRW5hYmxlIENMSSBUb29sIgoKVGhlIGNsaWVu
dCB0b29scyB3ZXJlIGFwcGFyZW50bHkgcmVxdWlyaW5nIEMrKy4gU2VlIHRoZSBCdWlsZHJvb3Qg
CmNvbW1pdDoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29t
bWl0LzAxNGViYzM5NGQxMTZlODg2Nzk2ZGQ5YWYzNzcyOTk5MTVjYjU1NmQKCkluIHRoZSAubWsg
ZmlsZSwgeW91IHJlcGxhY2UgdGhlIHRlc3Qgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQLiBTbyBJ
CmJlbGlldmUgeW91J2xsIG5lZWQgdG8gYWRkIHRoaXMgZGVwZW5kZW5jeSBoZXJlLCBieSBhZGRp
bmc6CgogICAgIGRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQCgo+ICsgwqDCoMKgwqDC
oMKgaGVscAo+ICsgwqDCoMKgwqDCoMKgwqDCoEVuYWJsZSB0aGUgRXRoZXJDQVQgQ29tbWFuZCBM
aW5lIEludGVyZmFjZSAoQ0xJKSB0b29sCj4gKyDCoMKgwqDCoMKgwqDCoMKgZm9yIHRlc3Rpbmcg
YW5kIGRpYWdub3N0aWNzLgo+ICsgwqDCoMKgwqDCoMKgwqDCoFRoaXMgcmVxdWlyZXMgbGlic3Rk
YysrIHRvIGJlIGVuYWJsZWQuCj4gKwoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvaWdo
LWV0aGVyY2F0L2lnaC1ldGhlcmNhdC5tayAKPiBiL3BhY2thZ2UvaWdoLWV0aGVyY2F0L2lnaC1l
dGhlcmNhdC5tawo+IGluZGV4IDBkMzZiNmQ3MjUuLjNlNjEwMWI1NzAgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9pZ2gtZXRoZXJjYXQvaWdoLWV0aGVyY2F0Lm1rCj4gKysrIGIvcGFja2FnZS9pZ2gt
ZXRoZXJjYXQvaWdoLWV0aGVyY2F0Lm1rCj4gQEAgLTQsNyArNCw2IEBACj4gIwo+ICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCj4gCj4gCj4gLUlHSF9FVEhFUkNBVF9WRVJTSU9OID0gZjVkYzEwOTE3
NjQwMGY1NDBhODY4MmEyYzllZTIwZDQxMWQxNGQ2MQoKVGhpcyBsaW5lIHNob3VsZCBoYXZlIGJl
ZW4gcmVtb3ZlZCBpbiB0aGUgZmlyc3QgcGF0Y2ggKHZlcnNpb24gYnVtcCkuCgo+IElHSF9FVEhF
UkNBVF9WRVJTSU9OID0gY2E2NmNkNmFlOWI4MjFiZmJlYzZkNjhlZTFiNDNkYTM1OWM1ODk0Ywo+
IElHSF9FVEhFUkNBVF9TSVRFID0gJChjYWxsIAo+IGdpdGxhYixldGhlcmxhYi5vcmcsZXRoZXJj
YXQsJChJR0hfRVRIRVJDQVRfVkVSU0lPTikpCj4gSUdIX0VUSEVSQ0FUX0xJQ0VOU0UgPSBHUEwt
Mi4wIChJZ0ggRXRoZXJDQVQgbWFzdGVyKSwgTEdQTC0yLjEgCj4gKGxpYnJhcmllcykKPiBAQCAt
MTYsMTIgKzE1LDIyIEBAIElHSF9FVEhFUkNBVF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAKPiBJ
R0hfRVRIRVJDQVRfQ09ORl9PUFRTID0gXAo+IMKgwqDCoMKgwqDCoMKgLS13aXRoLWxpbnV4LWRp
cj0kKExJTlVYX0RJUikgXAo+IC0gwqDCoMKgwqDCoMKgJChpZiAkKEJSMl9JTlNUQUxMX0xJQlNU
RENQUCksLS1lbmFibGUtdG9vbCwtLWRpc2FibGUtdG9vbCkgXAo+ICsgwqDCoMKgwqDCoMKgJChp
ZiAkKEJSMl9JTlNUQUxMX1VTRVJMSUIpLC0tZW5hYmxlLXVzZXJsaWIsLS1kaXNhYmxlLXVzZXJs
aWIpIAo+IFwKCllvdSBkZWZpbmVkIGluIHRoZSBDb25maWcuaW4gdGhlIG5ldyBvcHRpb24gbmFt
ZWQKQlIyX1BBQ0tBR0VfSUdIX0VUSEVSQ0FUX1VTRVJMSUIuIFRoaXMgQlIyX0lOU1RBTExfVVNF
UkxJQiBzZWVtcyB3cm9uZyAKaGVyZSwKYW5kIHNob3VsZCBiZSByZXBsYWNlZCBieSB0aGUgb3B0
aW9uIHlvdSBkZWZpbmVkLgoKPiArIMKgwqDCoMKgwqDCoCQoaWYgJChCUjJfSU5TVEFMTF9DTElU
T09MKSwtLWVuYWJsZS10b29sLC0tZGlzYWJsZS10b29sKSBcCgpTYW1lIGNvbW1lbnQsIHdpdGgg
QlIyX1BBQ0tBR0VfSUdIX0VUSEVSQ0FUX0NMSVRPT0wuCgo+ICsgwqDCoMKgwqDCoMKgJChpZiAk
KEJSMl9JTlNUQUxMX1RUWSksLS1lbmFibGUtdHR5LC0tZGlzYWJsZS10dHkpIFwKClNhbWUgY29t
bWVudCwgd2l0aCBCUjJfUEFDS0FHRV9JR0hfRVRIRVJDQVRfVFRZLgoKPiArIMKgwqDCoMKgwqDC
oCQoaWYgCj4gJChCUjJfUEFDS0FHRV9JR0hfR0VORVJJQyksLS1lbmFibGUtZ2VuZXJpYywtLWRp
c2FibGUtZ2VuZXJpYykgXAoKU2FtZSBjb21tZW50LCB3aXRoIEJSMl9QQUNLQUdFX0lHSF9FVEhF
UkNBVF9HRU5FUklDLgoKPiDCoMKgwqDCoMKgwqDCoCQoaWYgCj4gJChCUjJfUEFDS0FHRV9JR0hf
RVRIRVJDQVRfODEzOVRPTyksLS1lbmFibGUtODEzOXRvbywtLWRpc2FibGUtODEzOXRvbykgCj4g
XAo+IMKgwqDCoMKgwqDCoMKgJChpZiAKPiAkKEJSMl9QQUNLQUdFX0lHSF9FVEhFUkNBVF9FMTAw
KSwtLWVuYWJsZS1lMTAwLC0tZGlzYWJsZS1lMTAwKSBcCj4gwqDCoMKgwqDCoMKgwqAkKGlmIAo+
ICQoQlIyX1BBQ0tBR0VfSUdIX0VUSEVSQ0FUX0UxMDAwKSwtLWVuYWJsZS1lMTAwMCwtLWRpc2Fi
bGUtZTEwMDApIFwKPiDCoMKgwqDCoMKgwqDCoCQoaWYgCj4gJChCUjJfUEFDS0FHRV9JR0hfRVRI
RVJDQVRfRTEwMDBFKSwtLWVuYWJsZS1lMTAwMGUsLS1kaXNhYmxlLWUxMDAwZSkgXAoKWy4uLl0K
CkNvdWxkIHlvdSBzZW5kIGFuIHVwZGF0ZWQgcGF0Y2ggYWRkcmVzc2luZyB0aG9zZSBpc3N1ZXMs
IHBsZWFzZT8KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
