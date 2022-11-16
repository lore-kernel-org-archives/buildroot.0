Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2446EC4332F
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 18:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D997818B5;
	Wed, 16 Nov 2022 18:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D997818B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eH9GG__nVKuN; Wed, 16 Nov 2022 18:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B438E81551;
	Wed, 16 Nov 2022 18:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B438E81551
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71D2B1BF487
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 18:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B3C54182A
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 18:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B3C54182A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86USmgabAbV8 for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 18:05:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D83B417C4
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D83B417C4
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 18:05:02 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout09.t-online.de (Postfix) with SMTP id 20D7EDBCD;
 Wed, 16 Nov 2022 19:04:56 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.191.22]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ovMmK-1Wwp0b0; Wed, 16 Nov 2022 19:04:52 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35332)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ovMmK-00035L-0G;
 Wed, 16 Nov 2022 19:04:52 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 19:04:52 +0100
Message-Id: <20221116180452.700415-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1668621892-2D8B7EA1-8F6356E2/0/0 CLEAN NORMAL
X-TOI-MSGID: 853d6c4e-7a04-4bfb-92c4-e9debc917212
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix uClibc build
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
Cc: Romain Naour <romain.naour@gmail.com>
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
IDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4KLS0tCiBwYWNrYWdlL21lc2EzZC8wMDA0LUZpeC11
Q2xpYmMtYnVpbGQucGF0Y2ggfCAzNyArKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9tZXNhM2QvMDAwNC1GaXgtdUNsaWJjLWJ1aWxkLnBhdGNoIGIvcGFja2FnZS9tZXNhM2Qv
MDAwNC1GaXgtdUNsaWJjLWJ1aWxkLnBhdGNoCmluZGV4IDcwZmY1ZTJiNGMuLmM4YzgyZmUwZGMg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNkLzAwMDQtRml4LXVDbGliYy1idWlsZC5wYXRjaAor
KysgYi9wYWNrYWdlL21lc2EzZC8wMDA0LUZpeC11Q2xpYmMtYnVpbGQucGF0Y2gKQEAgLTE4LDI5
ICsxOCwyMiBAQCBGaXhlcyBidWlsZCBlcnJvcnMgd2l0aCB1Q2xpYmMgYW5kIGdjYy05LjMuMDoK
ICBmdW5jdGlvbiDigJhzdGF0aWNfYXNzZXJ04oCZIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9u
LWRlY2xhcmF0aW9uXSAxMDEgfAogIHN0YXRpY19hc3NlcnQoQVJSQVlfU0laRShlZ2xfcGxhdGZv
cm1zKSA9PSBfRUdMX05VTV9QTEFURk9STVMsCiAKKy4uL3NyYy91dGlsL21hY3Jvcy5oOjc0OjQ6
IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbgorIOKAmHN0YXRpY19hc3Nl
cnTigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCisgICA3NCB8ICAg
IHN0YXRpY19hc3NlcnQoY29uZCwgI2NvbmQpOyBcCisgICAgICB8ICAgIF5+fn5+fn5+fn5+fn4K
KwogUGF0Y2ggc2VudCB1cHN0cmVhbToKIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9t
ZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy8xMzg5OAogCiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBL
dWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+CiAtLS0KLSBzcmMvZWdsL21haW4vZWdsZGlz
cGxheS5jIHwgIDEgKwotIHNyYy91dGlsL2NvbXBpbGVyLmggICAgICAgfCAxMCArKysrKysrKysr
Cisgc3JjL3V0aWwvY29tcGlsZXIuaCB8IDEwICsrKysrKysrKysKKyBzcmMvdXRpbC9tYWNyb3Mu
aCAgIHwgIDEgKwogIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQogCi1kaWZmIC0t
Z2l0IGEvc3JjL2VnbC9tYWluL2VnbGRpc3BsYXkuYyBiL3NyYy9lZ2wvbWFpbi9lZ2xkaXNwbGF5
LmMKLWluZGV4IDEzMWZjMjI3ODZmOS4uZDNlMmJiOTZlMmY2IDEwMDY0NAotLS0tIGEvc3JjL2Vn
bC9tYWluL2VnbGRpc3BsYXkuYwotKysrIGIvc3JjL2VnbC9tYWluL2VnbGRpc3BsYXkuYwotQEAg
LTQyLDYgKzQyLDcgQEAKLSAjZW5kaWYKLSAjaW5jbHVkZSA8ZmNudGwuaD4KLSAjaW5jbHVkZSAi
YzExL3RocmVhZHMuaCIKLSsjaW5jbHVkZSAidXRpbC9jb21waWxlci5oIgotICNpbmNsdWRlICJ1
dGlsL21hY3Jvcy5oIgotICNpbmNsdWRlICJ1dGlsL29zX2ZpbGUuaCIKLSAjaW5jbHVkZSAidXRp
bC91X2F0b21pYy5oIgogZGlmZiAtLWdpdCBhL3NyYy91dGlsL2NvbXBpbGVyLmggYi9zcmMvdXRp
bC9jb21waWxlci5oCi1pbmRleCBkMTg0YWQ0NTVhZjkuLmI1YzU2ODA3YWNjNiAxMDA2NDQKK2lu
ZGV4IGQxODRhZDQ1NWFmLi5iNWM1NjgwN2FjYyAxMDA2NDQKIC0tLSBhL3NyYy91dGlsL2NvbXBp
bGVyLmgKICsrKyBiL3NyYy91dGlsL2NvbXBpbGVyLmgKIEBAIC0zNiw2ICszNiwxNiBAQApAQCAt
NjAsNiArNTMsMTggQEAgaW5kZXggZDE4NGFkNDU1YWY5Li5iNWM1NjgwN2FjYzYgMTAwNjQ0CiAg
I2luY2x1ZGUgInV0aWwvbWFjcm9zLmgiCiAgCiAgCitkaWZmIC0tZ2l0IGEvc3JjL3V0aWwvbWFj
cm9zLmggYi9zcmMvdXRpbC9tYWNyb3MuaAoraW5kZXggMjJiMTgzMDM4MjYuLjhmNzNlZTcyNjkz
IDEwMDY0NAorLS0tIGEvc3JjL3V0aWwvbWFjcm9zLmgKKysrKyBiL3NyYy91dGlsL21hY3Jvcy5o
CitAQCAtMjcsNiArMjcsNyBAQAorICNpbmNsdWRlIDxzdGRpby5oPgorICNpbmNsdWRlIDxhc3Nl
cnQuaD4KKyAjaW5jbHVkZSA8c3RkaW50Lmg+CisrI2luY2x1ZGUgInV0aWwvY29tcGlsZXIuaCIK
KyAKKyAvKiBDb21wdXRlIHRoZSBzaXplIG9mIGFuIGFycmF5ICovCisgI2lmbmRlZiBBUlJBWV9T
SVpFCiAtLSAKLUdpdExhYgorMi4zNC4xCiAKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
