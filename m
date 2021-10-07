Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A73BC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 08:23:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B56D610A5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 08:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B56D610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A306403FB;
	Thu,  7 Oct 2021 08:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EAe237nEr40W; Thu,  7 Oct 2021 08:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CD4C40324;
	Thu,  7 Oct 2021 08:23:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BFE11BF477
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 08:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48F9F4098F
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 08:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thjGY8N_6TB8 for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 08:23:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5058E4097C
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 08:23:22 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id EDF911C0002;
 Thu,  7 Oct 2021 08:23:18 +0000 (UTC)
Date: Thu, 7 Oct 2021 10:23:18 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211007102318.556f7fc2@kmaincent-XPS-13-7390>
In-Reply-To: <20211006181104.GD2081069@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-3-kory.maincent@bootlin.com>
 <20211006181104.GD2081069@scaer>
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

T24gV2VkLCA2IE9jdCAyMDIxIDIwOjExOjA0ICswMjAwCiJZYW5uIEUuIE1PUklOIiA8eWFubi5t
b3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgoKPiBLw7ZyeSwgQWxsLAo+IAo+IE9uIDIwMjEtMDkt
MjMgMTc6NTcgKzAyMDAsIEtvcnkgTWFpbmNlbnQgc3Bha2UgdGh1c2x5Ogo+IFstLVNOSVAtLV0K
PiA+IFdlIGNhbiBubyBsb25nZXIgdXNlIGF1dG90b29scy1wYWNrYWdlIGFzIGEgY29uc2VxdWVu
Y2Ugb2YgdGhpcwo+ID4gbXVsdGktYnVpbGQsIGFuZCB3ZSBoYXZlIHRvIHJlc29ydCB0byBnZW5l
cmljLXBhY2thZ2UgYW5kIGEgcGFydGlhbAo+ID4gZHVwbGljYXRpb24gb2YgdGhlIGF1dG90b29s
cy1pbmZyYS4gR3J1YjIgd2FzIGFscmVhZHkgdXNpbmcgY3VzdG9tIG9wdGlvbgo+ID4gbGlrZSAt
LXByZWZpeCBvciAtLWV4ZWMtcHJlZml4IHNvIHRoaXMgd29uJ3QgYWRkIG11Y2ggbW9yZSB3ZWly
ZG5lc3MuICAKPiAKPiBCdXQgdGhpcyBoYWQgYW4gdW5mb3J0dW5hdGUgc2lkZSBlZmZlY3Q6IHRo
ZSBncnViMiB0b29scywgbGlrZQo+IGdydWItZWRpdGVudiwgZW5hYmxlZCB3aXRoIEJSMl9UQVJH
RVRfR1JVQjJfSU5TVEFMTF9UT09MUywgYXJlIG5vCj4gbG9uZ2VyIGluc3RhbGxlZCBpbiB0aGUg
dGFyZ2V0IG5vdy4KCkRvaCwgZGlkbid0IHRob3VnaHQgb2YgdGhhdCEKIAo+IEJ1dCBnZW5lcmlj
LXBhY2thZ2UgaGFzIG5vIGRlZmF1bHQgaW5zdGFsbCBjb21tYW5kLCBzbyBkZWNsYXJpbmcgdGhh
dAo+IHRoZSBwYWNrYWdlIGluc3RhbGxzIGluIHRhcmdldCBkb2VzIG5vdGhpbmcuCj4gCj4gSSBz
ZWUgdHdvIG9wdGlvbnM6Cj4gCj4gIDEuIHByb3ZpZGUgYSBjdXN0b20gY29tbWFuZCBmb3Igb25l
IG9mIHRoZSBlbmFibGVkIHBsYXRmb3JtczsgZS5nLgo+ICAgICBhcmJpdHJhcmlseSBjaG9vc2Ug
dGhlIGZpcnN0IGluIHRoZSB0dXBsZSBhbmQgaW5zdGFsbCBpbiB0YXJnZXQKPiAgICAgZnJvbSB0
aGF0IG9uZSB0dXBsZQo+IAo+ICAyLiByZXZlcnQgdG8gdXNpbmcgYW4gYXV0b3Rvb2xzIHBhY2th
Z2UsIGJ1dCBidWlsZCBmb3Igbm8gcGxhdGZvcm0gYXQKPiAgICAgYWxsIGFuZCBqdXN0IGluc3Rh
bGwgdGhlIHRvb2xzLiBGb3IgdGhlIHBsYXRmb3JtcywgbW92ZSB0aGUgY3VycmVudAo+ICAgICBm
b3JlYWNoIGxvb3BzIGludG8gcG9zdC1idWlsZCBhbmQgcG9zdC1pbnN0YWxsLWltYWdlIGhvb2tz
Cj4gCj4gQ2FyZSB0byBsb29rIGludG8gdGhhdCwgcGxlYXNlPwoKbW1oIHRoYXQncyB0cmlja3ks
IGJlY2F1c2UgaW4gdGhlIGNhc2Ugd2Ugd2FudCB0byB1c2UgdGhlIEdydWIgbW9kdWxlcyBpdCBu
ZWVkCnRvIGJlIGdlbmVyYXRlZCBmb3IgZWFjaCBwbGF0Zm9ybXMuCkZvciBleGFtcGxlIHdlIGNh
biBmYWNlIGEgY2FzZSB3aGVyZSB3ZSB3aWxsIGhhdmUgdGhlc2UgdGhyZWUgR3J1YiBtb2R1bGVz
CnJlcG9zaXRvcmllcyBmb3IgZWFjaCBwbGF0Zm9ybToKdGFyZ2V0L2xpYi9ncnViL2kzODYtcGMv
CnRhcmdldC9saWIvZ3J1Yi9pMzg2LWVmaS8KdGFyZ2V0L2xpYi9ncnViL3g4Nl82NC1lZmkvCgpX
aGF0IGFib3V0IGp1c3QgYWRkaW5nIHRoZSAibWFrZSBpbnN0YWxsIiBjb21tYW5kIGluIHRoZSBm
b3JlYWNoIGxvb3A/ClRoaXMgd2lsbCBvdmVyd3JpdGUgdGhlIGJpbmFyaWVzLCB0aGUgbG9jYWxl
IGFuZCB0aGUgL2V0YyBjb25maWd1cmF0aW9ucyBmb3IKZWFjaCAibWFrZSIgbG9vcCBidXQgd2Ug
d2lsbCBoYXZlIGFsbCB0aGUgR3J1YiBtb2R1bGVzIHJlcG9zaXRvcmllcy4gSSBkb24ndAp0aGlu
ayB0aGUgb3ZlcndyaXRlcyB3aWxsIGNhdXNlIGlzc3VlcyBiZWNhdXNlIGl0IGlzIGp1c3QgdG9v
bHMuCgpSZWdhcmRzLAoKS8O2cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
