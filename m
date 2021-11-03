Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D781AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:24:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 432DE610EA
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 432DE610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF998404D7;
	Wed,  3 Nov 2021 17:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B8K_l8IpJ8jT; Wed,  3 Nov 2021 17:24:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D91404D8;
	Wed,  3 Nov 2021 17:24:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E83D1BF3EA
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DA4760ADD
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fjXMv_tswX02 for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:24:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A0EE60AD8
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:24:47 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 60EC74000A;
 Wed,  3 Nov 2021 17:24:44 +0000 (UTC)
Date: Wed, 3 Nov 2021 18:24:42 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211103182442.4ded4376@bootlin.com>
In-Reply-To: <20211103164701.13a2973d@windsurf>
References: <20211103073656.1689919-1-herve.codina@bootlin.com>
 <20211103073656.1689919-3-herve.codina@bootlin.com>
 <20211103164701.13a2973d@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/5] package/ulog: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiBXZWQsIDMgTm92IDIwMjEgMTY6NDc6MDEgKzAxMDAKVGhvbWFzIFBldGF6em9uaSA8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cgo+IE9uIFdlZCwgIDMgTm92IDIw
MjEgMDg6MzY6NTMgKzAxMDAKPiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNv
bT4gd3JvdGU6Cj4gCj4gPiArVUxPR19WRVJTSU9OID0gMDM4OWQyNDMzNTIyNTVmNjE4MjMyNmRj
Y2RhZTNkNTZkYWRjMDc4Zgo+ID4gK1VMT0dfU0lURSA9ICQoY2FsbCBnaXRodWIsUGFycm90LURl
dmVsb3BlcnMsdWxvZywkKFVMT0dfVkVSU0lPTikpCj4gPiArVUxPR19MSUNFTlNFID0gQXBhY2hl
LTIuMAo+ID4gK1VMT0dfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiA+ICtVTE9HX0RFUEVOREVO
Q0lFUyA9IGhvc3QtYWxjaGVteQo+ID4gK1VMT0dfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gPiAr
Cj4gPiArZGVmaW5lIFVMT0dfQlVJTERfQ01EUwo+ID4gKwkkKEFMQ0hFTVlfVEFSR0VUX0NPTkZJ
R1VSRV9FTlYpIFwKPiA+ICsJJChBTENIRU1ZX01BS0UpIGxpYnVsb2cgIAo+IAo+IFBsZWFzZSBp
bmRlbnQgdGhlIGNvbnRpbnVhdGlvbiBsaW5lLgoKV2lsbCBiZSBkb25lIGluIHYyLgoKPiAKPiA+
ICtkZWZpbmUgVUxPR19JTlNUQUxMX1NUQVRJQ19MSUJTCj4gPiArCSQoSU5TVEFMTCkgLW0gNjQ0
ICQoQEQpL2FsY2hlbXktb3V0L3N0YWdpbmcvdXNyL2xpYi9saWJ1bG9nLmEgJChzdHJpcCAkKDEp
KS91c3IvbGliLwo+ID4gK2VuZGVmICAKPiAKPiBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIHdlIG5l
ZWQgdG8gJChzdHJpcCAuLi4pIHRoZSAkKDEpIGFyZ3VtZW50IGhlcmUKPiBhbmQgaW4gb3RoZXIg
bWFjcm9zLiBXZSBoYXZlIHNldmVyYWwgb3RoZXIgcGxhY2VzIGluIEJ1aWxkcm9vdCBmb3IKPiBz
aW1pbGFyIHNpdHVhdGlvbnMgd2hlcmUgd2UgZG9uJ3Qgc3RyaXAgJCgxKS4gKE5vdGU6IHRoaXMg
aXMgbm90IGEgdmVyeQo+IGltcG9ydGFudCBjb21tZW50LikKCkkgd2lsbCByZW1vdmUgdGhpcyBr
aW5kIG9mICQoc3RyaXAgLi4uKSBpbiB2Mi4KCj4gCj4gVGhhbmtzLAo+IAo+IFRob21hcwoKVGhh
bmtzIGZyIHRoZSByZXZpZXcuCgpIZXJ2w6kKCi0tIApIZXJ2w6kgQ29kaW5hLCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
