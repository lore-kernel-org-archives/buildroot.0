Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF820C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 12:44:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC4DB60F92
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 12:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC4DB60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66826404A0;
	Thu,  7 Oct 2021 12:44:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9kDb41XWv_K; Thu,  7 Oct 2021 12:43:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F73C4049C;
	Thu,  7 Oct 2021 12:43:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C36BF1BF861
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 12:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B20C660FA2
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 12:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wy8AsxDajNQI for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 12:43:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F01D607E4
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 12:43:55 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 924701C0013;
 Thu,  7 Oct 2021 12:43:52 +0000 (UTC)
Date: Thu, 7 Oct 2021 14:43:51 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211007144351.629d2de0@kmaincent-XPS-13-7390>
In-Reply-To: <20211007095326.GA2814782@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-3-kory.maincent@bootlin.com>
 <20211006181104.GD2081069@scaer>
 <20211007102318.556f7fc2@kmaincent-XPS-13-7390>
 <20211007095326.GA2814782@scaer>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/7] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
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
Cc: Adam Duskett <aduskett@gmail.com>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCA3IE9jdCAyMDIxIDExOjUzOjI2ICswMjAwCiJZYW5uIEUuIE1PUklOIiA8eWFubi5t
b3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgoKPiBLw7ZyeSwgQWxsLAo+IAo+IE9uIDIwMjEtMTAt
MDcgMTA6MjMgKzAyMDAsIEvDtnJ5IE1haW5jZW50IHNwYWtlIHRodXNseToKPiA+IE9uIFdlZCwg
NiBPY3QgMjAyMSAyMDoxMTowNCArMDIwMAo+ID4gIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmlu
LjE5OThAZnJlZS5mcj4gd3JvdGU6ICAKPiA+ID4gT24gMjAyMS0wOS0yMyAxNzo1NyArMDIwMCwg
S29yeSBNYWluY2VudCBzcGFrZSB0aHVzbHk6Cj4gPiA+IFstLVNOSVAtLV0gIAo+ID4gPiA+IFdl
IGNhbiBubyBsb25nZXIgdXNlIGF1dG90b29scy1wYWNrYWdlIGFzIGEgY29uc2VxdWVuY2Ugb2Yg
dGhpcwo+ID4gPiA+IG11bHRpLWJ1aWxkLCBhbmQgd2UgaGF2ZSB0byByZXNvcnQgdG8gZ2VuZXJp
Yy1wYWNrYWdlIGFuZCBhIHBhcnRpYWwKPiA+ID4gPiBkdXBsaWNhdGlvbiBvZiB0aGUgYXV0b3Rv
b2xzLWluZnJhLiBHcnViMiB3YXMgYWxyZWFkeSB1c2luZyBjdXN0b20KPiA+ID4gPiBvcHRpb24g
bGlrZSAtLXByZWZpeCBvciAtLWV4ZWMtcHJlZml4IHNvIHRoaXMgd29uJ3QgYWRkIG11Y2ggbW9y
ZQo+ID4gPiA+IHdlaXJkbmVzcy4gICAgCj4gPiA+IEJ1dCB0aGlzIGhhZCBhbiB1bmZvcnR1bmF0
ZSBzaWRlIGVmZmVjdDogdGhlIGdydWIyIHRvb2xzLCBsaWtlCj4gPiA+IGdydWItZWRpdGVudiwg
ZW5hYmxlZCB3aXRoIEJSMl9UQVJHRVRfR1JVQjJfSU5TVEFMTF9UT09MUywgYXJlIG5vCj4gPiA+
IGxvbmdlciBpbnN0YWxsZWQgaW4gdGhlIHRhcmdldCBub3cuICAKPiA+IERvaCwgZGlkbid0IHRo
b3VnaHQgb2YgdGhhdCEgIAo+IAo+IE5laXRoZXIgZGlkIEkuLi4KPiAKPiBbLS1TTklQLS1dCj4g
PiA+IENhcmUgdG8gbG9vayBpbnRvIHRoYXQsIHBsZWFzZT8gIAo+ID4gCj4gPiBtbWggdGhhdCdz
IHRyaWNreSwgYmVjYXVzZSBpbiB0aGUgY2FzZSB3ZSB3YW50IHRvIHVzZSB0aGUgR3J1YiBtb2R1
bGVzIGl0Cj4gPiBuZWVkIHRvIGJlIGdlbmVyYXRlZCBmb3IgZWFjaCBwbGF0Zm9ybXMuCj4gPiBG
b3IgZXhhbXBsZSB3ZSBjYW4gZmFjZSBhIGNhc2Ugd2hlcmUgd2Ugd2lsbCBoYXZlIHRoZXNlIHRo
cmVlIEdydWIgbW9kdWxlcwo+ID4gcmVwb3NpdG9yaWVzIGZvciBlYWNoIHBsYXRmb3JtOgo+ID4g
dGFyZ2V0L2xpYi9ncnViL2kzODYtcGMvCj4gPiB0YXJnZXQvbGliL2dydWIvaTM4Ni1lZmkvCj4g
PiB0YXJnZXQvbGliL2dydWIveDg2XzY0LWVmaS8KPiA+IAo+ID4gV2hhdCBhYm91dCBqdXN0IGFk
ZGluZyB0aGUgIm1ha2UgaW5zdGFsbCIgY29tbWFuZCBpbiB0aGUgZm9yZWFjaCBsb29wPwo+ID4g
VGhpcyB3aWxsIG92ZXJ3cml0ZSB0aGUgYmluYXJpZXMsIHRoZSBsb2NhbGUgYW5kIHRoZSAvZXRj
IGNvbmZpZ3VyYXRpb25zIGZvcgo+ID4gZWFjaCAibWFrZSIgbG9vcCBidXQgd2Ugd2lsbCBoYXZl
IGFsbCB0aGUgR3J1YiBtb2R1bGVzIHJlcG9zaXRvcmllcy4gSSBkb24ndAo+ID4gdGhpbmsgdGhl
IG92ZXJ3cml0ZXMgd2lsbCBjYXVzZSBpc3N1ZXMgYmVjYXVzZSBpdCBpcyBqdXN0IHRvb2xzLiAg
Cgo+IAo+IEJ5IHVzaW5nIC0td2l0aC1wbGF0Zm9ybT1ub25lIGluIHRoZSBtYWluIENPTkZfT1BU
Uywgd2Ugc2hvdWxkIGJlIGFibGUKPiB0byBkaXNhYmxlIGJ1aWxkaW5nIGFueSBvZiB0aGUgImlt
YWdlcyIsIGFuZCBqdXN0IGJ1aWxkIHRoZSB0b29scy4KPiAKPiBUb3RhbGx5IHVudGVzdGVkLCBv
ZiBjb3Vyc2UuLi4KCkFzIEkgc2FpZCBpZiB3ZSBkbyB0aGF0IHdlIHdvbid0IGhhdmUgYWxsIHRo
ZSBHcnViIG1vZHVsZXMgaW4gdGhlIHRhcmdldApkaXJlY3RvcnkuIEkgdGhpbmsgdGhlc2UgbW9k
dWxlcyBhcmUgcXVpZXQgaW1wb3J0YW50LCBhbiB1c2VyIHRoYXQgd2FudHMgdG8gdXNlCmdydWIt
bWtpbWFnZSB3aWxsIHN1cmVseSB1c2UgdGhlbSBmb3IgZXhhbXBsZS4gCgpSZWdhcmRzLAoKS8O2
cnksCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
