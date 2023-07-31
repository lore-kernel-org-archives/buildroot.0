Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EE9C001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 21:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A52640189;
	Mon, 31 Jul 2023 21:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A52640189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oX0_RHleLdbD; Mon, 31 Jul 2023 21:44:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D08A40B49;
	Mon, 31 Jul 2023 21:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D08A40B49
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6ED371BF25B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CBC9610B0
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CBC9610B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLf_UMpV9sBz for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 21:44:24 +0000 (UTC)
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF73160F0A
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 21:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF73160F0A
Received: from smtpclient.apple ([146.241.23.166])
 by Aruba Outgoing Smtp  with ESMTPA
 id QageqJLp4UMjkQagfqFhIu; Mon, 31 Jul 2023 23:44:21 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 31 Jul 2023 23:44:20 +0200
Message-Id: <9A7A1321-3F7A-454F-9298-F1CF14755E78@benettiengineering.com>
References: <20230731232628.4824f155@windsurf>
In-Reply-To: <20230731232628.4824f155@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (20G75)
X-CMAE-Envelope: MS4xfLrPJTKVN/NgMqIld/J+A6zAzvuvO96b+T07ehLIV/iBNEFzDNxyl0gKpXV08yiLv/GHo8oeDLTRmXbBpY4OjfKDHhF+Dp0gqblz8nx7xpxZyuEUKp1Z
 Umoj9YNjgNDEGe3+FDCtirVyBYQ8+/IpTB5+d2kMchQ/N46xz4az6YvJ3mB3llbVxnWivc2GL6/aUAh/JMNEMJrWYlap/fIAwSAyMA97cb6mexBstvSVYjwk
 lcj0PHw4l2SurB84h0TTQhzLW2+DQVVoBBHb2OAaka9mhL3U6freQbNwgkyqw6mmdGIuM2XPvGJB5kyc8Al4TA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1690839861; bh=5k9/QR51oFBl84ylWz2vyzG5+0OQ/zQSs86RPkdpFl4=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=gJdSS/W/j+AnYlrHWeQmwDkHAmpykH866ZjH8dfdSq5qlinRdNh0h6wtLIeY1d6hQ
 OX518CYOpglIV9UL8V5ql0sFlVxj9d0Mq98WxlP2wpAXz2h08bIcS8BMvKeuwyXo2y
 5Sq3Lk4ILCBnYgJfnUjjj9fqtTPR8OoKDU+ica63k60ecm4QkQS+UVw+Gacn9KJp6f
 noa+rmN+Xv3T3F0l68Vucx8O/49Fqmr8S2wz+t9+mjgpjk1FY2+rR7sUydEcVnisRQ
 BBSxbhHWMmSG5hqioThpKjH4tLLAJqAdu9T/ALrUXZD7mlVIWFnD4ktBPqB6As1dy8
 ZbjyN/QczY0Sw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=gJdSS/W/
