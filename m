Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F032C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 12:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34BDC40A38;
	Fri, 11 Mar 2022 12:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vb0NCLgaxJ9w; Fri, 11 Mar 2022 12:39:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4FA440B2F;
	Fri, 11 Mar 2022 12:39:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B54411BF3BD
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2E58408DF
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id imQW9mPkT-sW for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 12:38:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E07F140301
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 12:38:06 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 98E84C0008;
 Fri, 11 Mar 2022 12:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647002283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqAaBL2Nbcg8IihRsSDcvmlTe8+cAyt0QAV3QdPGOxI=;
 b=EjCNmVjXkrmFZ0Dg8f/nucl6do1M1Q/ezYmISWFDEX2yBWHeLbKgh+1C03irIrcZGa4SQX
 UwoeumBwB7kqvgytnwM/dj+we+qSv1Aa8I0M1Fo7uYhM415SnenI7CCD5vqdz11Cud02BS
 TB3QeXtS42xJiLGRujMwq9XIa8tTSFkIOYWfgjnwdPeBonDC2Vlyq+qlzzDWSoOsQNcWYv
 nGBc4lBLtuT50c08wNjDEhWVMOvv+J6ZLP+nOITSnvpzfBTQEZKZFih7DtBMOJgsvbWQtv
 sICI+8LHY8k7GZak2HUr6bhogy3a/3aZNwVYzMAJJMo2AUqQbqdiHwQZsJJg3g==
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 13:36:32 +0100
Message-Id: <20220311123636.13415-4-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311123636.13415-1-clement.leger@bootlin.com>
References: <20220311123636.13415-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/7] boot/optee-os: bump to version 3.16.0
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
LW9zL0NvbmZpZy5pbiBiL2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluCmluZGV4IGY4NDI2ZjlhYjIu
LjZmZTJhZTk1YWMgMTAwNjQ0Ci0tLSBhL2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluCisrKyBiL2Jv
b3Qvb3B0ZWUtb3MvQ29uZmlnLmluCkBAIC0xOCw3ICsxOCw3IEBAIGNob2ljZQogCSAgU2VsZWN0
IHRoZSB2ZXJzaW9uIG9mIE9QLVRFRSBPUyB5b3Ugd2FudCB0byB1c2UKIAogY29uZmlnIEJSMl9U
QVJHRVRfT1BURUVfT1NfTEFURVNUCi0JYm9vbCAiMy4xNS4wIgorCWJvb2wgIjMuMTYuMCIKIAlo
ZWxwCiAJICBVc2UgdGhlIGxhdGVzdCByZWxlYXNlIHRhZyBmcm9tIHRoZSBPUC1URUUgT1Mgb2Zm
aWNpYWwgR2l0CiAJICByZXBvc2l0b3J5LgpAQCAtNTAsNiArNTAsNyBAQCBlbmRpZgogCiBjb25m
aWcgQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZCiAJYm9vbCAi
b3B0ZWUtb3MgbmVlZHMgaG9zdC1weXRob24tY3J5cHRvZ3JhcGh5IHRvIGJ1aWxkIgorCWRlZmF1
bHQgeQogCWhlbHAKIAkgIE9QLVRFRSB2ZXJzaW9uIGJlbG93IDMuMTYgdXNlZCBweXRob24tcHlj
cnlwdG9kb21leCBwYWNrYWdlCiAJICBpbiBweXRob24gc2NyaXB0cy4gTmV3ZXIgdmVyc2lvbiB1
c2VzIHB5dGhvbi1jcnlwdG9ncmFwaHkuCkBAIC01OCw3ICs1OSw3IEBAIGNvbmZpZyBCUjJfVEFS
R0VUX09QVEVFX09TX05FRURTX1BZVEhPTl9DUllQVE9HUkFQSFkKIAogY29uZmlnIEJSMl9UQVJH
RVRfT1BURUVfT1NfVkVSU0lPTgogCXN0cmluZwotCWRlZmF1bHQgIjMuMTUuMCIJaWYgQlIyX1RB
UkdFVF9PUFRFRV9PU19MQVRFU1QKKwlkZWZhdWx0ICIzLjE2LjAiCWlmIEJSMl9UQVJHRVRfT1BU
RUVfT1NfTEFURVNUCiAJZGVmYXVsdCBCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9SRVBPX1ZF
UlNJT04gXAogCQkJCWlmIEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX0dJVAogCmRpZmYgLS1n
aXQgYS9ib290L29wdGVlLW9zL29wdGVlLW9zLmhhc2ggYi9ib290L29wdGVlLW9zL29wdGVlLW9z
Lmhhc2gKaW5kZXggM2MzMmUyNWIzNi4uYjliMGU1YjQzZiAxMDA2NDQKLS0tIGEvYm9vdC9vcHRl
ZS1vcy9vcHRlZS1vcy5oYXNoCisrKyBiL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaApAQCAt
MSw0ICsxLDQgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vT1AtVEVFL29wdGVlX29zL2Fy
Y2hpdmUvMy4xNS4wL29wdGVlLW9zLTMuMTUuMC50YXIuZ3oKLXNoYTI1NiBlNWJiM2Q5ZWVkYWY3
Nzg1YWYwOTE2MDJhZGRhYzViNTIxMThmNGNkYzEwOGFmOWNkNmY2Yzk2YjIxNTAzYWI4ICBvcHRl
ZS1vcy0zLjE1LjAudGFyLmd6CisjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL09QLVRFRS9vcHRl
ZV9vcy9hcmNoaXZlLzMuMTYuMC9vcHRlZS1vcy0zLjE2LjAudGFyLmd6CitzaGEyNTYgZWJjOGUx
OGFkMjAzOWVlOTdjMzRmNzRhNzU0NmRlOTExOWUyNmYwNGMzNjhiNmM3ZmQwYzU1ZjkzZDMzZDJk
NiAgb3B0ZWUtb3MtMy4xNi4wLnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkCiBzaGEyNTYgMTI0
N2VlOTA4NThmNDAzN2I2Y2FjNjNjYmZmZGRmZWQ0MzVkMGQ3M2M2MzFiMzdkNzhjMWU2ZTZhYjNl
NWQxYSAgTElDRU5TRQotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
