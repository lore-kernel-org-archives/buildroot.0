Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE8DC433FE
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 19:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AE0081F7C;
	Thu, 17 Nov 2022 19:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AE0081F7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R6wyC2-YXzvL; Thu, 17 Nov 2022 19:57:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C48581F6E;
	Thu, 17 Nov 2022 19:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C48581F6E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3324B1BF3D7
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 19:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B59881F6E
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 19:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B59881F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJif8eFrruoj for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 19:57:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 214BC81F4D
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTP id 214BC81F4D
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 19:57:37 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.88.137])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vl0yoicuo6OFPvl0yoP1Ww; Thu, 17 Nov 2022 20:57:36 +0100
Message-ID: <35f706b8-985f-8e95-0950-0d063b302c81@benettiengineering.com>
Date: Thu, 17 Nov 2022 20:57:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20221019134823.12594-1-giulio.benetti@benettiengineering.com>
 <20221030210615.49866828@windsurf>
 <901ec05a-8d90-8658-29ac-381f50ae0eaa@benettiengineering.com>
 <d6d839d9-7e68-6be2-7c38-98ad1294ffd2@benettiengineering.com>
 <20221116093446.75deaea9@booty>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221116093446.75deaea9@booty>
X-CMAE-Envelope: MS4xfMHynwbLVlNm/qTwYlgIESU+tAlCZ8dpjoqIMv34aXZfvAo0D1vb++oUMn40QsxdzEs7pftjwGxKsso+lIJvMy+Boh/lX7h5BJ2A4iikL7VOYVsXcPM2
 aTUFUvW3Q7KBC7GZ48B+KMEc7ZQoetlEwBgokDSbcXU8O9q/Im8Phhe0kC161gHyNCh9Vj1jru9UgKEZs2WJBqJprOLSMyIvVdrIguF3/Y8tHqdB3BziB7Y6
 ymRMFr6CCCtj9t8f8mUKuT/r4Ih/avoKTQ5FYrj9dNX+lZA3+b6gtnOlZJ6dLAJfHqXC+mH4ZKu28BMC1/rKCw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1668715056; bh=IItbN0b7fBZT7Q1eMKIpVocMBmX9XdTmN2SQMbR8O2k=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Q/HY5oPJfLZuWoctdhKslLCKwt5smZgIi1YpNfGXABM+YbWaaPkVJ4WoHGA0qkdBP
 y0cPhM+c66reUCDeUjAbl2w+Fj7kWT/k6cYtLKL5TKSeGp5Cgb24aK5leJw+jmd7aO
 95cSMCr+lyrvn1/vfIdYdXNHQnixVJK1AU25pgD6bQIymW2FiPfj1C4dVnzx8yKX3o
 kMBbqhasJqMMXkzniCOjhhNFkYWelPiAgtd4djQjlH8NcjwegfAlXoAPcTQfCLsjUv
 jmDC6dy+DES5EIlF3kru8ag0hCl9RJrRqnr+CADyvQ+rZt3o1sn1otoc3CsTYWJg2Q
 lwXC0w7kvORQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Q/HY5oPJ
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: remove wrong
 description in Config.in
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwKCk9uIDE2LzExLzIyIDA5OjM0LCBMdWNhIENlcmVzb2xpIHZpYSBidWlsZHJvb3Qg
d3JvdGU6Cj4gSGkgR2l1bGlvLAo+IAo+IE9uIFdlZCwgMTYgTm92IDIwMjIgMDI6MTU6NTcgKzAx
MDAKPiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNv
bT4gd3JvdGU6Cj4gCj4+IE9uIDE2LzExLzIyIDAxOjMzLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToK
Pj4+IEhpIFRob21hcywgTHVjYSwKPj4+Cj4+PiBPbiAzMC8xMC8yMiAyMTowNiwgVGhvbWFzIFBl
dGF6em9uaSB2aWEgYnVpbGRyb290IHdyb3RlOgo+Pj4+IE9uIFdlZCwgMTkgT2N0IDIwMjIgMTU6
NDg6MjMgKzAyMDAKPj4+PiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVu
Z2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4+Pj4gICAKPj4+Pj4gVGhpcyBydGw4MTg4ZXUgZHJpdmVy
IGlzIG5vdCB0aGUgc2FtZSBhcyB0aGUgb25lIGluIG1haW5saW5lIExpbnV4IHRoYXQKPj4+Pj4g
c3RpbGwgaGFzIHBlbmRpbmcgd29yayB0byBiZSBkb25lIHRoYXQgaW4gdGhpcyBkcml2ZXIgaXMg
ZG9uZSwgY2hlY2s6Cj4+Pj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvc3RhZ2luZy9yODE4OGV1
L1RPRE8KPj4+Pj4gc3BlY2lmaWNhbGx5Ogo+Pj4+PiAqIFN3aXRjaCB0byB1c2UgTElCODAyMTEu
Cj4+Pj4+ICogU3dpdGNoIHRvIHVzZSBNQUM4MDIxMS4KPj4+Pj4gKiBTd2l0Y2ggdG8gdXNlIENG
RzgwMjExLgo+Pj4+PiBTbyBsZXQncyByZW1vdmUgdGhlIGRlc2NyaXB0aW9uIHRoYXQgaXMgbm90
IHZhbGlkIGFueW1vcmUuCj4+Pj4+Cj4+Pj4+IFN1Z2dlc3RlZC1ieTogTHVjYSBDZXJlc29saSA8
bHVjYS5jZXJlc29saUBib290bGluLmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJl
bmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4+Pj4+IC0tLQo+
Pj4+PiBWMS0+VjI6Cj4+Pj4+ICogaW1wcm92ZSBDb25maWcuaW4gZGVzY3JpcHRpb24gYXMgcG9p
bnRlZCBieSBMdWNhIENlcmVzb2xpCj4+Pj4+IC0tLQo+Pj4+PiAgwqAgcGFja2FnZS9ydGw4MTg4
ZXUvQ29uZmlnLmluIHwgNyArKysrLS0tCj4+Pj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9ydGw4MTg4ZXUvQ29uZmlnLmluIGIvcGFja2FnZS9ydGw4MTg4ZXUvQ29uZmlnLmluCj4+Pj4+
IGluZGV4IDc2ZDkwODUyOTcuLjJmYWIxZmQ1YzAgMTAwNjQ0Cj4+Pj4+IC0tLSBhL3BhY2thZ2Uv
cnRsODE4OGV1L0NvbmZpZy5pbgo+Pj4+PiArKysgYi9wYWNrYWdlL3J0bDgxODhldS9Db25maWcu
aW4KPj4+Pj4gQEAgLTQsOSArNCwxMCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUlRMODE4OEVVCj4+
Pj4+ICDCoMKgwqDCoMKgIGRlcGVuZHMgb24gQlIyX0xJTlVYX0tFUk5FTAo+Pj4+PiAgwqDCoMKg
wqDCoCBoZWxwCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCBBIHN0YW5kYWxvbmUgZHJpdmVyIGZvciB0
aGUgUlRMODE4OEVVIFVTQiBXaS1GaSBhZGFwdGVyLgo+Pj4+PiAtwqDCoMKgwqDCoCBUaGlzIGlz
IG5lZWRlZCBvbmx5IGZvciBMaW51eCBrZXJuZWxzIGJlZm9yZSAzLjEyLgo+Pj4+PiAtwqDCoMKg
wqDCoCBTaW5jZSAzLjEyLCB0aGVyZSBpcyBhIChzdGFnaW5nKSBkcml2ZXIgaW4gbWFpbmxpbmUs
IHdpdGggYQo+Pj4+PiAtwqDCoMKgwqDCoCBzaW1pbGFyIGNvZGViYXNlLgo+Pj4+PiArwqDCoMKg
wqDCoCBUaGlzIHJ0bDgxODhldSBkcml2ZXIgaXMgbm90IHRoZSBzYW1lIGFzIHRoZSBvbmUgaW4g
bWFpbmxpbmUKPj4+Pj4gK8KgwqDCoMKgwqAgTGludXggdGhhdCBzdGlsbCBoYXMgcGVuZGluZyB3
b3JrIHRvIGJlIGRvbmUgdGhhdCBpbiB0aGlzCj4+Pj4+ICvCoMKgwqDCoMKgIGRyaXZlciBpcyBk
b25lLCBjaGVjazoKPj4+Pj4gKwo+Pj4+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL3N0YWdpbmcv
cjgxODhldS9UT0RPCj4+Pj4KPj4+PiBJIGRvbid0IHNlZSBhbnkgdGhpbmcgaW4gdGhpcyBUT0RP
IHRoYXQgZXhwbGFpbnMgd2h5IHRoZSBvdXQtb2YtdHJlZQo+Pj4+IGRyaXZlciBpcyBiZXR0ZXIg
dGhhbiB0aGUgbWFpbmxpbmUgZHJpdmVyLgo+Pj4+Cj4+Pj4gVGhlIG91dC1vZi10cmVlIGRyaXZl
ciBoYXMgYmVlbiBpbnRlZ3JhdGVkIGludG8gZHJpdmVycy9zdGFnaW5nLywgYW5kCj4+Pj4gdGhp
cyBUT0RPIGZpbGUgbGlzdHMgd2hhdCBzaG91bGQgYmUgaW1wcm92ZWQgaW4gdGhlIGRyaXZlciBz
byB0aGF0IGl0Cj4+Pj4gY2FuIGJlIGdyYWR1YXRlZCB0byBtb3ZlIG91dHNpZGUgb2YgZHJpdmVy
cy9zdGFnaW5nLyBpbnRvIHRoZSBwcm9wZXIKPj4+PiBkcml2ZXJzL25ldC93aXJlbGVzcy8gbG9j
YXRpb24uCj4+Pj4KPj4+PiBJIGRvbid0IHNlZSBhbnl0aGluZyBpbiB0aGlzIFRPRE8gdGhhdCBp
bmRpY2F0ZXMgdGhhdCB0aGUgb3V0LW9mLXRyZWUKPj4+PiBkcml2ZXIgaGFzICJtb3JlIGZlYXR1
cmVzIiB0aGFuIHRoZSBtYWlubGluZSBkcml2ZXIsIHNvIHRvIG1lIHRoZQo+Pj4+IENvbmZpZy5p
biBoZWxwIHRleHQgc3RpbGwgbWFrZXMgc2Vuc2UuCj4+Pj4KPj4+PiBDb3VsZCB5b3UgZ2l2ZSBz
b21lIG1vcmUgZGV0YWlscz8KPj4+Cj4+PiBUaGUgVE9ETyBmaWxlWzBdIGlzIG91dGRhdGVkIGJl
Y2F1c2UgaXQgc3RhdGVzIHRoYXQ6Cj4+PiAqIFN3aXRjaCB0byB1c2UgTElCODAyMTEuCj4+PiAq
IFN3aXRjaCB0byB1c2UgTUFDODAyMTEuCj4+PiAqIFN3aXRjaCB0byB1c2UgQ0ZHODAyMTEuCj4+
PiBhcmUgc3RpbGwgcGVuZGluZywgYnV0IGl0J3MgdHJ1ZSBub3QgYmVjYXVzZSBpZiB3ZSBjaGVj
ayB0aGUgS2NvbmZpZ1sxXQo+Pj4gd2UgZmluZCAnZGVwZW5kcyBvbiBDRkc4MDIxMScgYW5kIExJ
QjgwMjExLiBBbHNvIGlmIHdlIGNoZWNrIGZvcgo+Pj4gaWVlZTgwMjExXyooKSBjYWxsc2UgaW50
IGRyaXZlcnMvc3RhZ2luZy9yODE4OGV1IGZvbGRlciB3ZSBmaW5kIGEgbG90IG9mCj4+PiBjYWxs
cy4gU28gSSB0aGluayB0aGlzIG1vZHVsZSBpcyBvbmx5IGEgY29weSBvZiB0aGUgTGludXggZHJp
dmVyIHRoYXQKPj4+IGNhbiB3b3JrIGFzIHNwZWNpZmllZCBpbiB0aGUgYWN0dWFsIGhlbHAod2l0
aCBMaW51eCB2ZXJzaW9uIGJlZm9yZSAzLjEyLgo+IAo+IEkgaGF2ZW4ndCBjaGVja2VkIG15c2Vs
ZiwgYnV0IGlmIHlvdSB0aGluayB0aGUgdHJhbnNpdGlvbiB0byBjZmc4MDIxMQo+IGFuZCBsaWI4
MDIxMSBpcyBjb21wbGV0ZWQgaW4gbWFpbmxpbmUsIHlvdSBjYW4gc2VuZCBhIHBhdGNoIHRvIGhh
dmUgdGhlCj4gVE9ETyB1cGRhdGVkIGluIHVwc3RyZWFtIExpbnV4LiBUaGF0IHdvdWxkIHJlZHVj
ZSBjb25mdXNpb24uCgpJJ3ZlIGRvdWJsZSBjaGVja2VkIGFuZCBpdCdzIHN0aWxsIG9uZ29pbmcs
IHRoZXJlIGlzIGEgbWl4IG9mIGNvZGUgb2YKbG9jYWwgcnR3X2llZWU4MDIxMS5jIGFuZCB0aGUg
bGludXgncyBpZWVlODAyMTEuaCwgc28gSSB3YXMgd3JvbmcuCgo+Pj4gRG9lcyBpdCBtYXliZSBt
YWtlIHNlbnNlIHRvIGFkZCBpbiB0aGUgaGVscCBzZWN0aW9uOgo+Pj4gYGBgCj4+PiBJZiB1c2lu
ZyBMaW51eCAzLjEyKyBpdCdzIHJlY29tbWVuZGVkIHRvIHVzZSBMaW51eCBkcml2ZXIKPj4+IGBg
YAo+IAo+IFllcywgYWJzb2x1dGVseSwgYnV0IG9ubHkgaWYgYXJlIHlvdSByZWFzb25hYmx5IHN1
cmUgdGhhdCBMaW51eCAzLjEyIGhhcwo+IGFsbCB0aGUgc2FtZSBydGw4MTg4ZXUgZmVhdHVyZXMg
dGhhdCBpdCBoYXMgY3VycmVudGx5LgoKTm90IDEwMCUuIEkgdGhpbmsgdGhlbiBpdCdzIGJldHRl
ciB0byBkcm9wIHRoaXMgcGF0Y2guIEkgdGFnIGl0IGFzIApyZWplY3RlZCBpbiBQYXRjaHdvcmsu
CgpUaGFua3MgZm9yIHBvaW50aW5nIGFsbCB0aG9zZSBwcmVjaW91cyBkZXRhaWxzIQpCZXN0IHJl
Z2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkNFTy9DVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
