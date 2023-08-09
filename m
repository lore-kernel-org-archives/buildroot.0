Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF808C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 06:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EEA060F8F;
	Wed,  9 Aug 2023 06:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EEA060F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uFvpCUMt_1nF; Wed,  9 Aug 2023 06:15:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7C8F60F8C;
	Wed,  9 Aug 2023 06:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7C8F60F8C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CB991BF5A8
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 06:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1C3660F8C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 06:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C3660F8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7qzYObsKkWv for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 06:15:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED0BF60B26
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 06:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED0BF60B26
Received: by mail.gandi.net (Postfix) with ESMTPA id 0AC7A60009;
 Wed,  9 Aug 2023 06:15:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 08:15:01 +0200
Message-Id: <20230809061501.300165-1-clement.ramirez@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: clement.ramirez@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691561752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LnKernDMAaB6zkr62rAu5z037IUsUTaw3EOC3qO96Dg=;
 b=E1ywZLyZEEfrY08kCvVKEoXiTt9KgGQQ/o1+JovrOR6NwlJfa9ihoMPqDiTwPntTYt6oSP
 Xn8y3U0Gu9VWryA5i91LDb2QgFPf0OhBPAltXl1jlViNXg6o2rHiKEuQOCPnkq1g2T+yWo
 DWBGvW6nYmEwu7c/cZC7dfvVPnIA+R0kwyp8j18RNOWeAOwy2JVfNw7ozMEfAcXHBEYx49
 p24CrdRPITxq2e/FiSxStCj3xQwaFHPfpgLOAY0wuRfXmEs7wlpyayg/v8YGx/vgHDMoUM
 Ftgm4tpqrEHP2baHdltucfdV7e1UERHo5iOD7Pxgi/5NGcdPOvsOAYrCbg7Kcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E1ywZLyZ
Subject: [Buildroot] [PATCH 1/1] package/diffutils: add
 DIFFUTILS_CPE_ID_VENDOR
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
From: =?utf-8?q?Cl=C3=A9ment_Ramirez_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Cl=C3=A9ment=20Ramirez?= <clement.ramirez@bootlin.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20Ramirez?= <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Y3BlOjIuMzphOmdudTpkaWZmdXRpbHMgaXMgYSB2YWxpZCBpZGVudGlmaWVyIGZvcgp0aGlzIHBh
Y2thZ2U6Cmh0dHBzOi8vbnZkLm5pc3QuZ292L3Byb2R1Y3RzL2NwZS9zZWFyY2gvcmVzdWx0cz9u
YW1pbmdGb3JtYXQ9Mi4zJmtleXdvcmQ9ZGlmZnV0aWxzCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBSYW1pcmV6IDxjbGVtZW50LnJhbWlyZXpAYm9vdGxpbi5jb20+Ci0tLQogcGFja2FnZS9kaWZm
dXRpbHMvZGlmZnV0aWxzLm1rIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2RpZmZ1dGlscy9kaWZmdXRpbHMubWsgYi9wYWNrYWdlL2Rp
ZmZ1dGlscy9kaWZmdXRpbHMubWsKaW5kZXggMmM2NjQzNGE5YS4uMTExOTI2Njg2MyAxMDA2NDQK
LS0tIGEvcGFja2FnZS9kaWZmdXRpbHMvZGlmZnV0aWxzLm1rCisrKyBiL3BhY2thZ2UvZGlmZnV0
aWxzL2RpZmZ1dGlscy5tawpAQCAtMTAsNiArMTAsNyBAQCBESUZGVVRJTFNfU0lURSA9ICQoQlIy
X0dOVV9NSVJST1IpL2RpZmZ1dGlscwogRElGRlVUSUxTX0RFUEVOREVOQ0lFUyA9ICQoVEFSR0VU
X05MU19ERVBFTkRFTkNJRVMpCiBESUZGVVRJTFNfTElDRU5TRSA9IEdQTC0zLjArCiBESUZGVVRJ
TFNfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKK0RJRkZVVElMU19DUEVfSURfVkVORE9SID0gZ251
CiAKICMgU2luY2UgZ2xpYmMgPj0gMi4yNiwgZG9uJ3QgdHJ5IHRvIHVzZSBnZXRvcHRfbG9uZyBy
ZXBsYWNlbWVudCBidW5kbGVkCiAjIHdpdGggZGlmZnV0aWxzLiBJdCB3aWxsIGNvbmZsaWN0IHdp
dGggdGhlIG9uZSBmcm9tIGdsaWJjLgotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
