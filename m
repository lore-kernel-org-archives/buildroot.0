Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF73EC433FE
	for <buildroot@archiver.kernel.org>; Fri, 18 Nov 2022 14:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6825B8216E;
	Fri, 18 Nov 2022 14:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6825B8216E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ttx5nPhtWOkw; Fri, 18 Nov 2022 14:14:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CB29820F3;
	Fri, 18 Nov 2022 14:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CB29820F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11EBF1BF2B3
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 14:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE91A820F3
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 14:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE91A820F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rM0TPRcrSpXe for <buildroot@lists.busybox.net>;
 Fri, 18 Nov 2022 14:14:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5D3B81FF1
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5D3B81FF1
 for <buildroot@buildroot.org>; Fri, 18 Nov 2022 14:14:44 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MhClw-1pQ7pf1AEE-00eNy0; Fri, 18
 Nov 2022 15:14:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Fri, 18 Nov 2022 15:14:32 +0100
Message-Id: <20221118141435.1084565-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:rM1pCRZnXy4h0ypu/Ecy6WtXDwyvWcAaNIB0XFEIttmuhCvQTQG
 QuXzbbkvgHzBYuUj3bp7QG5MhQAKwfePC0IwTeiXa8o9Trx3wZ1qlvRCwuAxqjNEM97DCUk
 oo9L/NuR2y89bNsawxE5iQaV/RrmLOCpndm0vfeAT5KsCN7SgkONoZDiwG+bDmgFYny9lIT
 NHSufyq+swTrpO9DVqP2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kx1pLtHK31E=:FaMxG8ueOGRBS0KSOFOLio
 tN+SWBWWUYmR4oQEVRVwnJuE0DuSR03m+pVg9JIuRiNgLehY2ctTeP6y5RE/G+OtvLEA/a8+d
 43Xt0drX9r3Vn0RKkdiOKTKvPRoBs9u4Xk9/BSXdS47bDFNmytDSnugOoFm+O++kvI/eWNx7E
 FjkRpxEzvm7cB7+hlayIy09M8y1BGfG1s6AEsOwWYa0kWnSHvWMRvj6YPOZtBR0fsCujjnmdc
 onJlURbNNvhSfqXbhwRg0HHCD3fywSAr2oZrJichVo5RFDQaEBOPlw1sHLr5NKK5RfLXPNysF
 1m2/sKC4P+GaR2Xl2B4QBrCB9xylBh5UngCIHb3+Knc1VA2gzS9+X916xBXxQ1Wl8slAoPWkn
 Yx97425fLNR3aKBXT4GvJ+JLae62WmQxRLwYFEhUM7DfgbOU6hEIJ1TpJkx7O3WdDXQ455/yr
 7hYjAx26mHddsrNsnzEYyBmzCJczqOdmU+o5By216q2uvE5ZKbkREu1phXkENHMXGs/Bjyt/2
 F/nCOv2a/y/s12A9Ob9+GQxnObgt8dZ1UrsTF3RbwrY1LMT4Y/BTtWAkNfPQDbS6FJZzDx3LD
 7sIVcvoDVSCiEvAqoc/Nc16m7Sh6si8UbCIvT6BtSWRVAhdaotizkJY5lXOlB5HPJvDtZghrY
 VecKBtWjyRNmwb85nJtGHRmVZMZIS77fCnMwsJ3O7VxlvarTzNUl7n8g0KGBU/coaws0wJqMK
 YJ1+ty7EmdVzVqiJAEUNwEJunBjruhCzl+EBeqGoJEKI4UaAF0ckb+oSQ9EpIYuChovg7ktFz
 wTgs6jC
