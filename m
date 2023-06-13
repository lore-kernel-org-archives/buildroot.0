Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA70C7EE2E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 10:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6755460EFA;
	Tue, 13 Jun 2023 10:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6755460EFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sq43PoxFf1MU; Tue, 13 Jun 2023 10:50:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7567660FCD;
	Tue, 13 Jun 2023 10:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7567660FCD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07ABB1BF2BE
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 10:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3A31410AF
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 10:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3A31410AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T89uGxFwk6OG for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 10:50:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19B5C409F2
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19B5C409F2
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 10:50:23 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M6UVr-1qBVVg0eIT-006zdF; Tue, 13
 Jun 2023 12:50:17 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 12:50:11 +0200
Message-Id: <20230613105015.739870-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:pwIZbOmYezaLydBqH131GjoV43qdYa6zR1dkfc8hj9CO8GO36IR
 Mp4h8ogogDlqtrw9KmESAqBh+IRztg+vy6VNaqGGZIfZ788+IU7eLUM1p2WJMOEyGIPccT+
 ykXTaqy8UseGwu9B6HLKS5xi7HUf3+UTf/z/NMDG9IBYrNSO9KEKDdiFf5ijbNjziPHYY3J
 SAVwsnkJqXRe1ijcClETQ==
UI-OutboundReport: notjunk:1;M01:P0:+ZRWZPYgrsM=;A1iBDb0A9aeJRR6+5ECKtULtUc0
 Qt6O7Y9lrSGXhCkLaRdIHbWBPN8E8vSX3AlAdGCw7RIhwMNCNUrmW2VrZRmmbp/naH7SDZCyZ
 e9dReHcRH9iq97/yTJfdkKTlrH9gU+JSoBeKGsE0EPBKyxO11ay/+4t2d63Ni+3mMAg+lp12E
 4ECqsguY7yNqc2YcXQJmpKJcC4VhOf57E9yVxuDHMMuSzB9IfSOQXLmZS1d+GOPAtTWsb1kLb
 Vn+ykhmAzHJg3/LYgH6cfAmYUVSitVMmrkqibn92e/U3e8GRMgz6I+byUSLlAg/6shdalAL85
 fNFROMpEvDACJEDIqqUVpxXKnjZ+WkefNjU5FFlkpqLzB0JjTKwJpfrbrfWMpcE4eHHjzcatS
 QlRhYyhCOSBPwySo4D9VpTJKhQ84Th8YlQb3NvqFn9MmV8OTBolopqyf3ucRARfJdhTO6Hs0n
 bLm4M3N1sBuT0am5Lx9/gHx2413GSNnOvhrYjZB0Rrk7Dc9epg1ly4dJWCRe05pObbJ3uISYc
 sgn8p7jCA2MgNJIkyRcNql4rJR9cpSk3m7glSh6Z3HHGkHIKrhwKh17uhr9F5V5Xj2HbpQBmB
 EtEFIAkrLFMonRNRrTy+Do8bYTJFQbrWGT6gBsy0ZqRGTVD68eCcWFhuwLNuTVov2YzYkbqLf
 WXnXiK8t8dge+UqUI7Q/1nzHZx0Ebi38y5HEkT1PPg==
