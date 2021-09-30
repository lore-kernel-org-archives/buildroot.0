Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C0EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 09:12:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E4C619BB
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 09:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39E4C619BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9B114034D;
	Thu, 30 Sep 2021 09:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0AcdZwLQKlc7; Thu, 30 Sep 2021 09:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD470403F1;
	Thu, 30 Sep 2021 09:12:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE40D1BF31A
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 09:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDAB683F6A
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 09:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1TB1-N0bE_Eb for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 09:12:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C572183F46
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 09:12:28 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 7ED671BF214;
 Thu, 30 Sep 2021 09:12:25 +0000 (UTC)
Date: Thu, 30 Sep 2021 11:12:24 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210930111224.09a07f15@kmaincent-XPS-13-7390>
In-Reply-To: <20210929212614.GM1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-5-kory.maincent@bootlin.com>
 <20210929212614.GM1504958@scaer>
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

SGVsbG8gWWFubiwKClRoYW5rcyBmb3IgdGhlIG1lcmdlLgoKT24gV2VkLCAyOSBTZXAgMjAyMSAy
MzoyNjoxNCArMDIwMAoiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3
cm90ZToKCj4gS8O2cnksIEFsbCwKPiAKPiBPbiAyMDIxLTA5LTIzIDE3OjU3ICswMjAwLCBLb3J5
IE1haW5jZW50IHNwYWtlIHRodXNseToKPiA+IEFkZCBzdXBwb3J0IGZvciBidWlsZGluZyBhbiBo
eWJyaWQgSVNPOTY2MCBpbWFnZSBjb21wYXRpYmxlIHdpdGggbGVnYWN5Cj4gPiBhbmQgVUVGSSBC
SU9TLgo+ID4gVGhlIG9wdGlvbiAtZWx0b3JpdG8tYWx0LWJvb3QgbmVlZCB0byBiZSB1c2VkIGlu
IHRoZSB4b3JyaXNvIGNvbW1hbmQKPiA+IHRvIGdlbmVyYXRlIHRoZSBoeWJyaWQgaW1hZ2UuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxp
bi5jb20+ICAKPiAKPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLCB3aXRoIHRoZSBmb2xvd2lu
ZyBjaGFuZ2VzOwo+IAo+ICAgLSBub3RlIGFib3V0IGh5YnJpZCB2cy4gKGlzbyloeWJyaWQKPiAg
IC0gZXhwbGFpbiAtZWx0b3JpdG8tYWx0LWJvb3QKPiAgIC0gZXhwbGFpbiBkdXBsaWNhdGlvbiBv
ZiAtbm8tZW11bC1ib290Cj4gICAtIHJlbmFtZSB0aGUgdmFyaWFibGVzCj4gICAtIG5vdGUgYWJv
dXQgdGhlIEJJT1MtRUZJIG9yZGVyaW5nCj4gCj4gU2luY2UgSSBoYWQgZG9uZSBhIGZldyBjaGFu
Z2VzIGluIHRoZSBwcmV2aW91cyBwYXRjaGVzLCBvZiBjb3Vyc2UgSSBoYWQKPiB0byByZXNvbHZl
IHRoZSBjb25mbGljdHMgd2hlbiBhcHBseWluZyB0aGlzIHBhdGNoLi4uIEkndmUgdHJpZWQgdG8g
YmUgYXMKPiBjYXJlZnVsbCBhcyBJIGNvdWxkLCBidXQgSSBtYXkgaGF2ZSAoYWdhaW4hKSBsZXQg
c29tZSBpc3N1ZXMgc2xpcAo+IHRoZW91Z2guLi4KPiAKPiBDb3VsZCB5b3UgcGxlYXNlIHJldmll
dy90ZXN0IHRoYXQgaXQgaXMgdGlsbCB3b3JrcyBhcyBleHBlY3RlZD8KCkkgZG8gbm90IHNlZSBh
bnkgaXNzdWUgaW4geW91ciBjaGFuZ2UsIHRoZSBiZW5jaCBvZiB0ZXN0cyAobGFzdCBwYXRjaCkg
ZW5kcwp3ZWxsLgoKPiAKPiBJIGRvbid0IHRoaW5rIHRoZSByZW1haW5pbmcgcGF0Y2hlcyBuZWVk
IHJlYmFzaW5nLCB0aG91Z2gsIHNvIEkgaG9wZSBJCj4gY2FuIGhhbmRsZSBtb3JlIHRoYW4gb25l
IG5leHQgZXZlbmluZy4uLiA6LS8KClRoZXkgaW5kZWVkIGRvbid0IG5lZWQgcmViYXNpbmcuCgpS
ZWdhcmRzLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
