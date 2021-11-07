Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822FBC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 21:31:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB8D16135F
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 21:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB8D16135F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5362280DB1;
	Sun,  7 Nov 2021 21:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAQiwW8kLs32; Sun,  7 Nov 2021 21:31:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B19D780DB3;
	Sun,  7 Nov 2021 21:31:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FD561BF335
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 21:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EB2A40242
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 21:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=senzilla.io
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UVTSwvBUZGvI for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 21:31:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05BE640241
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 21:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=senzilla.io; s=key1;
 t=1636320680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DN7VCZgT6wsGRBqbBsFSgtqdbHYQ16ICVyQ4Fe/xPQs=;
 b=ElQD8LSYgg8yFOxDllyB4/Wny/+vbeZN1M3cC6HzLoQJzxY5CAJ+yMz8Xd+GFZ3KbAgfKv
 Fu5aq+PjGLd6kdRwAJvjEGxJTHrQuVeG7NjPlTsJVML/CndeAZl0IS6puBbhOFJ0vlsqzu
 aMEbehxrn+b481PCqgclQo0+UruH3xM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
MIME-Version: 1.0
Date: Sun, 7 Nov 2021 22:31:18 +0100
Message-Id: <D547813E-CD39-4BD6-A55E-0EF27D954E37@senzilla.io>
References: <20211107192930.370979-2-romain.naour@gmail.com>
In-Reply-To: <20211107192930.370979-2-romain.naour@gmail.com>
To: Romain Naour <romain.naour@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: hi@senzilla.io
Subject: Re: [Buildroot] [PATCH 2/2] configs/qemu_aarch64_sbsa_defconfig:
 add gitlab runtime testing tag
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
From: "D. Olsson via buildroot" <buildroot@buildroot.org>
Reply-To: "D. Olsson" <hi@senzilla.io>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKPiBPbiA3IE5vdiAyMDIxLCBhdCAyMDoyOSwgUm9tYWluIE5hb3VyIDxyb21h
aW4ubmFvdXJAZ21haWwuY29tPiB3cm90ZToKPiAKPiDvu79FbmFibGUgdGhlIHJ1bnRpbWUgdGVz
dGluZyBieSBhZGRpbmcgdGhlIHRhZyBpbiB0aGUgcmVhZG1lLnR4dAo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiBDYzogRGljayBPbHNz
b24gPGhpQHNlbnppbGxhLmlvPgo+IC0tLQo+IFRoZSBnaXRsYWIgam9iIG5lZWRzIG1vcmUgdGhh
dCAzaCB0byBidWlsZCBhbmQgZXhlY3V0ZSB0aGUgdGVzdDoKPiBodHRwczovL2dpdGxhYi5jb20v
a3VidTkzL2J1aWxkcm9vdC8tL2pvYnMvMTc1NTg5OTE1NAo+IFRlc3RlZCBsb2NhbGx5IHVzaW5n
IHRoZSBCdWlsZHJvb3QgZG9ja2VyIGltYWdlLgo+IAo+IEknbSBub3Qgc3VyZSBhYm91dCB0aGUg
Y29tbWVudCBhYm91dCBTZWFCSU9TIHBhY2thZ2UsIHRoZSB0ZXN0IHdvcmtzCj4gZmluZSB3aXRo
IHRoZSBjdXJyZW50IGhvc3QtcWVtdSAoNi4xLjApLgoKUmlnaHQsIGhvc3QtcWVtdSB3b3JrcyBn
cmVhdCEgTXkgQ0kgc2V0dXAgaGFzIHRvIHJlbHkgb24gcWVtdSBwYWNrZWQgYnkgRGViaWFuLCBo
b3dldmVyLiBBbmQgaWYgSSByZWNhbGwgY29ycmVjdGx5IEkgcmFuIGludG8gc29tZSBkaXNwbGF5
IG9yIFZHQSByZWxhdGVkIGlzc3VlcyB3aXRoIHFlbXUgZnJvbSBEZWJpYW4gZm9yIHRoZSBzYnNh
IG1hY2hpbmUuIEl0IHdhcyByZXNvbHZlZCBieSBpbnN0YWxsaW5nIHNlYWJpb3MgYmVjYXVzZSBp
dCBhZGRzIHNvbWUgZHJpdmVycyB0byBxZW11LgoKSXQncyBwcm9iYWJseSBhIGdvb2QgaWRlYSB0
byBsZWF2ZSB0aGUgY29tbWVudCB0aGVyZSBmb3Igb3RoZXJzIHdobyBtaWdodCBydW4gaW50byB0
aGUgc2FtZSBpc3N1ZS4KCj4gLS0tCj4gYm9hcmQvcWVtdS9hYXJjaDY0LXNic2EvcmVhZG1lLnR4
dCAgfCAyICstCj4gY29uZmlncy9xZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcgfCA0ICsrLS0K
PiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvYm9hcmQvcWVtdS9hYXJjaDY0LXNic2EvcmVhZG1lLnR4dCBiL2JvYXJkL3Fl
bXUvYWFyY2g2NC1zYnNhL3JlYWRtZS50eHQKPiBpbmRleCBiNjI5NDdmNTVmLi5jZjVmNjZkNGQ2
IDEwMDY0NAo+IC0tLSBhL2JvYXJkL3FlbXUvYWFyY2g2NC1zYnNhL3JlYWRtZS50eHQKPiArKysg
Yi9ib2FyZC9xZW11L2FhcmNoNjQtc2JzYS9yZWFkbWUudHh0Cj4gQEAgLTIzLDcgKzIzLDcgQEAg
UnVuIHRoZSBlbXVsYXRpb24gd2l0aDoKPiAgICAgLW5vZ3JhcGhpYyBcCj4gICAgIC1wZmxhc2gg
b3V0cHV0L2ltYWdlcy9TQlNBX0ZMQVNIMC5mZCBcCj4gICAgIC1wZmxhc2ggb3V0cHV0L2ltYWdl
cy9TQlNBX0ZMQVNIMS5mZCBcCj4gLSAgICAtaGRhIG91dHB1dC9pbWFnZXMvZGlzay5pbWcKPiAr
ICAgIC1oZGEgb3V0cHV0L2ltYWdlcy9kaXNrLmltZyAjIHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNv
bmZpZwo+IAo+IE5vdGUgdGhhdCBpZiB5b3Ugd2FudCB0byBydW4gc2JzYS1yZWYgZW11bGF0aW9u
IHdpdGggUUVNVSBwcm92aWRlZCBieQo+IHlvdXIgZGlzdHJvIChpLmUuLCBub3QgaG9zdC1xZW11
IGJ5IEJ1aWxkcm9vdCkgdGhlbiB5b3UgbWF5IG5lZWQgdG8KPiBkaWZmIC0tZ2l0IGEvY29uZmln
cy9xZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcgYi9jb25maWdzL3FlbXVfYWFyY2g2NF9zYnNh
X2RlZmNvbmZpZwo+IGluZGV4IGQxZTBhZGFkZDEuLmU3ZDNiZDAzY2EgMTAwNjQ0Cj4gLS0tIGEv
Y29uZmlncy9xZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcKPiArKysgYi9jb25maWdzL3FlbXVf
YWFyY2g2NF9zYnNhX2RlZmNvbmZpZwo+IEBAIC0xNiw4ICsxNiw4IEBAIEJSMl9UQVJHRVRfUk9P
VEZTX0VYVDJfND15Cj4gQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIxMjhNIgo+IAo+ICMg
SW1hZ2UKPiAtQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvcWVtdS9hYXJjaDY0
LXNic2EvYXNzZW1ibGUtZmxhc2gtaW1hZ2VzIHN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIK
PiAtQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyBib2FyZC9xZW11L2FhcmNoNjQtc2Jz
YS9nZW5pbWFnZS5jZmciCj4gK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3Fl
bXUvcG9zdC1pbWFnZS5zaCBib2FyZC9xZW11L2FhcmNoNjQtc2JzYS9hc3NlbWJsZS1mbGFzaC1p
bWFnZXMgc3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+ICtCUjJfUk9PVEZTX1BPU1RfU0NS
SVBUX0FSR1M9IiQoQlIyX0RFRkNPTkZJRykgLWMgYm9hcmQvcWVtdS9hYXJjaDY0LXNic2EvZ2Vu
aW1hZ2UuY2ZnIgo+IAo+ICMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbAo+IEJSMl9QQUNL
QUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xNT15Cj4gLS0gCj4gMi4zMS4xCgpMb29r
cyBnb29kIQoKUmV2aWV3ZWQtYnk6IERpY2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
