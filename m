Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB87C433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 22:34:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28FD463255
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 22:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28FD463255
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B58607B5;
	Mon, 15 Nov 2021 22:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fDnXSoEOy3wE; Mon, 15 Nov 2021 22:34:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E6176078A;
	Mon, 15 Nov 2021 22:34:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA4A1BF406
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 22:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38D7B40231
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 22:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJfA1JfEl0wk for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 22:34:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F18B54022E
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 22:34:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D1DEC40003;
 Mon, 15 Nov 2021 22:34:36 +0000 (UTC)
Date: Mon, 15 Nov 2021 23:34:36 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Ivan Maidanski <ivmai@mail.ru>
Message-ID: <20211115233436.029a67dd@windsurf>
In-Reply-To: <1637012444.996998717@f769.i.mail.ru>
References: <1637012444.996998717@f769.i.mail.ru>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] package/bdwgc: bump to 8.0.6
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSXZhbiwKCk9uIFR1ZSwgMTYgTm92IDIwMjEgMDA6NDA6NDQgKzAzMDAKSXZhbiBNYWlk
YW5za2kgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBI
ZXJl4oCZcyBhIHBhdGNoIHVwZGF0aW5nIGJkd2djIGZyb20gOC4wLjQgdG8gOC4wLjYuCgpJIGhh
dmUgYXBwbGllZCB5b3VyIHBhdGNoIHRvIHRoZSBuZXh0IGJyYW5jaCwgd2l0aCBzb21lIGNoYW5n
ZXMgKHNlZQpiZWxvdykuIEhvd2V2ZXIsIGZvciBmdXR1cmUgcGF0Y2hlcywgY291bGQgeW91IHVz
ZSAiZ2l0IHNlbmQtZW1haWwiIHRvCnNlbmQgdGhlbSBzbyB0aGF0IHRoZSBwYXRjaCBhcHBlYXJz
IGlubGluZSwgd2hpY2ggbWFrZXMgaXQgZWFzaWVyIHRvCnJldmlldz8KCkhlcmUgaXMgeW91ciBw
YXRjaDoKCj4gLXNoYTI1NiA0MzZhMGRkYzY3YjFhYzBiMDQwNWI2MWE5Njc1YmNhOWUwNzVjODE1
NmY0ZGViZDFkMDZmM2E1NmM3Y2QyODlkICBnYy04LjAuNC50YXIuZ3oKPiAtc2hhMjU2IGFlZWFh
YmJmNDRlNjdkNDEzZTE4NzE5ZjBjNmFjOWMyMzM4N2FiMGIzM2U3YTE1ZWU0NmNmNTlkZGVmMTJj
YzcgIFJFQURNRS5RVUlDSwo+ICtzaGEyNTYgM2I0OTE0YWJjOWZhNzY1OTM1OTY3NzNlNGRhNjcx
ZDdlZDRkNTM5MGUzZDQ2ZmJmMmU1ZjE1NWUxMjFiZWExMSAgZ2MtOC4wLjYudGFyLmd6Cj4gK3No
YTI1NiAwYWFiN2E1NmE5MmVkODc4YzRhNTQ2NGNmMjgyZDY1ZjM4YmNkZWU2NGZlOWNmMjEzZTI2
MjU0YmRkYjNmMzQwICBSRUFETUUuUVVJQ0sKCldoZW4gdGhlIGxpY2Vuc2UgZmlsZSBoYXNoIGNo
YW5nZXMsIHdlIHdhbnQgYW4gaW5kaWNhdGlvbiBpbiB0aGUgY29tbWl0CmxvZyBleHBsYWluaW5n
IHdoeSBpdCBoYXMgY2hhbmdlZC4gSW5kZWVkLCB0aGUgcmVhc29uIHdoeSB3ZSBoYXZlIHN1Y2gK
aGFzaGVzIGlzIHRvIGRldGVjdCBjaGFuZ2VzIGluIHRoZSBsaWNlbnNlIHRlcm1zIG9mIHVwc3Ry
ZWFtIHByb2plY3RzLgpJZiB3ZSAic2lsZW50bHkiIGNoYW5nZSBzdWNoIGhhc2hlcyB3aXRob3V0
IGEgcHJvcGVyIGp1c3RpZmljYXRpb24sIGl0CmtpbmQgb2YgZGVmZWF0cyB0aGUgZW50aXJlIHB1
cnBvc2Ugb2YgdGhvc2UgaGFzaGVzLiBBZnRlciBjaGVja2luZyB0aGUKZGlmZmVyZW5jZXMgaW4g
UkVBRE1FLlFVSUNLIGJldHdlZW4gOC4wLjQgYW5kIDguMC42LCBJJ3ZlIGFkZGVkIGFuCmV4cGxh
bmF0aW9uIGluIHRoZSBjb21taXQgbG9nLgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9iZHdnYy9i
ZHdnYy5tayBiL3BhY2thZ2UvYmR3Z2MvYmR3Z2MubWsKPiBpbmRleCA1N2RkODJjYWI0Li41NGJj
NGZkODg5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvYmR3Z2MvYmR3Z2MubWsKPiArKysgYi9wYWNr
YWdlL2Jkd2djL2Jkd2djLm1rCj4gQEAgLTQsOSArNCw5IEBACj4gICMKPiAgIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiAgCj4gLUJEV0dDX1ZFUlNJT04gPSA4LjAuNAo+ICtCRFdHQ19WRVJTSU9O
ID0gOC4wLjYKPiAgQkRXR0NfU09VUkNFID0gZ2MtJChCRFdHQ19WRVJTSU9OKS50YXIuZ3oKPiAt
QkRXR0NfU0lURSA9IGh0dHA6Ly93d3cuaGJvZWhtLmluZm8vZ2MvZ2Nfc291cmNlCj4gK0JEV0dD
X1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vaXZtYWkvYmR3Z2MvcmVsZWFzZXMvZG93bmxvYWQv
diQoQkRXR0NfVkVSU0lPTikKPiAgQkRXR0NfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gIEJEV0dD
X0xJQ0VOU0UgPSBiZHdnYyBsaWNlbnNlCj4gIEJEV0dDX0xJQ0VOU0VfRklMRVMgPSBSRUFETUUu
UVVJQ0sKPiBAQCAtMjgsOCArMjgsNiBAQCBIT1NUX0JEV0dDX0NPTkZfT1BUUyA9IC0td2l0aC1s
aWJhdG9taWMtb3BzPXllcwo+ICAKPiAgaWZlcSAoJChCUjJfSU5TVEFMTF9MSUJTVERDUFApLHkp
Cj4gIEJEV0dDX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1jcGx1c3BsdXMKPiAtZWxzZQo+IC1CRFdH
Q19DT05GX09QVFMgKz0gLS1kaXNhYmxlLWNwbHVzcGx1cwoKTm8sIHdlIHdhbnQgdG8ga2VlcCB0
aGlzLCBldmVuIGlmIHRoaXMgaXMgdGhlIGRlZmF1bHQuIFdlIHdhbnQgdG8gYmUKZXhwbGljaXQg
YWJvdXQgc3VjaCBvcHRpb25zLCB3aGljaCBpcyB3aGF0IHdlIGRvIGluIHRoZSB2YXN0IG1ham9y
aXR5Cm9mIHBhY2thZ2VzLiBTbyBJJ3ZlIHJldmVydGVkIHRoYXQgcGFydGljdWxhciBjaGFuZ2Ug
ZnJvbSB5b3VyIHBhdGNoCndoZW4gYXBwbHlpbmcuCgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0g
ClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
