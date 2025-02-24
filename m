Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120F3C021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 12:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9DC14096A;
	Mon, 24 Feb 2025 12:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GjQJqmBCv1y; Mon, 24 Feb 2025 12:55:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F5EF4096B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F5EF4096B;
	Mon, 24 Feb 2025 12:55:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E6CCB88
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 12:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1378660D71
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 12:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-ssJY_YBW8R for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 12:54:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D07760D6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D07760D6E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D07760D6E
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 12:54:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.124.97]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wys-1th3ne37Ce-003qjG; Mon, 24
 Feb 2025 13:54:54 +0100
To: buildroot@buildroot.org
Date: Mon, 24 Feb 2025 13:54:33 +0100
Message-ID: <20250224125433.2768708-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:IIWGm0+KKYoupzOcYezv99oDB3J0Ceg3U04kmJmFykRyAj2hAib
 lOOJSeC2we5IzVJY1Gg88qP54weJLR6OYmJXWNoq6nW7gprhVGoVXLFlZLpUj1jyRWW2Em9
 Wk/HfWAL39lVY2kcKG4WQp1MeMMYhldqS8rU4kkkZLqvk95kLg2douDABb3tHAtDgb/osb0
 /bVz9oMy6pOh8UKcrKlNQ==
UI-OutboundReport: notjunk:1;M01:P0:49mcfzB5kqk=;z89yvI/l6HEpeVVdkacFSXQUOFi
 Ipo0A5aN7+ei2UCA7nXN9GEwKDou+uz0lYFK8zHBgoK9EXzLWZyYN1Nw6e3aBWq/7VkyxmLAG
 Xhrq2Ru1/Jo6vjNVx6Y/Bz3KAuKzARmReGo8ZKeAU71hyS4flARWqAoGhHoaNgvp1nAxURkj8
 kPBUxIBsEPVqP12W7B7j1PStBVPUaY1s5k+H1OEwF5MY6NL+nMO3HUbLfqCDDTJUsbfScPdZN
 8MEjuLDrIY4CZ3tvUK5Seun7jvclUMDzNvLIZbTklQG0MUSxmuJbW+c0s6xtJHIrFecAeZu11
 TeQKWCOGmU7gxNf1OxmuqorXHUGHTxlWczHzu4UTXcI8q3Hlxg4BU+N4qrhHsspmduglTVcss
 xO+cIj67XTUjXjuxQ+GTphKAwAoTvKw8SZ0rqUC02ybJj/A9ZRqswKIxTLSJ8Z86acyRPN11B
 zXLL2bjqBoKrGLyk3DBfHVgYAZVdgehj0Hzl1r7KZvKwJYfbuZYNVGwph6MTPstinKUSH3mGi
 wQWkJ8W0y4P2oTxrDIc1M3TDtPrznOGuJk6XnnZjdjxekdOMOVdJC+bIzvdVwjikENnwD0sGS
 VXrL0+II+HLMoCvq7hyna7ugFzHZYjO1Er1CnE51gzRg9cxHsGUMOcQOErRp11XkJiedg5Wlg
 iec8PiDpLP+ZiRNGw1Sj2Bp8cXB3gidQ1IeRzQ5d4YK3XonN2VBnG1r/kly0nAnWOw8H9txmj
 oRayLsLIHCtW4ojkwpC2Tk7okTto4Jh3meJ8UJPHDJ9i4d1XERDvDd3tXtqcGaP4N6cOk8x3r
 3Qtq7R52cq0c2V/ljaRegrq01h18xeJUZ46KUPr9EWjh7yZemRokRQTyYuBVwEJLhiMCpSgWG
 nbnN9ySzcnk/6pSjEXX3K//oxmEmEEaZ8m3Ck/2vH1kFCWQqsbJZteTvIe3j6LtrPmjKiPgxi
 F15Y8YyHg29bv+tdZv5YlTjEU21a9ff+T8/57gPlVYOnD3hvnySqK3I639CruoLjaT+Mumhgv
 DUdkRNytqHX8VYg/v88M5CqEC8qoKgAJHipTcIiZkZirfPSpRlh4ymSZOH4xCwMTLhUGue7PX
 P+nPdk26XzI5Be92/8AJLXusYEl02E0/9tTRs0H3ehMyOzS0h522wLfrdiOvxn9VpZ4vNXAyX
 NBp4vhiziGR3nEsTxk5hxAKxk/DZeKZZQyobxmW2YaNjdgKsM3ZPp2noLaxth5EMKQYynWesS
 PzILUiG146WBt2bDUw9my1Qp4AfyYzDhiZcMC8lKh4hqtKBpI8rs+ZotqmLCHAqCKKjUXPMAB
 UcLnljpatG8Hf4lnhUMUO8+f0Fk0T7sriJ/buZvhFoxFCSEeAfDyA0f72XvFA4oUALZnV1mmy
 j88hhD5Vo+EzmDjy5Ge3A8gwWi47FT6qhsVEoFnE/jy+Lrjk3AAzr42x41hz95rGFGQrIpDM7
 Qf7Ar1w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1740401695; x=1741006495; i=fiona.klute@gmx.de;
 bh=NzA4WCalqEZHtiGMUAsfj+JxvZKZ/wKDgmC9YA+F/mE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RVRcUyrQl7QLtCiFIuwxazt5kKEKYW6+x2hkNoLgrmtOvNbYYPKquh2Y7Ky0kE/J
 t06dDlcROW2pZ+0nskZbljWzvD5HylbL3n7N3nHUOOUgWWzSRIdQbWGq4brPoflwz
 0XGhfvnWp4YU1WhIpww5D0lGpoQw6S+pEqqTS4shy7zXrD1ZwqFVpvskTBoUdnqrG
 F3y4wIKtG4VY652OGDq7qa7OkOD/wvV4QpzCv2sx7uQv5aNTaILDZ1Q8m3qxgHVcy
 fi3uGXAiNMHwgxUgpJNqQkIljYUYuTbAxlmfKCpJ+vD9Spq8yhv3pI+84tCCrWPSH
 1Gzw/47CEtLDswwyvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=RVRcUyrQ
