Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E09FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 13:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBA5B840E3;
	Mon, 30 May 2022 13:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7PG6zGO7lSan; Mon, 30 May 2022 13:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E294A84035;
	Mon, 30 May 2022 13:28:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B80FF1BF357
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 13:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A713E83FC3
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 13:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NpEmzr-yozXI for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 13:28:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0B0482B81
 for <buildroot@busybox.net>; Mon, 30 May 2022 13:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.desaster-games.net (Postfix) with ESMTP id 7649395A3;
 Mon, 30 May 2022 15:27:58 +0200 (CEST)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
 by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hROt1sv-1-9r; Mon, 30 May 2022 15:27:45 +0200 (CEST)
Received: from linux-es2v.suse.de (unknown [81.95.8.244])
 by mail.desaster-games.net (Postfix) with ESMTPSA id E4BC51E005;
 Mon, 30 May 2022 15:27:07 +0200 (CEST)
From: Michael Vetter <jubalh@iodoru.org>
To: buildroot@busybox.net
Date: Mon, 30 May 2022 15:27:07 +0200
Message-Id: <20220530132707.1672-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Update libstrophe to 0.12.0
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
Cc: Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIGxpYnN0cm9waGUgdG8gMC4xMi4wCkFuZCBmaXggdGhlIGJ1aWxkIHdpdGg6IGxpYnN0
cm9waGUvMDAwMS1maXgtc3NpemVfdC5wYXRjaApEaXNjdXNzaW9uIHVwc3RyZWFtIGF0OiBodHRw
czovL2dpdGh1Yi5jb20vc3Ryb3BoZS9saWJzdHJvcGhlL3B1bGwvMjA3CgpTaWduZWQtb2ZmLWJ5
OiBNaWNoYWVsIFZldHRlciA8anViYWxoQGlvZG9ydS5vcmc+Ci0tLQogcGFja2FnZS9saWJzdHJv
cGhlLzAwMDEtZml4LXNzaXplX3QucGF0Y2ggfCA0NiArKysrKysrKysrKysrKysrKysrKysrKwog
cGFja2FnZS9saWJzdHJvcGhlL2xpYnN0cm9waGUuaGFzaCAgICAgICAgfCAgMiArLQogcGFja2Fn
ZS9saWJzdHJvcGhlL2xpYnN0cm9waGUubWsgICAgICAgICAgfCAgMiArLQogMyBmaWxlcyBjaGFu
Z2VkLCA0OCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvbGlic3Ryb3BoZS8wMDAxLWZpeC1zc2l6ZV90LnBhdGNoCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9saWJzdHJvcGhlLzAwMDEtZml4LXNzaXplX3QucGF0Y2ggYi9wYWNrYWdlL2xpYnN0
cm9waGUvMDAwMS1maXgtc3NpemVfdC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi45ZTRmMGIxZTkzCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9saWJzdHJv
cGhlLzAwMDEtZml4LXNzaXplX3QucGF0Y2gKQEAgLTAsMCArMSw0NiBAQAorRnJvbSBmMzFlZjlj
MzVjOWJiYTgzMTUxMDc3N2Q1NTFjNDE3OTI5NWIyMDhmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbTogTWljaGFlbCBWZXR0ZXIgPGp1YmFsaEBpb2RvcnUub3JnPgorRGF0ZTogTW9uLCAz
MCBNYXkgMjAyMiAxNDo0Nzo0NCArMDIwMAorU3ViamVjdDogW1BBVENIXSBJbmNsdWRlIHN5cy90
eXBlcy5oIGZvciBzc2l6ZV90CitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0
L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisK
K1doZW4gY29tcGlsaW5nIG9uIGJ1aWxkcm9vdCBJIGdldDoKK2BzcmMvdGxzLmM6MjM1OjI4OiBl
cnJvcjog4oCYc3NpemVfdOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcworZnVuY3Rp
b24pOyBkaWQgeW91IG1lYW4g4oCYc2l6ZV904oCZPyBgCisKK1RvIGhhdmUgdGhpcyBQT1NJWCB0
eXBlIGF2YWlsYWJsZSB3ZSB3aWxsIG5lZWQgdG8gaW5jbHVkZQorYHN5cy90eXBlcy5oYCBvbiBM
aW51eC4gVW5zdXJlIGFib3V0IG90aGVyIHN5c3RlbXMuCistLS0KKyBzcmMvcmFuZC5jIHwgMSAr
Cisgc3JjL3Rscy5jICB8IDQgKysrKworIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
CisKK2RpZmYgLS1naXQgYS9zcmMvcmFuZC5jIGIvc3JjL3JhbmQuYworaW5kZXggMDYxZTg1ZWUu
LjI1ZTQ2MTRhIDEwMDY0NAorLS0tIGEvc3JjL3JhbmQuYworKysrIGIvc3JjL3JhbmQuYworQEAg
LTI4LDYgKzI4LDcgQEAKKyAjaWYgX19HTElCQ19QUkVSRVEoMiwgMjUpCisgI2RlZmluZSBVU0Vf
R0VUUkFORE9NCisgI2luY2x1ZGUgPHN5cy9yYW5kb20uaD4KKysjaW5jbHVkZSA8c3lzL3R5cGVz
Lmg+CisgI2luY2x1ZGUgPGVycm5vLmg+CisgI2VuZGlmCisgI2VuZGlmCitkaWZmIC0tZ2l0IGEv
c3JjL3Rscy5jIGIvc3JjL3Rscy5jCitpbmRleCAxN2Q4NWRkYS4uNTQ3NDZiYWEgMTAwNjQ0Cist
LS0gYS9zcmMvdGxzLmMKKysrKyBiL3NyYy90bHMuYworQEAgLTIxLDYgKzIxLDEwIEBACisgI2lu
Y2x1ZGUgPHN0ZGFyZy5oPgorICNpbmNsdWRlIDxzdHJpbmcuaD4KKyAKKysjaWYgZGVmaW5lZChf
X2xpbnV4X18pCisrI2luY2x1ZGUgPHN5cy90eXBlcy5oPgorKyNlbmRpZgorKworICNpbmNsdWRl
ICJzdHJvcGhlLmgiCisgCisgI2luY2x1ZGUgImNvbW1vbi5oIgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9saWJzdHJvcGhlL2xpYnN0cm9waGUuaGFzaCBiL3BhY2thZ2UvbGlic3Ryb3BoZS9saWJzdHJv
cGhlLmhhc2gKaW5kZXggOTU1MWIxOTFjNi4uNjZmZjBlN2U3ZSAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9saWJzdHJvcGhlL2xpYnN0cm9waGUuaGFzaAorKysgYi9wYWNrYWdlL2xpYnN0cm9waGUvbGli
c3Ryb3BoZS5oYXNoCkBAIC0xLDQgKzEsNCBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1
NiAgZmVhZmVlNTQ1NDAzZDI2YTQ0YWE1NzNkNGFkZjMyN2Q2ZDA3YWQzZjM0NjYzNzA2MzRkMjJi
YmFjNWJkNDllZSAgbGlic3Ryb3BoZS0wLjExLjAudGFyLnh6CitzaGEyNTYgIDhlNDRhY2IyNjAx
ODgxNmY5ODU2NjI2YmQ1ZmY5MjRhMzZjYzYxMmQyYjM3NDdlZTYzNGQ2MjYzMjZiNzJkZjcgIGxp
YnN0cm9waGUtMC4xMi4wLnRhci54egogc2hhMjU2ICA4MjQ3NmYzNmZmZDVlODk1YTE3NjAxM2Mw
ODEyMTY2YmE3YjdkOTlmM2Q1MzZmYzdmNWVkMmUzM2U5Zjc0YTA4ICBNSVQtTElDRU5TRS50eHQK
IHNoYTI1NiAgOGNlYjRiOWVlNWFkZWRkZTQ3YjMxZTk3NWMxZDkwYzczYWQyN2I2YjE2NWExZGNk
ODBjN2M1NDVlYjY1YjkwMyAgR1BMLUxJQ0VOU0UudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL2xp
YnN0cm9waGUvbGlic3Ryb3BoZS5tayBiL3BhY2thZ2UvbGlic3Ryb3BoZS9saWJzdHJvcGhlLm1r
CmluZGV4IDA0YmEwYTY5ZDAuLmY0OGQwNzM3NzAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlic3Ry
b3BoZS9saWJzdHJvcGhlLm1rCisrKyBiL3BhY2thZ2UvbGlic3Ryb3BoZS9saWJzdHJvcGhlLm1r
CkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTElCU1RST1BI
RV9WRVJTSU9OID0gMC4xMS4wCitMSUJTVFJPUEhFX1ZFUlNJT04gPSAwLjEyLjAKIExJQlNUUk9Q
SEVfU09VUkNFID0gbGlic3Ryb3BoZS0kKExJQlNUUk9QSEVfVkVSU0lPTikudGFyLnh6CiBMSUJT
VFJPUEhFX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vc3Ryb3BoZS9saWJzdHJvcGhlL3JlbGVh
c2VzL2Rvd25sb2FkLyQoTElCU1RST1BIRV9WRVJTSU9OKQogTElCU1RST1BIRV9ERVBFTkRFTkNJ
RVMgPSBob3N0LXBrZ2NvbmYKLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
