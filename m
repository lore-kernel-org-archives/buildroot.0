Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCE9C77B78
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 18:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 370AB6FFF1;
	Fri, 21 Apr 2023 18:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 370AB6FFF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynHzYgz2iBd9; Fri, 21 Apr 2023 18:50:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BF0A6FFF4;
	Fri, 21 Apr 2023 18:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BF0A6FFF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 540D91C2BC6
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DA5483FB5
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DA5483FB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A87jAA-VdmZI for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 18:50:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2C1083EB8
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2C1083EB8
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 18:50:11 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N5lvf-1qMSHe320B-017CMU; Fri, 21
 Apr 2023 20:50:05 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Fri, 21 Apr 2023 20:49:58 +0200
Message-Id: <20230421185003.1221000-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:KrBjY+QSm5y5y91MhQCjP+m3qqf/cINS2uNo8AXtSkilgujc0Yz
 Mi2bq+pkY4c8vvSg72v5G1iD5MtKhN2GmmI9EW2ELE4miu1V2MBvbiHCKB43mRtOdqqkYW4
 0L49RXCN/9ISPdpiZ2v5IcMpNMJ4xh7BPY1tk0v9kBYgS8rnYaQ/afaFVfWGruSffZUNF6t
 qbZTXwwQp/6/sjFQGsiJw==
UI-OutboundReport: notjunk:1;M01:P0:y/TcJwM2GHY=;hf/mSu06m/ghPH0f3x6fVGY0CN7
 0TkFkOlEsgms/Ga/YpUq7hgSmcAEFJiDpn69a8NNdku0nRBN7/DTpXvMT01dRRQybuYjgn9RU
 0m2B4dEoavvrG8Gxu4KNeQUcVXLAj7cNrc9MIC3un9FcumZUGSJ0I0vubjXx3zHAEtueIMBSO
 5LscU1S1BDonkKBqbpU2Tl4FKiWxYEH20ucUYx6DnT9JktXAzcMs+/yYEplHMin+v8Nf2ZLUJ
 nhQFhCPt9tRvd0KEd4FAqK74aXzgmyKJ8TdZlpzx7Sk/YOYKiohqX+H/SmPWYHfdYwAhBA4v5
 4GHoJ+GyNKKUSegDGRqIh2nmOuJCryFVoPsSdF/0EbzgMBVum3AeHvlQZrp/IPpuVdx69RUyk
 uuppOp+BrEssWCIpf7TXG2Lrld97VUUk2jd45XjHPAf4OvQbObyiWFQAe7BgQMeovD2PxDSdm
 IZNteIQ8JVXS3NJIdpPIDYt8maMwWA0aQX63mHVZQFVmlNLBsnI/BaExuHhzKAQGOJaTuwawH
 FyycEvo4gTptv0CMUF3EpmjO1Ao6Wq5SG+Bkw3TbA1qz6fV/YgxOdJvT9yJBNsdDhcM5V1T3G
 UP9SViXUdcK/Zar7dIZDkfzMFGTIvmjMIDn53exAy5EgQfPOmUc4l3+dC4rgvjMFLVGWA0HF5
 bY+7vonWZE4lAtcNDGgTdQtUAvouh6PL4CsB6V/L+g==
