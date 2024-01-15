Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0453C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 22:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A32A813E5;
	Mon, 15 Jan 2024 22:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A32A813E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OqSNqEWunMX3; Mon, 15 Jan 2024 22:19:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 885EB813E0;
	Mon, 15 Jan 2024 22:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 885EB813E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1CE11BF39D
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 22:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75D8E61195
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 22:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75D8E61195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BWZXCZ35KM0x for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 22:19:51 +0000 (UTC)
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E803561194
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 22:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E803561194
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PVJ4rwgf7So8WPVJ4rwGGp; Mon, 15 Jan 2024 23:19:47 +0100
Message-ID: <2c318982-bed2-468d-919b-37a1d675f898@benettiengineering.com>
Date: Mon, 15 Jan 2024 23:19:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240115213415.17439-1-fontaine.fabrice@gmail.com>
 <20240115213415.17439-2-fontaine.fabrice@gmail.com>
 <167d3968-1070-42dd-a140-f26a9d6d9657@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <167d3968-1070-42dd-a140-f26a9d6d9657@benettiengineering.com>
X-CMAE-Envelope: MS4xfL3Slm7U2T313GHl0F30ps1EpAWzrVO+bFn6QI+qoOQPBiwPl0nWTQak3d4Ixm16W0G5rMdNAGfn9+IjdHf7BHr8ho51Z1I7oq7d6xUkHA3aOQZnEyu6
 dhd7/RFwskPBnpQNBprRmJsOQF/4kMJMFrywRBsV0whx+XK6ySXH/GJtuIyUKJvXcIYTyn9fJkysjzHbN0rQzIpxUgxxTgJSHZpR86GPJEWp/XIBbGQxE0YA
 zBrvyyCMkD6B+TP7Zb25os1uiWdziml+nbXl9Gkv/AGUX5+V/q7NDL3QIV+sIfxPAi4oP+FW5UfML6X6QHfw5Gr2AztwgOlqVtK7gsVgM1M06hBuJaaViJBG
 QpznVd2/JHWqbygXY1swhgFpWXMM6xdSDyG8m/7bVZrKmsQgaO2l0IdC6Aob2fJixXi65JrMgkjFr3ZCxJhZCFAiGBZmmyftxEffW1uxTqkxXyWVIiaZTcXZ
 wFN+oIYH3X7LoF7r
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705357187; bh=YN/K8c2d/KGsh9v4dpsa62a8hn31rdAhgPM0100N2Y0=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=AuhV78lXjDPSLWMZjlo7++QftkFEK+7FYCjb4SNgSstuzQCzhko4auaiu88eL6Ryz
 45gqFPbK06fx45AfHLimXAJs1mMQmzmzbGZPndpUm/Dwpj7J5f4xzPp13vrvPZ7W1v
 4Qg19JiH6IITOr/e/iciwUL7wZPkR5yY9VcKXCCQ94QHFs+6ulv6ftZZEvppHE9dsU
 Eydc90bblyqJqS4V0ADLr/Zhbq7PP4t9IKw0TFsQy6VKhPvzDVw5pq4zelJ5jYb8ML
 0OROmDN/vOfDJGcPgdjd1a0sLkdnZbOcWoG2Xnp8l89EqpG6oyG2wpSmIdZPyzO0qK
 sKVKwJp3xO3wg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=AuhV78lX
