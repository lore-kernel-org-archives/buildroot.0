Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 17:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99F686124A;
	Thu, 10 Mar 2022 17:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 547IKCTBOL2k; Thu, 10 Mar 2022 17:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57A1361240;
	Thu, 10 Mar 2022 17:00:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C45AB1BF293
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3FE28135A
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZKpQjiEEFcDJ for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 16:59:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C870281371
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 16:59:06 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EA38C60013;
 Thu, 10 Mar 2022 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646931545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwVYl2eetuREomYP+aQvOFjuUow01jGtqJIC4kmTuGY=;
 b=E1+FiYzDE+Yg73+8Rr4Qz5JbI3Vza8FSzg6Ab7xyozXOvB+3qO//qmeEzOPiORA8R+YHTe
 GZOJjp9+aUcSdAUXoMMPWFm+Xjp8nuonJA8eDaYPcVip2d8GPdp57L/2k3lbfpXxA+E1nE
 zVPEKkN0v5JxalLAvR3EdE15iXDFnSl9Gaza28gGkJ5kNK2QMWlsFWV1WkQ0LcxYclZoPo
 3lrt343xZD7xiW/lrroHnZ68SWVYHA4XCYcSFt4FyGNAIg9UT6SCvSEMzT2DUQA68C3yTj
 sNwolw8vWXOIDPGkAf5zvvR1kF5ZAIwVn2JJLJXPXnH83xW4YycesNOBZFP42A==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 17:57:35 +0100
Message-Id: <20220310165735.1102802-8-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310165735.1102802-1-clement.leger@bootlin.com>
References: <20220310165735.1102802-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 7/7] package/optee-benchmark: bump to version
 3.16.0
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
From: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJyaWVyZUBsaW5hcm8ub3JnPgoKQnVt
cCBPUC1URUUgQmVuY2htYXJrIHBhY2thZ2UgdmVyc2lvbiB0byBPUC1URUUgcmVsZWFzZSAzLjE2
LjAuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxp
bi5jb20+Ci0tLQogcGFja2FnZS9vcHRlZS1iZW5jaG1hcmsvb3B0ZWUtYmVuY2htYXJrLmhhc2gg
fCA0ICsrLS0KIHBhY2thZ2Uvb3B0ZWUtYmVuY2htYXJrL29wdGVlLWJlbmNobWFyay5tayAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9vcHRlZS1iZW5jaG1hcmsvb3B0ZWUtYmVuY2htYXJrLmhhc2gg
Yi9wYWNrYWdlL29wdGVlLWJlbmNobWFyay9vcHRlZS1iZW5jaG1hcmsuaGFzaAppbmRleCAzNzk3
OTIwYzM1Li5mMzZlMDc0ZWVjIDEwMDY0NAotLS0gYS9wYWNrYWdlL29wdGVlLWJlbmNobWFyay9v
cHRlZS1iZW5jaG1hcmsuaGFzaAorKysgYi9wYWNrYWdlL29wdGVlLWJlbmNobWFyay9vcHRlZS1i
ZW5jaG1hcmsuaGFzaApAQCAtMSw0ICsxLDQgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20v
bGluYXJvLXN3Zy9vcHRlZV9iZW5jaG1hcmsvYXJjaGl2ZS8zLjE1LjAvb3B0ZWUtYmVuY2htYXJr
LTMuMTUuMC50YXIuZ3oKLXNoYTI1NiBmMWRkYWM1ZTlmNTgzMzMxOTRlYjMwMmU2ZDk4NDBmYTMz
NDMwMGJjMTAzYWJiM2Q5Zjc4M2JmMDA5YTc4YzUwIG9wdGVlLWJlbmNobWFyay0zLjE1LjAudGFy
Lmd6CisjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL2xpbmFyby1zd2cvb3B0ZWVfYmVuY2htYXJr
L2FyY2hpdmUvMy4xNi4wL29wdGVlLWJlbmNobWFyay0zLjE2LjAudGFyLmd6CitzaGEyNTYgNTVi
MjQ1MjVmMDhmZmRhNjc5OWY5MGFiN2JhYjIxMjVmMWMzZjE3ZDVjYmQxYjM0NDgwY2QyOGI1ZjQ2
ZmNhOSBvcHRlZS1iZW5jaG1hcmstMy4xNi4wLnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkCiBz
aGEyNTYgMDU3MWJlNWI3MzkxNDJkYzNlNDBlMGE0ZTdlMzBkNGFiOGJmZjBkNGQ2MDZhM2YyZGIy
MDEwNzQ1NTg3ZDM4MyAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcHRlZS1iZW5jaG1h
cmsvb3B0ZWUtYmVuY2htYXJrLm1rIGIvcGFja2FnZS9vcHRlZS1iZW5jaG1hcmsvb3B0ZWUtYmVu
Y2htYXJrLm1rCmluZGV4IDEzNTdmOWYyNzAuLjQ5M2Y0MDdhNDQgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2Uvb3B0ZWUtYmVuY2htYXJrL29wdGVlLWJlbmNobWFyay5taworKysgYi9wYWNrYWdlL29wdGVl
LWJlbmNobWFyay9vcHRlZS1iZW5jaG1hcmsubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwogCi1PUFRFRV9CRU5DSE1BUktfVkVSU0lPTiA9IDMuMTUuMAorT1BU
RUVfQkVOQ0hNQVJLX1ZFUlNJT04gPSAzLjE2LjAKIE9QVEVFX0JFTkNITUFSS19TSVRFID0gJChj
YWxsIGdpdGh1YixsaW5hcm8tc3dnLG9wdGVlX2JlbmNobWFyaywkKE9QVEVFX0JFTkNITUFSS19W
RVJTSU9OKSkKIE9QVEVFX0JFTkNITUFSS19MSUNFTlNFID0gQlNELTItQ2xhdXNlCiBPUFRFRV9C
RU5DSE1BUktfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLS0gCjIuMzQuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
