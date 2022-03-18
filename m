Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D92C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 13:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C2941A0B;
	Fri, 18 Mar 2022 13:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MnOW0slThyF4; Fri, 18 Mar 2022 13:35:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A5F4419FC;
	Fri, 18 Mar 2022 13:35:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65F571C1148
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B42860A72
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ooYkxQ_AuPXj for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 13:34:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6928F607BC
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 13:34:58 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 797FA40019;
 Fri, 18 Mar 2022 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647610496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+7KiiytIg5D8Cqmg6P+OhWo8mFHDqoGB8pf1qgaT7W0=;
 b=DMZKVDjxHi/cym/GtdfevpBD+wH3pw5Antkvz/fBVosoIhB6TOwFeV6hsHlgCBDHsNLx1k
 hcUefQ0QZ1qcML6S7h7UDR6/NGE1OmgitEFaduqP5BXFSSUifcz93SOrbpgwHYsrajQOHU
 QcoY9KG0At0OgKUcZq1dvVGkfts95taXn9B9FCMZERghg7j/PIX5ONnFovg1Q+zMWHmqDu
 /+Ea+3ebCUu0d6QRvtfIQapvQZ/AJQ5pqsDF03UcP8+tKaTyUD00Eqa4H5gAzM/UC6A3Lm
 mkp1b+HKp+pPzYKvbO5WidEvS1wW8wDB35Za11qAdz/f/1P2uPHycty4Kxi0Yw==
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 14:24:26 +0100
Message-Id: <20220318132427.48737-8-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132427.48737-1-clement.leger@bootlin.com>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 7/8] package/optee-client: bump to version
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

QnVtcCBPUC1URUUgQ2xpZW50IHBhY2thZ2UgdmVyc2lvbiB0byBPUC1URUUgcmVsZWFzZSAzLjE2
LjAuCgpBY2tlZC1ieTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJyaWVyZUBsaW5hcm8u
b3JnPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxp
bi5jb20+Ci0tLQogcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUtY2xpZW50Lmhhc2ggfCA0ICsr
LS0KIHBhY2thZ2Uvb3B0ZWUtY2xpZW50L29wdGVlLWNsaWVudC5tayAgIHwgMiArLQogMiBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUtY2xpZW50Lmhhc2ggYi9wYWNrYWdlL29wdGVlLWNs
aWVudC9vcHRlZS1jbGllbnQuaGFzaAppbmRleCAzYWUwNmYyYWZiLi4yNmIwYTZjZWQ0IDEwMDY0
NAotLS0gYS9wYWNrYWdlL29wdGVlLWNsaWVudC9vcHRlZS1jbGllbnQuaGFzaAorKysgYi9wYWNr
YWdlL29wdGVlLWNsaWVudC9vcHRlZS1jbGllbnQuaGFzaApAQCAtMSw0ICsxLDQgQEAKLSMgRnJv
bSBodHRwczovL2dpdGh1Yi5jb20vT1AtVEVFL29wdGVlX2NsaWVudC9hcmNoaXZlLzMuMTUuMC9v
cHRlZS1jbGllbnQtMy4xNS4wLnRhci5negotc2hhMjU2IGUxZWE2Yzk1M2UzNTg0MjQ4ZDdhNjIw
NTA4MTNlNWFjMGYwMTEyOTMzNDQ3OTU0YzQ0MjM2YTIzM2E0Y2JiYTUgIG9wdGVlLWNsaWVudC0z
LjE1LjAudGFyLmd6CisjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL09QLVRFRS9vcHRlZV9jbGll
bnQvYXJjaGl2ZS8zLjE2LjAvb3B0ZWUtY2xpZW50LTMuMTYuMC50YXIuZ3oKK3NoYTI1NiBjYmE5
MmJlZGM5ZjhjMzljMTllNTBhMjIyNTkwNjZlYWFkNWNlYjI0ODMwOGVkZWUyN2UyMjFmMTFmNWQ4
MDY0ICBvcHRlZS1jbGllbnQtMy4xNi4wLnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkCiBzaGEy
NTYgZmRhODM4NTk5M2YxMTJkN2NhNjFiODhiNTRiYTViNGNiZWVjN2U0M2EwZjliMzE3ZDUxODY3
MDNjMTk4NWU4ZiAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0
ZWUtY2xpZW50Lm1rIGIvcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUtY2xpZW50Lm1rCmluZGV4
IGRkYTlhMjg1NWQuLjJjYWRjNTY0ZjAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3B0ZWUtY2xpZW50
L29wdGVlLWNsaWVudC5taworKysgYi9wYWNrYWdlL29wdGVlLWNsaWVudC9vcHRlZS1jbGllbnQu
bWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1PUFRFRV9D
TElFTlRfVkVSU0lPTiA9IDMuMTUuMAorT1BURUVfQ0xJRU5UX1ZFUlNJT04gPSAzLjE2LjAKIE9Q
VEVFX0NMSUVOVF9TSVRFID0gJChjYWxsIGdpdGh1YixPUC1URUUsb3B0ZWVfY2xpZW50LCQoT1BU
RUVfQ0xJRU5UX1ZFUlNJT04pKQogT1BURUVfQ0xJRU5UX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UK
IE9QVEVFX0NMSUVOVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQotLSAKMi4zNC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
