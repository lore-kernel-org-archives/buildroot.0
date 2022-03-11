Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A66C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 12:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B8C58266C;
	Fri, 11 Mar 2022 12:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9TH4lZFbaBI; Fri, 11 Mar 2022 12:46:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 290C082437;
	Fri, 11 Mar 2022 12:46:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDE201BF3BD
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC5B44090A
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59HDtspMDGb2 for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 12:46:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABADB40906
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 12:46:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6D573CE020
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 12:38:10 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 93373C0015;
 Fri, 11 Mar 2022 12:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647002283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXrYQPvdLF6y0E31KNyA9M3ZSdLQ2htZ+CvTKFmdEdQ=;
 b=Lb0fYanm8J8Enn6PcgtoA6caKLPjGXyJKWN7tWyo0WrNUZw10gJMDMwijhPHjBojoWwbEh
 8MidqQOnRflMVlT8rbkYACB7hZmGJgSDPc/vkFaVsnZHLbIWRFXGpIcVjB6jxaWaST8fz+
 15JfQuOxOWhnEuHYtElw/Ba4ko5pmRE6eO//zeh4AnYtOKxSoKBc3NNZKw7Tt723TgRrUB
 PxzyEUP2ZxojpFmwNfB9oFnCOaipHTBzBfLN5hHTvcbEJMPlghNkWmRYGkkk2oyaLBNp2J
 stnBeRj2pgkdhekNAYa6SFZcOHC6Y6xLXdOx/fcm5MsumIJMUhXs5dLSDVi14w==
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 13:36:34 +0100
Message-Id: <20220311123636.13415-6-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311123636.13415-1-clement.leger@bootlin.com>
References: <20220311123636.13415-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 5/7] package/optee-examples: bump to version
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

QnVtcCBPUC1URUUgRXhhbXBsZXMgcGFja2FnZSB2ZXJzaW9uIHRvIE9QLVRFRSByZWxlYXNlIDMu
MTYuMC4KCkFja2VkLWJ5OiBFdGllbm5lIENhcnJpZXJlIDxldGllbm5lLmNhcnJpZXJlQGxpbmFy
by5vcmc+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290
bGluLmNvbT4KLS0tCiBwYWNrYWdlL29wdGVlLWV4YW1wbGVzL29wdGVlLWV4YW1wbGVzLmhhc2gg
fCA0ICsrLS0KIHBhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMubWsgICB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3BhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMuaGFzaCBiL3Bh
Y2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMuaGFzaAppbmRleCBmODg5MDRjNzk1
Li5hZmQ1MGFmZWEwIDEwMDY0NAotLS0gYS9wYWNrYWdlL29wdGVlLWV4YW1wbGVzL29wdGVlLWV4
YW1wbGVzLmhhc2gKKysrIGIvcGFja2FnZS9vcHRlZS1leGFtcGxlcy9vcHRlZS1leGFtcGxlcy5o
YXNoCkBAIC0xLDQgKzEsNCBAQAotIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9saW5hcm8tc3dn
L29wdGVlX2V4YW1wbGVzL2FyY2hpdmUvMy4xNS4wL29wdGVlLWV4YW1wbGVzLTMuMTUuMC50YXIu
Z3oKLXNoYTI1NiA5NzcwODI3MjkyZWVhODUwNjg5MTMwNzdkMzQwNjA3MGY2MTgyMzg5Nzc5YzVk
NGE1YzA4NzZiZmZkOTYyMzUzICBvcHRlZS1leGFtcGxlcy0zLjE1LjAudGFyLmd6CisjIEZyb20g
aHR0cHM6Ly9naXRodWIuY29tL2xpbmFyby1zd2cvb3B0ZWVfZXhhbXBsZXMvYXJjaGl2ZS8zLjE2
LjAvb3B0ZWUtZXhhbXBsZXMtMy4xNi4wLnRhci5negorc2hhMjU2IDQ1ZTA2ZGM1NTIwZjMwOTdj
YzEyNDQzNGFjYWZjMjZiOGRiMjhkYjg3ZGY2MmYzYWQyZGRmZjA2Y2FjY2U5NjkgIG9wdGVlLWV4
YW1wbGVzLTMuMTYuMC50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZAogc2hhMjU2IDZmMWVmODQ0
OWNiODJhZTc5ZDIxNTU2MDVmNzk4NWJkZjBmMDhlN2FiNTAwN2RlOWI0MzYyZThiZjI4NzMzYjkg
IExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBs
ZXMubWsgYi9wYWNrYWdlL29wdGVlLWV4YW1wbGVzL29wdGVlLWV4YW1wbGVzLm1rCmluZGV4IDJi
NDZkY2MxZWIuLjMxZTVmMjYwZGYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMv
b3B0ZWUtZXhhbXBsZXMubWsKKysrIGIvcGFja2FnZS9vcHRlZS1leGFtcGxlcy9vcHRlZS1leGFt
cGxlcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLU9Q
VEVFX0VYQU1QTEVTX1ZFUlNJT04gPSAzLjE1LjAKK09QVEVFX0VYQU1QTEVTX1ZFUlNJT04gPSAz
LjE2LjAKIE9QVEVFX0VYQU1QTEVTX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGxpbmFyby1zd2csb3B0
ZWVfZXhhbXBsZXMsJChPUFRFRV9FWEFNUExFU19WRVJTSU9OKSkKIE9QVEVFX0VYQU1QTEVTX0xJ
Q0VOU0UgPSBCU0QtMi1DbGF1c2UKIE9QVEVFX0VYQU1QTEVTX0xJQ0VOU0VfRklMRVMgPSBMSUNF
TlNFCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
