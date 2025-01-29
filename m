Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80D3C0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 12:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91B3780BB0;
	Wed, 29 Jan 2025 12:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdVclqrc7x5b; Wed, 29 Jan 2025 12:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE7658375B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE7658375B;
	Wed, 29 Jan 2025 12:54:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D35072376
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 12:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4CEA60FBC
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 12:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ieaP2aJGx7vO for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 12:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 213D460FA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 213D460FA8
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 213D460FA8
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 12:54:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1777497;
 Wed, 29 Jan 2025 04:54:44 -0800 (PST)
Received: from localhost.localdomain (unknown [10.34.111.200])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F2A633F694;
 Wed, 29 Jan 2025 04:54:17 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?=C3=89tienne=20Carri=C3=A8re?= <etienne.carriere@foss.st.com>
Date: Wed, 29 Jan 2025 13:54:09 +0100
Message-ID: <20250129125410.250820-3-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250129125410.250820-1-vincent.stehle@arm.com>
References: <20250129125410.250820-1-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 2/3] package/optee-examples: add option to use
 same version as optee-os
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2UgY2FuIHNlbGVjdCBhIGN1c3RvbSBvZmZpY2lhbCB2ZXJzaW9uIGZvciB0aGUgb3B0ZWUtb3Mg
cGFja2FnZTsgYWRkIGFuCm9wdGlvbiB0byBzZWxlY3QgdGhlIHNhbWUgdmVyc2lvbiBmb3Igb3B0
ZWUtZXhhbXBsZXMsIHRvIGVhc2lseSBrZWVwIHRoZW0Kc3luY2hyb25pemVkLgoKU2lnbmVkLW9m
Zi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgpDYzogw4l0aWVu
bmUgQ2FycmnDqHJlIDxldGllbm5lLmNhcnJpZXJlQGZvc3Muc3QuY29tPgotLS0KIHBhY2thZ2Uv
b3B0ZWUtZXhhbXBsZXMvQ29uZmlnLmluIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvQ29uZmln
LmluIGIvcGFja2FnZS9vcHRlZS1leGFtcGxlcy9Db25maWcuaW4KaW5kZXggNTJlZjI2OGFjNC4u
NWM1YjBjZTViYSAxMDA2NDQKLS0tIGEvcGFja2FnZS9vcHRlZS1leGFtcGxlcy9Db25maWcuaW4K
KysrIGIvcGFja2FnZS9vcHRlZS1leGFtcGxlcy9Db25maWcuaW4KQEAgLTMxLDEwICszMSwxNiBA
QCBpZiBCUjJfUEFDS0FHRV9PUFRFRV9FWEFNUExFUwogCiBjaG9pY2UKIAlwcm9tcHQgIm9wdGVl
LWV4YW1wbGVzIHZlcnNpb24iCisJZGVmYXVsdCBCUjJfUEFDS0FHRV9PUFRFRV9FWEFNUExFU19B
U19PUyBcCisJCQkJaWYgQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fVkVSU0lPTgogCWRlZmF1
bHQgQlIyX1BBQ0tBR0VfT1BURUVfRVhBTVBMRVNfTEFURVNUCiAJaGVscAogCSAgU2VsZWN0IHRo
ZSB2ZXJzaW9uIG9mIG9wdGVlLWV4YW1wbGVzIHlvdSB3YW50IHRvIHVzZQogCitjb25maWcgQlIy
X1BBQ0tBR0VfT1BURUVfRVhBTVBMRVNfQVNfT1MKKwlib29sICJTYW1lIGFzIG9wdGVlLW9zIGJl
aW5nIGJ1aWx0IgorCWRlcGVuZHMgb24gQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fVkVSU0lP
TgorCiBjb25maWcgQlIyX1BBQ0tBR0VfT1BURUVfRVhBTVBMRVNfTEFURVNUCiAJYm9vbCAiNC4z
LjAiCiAJaGVscApAQCAtNjQsNiArNzAsOCBAQCBlbmRpZgogCiBjb25maWcgQlIyX1BBQ0tBR0Vf
T1BURUVfRVhBTVBMRVNfVkVSU0lPTgogCXN0cmluZworCWRlZmF1bHQgQlIyX1RBUkdFVF9PUFRF
RV9PU19DVVNUT01fVkVSU0lPTl9WQUxVRSBcCisJCQkJaWYgQlIyX1BBQ0tBR0VfT1BURUVfRVhB
TVBMRVNfQVNfT1MKIAlkZWZhdWx0ICI0LjMuMCIJCWlmIEJSMl9QQUNLQUdFX09QVEVFX0VYQU1Q
TEVTX0xBVEVTVAogCWRlZmF1bHQgImN1c3RvbSIJaWYgQlIyX1BBQ0tBR0VfT1BURUVfRVhBTVBM
RVNfQ1VTVE9NX1RBUkJBTEwKIAotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
