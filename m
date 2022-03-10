Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6A1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 16:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5D588472E;
	Thu, 10 Mar 2022 16:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jY8azyhxIGd0; Thu, 10 Mar 2022 16:59:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1325B84373;
	Thu, 10 Mar 2022 16:59:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E5641BF293
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DD1241798
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lGtSwg46cGus for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 16:59:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EB78418E8
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 16:59:05 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0F9F560009;
 Thu, 10 Mar 2022 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646931544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ew8Q+NBRq5pzHEXu+wd8USUrhOhB4N1KpkxHwDIttoQ=;
 b=pFuflhZpOaG+KSwa2L/51nc7vXLRatwbxQ5IrOn1N4gTIKX1mJCKmKCi315BnLQOtLGRcC
 28ArRMbs1hBSeW/w7QE8RNjuoHa2ttS+6Yyb0fsxVWmq3q177GcoXOsQkJfMvpPxpKH7Bf
 RBdhecG5GElO7VsNKnH0Uw8SzwmgXBsXUE40NCBBZmGyhMlHNFomUNdmT4u9YiJuzUEdfR
 UmRqAAhrx6MAnxFLp4gNmt2SjhAXAj7Sa88gYH4CaJbV9uN0M5mMbf5+CVtogLYEyN2o8g
 Dtux32CVNbffzc6HQZgUX17re9xBV+WYwbI6max65WUNK5etvLDP0bQDjM2zSQ==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 17:57:33 +0100
Message-Id: <20220310165735.1102802-6-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310165735.1102802-1-clement.leger@bootlin.com>
References: <20220310165735.1102802-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 5/7] package/optee-examples: bump to version
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
cCBPUC1URUUgRXhhbXBsZXMgcGFja2FnZSB2ZXJzaW9uIHRvIE9QLVRFRSByZWxlYXNlIDMuMTYu
MC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGlu
LmNvbT4KLS0tCiBwYWNrYWdlL29wdGVlLWV4YW1wbGVzL29wdGVlLWV4YW1wbGVzLmhhc2ggfCA0
ICsrLS0KIHBhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMubWsgICB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3BhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMuaGFzaCBiL3BhY2th
Z2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMuaGFzaAppbmRleCBmODg5MDRjNzk1Li5h
ZmQ1MGFmZWEwIDEwMDY0NAotLS0gYS9wYWNrYWdlL29wdGVlLWV4YW1wbGVzL29wdGVlLWV4YW1w
bGVzLmhhc2gKKysrIGIvcGFja2FnZS9vcHRlZS1leGFtcGxlcy9vcHRlZS1leGFtcGxlcy5oYXNo
CkBAIC0xLDQgKzEsNCBAQAotIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9saW5hcm8tc3dnL29w
dGVlX2V4YW1wbGVzL2FyY2hpdmUvMy4xNS4wL29wdGVlLWV4YW1wbGVzLTMuMTUuMC50YXIuZ3oK
LXNoYTI1NiA5NzcwODI3MjkyZWVhODUwNjg5MTMwNzdkMzQwNjA3MGY2MTgyMzg5Nzc5YzVkNGE1
YzA4NzZiZmZkOTYyMzUzICBvcHRlZS1leGFtcGxlcy0zLjE1LjAudGFyLmd6CisjIEZyb20gaHR0
cHM6Ly9naXRodWIuY29tL2xpbmFyby1zd2cvb3B0ZWVfZXhhbXBsZXMvYXJjaGl2ZS8zLjE2LjAv
b3B0ZWUtZXhhbXBsZXMtMy4xNi4wLnRhci5negorc2hhMjU2IDQ1ZTA2ZGM1NTIwZjMwOTdjYzEy
NDQzNGFjYWZjMjZiOGRiMjhkYjg3ZGY2MmYzYWQyZGRmZjA2Y2FjY2U5NjkgIG9wdGVlLWV4YW1w
bGVzLTMuMTYuMC50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZAogc2hhMjU2IDZmMWVmODQ0OWNi
ODJhZTc5ZDIxNTU2MDVmNzk4NWJkZjBmMDhlN2FiNTAwN2RlOWI0MzYyZThiZjI4NzMzYjkgIExJ
Q0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMu
bWsgYi9wYWNrYWdlL29wdGVlLWV4YW1wbGVzL29wdGVlLWV4YW1wbGVzLm1rCmluZGV4IDJiNDZk
Y2MxZWIuLjMxZTVmMjYwZGYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0
ZWUtZXhhbXBsZXMubWsKKysrIGIvcGFja2FnZS9vcHRlZS1leGFtcGxlcy9vcHRlZS1leGFtcGxl
cy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLU9QVEVF
X0VYQU1QTEVTX1ZFUlNJT04gPSAzLjE1LjAKK09QVEVFX0VYQU1QTEVTX1ZFUlNJT04gPSAzLjE2
LjAKIE9QVEVFX0VYQU1QTEVTX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGxpbmFyby1zd2csb3B0ZWVf
ZXhhbXBsZXMsJChPUFRFRV9FWEFNUExFU19WRVJTSU9OKSkKIE9QVEVFX0VYQU1QTEVTX0xJQ0VO
U0UgPSBCU0QtMi1DbGF1c2UKIE9QVEVFX0VYQU1QTEVTX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
Ci0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
