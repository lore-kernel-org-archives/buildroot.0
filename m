Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14994C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 16:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89AF561367;
	Sun,  7 May 2023 16:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89AF561367
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KfaOBTtJoD3S; Sun,  7 May 2023 16:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92B1360C33;
	Sun,  7 May 2023 16:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92B1360C33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D76501BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFDAB41780
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFDAB41780
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tS_5R8A6SB88 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 16:53:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F06C64016D
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F06C64016D
 for <buildroot@buildroot.org>; Sun,  7 May 2023 16:53:46 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MYNaE-1phtt13vm6-00VN5y; Sun, 07
 May 2023 18:53:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 18:53:35 +0200
Message-Id: <20230507165340.42151-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:+xJJlUnG/iDDovGvGWVEpihEV2EOV2HYMbVLKz2/Q2gUGpbkLJ9
 dXgYM+OQpoiZQZ+qwZ0VIDhyvpi6RfvptC9rV6NAyQoOV5WNV5BE1bwZiyHoQXXXLZOvIdH
 4TWCDF44REwGy2ZYvmmBReLFkK19P/SpWZPYB0jTkRD8pMrpodZ7ZjctmbATKFDfxoD7WvZ
 FR/RzX6lafKFJDOvWzqnA==
UI-OutboundReport: notjunk:1;M01:P0:OS595q4u8Pk=;49tsWU+5ihCWNp4y7+DOtHxCVut
 YSVM3LYZbWlK5bXmLm3emc9zT+KKK0m/1ez6G0F7R3qn0bnqCLKQdJA1pUoRpxxgHX4Xfph2i
 n3mLvjAekxQPCuG0BiFO1u21eIXW7YqaqeLAnUVTTOP6XORCahCXSwlmbPCj59Lfzhx0jqHJM
 1N70WysnZeClh4b5iw1jJLbKacIKoxYrZVUFIf7Bq/6VJcKLyjiV82IMvQEQJrUfWTcsBY29r
 EAynOmhZmcs20U/sBIB/vAuOk8c9bGsJifZhoh+5EtnofwFp0ipCtaRl7BCgC4SM3fCx/KCSq
 z42jUs7iSTifesNL6+1eQKO4Be2ayWfj6aplapgfSCGOoRNPZAVLc6uLHKqoL4YB0uchPj+kI
 ndbJk1C5l4B3kY2eOK1MfSLUphwD8fo2OBOs1jAnXgOh0aHSidWvCz/pBiavJkQHoWLw7FE15
 N1Bb1A1uP/6xTjTdxC5wO20otV3thaujbR2FUTJ2+jaP6Zdeo4q34hPc/jkRXJu/DkNyDoExD
 Hc6oQ0ISAqAlu2YMUumULHjvuRLmNIvZKdjyiCR2j0JWBB7oRl76G1VcDpA/Oy9LQ009EMuzC
 JWEj1MAxpgR7G2OhMMo9i8wpA4/+6J8iT3ZNHUUCdf/4CKvi57xBxQqp1dr+cCOyieDwWVip6
 KjRICp9qIiraJRD5HdYvRr/di4ie/TCQbPXNKwlHww==
