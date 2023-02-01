Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AADC05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 13:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B28FC405C5;
	Wed,  1 Feb 2023 13:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B28FC405C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kL4JJDJH5YiI; Wed,  1 Feb 2023 13:51:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC966403A9;
	Wed,  1 Feb 2023 13:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC966403A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB9D81BF309
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 13:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2C44812A4
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 13:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2C44812A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LOpvlWxpSUhS for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 13:51:23 +0000 (UTC)
X-Greylist: delayed 00:05:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DA7A8129E
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DA7A8129E
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 13:51:22 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MtOX2-1oUpP33QQo-00utpH; Wed, 01
 Feb 2023 14:46:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 14:46:06 +0100
Message-Id: <20230201134609.2040073-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:xq+lY061xywEu8FIzFtMOgCe/gVVXVDJDeT1DruRSWxlxK8GE/V
 J/Kcl3mWOeRKdbaBM/tuNomisSIWdALvJwqd4c4UHz5e6bJ0tWt9fBXwV90h36odidXABRH
 ef8cj+U0vpyvjXHpOIUmWUHOBnWiZbY9uahCOwKPbgB7df+YFgpNjitOye+nHmOcRPUYrR1
 89QB9wo8xqfyX5zCU+K+w==
UI-OutboundReport: notjunk:1;M01:P0:Vue+mVLj/oo=;iO3t3st9Pzr+5ZVk8X10g5BiCZh
 q97fJ0jzGTlNopaB4Oqp8Y3O90ga6uASApdc2Ip+8Z0RR5faiEmTPO8/3dImf3yaWiCf1Thj5
 YxpvKpuGb3GuZvwqa/t3E/XwxA0wckcWeYflg4krVbeIiS4SQKND9yPP7iL6UFi8bvPLFyp3S
 MaYJMh9jg6hfXFQZnuF/XTJIiemouIBL/oZWTpFoCrX51G2x5EhXr2KUIUR0pKtp0usegbavm
 ouGsPraRueAN6ORwarkbGaAqqjDajbjNKYDdjYuMGnjOwDThBxT890NT+YGdunyMEowopXgYB
 vnEqLtR1O+OmBIjg6v8TCT7+wFRgkyZK9f8CIpsNrKFdYXSx+1ryzVxe36n6sNGerMprrwrCL
 pooiW3RPuwIlkTv9thAsBIfj3GFQxvYE2kQRTGtc4uLmqbBqpwwNWGacSCGDwcaWQ6it/0gEw
 DlVVHZrcpE0ci9WII6sztVJY/BzzIJFrkK1l30AxSCCvrcfyczFRznKTDyljWHN+EIMsStfTU
 EL0nUJ7SVPIliKQ6TEbXb5CV1f2pJ7GToo4ZIYqiFEjOelNUjMxN2R8k155dnSoILuAe8uMQ4
 yCTg36/SOMDwgbG8/sXZHLjLBJdf2FdSVsTfNh2OQ5QvXIq0EaWa0aNqkaCQGLgD32E9isU2+
 HLY9337Pz2vIX/xjvm84EBO5aDxPfg5jpCPe9XOhqQ==
