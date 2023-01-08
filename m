Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A3CC53210
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 16:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70F1E404F4;
	Sun,  8 Jan 2023 16:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70F1E404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sPjExqzCuepi; Sun,  8 Jan 2023 16:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC00A404AE;
	Sun,  8 Jan 2023 16:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC00A404AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8741D1BF304
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 16:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62A8A404BB
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 16:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62A8A404BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9LtWnxGyqHW1 for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 16:54:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E793400D8
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E793400D8
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 16:54:45 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MZTVu-1pJODe12Uo-00WWt6; Sun, 08
 Jan 2023 17:54:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 17:54:35 +0100
Message-Id: <20230108165438.1250779-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:3b6Lk8z+VnGQPLnYKPjEdlKGdqhwliZ3gs8FMfHm1pg3iXSgFRC
 ydcccIgrceI8ZrqtqUoZDqi9mxIfw612g1omPAYxMJK/qKoAOUISH9vg+dh/81+hdsK3PpS
 EG24HTtYg2PN+bZ3MR5aa82KrVG4dqle3D4VG/eQLYdbtQizfeYuP1+MSW/VulNLbtQcj/y
 YjKTc+BR0YvtCyPJLyvSw==
UI-OutboundReport: notjunk:1;M01:P0:KyB1pllYrRk=;N1cCl1imMxguEtgSMkIgCx1tAdR
 scwfSSVw5PtiNzT40G+wMilMB0Xn7f1iZSeeb630l0AL1hO6+4gJUp+sJRmJ/kJ/LY+SA3LCe
 UwjRuwlRp38uztJvNtEUAuh3YyVxZLTiF/NvYXMhOiPOw/p7CggS07TuXOAy5Ea2p7TpxYwA7
 oEEM40kreHOddpcGl6JXa5iZelaQjhwpw/4o5PA6I1XszCn59D/UW3CTXOtdZYPCkqodcmvQ3
 nCt2eVpF27pAiQazgQcwWFJ5WyZXtlAzhy9iXK+605bKfuX+yJ44h8lVP8imaup8cEsmXaXEl
 g7PaN/NO+okBxeKC0twYIqU0pE7wrSNpGeoXsWbSP6sszDvrXAuENqIkWljNVIhSQjZP90tsj
 knw/rNmEKj9MJuLTl+JrcB7QOkA39c6XHrUIBuWBhnVTMrqQY/O9p+iFPx18O3Dg99YuEpmov
 dy+FD1wkGwmVi/6R4pTvTH5w8UPT0Wpvh/Wi9T7oThntUvu9z35zOngMOp2MVZ1ztI2lX994I
 DeF3ytIsL7MoxtpDqczloiOnKzDdn8SFZ+XeAI5S6aoic7NQ4LbR5evvFt55PY6aKsztgGgcT
 M3Dgx86NAYh7MWzmyXBImoOuHv0c6WBHXEQdUYc5+xd8m8BnEWqFGDeNc27gTMRIUpTX0ewWD
 cCS4HYf5YU6Mc8vu99BVfe2VCnS1nFma91wVdvpktw==