Subject: [Buildroot] [PATCH v14 0/4] package: add petitboot to use with
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
LmV1PgoKdjE0OgogIC0gcmViYXNlCiAgLSBhZGQgQ8OpZHJpYydzIFJiCiAgLSBtb3ZlIGNvbmZp
Z3VyYXRpb24gY2hhbmdlIGZyb20gcGF0Y2ggNCB0byBwYXRjaCAzCiAgLSByZW1vdmUgY3VzdG9t
IGtlcm5lbAogIC0gQ0k6IGh0dHBzOi8vZ2l0bGFiLmNvbS9sYXVyZW50X3Zpdmllci9idWlsZHJv
b3QvLS9waXBlbGluZXMvODk4MTAwMDU3CiAgLSBDSTogaHR0cHM6Ly9naXRsYWIuY29tL2xhdXJl
bnRfdml2aWVyL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy84OTgxMDAyMzYKCnYxMzoKICAtIHJlYmFz
ZQogIC0gQ0k6IGh0dHBzOi8vZ2l0bGFiLmNvbS9sYXVyZW50X3Zpdmllci9idWlsZHJvb3QvLS9w
aXBlbGluZXMvODkzNDE2NzQxCgp2MTI6CiAgLSByZWJhc2UKICAtIGZpeCBzaGVsbGNoZWNrIHdh
cm5pbmcgKFVwc3RyZWFtOiBhbmQgc2hlbGwgc3ludGF4IGVycm9yKQoKdjExOgogLSByZWJhc2Ug
b24gdG9wIG9mIHBldGl0Ym9vdCBtZXJnZWQgcGFja2FnZQogLSBhZGQgcGItZGlzY292ZXIgZGFl
bW9uCiAtIHN0YXJ0IHBldGl0Ym9vdCBvbiBhbGwgdHR5LCBkaXNhYmxlIGdlbmVyaWMgZ2V0dHkK
IC0gZml4IGtleGVjIGJ1aWxkIG9uIG02OGsgd2l0aCB1Y2xpYmMKIC0gdXNlIHBvd2Vyb2ZmIGlu
IHRoZSB0ZXN0IHNjcmlwdCAoYXMgd2UgaGF2ZSBpbml0IG5vdykKIC0gcmVtb3ZlIFRob21hcycg
UmIsIGFzIHRoZXJlIHdlcmUgc29tZSBjaGFuZ2VzCiAtIENJOiBodHRwczovL2dpdGxhYi5jb20v
bGF1cmVudF92aXZpZXIvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzg0NDkxNzM2OAoKdjEwOgogIC0g
c2V0IFBFVElUQk9PVF9MSUNFTlNFIHRvIEdQTC0yLjAKCnY5OgogIC0gcmVtb3ZlIGRlcGVuZGVu
Y3kgb24gQlIyX1BBQ0tBR0VfUFMzX1VUSUxTCiAgLSBBZGQgVGhvbWFzJyBSYgogIC0gcmViYXNl
Cgp2ODoKICAtIHVzZSBsaW51eC5mcmFnbWVudCByYXRoZXIgdGhhbiBsaW51eC5jb25maWcKICAt
IHJlYmFzZQoKdjc6CiAgLSBzZXQgQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RP
TV81XzE5PXkKICAtIGZpeCBlcnJvcnMgcmVwb3J0ZWQgYnkgY2hlY2stcGFja2FnZQogIC0gYWRk
IGdpdGxhYiB0ZXN0aW5nIChDw6lkcmljKQogIC0gdXBkYXRlIGJvb3QtcWVtdS1pbWFnZS5weSB0
byBzdXBwb3J0IHBldGl0Ym9vdAoKdjY6CiAgLSByZWJhc2UKCnY1OgogIC0gcmVtb3ZlIEJSMl9D
Q0FDSEVfRElSLCBCUjJfUEFDS0FHRV9EVEMgYW5kIEJSMl9QQUNLQUdFX0RUQ19QUk9HUkFNUwoK
djQ6CiAgLSBhZGRyZXNzIFRob21hcycgY29tbWVudHMKICAtIHJlbW92ZSBwZXRpdGJvb3QtbXRk
IGNvbmZpZyBhcyBsaWJmbGFzaCBpcyBub3QgYXZhaWxhYmxlCgp2MzogdjI6IHYxOgogIC0gZmly
c3QgdmVyc2lvbiwgSSBtZXNzZWQgdXAgd2l0aCBsaXN0IHN1YnNjcmlwdGlvbiBhbmQgZ2l0LXB1
Ymxpc2guLi4KCkxhdXJlbnQgVml2aWVyICg0KToKICBwZXRpdGJvb3Q6IGFkZCBwYi1kaXNjb3Zl
ciBkYWVtb24KICBwZXRpdGJvb3Q6IHN0YXJ0IHBldGl0Ym9vdCBvbiBhbGwgdHR5CiAgYm9hcmQv
cWVtdS9tNjhrLXZpcnQ6IEFkZCB2aXJ0LW02OGsgbGludXggY29uZmlnCiAgc3VwcG9ydC9zY3Jp
cHRzL2Jvb3QtcWVtdS1pbWFnZS5weTogbWFuYWdlIHBldGl0Ym9vdCBpbnRlcmZhY2UKCiBERVZF
TE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIGJvYXJkL3Fl
bXUvbTY4ay12aXJ0L2xpbnV4LmZyYWdtZW50ICAgICAgICAgIHwgMjEgKysrKysrKysKIGJvYXJk
L3FlbXUvbTY4ay12aXJ0L3JlYWRtZS50eHQgICAgICAgICAgICAgIHwgIDUgKysKIGNvbmZpZ3Mv
cWVtdV9tNjhrX3ZpcnRfcGV0aXRib290X2RlZmNvbmZpZyAgIHwgMjYgKysrKysrKysrKwogcGFj
a2FnZS9wZXRpdGJvb3QvUzE1cGItZGlzY292ZXIgICAgICAgICAgICAgfCA1NCArKysrKysrKysr
KysrKysrKysrKwogcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290LWNvbnNvbGUtdWkucnVsZXMg
fCAgNSArKwogcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rICAgICAgICAgICAgICAgfCAg
OCArKysKIHBhY2thZ2UvcGV0aXRib290L3N5c2N0bC5jb25mICAgICAgICAgICAgICAgIHwgIDEg
Kwogc3VwcG9ydC9zY3JpcHRzL2Jvb3QtcWVtdS1pbWFnZS5weSAgICAgICAgICAgfCAgOCArKy0K
IHN5c3RlbS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDEw
IGZpbGVzIGNoYW5nZWQsIDEyOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGJvYXJkL3FlbXUvbTY4ay12aXJ0L2xpbnV4LmZyYWdtZW50CiBjcmVhdGUg
bW9kZSAxMDA2NDQgYm9hcmQvcWVtdS9tNjhrLXZpcnQvcmVhZG1lLnR4dAogY3JlYXRlIG1vZGUg
MTAwNjQ0IGNvbmZpZ3MvcWVtdV9tNjhrX3ZpcnRfcGV0aXRib290X2RlZmNvbmZpZwogY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L1MxNXBiLWRpc2NvdmVyCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290LWNvbnNvbGUtdWkucnVsZXMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BldGl0Ym9vdC9zeXNjdGwuY29uZgoKLS0gCjIuNDAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
