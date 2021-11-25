Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE234C433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 15:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2332D40901;
	Thu, 25 Nov 2021 15:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSp2e5IcWn-O; Thu, 25 Nov 2021 15:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AECD408FF;
	Thu, 25 Nov 2021 15:50:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 596351BF27C
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 15:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 564ED60708
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 15:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dSPtlH5Ss4v for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 15:50:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 204EC606EF
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 15:50:43 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D9451200005;
 Thu, 25 Nov 2021 15:50:40 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 16:50:40 +0100
Message-Id: <20211125155040.90840-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/rkdeveloptool: add new package
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
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYWNrYWdlIGlzIGEgdG9vbCBmcm9tIFJvY2tjaGlwIHRvIGNvbW11bmljYXRlIHdpdGgg
Um9ja3VzYiBkZXZpY2VzLgoKU2lnbmVkLW9mZi1ieTogS29yeSBNYWluY2VudCA8a29yeS5tYWlu
Y2VudEBib290bGluLmNvbT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAzICsrKwogcGFja2FnZS9Db25maWcuaW4uaG9zdCAgICAgICAgICAgICAgICAgfCAg
MSArCiBwYWNrYWdlL3JrZGV2ZWxvcHRvb2wvQ29uZmlnLmluLmhvc3QgICB8ICA3ICsrKysrKysK
IHBhY2thZ2UvcmtkZXZlbG9wdG9vbC9ya2RldmVsb3B0b29sLm1rIHwgMTUgKysrKysrKysrKysr
KysrCiA0IGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3JrZGV2ZWxvcHRvb2wvQ29uZmlnLmluLmhvc3QKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3JrZGV2ZWxvcHRvb2wvcmtkZXZlbG9wdG9vbC5tawoKZGlmZiAtLWdpdCBhL0RF
VkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IGIxOTBjMGYzNTYuLmI5MjcyN2EzZjUgMTAwNjQ0
Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTU2Miw2ICsxNTYyLDkgQEAg
TjoJS29lbiBNYXJ0ZW5zIDxnbWNAc29ub2xvZ2ljLm5sPgogRjoJcGFja2FnZS9jYXBucHJvdG8v
CiBGOglwYWNrYWdlL2xpbnV4Y29uc29sZXRvb2xzLwogCitOOglLw7ZyeSBNYWluY2VudCA8a29y
eS5tYWluY2VudEBib290bGluLmNvbT4KK0Y6CXBhY2thZ2UvcmtkZXZlbG9wdG9vbC8KKwogTjoJ
S3VydCBWYW4gRGlqY2sgPGRldi5rdXJ0QHZhbmRpamNrLWxhdXJpanNzZW4uYmU+CiBGOglwYWNr
YWdlL2JjdXNkay8KIEY6CXBhY2thZ2UvbGlicHRoc2VtLwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9D
b25maWcuaW4uaG9zdCBiL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QKaW5kZXggNmU1YTVjNWZjNS4u
ZGZkZDRjM2ViMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4uaG9zdAorKysgYi9wYWNr
YWdlL0NvbmZpZy5pbi5ob3N0CkBAIC03Niw2ICs3Niw3IEBAIG1lbnUgIkhvc3QgdXRpbGl0aWVz
IgogCXNvdXJjZSAicGFja2FnZS9xb3JpcS1yY3cvQ29uZmlnLmluLmhvc3QiCiAJc291cmNlICJw
YWNrYWdlL3Jhc3BiZXJyeXBpLXVzYmJvb3QvQ29uZmlnLmluLmhvc3QiCiAJc291cmNlICJwYWNr
YWdlL3JhdWMvQ29uZmlnLmluLmhvc3QiCisJc291cmNlICJwYWNrYWdlL3JrZGV2ZWxvcHRvb2wv
Q29uZmlnLmluLmhvc3QiCiAJc291cmNlICJwYWNrYWdlL3J1c3RjL0NvbmZpZy5pbi5ob3N0Igog
CXNvdXJjZSAicGFja2FnZS9zNi1yYy9Db25maWcuaW4uaG9zdCIKIAlzb3VyY2UgInBhY2thZ2Uv
c2FtLWJhL0NvbmZpZy5pbi5ob3N0IgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ya2RldmVsb3B0b29s
L0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9ya2RldmVsb3B0b29sL0NvbmZpZy5pbi5ob3N0Cm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmM1YWYzNDUxMGQKLS0tIC9kZXYv
bnVsbAorKysgYi9wYWNrYWdlL3JrZGV2ZWxvcHRvb2wvQ29uZmlnLmluLmhvc3QKQEAgLTAsMCAr
MSw3IEBACitjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9SS0RFVkVMT1BUT09MCisJYm9vbCAiaG9z
dCBya2RldmVsb3B0b29sIgorCWhlbHAKKwkgIHJrZGV2ZWxvcHRvb2wgZ2l2ZXMgeW91IGEgc2lt
cGxlIHdheSB0byByZWFkL3dyaXRlIHJvY2t1c2IKKwkgIGRldmljZXMuCisKKwkgIGh0dHBzOi8v
Z2l0aHViLmNvbS9yb2NrY2hpcC1saW51eC9ya2RldmVsb3B0b29sCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3JrZGV2ZWxvcHRvb2wvcmtkZXZlbG9wdG9vbC5tayBiL3BhY2thZ2UvcmtkZXZlbG9wdG9v
bC9ya2RldmVsb3B0b29sLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LjIzNDVkY2VmYzAKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3JrZGV2ZWxvcHRvb2wvcmtk
ZXZlbG9wdG9vbC5tawpAQCAtMCwwICsxLDE1IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwor
IworIyBya2RldmVsb3B0b29sCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitSS0RFVkVM
T1BUT09MX1ZFUlNJT04gPSA0NmJiNGMwNzM2MjQyMjZjM2YwNWIzN2I5ZWNjNTBiYmNmNTQzZjVh
CitSS0RFVkVMT1BUT09MX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHJvY2tjaGlwLWxpbnV4LHJrZGV2
ZWxvcHRvb2wsJChSS0RFVkVMT1BUT09MX1ZFUlNJT04pKQorUktERVZFTE9QVE9PTF9MSUNFTlNF
ID0gR1BMMgorUktERVZFTE9QVE9PTF9MSUNFTlNFX0ZJTEVTID0gbGljZW5zZS50eHQKK0hPU1Rf
UktERVZFTE9QVE9PTF9ERVBFTkRFTkNJRVMgPSBob3N0LWxpYnVzYgorCitIT1NUX1JLREVWRUxP
UFRPT0xfQVVUT1JFQ09ORiA9IFlFUworCiskKGV2YWwgJChob3N0LWF1dG90b29scy1wYWNrYWdl
KSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
