Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85819C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 15:41:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA2D161246
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 15:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA2D161246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A40B8400C5;
	Tue, 28 Sep 2021 15:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDDzD9CuHtRY; Tue, 28 Sep 2021 15:41:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72A5B40105;
	Tue, 28 Sep 2021 15:41:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 910401BF681
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 15:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8038D40701
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 15:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-V5qun051Nl for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 15:40:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D535403E2
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 15:40:58 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 19E0224000D;
 Tue, 28 Sep 2021 15:40:56 +0000 (UTC)
Date: Tue, 28 Sep 2021 17:40:56 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210928174056.5270c2e8@bootlin.com>
In-Reply-To: <20210928105135.651ca5a2@windsurf>
References: <20210928082328.1466348-1-herve.codina@bootlin.com>
 <20210928105135.651ca5a2@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dtbocfg: new package
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

SGVsbG8gVGhvbWFzLAoKT24gVHVlLCAyOCBTZXAgMjAyMSAxMDo1MTozNSArMDIwMApUaG9tYXMg
UGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gPiAtLS0g
L2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdlL2R0Ym9jZmcvQ29uZmlnLmluCj4gPiBAQCAtMCww
ICsxLDkgQEAKPiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfRFRCT0NGRwo+ID4gKwlib29sICJkdGJv
Y2ZnIgo+ID4gKwloZWxwCj4gPiArCSAgZHRib2NmZywgd2hpY2ggc3RhbmRzIGZvciBEZXZpY2Ug
VHJlZSBCbG9iIE92ZXJsYXkgQ29uZmlndXJhdGlvbgo+ID4gKyAgICAgICAgICBGaWxlIFN5c3Rl
bSwgd2FzIGRldmVsb3BlZCB0byBzZXJ2ZSBhcyBhIHVzZXJzcGFjZSBBUEkgb2YgRGV2aWNlCj4g
PiArICAgICAgICAgIFRyZWUgT3ZlcmxheS4gIAo+IAo+IFRoZXJlIGlzIGFuIGluZGVudGF0aW9u
IGlzc3VlIGhlcmUuIFRoZSBjb250aW51YXRpb24gbGluZXMgc2hvdWxkIGFsc28KPiBoYXZlIGEg
b25lIHRhYiArIDIgc3BhY2VzIGluZGVudGF0aW9uLiBJIGd1ZXNzIHRoaXMgaXMgcHJvYmFibHkK
PiByZXBvcnRlZCBieSAibWFrZSBjaGVjay1wYWNrYWdlIi4KCkluZGVlZCwgd2lsbCBiZSBmaXhl
ZCBpbiB2Mi4KCj4gCj4gPiArRFRCT0NGR19WRVJTSU9OID0gdjAuMC45Cj4gPiArRFRCT0NGR19T
SVRFID0gJChjYWxsIGdpdGh1Yixpa3d6bSxkdGJvY2ZnLCQoRFRCT0NGR19WRVJTSU9OKSkgIAo+
IAo+IFRoaXMgc2hvdWxkIGJlOgo+IAo+IERUQk9DRkdfVkVSU0lPTiA9IDAuMC45Cj4gRFRCT0NG
R19TSVRFID0gJChjYWxsIGdpdGh1Yixpa3d6bSxkdGJvY2ZnLHYkKERUQk9DRkdfVkVSU0lPTikp
Cj4gCj4gSW5kZWVkLCB3ZSBkb24ndCB3YW50IHRoZSAidiIgcHJlZml4IHRvIGFwcGVhciBpbiB0
aGUgdmVyc2lvbiwgc28gdGhhdAo+IHRoZSB2ZXJzaW9uIGNhbiBtYXRjaCB3aXRoIHdoYXQgcmVs
ZWFzZS1tb25pdG9yaW5nLm9yZyByZXBvcnRzLgo+IAoKUmlnaHQsIHdpbGwgYmUgZml4ZWQgaW4g
djIuCgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LAoKSGVydsOpCgotLSAKSGVydsOpIENvZGluYSwg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
