Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9095CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33E2440586;
	Tue, 28 Dec 2021 21:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hp2uFaOMuKSw; Tue, 28 Dec 2021 21:14:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5075240253;
	Tue, 28 Dec 2021 21:14:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A3931BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67A294030F
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KCInFbTm6OBf for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:14:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51C8D40287
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:14:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 91BC440003;
 Tue, 28 Dec 2021 21:14:31 +0000 (UTC)
Date: Tue, 28 Dec 2021 22:14:30 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Message-ID: <20211228221430.7e8cb844@windsurf>
In-Reply-To: <20211112160413.2736382-1-clg@kaod.org>
References: <20211112160413.2736382-1-clg@kaod.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] configs/qemu: Add a ppc64le-powernv
 configuration
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ8OpZHJpYywKCk9uIEZyaSwgMTIgTm92IDIwMjEgMTc6MDQ6MTEgKzAxMDAKQ8OpZHJp
YyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gd3JvdGU6Cgo+IFBvd2VyTlYgKGFzIE5vbi1WaXJ0
dWFsaXplZCkgaXMgdGhlICJiYXJlbWV0YWwiIHBsYXRmb3JtIHVzaW5nIHRoZQo+IE9QQUwgWzFd
IGZpcm13YXJlLiBJdCBydW5zIExpbnV4IG9uIElCTSBhbmQgT3BlblBPV0VSIHN5c3RlbXMgYW5k
IGNhbgo+IGJlIHVzZWQgYXMgYW4gaHlwZXJ2aXNvciBPUywgcnVubmluZyBLVk0gZ3Vlc3RzLCBv
ciBzaW1wbHkgYXMgYSBob3N0Cj4gT1MuIE9QQUwgaW5jbHVkZXMgYSBMaW51eCBrZXJuZWwgYW5k
IGEgYnVpbGRyb290IHJvb3RmcyB3aGljaCBhY3RzIGFzCj4gYSBib290bG9hZGVyIFsyXSBmb3Ig
dGhlIHZhcmlvdXMgc3lzdGVtcyBpbnN0YWxsZWQgb24gZGlza3MuCgpGb3IgdGhlIHBlcnNvbiBu
b3QgZmFtaWxpYXIgd2l0aCBhbGwgdGhpcyBPcGVuUE9XRVIgc3R1ZmYsIGl0J3MgdmVyeQpjb21w
bGV4IHRvIHVuZGVyc3RhbmQgYWxsIHRoZXNlIGZpcm13YXJlLCB2aXJ0dWFsaXplZCBzdHVmZiwK
aHlwZXJ2aXNvciwgZXRjLgoKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvcWVtdS9wcGM2NGxlLXBvd2Vy
bnYvcmVhZG1lLnR4dCBiL2JvYXJkL3FlbXUvcHBjNjRsZS1wb3dlcm52L3JlYWRtZS50eHQKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZWUxMDJhM2Q2ODQ2Cj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL2JvYXJkL3FlbXUvcHBjNjRsZS1wb3dlcm52L3JlYWRtZS50
eHQKPiBAQCAtMCwwICsxLDUgQEAKPiArUnVuIHRoZSBlbXVsYXRpb24gd2l0aDoKPiArCj4gK3Fl
bXUtc3lzdGVtLXBwYzY0IC1NIHBvd2VybnY5IC1rZXJuZWwgdm1saW51eCAtYXBwZW5kICJjb25z
b2xlPWh2YzAgcm9vdHdhaXQgcm9vdD0vZGV2L252bWUwbjEiIC1kZXZpY2UgbnZtZSxidXM9cGNp
ZS4zLGFkZHI9MHgwLGRyaXZlPWRyaXZlMCxzZXJpYWw9MTIzNCAtZHJpdmUgZmlsZT0uL3Jvb3Rm
cy5leHQyLGlmPW5vbmUsaWQ9ZHJpdmUwLGZvcm1hdD1yYXcsY2FjaGU9bm9uZSAtZGV2aWNlIGUx
MDAwZSxuZXRkZXY9bmV0MCxtYWM9QzA6RkY6RUU6MDA6MDE6MDMsYnVzPXBjaWUuMSxhZGRyPTB4
MCAgLW5ldGRldiB1c2VyLGlkPW5ldDAgLXNlcmlhbCBtb246c3RkaW8gLW5vZ3JhcGhpYyAjIHFl
bXVfcHBjNjRsZV9wb3dlcm52X2RlZmNvbmZpZwoKWW91J3JlIGVtdWxhdGluZyBhIHBvd2VybnY5
LCBzbyB3ZSBhc3N1bWUgYmFzZWQgb24gdGhlIFBvd2VyOSBwcm9jZXNzb3IuCgo+IEBAIC0wLDAg
KzEsMjkgQEAKPiArIyBBcmNoaXRlY3R1cmUKPiArQlIyX3Bvd2VycGM2NGxlPXkKPiArQlIyX3Bv
d2VycGNfcG93ZXI4PXkKCkJ1dCB5b3UncmUgdGFyZ2V0aW5nIFBvd2VyOC4KCkNvdWxkIHlvdSBj
bGFyaWZ5PwoKVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBh
bmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5k
IHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
