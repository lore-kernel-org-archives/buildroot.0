Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D0FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 15:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 525AE40510;
	Mon, 14 Mar 2022 15:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVJKZddoL82P; Mon, 14 Mar 2022 15:34:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78B2F404A5;
	Mon, 14 Mar 2022 15:34:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DEAC1BF395
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 15:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ABED4025C
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 15:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JHJ6iMoVjXJ5 for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 15:33:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21CA340227
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 15:33:03 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 226A06000C;
 Mon, 14 Mar 2022 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647271982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kyuhm/5WYbDAtEF8eHHUOJyJ3nEcr4qTl9VwNrKPu+o=;
 b=SqhUIZKB+Ytw2ElcUXhrQVzrvs5QuRZNuY/haveXXHVGzEaqKnKNdVuz8POSRS3g//Mye2
 vnC2hR84j7LOpfLoi0JbKa637E7EE0BntArC8NAKbo+Fe2vQXVvmwK3DFBgK1UWL8+JdN5
 Gq2m4dlIlX+JuHZZ4hoEUAHErMXWuh8bxar/18kDx8kKTMptJy9iX8XfAnLlC6/uSXor8V
 bs4l2DLT6VDuR7BjtF3s3IL2nulKznhweDXY6xsLYNF35FKjq3+pbQEShXupyoQ3l9QBSh
 oeFKO8RvFEN7kWgGVBMYrnPL7k1Hq7+AzoMO2t0EqzQLFEULnawhyE7hFQHdUw==
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 16:31:08 +0100
Message-Id: <20220314153111.1390512-6-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314153111.1390512-1-clement.leger@bootlin.com>
References: <20220314153111.1390512-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 5/8] package/optee-test: bump to version
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
LgoKQWNrZWQtYnk6IEV0aWVubmUgQ2FycmllcmUgPGV0aWVubmUuY2FycmllcmVAbGluYXJvLm9y
Zz4KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4u
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
