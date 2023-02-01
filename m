Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4545C636D7
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 20:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 461D840A76;
	Wed,  1 Feb 2023 20:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 461D840A76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D8_YrNr3jcmG; Wed,  1 Feb 2023 20:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15BDE4016F;
	Wed,  1 Feb 2023 20:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15BDE4016F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 167551BF3D0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 20:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E50104016F
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 20:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E50104016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0itU7Sgu5PrL for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 20:48:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B6874016B
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B6874016B
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 20:48:54 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MjjOl-1ouMGY4Bq7-00lBuB; Wed, 01
 Feb 2023 21:48:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 21:48:45 +0100
Message-Id: <20230201204848.2099336-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:aEzArqH3+shxz0jsmaK28n4onxOUlJFlYXyntYGFd7Z4usLX8HZ
 a/KXw+a2HhhBroTvYQjNfPXjNBKI7hpdH2v7UFsnHUh4OPNVlOw8OrxmJe3VxewWwsx2LB+
 lZfJpKNN4U3r2kmxLH2JyIusPo1IcAs97I5uQhnC60Ou0ALKBPxcxkKzMCt6MA+2we7hzeW
 G9cCFowzpNg+ihtrJtYUQ==
UI-OutboundReport: notjunk:1;M01:P0:KD8/uQ7hOII=;ZvN5bweehLFOoUYfIcdq8/vNWx/
 uTxmqjOgOhB8lIFrnf8enNgPROq5/3JBIvtjSb3U+MUP/lMoS8JhCF9T0xWxDXjb+UCJbBPO3
 m53ffJGnOp23nZYEsm6vQcYO+HJdVDX4ENsUQX6Fk6e5cy07nBhFKiuMCtqNptHZdvGYfzNZh
 yLNmfhW9LUipxu0HGG8vaR19oaCQDGPw69zxvXKzzCfMtEQoyO0nLdrpnz8F+Zb+k4+m+aiFZ
 eyrOJTvDZLifJCA0/x3SxguPDEQ62yhFPKLu8IooUFkTqsr+LQMkoz6brLhYVhr3Am8BHOkSV
 sM58UPlHsXv9iWKgtXU/KfFHEYKk6p8KbjP+6XjEzvu5P9JYyjzWzzEZTBTQW29QmndR4OLJi
 i3te2MfpuQKSI8iXukOD+98f4Gbi0J8NhMBjyFZgd6omvMFMM2s7+yLRTa/X7UYVg65QL6QeF
 fN200iQw/ps2EK8qHCmcC1e/KJnkLwnsMIroGfaGd8woVEshduB5Je7qxBHfOmxoZUTtDkRoB
 tsfAhHF5M5oTWUxXVmKDL9lHvTmiViM2mGl6urMyWsppqoMyC2OKvl/SYMJp1XLyBQO7Rpu0b
 tUX4RsSacBwBvypMflUK55wiixKoZrmtCBulTluI+eQ+aDiBY8p1rAmNPBNjq2aEOctXBC3T4
 5HjclJWUQ4il+syh3uzbig9dcSwIUSzLNVt2yU5PSQ==
