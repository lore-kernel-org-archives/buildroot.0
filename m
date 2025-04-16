Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A28C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22921606AF;
	Wed, 16 Apr 2025 21:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rChJlJfX6mUd; Wed, 16 Apr 2025 21:22:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1C1D60D72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1C1D60D72;
	Wed, 16 Apr 2025 21:22:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3DEF159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9DAB60A55
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4hSGrG_KPJw for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:22:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27484606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27484606B4
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27484606B4
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:22:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D04451C0083; Wed, 16 Apr 2025 23:22:44 +0200 (CEST)
Message-ID: <af35f68d-d048-4170-b6e2-894c0b6fd8e2@rnout.be>
Date: Wed, 16 Apr 2025 23:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250329200354.178980-1-thomas@devoogdt.com>
Content-Language: en-GB
In-Reply-To: <20250329200354.178980-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WHOwqgApbzzLX9rIbqKGa2DIIfFJ0kErTCbLroyDb7g=;
 b=EiuyM7O3+LMs1s6Tf2P2RuOYSQMBaU2CYi1uhkoXEnwO7NLMYVnYeJPMWG1SpV801RIpg0
 SIxGFXS697yO8Z5q/6xDbk93MeMBqz+rgZGWyMhcpj9rAdEDGxNVV1447b05BJnaLoZkRC
 YVvQLPTLAWojd+ZvWoegXhcdmt59FnlSeSjUvj1hDAdmHMUkRfv5gNDkbL8k9xkfBmRMmn
 dGGkFBcd9GFZnSlv3GOKj/DgYpQL/Soth5uCbMWJFYnArDKVUzyAmZdsVmx2cFWFamgQ4I
 Pt55WA5WRHy5J/azu6DXouH1oQ/MF+SmT7+mcDNOAC32gMJGVRA6J3rWKGDkYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH v1] package/cairo: bump to 1.18.4
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

