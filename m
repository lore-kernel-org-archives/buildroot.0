Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B592CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 10:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32FCD61513;
	Fri, 13 Oct 2023 10:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32FCD61513
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHXo4341nzuX; Fri, 13 Oct 2023 10:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61AEC61504;
	Fri, 13 Oct 2023 10:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61AEC61504
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCC981BF349
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A31A482C3C
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A31A482C3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jCkU13bRzmHF for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 10:24:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 431AE82BF4
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 10:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 431AE82BF4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DBEB1C0003;
 Fri, 13 Oct 2023 10:24:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrFL3-0073WF-RE; Fri, 13 Oct 2023 12:24:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221004125242.136925-1-kory.maincent@bootlin.com>
 <20231001110422.0810c899@windsurf>
Date: Fri, 13 Oct 2023 12:24:13 +0200
In-Reply-To: <20231001110422.0810c899@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 1 Oct 2023 11:04:22 +0200")
Message-ID: <87r0ly6cs2.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
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
Cc: =?utf-8?Q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gSGVsbG8gS8O2cnksCiA+IE9uIFR1ZSwgIDQg
T2N0IDIwMjIgMTQ6NTI6NDEgKzAyMDAKID4gS8O2cnkgTWFpbmNlbnQgdmlhIGJ1aWxkcm9vdCA8
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKID4+IEZyb206IEtvcnkgTWFpbmNlbnQg
PGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+CiA+PiAKID4+IFRoZSB0b29sY2hhaW4gd3JhcHBl
ciBhZGQgYXV0b21hdGljYWxseSBQb3NpdGlvbiBJbmRlcGVuZGVudCBFeGVjdXRpb24KID4+IGFu
ZCBzdGFjayBwcm90ZWN0b3IgZmxhZ3MgaW4gdGhlIGJ1aWxkIHByb2Nlc3Mgd2hlbiBzZWxlY3Rl
ZCBpbiB0aGUKID4+IGNvbmZpZ3VyYXRpb24uIGF0OTFib290c3RyYXAgZG9lcyBub3Qgc3VwcG9y
dCB0aGVzZSwgdGhlcmVmb3JlIEkgYWRkZWQgYQogPj4gcGF0Y2ggdG8gZGlzYWJsZSB0aGVtIGlu
IHRoZSBNYWtlZmlsZXMKID4+IAogPj4gU2lnbmVkLW9mZi1ieTogS29yeSBNYWluY2VudCA8a29y
eS5tYWluY2VudEBib290bGluLmNvbT4KID4+IC0tLQogPj4gLi4uY2stcHJvdGVjdG9yLWFuZC10
aGUtUElFLWJ1aWxkLWZsYWdzLnBhdGNoIHwgNTAyICsrKysrKysrKysrKysrKysrKwogPj4gMSBm
aWxlIGNoYW5nZWQsIDUwMiBpbnNlcnRpb25zKCspCiA+PiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9v
dC9hdDkxYm9vdHN0cmFwLzAwMDQtZW5zdXJlLXRoZS1zdGFjay1wcm90ZWN0b3ItYW5kLXRoZS1Q
SUUtYnVpbGQtZmxhZ3MucGF0Y2gKCiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLiBIb3dldmVyLCB0
aGUgYXQ5MWJvb3RzdHJhcCBwYXRjaCB3YXMgaGlnaGx5CiA+IHJlcGV0aXRpdmUsIGFuZCB3ZSBo
YXZlIG5vIGNoYW5jZSBvZiBtZXJnaW5nIGl0IHVwc3RyZWFtIHNpbmNlIHVwc3RyZWFtCiA+IGlz
IGVzc2VudGlhbGx5IGRlYWQuIFNvIGluc3RlYWQsIEkgY29tbWl0dGVkIHRoaXM6CgogPiArIyBU
aGUgYXQ5MWJvb3RzdHJhcCBNYWtlZmlsZSBkb2Vzbid0IHN1cHBvcnQgY3VzdG9taXppbmcKID4g
KyMgQ0ZMQUdTL0xERkxBR1MsIHNvIHdlIGNoZWF0IGFuZCBwYXNzIG91ciBjdXN0b20gZmxhZ3Mg
dGhyb3VnaCBDQyBhbmQKID4gKyMgTEQuCiA+ICBkZWZpbmUgQVQ5MUJPT1RTVFJBUF9CVUlMRF9D
TURTCiA+IC0gICAgICAgJChNQUtFMSkgQ1JPU1NfQ09NUElMRT0kKFRBUkdFVF9DUk9TUykgLUMg
JChARCkvJChBVDkxQk9PVFNUUkFQX01BS0VfU1VCRElSKQogPiArICAgICAgICQoTUFLRTEpIENS
T1NTX0NPTVBJTEU9JChUQVJHRVRfQ1JPU1MpIFwKID4gKyAgICAgICAgICAgICAgIENDPSIkKFRB
UkdFVF9DQykgLWZuby1zdGFjay1wcm90ZWN0b3IiIFwKID4gKyAgICAgICAgICAgICAgIExEPSIk
KFRBUkdFVF9DQykgLWZuby1QSUUiIFwKID4gKyAgICAgICAgICAgICAgIC1DICQoQEQpLyQoQVQ5
MUJPT1RTVFJBUF9NQUtFX1NVQkRJUikKID4gIGVuZGVmCgogPiB3aGljaCBhY2hpZXZlcyBleGFj
dGx5IHRoZSBzYW1lLCBidXQgaXMgbW9yZSBjb25jaXNlLgoKQ29tbWl0dGVkIHRvIDIwMjMuMDIu
eCBhbmQgMjAyMy4wOC54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
