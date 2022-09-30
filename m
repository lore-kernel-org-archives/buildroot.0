Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4696EC433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 14:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8D1583E20;
	Fri, 30 Sep 2022 14:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8D1583E20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fA78YHHFYVSW; Fri, 30 Sep 2022 14:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E15AA83E2B;
	Fri, 30 Sep 2022 14:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E15AA83E2B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEBE61BF291
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 14:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EDE440A8A
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 14:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EDE440A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCx4PfCfE9Hl for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 14:14:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6CFF409F8
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6CFF409F8
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 14:14:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 461E113D5;
 Fri, 30 Sep 2022 07:14:06 -0700 (PDT)
Received: from localhost.localdomain (X72Y076X74.nice.arm.com [10.34.129.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 0C0363F792; Fri, 30 Sep 2022 07:13:58 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 16:13:50 +0200
Message-Id: <20220930141350.15305-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/fwts: enable for arm
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIEZXVFMgYXBwbGljYXRpb24gYW5kIGl0cyBhc3NvY2lhdGVkIGtlcm5lbCBtb2R1bGVzIGRv
IGJ1aWxkIG9uIGFybTsKZW5hYmxlIGl0LgoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOp
IDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgpDYzogRXJpY28gTnVuZXMgPG51bmVzLmVyaWNvQGdt
YWlsLmNvbT4KLS0tCiBwYWNrYWdlL2Z3dHMvQ29uZmlnLmluIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvZnd0cy9Db25maWcuaW4gYi9wYWNrYWdlL2Z3dHMvQ29uZmlnLmluCmluZGV4IGFjOWEyZTM5
MDk4Li42YmUxYWNhYzRlZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9md3RzL0NvbmZpZy5pbgorKysg
Yi9wYWNrYWdlL2Z3dHMvQ29uZmlnLmluCkBAIC0xLDYgKzEsNiBAQAogY29uZmlnIEJSMl9QQUNL
QUdFX0ZXVFMKIAlib29sICJmd3RzIgotCWRlcGVuZHMgb24gQlIyX2kzODYgfHwgQlIyX3g4Nl82
NCB8fCBCUjJfYWFyY2g2NAorCWRlcGVuZHMgb24gQlIyX2kzODYgfHwgQlIyX3g4Nl82NCB8fCBC
UjJfYWFyY2g2NCB8fCBCUjJfYXJtCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MSUJCU0RfQVJD
SF9TVVBQT1JUUyAjIGxpYmJzZAogCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBsaWJnbGliMgog
CWRlcGVuZHMgb24gQlIyX1VTRV9XQ0hBUiAjIGxpYmdsaWIyLCBsaWJic2QKQEAgLTMzLDcgKzMz
LDcgQEAgY29tbWVudCAiZWZpX3J1bnRpbWUgbW9kdWxlIG5lZWRzIGEgTGludXgga2VybmVsIHRv
IGJlIGJ1aWx0IgogZW5kaWYKIAogY29tbWVudCAiZnd0cyBuZWVkcyBhIGdsaWJjIHRvb2xjaGFp
biB3LyB3Y2hhciwgdGhyZWFkcywgZHluYW1pYyBsaWJyYXJ5IgotCWRlcGVuZHMgb24gQlIyX2kz
ODYgfHwgQlIyX3g4Nl82NCB8fCBCUjJfYWFyY2g2NAorCWRlcGVuZHMgb24gQlIyX2kzODYgfHwg
QlIyX3g4Nl82NCB8fCBCUjJfYWFyY2g2NCB8fCBCUjJfYXJtCiAJZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9MSUJCU0RfQVJDSF9TVVBQT1JUUyAjIGxpYmJzZAogCWRlcGVuZHMgb24gQlIyX1VTRV9N
TVUKIAlkZXBlbmRzIG9uICFCUjJfVVNFX1dDSEFSIHx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJF
QURTIHx8IFwKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
