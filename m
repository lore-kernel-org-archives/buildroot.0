Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0916AE77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 09:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9648140332;
	Sun, 12 Jan 2025 09:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmrpjD1j8Vpl; Sun, 12 Jan 2025 09:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E41C403A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E41C403A8;
	Sun, 12 Jan 2025 09:23:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A0E6940
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 09:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 089E54013C
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 09:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id US1uX3yP_t2X for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 09:23:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7546E40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7546E40137
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7546E40137
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 09:23:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FB98E0002;
 Sun, 12 Jan 2025 09:23:24 +0000 (UTC)
Date: Sun, 12 Jan 2025 10:23:13 +0100
MIME-Version: 1.0
Message-Id: <20250112-fix_musepack-v1-1-bb966b22d9ef@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAACKg2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0ND3bTMivjc0uLUgsTkbF2L1DTzxCTLtBRTMxMloJaColSgPNi46Nj
 aWgAfxRLUXgAAAA==
X-Change-ID: 20250111-fix_musepack-8ef7ab9fd564
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736673805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LiC+DxS0Dxd07EvlEEndLFD4fURagSlPRJH5VZSKzyc=;
 b=lnb3Vpw89FmCkFU8M7A6teFgwOLggHG+D/R0K0DkGEJeMDDaUIgz/ncrH1xxN0eq/F4+wf
 I71zC0z9/azzpknYWtP4OdtXa1VMfj4Jv/QOzVki48kA3byw8Wq2Z3Z9xHR+6hFqxx3GWY
 LedaOLvdUfMh/oTGJNKJLUeGsJ4/bHvvU1QaztpZ7xxQZK56pxVdUnciTgldZAN7WY7+ca
 Jv0Y0ayQUWa1grDG8Vg3Gziu484TcdT9ed/F020/I1VPCnfUK/gW/8jButpX0F+hmaKuOc
 S9DDSdIJu+tZXR6lIn59YTE0dPfjjqa/1fX1KzKgmnTXOf9fLOecO3+ABr6bNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lnb3Vpw8
