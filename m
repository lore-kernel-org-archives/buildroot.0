Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C636C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 12:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0EEA4196B;
	Fri, 11 Mar 2022 12:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qsndzlsby2OV; Fri, 11 Mar 2022 12:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 236534196A;
	Fri, 11 Mar 2022 12:38:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11F231C1190
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F25B60B20
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETlsOzLg7hsw for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 12:38:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E36CB611FA
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 12:38:04 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FB50C0004;
 Fri, 11 Mar 2022 12:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647002283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kyuhm/5WYbDAtEF8eHHUOJyJ3nEcr4qTl9VwNrKPu+o=;
 b=BsOu5BmbgzIMQlwCkSS3t16kgm4+d6OsEeX5DcFt+Vt+++k9nHn9g9lm9a33U8gpi2Jaa8
 OvTgSClhCZLJgjJtgt788oBJgOwtWB4qn7PS3hVGJNOUE5zd/bG/8IkyWEL99kEFcvGcmY
 U/XKeobA2sJIya5U9oSUTw9/jaOq4MEP0Ril1PD6EEgI01UQterXvE09Z5LJXRa2Gmc+Rw
 vzAdkgvBa+mIb6cg6WfcX9YjGuk9030lToD6SokZAiB/ZJAOPSZvlgmeA6tbN3eHsnDkj3
 OJ3YVqRN1je+rjMZEbliBLvhkKlxKtCkno6ipq1w3JlJ8WcfYvna2bM1L4z0Zg==
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 13:36:33 +0100
Message-Id: <20220311123636.13415-5-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311123636.13415-1-clement.leger@bootlin.com>
References: <20220311123636.13415-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 4/7] package/optee-test: bump to version
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
