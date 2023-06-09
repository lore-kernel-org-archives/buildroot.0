Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86DAC7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 11:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F4BF60AC0;
	Fri,  9 Jun 2023 11:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F4BF60AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GCakioZAY0ai; Fri,  9 Jun 2023 11:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2946C615B9;
	Fri,  9 Jun 2023 11:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2946C615B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EA841BF37F
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 11:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB525424B1
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 11:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB525424B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxeUflDSWlSK for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 11:30:37 +0000 (UTC)
X-Greylist: delayed 00:05:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E10A424B0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E10A424B0
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 11:30:36 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MCKO4-1qFry20dMo-009M0T; Fri, 09
 Jun 2023 13:25:24 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 13:25:18 +0200
Message-Id: <20230609112522.97790-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:6Nt3N/CaKlv3viW+W5DDKYgEWz0dTVd5VBTDfVL0MebSBGje+IF
 2F2um7qWeKIIEfIt75rYWw/dYdXNcYfu0gXpA7+PKCfdyjmbBut7Tw7uEjL/9j2/4quIVmx
 TeIvx53tTMvwjfBZSA/f+5DxU/4cTe9Gykq3HaDaMzWk/il397BCT7QtP0TtmKeqgfeqkwi
 imUM03/7PEjCkQaWllj6Q==
UI-OutboundReport: notjunk:1;M01:P0:oKD7WhWQbJ4=;g2/uh4GDwyqaZdXIbq9iRaudOHW
 GJlyFQu15+tlKBDivLe1dtKU1RKB6zv1hjfc+3SHpnje6TYZaEDsPjWkGl4zQUyTnvgZm1zrp
 6IjazEtwqGMV95ivQrloHVff54tvgZ+5hV2sNcEfUniT1aJ6rce31aL8mtvj9tHL+/UCAVxd8
 ikCV6YINsLXmb7WXISKxzCWey0bO8qVw6da7fFtbs9pJO3O1ezn7jLxp3NC6lppq2pNl4O+SK
 ZsCUzWVKE/Y7tzkoAXNYxS5X2IMGUNlpG0NJYEWNCbSEqEkXqBuRQtylNDhHcL2F1xmVq2Mye
 OFK8NixSuovn8Hde0eULrHylRpMmO5+rzDiyiMIJMDz22oUbYqi6Y8vVyfTjORo4nILaq3I2f
 UyYWAEgN49WuwTJkpK/aJbY9o8BtiDMH0NoghPrDS2wkz3nUNtQ3u8W7KZaETpvqulCNZkPeW
 PQFaes9s5iw8BjTj8JQfba32v05U5CPGE2wzTW5siDnHuJUvB5SvR2un10twsBLrD3oHOsOnU
 bL9f9J2tHvgOw9IGEIgmrSiPDczVBnwucix8QH/+rO6JJQ92eVrDy5Gkj6wzp4jdhj0IJDrEH
 sf/ZIsVpve/QaPzikXXK8h66zFHuzsdGV509sx2LIM8/T+o/9jk9MP0ntmFc7qOTp5ATyFuKg
 GJiGIZ5U0TldhOaTAyAl6mW30lVHpNvSr+bLgSW+eg==