Subject: [Buildroot] [PATCH v10 0/3] package: add petitboot to use with
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
dCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgoKdjEwOgogIC0gc2V0IFBFVElUQk9PVF9MSUNF
TlNFIHRvIEdQTC0yLjAKCnY5OgogIC0gcmVtb3ZlIGRlcGVuZGVuY3kgb24gQlIyX1BBQ0tBR0Vf
UFMzX1VUSUxTCiAgLSBBZGQgVGhvbWFzJyBSYgogIC0gcmViYXNlCgp2ODoKICAtIHVzZSBsaW51
eC5mcmFnbWVudCByYXRoZXIgdGhhbiBsaW51eC5jb25maWcKICAtIHJlYmFzZQoKdjc6CiAgLSBz
ZXQgQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE5PXkKICAtIGZpeCBl
cnJvcnMgcmVwb3J0ZWQgYnkgY2hlY2stcGFja2FnZQogIC0gYWRkIGdpdGxhYiB0ZXN0aW5nIChD
w6lkcmljKQogIC0gdXBkYXRlIGJvb3QtcWVtdS1pbWFnZS5weSB0byBzdXBwb3J0IHBldGl0Ym9v
dAoKdjY6CiAgLSByZWJhc2UKCnY1OgogIC0gcmVtb3ZlIEJSMl9DQ0FDSEVfRElSLCBCUjJfUEFD
S0FHRV9EVEMgYW5kIEJSMl9QQUNLQUdFX0RUQ19QUk9HUkFNUwoKdjQ6CiAgLSBhZGRyZXNzIFRo
b21hcycgY29tbWVudHMKICAtIHJlbW92ZSBwZXRpdGJvb3QtbXRkIGNvbmZpZyBhcyBsaWJmbGFz
aCBpcyBub3QgYXZhaWxhYmxlCgp2MzogdjI6IHYxOgogIC0gZmlyc3QgdmVyc2lvbiwgSSBtZXNz
ZWQgdXAgd2l0aCBsaXN0IHN1YnNjcmlwdGlvbiBhbmQgZ2l0LXB1Ymxpc2guLi4KCkxhdXJlbnQg
Vml2aWVyICgzKToKICBwYWNrYWdlOiBhZGQgcGV0aXRib290CiAgYm9hcmQvcWVtdS9tNjhrLXZp
cnQ6IEFkZCB2aXJ0LW02OGsgbGludXggY29uZmlnCiAgc3VwcG9ydC9zY3JpcHRzL2Jvb3QtcWVt
dS1pbWFnZS5weTogbWFuYWdlIHBldGl0Ym9vdCBpbnRlcmZhY2UKCiBERVZFTE9QRVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrCiBib2FyZC9xZW11L202OGstdmly
dC9saW51eC5mcmFnbWVudCAgICAgICAgICB8IDIxICsrKysrKwogYm9hcmQvcWVtdS9tNjhrLXZp
cnQvcmVhZG1lLnR4dCAgICAgICAgICAgICAgfCAgNSArKwogY29uZmlncy9xZW11X202OGtfdmly
dF9wZXRpdGJvb3RfZGVmY29uZmlnICAgfCAzMSArKysrKysrKwogcGFja2FnZS9Db25maWcuaW4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2tleGVjL0NvbmZpZy5p
biAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBwYWNrYWdlL3BldGl0Ym9vdC82My1tZC1y
YWlkLWFycmF5cy5ydWxlcyAgICB8IDQxICsrKysrKysrKysrCiBwYWNrYWdlL3BldGl0Ym9vdC82
NS1tZC1pbmNyZW1lbnRhbC5ydWxlcyAgICB8IDY5ICsrKysrKysrKysrKysrKysrKwogcGFja2Fn
ZS9wZXRpdGJvb3QvNjYtYWRkLXNnLW1vZHVsZS5ydWxlcyAgICAgfCAgMiArCiBwYWNrYWdlL3Bl
dGl0Ym9vdC9Db25maWcuaW4gICAgICAgICAgICAgICAgICB8IDIzICsrKysrKwogcGFja2FnZS9w
ZXRpdGJvb3QvUzE0c2lsZW5jZS1jb25zb2xlICAgICAgICAgfCAgOSArKysKIHBhY2thZ2UvcGV0
aXRib290L1MxNXBiLWRpc2NvdmVyICAgICAgICAgICAgIHwgMzggKysrKysrKysrKwogcGFja2Fn
ZS9wZXRpdGJvb3QvZnMtb3ZlcmxheS9ldGMvaW5pdHRhYiAgICAgfCAzNCArKysrKysrKysKIHBh
Y2thZ2UvcGV0aXRib290L2ZzLW92ZXJsYXkvZXRjL2xvY2FsZSAgICAgIHwgIDEgKwogcGFja2Fn
ZS9wZXRpdGJvb3QvZnMtb3ZlcmxheS9pbml0ICAgICAgICAgICAgfCAgOCArKwogcGFja2FnZS9w
ZXRpdGJvb3Qva2V4ZWMtcmVzdGFydCAgICAgICAgICAgICAgfCAgOCArKwogcGFja2FnZS9wZXRp
dGJvb3QvcGV0aXRib290LWNvbnNvbGUtdWkucnVsZXMgfCAgNiArKwogcGFja2FnZS9wZXRpdGJv
b3QvcGV0aXRib290Lmhhc2ggICAgICAgICAgICAgfCAgMiArCiBwYWNrYWdlL3BldGl0Ym9vdC9w
ZXRpdGJvb3QubWsgICAgICAgICAgICAgICB8IDc3ICsrKysrKysrKysrKysrKysrKysrCiBwYWNr
YWdlL3BldGl0Ym9vdC9yZW1vdmFibGUtZXZlbnQtcG9sbC5ydWxlcyB8ICA0ICsKIHBhY2thZ2Uv
cGV0aXRib290L3NoZWxsX2NvbmZpZyAgICAgICAgICAgICAgIHwgMTkgKysrKysKIHBhY2thZ2Uv
cGV0aXRib290L3NoZWxsX3Byb2ZpbGUgICAgICAgICAgICAgIHwgIDIgKwogc3VwcG9ydC9zY3Jp
cHRzL2Jvb3QtcWVtdS1pbWFnZS5weSAgICAgICAgICAgfCAxMyArKystCiAyMyBmaWxlcyBjaGFu
Z2VkLCA0MTcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBib2FyZC9xZW11L202OGstdmlydC9saW51eC5mcmFnbWVudAogY3JlYXRlIG1vZGUgMTAwNjQ0
IGJvYXJkL3FlbXUvbTY4ay12aXJ0L3JlYWRtZS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25m
aWdzL3FlbXVfbTY4a192aXJ0X3BldGl0Ym9vdF9kZWZjb25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3BldGl0Ym9vdC82My1tZC1yYWlkLWFycmF5cy5ydWxlcwogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvcGV0aXRib290LzY1LW1kLWluY3JlbWVudGFsLnJ1bGVzCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3QvNjYtYWRkLXNnLW1vZHVsZS5ydWxlcwogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L0NvbmZpZy5pbgogY3JlYXRlIG1vZGUg
MTAwNzU1IHBhY2thZ2UvcGV0aXRib290L1MxNHNpbGVuY2UtY29uc29sZQogY3JlYXRlIG1vZGUg
MTAwNzU1IHBhY2thZ2UvcGV0aXRib290L1MxNXBiLWRpc2NvdmVyCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9wZXRpdGJvb3QvZnMtb3ZlcmxheS9ldGMvaW5pdHRhYgogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L2ZzLW92ZXJsYXkvZXRjL2xvY2FsZQogY3JlYXRlIG1v
ZGUgMTAwNzU1IHBhY2thZ2UvcGV0aXRib290L2ZzLW92ZXJsYXkvaW5pdAogY3JlYXRlIG1vZGUg
MTAwNzU1IHBhY2thZ2UvcGV0aXRib290L2tleGVjLXJlc3RhcnQKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QtY29uc29sZS11aS5ydWxlcwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC5oYXNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9wZXRpdGJvb3QvcmVtb3ZhYmxlLWV2ZW50LXBvbGwucnVsZXMKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3BldGl0Ym9vdC9zaGVsbF9jb25maWcKIGNyZWF0ZSBtb2RlIDEwMDc1
NSBwYWNrYWdlL3BldGl0Ym9vdC9zaGVsbF9wcm9maWxlCgotLSAKMi4zOS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
