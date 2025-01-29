Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FABC02193
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 12:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B728260FA8;
	Wed, 29 Jan 2025 12:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kDbCRbBO5XmA; Wed, 29 Jan 2025 12:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF5B960FBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF5B960FBC;
	Wed, 29 Jan 2025 12:54:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8AC02375
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 12:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B349541411
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 12:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4bcX63H_ouR for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 12:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE4E8413EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE4E8413EC
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE4E8413EC
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 12:54:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5B7F1007;
 Wed, 29 Jan 2025 04:54:43 -0800 (PST)
Received: from localhost.localdomain (unknown [10.34.111.200])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E636F3F694;
 Wed, 29 Jan 2025 04:54:16 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?=C3=89tienne=20Carri=C3=A8re?= <etienne.carriere@foss.st.com>
Date: Wed, 29 Jan 2025 13:54:08 +0100
Message-ID: <20250129125410.250820-2-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250129125410.250820-1-vincent.stehle@arm.com>
References: <20250129125410.250820-1-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 1/3] package/optee-client: add option to use
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
ZWUtY2xpZW50LCB0byBlYXNpbHkga2VlcCB0aGVtCnN5bmNocm9uaXplZC4KClNpZ25lZC1vZmYt
Ynk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KQ2M6IMOJdGllbm5l
IENhcnJpw6hyZSA8ZXRpZW5uZS5jYXJyaWVyZUBmb3NzLnN0LmNvbT4KLS0tCiBwYWNrYWdlL29w
dGVlLWNsaWVudC9Db25maWcuaW4gfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcHRlZS1jbGllbnQvQ29uZmlnLmluIGIv
cGFja2FnZS9vcHRlZS1jbGllbnQvQ29uZmlnLmluCmluZGV4IDczOGQ0M2Y4MzcuLmVmZWQ4MDBh
ODcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3B0ZWUtY2xpZW50L0NvbmZpZy5pbgorKysgYi9wYWNr
YWdlL29wdGVlLWNsaWVudC9Db25maWcuaW4KQEAgLTE5LDEwICsxOSwxNiBAQCBpZiBCUjJfUEFD
S0FHRV9PUFRFRV9DTElFTlQKIAogY2hvaWNlCiAJcHJvbXB0ICJvcHRlZS1jbGllbnQgdmVyc2lv
biIKKwlkZWZhdWx0IEJSMl9QQUNLQUdFX09QVEVFX0NMSUVOVF9BU19PUyBcCisJCQkJaWYgQlIy
X1RBUkdFVF9PUFRFRV9PU19DVVNUT01fVkVSU0lPTgogCWRlZmF1bHQgQlIyX1BBQ0tBR0VfT1BU
RUVfQ0xJRU5UX0xBVEVTVAogCWhlbHAKIAkgIFNlbGVjdCB0aGUgdmVyc2lvbiBvZiBvcHRlZS1j
bGllbnQgeW91IHdhbnQgdG8gdXNlCiAKK2NvbmZpZyBCUjJfUEFDS0FHRV9PUFRFRV9DTElFTlRf
QVNfT1MKKwlib29sICJTYW1lIGFzIG9wdGVlLW9zIGJlaW5nIGJ1aWx0IgorCWRlcGVuZHMgb24g
QlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fVkVSU0lPTgorCiBjb25maWcgQlIyX1BBQ0tBR0Vf
T1BURUVfQ0xJRU5UX0xBVEVTVAogCWJvb2wgIjQuMy4wIgogCWhlbHAKQEAgLTUyLDYgKzU4LDgg
QEAgZW5kaWYKIAogY29uZmlnIEJSMl9QQUNLQUdFX09QVEVFX0NMSUVOVF9WRVJTSU9OCiAJc3Ry
aW5nCisJZGVmYXVsdCBCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9WRVJTSU9OX1ZBTFVFIFwK
KwkJCQlpZiBCUjJfUEFDS0FHRV9PUFRFRV9DTElFTlRfQVNfT1MKIAlkZWZhdWx0ICI0LjMuMCIJ
CWlmIEJSMl9QQUNLQUdFX09QVEVFX0NMSUVOVF9MQVRFU1QKIAlkZWZhdWx0ICJjdXN0b20iCWlm
IEJSMl9QQUNLQUdFX09QVEVFX0NMSUVOVF9DVVNUT01fVEFSQkFMTAogCi0tIAoyLjQ1LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