Subject: Re: [Buildroot] [PATCH 2/2] package/attr: affected by gcc bug 101766
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Norbert Lange <nolange79@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RllJIHRoaXMgY291bGQgYmUgZml4ZWQgYXMgaXQncyBiZWVuIGRvbmUgaW4gbGliZnVzZSBieSBj
aGVja2luZyBpbgpNYWtlZmlsZSBpZiBzeW12ZXIgaXMgc3VwcG9ydGVkIGFuZCBlbWl0dGluZzoK
LURIQVZFX1NZTVZFUl9BVFRSSUJVVEUKCmFuZCB0aGVuOgpodHRwczovL2dpdGh1Yi5jb20vbGli
ZnVzZS9saWJmdXNlL2Jsb2IvbWFzdGVyL2xpYi9mdXNlX21pc2MuaCNMMTgtTDI2Cgp1c2luZzoK
X19hc21fXygiXHQuc3ltdmVyICIgc3ltMSAiLCIgc3ltMik7Cmluc3RlYWQgb2Y6Cl9fYXR0cmli
dXRlX18gKChzeW12ZXIgKHN5bTIpKSkKCk5vdyB0aGF0IEknbSBnZXR0aW5nIGRlZXBlciBJJ20g
c2VlaW5nIHRoZSBleGFjdCBzYW1lIHByb2JsZW0gY29taW5nCmZyb20gdGhlIGdjYyBidWcgMTAx
NzY2LCB0aGF0IF9faGFzX2F0dHJpYnV0ZSgpIGlzIGJyb2tlbiBmb3IgbWFueQphdHRyaWJ1dGVz
IGluY2x1ZGluZyBzeW12ZXIgYW5kIHRoYXQgcmVxdWlyZXMgYSBydW50aW1lIGNoZWNrIHRvCmtu
b3cgaWYgc3ltdmVyIGlzIHN1cHBvcnQgb3Igbm90LgoKQWdhaW4sIGl0IHdhcyBqdXN0IEZZSSwg
dGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuIElmIHNvbWVvbmUgd2FudHMKdG8gZml4IGl0IGlz
IHdlbGNvbWUuCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkNFTyZDVE9AQmVuZXR0
aSBFbmdpbmVlcmluZyBzYXMKCk9uIDE1LzAxLzI0IDIzOjA4LCBHaXVsaW8gQmVuZXR0aSB3cm90
ZToKPiBIaSBGYWJyaWNlLAo+IAo+IE9uIDE1LzAxLzI0IDIyOjM0LCBGYWJyaWNlIEZvbnRhaW5l
IHdyb3RlOgo+PiBhdHRyIGlzIGFmZmVjdGVkIGJ5IGdjYyBidWcgMTAxNzY2IHNpbmNlIHZlcnNp
b24gMS41LjIgYW5kCj4+IGh0dHBzOi8vZ2l0LnNhdmFubmFoLm5vbmdudS5vcmcvY2dpdC9hdHRy
LmdpdC9jb21taXQvP2lkPTExYjkwNjkwOThiNGQ0YzIzZWZiMDZjOTQ1N2EwODViNzg0MzU0ZDQK
Pj4gcmVzdWx0aW5nIGluIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSBvbiBtaWNyb2JsYXpl
IHNpbmNlIGNvbW1pdAo+PiBiMzFiOTEyOTZlN2Y5ODViOTA5ZjEwNGYwNmEwOThhZGRkZWYxZmVh
Ogo+Pgo+PiBsaWJhdHRyL3N5c2NhbGxzLmM6MTMzOjEwOiBlcnJvcjogc3ltdmVyIGlzIG9ubHkg
c3VwcG9ydGVkIG9uIEVMRiAKPj4gcGxhdGZvcm1zCj4+IMKgwqAgMTMzIHwgIyBwcmFnbWEgR0ND
IHZpc2liaWxpdHkgcG9wCj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgIF5+fgo+
IAo+IFBsZWFzZSBhZGQ6Cj4gU28gbGV0J3MgZGlzYWJsZSBwYWNrYWdlIGF0dHIgYW5kIHBhY2th
Z2VzIGRlcGVuZGluZyBvbiBpdC4KPiAKPj4KPj4gRml4ZXM6Cj4+IMKgIC0gCj4+IGh0dHA6Ly9h
dXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzI5Yzc2ZTAyYmVjZWRmOTIyYmQ3ZGMwNTMz
MzM4YzA3OGJmNzdkMmEKPj4KPj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9u
dGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4+IC0tLQo+PiDCoCBwYWNrYWdlL2FjbC9Db25maWcu
aW7CoMKgwqDCoCB8IDQgKysrKwo+PiDCoCBwYWNrYWdlL2F0dHIvQ29uZmlnLmluwqDCoMKgIHwg
NCArKysrCj4+IMKgIHBhY2thZ2Uvc3lzdGVtZC9Db25maWcuaW4gfCA0ICsrKysKPj4gwqAgMyBm
aWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2FjbC9Db25maWcuaW4gYi9wYWNrYWdlL2FjbC9Db25maWcuaW4KPj4gaW5kZXggOTJmMjI1MTg3
OC4uMTMyYzZlOGFkMyAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9hY2wvQ29uZmlnLmluCj4+ICsr
KyBiL3BhY2thZ2UvYWNsL0NvbmZpZy5pbgo+PiBAQCAtMSw1ICsxLDYgQEAKPj4gwqAgY29uZmln
IEJSMl9QQUNLQUdFX0FDTAo+PiDCoMKgwqDCoMKgIGJvb2wgImFjbCIKPj4gK8KgwqDCoCBkZXBl
bmRzIG9uICFCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzEwMTc2NiAjIGF0dHIKPj4gwqDCoMKg
wqDCoCBzZWxlY3QgQlIyX1BBQ0tBR0VfQVRUUgo+PiDCoMKgwqDCoMKgIGhlbHAKPj4gwqDCoMKg
wqDCoMKgwqAgUE9TSVggQWNjZXNzIENvbnRyb2wgTGlzdHMsIHdoaWNoIGFyZSB1c2VkIHRvIGRl
ZmluZSBtb3JlCj4+IEBAIC04LDMgKzksNiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfQUNMCj4+IMKg
wqDCoMKgwqDCoMKgIFRoaXMgcGFja2FnZSBhbHNvIHByb3ZpZGVzIGxpYmFjbC4KPj4gwqDCoMKg
wqDCoMKgwqAgaHR0cDovL3NhdmFubmFoLm5vbmdudS5vcmcvcHJvamVjdHMvYWNsCj4+ICsKPj4g
K2NvbW1lbnQgImFjbCBuZWVkcyBhIHRvb2xjaGFpbiBub3QgYWZmZWN0ZWQgYnkgR0NDIGJ1ZyAx
MDE3NjYiCj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzEw
MTc2Ngo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hdHRyL0NvbmZpZy5pbiBiL3BhY2thZ2UvYXR0
ci9Db25maWcuaW4KPj4gaW5kZXggNTU0NzcyYjc1ZC4uYjlkOWY1N2Q4ZiAxMDA2NDQKPj4gLS0t
IGEvcGFja2FnZS9hdHRyL0NvbmZpZy5pbgo+PiArKysgYi9wYWNrYWdlL2F0dHIvQ29uZmlnLmlu
Cj4+IEBAIC0xLDcgKzEsMTEgQEAKPj4gwqAgY29uZmlnIEJSMl9QQUNLQUdFX0FUVFIKPj4gwqDC
oMKgwqDCoCBib29sICJhdHRyIgo+PiArwqDCoMKgIGRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5f
SEFTX0dDQ19CVUdfMTAxNzY2Cj4+IMKgwqDCoMKgwqAgaGVscAo+PiDCoMKgwqDCoMKgwqDCoCBD
b21tYW5kcyBmb3IgTWFuaXB1bGF0aW5nIEZpbGVzeXN0ZW0gRXh0ZW5kZWQgQXR0cmlidXRlcy4K
Pj4gwqDCoMKgwqDCoMKgwqAgVGhpcyBwYWNrYWdlIGFsc28gcHJvdmlkZXMgbGliYXR0ci4KPj4g
wqDCoMKgwqDCoMKgwqAgaHR0cDovL3NhdmFubmFoLm5vbmdudS5vcmcvcHJvamVjdHMvYXR0cgo+
PiArCj4+ICtjb21tZW50ICJhdHRyIG5lZWRzIGEgdG9vbGNoYWluIG5vdCBhZmZlY3RlZCBieSBH
Q0MgYnVnIDEwMTc2NiIKPj4gK8KgwqDCoCBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX0dD
Q19CVUdfMTAxNzY2Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluIGIv
cGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbgo+PiBpbmRleCA4NTkzMzJkOWU0Li5mMGY5MmI3OGIw
IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluCj4+ICsrKyBiL3BhY2th
Z2Uvc3lzdGVtZC9Db25maWcuaW4KPj4gQEAgLTQ1MSw2ICs0NTEsNyBAQCBjb25maWcgQlIyX1BB
Q0tBR0VfU1lTVEVNRF9SRktJTEwKPj4gwqAgY29uZmlnIEJSMl9QQUNLQUdFX1NZU1RFTURfU01B
Q0tfU1VQUE9SVAo+PiDCoMKgwqDCoMKgIGJvb2wgImVuYWJsZSBTTUFDSyBzdXBwb3J0Igo+PiAr
wqDCoMKgIGRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfMTAxNzY2ICMgYXR0
cgo+PiDCoMKgwqDCoMKgIHNlbGVjdCBCUjJfUEFDS0FHRV9BVFRSCj4+IMKgwqDCoMKgwqAgc2Vs
ZWN0IEJSMl9QQUNLQUdFX1NNQUNLCj4+IMKgwqDCoMKgwqAgaGVscAo+PiBAQCAtNDYzLDYgKzQ2
NCw5IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9TWVNURU1EX1NNQUNLX1NVUFBPUlQKPj4gwqDCoMKg
wqDCoMKgwqAgV2hlbiB0aGlzIGZlYXR1cmUgaXMgZW5hYmxlZCwgU3lzdGVtZCBtb3VudHMgc21h
Y2tmcyBhbmQKPj4gwqDCoMKgwqDCoMKgwqAgbWFuYWdlcyBzZWN1cml0eSBsYWJlbHMgZm9yIHNv
Y2tldHMuCj4+ICtjb21tZW50ICJTTUFDSyBzdXBwb3J0IG5lZWRzIGEgdG9vbGNoYWluIG5vdCBh
ZmZlY3RlZCBieSBHQ0MgYnVnIDEwMTc2NiIKPj4gK8KgwqDCoCBkZXBlbmRzIG9uIEJSMl9UT09M
Q0hBSU5fSEFTX0dDQ19CVUdfMTAxNzY2Cj4+ICsKPj4gwqAgY29uZmlnIEJSMl9QQUNLQUdFX1NZ
U1RFTURfU1lTRVhUCj4+IMKgwqDCoMKgwqAgYm9vbCAiZW5hYmxlIHN5c2V4dCBzdXBwb3J0Igo+
PiDCoMKgwqDCoMKgIGhlbHAKPiAKPiBJJ3ZlIGZvdW5kIHRoYXQgZm9sbG93aW5nIGRlcGVuZGVu
Y3kgaXMgbWlzc2luZzoKPiBCUjJfUEFDS0FHRV9MVUFfRkxVCj4gCj4gRG8geW91IG1pbmQgc2Vu
ZGluZyBhIFYyIHdpdGggdGhhdCBkZXBlbmRlbmN5IGFuZCByZXdvcmRpbmcgYSBiaXQgbGlrZQo+
IEkndmUgcG9pbnRlZCBhYm92ZT8KPiAKPiBXaXRoIHRob3NlIGluY2x1ZGVkIHlvdSBjYW4gYWRk
Ogo+IFJldmlld2VkLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVu
Z2luZWVyaW5nLmNvbT4KPiAKPiBUaGFuayB5b3UhCj4gCj4gQmVzdCByZWdhcmRzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
