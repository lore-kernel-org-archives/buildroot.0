Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7D0C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 12:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84C1A814B5;
	Sun,  9 Jan 2022 12:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_Gj-Ug5_5a9; Sun,  9 Jan 2022 12:14:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6E7E8142C;
	Sun,  9 Jan 2022 12:14:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9BF51BF417
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B0E38142C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZ23ByK8Qk0D for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 12:14:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F75F81429
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 12:14:28 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0083F1C0002;
 Sun,  9 Jan 2022 12:14:23 +0000 (UTC)
Date: Sun, 9 Jan 2022 13:14:22 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220109131422.4f774dfd@bootlin.com>
In-Reply-To: <91348c3073b0dcf57a8ea3227bae74c23a122713.1641663315.git.yann.morin.1998@free.fr>
References: <cover.1641663315.git.yann.morin.1998@free.fr>
 <91348c3073b0dcf57a8ea3227bae74c23a122713.1641663315.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] core/pkg-generic: fixup all PPD paths
 in a generic fashion
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
Cc: Louis-Paul CORDIER <lpdev@cordier.org>, Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Naumann <anaumann@ultratronik.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAgOCBKYW4gMjAyMiAxODozNTo0MSArMDEwMAoiWWFubiBFLiBNT1JJTiIgPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gU29tZSBmaWxlcyBjb250YWluIGhhcmQtY29k
ZWQgYWJzb2x1dGUgcGF0aHMgdGhhdCBwb2ludCB0byB0aGUgaG9zdAo+IGFuZC9vciBzdGFnaW5n
IGRpcmVjdG9yaWVzLgo+IAo+IFdpdGggcGVyLXBhY2thZ2UgZGlyZWN0b3JpZXMgKGFrYS4gUFBE
KSwgdGhlc2UgcGF0aHMgcG9pbnQgdG8gdGhlIFBQRAo+IG9mIHRoZSBwYWNrYWdlIHRoYXQgY3Jl
YXRlZCB0aGUgZmlsZXMsIHdoZW4gd2Ugd2FudCB0aGVtIHRvIHBvaW50IHRvIHRoZQo+IFBQRCBv
ZiB0aGUgcGFja2FnZSB0aGF0IHVzZXMgdGhlbS4KPiAKPiBVcCB1bnRpbCBub3csIHdlIGhhZCB0
d28gaG9va3MgdGhhdCBhdHRlbXB0ZWQgdG8gZml4IHRob3NlIGZpbGVzOgo+IAo+ICAgLSBhIGxp
YnRvb2wtc3BlY2lmaWMgaG9vayB0aGF0IHNlYXJjaGVzIGZvciBhbGwgLmxhIGZpbGVzIGFuZCBz
ZWRzCj4gICAgIHRoZW0gd2l0aCB0aGUgcHJvcGVyIFBQRCwKPiAKPiAgIC0gYSBweXRob24tc3Bl
Y2lmaWMgaG9vayB0aGF0IHR3ZWFrcyBqdXN0IHRoZSBzeXNjb25maWdkYXRhIGFuZAo+ICAgICBy
ZW1vdmVzIHRoZSBieXRlLWNvbXBpbGVkIHZlcnNpb24gb2YgdGhlIHN5c2NvbmZpZ2RhdGEuCj4g
Cj4gQnV0IG5vdywgd2UgYWxzbyBoYXZlIGEgZmV3IG90aGVyIGtpbmRzIG9mIGZpbGVzIGZvciB3
aGljaCB3ZSBuZWVkIHRvCj4gZml4IHRoZSBQUEQ6IC5jbWFrZSwgLnBjLCBvciAucHJpIGZpbGVz
LCBhbmQgcHJvYmFibHkgYSBidW5jaCBvZiBvdGhlcnMKPiBhcyB3ZWxsLgo+IAo+IFdlIHNvbHZl
IHRoaXMgaXNzdWUgYnkganVzdCByZXBsYWNpbmcgYW55IFBQRCBpbiB0ZXh0IGZpbGVzLCB3aXRo
IHRoZQo+IGN1cnJlbnQgcGFja2FnZSdzIFBQRC4KPiAKPiBUaGlzIGlzIHZlcnkgc2ltaWxhciB0
bywgYW5kIGluc3BpcmVkIGZyb20gd2hhdCBpcyBkb25lIHdoZW4gcmVsb2NhdGluZwo+IHRoZSBT
REsuIEhvd2V2ZXIsIHdlIGNhbid0IHVzZSB0aGUgZXhpc3RpbmcgcmVsb2NhdGUtc2RrIHNjcmlw
dCwgYmVjYXVzZQo+IHRoYXQgbmVlZHMgdG8ga25vdyB0aGUgb3JpZ2luYWwgbG9jYXRpb24sIHdo
aWNoIHdlIGRvIG5vdCBoYXZlIHdoZW4gd2UKPiBhZ2dyZWdhdGUgdGhlIFBQRCAod2UgY291bGQg
c3RvcmUgaXQsIGJ1dCB3ZSBjYW4gZWFzaWx5IGRvIHdpdGhvdXQgaXQpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+IENjOiBUaG9t
YXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IENjOiBBcm5vdXQg
VmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWluZC5iZT4KPiBDYzogQWRh
bSBEdXNrZXR0IDxhZHVza2V0dEBnbWFpbC5jb20+Cj4gQ2M6IExvdWlzLVBhdWwgQ09SRElFUiA8
bHBkZXZAY29yZGllci5vcmc+Cj4gQ2M6IEFuZHJlYXMgTmF1bWFubiA8YW5hdW1hbm5AdWx0cmF0
cm9uaWsuZGU+Cj4gLS0tCj4gIHBhY2thZ2UvcGtnLWdlbmVyaWMubWsgfCA0MyArKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGlu
c2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+IAoKWy4uLl0KCkFja2VkLWJ5OiBIZXJ2ZSBD
b2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KCkJlc3QgcmVnYXJkcywKSGVydsOpCgot
LSAKSGVydsOpIENvZGluYSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