Subject: [Buildroot] [PATCH v11 0/5] package: add petitboot to use with
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
LmV1PgoKdjExOgogLSByZWJhc2Ugb24gdG9wIG9mIHBldGl0Ym9vdCBtZXJnZWQgcGFja2FnZQog
LSBhZGQgcGItZGlzY292ZXIgZGFlbW9uCiAtIHN0YXJ0IHBldGl0Ym9vdCBvbiBhbGwgdHR5LCBk
aXNhYmxlIGdlbmVyaWMgZ2V0dHkKIC0gZml4IGtleGVjIGJ1aWxkIG9uIG02OGsgd2l0aCB1Y2xp
YmMKIC0gdXNlIHBvd2Vyb2ZmIGluIHRoZSB0ZXN0IHNjcmlwdCAoYXMgd2UgaGF2ZSBpbml0IG5v
dykKIC0gcmVtb3ZlIFRob21hcycgUmIsIGFzIHRoZXJlIHdlcmUgc29tZSBjaGFuZ2VzCiAtIENJ
OiBodHRwczovL2dpdGxhYi5jb20vbGF1cmVudF92aXZpZXIvYnVpbGRyb290Ly0vcGlwZWxpbmVz
Lzg0NDkxNzM2OAoKdjEwOgogIC0gc2V0IFBFVElUQk9PVF9MSUNFTlNFIHRvIEdQTC0yLjAKCnY5
OgogIC0gcmVtb3ZlIGRlcGVuZGVuY3kgb24gQlIyX1BBQ0tBR0VfUFMzX1VUSUxTCiAgLSBBZGQg
VGhvbWFzJyBSYgogIC0gcmViYXNlCgp2ODoKICAtIHVzZSBsaW51eC5mcmFnbWVudCByYXRoZXIg
dGhhbiBsaW51eC5jb25maWcKICAtIHJlYmFzZQoKdjc6CiAgLSBzZXQgQlIyX1BBQ0tBR0VfSE9T
VF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE5PXkKICAtIGZpeCBlcnJvcnMgcmVwb3J0ZWQgYnkg
Y2hlY2stcGFja2FnZQogIC0gYWRkIGdpdGxhYiB0ZXN0aW5nIChDw6lkcmljKQogIC0gdXBkYXRl
IGJvb3QtcWVtdS1pbWFnZS5weSB0byBzdXBwb3J0IHBldGl0Ym9vdAoKdjY6CiAgLSByZWJhc2UK
CnY1OgogIC0gcmVtb3ZlIEJSMl9DQ0FDSEVfRElSLCBCUjJfUEFDS0FHRV9EVEMgYW5kIEJSMl9Q
QUNLQUdFX0RUQ19QUk9HUkFNUwoKdjQ6CiAgLSBhZGRyZXNzIFRob21hcycgY29tbWVudHMKICAt
IHJlbW92ZSBwZXRpdGJvb3QtbXRkIGNvbmZpZyBhcyBsaWJmbGFzaCBpcyBub3QgYXZhaWxhYmxl
Cgp2MzogdjI6IHYxOgogIC0gZmlyc3QgdmVyc2lvbiwgSSBtZXNzZWQgdXAgd2l0aCBsaXN0IHN1
YnNjcmlwdGlvbiBhbmQgZ2l0LXB1Ymxpc2guLi4KCkxhdXJlbnQgVml2aWVyICg1KToKICBrZXhl
YzogZml4IHN5cy9yYW5kb20uaCB3aXRoIHVjbGliYwogIHBldGl0Ym9vdDogYWRkIHBiLWRpc2Nv
dmVyIGRhZW1vbgogIHBldGl0Ym9vdDogc3RhcnQgcGV0aXRib290IG9uIGFsbCB0dHkKICBib2Fy
ZC9xZW11L202OGstdmlydDogQWRkIHZpcnQtbTY4ayBsaW51eCBjb25maWcKICBzdXBwb3J0L3Nj
cmlwdHMvYm9vdC1xZW11LWltYWdlLnB5OiBtYW5hZ2UgcGV0aXRib290IGludGVyZmFjZQoKIERF
VkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIGJvYXJk
L3FlbXUvbTY4ay12aXJ0L2xpbnV4LmZyYWdtZW50ICAgICAgICAgICB8IDIxICsrKysrKysrCiBi
b2FyZC9xZW11L202OGstdmlydC9yZWFkbWUudHh0ICAgICAgICAgICAgICAgfCAgNSArKwogY29u
Zmlncy9xZW11X202OGtfdmlydF9wZXRpdGJvb3RfZGVmY29uZmlnICAgIHwgMjkgKysrKysrKysr
KwogLi4uMS1tNjhrLWZpeC1nZXRyYW5kb20tdXNlLXdpdGgtdWNsaWJjLnBhdGNoIHwgMzUgKysr
KysrKysrKysrCiBwYWNrYWdlL3BldGl0Ym9vdC9TMTVwYi1kaXNjb3ZlciAgICAgICAgICAgICAg
fCA1MyArKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QtY29u
c29sZS11aS5ydWxlcyAgfCAgNSArKwogcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rICAg
ICAgICAgICAgICAgIHwgIDggKysrCiBwYWNrYWdlL3BldGl0Ym9vdC9zeXNjdGwuY29uZiAgICAg
ICAgICAgICAgICAgfCAgMSArCiBzdXBwb3J0L3NjcmlwdHMvYm9vdC1xZW11LWltYWdlLnB5ICAg
ICAgICAgICAgfCAgOCArKy0KIHN5c3RlbS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCiAxMSBmaWxlcyBjaGFuZ2VkLCAxNjYgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9xZW11L202OGstdmlydC9saW51
eC5mcmFnbWVudAogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3FlbXUvbTY4ay12aXJ0L3JlYWRt
ZS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL3FlbXVfbTY4a192aXJ0X3BldGl0Ym9v
dF9kZWZjb25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2tleGVjLzAwMDEtbTY4ay1m
aXgtZ2V0cmFuZG9tLXVzZS13aXRoLXVjbGliYy5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvcGV0aXRib290L1MxNXBiLWRpc2NvdmVyCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9wZXRpdGJvb3QvcGV0aXRib290LWNvbnNvbGUtdWkucnVsZXMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3BldGl0Ym9vdC9zeXNjdGwuY29uZgoKLS0gCjIuNDAuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