Subject: [Buildroot] [PATCH v4 1/1] package/wlr-randr: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMu
Y29tPgoKVXRpbGl0eSB0byBtYW5hZ2Ugb3V0cHV0cyBvZiBhIFdheWxhbmQgY29tcG9zaXRvci4K
ClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tp
QGFybWFkZXVzLmNvbT4KW0Zpb25hOgogIC0gZml4IGJ1aWxkIHdpdGggdUNsaWJjCiAgLSB1cGRh
dGUgdG8gMC41LjAgd2l0aCBtb3ZlIHRvIGdpdGxhYi5mcmVlZGVza3RvcC5vcmcKXQpTaWduZWQt
b2ZmLWJ5OiBGaW9uYSBLbHV0ZSAoV0lXQSkgPGZpb25hLmtsdXRlQGdteC5kZT4KLS0tCkNoYW5n
ZXMgdjMgLT4gdjQ6CiogVXBkYXRlIHZlcnNpb24gdG8gMC41LjAsIHdpdGggbW92ZSB0byBmcmVl
ZGVza3RvcC5vcmcKKiBVc2UgbmFycm93ZXIgZGVmaW5lIF9YT1BFTl9TT1VSQ0U9NTAwIHRvIHBy
b3ZpZGUgc3RyZHVwKCksIHRoYW5rcyBKdWxpZW4KCkNoYW5nZXMgdjIgLT4gdjM6CiogRGVmaW5l
IF9HTlVfU09VUkNFIHRvIHByb3ZpZGUgc3RyZHVwKCkgYW5kIGZpeCBidWlsZCB3aXRoIHVDbGli
YwoKU2VlIFPDqWJhc3RpZW4ncyBvcmlnaW5hbCBwYXRjaCAodjIpOgpodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjUwMTMxLWFkZC13bHItcmFu
ZHItcGFja2FnZS12Mi0xLTdlYTFhNDRiNWI3ZUBhcm1hZGV1cy5jb20vCgogREVWRUxPUEVSUyAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAg
ICAgICB8ICAxICsKIHBhY2thZ2Uvd2xyLXJhbmRyL0NvbmZpZy5pbiAgICAgIHwgIDcgKysrKysr
KwogcGFja2FnZS93bHItcmFuZHIvd2xyLXJhbmRyLmhhc2ggfCAgNSArKysrKwogcGFja2FnZS93
bHItcmFuZHIvd2xyLXJhbmRyLm1rICAgfCAyMSArKysrKysrKysrKysrKysrKysrKysKIDUgZmls
ZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
d2xyLXJhbmRyL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvd2xyLXJhbmRy
L3dsci1yYW5kci5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS93bHItcmFuZHIvd2xy
LXJhbmRyLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggMDYy
NDIwYWM1MC4uMTRhNjVjMDQ2ZiAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9Q
RVJTCkBAIC0yOTYxLDYgKzI5NjEsNyBAQCBGOglwYWNrYWdlL254cC1td2lmaWV4LwogRjoJcGFj
a2FnZS9tbWMtdXRpbHMvCiBGOglwYWNrYWdlL3B5dGhvbi1mbGFzay1qc29ucnBjLwogRjoJcGFj
a2FnZS9weXRob24tZmxhc2stbG9naW4vCitGOglwYWNrYWdlL3dsci1yYW5kci8KIEY6CXBhY2th
Z2UvcXQ1L3F0NWNoYXJ0cy8KIAogTjoJU2VteW9uIEtvbGdhbm92IDxzZW1lbmFrOTRAbWFpbC5y
dT4KZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5k
ZXggMDY2M2NjMWIyNS4uZTEwMGM5NTI0MyAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4K
KysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTI3OTMsNiArMjc5Myw3IEBAIGNvbW1lbnQgIlV0
aWxpdGllcyIKIAlzb3VyY2UgInBhY2thZ2UvdG11eC9Db25maWcuaW4iCiAJc291cmNlICJwYWNr
YWdlL3R0eWQvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS93aGljaC9Db25maWcuaW4iCisJ
c291cmNlICJwYWNrYWdlL3dsci1yYW5kci9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3d0
ZnV0aWwvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS94bWxzdGFybGV0L0NvbmZpZy5pbiIK
IAlzb3VyY2UgInBhY2thZ2UveHhoYXNoL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
d2xyLXJhbmRyL0NvbmZpZy5pbiBiL3BhY2thZ2Uvd2xyLXJhbmRyL0NvbmZpZy5pbgpuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5mYTM1NjU1NjBiCi0tLSAvZGV2L251bGwK
KysrIGIvcGFja2FnZS93bHItcmFuZHIvQ29uZmlnLmluCkBAIC0wLDAgKzEsNyBAQAorY29uZmln
IEJSMl9QQUNLQUdFX1dMUl9SQU5EUgorCWJvb2wgIndsci1yYW5kciIKKwlkZXBlbmRzIG9uIEJS
Ml9QQUNLQUdFX1dBWUxBTkQgIyB3YXlsYW5kLWNsaWVudAorCWhlbHAKKwkgIFV0aWxpdHkgdG8g
bWFuYWdlIG91dHB1dHMgb2YgYSBXYXlsYW5kIGNvbXBvc2l0b3IuCisKKwkgIGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9lbWVyc2lvbi93bHItcmFuZHIKZGlmZiAtLWdpdCBhL3BhY2th
Z2Uvd2xyLXJhbmRyL3dsci1yYW5kci5oYXNoIGIvcGFja2FnZS93bHItcmFuZHIvd2xyLXJhbmRy
Lmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYThiNWRmYzk1NQot
LS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvd2xyLXJhbmRyL3dsci1yYW5kci5oYXNoCkBAIC0w
LDAgKzEsNSBAQAorIyBDYWxjdWxhdGVkIGxvY2FsbHkKK3NoYTI1NiAgYTY0YjZlYjI5NmQxYzc1
YWYwOThmYTJkMjI5ZjlhYWYzY2VhZTQ1ZWVmZjI0MDU2OTMwYmQ0YmM2MTNjNmE1ZSAgd2xyLXJh
bmRyLTAuNS4wLnRhci5negorCisjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZXM6CitzaGEyNTYgIDdm
M2U4NDRhNTUwZGE3NGQ1ZjBhNjM1YWUxMjYzY2I3ZGFmZGE3YmQxNWFjMzczNjRkZGRlODVkZTgz
YTc4YzcgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2xyLXJhbmRyL3dsci1yYW5kci5t
ayBiL3BhY2thZ2Uvd2xyLXJhbmRyL3dsci1yYW5kci5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwLi5jNTI2NGRlYWU3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS93
bHItcmFuZHIvd2xyLXJhbmRyLm1rCkBAIC0wLDAgKzEsMjEgQEAKKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCisjCisjIHdsci1yYW5kcgorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworV0xS
X1JBTkRSX1ZFUlNJT04gPSAwLjUuMAorV0xSX1JBTkRSX1NJVEUgPSBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZW1lcnNpb24vd2xyLXJhbmRyLy0vcmVsZWFzZXMvdiQoV0xSX1JBTkRS
X1ZFUlNJT04pL2Rvd25sb2FkcworV0xSX1JBTkRSX0xJQ0VOU0UgPSBNSVQKK1dMUl9SQU5EUl9M
SUNFTlNFX0ZJTEVTID0gTElDRU5TRQorIyBob3N0LXdheWxhbmQgaXMgZm9yIHdheWxhbmQtc2Nh
bm5lcgorV0xSX1JBTkRSX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBob3N0LXdheWxhbmQg
d2F5bGFuZAorCitpZmVxICgkKEJSMl9UT09MQ0hBSU5fVVNFU19VQ0xJQkMpLHkpCisjIHVDbGli
YyA8IDEuMC4zOCBkb2VzIG5vdCBleHBvc2Ugc3RyZHVwKCkgd2hlbiBfUE9TSVhfQ19TT1VSQ0Ug
Pj0gMjAwODA5TAorIyBTZWU6IGh0dHBzOi8vY2dpdC51Y2xpYmMtbmcub3JnL2NnaS9jZ2l0L3Vj
bGliYy1uZy5naXQvY29tbWl0Lz9pZD0wZGFhYjE1MDgzNzllMjNhMDlhYjdmZGI0NjkwMTgyMjhk
OTUxODk0CisjIFdlIGRlZmluZSBfWE9QRU5fU09VUkNFPTUwMCBhcyBhIHdvcmthcm91bmQuCitX
TFJfUkFORFJfQ09ORl9PUFRTICs9IC1EY19hcmdzPS1EX1hPUEVOX1NPVVJDRT01MDAKK2VuZGlm
CisKKyQoZXZhbCAkKG1lc29uLXBhY2thZ2UpKQotLSAKMi40Ny4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
