Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D066C433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 12:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE6F48247F;
	Thu, 25 Nov 2021 12:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4aQoatWpWEeK; Thu, 25 Nov 2021 12:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D4428239A;
	Thu, 25 Nov 2021 12:28:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D4611BF3CC
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C77B60760
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=senzilla.io
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UhNGfHI1VwjO for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 12:28:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3569360737
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=senzilla.io; s=key1;
 t=1637843298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6b46NdhIdL1Mz1H2x9sFJJio7YKnJNo6sucTHyCcHb4=;
 b=DIH3YIg5XtD7eLy/SBrz9MLE1PXY0ktvJQmrC9tGl5nAsiZaX3jzE65k7ioOcPKwk/92FS
 mown91737YH4szfPlp6vBIVKONaG7w2F+FwmiJ3n+PSua5wr2OTsqWK9LX7PCxDM/p4rjG
 FkvafB5gLIU6ymo2q78uDBUOLJPSEdA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
MIME-Version: 1.0
Date: Thu, 25 Nov 2021 13:28:16 +0100
Message-Id: <97980B85-6CCC-45FB-8ED2-CDD2430ECFBD@senzilla.io>
References: <20211125102441.5351-1-vincent.stehle@arm.com>
In-Reply-To: <20211125102441.5351-1-vincent.stehle@arm.com>
To: =?utf-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: hi@senzilla.io
Subject: Re: [Buildroot] [PATCH next] configs/aarch64_efi: bump kernel
 version
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

