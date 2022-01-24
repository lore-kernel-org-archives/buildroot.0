Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DE4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 09:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC3F6404DD;
	Mon, 24 Jan 2022 09:21:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IW8MhUm2BvL; Mon, 24 Jan 2022 09:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3D4940568;
	Mon, 24 Jan 2022 09:21:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0A741BF3DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD65740954
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hk_OVHEkCmBt for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 09:21:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F785408E8
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 09:21:03 +0000 (UTC)
Received: from smtpclient.apple ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPA
 id BvX2nQOTRz0d2BvX3nT7Zw; Mon, 24 Jan 2022 10:21:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643016061; bh=AEaM+vUMu2dY3GjkGF4G8wWXJmo9rEH2fBmW2Q13McQ=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=Nt0xaMVQHPUn34JXrSv9w7QnErtDWOgMZ9OiZSaemPGQtfQRMtj6+VNkhzDwNvwn6
 gmZIThGrcBjWSgL3aoPh2e8TGfOJENvZ3UQW79GFHxHNFS5MrmgqkN8dyzrS9K3fXx
 PiCDvzAL8RpSPXAoL76vYQjaQRMKlXcH0LMmbdHyGeMrpA7ONe12Ezj8Zv2uZW6fCI
 L8i3NVONs6Flu8vM0ctJUIKXqE0300WUzw7gkoA3U0lMYsVGlalaWmZju6aygmAURf
 /hKAx6rH7iUoLaU9EwSMPbxxXODIV4VkPi5RSJcvTFmYZWU93OfsBaez6QP2vYzcKn
 Zjq1N4gIIluvg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 24 Jan 2022 10:20:59 +0100
Message-Id: <F25BFFC0-C4B1-4099-99A5-F42AF66C061E@benettiengineering.com>
References: <164301520937.4708.9842501306400984658@kwain>
In-Reply-To: <164301520937.4708.9842501306400984658@kwain>
To: Antoine Tenart <atenart@kernel.org>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfIl4PF7c0ue6OY66at29KlmErtRHeRsfMog05zF29BzEU0NY5fajpHbm4hYSqtJCxCeNDHbSf19VHVlnQUxWuxMePmXb2NeUlUZ6tLISR4uwyNI8IU2f
 Cwgo8LhlzS3wAniwgQ+icki7qc8Asxgyy7WNWylvjV0mDdvQMRplZyTqJCaFODlMJ7Nw3IZy+lYU8iyWj7qiAIDWI97+BNSPD/WxyOT3JFoBfRyiPc1LWei+
 MkQ1HRkDqVT9umLPd5Co8Wn2YlJxmAHTk+aysLaCXHV1krVN3WAnWS0JJVxeLgs73RRufP6nRTyeUaC93dUB9TSBG3a5ymgQltbUVuNCV5g=
