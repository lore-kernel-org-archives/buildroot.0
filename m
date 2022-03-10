Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FEAC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 16:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66BD041798;
	Thu, 10 Mar 2022 16:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id frEnbasHEWNm; Thu, 10 Mar 2022 16:59:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91C3E4154A;
	Thu, 10 Mar 2022 16:59:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B01A71BF293
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABB6181371
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cihmgfl4p2u3 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 16:59:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0F4D81368
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 16:59:05 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A3DD060002;
 Thu, 10 Mar 2022 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646931543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xxKhc4ZNOXpITa1Rl2B9HqSBSLinWjNP/yv6Gg9jry4=;
 b=AyMcbq3nL55ZQ7hy/hzFyb16WDQK8kHuvk4U9z4nYC8valYuJrXeB5SnE50nA4JH4VpQzZ
 j3p4B9fvLVN7Nu+fF7oLde8uEBb+pK3Hez0kP8LIO7QQi0zi6kDzunzK70FpfFAWNn9t2m
 HvDCVl42M2QO3UrEyESHz6/3z3fpkXpOz2aUjQhBlV+o/QKwEOQGPxj9TSb8oGy0l9X745
 g7u6PBNkR3Zi+tvEnCJXvmfdXq9wpXVKLVDxzVIM3fh9TvZE2kDoCUum28lT2sn62JqCWT
 vNlsFtgLEFqotTzEep7yxTOBagPwT3WXHoVqmJVRm0mi8owONuR1D+XnM7C9lQ==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 17:57:32 +0100
Message-Id: <20220310165735.1102802-5-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310165735.1102802-1-clement.leger@bootlin.com>
References: <20220310165735.1102802-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/7] package/optee-test: bump to version
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

QnVtcCBPUC1URUUgdGVzdCBwYWNrYWdlIHZlcnNpb24gdG8gT1AtVEVFIHJlbGVhc2UgMy4xNi4w
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4u
Y29tPgotLS0KIHBhY2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0Lmhhc2ggfCA0ICsrLS0KIHBh
Y2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0Lm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL29w
dGVlLXRlc3Qvb3B0ZWUtdGVzdC5oYXNoIGIvcGFja2FnZS9vcHRlZS10ZXN0L29wdGVlLXRlc3Qu
aGFzaAppbmRleCA1ZDY4Zjk0ZmJkLi43ODA2ZDlhMWFmIDEwMDY0NAotLS0gYS9wYWNrYWdlL29w
dGVlLXRlc3Qvb3B0ZWUtdGVzdC5oYXNoCisrKyBiL3BhY2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10
ZXN0Lmhhc2gKQEAgLTEsNCArMSw0IEBACi0jIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL09QLVRF
RS9vcHRlZV90ZXN0L2FyY2hpdmUvMy4xNS4wL29wdGVlLXRlc3QtMy4xNS4wLnRhci5negotc2hh
MjU2IDljMmI2YjgwMDU1Y2JlZjBmOWJjY2NlMTdkZGU0OTQ3MjViYzcxZDkwMTNkYWNhZWIzZTQ2
ZDA5MjYxOTEwOTggIG9wdGVlLXRlc3QtMy4xNS4wLnRhci5negorIyBGcm9tIGh0dHBzOi8vZ2l0
aHViLmNvbS9PUC1URUUvb3B0ZWVfdGVzdC9hcmNoaXZlLzMuMTYuMC9vcHRlZS10ZXN0LTMuMTYu
MC50YXIuZ3oKK3NoYTI1NiBiMjRhMzg3MTYwNWEzNDFmYTg3ZTZkNGUxMTFmOTcwMDFmMTFhNzJj
MDI1ZTc1ZDY3MzllZDc4ODQxYjZhY2JhICBvcHRlZS10ZXN0LTMuMTYuMC50YXIuZ3oKICMgTG9j
YWxseSBjb21wdXRlZAogc2hhMjU2IDZlNjgxMDk4MWYwZGRhYjllMGQ0NDM5OWQwNzAwYTE1ZDlm
NzYwYTNjMjg0M2NjODY2NjU5YzIwNzQxMzlhZTcgIExJQ0VOU0UubWQKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0Lm1rIGIvcGFja2FnZS9vcHRlZS10ZXN0L29wdGVl
LXRlc3QubWsKaW5kZXggZjIxMTdjMGQwMC4uN2IyNzU1OGIzNiAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9vcHRlZS10ZXN0L29wdGVlLXRlc3QubWsKKysrIGIvcGFja2FnZS9vcHRlZS10ZXN0L29wdGVl
LXRlc3QubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1P
UFRFRV9URVNUX1ZFUlNJT04gPSAzLjE1LjAKK09QVEVFX1RFU1RfVkVSU0lPTiA9IDMuMTYuMAog
T1BURUVfVEVTVF9TSVRFID0gJChjYWxsIGdpdGh1YixPUC1URUUsb3B0ZWVfdGVzdCwkKE9QVEVF
X1RFU1RfVkVSU0lPTikpCiBPUFRFRV9URVNUX0xJQ0VOU0UgPSBHUEwtMi4wLCBCU0QtMi1DbGF1
c2UsCiBPUFRFRV9URVNUX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLm1kCi0tIAoyLjM0LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