SGkgVmluY2VudCwKCj4gT24gMjUgTm92IDIwMjEsIGF0IDExOjI1LCBWaW5jZW50IFN0ZWhsw6kg
PHZpbmNlbnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgo+IAo+IO+7v0J1bXAgTGludXgga2VybmVs
IHZlcnNpb24gdG8gNS4xNS40Lgo+IAo+IFdlIGVubGFyZ2UgdGhlIGJvb3QgcGFydGl0aW9uIHRv
IGZvbGxvdyB0aGUga2VybmVsIGltYWdlIHNpemUgaW5jcmVhc2UgYW5kCj4gdXBkYXRlIHRoZSBp
bnN0cnVjdGlvbnMgdG8gcnVuIG9uIHFlbXUgd2l0aCBhIFUtQm9vdCBiYXNlZCBmaXJtd2FyZS4K
CkkgdW5kZXJzdGFuZCB0aGF0IHlvdSBtaWdodCBoYXZlIHRlc3RlZCB0aGlzIHdpdGggVS1Cb290
IGZpcm13YXJlLiBCdXQgdGhlIHVwZGF0ZWQgaW5zdHJ1Y3Rpb25zIGRvZXNuJ3QgbWFrZSBhbnkg
cmVmZXJlbmNlcyB0byBVLUJvb3QsIHNvIHlvdXIgZGVzY3JpcHRpb24gaXMgYSBsaXR0bGUgYml0
IGNvbmZ1c2luZy4gTWF5YmUgc2ltcGxpZnkgdGhlIGNvbW1pdCBtZXNzYWdlPwoKPiBib2FyZC9h
YXJjaDY0LWVmaS9nZW5pbWFnZS1lZmkuY2ZnIHwgMiArLQo+IGJvYXJkL2FhcmNoNjQtZWZpL3Jl
YWRtZS50eHQgICAgICAgfCAyICstCj4gY29uZmlncy9hYXJjaDY0X2VmaV9kZWZjb25maWcgICAg
ICB8IDYgKysrLS0tCj4gMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2JvYXJkL2FhcmNoNjQtZWZpL2dlbmltYWdlLWVmaS5j
ZmcgYi9ib2FyZC9hYXJjaDY0LWVmaS9nZW5pbWFnZS1lZmkuY2ZnCj4gaW5kZXggOGVjMWYxMGZk
ODIuLjEzZDY5ZTVlNDI1IDEwMDY0NAo+IC0tLSBhL2JvYXJkL2FhcmNoNjQtZWZpL2dlbmltYWdl
LWVmaS5jZmcKPiArKysgYi9ib2FyZC9hYXJjaDY0LWVmaS9nZW5pbWFnZS1lZmkuY2ZnCj4gQEAg
LTgsNyArOCw3IEBAIGltYWdlIGVmaS1wYXJ0LnZmYXQgewo+ICAgICAgICB9Cj4gICAgfQo+IAo+
IC0gICAgc2l6ZSA9IDMyTQo+ICsgICAgc2l6ZSA9IDY0TQo+IH0KPiAKPiBpbWFnZSBkaXNrLmlt
ZyB7Cj4gZGlmZiAtLWdpdCBhL2JvYXJkL2FhcmNoNjQtZWZpL3JlYWRtZS50eHQgYi9ib2FyZC9h
YXJjaDY0LWVmaS9yZWFkbWUudHh0Cj4gaW5kZXggMTY0OTkzZWVhNDkuLjBlN2VhMGI1ZGQ3IDEw
MDY0NAo+IC0tLSBhL2JvYXJkL2FhcmNoNjQtZWZpL3JlYWRtZS50eHQKPiArKysgYi9ib2FyZC9h
YXJjaDY0LWVmaS9yZWFkbWUudHh0Cj4gQEAgLTQ1LDcgKzQ1LDcgQEAgdGhlIGluc3RydWN0aW9u
cyBpbiBbM10sIHdpdGggcWVtdV9hcm02NF9kZWZjb25maWcuCj4gCj4gVGhpcyBzaG91bGQgZ2l2
ZSB5b3UgYSBub3JfZmxhc2guYmluLCB3aGljaCB5b3UgY2FuIHVzZSB3aXRoIHFlbXUgYXMgYW4K
PiBhbHRlcm5hdGl2ZSB0byBRRU1VX0VGSS5mZC4gWW91IHdpbGwgYWxzbyBuZWVkIHRvIGNoYW5n
ZSB0aGUgbWFjaGluZQo+IC1zcGVjaWZpY2F0aW9uIHRvICItTSB2aXJ0LHNlY3VyZSIgb24gcWVt
dSBjb21tYW5kIGxpbmUsIHRvIGVuYWJsZSBUcnVzdFpvbmUKPiArc3BlY2lmaWNhdGlvbiB0byAi
LU0gdmlydCxzZWN1cmU9b24iIG9uIHFlbXUgY29tbWFuZCBsaW5lLCB0byBlbmFibGUgVHJ1c3Ra
b25lCj4gc3VwcG9ydCwgYW5kIHlvdSB3aWxsIG5lZWQgdG8gaW5jcmVhc2UgdGhlIG1lbW9yeSB3
aXRoICItbSAxMDI0Ii4KPiAKPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9BUk0tc29mdHdhcmUv
ZWJicgo+IGRpZmYgLS1naXQgYS9jb25maWdzL2FhcmNoNjRfZWZpX2RlZmNvbmZpZyBiL2NvbmZp
Z3MvYWFyY2g2NF9lZmlfZGVmY29uZmlnCj4gaW5kZXggNmNiOGQxZmFjMjEuLjFiZDA2YzUxZjM3
IDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3MvYWFyY2g2NF9lZmlfZGVmY29uZmlnCj4gKysrIGIvY29u
Zmlncy9hYXJjaDY0X2VmaV9kZWZjb25maWcKPiBAQCAtMjIsMTMgKzIyLDEzIEBAIEJSMl9UQVJH
RVRfUk9PVEZTX0VYVDJfU0laRT0iMjAwTSIKPiBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBU
PSJib2FyZC9hYXJjaDY0LWVmaS9wb3N0LWltYWdlLnNoIHN1cHBvcnQvc2NyaXB0cy9nZW5pbWFn
ZS5zaCIKPiBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL2FhcmNoNjQtZWZp
L2dlbmltYWdlLWVmaS5jZmciCj4gCj4gLSMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwg
YSA1LjExIHNlcmllcwo+IC1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVf
MTE9eQo+ICsjIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEgNS4xNSBzZXJpZXMKPiAr
QlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE1PXkKPiAKPiAjIEtlcm5l
bAo+IEJSMl9MSU5VWF9LRVJORUw9eQo+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049
eQo+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjExLjE2Igo+ICtC
UjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE1LjQiCj4gQlIyX0xJTlVY
X0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJRz15Cj4gQlIyX0xJTlVYX0tFUk5FTF9ORUVE
U19IT1NUX09QRU5TU0w9eQo+IAo+IC0tIAo+IDIuMzMuMAoKSG93ZXZlciwgdGhlIGNvZGUgY2hh
bmdlcyBsb29rIGdvb2QuCgpSZXZpZXdlZC1ieTogRGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlv
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
