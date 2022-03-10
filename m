Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233B9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 17:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D42326122A;
	Thu, 10 Mar 2022 17:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OEFIFj8ytK5D; Thu, 10 Mar 2022 17:00:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0A5461251;
	Thu, 10 Mar 2022 17:00:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BB731BF293
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01FF940545
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bD8hdNHWmjr5 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 16:59:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8709F40577
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 16:59:06 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7C6C960006;
 Thu, 10 Mar 2022 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646931544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYL86FT+cmNIQ9vZx/8Zqae/0x5krCclVg5MXFb+yEE=;
 b=e0k9V2ovg5NNcJzRlZFc0rCxCn98VN2Yjhp4R4WxDpXaMMjutrb0wdaFKtNkESiofDaGZb
 78vHK/ij4qXMIq6Edn7B7QNCloToa9EtV6a7B9G6DcJYazHK5quhhg81il+nQOrWss0vo5
 GT/8TQhKDx8oL0kbOH6vwkSuZ3E0IiF/uci9WJwaBEQOlYp/b4zkUW3+H4OzLeJhb7ATL0
 U3iKHP/ve+gR+Q35ttx6OVZ9HMt+mHAAUr9OrJ73HCOSa2/TJ82jLQFzg9WGMqJTkeg/Dv
 FuWIc0MA8ELqVhIr9eXjk1Fl8gVossQfNfbQieG/FuuOJ7RTvNw7d7R2xk39kA==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 17:57:34 +0100
Message-Id: <20220310165735.1102802-7-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310165735.1102802-1-clement.leger@bootlin.com>
References: <20220310165735.1102802-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 6/7] package/optee-client: bump to version
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
cCBPUC1URUUgQ2xpZW50IHBhY2thZ2UgdmVyc2lvbiB0byBPUC1URUUgcmVsZWFzZSAzLjE2LjAu
CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5j
b20+Ci0tLQogcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUtY2xpZW50Lmhhc2ggfCA0ICsrLS0K
IHBhY2thZ2Uvb3B0ZWUtY2xpZW50L29wdGVlLWNsaWVudC5tayAgIHwgMiArLQogMiBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUtY2xpZW50Lmhhc2ggYi9wYWNrYWdlL29wdGVlLWNsaWVu
dC9vcHRlZS1jbGllbnQuaGFzaAppbmRleCAzYWUwNmYyYWZiLi4yNmIwYTZjZWQ0IDEwMDY0NAot
LS0gYS9wYWNrYWdlL29wdGVlLWNsaWVudC9vcHRlZS1jbGllbnQuaGFzaAorKysgYi9wYWNrYWdl
L29wdGVlLWNsaWVudC9vcHRlZS1jbGllbnQuaGFzaApAQCAtMSw0ICsxLDQgQEAKLSMgRnJvbSBo
dHRwczovL2dpdGh1Yi5jb20vT1AtVEVFL29wdGVlX2NsaWVudC9hcmNoaXZlLzMuMTUuMC9vcHRl
ZS1jbGllbnQtMy4xNS4wLnRhci5negotc2hhMjU2IGUxZWE2Yzk1M2UzNTg0MjQ4ZDdhNjIwNTA4
MTNlNWFjMGYwMTEyOTMzNDQ3OTU0YzQ0MjM2YTIzM2E0Y2JiYTUgIG9wdGVlLWNsaWVudC0zLjE1
LjAudGFyLmd6CisjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL09QLVRFRS9vcHRlZV9jbGllbnQv
YXJjaGl2ZS8zLjE2LjAvb3B0ZWUtY2xpZW50LTMuMTYuMC50YXIuZ3oKK3NoYTI1NiBjYmE5MmJl
ZGM5ZjhjMzljMTllNTBhMjIyNTkwNjZlYWFkNWNlYjI0ODMwOGVkZWUyN2UyMjFmMTFmNWQ4MDY0
ICBvcHRlZS1jbGllbnQtMy4xNi4wLnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkCiBzaGEyNTYg
ZmRhODM4NTk5M2YxMTJkN2NhNjFiODhiNTRiYTViNGNiZWVjN2U0M2EwZjliMzE3ZDUxODY3MDNj
MTk4NWU4ZiAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUt
Y2xpZW50Lm1rIGIvcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUtY2xpZW50Lm1rCmluZGV4IGRk
YTlhMjg1NWQuLjJjYWRjNTY0ZjAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3B0ZWUtY2xpZW50L29w
dGVlLWNsaWVudC5taworKysgYi9wYWNrYWdlL29wdGVlLWNsaWVudC9vcHRlZS1jbGllbnQubWsK
QEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1PUFRFRV9DTElF
TlRfVkVSU0lPTiA9IDMuMTUuMAorT1BURUVfQ0xJRU5UX1ZFUlNJT04gPSAzLjE2LjAKIE9QVEVF
X0NMSUVOVF9TSVRFID0gJChjYWxsIGdpdGh1YixPUC1URUUsb3B0ZWVfY2xpZW50LCQoT1BURUVf
Q0xJRU5UX1ZFUlNJT04pKQogT1BURUVfQ0xJRU5UX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UKIE9Q
VEVFX0NMSUVOVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQotLSAKMi4zNC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