Ck9uIDI5LzAzLzIwMjUgMjE6MDMsIFRob21hcyBEZXZvb2dkdCB3cm90ZToKPiBOZXdzOgo+IC0g
aHR0cHM6Ly93d3cuY2Fpcm9ncmFwaGljcy5vcmcvbmV3cy9jYWlyby0xLjE4LjQvCj4KPiBPdGhl
ciBjaGFuZ2VzOgo+IC0gMDAwMS1jYWlyby1mdC1wcml2YXRlLmgtZml4LW1pc3NpbmctRlRfQ29s
b3ItZXJyb3IucGF0Y2gKPiAgICBoYXMgYmVlbiBkcm9wcGVkIGJlY2F1c2UgaXQncyB1cHN0cmVh
bS4gWzFdCj4KPiAtIGNfc3RkPWdudTExIG92ZXJyaWRlIGhhcyBiZWVuIGRyb3BwZWQgYmVjYXVz
ZQo+ICAgIGl0J3MgdXBzdHJlYW0uIFsyXQo+Cj4gLSBVc2UgdGhlIG5ldyAnbHpvJyBvcHRpb24u
IFszXQo+Cj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9jYWlyby9jYWlyby8t
L2NvbW1pdC85NjA3ZTE5YTllNGMxNzg0ZTdiNjU2NzcyZTFkZjgyYWVhMjZmNmU3Cj4gWzJdIGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9jYWlyby9jYWlyby8tL2NvbW1pdC9iNjBmNDdk
ZmQ1YmJlOThhZWM0M2Y2YzM1NmJhM2JlOWExYjc5ODllCj4gWzNdIGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9jYWlyby9jYWlyby8tL2NvbW1pdC9jMTc0OGU3OWYwYjE4ZDQ0ODkxYmRh
MmI2YWE4NzcxNzVkODAyNjYwCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRo
b21hc0BkZXZvb2dkdC5jb20+CgogwqBBcHBsaWVkIHRvIDIwMjUuMDIueCBhbmQgMjAyNC4xMS54
LCB0aGFua3MuCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4gLS0tCj4gICAuLi5wcml2YXRlLmgt
Zml4LW1pc3NpbmctRlRfQ29sb3ItZXJyb3IucGF0Y2ggfCAzMiAtLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gICBwYWNrYWdlL2NhaXJvL2NhaXJvLmhhc2ggICAgICAgICAgICAgICAgICAgICAgfCAgNCAr
LS0KPiAgIHBhY2thZ2UvY2Fpcm8vY2Fpcm8ubWsgICAgICAgICAgICAgICAgICAgICAgICB8IDEx
ICsrKystLS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlv
bnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2NhaXJvLzAwMDEtY2Fpcm8tZnQt
cHJpdmF0ZS5oLWZpeC1taXNzaW5nLUZUX0NvbG9yLWVycm9yLnBhdGNoCj4KPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9jYWlyby8wMDAxLWNhaXJvLWZ0LXByaXZhdGUuaC1maXgtbWlzc2luZy1GVF9D
b2xvci1lcnJvci5wYXRjaCBiL3BhY2thZ2UvY2Fpcm8vMDAwMS1jYWlyby1mdC1wcml2YXRlLmgt
Zml4LW1pc3NpbmctRlRfQ29sb3ItZXJyb3IucGF0Y2gKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAzYjE4ZDgwNzdiLi4wMDAwMDAwMDAwCj4gLS0tIGEvcGFja2FnZS9jYWlyby8w
MDAxLWNhaXJvLWZ0LXByaXZhdGUuaC1maXgtbWlzc2luZy1GVF9Db2xvci1lcnJvci5wYXRjaAo+
ICsrKyAvZGV2L251bGwKPiBAQCAtMSwzMiArMCwwIEBACj4gLUZyb20gZGE2OThkYjBjMjA1MDdm
MGUwNzQ5MmNiZTQwZGJhZjFjOTA1M2Y3MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAtRnJv
bTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29nZHQuY29tPgo+IC1EYXRlOiBTdW4sIDEy
IE5vdiAyMDIzIDA5OjU4OjA1ICswMTAwCj4gLVN1YmplY3Q6IFtQQVRDSF0gY2Fpcm8tZnQtcHJp
dmF0ZS5oOiBmaXggbWlzc2luZyBGVF9Db2xvciBlcnJvcgo+IC0KPiAtSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIC4uL3NyYy9jYWlyby1jb2xyLWdseXBoLXJlbmRlci5jOjM3Ogo+IC0uLi9zcmMvY2Fp
cm8tZnQtcHJpdmF0ZS5oOjg3OjMwOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ0ZUX0NvbG9y
Jwo+IC0gICA4NyB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRlRfQ29sb3IgICAgICAg
ICAgICAgICAqcGFsZXR0ZSwKPiAtICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+Cj4gLQo+IC1VcHN0cmVhbTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2NhaXJvL2NhaXJvLy0vaXNzdWVzLzc5Mgo+IC1TaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29n
ZHQgPHRob21hc0BkZXZvb2dkdC5jb20+Cj4gLS0tLQo+IC0gc3JjL2NhaXJvLWZ0LXByaXZhdGUu
aCB8IDIgKysKPiAtIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAtCj4gLWRpZmYg
LS1naXQgYS9zcmMvY2Fpcm8tZnQtcHJpdmF0ZS5oIGIvc3JjL2NhaXJvLWZ0LXByaXZhdGUuaAo+
IC1pbmRleCA4MzZmN2U1MjMuLjZiMGUzMDIyMyAxMDA2NDQKPiAtLS0tIGEvc3JjL2NhaXJvLWZ0
LXByaXZhdGUuaAo+IC0rKysgYi9zcmMvY2Fpcm8tZnQtcHJpdmF0ZS5oCj4gLUBAIC00Myw2ICs0
Myw4IEBACj4gLQo+IC0gI2lmIENBSVJPX0hBU19GVF9GT05UCj4gLQo+IC0rI2luY2x1ZGUgRlRf
Q09MT1JfSAo+IC0rCj4gLSBDQUlST19CRUdJTl9ERUNMUwo+IC0KPiAtIHR5cGVkZWYgc3RydWN0
IF9jYWlyb19mdF91bnNjYWxlZF9mb250IGNhaXJvX2Z0X3Vuc2NhbGVkX2ZvbnRfdDsKPiAtLS0K
PiAtMi4zNC4xCj4gLQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2NhaXJvL2NhaXJvLmhhc2ggYi9w
YWNrYWdlL2NhaXJvL2NhaXJvLmhhc2gKPiBpbmRleCBiMmQzODRkMDFhLi4zYzY2YzYzZjZkIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvY2Fpcm8vY2Fpcm8uaGFzaAo+ICsrKyBiL3BhY2thZ2UvY2Fp
cm8vY2Fpcm8uaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+IC0jIEZyb20gaHR0cHM6Ly93d3cuY2Fp
cm9ncmFwaGljcy5vcmcvcmVsZWFzZXMvY2Fpcm8tMS4xOC4yLnRhci54ei5zaGEyNTZzdW0KPiAt
c2hhMjU2ICBhNjJiOWJiNDI0MjVlODQ0Y2MzZDZkZGRlMDQzZmYzOWRiYWJlZGQxNTQyZWJhNTdh
MmViNzlmODU4ODlkNDVhICBjYWlyby0xLjE4LjIudGFyLnh6Cj4gKyMgRnJvbSBodHRwczovL3d3
dy5jYWlyb2dyYXBoaWNzLm9yZy9yZWxlYXNlcy9jYWlyby0xLjE4LjQudGFyLnh6LnNoYTI1NnN1
bQo+ICtzaGEyNTYgIDQ0NWVkODIwOGE2ZTQ4MjNkZTEyMjZhNzRjYTMxOWQzNjAwZTgzZjYzNjlm
OTliMTQyNjUwMDY1OTljMzJjY2IgIGNhaXJvLTEuMTguNC50YXIueHoKPiAgIAo+ICAgIyBIYXNo
IGZvciBsaWNlbnNlIGZpbGVzOgo+ICAgc2hhMjU2ICA2NzIyOGE5ZjdjNWY5YjY3YzU4ZjU1NmYx
YmUxNzhmNjJkYTRkOWUyZTYyODUzMThkOGM3NGQ1NjcyNTVhYmRmICBDT1BZSU5HCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvY2Fpcm8vY2Fpcm8ubWsgYi9wYWNrYWdlL2NhaXJvL2NhaXJvLm1rCj4g
aW5kZXggYzc0MWM5Nzg1My4uMjZjMjU1NWY5ZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2NhaXJv
L2NhaXJvLm1rCj4gKysrIGIvcGFja2FnZS9jYWlyby9jYWlyby5tawo+IEBAIC00LDcgKzQsNyBA
QAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+IC1DQUlST19WRVJTSU9O
ID0gMS4xOC4yCj4gK0NBSVJPX1ZFUlNJT04gPSAxLjE4LjQKPiAgIENBSVJPX1NPVVJDRSA9IGNh
aXJvLSQoQ0FJUk9fVkVSU0lPTikudGFyLnh6Cj4gICBDQUlST19MSUNFTlNFID0gTEdQTC0yLjEg
b3IgTVBMLTEuMSAobGlicmFyeSkKPiAgIENBSVJPX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HIENP
UFlJTkctTEdQTC0yLjEgQ09QWUlORy1NUEwtMS4xCj4gQEAgLTM3LDggKzM3LDcgQEAgQ0FJUk9f
Q09ORl9PUFRTID0gXAo+ICAgCS1EdGVzdHM9ZGlzYWJsZWQgXAo+ICAgCS1Ec3BlY3RyZT1kaXNh
YmxlZCBcCj4gICAJLURzeW1ib2wtbG9va3VwPWRpc2FibGVkIFwKPiAtCS1EZ3RrX2RvYz1mYWxz
ZSBcCj4gLQktRGNfc3RkPWdudTExCj4gKwktRGd0a19kb2M9ZmFsc2UKPiAgIENBSVJPX0RFUEVO
REVOQ0lFUyA9IFwKPiAgIAlob3N0LXBrZ2NvbmYgXAo+ICAgCWZvbnRjb25maWcgXAo+IEBAIC01
OSw4ICs1OCw3IEBAIEhPU1RfQ0FJUk9fQ09ORl9PUFRTID0gXAo+ICAgCS1EZ2xpYj1lbmFibGVk
IFwKPiAgIAktRHNwZWN0cmU9ZGlzYWJsZWQgXAo+ICAgCS1Ec3ltYm9sLWxvb2t1cD1kaXNhYmxl
ZCBcCj4gLQktRGd0a19kb2M9ZmFsc2UgXAo+IC0JLURjX3N0ZD1nbnUxMQo+ICsJLURndGtfZG9j
PWZhbHNlCj4gICBIT1NUX0NBSVJPX0RFUEVOREVOQ0lFUyA9IFwKPiAgIAlob3N0LWZyZWV0eXBl
IFwKPiAgIAlob3N0LWZvbnRjb25maWcgXAo+IEBAIC03MSw3ICs2OSwxMCBAQCBIT1NUX0NBSVJP
X0RFUEVOREVOQ0lFUyA9IFwKPiAgIAlob3N0LXpsaWIKPiAgIAo+ICAgaWZlcSAoJChCUjJfUEFD
S0FHRV9MWk8pLHkpCj4gK0NBSVJPX0NPTkZfT1BUUyArPSAtRGx6bz1lbmFibGVkCj4gICBDQUlS
T19ERVBFTkRFTkNJRVMgKz0gbHpvCj4gK2Vsc2UKPiArQ0FJUk9fQ09ORl9PUFRTICs9IC1EbHpv
PWRpc2FibGVkCj4gICBlbmRpZgo+ICAgCj4gICBpZmVxICgkKEJSMl9QQUNLQUdFX0ZSRUVUWVBF
KSx5KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