Subject: [Buildroot] [PATCH v13 0/4] package: add petitboot to use with
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
LmV1PgoKdjEzOgogIC0gcmViYXNlCiAgLSBDSTogaHR0cHM6Ly9naXRsYWIuY29tL2xhdXJlbnRf
dml2aWVyL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy84OTM0MTY3NDEKCnYxMjoKICAtIHJlYmFzZQog
IC0gZml4IHNoZWxsY2hlY2sgd2FybmluZyAoVXBzdHJlYW06IGFuZCBzaGVsbCBzeW50YXggZXJy
b3IpCgp2MTE6CiAtIHJlYmFzZSBvbiB0b3Agb2YgcGV0aXRib290IG1lcmdlZCBwYWNrYWdlCiAt
IGFkZCBwYi1kaXNjb3ZlciBkYWVtb24KIC0gc3RhcnQgcGV0aXRib290IG9uIGFsbCB0dHksIGRp
c2FibGUgZ2VuZXJpYyBnZXR0eQogLSBmaXgga2V4ZWMgYnVpbGQgb24gbTY4ayB3aXRoIHVjbGli
YwogLSB1c2UgcG93ZXJvZmYgaW4gdGhlIHRlc3Qgc2NyaXB0IChhcyB3ZSBoYXZlIGluaXQgbm93
KQogLSByZW1vdmUgVGhvbWFzJyBSYiwgYXMgdGhlcmUgd2VyZSBzb21lIGNoYW5nZXMKIC0gQ0k6
IGh0dHBzOi8vZ2l0bGFiLmNvbS9sYXVyZW50X3Zpdmllci9idWlsZHJvb3QvLS9waXBlbGluZXMv
ODQ0OTE3MzY4Cgp2MTA6CiAgLSBzZXQgUEVUSVRCT09UX0xJQ0VOU0UgdG8gR1BMLTIuMAoKdjk6
CiAgLSByZW1vdmUgZGVwZW5kZW5jeSBvbiBCUjJfUEFDS0FHRV9QUzNfVVRJTFMKICAtIEFkZCBU
aG9tYXMnIFJiCiAgLSByZWJhc2UKCnY4OgogIC0gdXNlIGxpbnV4LmZyYWdtZW50IHJhdGhlciB0
aGFuIGxpbnV4LmNvbmZpZwogIC0gcmViYXNlCgp2NzoKICAtIHNldCBCUjJfUEFDS0FHRV9IT1NU
X0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTk9eQogIC0gZml4IGVycm9ycyByZXBvcnRlZCBieSBj
aGVjay1wYWNrYWdlCiAgLSBhZGQgZ2l0bGFiIHRlc3RpbmcgKEPDqWRyaWMpCiAgLSB1cGRhdGUg
Ym9vdC1xZW11LWltYWdlLnB5IHRvIHN1cHBvcnQgcGV0aXRib290Cgp2NjoKICAtIHJlYmFzZQoK
djU6CiAgLSByZW1vdmUgQlIyX0NDQUNIRV9ESVIsIEJSMl9QQUNLQUdFX0RUQyBhbmQgQlIyX1BB
Q0tBR0VfRFRDX1BST0dSQU1TCgp2NDoKICAtIGFkZHJlc3MgVGhvbWFzJyBjb21tZW50cwogIC0g
cmVtb3ZlIHBldGl0Ym9vdC1tdGQgY29uZmlnIGFzIGxpYmZsYXNoIGlzIG5vdCBhdmFpbGFibGUK
CnYzOiB2MjogdjE6CiAgLSBmaXJzdCB2ZXJzaW9uLCBJIG1lc3NlZCB1cCB3aXRoIGxpc3Qgc3Vi
c2NyaXB0aW9uIGFuZCBnaXQtcHVibGlzaC4uLgoKTGF1cmVudCBWaXZpZXIgKDQpOgogIHBldGl0
Ym9vdDogYWRkIHBiLWRpc2NvdmVyIGRhZW1vbgogIHBldGl0Ym9vdDogc3RhcnQgcGV0aXRib290
IG9uIGFsbCB0dHkKICBib2FyZC9xZW11L202OGstdmlydDogQWRkIHZpcnQtbTY4ayBsaW51eCBj
b25maWcKICBzdXBwb3J0L3NjcmlwdHMvYm9vdC1xZW11LWltYWdlLnB5OiBtYW5hZ2UgcGV0aXRi
b290IGludGVyZmFjZQoKIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDIgKwogYm9hcmQvcWVtdS9tNjhrLXZpcnQvbGludXguZnJhZ21lbnQgICAgICAgICAg
fCAyMSArKysrKysrKwogYm9hcmQvcWVtdS9tNjhrLXZpcnQvcmVhZG1lLnR4dCAgICAgICAgICAg
ICAgfCAgNSArKwogY29uZmlncy9xZW11X202OGtfdmlydF9wZXRpdGJvb3RfZGVmY29uZmlnICAg
fCAyOSArKysrKysrKysrKwogcGFja2FnZS9wZXRpdGJvb3QvUzE1cGItZGlzY292ZXIgICAgICAg
ICAgICAgfCA1NCArKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRi
b290LWNvbnNvbGUtdWkucnVsZXMgfCAgNSArKwogcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290
Lm1rICAgICAgICAgICAgICAgfCAgOCArKysKIHBhY2thZ2UvcGV0aXRib290L3N5c2N0bC5jb25m
ICAgICAgICAgICAgICAgIHwgIDEgKwogc3VwcG9ydC9zY3JpcHRzL2Jvb3QtcWVtdS1pbWFnZS5w
eSAgICAgICAgICAgfCAgOCArKy0KIHN5c3RlbS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKy0KIDEwIGZpbGVzIGNoYW5nZWQsIDEzMiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3FlbXUvbTY4ay12aXJ0L2xp
bnV4LmZyYWdtZW50CiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvcWVtdS9tNjhrLXZpcnQvcmVh
ZG1lLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3MvcWVtdV9tNjhrX3ZpcnRfcGV0aXRi
b290X2RlZmNvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L1MxNXBi
LWRpc2NvdmVyCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290
LWNvbnNvbGUtdWkucnVsZXMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BldGl0Ym9vdC9z
eXNjdGwuY29uZgoKLS0gCjIuNDAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
