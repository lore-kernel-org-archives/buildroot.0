Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9ACC43334
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 17:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D5F9409E7;
	Wed, 13 Jul 2022 17:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D5F9409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S4u-z0WkpLIJ; Wed, 13 Jul 2022 17:20:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53693405D1;
	Wed, 13 Jul 2022 17:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53693405D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 197711BF3DD
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 17:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8CD18414E
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 17:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8CD18414E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UsrigiMC-LJX for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 17:20:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E538184144
Received: from smtp-outgoing-1902.laposte.net (smtp-outgoing-1902.laposte.net
 [160.92.124.106])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E538184144
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 17:20:29 +0000 (UTC)
X-mail-filterd: {"version":"1.4.3", "queueID":"4LjksL4pQlzPjdF",
 "contextId":"46a0cf5f-f1a3-4e12-9b3a-402ece8e7177"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0117.laposte.net (SMTP Server) with ESMTP id 4LjksL4pQlzPjdF;
 Wed, 13 Jul 2022 19:20:22 +0200 (CEST)
X-mail-filterd: {"version":"1.4.3", "queueID":"4LjksL43GyzPjd8",
 "contextId":"6b18385f-d115-45da-8eb2-094e6eabe142"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 50
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (unknown [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0117.laposte.net (SMTP Server) with ESMTPSA id 4LjksL43GyzPjd8;
 Wed, 13 Jul 2022 19:20:22 +0200 (CEST)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
 by romuald.bergerie (Postfix) with ESMTP id 3D9BC4B95FB7;
 Wed, 13 Jul 2022 19:20:22 +0200 (CEST)
Received: from vincent by radicelle.bergerie with local (Exim 4.96)
 (envelope-from <vincent@radicelle.bergerie>) id 1oBg24-0006s8-2h;
 Wed, 13 Jul 2022 19:20:16 +0200
To: buildroot@buildroot.org
Date: Wed, 13 Jul 2022 19:20:06 +0200
Message-Id: <20220713172006.26411-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=laposte.net; s=lpn-wlmd; t=1657732827;
 bh=G53gTFfYfz4XgHH6n7/FjxVq7qsFVUeLwWkM2z0TJg0=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=mME+uOmB5/bk0oSo+fMg3+HfyEa6tXTMrWEKOI412M7JK185v26mdYt8b62X51gWosg0ufNo20M0zihFOXDhjYJNmGwsG6eh/Wrhcsic9nMrVfIN3UL32nkYNunoAyx0pt+GUM6cWqsx2F1byWg/psXSTG6TelI8uZqp6XoYahtXHo462YrkIdrn9iExMKoy1IkJ0q6d3ARzRosEFn2HrbivfcbDg5v9SjCdPW35rTtPwQyRGT0xsKw+t8j7jMMuoY2vdJwkkdNv60zg/DuaN4YvQIkSQCey+aJhG/mtaKf70W7XJYso2xCnMfpBZFUG9j2Ip3OVRqs7ofJpoQXkdQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net
 header.a=rsa-sha256 header.s=lpn-wlmd header.b=mME+uOmB
Subject: [Buildroot] [PATCH] support/testing: add test for pixz
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgc2ltcGxlIGNvbXByZXNzLXVuY29tcHJlc3MgdGVzdCB0byB2ZXJpZnkgdGhhdCBwaXh6
IGlzIHdvcmtpbmcuCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3Rl
aGxlQGxhcG9zdGUubmV0PgotLS0KCgpIaSwKCkkgaGF2ZSB2ZXJpZmllZCB0aGF0IHRoaXMgdGVz
dCB3b3JrcyBmaW5lIGxvY2FsbHkgYW5kIG9uIGdpdGxhYi4KQmVzdCByZWdhcmRzLAoKVmluY2Vu
dC4KCgogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwog
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9waXh6LnB5IHwgNDAgKysrKysrKysr
KysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9waXh6LnB5Cgpk
aWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggMGFmZDY5N2I2Yy4uOWE3
NDBkNjUwZCAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0yOTE3
LDYgKzI5MTcsNyBAQCBGOgljb25maWdzL3Vldm01NDMyX2RlZmNvbmZpZwogRjoJcGFja2FnZS9p
N3ovCiBGOglwYWNrYWdlL21zci10b29scy8KIEY6CXBhY2thZ2UvcGl4ei8KK0Y6CXN1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcGl4ei5weQogCiBOOglWaW5pY2l1cyBUaW50aSA8
dmluaWNpdXN0aW50aUBnbWFpbC5jb20+CiBGOglwYWNrYWdlL3B5dGhvbi10aHJpZnQvCmRpZmYg
LS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3BpeHoucHkgYi9zdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3BpeHoucHkKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMC4uZWVmZjEwZWFhMQotLS0gL2Rldi9udWxsCisrKyBiL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcGl4ei5weQpAQCAtMCwwICsxLDQwIEBACitp
bXBvcnQgb3MKKworaW1wb3J0IGluZnJhLmJhc2V0ZXN0CisKKworY2xhc3MgVGVzdFBpeHooaW5m
cmEuYmFzZXRlc3QuQlJUZXN0KToKKyAgICBjb25maWcgPSBpbmZyYS5iYXNldGVzdC5CQVNJQ19U
T09MQ0hBSU5fQ09ORklHICsgXAorICAgICAgICAiIiIKKyAgICAgICAgQlIyX1BBQ0tBR0VfUElY
Wj15CisgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQorICAgICAgICAjIEJSMl9UQVJH
RVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CisgICAgICAgICIiIgorCisgICAgZGVmIHRlc3RfcnVu
KHNlbGYpOgorICAgICAgICBjcGlvX2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwg
ImltYWdlcyIsICJyb290ZnMuY3BpbyIpCisgICAgICAgIHNlbGYuZW11bGF0b3IuYm9vdChhcmNo
PSJhcm12NSIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBrZXJuZWw9ImJ1aWx0aW4iLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucz1bIi1pbml0cmQiLCBjcGlvX2ZpbGVd
KQorICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkKKworICAgICAgICAjIFByZXBhcmUgaW5w
dXQgZmlsZSB3aXRoIHJhbmRvbSBkYXRhIGFuZCB6ZXJvZXMuCisgICAgICAgICMgV2Uga2VlcCB0
aGUgc2l6ZSBzbWFsbCAoNCBNQikgZm9yIHRoZSBzYWtlIG9mIHRlc3QgdGltZS4KKyAgICAgICAg
Y21kID0gImRkIGlmPS9kZXYvdXJhbmRvbSBvZj1vcmlnIGJzPTFNIGNvdW50PTIgJiYgIiBcCisg
ICAgICAgICAgICAgICJkZCBpZj0vZGV2L3plcm8gb2Y9b3JpZyBicz0xTSBjb3VudD0yIHNlZWs9
MiIKKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PayhjbWQpCisKKyAgICAgICAgIyBDb21wcmVzcy4K
KyAgICAgICAgIyBXZSBhc2sgZm9yIDMgdGhyZWFkcyBmb3IgZ29vZCBtZWFzdXJlIGJ1dCB3aXRo
IGEgdmVyeSBzbWFsbCBmaWxlIG9uIGEKKyAgICAgICAgIyB1bmlwcm9jZXNzb3IgcWVtdSB0aGlz
IGlzIG9ubHkgYSBsaWdodCB2YWxpZGF0aW9uLgorICAgICAgICBjbWQgPSAiY3AgLXYgb3JpZyBj
b21wcmVzc2VkICYmIHBpeHogLXAgMyBjb21wcmVzc2VkIgorICAgICAgICBzZWxmLmFzc2VydFJ1
bk9rKGNtZCwgdGltZW91dD02MCkKKworICAgICAgICAjIFVuY29tcHJlc3MuCisgICAgICAgIGNt
ZCA9ICJjcCAtdiBjb21wcmVzc2VkLnh6IHVuY29tcHJlc3NlZC54eiAmJiBwaXh6IC1kIHVuY29t
cHJlc3NlZC54eiIKKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PayhjbWQpCisKKyAgICAgICAgIyBW
ZXJpZnkuCisgICAgICAgICMgVGhlIGxzIGlzIHRoZXJlIGZvciBkZWJ1Z2dpbmcuCisgICAgICAg
IGNtZCA9ICJscyAtbCAmJiBjbXAgb3JpZyB1bmNvbXByZXNzZWQiCisgICAgICAgIHNlbGYuYXNz
ZXJ0UnVuT2soY21kKQotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
