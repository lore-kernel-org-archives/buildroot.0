Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A91FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 13:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A5F61355;
	Fri, 18 Mar 2022 13:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5JSZFVzPffBc; Fri, 18 Mar 2022 13:36:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6263760A72;
	Fri, 18 Mar 2022 13:36:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00A921BF27E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAA984013E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDas1n_pFACZ for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 13:35:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7D6940C1A
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 13:35:00 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E968B40009;
 Fri, 18 Mar 2022 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647610497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LcdwjZZcKAuOxcVzkrZXaOtllQfkUAmY62xE5iGqBL0=;
 b=Ft2geB4glLykuYiP8LUEQQLV8+KIDK3LnRmM+MjvuXUP0IODTnzvZpEk9NDn5y4g+4VrZZ
 de2D43BLnnBPWRN1hhO3tKz8tF1zy4SH91+w6lJv6fjkwbTOvuMvc2c0sXJjGvVWIrzMKX
 X/gk6uFbzLJ+yr1cvOZweBO0oRocNwarXA5QBcGsvzkg9tFYm+AaCMTrGFCvi6Q76aaOoM
 JQ3HEyUUoBbg2+gZ1iQ1xmF00F6Mw0VVTzvX849XlsMgCNhlfRX6GCkZB3ZvYTUCpm9oiC
 R4ylukMJpZE1PRdVMlHSdxiEyVmyhaHHHVlW5PwJd0Lc2XmZqqdEQe0gyHQ5hw==
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 14:24:27 +0100
Message-Id: <20220318132427.48737-9-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132427.48737-1-clement.leger@bootlin.com>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 8/8] package/optee-benchmark: bump to version
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCBPUC1URUUgQmVuY2htYXJrIHBhY2thZ2UgdmVyc2lvbiB0byBPUC1URUUgcmVsZWFzZSAz
LjE2LjAuCgpBY2tlZC1ieTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJyaWVyZUBsaW5h
cm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9v
dGxpbi5jb20+Ci0tLQogcGFja2FnZS9vcHRlZS1iZW5jaG1hcmsvb3B0ZWUtYmVuY2htYXJrLmhh
c2ggfCA0ICsrLS0KIHBhY2thZ2Uvb3B0ZWUtYmVuY2htYXJrL29wdGVlLWJlbmNobWFyay5tayAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcHRlZS1iZW5jaG1hcmsvb3B0ZWUtYmVuY2htYXJrLmhh
c2ggYi9wYWNrYWdlL29wdGVlLWJlbmNobWFyay9vcHRlZS1iZW5jaG1hcmsuaGFzaAppbmRleCAz
Nzk3OTIwYzM1Li5mMzZlMDc0ZWVjIDEwMDY0NAotLS0gYS9wYWNrYWdlL29wdGVlLWJlbmNobWFy
ay9vcHRlZS1iZW5jaG1hcmsuaGFzaAorKysgYi9wYWNrYWdlL29wdGVlLWJlbmNobWFyay9vcHRl
ZS1iZW5jaG1hcmsuaGFzaApAQCAtMSw0ICsxLDQgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5j
b20vbGluYXJvLXN3Zy9vcHRlZV9iZW5jaG1hcmsvYXJjaGl2ZS8zLjE1LjAvb3B0ZWUtYmVuY2ht
YXJrLTMuMTUuMC50YXIuZ3oKLXNoYTI1NiBmMWRkYWM1ZTlmNTgzMzMxOTRlYjMwMmU2ZDk4NDBm
YTMzNDMwMGJjMTAzYWJiM2Q5Zjc4M2JmMDA5YTc4YzUwIG9wdGVlLWJlbmNobWFyay0zLjE1LjAu
dGFyLmd6CisjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL2xpbmFyby1zd2cvb3B0ZWVfYmVuY2ht
YXJrL2FyY2hpdmUvMy4xNi4wL29wdGVlLWJlbmNobWFyay0zLjE2LjAudGFyLmd6CitzaGEyNTYg
NTViMjQ1MjVmMDhmZmRhNjc5OWY5MGFiN2JhYjIxMjVmMWMzZjE3ZDVjYmQxYjM0NDgwY2QyOGI1
ZjQ2ZmNhOSBvcHRlZS1iZW5jaG1hcmstMy4xNi4wLnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVk
CiBzaGEyNTYgMDU3MWJlNWI3MzkxNDJkYzNlNDBlMGE0ZTdlMzBkNGFiOGJmZjBkNGQ2MDZhM2Yy
ZGIyMDEwNzQ1NTg3ZDM4MyAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcHRlZS1iZW5j
aG1hcmsvb3B0ZWUtYmVuY2htYXJrLm1rIGIvcGFja2FnZS9vcHRlZS1iZW5jaG1hcmsvb3B0ZWUt
YmVuY2htYXJrLm1rCmluZGV4IDEzNTdmOWYyNzAuLjQ5M2Y0MDdhNDQgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2Uvb3B0ZWUtYmVuY2htYXJrL29wdGVlLWJlbmNobWFyay5taworKysgYi9wYWNrYWdlL29w
dGVlLWJlbmNobWFyay9vcHRlZS1iZW5jaG1hcmsubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwogCi1PUFRFRV9CRU5DSE1BUktfVkVSU0lPTiA9IDMuMTUuMAor
T1BURUVfQkVOQ0hNQVJLX1ZFUlNJT04gPSAzLjE2LjAKIE9QVEVFX0JFTkNITUFSS19TSVRFID0g
JChjYWxsIGdpdGh1YixsaW5hcm8tc3dnLG9wdGVlX2JlbmNobWFyaywkKE9QVEVFX0JFTkNITUFS
S19WRVJTSU9OKSkKIE9QVEVFX0JFTkNITUFSS19MSUNFTlNFID0gQlNELTItQ2xhdXNlCiBPUFRF
RV9CRU5DSE1BUktfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLS0gCjIuMzQuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
