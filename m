Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBA7E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 09:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9439E41CA0;
	Sun,  1 Oct 2023 09:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9439E41CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXNiLaIyKmpU; Sun,  1 Oct 2023 09:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFD4F41CBF;
	Sun,  1 Oct 2023 09:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFD4F41CBF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A84951BF32E
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81BFD61232
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81BFD61232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id spECd_4MLHJg for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 09:04:26 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05D0A6106B
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 09:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05D0A6106B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0702D40003;
 Sun,  1 Oct 2023 09:04:22 +0000 (UTC)
Date: Sun, 1 Oct 2023 11:04:22 +0200
To: =?UTF-8?B?S8O2cnk=?= Maincent via buildroot <buildroot@buildroot.org>
Message-ID: <20231001110422.0810c899@windsurf>
In-Reply-To: <20221004125242.136925-1-kory.maincent@bootlin.com>
References: <20221004125242.136925-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696151063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+viKbw/7lX7PkKhxjurD7W2CuRehOvUAI1H4JhduiY=;
 b=L4cbxo28celBQ315LzPtCJwgEMxP7RLi7EziOuGo8vZs36t5m1BW82mkdUGtzs8Md5y8Ko
 8CHdB6+pGnGrh1pGigPfbim6eiLvUCJXBf/VC+bUPJr5tSvCOsqFUjIlt0JFxwJe491fjg
 W0RBpBpcq7qgxUnbygwKQW02C35dNln8c/OQ2az82uly+bJylfzKD7iG5A6Bc5qfC0fPak
 Bkt7q0nRbzZ8vkVDwKRMDeOEessGolX4esl/JSRQ7YvUWUdM6SLpxgyQVBno2KsuvcOSOI
 rioAlXGTgg2z2AT24TIRVRVpDglVC02wXkwID3zg9Nf4RLQQV98I6vgVkzeG3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L4cbxo28
Subject: Re: [Buildroot] [PATCH] boot/at91bootstrap: disable PIE and
 stack-protector build flags
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gS8O2cnksCgpPbiBUdWUsICA0IE9jdCAyMDIyIDE0OjUyOjQxICswMjAwCkvDtnJ5IE1h
aW5jZW50IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4g
RnJvbTogS29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KPiAKPiBUaGUg
dG9vbGNoYWluIHdyYXBwZXIgYWRkIGF1dG9tYXRpY2FsbHkgUG9zaXRpb24gSW5kZXBlbmRlbnQg
RXhlY3V0aW9uCj4gYW5kIHN0YWNrIHByb3RlY3RvciBmbGFncyBpbiB0aGUgYnVpbGQgcHJvY2Vz
cyB3aGVuIHNlbGVjdGVkIGluIHRoZQo+IGNvbmZpZ3VyYXRpb24uIGF0OTFib290c3RyYXAgZG9l
cyBub3Qgc3VwcG9ydCB0aGVzZSwgdGhlcmVmb3JlIEkgYWRkZWQgYQo+IHBhdGNoIHRvIGRpc2Fi
bGUgdGhlbSBpbiB0aGUgTWFrZWZpbGVzCj4gCj4gU2lnbmVkLW9mZi1ieTogS29yeSBNYWluY2Vu
dCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KPiAtLS0KPiAgLi4uY2stcHJvdGVjdG9yLWFu
ZC10aGUtUElFLWJ1aWxkLWZsYWdzLnBhdGNoIHwgNTAyICsrKysrKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNTAyIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJv
b3QvYXQ5MWJvb3RzdHJhcC8wMDA0LWVuc3VyZS10aGUtc3RhY2stcHJvdGVjdG9yLWFuZC10aGUt
UElFLWJ1aWxkLWZsYWdzLnBhdGNoCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4gSG93ZXZlciwgdGhl
IGF0OTFib290c3RyYXAgcGF0Y2ggd2FzIGhpZ2hseQpyZXBldGl0aXZlLCBhbmQgd2UgaGF2ZSBu
byBjaGFuY2Ugb2YgbWVyZ2luZyBpdCB1cHN0cmVhbSBzaW5jZSB1cHN0cmVhbQppcyBlc3NlbnRp
YWxseSBkZWFkLiBTbyBpbnN0ZWFkLCBJIGNvbW1pdHRlZCB0aGlzOgoKKyMgVGhlIGF0OTFib290
c3RyYXAgTWFrZWZpbGUgZG9lc24ndCBzdXBwb3J0IGN1c3RvbWl6aW5nCisjIENGTEFHUy9MREZM
QUdTLCBzbyB3ZSBjaGVhdCBhbmQgcGFzcyBvdXIgY3VzdG9tIGZsYWdzIHRocm91Z2ggQ0MgYW5k
CisjIExELgogZGVmaW5lIEFUOTFCT09UU1RSQVBfQlVJTERfQ01EUwotICAgICAgICQoTUFLRTEp
IENST1NTX0NPTVBJTEU9JChUQVJHRVRfQ1JPU1MpIC1DICQoQEQpLyQoQVQ5MUJPT1RTVFJBUF9N
QUtFX1NVQkRJUikKKyAgICAgICAkKE1BS0UxKSBDUk9TU19DT01QSUxFPSQoVEFSR0VUX0NST1NT
KSBcCisgICAgICAgICAgICAgICBDQz0iJChUQVJHRVRfQ0MpIC1mbm8tc3RhY2stcHJvdGVjdG9y
IiBcCisgICAgICAgICAgICAgICBMRD0iJChUQVJHRVRfQ0MpIC1mbm8tUElFIiBcCisgICAgICAg
ICAgICAgICAtQyAkKEBEKS8kKEFUOTFCT09UU1RSQVBfTUFLRV9TVUJESVIpCiBlbmRlZgoKd2hp
Y2ggYWNoaWV2ZXMgZXhhY3RseSB0aGUgc2FtZSwgYnV0IGlzIG1vcmUgY29uY2lzZS4KClRoYW5r
cyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
