Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FE2C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 15:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F247941798;
	Sun, 17 Jul 2022 15:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F247941798
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_SfEM8O9qcO; Sun, 17 Jul 2022 15:34:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C9D241774;
	Sun, 17 Jul 2022 15:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C9D241774
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F354D1BF5A7
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 15:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4CC24047D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 15:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4CC24047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpzaPO-tqpmN for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 15:34:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CCC940002
Received: from smtp-outgoing-1801.laposte.net (smtp-outgoing-1801.laposte.net
 [160.92.124.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CCC940002
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 15:34:39 +0000 (UTC)
X-mail-filterd: {"version":"1.4.3", "queueID":"4Lm8KR0FgwzjWvW",
 "contextId":"f959e564-d972-49c9-9b00-7d08a8b57246"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0116.laposte.net (SMTP Server) with ESMTP id 4Lm8KR0FgwzjWvW;
 Sun, 17 Jul 2022 17:34:35 +0200 (CEST)
X-mail-filterd: {"version":"1.4.3", "queueID":"4Lm8KQ6NMYzjWvm",
 "contextId":"453b5630-d32f-4822-9a68-f1208916e08d"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 50
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (unknown [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0116.laposte.net (SMTP Server) with ESMTPSA id 4Lm8KQ6NMYzjWvm;
 Sun, 17 Jul 2022 17:34:34 +0200 (CEST)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
 by romuald.bergerie (Postfix) with ESMTP id 63DBC4BB067C;
 Sun, 17 Jul 2022 17:34:34 +0200 (CEST)
Received: from vincent by radicelle.bergerie with local (Exim 4.96)
 (envelope-from <vincent@radicelle.bergerie>) id 1oD6Hs-0001VM-0D;
 Sun, 17 Jul 2022 17:34:28 +0200
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 17:34:22 +0200
Message-Id: <20220717153422.5779-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=laposte.net; s=lpn-wlmd; t=1658072077;
 bh=9mTslRQgwQMcMQZuW+3W70T9yuhitXGCiGoSi6vLPdc=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=RESEBZNwofSobsiE03HYK13SXVwys5DDZG/pBiSg32qjMS802q1Ir4Ea+mJxCzDMjcWOiaIJ165Uar5jKtWK4QczVEPRv2C4T7WIY4ctPKPtg2FzZr6dbHlfAVsGB1YygFb+vg4iBiVbOuqdxt/HqdWHQ4eUAHIzSY57sMp3BIodLoAuj1ykD+jxgZbdR/TBaKvZjkmL04FiB6BRPqd5AbL4yJQVrXgmj0P3rhZlUr/4lXflF5hXZnORXxnP+2ScgKBjj9ehMBCDChNKby8ekedrbE0jhb7uF7Wy7VBIEgRxeyARjvLw/kAfcxSEekpwN3KN2HsGrhm3ciQHd3zRrg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net
 header.a=rsa-sha256 header.s=lpn-wlmd header.b=RESEBZNw
Subject: [Buildroot] [PATCH] support/testing: add test for bzip2
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

QWRkIGEgc2ltcGxlIGNvbXByZXNzLXVuY29tcHJlc3MgdGVzdCB0byB2ZXJpZnkgdGhhdCBiemlw
MiBpcyB3b3JraW5nLgoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0
ZWhsZUBsYXBvc3RlLm5ldD4KLS0tCgoKSGksCgpJIGhhdmUgdmVyaWZpZWQgdGhhdCB0aGlzIHRl
c3Qgd29ya3MgYm90aCBsb2NhbGx5IGFuZCBvbiBnaXRsYWIuCgpCZXN0IHJlZ2FyZHMsClZpbmNl
bnQuCgoKIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAr
CiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2J6aXAyLnB5IHwgNDEgKysrKysr
KysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2J6aXAyLnB5
CgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggNWMzYzI0ZmY3YS4u
YzQwMGQxZTJjZiAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0y
OTE5LDYgKzI5MTksNyBAQCBGOglwYWNrYWdlL2k3ei8KIEY6CXBhY2thZ2UvbXNyLXRvb2xzLwog
RjoJcGFja2FnZS9waXh6LwogRjoJcGFja2FnZS96ZXJvZnJlZS8KK0Y6CXN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfYnppcDIucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfbXNyX3Rvb2xzKgogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9waXh6LnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3plcm9m
cmVlLnB5CmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2J6
aXAyLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9iemlwMi5weQpuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi45MjU5NGZjMWZjCi0tLSAvZGV2L251
bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9iemlwMi5weQpAQCAt
MCwwICsxLDQxIEBACitpbXBvcnQgb3MKKworaW1wb3J0IGluZnJhLmJhc2V0ZXN0CisKKworY2xh
c3MgVGVzdEJ6aXAyKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6CisgICAgY29uZmlnID0gaW5mcmEu
YmFzZXRlc3QuQkFTSUNfVE9PTENIQUlOX0NPTkZJRyArIFwKKyAgICAgICAgIiIiCisgICAgICAg
IEJSMl9QQUNLQUdFX0JaSVAyPXkKKyAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15Cisg
ICAgICAgICMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKKyAgICAgICAgIiIiCisK
KyAgICBkZWYgdGVzdF9ydW4oc2VsZik6CisgICAgICAgIGNwaW9fZmlsZSA9IG9zLnBhdGguam9p
bihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJvb3Rmcy5jcGlvIikKKyAgICAgICAgc2VsZi5l
bXVsYXRvci5ib290KGFyY2g9ImFybXY1IiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGtl
cm5lbD0iYnVpbHRpbiIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRpb25zPVsiLWlu
aXRyZCIsIGNwaW9fZmlsZV0pCisgICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQorCisgICAg
ICAgICMgUHJlcGFyZSBpbnB1dCBmaWxlIHdpdGggcmFuZG9tIGRhdGEgYW5kIHplcm9lcy4KKyAg
ICAgICAgIyBXZSBrZWVwIHRoZSBzaXplIHNtYWxsICg0IE1CKSBmb3IgdGhlIHNha2Ugb2YgdGVz
dCB0aW1lLgorICAgICAgICBjbWQgPSAiZGQgaWY9L2Rldi91cmFuZG9tIG9mPW9yaWcgYnM9MU0g
Y291bnQ9MiAmJiAiIFwKKyAgICAgICAgICAgICAgImRkIGlmPS9kZXYvemVybyBvZj1vcmlnIGJz
PTFNIGNvdW50PTIgc2Vlaz0yIgorICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCkKKworICAg
ICAgICAjIENvbXByZXNzLgorICAgICAgICBjbWQgPSAiY3AgLXYgb3JpZyBjb21wcmVzc2VkICYm
IGJ6aXAyIC12IGNvbXByZXNzZWQiCisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soY21kLCB0aW1l
b3V0PTYwKQorCisgICAgICAgICMgVGVzdC4KKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygiYnpp
cDIgLXR2IGNvbXByZXNzZWQuYnoyIikKKworICAgICAgICAjIFVuY29tcHJlc3MuCisgICAgICAg
IGNtZCA9ICJjcCAtdiBjb21wcmVzc2VkLmJ6MiB1bmNvbXByZXNzZWQuYnoyICYmICIgXAorICAg
ICAgICAgICAgICAiYnVuemlwMiAtdiB1bmNvbXByZXNzZWQuYnoyIgorICAgICAgICBzZWxmLmFz
c2VydFJ1bk9rKGNtZCkKKworICAgICAgICAjIFZlcmlmeS4KKyAgICAgICAgIyBUaGUgbHMgaXMg
dGhlcmUgZm9yIGRlYnVnZ2luZy4KKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygibHMgLWwgJiYg
Y21wIG9yaWcgdW5jb21wcmVzc2VkIikKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