Subject: [Buildroot] [PATCH v12 0/5] package: add petitboot to use with
 qemu-system-m68k
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cWVtdS1zeXN0ZW0tbTY4ayBoYXMgaW50cm9kdWNlZCBpbiB2Ni4wIGEgbmV3IHB1cmUgdmlydHVh
bCBtYWNoaW5lCnRoYXQgaXMgbm93IHN1cHBvcnRlZCBieSBsaW51eCB2NS4xOS4KClRoZSBnb2Fs
IG9mIHRoaXMgc2VyaWVzIGlzIHRvIHByb3ZpZGUgcGV0aXRib290IGFzIGFuIGVtYmVkZGVkIGJv
b3Rsb2FkZXIKZm9yIGl0IChsaWtlIGl0IGlzIGZvciB0aGUgSUJNIFBPV0VSIG1hY2hpbmUpLgoK
WW91IGNhbiB0ZXN0IGl0IHdpdGg6CgogIHFlbXUtc3lzdGVtLW02OGsgLU0gdmlydCAta2VybmVs
IGltYWdlcy92bWxpbnV4IFwKICAgICAgICAgICAgICAgICAgIC1pbml0cmQgaW1hZ2VzL3Jvb3Rm
cy5jcGlvLnh6IFwKICAgICAgICAgICAgICAgICAgIC1hcHBlbmQgImNvbnNvbGU9dHR5R0YwIiAt
LW5vZ3JhcGhpYwoKU2lnbmVkLW9mZi1ieTogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVy
LmV1PgoKdjEyOgogIC0gcmViYXNlCiAgLSBmaXggc2hlbGxjaGVjayB3YXJuaW5nIChVcHN0cmVh
bTogYW5kIHNoZWxsIHN5bnRheCBlcnJvcikKCnYxMToKIC0gcmViYXNlIG9uIHRvcCBvZiBwZXRp
dGJvb3QgbWVyZ2VkIHBhY2thZ2UKIC0gYWRkIHBiLWRpc2NvdmVyIGRhZW1vbgogLSBzdGFydCBw
ZXRpdGJvb3Qgb24gYWxsIHR0eSwgZGlzYWJsZSBnZW5lcmljIGdldHR5CiAtIGZpeCBrZXhlYyBi
dWlsZCBvbiBtNjhrIHdpdGggdWNsaWJjCiAtIHVzZSBwb3dlcm9mZiBpbiB0aGUgdGVzdCBzY3Jp
cHQgKGFzIHdlIGhhdmUgaW5pdCBub3cpCiAtIHJlbW92ZSBUaG9tYXMnIFJiLCBhcyB0aGVyZSB3
ZXJlIHNvbWUgY2hhbmdlcwogLSBDSTogaHR0cHM6Ly9naXRsYWIuY29tL2xhdXJlbnRfdml2aWVy
L2J1aWxkcm9vdC8tL3BpcGVsaW5lcy84NDQ5MTczNjgKCnYxMDoKICAtIHNldCBQRVRJVEJPT1Rf
TElDRU5TRSB0byBHUEwtMi4wCgp2OToKICAtIHJlbW92ZSBkZXBlbmRlbmN5IG9uIEJSMl9QQUNL
QUdFX1BTM19VVElMUwogIC0gQWRkIFRob21hcycgUmIKICAtIHJlYmFzZQoKdjg6CiAgLSB1c2Ug
bGludXguZnJhZ21lbnQgcmF0aGVyIHRoYW4gbGludXguY29uZmlnCiAgLSByZWJhc2UKCnY3Ogog
IC0gc2V0IEJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xOT15CiAgLSBm
aXggZXJyb3JzIHJlcG9ydGVkIGJ5IGNoZWNrLXBhY2thZ2UKICAtIGFkZCBnaXRsYWIgdGVzdGlu
ZyAoQ8OpZHJpYykKICAtIHVwZGF0ZSBib290LXFlbXUtaW1hZ2UucHkgdG8gc3VwcG9ydCBwZXRp
dGJvb3QKCnY2OgogIC0gcmViYXNlCgp2NToKICAtIHJlbW92ZSBCUjJfQ0NBQ0hFX0RJUiwgQlIy
X1BBQ0tBR0VfRFRDIGFuZCBCUjJfUEFDS0FHRV9EVENfUFJPR1JBTVMKCnY0OgogIC0gYWRkcmVz
cyBUaG9tYXMnIGNvbW1lbnRzCiAgLSByZW1vdmUgcGV0aXRib290LW10ZCBjb25maWcgYXMgbGli
Zmxhc2ggaXMgbm90IGF2YWlsYWJsZQoKdjM6IHYyOiB2MToKICAtIGZpcnN0IHZlcnNpb24sIEkg
bWVzc2VkIHVwIHdpdGggbGlzdCBzdWJzY3JpcHRpb24gYW5kIGdpdC1wdWJsaXNoLi4uCgpMYXVy
ZW50IFZpdmllciAoNSk6CiAga2V4ZWM6IGZpeCBzeXMvcmFuZG9tLmggd2l0aCB1Y2xpYmMKICBw
ZXRpdGJvb3Q6IGFkZCBwYi1kaXNjb3ZlciBkYWVtb24KICBwZXRpdGJvb3Q6IHN0YXJ0IHBldGl0
Ym9vdCBvbiBhbGwgdHR5CiAgYm9hcmQvcWVtdS9tNjhrLXZpcnQ6IEFkZCB2aXJ0LW02OGsgbGlu
dXggY29uZmlnCiAgc3VwcG9ydC9zY3JpcHRzL2Jvb3QtcWVtdS1pbWFnZS5weTogbWFuYWdlIHBl
dGl0Ym9vdCBpbnRlcmZhY2UKCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArCiBib2FyZC9xZW11L202OGstdmlydC9saW51eC5mcmFnbWVudCAgICAg
ICAgICAgfCAyMSArKysrKysrKwogYm9hcmQvcWVtdS9tNjhrLXZpcnQvcmVhZG1lLnR4dCAgICAg
ICAgICAgICAgIHwgIDUgKysKIGNvbmZpZ3MvcWVtdV9tNjhrX3ZpcnRfcGV0aXRib290X2RlZmNv
bmZpZyAgICB8IDI5ICsrKysrKysrKysKIC4uLjEtbTY4ay1maXgtZ2V0cmFuZG9tLXVzZS13aXRo
LXVjbGliYy5wYXRjaCB8IDM2ICsrKysrKysrKysrKysKIHBhY2thZ2UvcGV0aXRib290L1MxNXBi
LWRpc2NvdmVyICAgICAgICAgICAgICB8IDU0ICsrKysrKysrKysrKysrKysrKysKIHBhY2thZ2Uv
cGV0aXRib290L3BldGl0Ym9vdC1jb25zb2xlLXVpLnJ1bGVzICB8ICA1ICsrCiBwYWNrYWdlL3Bl
dGl0Ym9vdC9wZXRpdGJvb3QubWsgICAgICAgICAgICAgICAgfCAgOCArKysKIHBhY2thZ2UvcGV0
aXRib290L3N5c2N0bC5jb25mICAgICAgICAgICAgICAgICB8ICAxICsKIHN1cHBvcnQvc2NyaXB0
cy9ib290LXFlbXUtaW1hZ2UucHkgICAgICAgICAgICB8ICA4ICsrLQogc3lzdGVtL0NvbmZpZy5p
biAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDExIGZpbGVzIGNoYW5nZWQs
IDE2OCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJv
YXJkL3FlbXUvbTY4ay12aXJ0L2xpbnV4LmZyYWdtZW50CiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9h
cmQvcWVtdS9tNjhrLXZpcnQvcmVhZG1lLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3Mv
cWVtdV9tNjhrX3ZpcnRfcGV0aXRib290X2RlZmNvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2Uva2V4ZWMvMDAwMS1tNjhrLWZpeC1nZXRyYW5kb20tdXNlLXdpdGgtdWNsaWJjLnBhdGNo
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3QvUzE1cGItZGlzY292ZXIKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QtY29uc29sZS11aS5y
dWxlcwogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L3N5c2N0bC5jb25mCgot
LSAKMi40MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