Subject: [Buildroot] [PATCH] package/musepack: fix incompatible pointer types
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXMgb2YgR0NDMTQsIEdDQyBubyBsb25nZXIgYWxsb3dzIGltcGxpY2l0bHkgY2FzdGluZyBhbGwg
cG9pbnRlciB0eXBlcwp0byBhbGwgb3RoZXIgcG9pbnRlciB0eXBlcy4KCldlIGNhbiBmaXggdGhp
cyBlcnJvciwgYnkgYWRkaW5nIHRoZSBhcHByb3ByaWF0ZSBjYXN0LgpUaGlzIHBhdGNoIGlzIGEg
cG9ydCBvZiBhIEdlbnRvbyBwYXRjaC4KCkxpbms6IGh0dHBzOi8vZ2l0d2ViLmdlbnRvby5vcmcv
cmVwby9nZW50b28uZ2l0L3RyZWUvbWVkaWEtc291bmQvbXVzZXBhY2stdG9vbHMvZmlsZXMvbXVz
ZXBhY2stdG9vbHMtNDk1LWluY29tcGF0aWJsZS1wb2ludGVycy5wYXRjaAoKRml4ZXM6CgogICAg
aHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzY0MTJmYzM3ZDUzM2RmZjI3
ZjE4YjA5YzY2ODg3MGJlYmZmMmJlYzUvCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgQm9ubmVmaWxs
ZSA8dGhvbWFzLmJvbm5lZmlsbGVAYm9vdGxpbi5jb20+Ci0tLQogcGFja2FnZS9tdXNlcGFjay8w
MDA2LWluY29tcGF0aWJsZS1wb2ludGVycy5wYXRjaCB8IDQ3ICsrKysrKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbXVzZXBhY2svMDAwNi1pbmNvbXBhdGlibGUtcG9pbnRlcnMucGF0Y2ggYi9wYWNrYWdlL211
c2VwYWNrLzAwMDYtaW5jb21wYXRpYmxlLXBvaW50ZXJzLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjdmYjFi
OGZhMjM3ZGMyY2RjMjFhMWNlMGVlODYyMzQ5MjBiOGM4ZGIKLS0tIC9kZXYvbnVsbAorKysgYi9w
YWNrYWdlL211c2VwYWNrLzAwMDYtaW5jb21wYXRpYmxlLXBvaW50ZXJzLnBhdGNoCkBAIC0wLDAg
KzEsNDcgQEAKK0ZpeGVkIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGVzCisKK1RoaXMgaXMgZHVl
IHRvIEdDQzE0IHRoYXQgbm8gbG9uZ2VyIGFsbG93cyBpbXBsaWNpdGx5IGNhc3RpbmcgYWxsIHBv
aW50ZXIgdHlwZXMKK3RvIGFsbCBvdGhlciBwb2ludGVyIHR5cGVzLiBSZXN1bHRpbmcgaW4gZXJy
b3Igc3VjaCBhcyA6CisKK291dHB1dC9idWlsZC9tdXNlcGFjay00NzUvbGlibXBjcHN5L2Fucy5j
OjI5MToxMjA6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDEwIG9mIOKAmEZpbmRPcHRpbWFsQU5T
4oCZIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdpbmNvbXBhdGlibGUtcG9pbnRl
ci10eXBlc10KKyAgMjkxIHwgTCwgQU5Tc3BlY19NLCBtLT5OU19PcmRlcl9MLCBtLT5TTlJfY29t
cF9MLCBtLT5GSVJfTCwgc21yLkwsIHNtci5NLCBtLT5TQ0ZfSW5kZXhfTCwgVHJhbnNpZW50ICk7
CisgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfl5+fn5+fn5+fn5+fn4KKyAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fAorICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgKgorCitQYXRjaCBkb3dubG9hZGVkIGZyb20gR2Vu
dG9vOgoraHR0cHM6Ly9naXR3ZWIuZ2VudG9vLm9yZy9yZXBvL2dlbnRvby5naXQvdHJlZS9tZWRp
YS1zb3VuZC9tdXNlcGFjay10b29scy9maWxlcy9tdXNlcGFjay10b29scy00OTUtaW5jb21wYXRp
YmxlLXBvaW50ZXJzLnBhdGNoCisKK1NpZ25lZC1vZmYtYnk6IFRob21hcyBCb25uZWZpbGxlIDx0
aG9tYXMuYm9ubmVmaWxsZUBib290bGluLmNvbT4KK1Vwc3RyZWFtOiBOL0Egbm8gU0NNLCBub3Qg
YWN0aXZlIGFueW1vcmUKKworLS0tIG11c2VwYWNrLXRvb2xzLTQ5NS9saWJtcGNwc3kvYW5zLmMK
KysrKyBtdXNlcGFjay10b29scy00OTUtZml4ZWQvbGlibXBjcHN5L2Fucy5jCitAQCAtMjg3LDEy
ICsyODcsMTIgQEAKKyAgICAgLy8gZm9yIEwgb3IgTSwgcmVzcGVjdGl2ZWx5CisgICAgIG1lbXNl
dCAoIG0tPkZJUl9MLCAgICAgIDAsIHNpemVvZiBtLT5GSVJfTCAgICAgICk7ICAgICAgICAgLy8g
cmVzZXQgRklSCisgICAgIG1lbXNldCAoIG0tPk5TX09yZGVyX0wsIDAsIHNpemVvZiBtLT5OU19P
cmRlcl9MICk7ICAgICAgICAgLy8gcmVzZXQgRmxhZ3MKKy0JRmluZE9wdGltYWxBTlMgKCBNYXhC
YW5kLCBNU2ZsYWcsIEFOU3NwZWNfTCwgQU5Tc3BlY19NLCBtLT5OU19PcmRlcl9MLCBtLT5TTlJf
Y29tcF9MLCBtLT5GSVJfTCwgc21yLkwsIHNtci5NLCBtLT5TQ0ZfSW5kZXhfTCwgVHJhbnNpZW50
ICk7CisrCUZpbmRPcHRpbWFsQU5TICggTWF4QmFuZCwgTVNmbGFnLCBBTlNzcGVjX0wsIEFOU3Nw
ZWNfTSwgbS0+TlNfT3JkZXJfTCwgbS0+U05SX2NvbXBfTCwgbS0+RklSX0wsIHNtci5MLCBzbXIu
TSwgKGNvbnN0IHZvaWQqKW0tPlNDRl9JbmRleF9MLCBUcmFuc2llbnQgKTsKKyAKKyAgICAgLy8g
Zm9yIFIgb3IgUywgcmVzcGVjdGl2ZWx5CisgCW1lbXNldCAoIG0tPkZJUl9SLCAgICAgIDAsIHNp
emVvZiBtLT5GSVJfUiAgICAgICk7ICAgICAgICAgLy8gcmVzZXQgRklSCisgCW1lbXNldCAoIG0t
Pk5TX09yZGVyX1IsIDAsIHNpemVvZiBtLT5OU19PcmRlcl9SICk7ICAgICAgICAgLy8gcmVzZXQg
RmxhZ3MKKy0JRmluZE9wdGltYWxBTlMgKCBNYXhCYW5kLCBNU2ZsYWcsIEFOU3NwZWNfUiwgQU5T
c3BlY19TLCBtLT5OU19PcmRlcl9SLCBtLT5TTlJfY29tcF9SLCBtLT5GSVJfUiwgc21yLlIsIHNt
ci5TLCBtLT5TQ0ZfSW5kZXhfUiwgVHJhbnNpZW50ICk7CisrCUZpbmRPcHRpbWFsQU5TICggTWF4
QmFuZCwgTVNmbGFnLCBBTlNzcGVjX1IsIEFOU3NwZWNfUywgbS0+TlNfT3JkZXJfUiwgbS0+U05S
X2NvbXBfUiwgbS0+RklSX1IsIHNtci5SLCBzbXIuUywgKGNvbnN0IHZvaWQqKW0tPlNDRl9JbmRl
eF9SLCBUcmFuc2llbnQgKTsKKyAKKyAgICAgcmV0dXJuOworIH0KKy0tLSBtdXNlcGFjay10b29s
cy00OTUvbXBjZW5jL21wY2VuYy5oCisrKysgbXVzZXBhY2stdG9vbHMtNDk1LWZpeGVkL21wY2Vu
Yy9tcGNlbmMuaAorQEAgLTI0MSw4ICsyNDEsOCBAQAorIAorIGZsb2F0ICBJU05SX1NjaGFldHpl
ciAgICAgICAgICAgICAgICAgICggY29uc3QgZmxvYXQqIHNhbXBsZXMsIGNvbnN0IGZsb2F0IGNv
bXAsIGNvbnN0IGludCByZXMpOworIGZsb2F0ICBJU05SX1NjaGFldHplcl9UcmFucyAgICAgICAg
ICAgICggY29uc3QgZmxvYXQqIHNhbXBsZXMsIGNvbnN0IGZsb2F0IGNvbXAsIGNvbnN0IGludCBy
ZXMpOworLXZvaWQgICBRdWFudGl6ZVN1YmJhbmQgICAgICAgICAgICAgICAgICggdW5zaWduZWQg
aW50KiBxdV9vdXRwdXQsIGNvbnN0IGZsb2F0KiBpbnB1dCwgY29uc3QgaW50IHJlcywgZmxvYXQq
IGVycm9ycywgY29uc3QgaW50IG1heE5zT3JkZXIgKTsKKy12b2lkICAgUXVhbnRpemVTdWJiYW5k
V2l0aE5vaXNlU2hhcGluZyAoIHVuc2lnbmVkIGludCogcXVfb3V0cHV0LCBjb25zdCBmbG9hdCog
aW5wdXQsIGNvbnN0IGludCByZXMsIGZsb2F0KiBlcnJvcnMsIGNvbnN0IGZsb2F0KiBGSVIgKTsK
Kyt2b2lkICAgUXVhbnRpemVTdWJiYW5kICAgICAgICAgICAgICAgICAoIG1wY19pbnQxNl90KiBx
dV9vdXRwdXQsIGNvbnN0IGZsb2F0KiBpbnB1dCwgY29uc3QgaW50IHJlcywgZmxvYXQqIGVycm9y
cywgY29uc3QgaW50IG1heE5zT3JkZXIgKTsKKyt2b2lkICAgUXVhbnRpemVTdWJiYW5kV2l0aE5v
aXNlU2hhcGluZyAoIG1wY19pbnQxNl90KiBxdV9vdXRwdXQsIGNvbnN0IGZsb2F0KiBpbnB1dCwg
Y29uc3QgaW50IHJlcywgZmxvYXQqIGVycm9ycywgY29uc3QgZmxvYXQqIEZJUiApOworIAorIHZv
aWQgICBOb2lzZUluamVjdGlvbkNvbXAgKCB2b2lkICk7CisgCgotLS0KYmFzZS1jb21taXQ6IGEz
MjBkYmQ5NmQwOGRjNWJjMjg2MTQ5MTViYzY2NGY4MWViMGZiYTAKY2hhbmdlLWlkOiAyMDI1MDEx
MS1maXhfbXVzZXBhY2stOGVmN2FiOWZkNTY0CgpCZXN0IHJlZ2FyZHMsCi0tIApUaG9tYXMgQm9u
bmVmaWxsZSA8dGhvbWFzLmJvbm5lZmlsbGVAYm9vdGxpbi5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
