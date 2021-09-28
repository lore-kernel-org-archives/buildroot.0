Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41D4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 08:51:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70C6960EFF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 08:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70C6960EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3627A4020C;
	Tue, 28 Sep 2021 08:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vy-yUm6KWEVc; Tue, 28 Sep 2021 08:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CA834018D;
	Tue, 28 Sep 2021 08:51:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D1BD1BF298
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 08:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49D2C40406
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 08:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBQZrPDjea0N for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 08:51:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FA2D40405
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 08:51:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id CC4AA200006;
 Tue, 28 Sep 2021 08:51:35 +0000 (UTC)
Date: Tue, 28 Sep 2021 10:51:35 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20210928105135.651ca5a2@windsurf>
In-Reply-To: <20210928082328.1466348-1-herve.codina@bootlin.com>
References: <20210928082328.1466348-1-herve.codina@bootlin.com>
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

SGVsbG8gSGVydsOpLAoKVGhhbmtzIGZvciB0aGlzIHBhdGNoLiBUd28gc21hbGwgY29tbWVudHMg
YmVsb3cuCgpPbiBUdWUsIDI4IFNlcCAyMDIxIDEwOjIzOjI4ICswMjAwCkhlcnZlIENvZGluYSA8
aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
ZHRib2NmZy9Db25maWcuaW4gYi9wYWNrYWdlL2R0Ym9jZmcvQ29uZmlnLmluCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4xZTZjZTM5NTJkCj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL3BhY2thZ2UvZHRib2NmZy9Db25maWcuaW4KPiBAQCAtMCwwICsxLDkgQEAKPiAr
Y29uZmlnIEJSMl9QQUNLQUdFX0RUQk9DRkcKPiArCWJvb2wgImR0Ym9jZmciCj4gKwloZWxwCj4g
KwkgIGR0Ym9jZmcsIHdoaWNoIHN0YW5kcyBmb3IgRGV2aWNlIFRyZWUgQmxvYiBPdmVybGF5IENv
bmZpZ3VyYXRpb24KPiArICAgICAgICAgIEZpbGUgU3lzdGVtLCB3YXMgZGV2ZWxvcGVkIHRvIHNl
cnZlIGFzIGEgdXNlcnNwYWNlIEFQSSBvZiBEZXZpY2UKPiArICAgICAgICAgIFRyZWUgT3Zlcmxh
eS4KClRoZXJlIGlzIGFuIGluZGVudGF0aW9uIGlzc3VlIGhlcmUuIFRoZSBjb250aW51YXRpb24g
bGluZXMgc2hvdWxkIGFsc28KaGF2ZSBhIG9uZSB0YWIgKyAyIHNwYWNlcyBpbmRlbnRhdGlvbi4g
SSBndWVzcyB0aGlzIGlzIHByb2JhYmx5CnJlcG9ydGVkIGJ5ICJtYWtlIGNoZWNrLXBhY2thZ2Ui
LgoKPiArRFRCT0NGR19WRVJTSU9OID0gdjAuMC45Cj4gK0RUQk9DRkdfU0lURSA9ICQoY2FsbCBn
aXRodWIsaWt3em0sZHRib2NmZywkKERUQk9DRkdfVkVSU0lPTikpCgpUaGlzIHNob3VsZCBiZToK
CkRUQk9DRkdfVkVSU0lPTiA9IDAuMC45CkRUQk9DRkdfU0lURSA9ICQoY2FsbCBnaXRodWIsaWt3
em0sZHRib2NmZyx2JChEVEJPQ0ZHX1ZFUlNJT04pKQoKSW5kZWVkLCB3ZSBkb24ndCB3YW50IHRo
ZSAidiIgcHJlZml4IHRvIGFwcGVhciBpbiB0aGUgdmVyc2lvbiwgc28gdGhhdAp0aGUgdmVyc2lv
biBjYW4gbWF0Y2ggd2l0aCB3aGF0IHJlbGVhc2UtbW9uaXRvcmluZy5vcmcgcmVwb3J0cy4KCj4g
ZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZHRib2NmZy5w
eSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZHRib2NmZy5weQo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZDI1YjE2OTJiNAo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2R0Ym9jZmcu
cHkKCkdyZWF0LCBhIHRlc3QgY2FzZSEKCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFz
IFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