Subject: Re: [Buildroot] [PATCH v3] package/refpolicy: Add option to disable
 "dontaudit" rules
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
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDI0IGdlbiAyMDIyLCBhbGxlIG9yZSAxMDowNywgQW50b2luZSBUZW5hcnQg
PGF0ZW5hcnRAa2VybmVsLm9yZz4gaGEgc2NyaXR0bzoKPiAKPiDvu79RdW90aW5nIEdpdWxpbyBC
ZW5ldHRpICgyMDIyLTAxLTI0IDA5OjU5OjQ1KQo+PiAKPj4+PiBJbCBnaW9ybm8gMjQgZ2VuIDIw
MjIsIGFsbGUgb3JlIDA5OjQ1LCBBbnRvaW5lIFRlbmFydCA8YXRlbmFydEBrZXJuZWwub3JnPiBo
YSBzY3JpdHRvOgo+Pj4gCj4+PiDvu79RdW90aW5nIEdpdWxpbyBCZW5ldHRpICgyMDIyLTAxLTIz
IDIzOjIxOjUwKQo+Pj4+IAo+Pj4+IFJlLXJlYWRpbmcgdGhpcyBhZnRlciBzb21lIGRheSBpdCBs
b29rcyB0byBtZSBsaWtlIHRoZSBzaW1wbGUKPj4+PiBCUjJfUEFDS0FHRV9SRUZQT0xJQ1lfRU5B
QkxFQVVESVQgaXMgY29ycmVjdC4gQmVjYXVzZSBpdCAiUmVtb3ZlcyBhbGwgCj4+Pj4gZG9udGF1
ZGl0IHJ1bGVzIGZyb20gcG9saWN5LmNvbmYiLCBzbyBpdCdzIHRydWUgdGhhdCBpdCBlbmFibGVz
IGF1ZGl0IAo+Pj4+IGxvZ3MgaW4gdGhlIGVuZC4gSXQncyBhIHZlcnkgc3BlY2lmaWMgb3B0aW9u
cyBhbmQgdGhlIG9uZSB3aG8gd2lsbCB1c2UgCj4+Pj4gaXQgd2lsbCBrbm93IHdoYXQgaGUgd2ls
bCBlbmFibGUgYW5kIG1vc3Qgb2YgYWxsIHdlIGNhbiBzcGVjaWZ5IGluIHRoZSAKPj4+PiBoZWxw
IHNlY3Rpb24gdGhhdDoKPj4+PiAiUmVtb3ZlcyBhbGwgZG9udGF1ZGl0IHJ1bGVzIGZyb20gcG9s
aWN5LmNvbmYiCj4+PiAKPj4+PiBEb2VzIGl0IHdvcmsgZm9yIHlvdT8KPj4+IAo+Pj4gQXMgbG9u
ZyBhcyB0aGUgaGVscCB0ZXh0IGlzIGNsZWFyIGVub3VnaCBmb3IgdGhlIHVzZXIsIGVpdGhlciBj
b25maWcKPj4+IG9wdGlvbiBuYW1lIHNob3VsZCBiZSBhY2NlcHRhYmxlLiBVc2luZyB0aGUgYWJv
dmUgaXMgZ29vZCB0byBoYXZlIGFuIDE6MQo+Pj4gbWFwcGluZyB3aXRoIHRoZSB0YXJnZXQgbmFt
ZSwgYXQgdGhlIGV4cGVuc2Ugb2YgaGF2aW5nIHRoZSBoZWxwIHRleHQgbm90Cj4+PiBtYXRjaGlu
ZyBpdCBhbmQgYW4gdW5jbGVhciBvcHRpb24gbmFtZSBmcm9tIHRoZSB1c2VyIHBlcnNwZWN0aXZl
IChpdCdzIGEKPj4+IGJpdCB3ZWlyZCBub3QgdG8gZW5hYmxlIGl0LCBhdCBmaXJzdCkuIEZvciBf
V0lUSF9ET05UQVVESVRfLCB0aGUKPj4+IG9wcG9zaXRlIGlzIHRydWUuIEknZCBzYXkgdGhlcmUg
aXMgbm8gcGVyZmVjdCBzb2x1dGlvbiwgd2UgY2FuIGVpdGhlcgo+Pj4gc3RheSBjbG9zZSB0byB0
aGUgcmVmcG9saWN5IGludGVybmFscyBvciBoYXZlIHRoZSBCdWlsZHJvb3Qgc3BlY2lmaWNzCj4+
PiBtb3JlIGNvbnNpc3RlbnQ7IG5vdCBzdXJlIHdoaWNoIGlzIGJldHRlci4KPj4gCj4+IEnigJlk
IGdvIGZvciBCdWlsZHJvb3QgY29uc2lzdGVuY3kgc2luY2Ugd2XigJlyZSBpbiBCdWlsZHJvb3Qu
Cj4gCj4gU28gX1dJVEhfRE9OVEFVRElUXz8KPiAKPj4gSWYgc29tZW9uZSBlbmFibGVzIHJlZnBv
bGljeSBwYWNrYWdlIGFuZCBlbmFibGVzIOKAnEVuYWJsZSBhdWRpdOKAnSwgSQo+PiBleHBlY3Qg
dG8gc2VlIGF1ZGl0IGxvZy4gUmlnaHQ/Cj4gCj4gRXh0cmEgYXVkaXQgbG9nKgoKQWFhaCwgaGVy
ZSBpcyB0aGUgcG9pbnQgXl5eLgoKPiAKPiBJdCdzIG5vdCBhYm91dCBlbmFibGluZyBhdWRpdCBs
b2dzLCBpdCdzIGFib3V0IGhhdmluZyBzb21lIGtub3duIHJ1bGVzCj4gdG8gbm90IGJlIHNpbGVu
Y2VkIGluIHRoZSBhdWRpdCBsb2dzIGFzIHRoZXkncmUga25vd24gdG8gYmUgcHJvYmxlbWF0aWMu
CgpPaywgVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uCgo+IAo+PiBUaGlzIGlzIG1lIGF0IGxl
YXN0IHRoYXQgSeKAmXZlIG5ldmVyIHVzZWQgcmVmcG9saWN5IHNvIEnigJltIGFnbm9zdGljIGlu
Cj4+IHRoZSB0b3BpYywgc28gbWF5YmUgYSBuZXV0cmFsIOKAnHVzZSBjYXNl4oCcIDotKQo+IAo+
IEkgZG9uJ3QgcmVhbGx5IGhhdmUgYSBwcmVmZXJlbmNlIGZvciBlaXRoZXIgc29sdXRpb24gdGJo
LgoKVGhlbiBJ4oCZZCBnbyBmb3I6CkJSMl9QQUNLQUdFX1JFRlBPTElDWV9FTkFCTEVfRVhUUkFf
QVVESVRfTE9HCgrigJxFbmFibGUgZXh0cmEgYXVkaXQgbG9n4oCdCgpBbmQgaW4gdGhlIGhlbHAg
c2VjdGlvbiBJIHNwZWNpZnkgYWxsIHRoZSB3YXJuaW5ncy4KRGVmYXVsdGVkIHRvIG4uCgpUaGlz
IHdheSBpdOKAmXMgcHJldHR5IGNsZWFyIHRvIG1lIHRoYXQgSSBhcHByb2FjaCB0aGUgcGFja2Fn
ZSBmb3IgdGhlIGZpcnN0IHRpbWUuIEFuZCBtb3N0IG9mIGFsbCBpdOKAmXMgd2hhdCBpdCBkb2Vz
IGFzIHlvdeKAmXZlIGV4cGxhaW5lZCBtZSBhYm92ZS4KCldlbGwuIEkgdHJ5IHRvIHJlc3BpbiBp
dCB0aGlzIHdheS4gV2lsbCBJIHJlY2VpdmUgYSBSZXZpZXdlZC1ieTogeW91IHRoZW4/IDotKQoK
QmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPiBBbnRvaW5lCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