Subject: Re: [Buildroot] [PATCH v2] package/esp-hosted-ng: add package
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
Cc: Jesse Taube <jesse.taube@benettiengineering.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKPiBJbCBnaW9ybm8gMzEgbHVnIDIwMjMsIGFsbGUgb3JlIDIzOjI2LCBUaG9t
YXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBoYSBzY3JpdHRvOgo+
IAo+IO+7v09uIFR1ZSwgMTEgSnVsIDIwMjMgMjM6NTU6MDIgKzAyMDAKPiBHaXVsaW8gQmVuZXR0
aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4gCj4+IFRo
aXMgcGF0Y2ggYWRkcyBlc3AtaG9zdGVkLW5nIHBhY2thZ2UgdGhhdCBhbGxvd3MgdG8gYnVpbGQg
TGludXggS2VybmVsCj4+IERyaXZlciBmb3IgRXNwcmVzc2lmIEVzcDMyLSogU29DcywgdGhhdCBv
bmNlIHByb2dyYW1tZWQgd2l0aCB0aGUKPj4gY29ycmVzcG9uZGluZyBmaXJtd2FyZSBiZWhhdmUg
bGlrZSBhIG5vcm1hbCBXaS1GaSBtb2R1bGUuIEJvdGggU0RJTyBhbmQKPj4gU1BJIGJ1c3NlcyBh
cmUgc3VwcG9ydGVkIGFuZCBzZWxlY3RhYmxlLgo+PiAKPj4gQ2M6IEplc3NlIFRhdWJlIDxqZXNz
ZS50YXViZUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4gLS0tCj4+
IFYxLT5WMjoKPj4gKiBidW1wIHRvIHZlcnNpb24gMjAyMy0wNy0xMSB0byBzdXBwb3J0IGxhdGVz
dCBMaW51eCB2ZXJzaW9ucyBhbmQgRVNQMzItQzYKPj4gLS0tCj4+IERFVkVMT1BFUlMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4+IHBhY2thZ2UvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMSArCj4+IHBhY2thZ2UvZXNwLWhvc3RlZC1uZy9Db25maWcu
aW4gICAgICAgICAgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysKPj4gcGFja2FnZS9lc3At
aG9zdGVkLW5nL2VzcC1ob3N0ZWQtbmcuaGFzaCB8ICAzICsrKwo+PiBwYWNrYWdlL2VzcC1ob3N0
ZWQtbmcvZXNwLWhvc3RlZC1uZy5tayAgIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrCj4+
IDUgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9lc3AtaG9zdGVkLW5nL0NvbmZpZy5pbgo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9lc3AtaG9zdGVkLW5nL2VzcC1ob3N0ZWQtbmcuaGFzaAo+PiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9lc3AtaG9zdGVkLW5nL2VzcC1ob3N0ZWQtbmcubWsKPiAKPiBJIGRvbid0IHVu
ZGVyc3RhbmQgd2h5IGl0IHdhcyBuYW1lZCBlc3AtaG9zdGVkLW5nLCB0aGUgdXBzdHJlYW0gR2l0
aHViCj4gcmVwbyBpcyBqdXN0IGVzcC1ob3N0ZWQuIFllcywgcmVjZW50IHZlcnNpb25zIGFyZSAi
bmciLCBidXQgd2Ugbm9ybWFsbHkKPiBkb24ndCBuYW1lIG91ciBwYWNrYWdlcyBhY2NvcmRpbmcg
dG8gdGhlIHZlcnNpb25zLCBleGNlcHQgaW4gc29tZSB2ZXJ5Cj4gc3BlY2lmaWMgY2FzZXMgKGxp
Ymd0azMsIHF0NSwgcXQ2LCBldGMuKS4gU28gSSByZW5hbWVkIGV2ZXJ5dGhpbmcgdG8KPiBlc3At
aG9zdGVkIChob3BpbmcgSSBkaWRuJ3QgbWVzcyB1cCBhbnl0aGluZyBpbiB0aGUgcHJvY2Vzcykg
YW5kCj4gYXBwbGllZC4gSXQgYnVpbHQgZmluZSBhZ2FpbnN0IGEgdmV4cHJlc3NfZGVmY29uZmln
IEFSTTMyIExpbnV4IDYuMQo+IGtlcm5lbC4KClRoZSByZWFzb24gaXMgdGhhdCB0aGV5IGtlZXAg
dHdvIGNvbXBsZXRlbHkgZGlmZmVyZW50IGZpcm13YXJlIGFuZCBMaW51eCBkcml2ZXJzIGRlcGVu
ZGluZyBvbiB0aGUgc2RpbyBpbXBsZW1lbnRhdGlvbiBhbmQgc29tZSBtb250aHMgYWdvIHRoZXkg
a2VwdCBORyg4MDIuMTEgZGlyZWN0IElGKSBhbmQgRkcoODAyLjMrcHJvdG9idWYgYXBpcyB0byBz
ZXR1cCA4MDIuMTEgc3R1ZmYpIGFzIGJyYW5jaGVzLCBidXQgeWVzIHRoZXkgY2hhbmdlZCBpdC4K
QW55d2F5IHBvc3NpYmx5IG9uZSBjb3VsZCB1c2UoZXZlbiBpZiBpdCBtYWtlcyBmZXcgc2Vuc2Up
IHRoZSBGRy4gQnV0IHRoZW4gd2Ugb25seSBuZWVkIHRvIGRvd25sb2FkIGV4YWN0bHkgZXNwLWhv
c3RlZCBhbmQgdGhhdOKAmXMgaXQuCgpJIHRoaW5rIEnigJl2ZSBiZWVuIGJpYXNlZCBmcm9tIHRo
ZSBwYXN0IGdpdCBoYW5kbGluZyB3aXRoIDIgYnJhbmNoZXMuIEluIGNhc2Ugc29tZW9uZSBpcyBp
bnRlcmVzdGVkIHdlIGNhbiBhZGQgMiBDb25maWcuaW4gY2hvaWNlcyBiZXR3ZWVuIEZHIGFuZCBO
Ry4KVmVyeSB1bmxpa2VseSBidXTigKYgd2hvIGtub3dzLgoKRkcgaXMgbW9yZSBNQ1Ugb3JpZW50
ZWQoZXZlbiBpZiBpdCBzdXBwb3J0cyBMaW51eCBhcyA4MDIuMytwcm90b2J1Zikgd2hpbGUgTkcg
aXMgdmVyeSBtb3JlIExpbnV4IG9yaWVudGVkIHNpbmNlIGl0IGhhcyA4MDIuMTEgSUYuCgpUaGFu
ayB5b3UgZm9yIHRha2luZyBjYXJlIG9mIHRoaXMgcGF0Y2guClRoZXJlIHNob3VsZCBiZSBhIG5l
dyByZWxlYXNlIGluIHNvbWUgdGltZSB0byBhZGQgb3RoZXIgU29DcyB0byBORyBzbyBJIHdpbGwg
YnVtcCBpdCBhbmQgSeKAmW0gZGVzaWduaW5nIGEgTGludXggZW1iZWRkZWQgYm9hcmQgd2l0aCBh
biBFU1AzMiBvbiBpdCBmb3IgdGhpcyB1c2UuCgpCZXN0IHJlZ2FyZHMKR2l1bGlvCgo+IAo+IFRo
YW5rcyEKPiAKPiBUaG9tYXMKPiAtLSAKPiBUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4K
PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGlu
LmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
