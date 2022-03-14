Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C12C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 15:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC48A606BF;
	Mon, 14 Mar 2022 15:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVoPj0kvafSg; Mon, 14 Mar 2022 15:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F286D60C21;
	Mon, 14 Mar 2022 15:33:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57F731BF395
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 15:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52C9B404AA
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 15:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGOyYg2DHpKS for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 15:33:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1403A4019C
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 15:33:02 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3105560010;
 Mon, 14 Mar 2022 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647271981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/e4zfF5jxeY88G0NUWkWhyqnQDRRV5Qdq8edqjTFvQ=;
 b=AhLZ5VvH9aIgAiBY5b4pIy82Nu9VBB3jHTJYCIeGiSjclypl/FlGj7b0qLMI3ExIxcPvHL
 HF0EW19ZsJkZ5/HyN+ssnDZo8mQC1E0fBnVjlbdGW4LzkvXZQ7KqIzJ6CmFEsshglmNY2o
 eZHHX49gHTATqw3Od0Qj+XBB90dmXnVwJXphD9dE8YdrQ1Y5/wE52aFaJYrAMstFxm3Ya6
 FzeuhT72l7ZXaryLLPO2DOAe7FR/6SofsNGP2MNKS70jCXszbv6AmzW+7fmHgzaU17kOiJ
 nyHuRn+OKBQ/pz82TLHBMr7pQg7Ez2hu+HTideB+0/Q+eByzcq9d9ThwbOw/BQ==
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 16:31:07 +0100
Message-Id: <20220314153111.1390512-5-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314153111.1390512-1-clement.leger@bootlin.com>
References: <20220314153111.1390512-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 4/8] boot/optee-os: bump to version 3.16.0
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

QnVtcCBPUC1URUUgT1MgcGFja2FnZSB2ZXJzaW9uIHRvIE9QLVRFRSByZWxlYXNlIDMuMTYuMCBh
bmQgc2V0CkJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWSBkZWZh
dWx0IHRvICd5JyBzaW5jZQpweXRob24tY3J5cHRvZ3JhcGh5IGlzIG5vdyBuZWVkZWQgdG8gYnVp
bGQgb3B0ZWUtb3MuCgpBY2tlZC1ieTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJyaWVy
ZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVn
ZXJAYm9vdGxpbi5jb20+Ci0tLQogYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gICAgIHwgNSArKyst
LQogYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ib290L29wdGVl
LW9zL0NvbmZpZy5pbiBiL2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluCmluZGV4IDM5OTYwMzkxOTEu
LjI5OTI0ZDkxOTggMTAwNjQ0Ci0tLSBhL2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluCisrKyBiL2Jv
b3Qvb3B0ZWUtb3MvQ29uZmlnLmluCkBAIC0xOSw3ICsxOSw4IEBAIGNob2ljZQogCSAgU2VsZWN0
IHRoZSB2ZXJzaW9uIG9mIE9QLVRFRSBPUyB5b3Ugd2FudCB0byB1c2UKIAogY29uZmlnIEJSMl9U
QVJHRVRfT1BURUVfT1NfTEFURVNUCi0JYm9vbCAiMy4xNS4wIgorCXNlbGVjdCBCUjJfVEFSR0VU
X09QVEVFX09TX05FRURTX1BZVEhPTl9DUllQVE9HUkFQSFkKKwlib29sICIzLjE2LjAiCiAJaGVs
cAogCSAgVXNlIHRoZSBsYXRlc3QgcmVsZWFzZSB0YWcgZnJvbSB0aGUgT1AtVEVFIE9TIG9mZmlj
aWFsIEdpdAogCSAgcmVwb3NpdG9yeS4KQEAgLTY2LDcgKzY3LDcgQEAgY29uZmlnIEJSMl9UQVJH
RVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWQogCiBjb25maWcgQlIyX1RBUkdF
VF9PUFRFRV9PU19WRVJTSU9OCiAJc3RyaW5nCi0JZGVmYXVsdCAiMy4xNS4wIglpZiBCUjJfVEFS
R0VUX09QVEVFX09TX0xBVEVTVAorCWRlZmF1bHQgIjMuMTYuMCIJaWYgQlIyX1RBUkdFVF9PUFRF
RV9PU19MQVRFU1QKIAlkZWZhdWx0IEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX1JFUE9fVkVS
U0lPTiBcCiAJCQkJaWYgQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fR0lUCiAKZGlmZiAtLWdp
dCBhL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaCBiL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3Mu
aGFzaAppbmRleCAzYzMyZTI1YjM2Li5iOWIwZTViNDNmIDEwMDY0NAotLS0gYS9ib290L29wdGVl
LW9zL29wdGVlLW9zLmhhc2gKKysrIGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoCkBAIC0x
LDQgKzEsNCBAQAotIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3MvYXJj
aGl2ZS8zLjE1LjAvb3B0ZWUtb3MtMy4xNS4wLnRhci5negotc2hhMjU2IGU1YmIzZDllZWRhZjc3
ODVhZjA5MTYwMmFkZGFjNWI1MjExOGY0Y2RjMTA4YWY5Y2Q2ZjZjOTZiMjE1MDNhYjggIG9wdGVl
LW9zLTMuMTUuMC50YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vT1AtVEVFL29wdGVl
X29zL2FyY2hpdmUvMy4xNi4wL29wdGVlLW9zLTMuMTYuMC50YXIuZ3oKK3NoYTI1NiBlYmM4ZTE4
YWQyMDM5ZWU5N2MzNGY3NGE3NTQ2ZGU5MTE5ZTI2ZjA0YzM2OGI2YzdmZDBjNTVmOTNkMzNkMmQ2
ICBvcHRlZS1vcy0zLjE2LjAudGFyLmd6CiAjIExvY2FsbHkgY29tcHV0ZWQKIHNoYTI1NiAxMjQ3
ZWU5MDg1OGY0MDM3YjZjYWM2M2NiZmZkZGZlZDQzNWQwZDczYzYzMWIzN2Q3OGMxZTZlNmFiM2U1
ZDFhICBMSUNFTlNFCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
