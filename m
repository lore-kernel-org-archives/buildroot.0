Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5C8C4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 15:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCFB8136C;
	Sun,  4 Dec 2022 15:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BCFB8136C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-6RNRUXcdkC; Sun,  4 Dec 2022 15:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21F4D81440;
	Sun,  4 Dec 2022 15:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21F4D81440
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C0A2D1BF420
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 15:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BA79607F5
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 15:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA79607F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6tYoPEVXlzl for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 15:35:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27A04606EB
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27A04606EB
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 15:35:18 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout04.t-online.de (Postfix) with SMTP id 5E43BAA94;
 Sun,  4 Dec 2022 16:35:15 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p1r1O-1Ahmjp0; Sun, 4 Dec 2022 16:35:15 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:58512)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p1r1O-0003jK-20;
 Sun, 04 Dec 2022 16:35:14 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  4 Dec 2022 16:35:10 +0100
Message-Id: <20221204153511.37857-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670168115-88EA281F-87D0B9B9/0/0 CLEAN NORMAL
X-TOI-MSGID: 3f4f8037-0099-424f-aba0-ceb8ef56c630
Subject: [Buildroot] [PATCH/next 1/2] package/mesa3d: fix uClibc build
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TW92ZWQgdGhlIHV0aWwvY29tcGlsZXIuaCBpbmNsdWRlIHRvIHV0aWwvbWFjcm9zLmggZHVlIHRv
IHVwc3RyZWFtCmNvbW1pdCB3aGljaCBhZGRlZCBzdGF0aWNfYXNzZXJ0KCkgdG8gc3JjL3V0aWwv
bWFjcm9zLmgKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvY29tbWl0L3Ny
Yy91dGlsL21hY3Jvcy5oP2g9MjIuMiZpZD1mMTAyMzU3MWU4Y2U3Y2NiNmVjN2JjMTE1MjQwY2I3
NmFlZjNlNWU1CgpQbGVhc2Ugbm90ZSB0aGF0IHRoaXMgcGF0Y2ggY2FuIGJlIHJlbW92ZWQgd2hl
biBidWlsZHJvb3QgdG9vbGNoYWlucwphcmUgdXBkYXRlZCB0byB1Q2xpYmMgMS4wLjQyOgpodHRw
czovL2NnaXQudWNsaWJjLW5nLm9yZy9jZ2kvY2dpdC91Y2xpYmMtbmcuZ2l0L2NvbW1pdC8/aD12
MS4wLjQyJmlkPTAzZmJkOTQxZTk0Mzk3NmJiOTJjYjM5Mjg4MmMyZmY3ZWMyMTg3MDQKCkZpeGVz
OgpodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9hNTUvYTU1ZDY5ODBmYWFk
OGI1MDYzZjhmNGY4Yjg5NDY3MDYxZDQ0YTJhZS8KClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxz
IDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCmNoZXJyeS1waWNrZWQgZnJvbSBt
YXN0ZXIgYnJhbmNoOgpodHRwczovL2dpdC5idXN5Ym94Lm5ldC9idWlsZHJvb3QvY29tbWl0L3Bh
Y2thZ2UvbWVzYTNkP2lkPTZlYmZlNjQ3YjZkZjc2MDE2ZmI4YTUwYjcxOGQ2MGZkZmYxNWZlODcK
CiBwYWNrYWdlL21lc2EzZC8wMDA0LUZpeC11Q2xpYmMtYnVpbGQucGF0Y2ggfCAzNyArKysrKysr
KysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTYgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvMDAwNC1GaXgtdUNsaWJjLWJ1
aWxkLnBhdGNoIGIvcGFja2FnZS9tZXNhM2QvMDAwNC1GaXgtdUNsaWJjLWJ1aWxkLnBhdGNoCmlu
ZGV4IDcwZmY1ZTJiNGMuLmM4YzgyZmUwZGMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNkLzAw
MDQtRml4LXVDbGliYy1idWlsZC5wYXRjaAorKysgYi9wYWNrYWdlL21lc2EzZC8wMDA0LUZpeC11
Q2xpYmMtYnVpbGQucGF0Y2gKQEAgLTE4LDI5ICsxOCwyMiBAQCBGaXhlcyBidWlsZCBlcnJvcnMg
d2l0aCB1Q2xpYmMgYW5kIGdjYy05LjMuMDoKICBmdW5jdGlvbiDigJhzdGF0aWNfYXNzZXJ04oCZ
IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXSAxMDEgfAogIHN0YXRpY19h
c3NlcnQoQVJSQVlfU0laRShlZ2xfcGxhdGZvcm1zKSA9PSBfRUdMX05VTV9QTEFURk9STVMsCiAK
Ky4uL3NyYy91dGlsL21hY3Jvcy5oOjc0OjQ6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBv
ZiBmdW5jdGlvbgorIOKAmHN0YXRpY19hc3NlcnTigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rp
b24tZGVjbGFyYXRpb25dCisgICA3NCB8ICAgIHN0YXRpY19hc3NlcnQoY29uZCwgI2NvbmQpOyBc
CisgICAgICB8ICAgIF5+fn5+fn5+fn5+fn4KKwogUGF0Y2ggc2VudCB1cHN0cmVhbToKIGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy8xMzg5
OAogCiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+
CiAtLS0KLSBzcmMvZWdsL21haW4vZWdsZGlzcGxheS5jIHwgIDEgKwotIHNyYy91dGlsL2NvbXBp
bGVyLmggICAgICAgfCAxMCArKysrKysrKysrCisgc3JjL3V0aWwvY29tcGlsZXIuaCB8IDEwICsr
KysrKysrKysKKyBzcmMvdXRpbC9tYWNyb3MuaCAgIHwgIDEgKwogIDIgZmlsZXMgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKQogCi1kaWZmIC0tZ2l0IGEvc3JjL2VnbC9tYWluL2VnbGRpc3BsYXku
YyBiL3NyYy9lZ2wvbWFpbi9lZ2xkaXNwbGF5LmMKLWluZGV4IDEzMWZjMjI3ODZmOS4uZDNlMmJi
OTZlMmY2IDEwMDY0NAotLS0tIGEvc3JjL2VnbC9tYWluL2VnbGRpc3BsYXkuYwotKysrIGIvc3Jj
L2VnbC9tYWluL2VnbGRpc3BsYXkuYwotQEAgLTQyLDYgKzQyLDcgQEAKLSAjZW5kaWYKLSAjaW5j
bHVkZSA8ZmNudGwuaD4KLSAjaW5jbHVkZSAiYzExL3RocmVhZHMuaCIKLSsjaW5jbHVkZSAidXRp
bC9jb21waWxlci5oIgotICNpbmNsdWRlICJ1dGlsL21hY3Jvcy5oIgotICNpbmNsdWRlICJ1dGls
L29zX2ZpbGUuaCIKLSAjaW5jbHVkZSAidXRpbC91X2F0b21pYy5oIgogZGlmZiAtLWdpdCBhL3Ny
Yy91dGlsL2NvbXBpbGVyLmggYi9zcmMvdXRpbC9jb21waWxlci5oCi1pbmRleCBkMTg0YWQ0NTVh
ZjkuLmI1YzU2ODA3YWNjNiAxMDA2NDQKK2luZGV4IGQxODRhZDQ1NWFmLi5iNWM1NjgwN2FjYyAx
MDA2NDQKIC0tLSBhL3NyYy91dGlsL2NvbXBpbGVyLmgKICsrKyBiL3NyYy91dGlsL2NvbXBpbGVy
LmgKIEBAIC0zNiw2ICszNiwxNiBAQApAQCAtNjAsNiArNTMsMTggQEAgaW5kZXggZDE4NGFkNDU1
YWY5Li5iNWM1NjgwN2FjYzYgMTAwNjQ0CiAgI2luY2x1ZGUgInV0aWwvbWFjcm9zLmgiCiAgCiAg
CitkaWZmIC0tZ2l0IGEvc3JjL3V0aWwvbWFjcm9zLmggYi9zcmMvdXRpbC9tYWNyb3MuaAoraW5k
ZXggMjJiMTgzMDM4MjYuLjhmNzNlZTcyNjkzIDEwMDY0NAorLS0tIGEvc3JjL3V0aWwvbWFjcm9z
LmgKKysrKyBiL3NyYy91dGlsL21hY3Jvcy5oCitAQCAtMjcsNiArMjcsNyBAQAorICNpbmNsdWRl
IDxzdGRpby5oPgorICNpbmNsdWRlIDxhc3NlcnQuaD4KKyAjaW5jbHVkZSA8c3RkaW50Lmg+Cisr
I2luY2x1ZGUgInV0aWwvY29tcGlsZXIuaCIKKyAKKyAvKiBDb21wdXRlIHRoZSBzaXplIG9mIGFu
IGFycmF5ICovCisgI2lmbmRlZiBBUlJBWV9TSVpFCiAtLSAKLUdpdExhYgorMi4zNC4xCiAKLS0g
CjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
