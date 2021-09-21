Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77ACFC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 18:41:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AD7160F26
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 18:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AD7160F26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 422EF605C7;
	Tue, 21 Sep 2021 18:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmub_Auub5-v; Tue, 21 Sep 2021 18:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B1C360658;
	Tue, 21 Sep 2021 18:41:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8022D1BF3A6
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 18:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C5C540497
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 18:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e9_FCwU-xn19 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 18:41:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA97240653
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 18:41:49 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3198460002;
 Tue, 21 Sep 2021 18:41:46 +0000 (UTC)
Date: Tue, 21 Sep 2021 20:41:44 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210921204144.3bce77e3@kmaincent-XPS-13-7390>
In-Reply-To: <20210921153609.GV1053080@scaer>
References: <20210921132829.56405-1-kory.maincent@bootlin.com>
 <20210921132829.56405-3-kory.maincent@bootlin.com>
 <20210921153609.GV1053080@scaer>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/6] fs/iso9660: add support to Grub EFI
 bootloader in the image
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

WWFubiwKCk9uIFR1ZSwgMjEgU2VwIDIwMjEgMTc6MzY6MDkgKzAyMDAKIllhbm4gRS4gTU9SSU4i
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cgo+ID4gLS0tIGEvZnMvaXNvOTY2MC9D
b25maWcuaW4KPiA+ICsrKyBiL2ZzL2lzbzk2NjAvQ29uZmlnLmluCj4gPiBAQCAtMyw2ICszLDcg
QEAgY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0lTTzk2NjAKPiA+ICAJZGVwZW5kcyBvbiAoQlIy
X2kzODYgfHwgQlIyX3g4Nl82NCkKPiA+ICAJZGVwZW5kcyBvbiBCUjJfTElOVVhfS0VSTkVMCj4g
PiAgCWRlcGVuZHMgb24gQlIyX1RBUkdFVF9HUlVCMl9JMzg2X1BDIHx8IFwKPiA+ICsJCUJSMl9U
QVJHRVRfR1JVQjJfSTM4Nl9FRkkgfHwgQlIyX1RBUkdFVF9HUlVCMl9YODZfNjRfRUZJCj4gPiB8
fCBcICAKPiAKPiBpc285NjYwIGFscmVhZHkgZGVwZW5kcyBvbiAoQlIyX2kzODYgfHwgQlIyX3g4
Nl82NCksIGFuZCB0aGFua3MgdG8gdGhlCj4gc2VsZWN0IG9mIGEgZGVmYXVsdCBwbGF0Zm9ybSBm
b3IgaTM4NiBhbmQgeDg2XzY0LCB3ZSBrbm93IHRoYXQgYXQgbGVhc3QKPiBvbmUgb2YgdGhlIHRo
cmVlIGkzODYtcGMsIGkzODYtZWZpLCBvciB4ODZfNjQtZWZpIGlzIHNldCwgc28gd2UgY2FuCj4g
c2ltcGxpZnkgdGhlIGNvbmRpdGlvbiB0byBqdXN0Ogo+IAo+ICAgICBkZXBlbmRzIG9uIEJSMl9U
QVJHRVRfR1JVQjIgfHwgQlIyX1RBUkdFVF9TWVNMSU5VWF9JU09MSU5VWAo+IAo+IE5vPwoKWWVz
LCBuaWNlIGNhdGNoIQoKPiA+ICBjb25maWcgQlIyX1RBUkdFVF9ST09URlNfSVNPOTY2MF9CT09U
X01FTlUKPiA+ICAJc3RyaW5nICJCb290IG1lbnUgY29uZmlnIGZpbGUiCj4gPiAtCWRlZmF1bHQg
ImZzL2lzbzk2NjAvZ3J1Yi5jZmciIGlmIEJSMl9UQVJHRVRfUk9PVEZTX0lTTzk2NjBfR1JVQjIK
PiA+ICsJZGVmYXVsdCAiZnMvaXNvOTY2MC9ncnViLmNmZyIgaWYKPiA+IEJSMl9UQVJHRVRfUk9P
VEZTX0lTTzk2NjBfR1JVQjJfUEMgfHwgXAo+ID4gKwo+ID4gQlIyX1RBUkdFVF9ST09URlNfSVNP
OTY2MF9HUlVCMl9FRkkgIAo+IAo+IEkgZm9yZ290IHRvIHN0YXRlIHNvIGluIHRoZSBwcmV2aW91
cyByZXZpZXcsIGJ1dCBJIHRoaW5rIGl0IGlzIG1vcmUKPiBhcHByb3ByaWF0ZSB0byBkdXBsaWNh
dGUgdGhlIGRlZmF1bHQgZm9yIGVhY2ggY2FzZTsgdGhhdCdzIG5pY2VyIHRvCj4gcmVhZDoKPiAK
PiAgICAgZGVmYXVsdCAiZnMvaXNvOTY2MC9ncnViLmNmZyIgaWYgQlIyX1RBUkdFVF9ST09URlNf
SVNPOTY2MF9HUlVCMl9QQwo+ICAgICBkZWZhdWx0ICJmcy9pc285NjYwL2dydWIuY2ZnIiBpZiBC
UjJfVEFSR0VUX1JPT1RGU19JU085NjYwX0dSVUIyX0VGSQo+IAo+IEhvd2V2ZXIsIEJSMl9UQVJH
RVRfUk9PVEZTX0lTTzk2NjBfR1JVQjJfUEMgYW5kCj4gQlIyX1RBUkdFVF9ST09URlNfSVNPOTY2
MF9HUlVCMl9FRkkgYXJlIGRlZmluZWQgbm93aGVyZS4uLgo+IAo+IERpZCB5b3UgbWVhbiBCUjJf
VEFSR0VUX1JPT1RGU19JU085NjYwX0JJT1NfQk9PVExPQURFUiBvcgo+IEJSMl9UQVJHRVRfUk9P
VEZTX0lTTzk2NjBfRUZJX0JPT1RMT0FERVIgYnkgY2hhbmNlPwoKbWVoLCBob3cgZG9lcyB0aGVz
ZSBjb25maWcgYXJlIHN0aWxsIHRoZXJlICEhCgo+ID4gLWlmZXEgKCQoQlIyX1RBUkdFVF9ST09U
RlNfSVNPOTY2MF9HUlVCMikseSkKPiA+ICtpZmVxICgkKEJSMl9SRVBST0RVQ0lCTEUpLHkpCj4g
PiArUk9PVEZTX0lTTzk2NjBfTUtGU19PUFRTID0gLS1pbnZhcmlhbnQgIAo+IAo+ICdNS0ZTJyBp
cyBhbWJpZ3VvdXM6IGl0IHNlZW1zIHRvIGltcGx5IGl0IGFwcGxpZXMgdG8gdGhlIGlzbzk2NjAg
bWtmcywKPiB3aGlsZSBpbiBmYWN0IGl0IGFwcGxpZXMgdG8gdGhlIHZmYXQgbWtmcy4gU28sIG1h
eWJlICh5ZXMsIGJpa2VzaGVkaW5nLAo+IGFuZCBuYW1pbmcgaXMgaGFyZCk6IFJPT1RGU19JU085
NjYwX1ZGQVRfT1BUUyA/CgpMZXQncyBnbyBmb3IgaXQuCgo+ID4gK2RlZmluZSBST09URlNfSVNP
OTY2MF9JTlNUQUxMX0JPT1RMT0FERVIKPiA+ICsJcm0gLXJmICQoUk9PVEZTX0lTTzk2NjBfRUZJ
X1BBUlRJVElPTl9QQVRIKQo+ID4gKwlta2RpciAtcCAkKGRpciAkKFJPT1RGU19JU085NjYwX0VG
SV9QQVJUSVRJT05fUEFUSCkpCj4gPiArCWRkIGlmPS9kZXYvemVybyBvZj0kKFJPT1RGU19JU085
NjYwX0VGSV9QQVJUSVRJT05fUEFUSCkgYnM9MU0KPiA+IGNvdW50PTEKPiA+ICsJJChIT1NUX0RJ
Uikvc2Jpbi9ta2ZzLnZmYXQgJChST09URlNfSVNPOTY2MF9NS0ZTX09QVFMpCj4gPiAkKFJPT1RG
U19JU085NjYwX0VGSV9QQVJUSVRJT05fUEFUSCkKPiA+ICsJJChIT1NUX0RJUikvYmluL21jb3B5
IC1wIC1tIC1pCj4gPiAkKFJPT1RGU19JU085NjYwX0VGSV9QQVJUSVRJT05fUEFUSCkgLXMgXAo+
ID4gKwkJJChST09URlNfSVNPOTY2MF9FRklfUEFSVElUSU9OX0NPTlRFTlQpLyogOjovICAKPiAK
PiBBaCwgYnV0IHRoZSB3aG9sZSBwb2ludCBvZiByZXByb2R1Y2libGUsIGFuZCB0aHVzIC0taW52
YXJpYW50IGFuZCAtcCAtbSwKPiBpcyB0aGF0IHRoZSBnZW5lcmF0ZWQgZmlsZXN5c3RlbSBpcyBy
ZXByb2R1Y2libGUuIEhlcmUsIHRoZSBWRkFUIGZzCj4gaXRzZWxmIGlzIHJlcHJvZHVjaWJsZSB0
aGFua3MgdG8gLS1pbnZhcmlhbnQsIGJ1dCB5b3UgY29weSBhIGZpbGUgd2l0aAo+IHRoZSBkYXRl
L3RpbWUgdGhlIGJ1aWxkIG9jY3Vycywgd2hpY2ggYnkgZGVmaW5pdGlvbiBpcyBub3QgcmVwcm9k
dWNpYmxlLgo+IFlvdSBzaG91bGQgdG91Y2ggdGhlIGZpbGUgdG8gJChTT1VSQ0VfREFURV9FUE9D
SCkgYmVmb3JlIGNvcHlpbmcgaW50bwo+IHRoZSB2ZmF0LgoKQWNrCgo+ID4gK2lmZXEgKCQoQlIy
X1RBUkdFVF9ST09URlNfSVNPOTY2MF9CSU9TX0JPT1RMT0FERVIpLHkpCj4gPiArUk9PVEZTX0lT
Tzk2NjBfT1BUUyArPSBcCj4gPiArCS1KIFwKPiA+ICsJLVIgXAo+ID4gKwktYm9vdC1sb2FkLXNp
emUgNCBcCj4gPiArCS1ib290LWluZm8tdGFibGUgXAo+ID4gKwktbm8tZW11bC1ib290IFwgIAo+
IAo+IC0tbm8tZW11bC1ib290IGlzIGluIGJvdGggY2FzZXMsIHNvIG1heWJlIGl0IGNhbiBiZSBs
ZWZ0IGluIHRoZSBjb25zdGFudAo+IG9wdGlvbnMsIGluIF9DTURTIGJlbG93LCBubz8KClRydWUg
aXQgY291bGQuIC1uby1lbXVsLWJvb3QgbmVlZCB0byBiZSBzZXQgaW4gYm90aCBib290IGNhc2Vz
LCBpZiBmYWN0IEkgaGF2ZQphZGRlZCBpdCBsaWtlIHRoYXQgdG8gbm90IG5lZWQgdG8gc2VwYXJh
dGUgaXQgaW4gdGhlIG5leHQgcGF0Y2guIDspCkkgd2lsbCBhZGQgaXQgdG8gY29uc3RhbnQgb3B0
aW9ucy4KCj4gCj4gPiArCS1iICQoUk9PVEZTX0lTTzk2NjBfQk9PVF9JTUFHRSkKPiA+ICtlbHNl
IGlmZXEgKCQoQlIyX1RBUkdFVF9ST09URlNfSVNPOTY2MF9FRklfQk9PVExPQURFUikseSkgIAo+
IAo+IE5vdGUgdGhhdCBCUjJfVEFSR0VUX1JPT1RGU19JU085NjYwX0JJT1NfQk9PVExPQURFUiBh
bmQKPiBCUjJfVEFSR0VUX1JPT1RGU19JU085NjYwX0VGSV9CT09UTE9BREVSIGFyZSBtdXR1YWxs
eSBleGNsdXNpdmUsIGJ5Cj4gZGVmaW5pdGlvbiwgYnV0IHdlIGFsc28ga25vdyBhdCBsZWFzdCBv
bmUgd2lsbCBiZSBzZXQsIGFsc28gYnkKPiBkZWZpbml0aW9uLgo+IAo+IFNvLCB0aGUgZWxzZSBj
bGF1c2UgY2FuIGJlIGEgc2ltcGxlIG9uZSwgd2l0aG91dCB0aGUgaWZlcS4KCmRvaCEgeW91IHJh
aXNlIGEgcG9pbnQuIEluIGZhY3QgaW4gdGhlIGN1cnJlbnQgY29uZmlndXJhdGlvbiB0aGV5IGFy
ZSBub3QKbXV0dWFsbHkgZXhjbHVzaXZlLiBJIG5lZWQgdG8gZml4IHRoYXQgd2l0aCBhIEtjb25m
aWcgbWVudS4KCj4gCj4gL21ldGhpbmsuCj4gCj4gPiArUk9PVEZTX0lTTzk2NjBfT1BUUyArPSBc
Cj4gPiArCS0tZWZpLWJvb3QgJChST09URlNfSVNPOTY2MF9FRklfUEFSVElUSU9OKSBcCj4gPiAr
CS1uby1lbXVsLWJvb3QgIAo+IAo+IFNvIHdpdGggYW4gRUZJIGJvb3Rsb2FkZXIsIHdlIGRvIG5v
dCBuZWVkIHRvIGdlbmVyYXRlIGFuIElTTyB3aXRoIEpvbGlldAo+IGFuZCBSb2NrUmlkZ2UgZXh0
ZXJuc2lvbnM/IE9yIGlzIHRoYXQgaW1wbGllZCBieSB0aGUgbWVyZSBmYWN0IHRoYXQgaXQKPiBp
cyB1c2luZyBhbiBlZmktYm9vdD8KCk5vLCB5b3UgYXJlIHJpZ2h0IEkgc2hvdWxkIGFkZCB0aGVt
IHRvIGNvbnN0YW50IG9wdGlvbnMuCgpUaGFua3MsClJlZ2FyZHMsCgpLw7ZyeQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