Subject: [Buildroot] [PATCH v8 0/3] package: add petitboot to use with
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cWVtdS1zeXN0ZW0tbTY4ayBoYXMgaW50cm9kdWNlZCBpbiB2Ni4wIGEgbmV3IHB1cmUgdmlydHVh
bCBtYWNoaW5lCnRoYXQgaXMgbm93IHN1cHBvcnRlZCBieSBsaW51eCB2NS4xOS4KClRoZSBnb2Fs
IG9mIHRoaXMgc2VyaWVzIGlzIHRvIHByb3ZpZGUgcGV0aXRib290IGFzIGFuIGVtYmVkZGVkIGJv
b3Rsb2FkZXIKZm9yIGl0IChsaWtlIGl0IGlzIGZvciB0aGUgSUJNIFBPV0VSIG1hY2hpbmUpLgoK
VGhlIGZpcnN0IHBhdGNoIGludHJvZHVjZXMgcGV0aXRib290IHBhY2thZ2UsIHRoZSBzZWNvbmQg
cGF0Y2ggdGhlCmNvbmZpZ3VyYXRpb24gdG8gYnVpbGQgYnVpbGRyb290IHdpdGggcGV0aXRib290
IGZvciB0aGUgUUVNVSBtYWNoaW5lLgoKWW91IGNhbiB0ZXN0IGl0IHdpdGg6CgogIHFlbXUtc3lz
dGVtLW02OGsgLU0gdmlydCAta2VybmVsIGltYWdlcy92bWxpbnV4IFwKICAgICAgICAgICAgICAg
ICAgIC1pbml0cmQgaW1hZ2VzL3Jvb3Rmcy5jcGlvLnh6IFwKICAgICAgICAgICAgICAgICAgIC1h
cHBlbmQgImNvbnNvbGU9dHR5R0YwIiAtLW5vZ3JhcGhpYwoKU2lnbmVkLW9mZi1ieTogTGF1cmVu
dCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgoKdjg6CiAgLSB1c2UgbGludXguZnJhZ21lbnQg
cmF0aGVyIHRoYW4gbGludXguY29uZmlnCiAgLSByZWJhc2UKCnY3OgogIC0gc2V0IEJSMl9QQUNL
QUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xOT15CiAgLSBmaXggZXJyb3JzIHJlcG9y
dGVkIGJ5IGNoZWNrLXBhY2thZ2UKICAtIGFkZCBnaXRsYWIgdGVzdGluZyAoQ8OpZHJpYykKICAt
IHVwZGF0ZSBib290LXFlbXUtaW1hZ2UucHkgdG8gc3VwcG9ydCBwZXRpdGJvb3QKCnY2OgogIC0g
cmViYXNlCgp2NToKICAtIHJlbW92ZSBCUjJfQ0NBQ0hFX0RJUiwgQlIyX1BBQ0tBR0VfRFRDIGFu
ZCBCUjJfUEFDS0FHRV9EVENfUFJPR1JBTVMKCnY0OgogIC0gYWRkcmVzcyBUaG9tYXMnIGNvbW1l
bnRzCiAgLSByZW1vdmUgcGV0aXRib290LW10ZCBjb25maWcgYXMgbGliZmxhc2ggaXMgbm90IGF2
YWlsYWJsZQoKdjM6IHYyOiB2MToKICAtIGZpcnN0IHZlcnNpb24sIEkgbWVzc2VkIHVwIHdpdGgg
bGlzdCBzdWJzY3JpcHRpb24gYW5kIGdpdC1wdWJsaXNoLi4uCgpMYXVyZW50IFZpdmllciAoMyk6
CiAgcGFja2FnZTogYWRkIHBldGl0Ym9vdAogIGJvYXJkL3FlbXUvbTY4ay12aXJ0OiBBZGQgdmly
dC1tNjhrIGxpbnV4IGNvbmZpZwogIHN1cHBvcnQvc2NyaXB0cy9ib290LXFlbXUtaW1hZ2UucHk6
IG1hbmFnZSBwZXRpdGJvb3QgaW50ZXJmYWNlCgogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNSArKwogYm9hcmQvcWVtdS9tNjhrLXZpcnQvbGludXguZnJh
Z21lbnQgICAgICAgICAgfCAyMSArKysrKysKIGJvYXJkL3FlbXUvbTY4ay12aXJ0L3JlYWRtZS50
eHQgICAgICAgICAgICAgIHwgIDUgKysKIGNvbmZpZ3MvcWVtdV9tNjhrX3ZpcnRfcGV0aXRib290
X2RlZmNvbmZpZyAgIHwgMzEgKysrKysrKysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9rZXhlYy9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9wZXRpdGJvb3QvNjMtbWQtcmFpZC1hcnJheXMu
cnVsZXMgICAgfCA0MSArKysrKysrKysrKwogcGFja2FnZS9wZXRpdGJvb3QvNjUtbWQtaW5jcmVt
ZW50YWwucnVsZXMgICAgfCA2OSArKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvcGV0aXRib290
LzY2LWFkZC1zZy1tb2R1bGUucnVsZXMgICAgIHwgIDIgKwogcGFja2FnZS9wZXRpdGJvb3QvQ29u
ZmlnLmluICAgICAgICAgICAgICAgICAgfCAyMyArKysrKysKIHBhY2thZ2UvcGV0aXRib290L1Mx
NHNpbGVuY2UtY29uc29sZSAgICAgICAgIHwgIDkgKysrCiBwYWNrYWdlL3BldGl0Ym9vdC9TMTVw
Yi1kaXNjb3ZlciAgICAgICAgICAgICB8IDM4ICsrKysrKysrKysKIHBhY2thZ2UvcGV0aXRib290
L2ZzLW92ZXJsYXkvZXRjL2luaXR0YWIgICAgIHwgMzQgKysrKysrKysrCiBwYWNrYWdlL3BldGl0
Ym9vdC9mcy1vdmVybGF5L2V0Yy9sb2NhbGUgICAgICB8ICAxICsKIHBhY2thZ2UvcGV0aXRib290
L2ZzLW92ZXJsYXkvaW5pdCAgICAgICAgICAgIHwgIDggKysKIHBhY2thZ2UvcGV0aXRib290L2tl
eGVjLXJlc3RhcnQgICAgICAgICAgICAgIHwgIDggKysKIHBhY2thZ2UvcGV0aXRib290L3BldGl0
Ym9vdC1jb25zb2xlLXVpLnJ1bGVzIHwgIDYgKysKIHBhY2thZ2UvcGV0aXRib290L3BldGl0Ym9v
dC5oYXNoICAgICAgICAgICAgIHwgIDIgKwogcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1r
ICAgICAgICAgICAgICAgfCA3NyArKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9wZXRpdGJv
b3QvcmVtb3ZhYmxlLWV2ZW50LXBvbGwucnVsZXMgfCAgNCArCiBwYWNrYWdlL3BldGl0Ym9vdC9z
aGVsbF9jb25maWcgICAgICAgICAgICAgICB8IDE5ICsrKysrCiBwYWNrYWdlL3BldGl0Ym9vdC9z
aGVsbF9wcm9maWxlICAgICAgICAgICAgICB8ICAyICsKIHN1cHBvcnQvc2NyaXB0cy9ib290LXFl
bXUtaW1hZ2UucHkgICAgICAgICAgIHwgMTMgKysrLQogMjMgZmlsZXMgY2hhbmdlZCwgNDE3IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvcWVt
dS9tNjhrLXZpcnQvbGludXguZnJhZ21lbnQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9xZW11
L202OGstdmlydC9yZWFkbWUudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9xZW11X202
OGtfdmlydF9wZXRpdGJvb3RfZGVmY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9w
ZXRpdGJvb3QvNjMtbWQtcmFpZC1hcnJheXMucnVsZXMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3BldGl0Ym9vdC82NS1tZC1pbmNyZW1lbnRhbC5ydWxlcwogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvcGV0aXRib290LzY2LWFkZC1zZy1tb2R1bGUucnVsZXMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3BldGl0Ym9vdC9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDc1NSBwYWNr
YWdlL3BldGl0Ym9vdC9TMTRzaWxlbmNlLWNvbnNvbGUKIGNyZWF0ZSBtb2RlIDEwMDc1NSBwYWNr
YWdlL3BldGl0Ym9vdC9TMTVwYi1kaXNjb3ZlcgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
cGV0aXRib290L2ZzLW92ZXJsYXkvZXRjL2luaXR0YWIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3BldGl0Ym9vdC9mcy1vdmVybGF5L2V0Yy9sb2NhbGUKIGNyZWF0ZSBtb2RlIDEwMDc1NSBw
YWNrYWdlL3BldGl0Ym9vdC9mcy1vdmVybGF5L2luaXQKIGNyZWF0ZSBtb2RlIDEwMDc1NSBwYWNr
YWdlL3BldGl0Ym9vdC9rZXhlYy1yZXN0YXJ0CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9w
ZXRpdGJvb3QvcGV0aXRib290LWNvbnNvbGUtdWkucnVsZXMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvcGV0aXRib290L3BldGl0Ym9vdC5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0
aXRib290L3JlbW92YWJsZS1ldmVudC1wb2xsLnJ1bGVzCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9wZXRpdGJvb3Qvc2hlbGxfY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA3NTUgcGFja2FnZS9w
ZXRpdGJvb3Qvc2hlbGxfcHJvZmlsZQoKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
