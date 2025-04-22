Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A129AC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 08:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5207260D4E;
	Tue, 22 Apr 2025 08:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ekPGS8QLzq9; Tue, 22 Apr 2025 08:59:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88DCD60C12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88DCD60C12;
	Tue, 22 Apr 2025 08:59:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D70221A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCE7781A81
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbm1Rn7ODroO for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 08:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0F0181A30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0F0181A30
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0F0181A30
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:59:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE2DF152B;
 Tue, 22 Apr 2025 01:59:46 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.17.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 843A93F5A1;
 Tue, 22 Apr 2025 01:59:50 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Dick Olsson <hi@senzilla.io>, Julien Olivain <ju.o@free.fr>
Date: Tue, 22 Apr 2025 10:59:47 +0200
Message-ID: <20250422085947.687912-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] support/testing: test_edk2: add macchiatobin
 build test
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

QWRkIGFuIEVESyBJSSBidWlsZCB0ZXN0IGZvciB0aGUgTUFDQ0hJQVRPYmluIHBsYXRmb3JtLgoK
U2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgpD
YzogRGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlvPgpDYzogSnVsaWVuIE9saXZhaW4gPGp1Lm9A
ZnJlZS5mcj4KLS0tCgpIaSwKCk5vdyBpcyBhIGdvb2QgdGltZSB0byBhZGQgdGhpcyBidWlsZCB0
ZXN0LCBhZnRlciBjb21taXQgWzFdIGFuZCB0byBhIGxlc3NlcgpleHRlbmQgY29tbWl0IFsyXSwg
d2hpY2ggaGF2ZSBmaXhlZCB0aGUgYnVpbGQgZm9yIHRoaXMgY29uZmlndXJhdGlvbi4KCkJlc3Qg
cmVnYXJkcywKVmluY2VudC4KClsxXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9i
dWlsZHJvb3QvLS9jb21taXQvZmQwMmFkZDIxYjRkNzlmMWRjN2FjMDNjNmE4MDQ4NThkZTE1Nzc0
YgpbMl0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0
LzczNjFhMTU1ZWY0MjBhNThlYmUxZjhmMzYwYjE0MWE5MjZiNmQ4YjIKCgogc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL2Jvb3QvdGVzdF9lZGsyLnB5IHwgMTggKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9ib290L3Rlc3RfZWRrMi5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9ib290L3Rl
c3RfZWRrMi5weQppbmRleCA0ZTA5NDJiM2E0Li4xOWM2ZDljNDgyIDEwMDY0NAotLS0gYS9zdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2VkazIucHkKKysrIGIvc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL2Jvb3QvdGVzdF9lZGsyLnB5CkBAIC0xNDksMyArMTQ5LDIxIEBAIGNsYXNzIFRlc3RF
ZGsyQnVpbGRRZW11U2JzYShUZXN0RWRrMkJ1aWxkQmFzZSk6CiAKICAgICBkZWYgdGVzdF9ydW4o
c2VsZikgLT4gTm9uZToKICAgICAgICAgc2VsZi5hc3NlcnRCaW5hcmllc0V4aXN0KCJTQlNBX0ZM
QVNIMC5mZCIsICJTQlNBX0ZMQVNIMS5mZCIsICJmaXAuYmluIikKKworCitjbGFzcyBUZXN0RWRr
MkJ1aWxkU29saWRydW5Bcm1hZGE4MHgwbWNiaW4oVGVzdEVkazJCdWlsZEJhc2UpOgorICAgIGNv
bmZpZyA9IFRlc3RFZGsyQnVpbGRCYXNlLmJhc2VfY29uZmlnICsgXAorICAgICAgICAiIiIKKyAg
ICAgICAgQlIyX2FhcmNoNjQ9eQorICAgICAgICBCUjJfY29ydGV4X2E3Mj15CisgICAgICAgIEJS
Ml9UQVJHRVRfRURLMl9QTEFURk9STV9TT0xJRFJVTl9BUk1BREE4MFgwTUNCSU49eQorICAgICAg
ICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFPXkKKyAgICAgICAgQlIyX1RBUkdFVF9B
Uk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0iYTgweDBfbWNiaW4iCisgICAgICAgIEJSMl9U
QVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfRURLMl9BU19CTDMzPXkKKyAgICAgICAgQlIyX1RB
UkdFVF9CSU5BUklFU19NQVJWRUxMPXkKKyAgICAgICAgQlIyX1RBUkdFVF9NVl9ERFJfTUFSVkVM
TD15CisgICAgICAgICIiIgorCisgICAgZGVmIHRlc3RfcnVuKHNlbGYpIC0+IE5vbmU6CisgICAg
ICAgIHNlbGYuYXNzZXJ0QmluYXJpZXNFeGlzdCgiQVJNQURBX0VGSS5mZCIsICJmaXAuYmluIiwg
ImJsZS5iaW4iLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInNjcC1mdy5iaW4i
KQotLSAKMi40Ny4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
