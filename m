Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C8EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 07:38:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3EB9610FC
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 07:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3EB9610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 845BA80E42;
	Wed,  3 Nov 2021 07:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2i3lBHJyDdBY; Wed,  3 Nov 2021 07:38:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCB8D80E40;
	Wed,  3 Nov 2021 07:38:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5D701BF2C6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 07:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B63314043B
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 07:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 826kkoo36lMM for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 07:37:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1BE940438
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 07:37:18 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPA id B17C1240006;
 Wed,  3 Nov 2021 07:37:16 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 08:36:56 +0100
Message-Id: <20211103073656.1689919-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103073656.1689919-1-herve.codina@bootlin.com>
References: <20211103073656.1689919-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5]
 support/testing/tests/package/test_libshdata: new test
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBuZXcgdGVzdCBlbnN1cmVzIHRoYXQgbGlicmFyaWVzIGFuZCBiaW5hcmllcyBnZW5lcmF0
ZWQKdXNpbmcgUGFycm90IEFsY2hlbXkgYnVpbGQgc3lzdGVtIGFyZSBjb3JyZWN0LgpJbmRlZWQs
IHRoZSB0ZXN0IHVzZXMgbGlic2hkYXRhLXN0cmVzcy4KVGhpcyBiaW5hcnkgZGVwZW5kcyBvbiBs
aWJzaGRhdGEuCmxpYnNoZGF0YSBkZXBlbmRzIG9uIGxpYmZ1dGlscyBhbmQgbGliZnV0aWxzIGRl
cGVuZHMgb24gdWxvZy4KQWxsIG9mIHRoZXNlIGJpbmFyaWVzIGFuZCBsaWJyYXJpZXMgYXJlIGJ1
aWx0IHVzaW5nIEFsY2hlbXkuCgpTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNv
ZGluYUBib290bGluLmNvbT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCiAuLi4vdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlic2hk
YXRhLnB5ICAgfCAyNSArKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X2xpYnNoZGF0YS5weQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9Q
RVJTCmluZGV4IDY0YTIwOTgzNDMuLjNhNWIyNGY3M2QgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMK
KysrIGIvREVWRUxPUEVSUwpAQCAtMTE1Niw2ICsxMTU2LDcgQEAgRjoJcGFja2FnZS9saWJzaGRh
dGEvCiBGOglwYWNrYWdlL2x1YS1hdWdlYXMvCiBGOglwYWNrYWdlL3Vsb2cvCiBGOglzdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2R0Ym9jZmcucHkKK0Y6CXN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlic2hkYXRhLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X2x1YV9hdWdlYXMucHkKIAogTjoJSGVydsOpIENvZGluYSA8aGVydmUu
Y29kaW5hQGJvb3RsaW4uY29tPgpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9saWJzaGRhdGEucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X2xpYnNoZGF0YS5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44
MGIwMzJhYzY5Ci0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9saWJzaGRhdGEucHkKQEAgLTAsMCArMSwyNSBAQAoraW1wb3J0IG9zCisKK2ltcG9y
dCBpbmZyYS5iYXNldGVzdAorCisKK2NsYXNzIFRlc3RMaWJzaGRhdGEoaW5mcmEuYmFzZXRlc3Qu
QlJUZXN0KToKKyAgICBjb25maWcgPSBpbmZyYS5iYXNldGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09O
RklHICsgXAorICAgICAgICAiIiIKKyAgICAgICAgQlIyX1BBQ0tBR0VfTElCU0hEQVRBPXkKKyAg
ICAgICAgQlIyX1BBQ0tBR0VfTElCU0hEQVRBX1NUUkVTUz15CisgICAgICAgIEJSMl9UQVJHRVRf
Uk9PVEZTX0NQSU89eQorICAgICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0
CisgICAgICAgICIiIgorCisgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgorICAgICAgICBpbWcgPSBv
cy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJyb290ZnMuY3BpbyIpCisgICAg
ICAgIHNlbGYuZW11bGF0b3IuYm9vdChhcmNoPSJhcm12NSIsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICBrZXJuZWw9ImJ1aWx0aW4iLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgb3B0
aW9ucz1bIi1pbml0cmQiLCBpbWddKQorICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkKKwor
ICAgICAgICAjIEp1c3QgcnVuIGxpYnNoZGF0YS1zdHJlc3MuCisgICAgICAgICMgVGhpcyBlbnN1
cmVzIHRoYXQgbGlicmFyeSBhcmUgd2VsbCBjb21waWxlZCBhbmQgdGhhdCBhbGwgZGVwZW5kZW5j
aWVzCisgICAgICAgICMgYXJlIG1ldCB1c2luZyBQYXJyb3QgQWxjaGVteSBidWlsZCBzeXN0ZW0u
CisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soImxpYnNoZGF0YS1zdHJlc3MiKQotLSAKMi4zMS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
