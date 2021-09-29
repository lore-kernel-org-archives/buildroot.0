Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1149C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 08:23:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 591736140D
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 08:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 591736140D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E48C282EF1;
	Wed, 29 Sep 2021 08:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nd2tbgGSly-c; Wed, 29 Sep 2021 08:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3940682EB5;
	Wed, 29 Sep 2021 08:23:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E24C1BF23F
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 08:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A36060643
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 08:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xbl0HnhQ2ImY for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 08:23:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B5ED60632
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 08:23:52 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id CE508E001C;
 Wed, 29 Sep 2021 08:23:48 +0000 (UTC)
Date: Wed, 29 Sep 2021 10:23:48 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210929102348.327691fc@kmaincent-XPS-13-7390>
In-Reply-To: <20210927210514.GF1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-5-kory.maincent@bootlin.com>
 <20210927210514.GF1504958@scaer>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 4/7] fs/iso9660: add support for hybrid
 image using Grub bootloader on BIOS and EFI
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCk9uIE1vbiwgMjcgU2VwIDIwMjEgMjM6MDU6MTQgKzAyMDAKIllhbm4gRS4gTU9SSU4i
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cgo+IEvDtnJ5LCBBbGwsCj4gCj4gT24g
MjAyMS0wOS0yMyAxNzo1NyArMDIwMCwgS29yeSBNYWluY2VudCBzcGFrZSB0aHVzbHk6Cj4gPiBB
ZGQgc3VwcG9ydCBmb3IgYnVpbGRpbmcgYW4gaHlicmlkIElTTzk2NjAgaW1hZ2UgY29tcGF0aWJs
ZSB3aXRoIGxlZ2FjeQo+ID4gYW5kIFVFRkkgQklPUy4KPiA+IFRoZSBvcHRpb24gLWVsdG9yaXRv
LWFsdC1ib290IG5lZWQgdG8gYmUgdXNlZCBpbiB0aGUgeG9ycmlzbyBjb21tYW5kCj4gPiB0byBn
ZW5lcmF0ZSB0aGUgaHlicmlkIGltYWdlLiAgCj4gCj4gU28gSSB3YXMgd29uZGVyaW5nIHdoeSB5
b3UgaGFkIHRvIHJlbmFtZSB0aGUgdmFyaWFibGVzLCBhbmQgd2h5IHlvdQo+IHNwbGl0IHRoZSB2
YWx1ZXMgd2l0aCAtZWx0b3JpdG8tYWx0LWJvb3QgcmlnaHQgaW4gYmV0d2Vlbi4uLgo+IAo+IEFz
IEkgdW5kZXJzdGFuZCBpdCBmcm9tIHRoZSB4b3JyaXNvIGNvbW1hbmQgbGluZSwgLWVsdG9yaXRv
LWFsdC1ib290Cj4gYmFzaWNhbGx5IG1lYW5zICJPSywgd2UncmUgZG9uZSB3aXRoIHRoZSBwcmV2
aW91cyBib290IHBhcmFtZXRlcnMsIG5vdwo+IHdlIHN0YXJ0IGEgbmV3IHNldCBvZiBib290IHBh
cmFtZXRlcnMiLCBzbyB0aGUgb3JkZXIgb2Ygb3B0aW9ucyAqaXMqCj4gaW1wb3J0YW50Lgo+IAo+
IFJpZ2h0PwoKUmlnaHQKCj4gCj4gRnVydGhlcm1vcmUsIC1lbHRvcml0by1hbHQtYm9vdCBhbmQg
LW5vLWVtdWwtYm9vdCBhcmUgbm90IGNvbmZsaWN0aW5nLAo+IGJlY2F1c2UgdGhlIGZvcm1lciBp
cyByZWFsbHkgdGhpcyBzZXBhcmF0b3IgYXMgZGlzY3Vzc2VkIGFib3ZlLCB3aGlsZQo+IHRoZSBs
YXR0ZXIgc3BlY2lmaWVzIHRoZSB0eXBlIG9mIHRoZSBjdXJyZW50IGJvb3QgaW1hZ2UuCj4gCj4g
UmlnaHQ/CgpSaWdodAoKPiAKPiAoRm9yIG15IGluZm9ybWF0aW9uOiBob3cgbWFueSBzdWNoIGFs
dGVybmF0ZSBib290IHBhcmFtZXRlcnMgY2FuIHdlCj4gZGVmaW5lOiBpcyBpdCBsaW1pdGVkIHRv
IGp1c3QgdHdvLCBvciBjYW4gd2UgYWRkIG1vcmU/KQoKQWNjb3JkaW5nIHRvIHhvcnJpc28gbWFu
dWFsIHdlIGNhbiBhZGQgdXAgdG8gMzIgYm9vdCBjYXRhbG9nIGVudHJpZXMuCgo+IAo+ID4gU2ln
bmVkLW9mZi1ieTogS29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KPiA+
IC0tLSAgCj4gWy0tU05JUC0tXQo+ID4gZGlmZiAtLWdpdCBhL2ZzL2lzbzk2NjAvaXNvOTY2MC5t
ayBiL2ZzL2lzbzk2NjAvaXNvOTY2MC5tawo+ID4gaW5kZXggOTIxZWZhMWIwMi4uOWMyNTM1ZDEw
MiAxMDA2NDQKPiA+IC0tLSBhL2ZzL2lzbzk2NjAvaXNvOTY2MC5tawo+ID4gKysrIGIvZnMvaXNv
OTY2MC9pc285NjYwLm1rICAKPiBbLS1TTklQLS1dCj4gPiBAQCAtMTUxLDI0ICsxNTYsMzIgQEAg
ZW5kaWYgIyBST09URlNfSVNPOTY2MF9VU0VfSU5JVFJECj4gPiAgCj4gPiAgUk9PVEZTX0lTTzk2
NjBfT1BUUyArPSBcCj4gPiAgCS1KIFwKPiA+IC0JLVIgXAo+ID4gLQktbm8tZW11bC1ib290Cj4g
PiArCS1SCj4gPiAgCj4gPiAtaWZlcSAoJChCUjJfVEFSR0VUX1JPT1RGU19JU085NjYwX0JJT1Nf
Qk9PVExPQURFUikseSkKPiA+IC1ST09URlNfSVNPOTY2MF9PUFRTICs9IFwKPiA+ICtST09URlNf
SVNPOTY2MF9CT09UTE9BREVSX09QVFNfQklPUyA9IFwgIAo+IAo+ICAgICBST09URlNfSVNPOTY2
MF9PUFRTX0JJT1MKPiAKPiA+ICsJLWIgJChST09URlNfSVNPOTY2MF9CT09UX0lNQUdFKSBcCj4g
PiArCS1uby1lbXVsLWJvb3QgXAo+ID4gIAktYm9vdC1sb2FkLXNpemUgNCBcCj4gPiAtCS1ib290
LWluZm8tdGFibGUgXAo+ID4gLQktYiAkKFJPT1RGU19JU085NjYwX0JPT1RfSU1BR0UpCj4gPiAt
ZW5kaWYKPiA+ICsJLWJvb3QtaW5mby10YWJsZSAgCj4gCj4gWW91IGFyZSBhbHNvIHJlb3JkZXJp
bmcgdGhlIHJlbWFpbmluZyBvcHRpb25zLiBJcyB0aGF0IHJlYWxseSBuZWNlc3Nhcnk/Cj4gT3Ig
aXMgaXQgZm9yIHN5bW1ldHJ5IHdpdGggdGhlIEVGSSBjYXNlIHdoZXJlIHRoZSAiaW1hZ2UiIG9w
dGlvbiBjb21lcwo+IGZpcnN0PwoKSXQgd2FzIGZvciBzeW1tZXRyeS4KCj4gCj4gPiAtaWZlcSAo
JChCUjJfVEFSR0VUX1JPT1RGU19JU085NjYwX0VGSV9CT09UTE9BREVSKSx5KQo+ID4gLVJPT1RG
U19JU085NjYwX09QVFMgKz0gXAo+ID4gLQktLWVmaS1ib290ICQoUk9PVEZTX0lTTzk2NjBfRUZJ
X1BBUlRJVElPTikKPiA+ICtST09URlNfSVNPOTY2MF9CT09UTE9BREVSX09QVFNfRUZJID0gXCAg
Cj4gCj4gICAgIFJPT1RGU19JU085NjYwX09QVFNfRUZJCj4gCj4gPiArCS0tZWZpLWJvb3QgJChS
T09URlNfSVNPOTY2MF9FRklfUEFSVElUSU9OKSBcCj4gPiArCS1uby1lbXVsLWJvb3QKPiA+ICsK
PiA+ICtpZmVxCj4gPiAoJChCUjJfVEFSR0VUX1JPT1RGU19JU085NjYwX0JJT1NfQk9PVExPQURF
UikkKEJSMl9UQVJHRVRfUk9PVEZTX0lTTzk2NjBfRUZJX0JPT1RMT0FERVIpLHl5KQo+ID4gK1JP
T1RGU19JU085NjYwX0JPT1RMT0FERVJfT1BUUyA9ICQoUk9PVEZTX0lTTzk2NjBfQk9PVExPQURF
Ul9PUFRTX0JJT1MpCj4gPiArUk9PVEZTX0lTTzk2NjBfQk9PVExPQURFUl9PUFRTICs9IC1lbHRv
cml0by1hbHQtYm9vdAo+ID4gK1JPT1RGU19JU085NjYwX0JPT1RMT0FERVJfT1BUUyArPSAkKFJP
T1RGU19JU085NjYwX0JPT1RMT0FERVJfT1BUU19FRkkpICAKPiAKPiBIbW1tIFRoaXMgaXMgcHJl
dHR5IHVnbHkuLi4gV2hhdCBhYm91dDoKPiAKPiAgICAgUk9PVEZTX0lTTzk2NjBfT1BUUyArPSBc
Cj4gICAgICAgICAkKFJPT1RGU19JU085NjYwX09QVFNfQklPUykgXAo+ICAgICAgICAgLWVsdG9y
aXRvLWFsdC1ib290IFwKPiAgICAgICAgICQoUk9PVEZTX0lTTzk2NjBfT1BUU19FRkkpCj4gCj4g
QWxzbywgZG9lcyBCSU9TIHJlYWxseSBoYXMgdG8gY29tZSBiZWZvcmUgRUZJPyBJZiBzbywgd2h5
PwoKSXQgc2VlbXMgQklPUyBuZWVkIHRvIGJlIHRoZSBmaXJzdCBib290IG9wdGlvbi4gSSBoYXZl
IG5vdCBmb3VuZCBhbnkKaW5mb3JtYXRpb24gYWJvdXQgaXQgYnV0IGlmIEkgaW52ZXJ0IEJJT1Mg
YW5kIEVGSSBvcHRpb25zIGl0IGRvZXNuJ3QgYm9vdC4gCgpSZWdhcmRzLApLw7ZyeQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