Subject: [Buildroot] [PATCH v7 0/3] package: add petitboot to use with
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
b3Rsb2FkZXIKZm9yIGl0IChsaWtlIGl0IGlzIGZvciB0aGUgSUJNIHNwYXByIG1hY2hpbmUpLgoK
VGhlIGZpcnN0IHBhdGNoIGludHJvZHVjZXMgcGV0aXRib290IHBhY2thZ2UsIHRoZSBzZWNvbmQg
cGF0Y2ggdGhlCmNvbmZpZ3VyYXRpb24gdG8gYnVpbGQgYnVpbGRyb290IHdpdGggcGV0aXRib290
IGZvciB0aGUgUUVNVSBtYWNoaW5lLgoKWW91IGNhbiB0ZXN0IGl0IHdpdGg6CgogIHFlbXUtc3lz
dGVtLW02OGsgLU0gdmlydCAta2VybmVsIGltYWdlcy92bWxpbnV4IFwKICAgICAgICAgICAgICAg
ICAgIC1pbml0cmQgaW1hZ2VzL3Jvb3Rmcy5jcGlvLnh6IFwKICAgICAgICAgICAgICAgICAgIC1h
cHBlbmQgImNvbnNvbGU9dHR5R0YwIiAtLW5vZ3JhcGhpYwoKU2lnbmVkLW9mZi1ieTogTGF1cmVu
dCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgoKdjc6CiAgLSBzZXQgQlIyX1BBQ0tBR0VfSE9T
VF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE5PXkKICAtIGZpeCBlcnJvcnMgcmVwb3J0ZWQgYnkg
Y2hlY2stcGFja2FnZQogIC0gYWRkIGdpdGxhYiB0ZXN0aW5nIChDw6lkcmljKQogIC0gdXBkYXRl
IGJvb3QtcWVtdS1pbWFnZS5weSB0byBzdXBwb3J0IHBldGl0Ym9vdAoKdjY6CiAgLSByZWJhc2UK
CnY1OgogIC0gcmVtb3ZlIEJSMl9DQ0FDSEVfRElSLCBCUjJfUEFDS0FHRV9EVEMgYW5kIEJSMl9Q
QUNLQUdFX0RUQ19QUk9HUkFNUwoKdjQ6CiAgLSBhZGRyZXNzIFRob21hcycgY29tbWVudHMKICAt
IHJlbW92ZSBwZXRpdGJvb3QtbXRkIGNvbmZpZyBhcyBsaWJmbGFzaCBpcyBub3QgYXZhaWxhYmxl
Cgp2MzogdjI6IHYxOgogIC0gZmlyc3QgdmVyc2lvbiwgSSBtZXNzZWQgdXAgd2l0aCBsaXN0IHN1
YnNjcmlwdGlvbiBhbmQgZ2l0LXB1Ymxpc2guLi4KCkxhdXJlbnQgVml2aWVyICgzKToKICBwYWNr
YWdlOiBhZGQgcGV0aXRib290CiAgYm9hcmQvcWVtdS9tNjhrLXZpcnQ6IEFkZCB2aXJ0LW02OGsg
bGludXggY29uZmlnCiAgc3VwcG9ydC9zY3JpcHRzL2Jvb3QtcWVtdS1pbWFnZS5weTogbWFuYWdl
IHBldGl0Ym9vdCBpbnRlcmZhY2UKCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA1ICsrCiBib2FyZC9xZW11L202OGstdmlydC9jb25maWcubGludXggICAg
ICAgICAgICB8IDg5ICsrKysrKysrKysrKysrKysrKysrCiBib2FyZC9xZW11L202OGstdmlydC9y
ZWFkbWUudHh0ICAgICAgICAgICAgICB8ICA1ICsrCiBjb25maWdzL3FlbXVfbTY4a192aXJ0X3Bl
dGl0Ym9vdF9kZWZjb25maWcgICB8IDMxICsrKysrKysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9rZXhlYy9Db25maWcuaW4gICAg
ICAgICAgICAgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9wZXRpdGJvb3QvNjMtbWQtcmFpZC1h
cnJheXMucnVsZXMgICAgfCA0MSArKysrKysrKysKIHBhY2thZ2UvcGV0aXRib290LzY1LW1kLWlu
Y3JlbWVudGFsLnJ1bGVzICAgIHwgNjkgKysrKysrKysrKysrKysrCiBwYWNrYWdlL3BldGl0Ym9v
dC82Ni1hZGQtc2ctbW9kdWxlLnJ1bGVzICAgICB8ICAyICsKIHBhY2thZ2UvcGV0aXRib290L0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgIHwgMjMgKysrKysKIHBhY2thZ2UvcGV0aXRib290L1Mx
NHNpbGVuY2UtY29uc29sZSAgICAgICAgIHwgIDkgKysKIHBhY2thZ2UvcGV0aXRib290L1MxNXBi
LWRpc2NvdmVyICAgICAgICAgICAgIHwgMzggKysrKysrKysrCiBwYWNrYWdlL3BldGl0Ym9vdC9m
cy1vdmVybGF5L2V0Yy9pbml0dGFiICAgICB8IDM0ICsrKysrKysrCiBwYWNrYWdlL3BldGl0Ym9v
dC9mcy1vdmVybGF5L2V0Yy9sb2NhbGUgICAgICB8ICAxICsKIHBhY2thZ2UvcGV0aXRib290L2Zz
LW92ZXJsYXkvaW5pdCAgICAgICAgICAgIHwgIDggKysKIHBhY2thZ2UvcGV0aXRib290L2tleGVj
LXJlc3RhcnQgICAgICAgICAgICAgIHwgIDggKysKIHBhY2thZ2UvcGV0aXRib290L3BldGl0Ym9v
dC1jb25zb2xlLXVpLnJ1bGVzIHwgIDYgKysKIHBhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC5o
YXNoICAgICAgICAgICAgIHwgIDIgKwogcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rICAg
ICAgICAgICAgICAgfCA3NyArKysrKysrKysrKysrKysrKwogcGFja2FnZS9wZXRpdGJvb3QvcmVt
b3ZhYmxlLWV2ZW50LXBvbGwucnVsZXMgfCAgNCArCiBwYWNrYWdlL3BldGl0Ym9vdC9zaGVsbF9j
b25maWcgICAgICAgICAgICAgICB8IDE5ICsrKysrCiBwYWNrYWdlL3BldGl0Ym9vdC9zaGVsbF9w
cm9maWxlICAgICAgICAgICAgICB8ICAyICsKIHN1cHBvcnQvc2NyaXB0cy9ib290LXFlbXUtaW1h
Z2UucHkgICAgICAgICAgIHwgMTMgKystCiAyMyBmaWxlcyBjaGFuZ2VkLCA0ODUgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9xZW11L202OGst
dmlydC9jb25maWcubGludXgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9xZW11L202OGstdmly
dC9yZWFkbWUudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9xZW11X202OGtfdmlydF9w
ZXRpdGJvb3RfZGVmY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3Qv
NjMtbWQtcmFpZC1hcnJheXMucnVsZXMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BldGl0
Ym9vdC82NS1tZC1pbmNyZW1lbnRhbC5ydWxlcwogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
cGV0aXRib290LzY2LWFkZC1zZy1tb2R1bGUucnVsZXMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3BldGl0Ym9vdC9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDc1NSBwYWNrYWdlL3BldGl0
Ym9vdC9TMTRzaWxlbmNlLWNvbnNvbGUKIGNyZWF0ZSBtb2RlIDEwMDc1NSBwYWNrYWdlL3BldGl0
Ym9vdC9TMTVwYi1kaXNjb3ZlcgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290
L2ZzLW92ZXJsYXkvZXRjL2luaXR0YWIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BldGl0
Ym9vdC9mcy1vdmVybGF5L2V0Yy9sb2NhbGUKIGNyZWF0ZSBtb2RlIDEwMDc1NSBwYWNrYWdlL3Bl
dGl0Ym9vdC9mcy1vdmVybGF5L2luaXQKIGNyZWF0ZSBtb2RlIDEwMDc1NSBwYWNrYWdlL3BldGl0
Ym9vdC9rZXhlYy1yZXN0YXJ0CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3Qv
cGV0aXRib290LWNvbnNvbGUtdWkucnVsZXMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Bl
dGl0Ym9vdC9wZXRpdGJvb3QuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRi
b290L3BldGl0Ym9vdC5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L3Jl
bW92YWJsZS1ldmVudC1wb2xsLnJ1bGVzCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRp
dGJvb3Qvc2hlbGxfY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA3NTUgcGFja2FnZS9wZXRpdGJvb3Qv
c2hlbGxfcHJvZmlsZQoKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