Subject: [Buildroot] [PATCH v9 0/3] package: add petitboot to use with
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
dCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgoKdjk6CiAgLSByZW1vdmUgZGVwZW5kZW5jeSBv
biBCUjJfUEFDS0FHRV9QUzNfVVRJTFMKICAtIEFkZCBUaG9tYXMnIFJiCiAgLSByZWJhc2UKCnY4
OgogIC0gdXNlIGxpbnV4LmZyYWdtZW50IHJhdGhlciB0aGFuIGxpbnV4LmNvbmZpZwogIC0gcmVi
YXNlCgp2NzoKICAtIHNldCBCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVf
MTk9eQogIC0gZml4IGVycm9ycyByZXBvcnRlZCBieSBjaGVjay1wYWNrYWdlCiAgLSBhZGQgZ2l0
bGFiIHRlc3RpbmcgKEPDqWRyaWMpCiAgLSB1cGRhdGUgYm9vdC1xZW11LWltYWdlLnB5IHRvIHN1
cHBvcnQgcGV0aXRib290Cgp2NjoKICAtIHJlYmFzZQoKdjU6CiAgLSByZW1vdmUgQlIyX0NDQUNI
RV9ESVIsIEJSMl9QQUNLQUdFX0RUQyBhbmQgQlIyX1BBQ0tBR0VfRFRDX1BST0dSQU1TCgp2NDoK
ICAtIGFkZHJlc3MgVGhvbWFzJyBjb21tZW50cwogIC0gcmVtb3ZlIHBldGl0Ym9vdC1tdGQgY29u
ZmlnIGFzIGxpYmZsYXNoIGlzIG5vdCBhdmFpbGFibGUKCnYzOiB2MjogdjE6CiAgLSBmaXJzdCB2
ZXJzaW9uLCBJIG1lc3NlZCB1cCB3aXRoIGxpc3Qgc3Vic2NyaXB0aW9uIGFuZCBnaXQtcHVibGlz
aC4uLgoKTGF1cmVudCBWaXZpZXIgKDMpOgogIHBhY2thZ2U6IGFkZCBwZXRpdGJvb3QKICBib2Fy
ZC9xZW11L202OGstdmlydDogQWRkIHZpcnQtbTY4ayBsaW51eCBjb25maWcKICBzdXBwb3J0L3Nj
cmlwdHMvYm9vdC1xZW11LWltYWdlLnB5OiBtYW5hZ2UgcGV0aXRib290IGludGVyZmFjZQoKIERF
VkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysKIGJvYXJk
L3FlbXUvbTY4ay12aXJ0L2xpbnV4LmZyYWdtZW50ICAgICAgICAgIHwgMjEgKysrKysrCiBib2Fy
ZC9xZW11L202OGstdmlydC9yZWFkbWUudHh0ICAgICAgICAgICAgICB8ICA1ICsrCiBjb25maWdz
L3FlbXVfbTY4a192aXJ0X3BldGl0Ym9vdF9kZWZjb25maWcgICB8IDMxICsrKysrKysrCiBwYWNr
YWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2Uv
a2V4ZWMvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2UvcGV0
aXRib290LzYzLW1kLXJhaWQtYXJyYXlzLnJ1bGVzICAgIHwgNDEgKysrKysrKysrKysKIHBhY2th
Z2UvcGV0aXRib290LzY1LW1kLWluY3JlbWVudGFsLnJ1bGVzICAgIHwgNjkgKysrKysrKysrKysr
KysrKysrCiBwYWNrYWdlL3BldGl0Ym9vdC82Ni1hZGQtc2ctbW9kdWxlLnJ1bGVzICAgICB8ICAy
ICsKIHBhY2thZ2UvcGV0aXRib290L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgIHwgMjMgKysr
KysrCiBwYWNrYWdlL3BldGl0Ym9vdC9TMTRzaWxlbmNlLWNvbnNvbGUgICAgICAgICB8ICA5ICsr
KwogcGFja2FnZS9wZXRpdGJvb3QvUzE1cGItZGlzY292ZXIgICAgICAgICAgICAgfCAzOCArKysr
KysrKysrCiBwYWNrYWdlL3BldGl0Ym9vdC9mcy1vdmVybGF5L2V0Yy9pbml0dGFiICAgICB8IDM0
ICsrKysrKysrKwogcGFja2FnZS9wZXRpdGJvb3QvZnMtb3ZlcmxheS9ldGMvbG9jYWxlICAgICAg
fCAgMSArCiBwYWNrYWdlL3BldGl0Ym9vdC9mcy1vdmVybGF5L2luaXQgICAgICAgICAgICB8ICA4
ICsrCiBwYWNrYWdlL3BldGl0Ym9vdC9rZXhlYy1yZXN0YXJ0ICAgICAgICAgICAgICB8ICA4ICsr
CiBwYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QtY29uc29sZS11aS5ydWxlcyB8ICA2ICsrCiBw
YWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QuaGFzaCAgICAgICAgICAgICB8ICAyICsKIHBhY2th
Z2UvcGV0aXRib290L3BldGl0Ym9vdC5tayAgICAgICAgICAgICAgIHwgNzcgKysrKysrKysrKysr
KysrKysrKysKIHBhY2thZ2UvcGV0aXRib290L3JlbW92YWJsZS1ldmVudC1wb2xsLnJ1bGVzIHwg
IDQgKwogcGFja2FnZS9wZXRpdGJvb3Qvc2hlbGxfY29uZmlnICAgICAgICAgICAgICAgfCAxOSAr
KysrKwogcGFja2FnZS9wZXRpdGJvb3Qvc2hlbGxfcHJvZmlsZSAgICAgICAgICAgICAgfCAgMiAr
CiBzdXBwb3J0L3NjcmlwdHMvYm9vdC1xZW11LWltYWdlLnB5ICAgICAgICAgICB8IDEzICsrKy0K
IDIzIGZpbGVzIGNoYW5nZWQsIDQxNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3FlbXUvbTY4ay12aXJ0L2xpbnV4LmZyYWdtZW50CiBjcmVh
dGUgbW9kZSAxMDA2NDQgYm9hcmQvcWVtdS9tNjhrLXZpcnQvcmVhZG1lLnR4dAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGNvbmZpZ3MvcWVtdV9tNjhrX3ZpcnRfcGV0aXRib290X2RlZmNvbmZpZwogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290LzYzLW1kLXJhaWQtYXJyYXlzLnJ1bGVz
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3QvNjUtbWQtaW5jcmVtZW50YWwu
cnVsZXMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BldGl0Ym9vdC82Ni1hZGQtc2ctbW9k
dWxlLnJ1bGVzCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3QvQ29uZmlnLmlu
CiBjcmVhdGUgbW9kZSAxMDA3NTUgcGFja2FnZS9wZXRpdGJvb3QvUzE0c2lsZW5jZS1jb25zb2xl
CiBjcmVhdGUgbW9kZSAxMDA3NTUgcGFja2FnZS9wZXRpdGJvb3QvUzE1cGItZGlzY292ZXIKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BldGl0Ym9vdC9mcy1vdmVybGF5L2V0Yy9pbml0dGFi
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3QvZnMtb3ZlcmxheS9ldGMvbG9j
YWxlCiBjcmVhdGUgbW9kZSAxMDA3NTUgcGFja2FnZS9wZXRpdGJvb3QvZnMtb3ZlcmxheS9pbml0
CiBjcmVhdGUgbW9kZSAxMDA3NTUgcGFja2FnZS9wZXRpdGJvb3Qva2V4ZWMtcmVzdGFydAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC1jb25zb2xlLXVpLnJ1
bGVzCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lmhhc2gK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QubWsKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BldGl0Ym9vdC9yZW1vdmFibGUtZXZlbnQtcG9sbC5ydWxl
cwogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L3NoZWxsX2NvbmZpZwogY3Jl
YXRlIG1vZGUgMTAwNzU1IHBhY2thZ2UvcGV0aXRib290L3NoZWxsX3Byb2ZpbGUKCi0tIAoyLjM5
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
