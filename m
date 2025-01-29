Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FE2C02190
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 12:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECE7B41415;
	Wed, 29 Jan 2025 12:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GaJz5fA9gxsU; Wed, 29 Jan 2025 12:54:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC8ED41420
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC8ED41420;
	Wed, 29 Jan 2025 12:54:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61089AF7
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 12:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D0A841412
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 12:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtWsXqxATsNz for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 12:54:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84EE341410
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84EE341410
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84EE341410
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 12:54:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD88F1007;
 Wed, 29 Jan 2025 04:54:45 -0800 (PST)
Received: from localhost.localdomain (unknown [10.34.111.200])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B7603F694;
 Wed, 29 Jan 2025 04:54:18 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?=C3=89tienne=20Carri=C3=A8re?= <etienne.carriere@foss.st.com>
Date: Wed, 29 Jan 2025 13:54:10 +0100
Message-ID: <20250129125410.250820-4-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250129125410.250820-1-vincent.stehle@arm.com>
References: <20250129125410.250820-1-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 3/3] package/optee-test: add option to use same
 version as optee-os
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
ZWUtdGVzdCwgdG8gZWFzaWx5IGtlZXAgdGhlbQpzeW5jaHJvbml6ZWQuCgpCcmVhayBvbmUgdW5y
ZWxhdGVkIGxvbmcgbGluZSBpbiB0aGUgbWVhbiB0aW1lIHRvIGtlZXAgZm9ybWF0dGluZwpoYXJt
b25pb3VzLgoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBh
cm0uY29tPgpDYzogw4l0aWVubmUgQ2FycmnDqHJlIDxldGllbm5lLmNhcnJpZXJlQGZvc3Muc3Qu
Y29tPgotLS0KIHBhY2thZ2Uvb3B0ZWUtdGVzdC9Db25maWcuaW4gfCAxMSArKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL29wdGVlLXRlc3QvQ29uZmlnLmluIGIvcGFja2FnZS9vcHRlZS10ZXN0L0Nv
bmZpZy5pbgppbmRleCBhMjllYjM1NWFjLi4wM2I1MzJlMzM4IDEwMDY0NAotLS0gYS9wYWNrYWdl
L29wdGVlLXRlc3QvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uvb3B0ZWUtdGVzdC9Db25maWcuaW4K
QEAgLTM2LDEwICszNiwxNyBAQCBpZiBCUjJfUEFDS0FHRV9PUFRFRV9URVNUCiAKIGNob2ljZQog
CXByb21wdCAib3B0ZWUtdGVzdCB2ZXJzaW9uIgotCWRlZmF1bHQgQlIyX1BBQ0tBR0VfT1BURUVf
VEVTVF9MQVRFU1QgaWYgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19BUkNIX1NVUFBPUlRTCisJZGVm
YXVsdCBCUjJfUEFDS0FHRV9PUFRFRV9URVNUX0FTX09TIFwKKwkJCQlpZiBCUjJfVEFSR0VUX09Q
VEVFX09TX0NVU1RPTV9WRVJTSU9OCisJZGVmYXVsdCBCUjJfUEFDS0FHRV9PUFRFRV9URVNUX0xB
VEVTVCBcCisJCQkJaWYgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19BUkNIX1NVUFBPUlRTCiAJaGVs
cAogCSAgU2VsZWN0IHRoZSB2ZXJzaW9uIG9mIG9wdGVlLXRlc3QgeW91IHdhbnQgdG8gdXNlCiAK
K2NvbmZpZyBCUjJfUEFDS0FHRV9PUFRFRV9URVNUX0FTX09TCisJYm9vbCAiU2FtZSBhcyBvcHRl
ZS1vcyBiZWluZyBidWlsdCIKKwlkZXBlbmRzIG9uIEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9N
X1ZFUlNJT04KKwogY29uZmlnIEJSMl9QQUNLQUdFX09QVEVFX1RFU1RfTEFURVNUCiAJYm9vbCAi
NC4zLjAiCiAJaGVscApAQCAtNjgsNiArNzUsOCBAQCBlbmRpZgogCiBjb25maWcgQlIyX1BBQ0tB
R0VfT1BURUVfVEVTVF9WRVJTSU9OCiAJc3RyaW5nCisJZGVmYXVsdCBCUjJfVEFSR0VUX09QVEVF
X09TX0NVU1RPTV9WRVJTSU9OX1ZBTFVFIFwKKwkJCQlpZiBCUjJfUEFDS0FHRV9PUFRFRV9URVNU
X0FTX09TCiAJZGVmYXVsdCAiNC4zLjAiCQlpZiBCUjJfUEFDS0FHRV9PUFRFRV9URVNUX0xBVEVT
VAogCWRlZmF1bHQgImN1c3RvbSIJaWYgQlIyX1BBQ0tBR0VfT1BURUVfVEVTVF9DVVNUT01fVEFS
QkFMTAogCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
