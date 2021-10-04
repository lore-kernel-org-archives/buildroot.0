Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF70CC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:44:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D11A61381
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D11A61381
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 231BD60B95;
	Mon,  4 Oct 2021 12:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mKCMgn4jn-9k; Mon,  4 Oct 2021 12:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 788B460B0F;
	Mon,  4 Oct 2021 12:44:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D25D91BF330
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF1C960AF5
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eszRiLVG-n_a for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 12:43:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF98A60610
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 12:43:51 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPA id 60A3C240005;
 Mon,  4 Oct 2021 12:43:49 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Mon,  4 Oct 2021 14:43:14 +0200
Message-Id: <20211004124316.355770-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004124316.355770-1-herve.codina@bootlin.com>
References: <20211004124316.355770-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/libdbi: new package
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bGliZGJpIGltcGxlbWVudHMgYSBkYXRhYmFzZS1pbmRlcGVuZGVudCBhYnN0cmFjdGlvbiBsYXll
ciBpbiBDLApzaW1pbGFyIHRvIHRoZSBEQkkvREJEIGxheWVyIGluIFBlcmwuCgpodHRwOi8vbGli
ZGJpLnNvdXJjZWZvcmdlLm5ldC8KCkJhc2VkIG9uIGluaXRpYWwgd29yayBmcm9tIE5pY29sYXMg
Q2FycmllciA8bmljb2xhcy5jYXJyaWVyQG9yb2xpYS5jb20+CgpTaWduZWQtb2ZmLWJ5OiBIZXJ2
ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KLS0tCiBERVZFTE9QRVJTICAgICAg
ICAgICAgICAgICB8ICA0ICsrKysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgIHwgIDEgKwog
cGFja2FnZS9saWJkYmkvQ29uZmlnLmluICAgfCAgNyArKysrKysrCiBwYWNrYWdlL2xpYmRiaS9s
aWJkYmkuaGFzaCB8ICAzICsrKwogcGFja2FnZS9saWJkYmkvbGliZGJpLm1rICAgfCAxNSArKysr
KysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvbGliZGJpL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvbGliZGJpL2xpYmRiaS5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJk
YmkvbGliZGJpLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXgg
MWY5NzcxOTBhYi4uMzBiZjI5ZmZkNiAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZF
TE9QRVJTCkBAIC0xMTQ4LDYgKzExNDgsOSBAQCBGOglwYWNrYWdlL3N5c3JlcG8vCiBOOglIZW5y
aXF1ZSBDYW1hcmdvIDxoZW5yaXF1ZUBoZW5yaXF1ZWNhbWFyZ28uY29tPgogRjoJcGFja2FnZS9q
c29uLWdsaWIvCiAKK046CUhlcnbDqSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4K
K0Y6CXBhY2thZ2UvbGliZGJpLworCiBOOglIaXJvc2hpIEthd2FzaGltYSA8a2VpLWtAY2EyLnNv
LW5ldC5uZS5qcD4KIEY6CXBhY2thZ2UvZ2F1Y2hlLwogRjoJcGFja2FnZS9nbXJlbmRlci1yZXN1
cnJlY3QvCkBAIC0xOTgwLDYgKzE5ODMsNyBAQCBGOgljb25maWdzL2dhbGlsZW9fZGVmY29uZmln
CiAKIE46CU5pY29sYXMgQ2FycmllciA8bmljb2xhcy5jYXJyaWVyQG9yb2xpYS5jb20+CiBGOglw
YWNrYWdlL2JtYXAtdG9vbHMvCitGOglwYWNrYWdlL2xpYmRiaS8KIEY6CXBhY2thZ2UvcGhwLXhk
ZWJ1Zy8KIEY6CXBhY2thZ2UvcHl0aG9uLWF1Z2Vhcy8KIEY6CXBhY2thZ2UvcHl0aG9uLWZsYXNr
LWV4cGVjdHMtanNvbi8KZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9D
b25maWcuaW4KaW5kZXggMmY4M2M4NzU4Mi4uMWIwN2VlZDVlMCAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTE0MTQsNiArMTQxNCw3IEBA
IG1lbnUgIkRhdGFiYXNlIgogCXNvdXJjZSAicGFja2FnZS9oaXJlZGlzL0NvbmZpZy5pbiIKIAlz
b3VyY2UgInBhY2thZ2Uva29tcGV4c3FsaXRlL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uv
bGV2ZWxkYi9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL2xpYmRiaS9Db25maWcuaW4iCiAJ
c291cmNlICJwYWNrYWdlL2xpYmdpdDIvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9saWJt
ZGJ4L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvbGlib2RiL0NvbmZpZy5pbiIKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbGliZGJpL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGliZGJpL0NvbmZpZy5p
bgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5kZWQyYmM2ZTUzCi0tLSAv
ZGV2L251bGwKKysrIGIvcGFja2FnZS9saWJkYmkvQ29uZmlnLmluCkBAIC0wLDAgKzEsNyBAQAor
Y29uZmlnIEJSMl9QQUNLQUdFX0xJQkRCSQorCWJvb2wgImxpZGJpIgorCWhlbHAKKwkgIGxpYmRi
aSBpbXBsZW1lbnRzIGEgZGF0YWJhc2UtaW5kZXBlbmRlbnQgYWJzdHJhY3Rpb24gbGF5ZXIKKwkg
IGluIEMsIHNpbWlsYXIgdG8gdGhlIERCSS9EQkQgbGF5ZXIgaW4gUGVybC4KKworCSAgaHR0cDov
L2xpYmRiaS5zb3VyY2Vmb3JnZS5uZXQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZGJpL2xpYmRi
aS5oYXNoIGIvcGFja2FnZS9saWJkYmkvbGliZGJpLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uNmJlY2U2NmJlYQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uv
bGliZGJpL2xpYmRiaS5oYXNoCkBAIC0wLDAgKzEsMyBAQAorIyBMb2NhbGx5IGNvbXB1dGVkOgor
c2hhMjU2IDk1ODQ3NWUwMDEwYTNkOGU0M2NlOWVjZDZhNjRkMjVlYWNjYTZhZGE0NmMzOWJjNjlm
OTQ5ZGQ3MGY5MmFiN2EgIGxpYmRiaS04OGI4NDc3ZDU3MTUzYjlmNzM2ZGQxOWQ0MzJkM2I3YWIx
YzQ5MDczLWJyMS50YXIuZ3oKK3NoYTI1NiA1YmJjYmI3MzdlNjBmZTlkZWJhMDhlY2JkMDA5MjBj
ZmNjMzQwM2JhMmU1MzRjNjRmZGVlYTQ5ZDZiYjg3NTA5ICBDT1BZSU5HCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpYmRiaS9saWJkYmkubWsgYi9wYWNrYWdlL2xpYmRiaS9saWJkYmkubWsKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uOTIwMjUwNzdiYgotLS0gL2Rldi9udWxs
CisrKyBiL3BhY2thZ2UvbGliZGJpL2xpYmRiaS5tawpAQCAtMCwwICsxLDE1IEBACisjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIworIworIyBsaWJkYmkKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CisKK0xJQkRCSV9WRVJTSU9OID0gODhiODQ3N2Q1NzE1M2I5ZjczNmRkMTlkNDMyZDNiN2FiMWM0
OTA3MworTElCREJJX1NJVEUgPSBodHRwczovL2dpdC5jb2RlLnNmLm5ldC9wL2xpYmRiaS9saWJk
YmkKK0xJQkRCSV9TSVRFX01FVEhPRCA9IGdpdAorTElCREJJX0xJQ0VOU0UgPSBMR1BMLTIuMSsK
K0xJQkRCSV9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORworTElCREJJX0lOU1RBTExfU1RBR0lORyA9
IFlFUworTElCREJJX0FVVE9SRUNPTkYgPSBZRVMKKworJChldmFsICQoYXV0b3Rvb2xzLXBhY2th
Z2UpKQotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
