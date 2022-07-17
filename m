Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF7CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 14:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59FDD60B2F;
	Sun, 17 Jul 2022 14:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59FDD60B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDP-jDrlxG18; Sun, 17 Jul 2022 14:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F2B9606EC;
	Sun, 17 Jul 2022 14:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F2B9606EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 529531BF281
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 14:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 350B282983
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 14:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 350B282983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_J56Eqs8p8u for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 14:45:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EFDF82605
Received: from smtp-outgoing-2003.laposte.net (smtp-outgoing-2003.laposte.net
 [160.92.124.110])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EFDF82605
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 14:45:07 +0000 (UTC)
X-mail-filterd: {"version":"1.4.3", "queueID":"4Lm7DD5mxVz1spV6",
 "contextId":"5d336687-2239-42df-b051-ccdf20d0bbd1"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0111.laposte.net (SMTP Server) with ESMTP id 4Lm7DD5mxVz1spV6;
 Sun, 17 Jul 2022 16:45:00 +0200 (CEST)
X-mail-filterd: {"version":"1.4.3", "queueID":"4Lm7DD4ZzPz1spTs",
 "contextId":"a95508a5-33e7-4c27-bb6b-4ffac63488d2"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 46
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (unknown [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0111.laposte.net (SMTP Server) with ESMTPSA id 4Lm7DD4ZzPz1spTs;
 Sun, 17 Jul 2022 16:45:00 +0200 (CEST)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
 by romuald.bergerie (Postfix) with ESMTP id 580D84BB02CF;
 Sun, 17 Jul 2022 16:45:00 +0200 (CEST)
Received: from vincent by radicelle.bergerie with local (Exim 4.96)
 (envelope-from <vincent@radicelle.bergerie>) id 1oD5Vu-0006Mx-07;
 Sun, 17 Jul 2022 16:44:54 +0200
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 16:44:41 +0200
Message-Id: <20220717144441.24477-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=laposte.net; s=lpn-wlmd; t=1658069105;
 bh=133ELLkYtIfjLyUbFIpv3gEc0yhXYgz3QnVB4aE7Pes=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=fZTKmqoalCnf2gWFieiICspqM2ppDCtFXptOZp61mO7RnaRYDAegCQzZ3i6JZn16PZPhdnc6z0rf6oAfGsbNLRxL4g8NzGf5QlLD6+Ox8CheC5FB7lMyexVY/cvpi1jbMJhYJKrEOp05Lq2xwxhUzsgDatycIsWOygBEmB7popVs8ZfTSXJyFXLm8HN9rOLzrrXkmviVRtL2xryDRpjbyDBI/APnYJN6WOs2jTOUbuaOXHdA7HsK48UcDPD0GzsI4sCAmjkikTDtrsHuj7ZB/u5BhFWdhtKyY6QdCyFwja+2mZUZf0QeKYNH9N2KvtS4+gl8FRiVSeXQH0PAIe64/g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net
 header.a=rsa-sha256 header.s=lpn-wlmd header.b=fZTKmqoa
Subject: [Buildroot] [PATCH] support/testing: add test for lzop
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

QWRkIGEgc2ltcGxlIGNvbXByZXNzLXVuY29tcHJlc3MgdGVzdCB0byB2ZXJpZnkgdGhhdCBsem9w
IGlzIHdvcmtpbmcuCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3Rl
aGxlQGxhcG9zdGUubmV0PgpDYzogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29t
PgotLS0KCgpIaSwKCkkgaGF2ZSB2ZXJpZmllZCB0aGF0IHRoaXMgdGVzdCB3b3JrcyBmaW5lIGxv
Y2FsbHkgYW5kIG9uIGdpdGxhYi4KClBldGVyLCBwbGVhc2UgZG8gbm90IGhlc2l0YXRlIHRvIGxl
dCBtZSBrbm93IGFib3V0IGFueSBmZWVkYmFjaywgYW5kIGlmIHRoaXMKdGVzdCBzaG91bGQgYmUg
YXNzaWduZWQgdG8geW91IGluIERFVkVMT1BFUlMgaW5zdGVhZC4gSSBhbSBhZGRpbmcgbXlzZWxm
IGJ5CmRlZmF1bHQgdG8gbWFrZSBzdXJlIHRoZSB0ZXN0IGlzIG5vdCBvcnBoYW5lZC4KCkJlc3Qg
cmVnYXJkcywKVmluY2VudC4KCgogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEgKwogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9sem9wLnB5
IHwgMzggKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9sem9wLnB5CgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXgg
NWMzYzI0ZmY3YS4uNjQ0NzExYzVmNCAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZF
TE9QRVJTCkBAIC0yOTE5LDYgKzI5MTksNyBAQCBGOglwYWNrYWdlL2k3ei8KIEY6CXBhY2thZ2Uv
bXNyLXRvb2xzLwogRjoJcGFja2FnZS9waXh6LwogRjoJcGFja2FnZS96ZXJvZnJlZS8KK0Y6CXN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbHpvcC5weQogRjoJc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9tc3JfdG9vbHMqCiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X3BpeHoucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfemVyb2ZyZWUucHkKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3Rlc3RfbHpvcC5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbHpv
cC5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5iNTQ3OWEyNWQ1Ci0t
LSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9sem9w
LnB5CkBAIC0wLDAgKzEsMzggQEAKK2ltcG9ydCBvcworCitpbXBvcnQgaW5mcmEuYmFzZXRlc3QK
KworCitjbGFzcyBUZXN0THpvcChpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgorICAgIGNvbmZpZyA9
IGluZnJhLmJhc2V0ZXN0LkJBU0lDX1RPT0xDSEFJTl9DT05GSUcgKyBcCisgICAgICAgICIiIgor
ICAgICAgICBCUjJfUEFDS0FHRV9MWk9QPXkKKyAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJ
Tz15CisgICAgICAgICMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKKyAgICAgICAg
IiIiCisKKyAgICBkZWYgdGVzdF9ydW4oc2VsZik6CisgICAgICAgIGNwaW9fZmlsZSA9IG9zLnBh
dGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJvb3Rmcy5jcGlvIikKKyAgICAgICAg
c2VsZi5lbXVsYXRvci5ib290KGFyY2g9ImFybXY1IiwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGtlcm5lbD0iYnVpbHRpbiIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRpb25z
PVsiLWluaXRyZCIsIGNwaW9fZmlsZV0pCisgICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQor
CisgICAgICAgICMgUHJlcGFyZSBpbnB1dCBmaWxlIHdpdGggcmFuZG9tIGRhdGEgYW5kIHplcm9l
cy4KKyAgICAgICAgIyBXZSBrZWVwIHRoZSBzaXplIHNtYWxsICg0IE1CKSBmb3IgdGhlIHNha2Ug
b2YgdGVzdCB0aW1lLgorICAgICAgICBjbWQgPSAiZGQgaWY9L2Rldi91cmFuZG9tIG9mPW9yaWcg
YnM9MU0gY291bnQ9MiAmJiAiIFwKKyAgICAgICAgICAgICAgImRkIGlmPS9kZXYvemVybyBvZj1v
cmlnIGJzPTFNIGNvdW50PTIgc2Vlaz0yIgorICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCkK
KworICAgICAgICAjIENvbXByZXNzLgorICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKCJsem9wIC12
IC1vIGNvbXByZXNzZWQubHpvIG9yaWciLCB0aW1lb3V0PTYwKQorCisgICAgICAgICMgVGVzdC4K
KyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygibHpvcCAtdHYgY29tcHJlc3NlZC5sem8iKQorCisg
ICAgICAgICMgVW5jb21wcmVzcy4KKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygibHpvcCAtZHYg
LW8gdW5jb21wcmVzc2VkIGNvbXByZXNzZWQubHpvIikKKworICAgICAgICAjIFZlcmlmeS4KKyAg
ICAgICAgIyBUaGUgbHMgaXMgdGhlcmUgZm9yIGRlYnVnZ2luZy4KKyAgICAgICAgc2VsZi5hc3Nl
cnRSdW5PaygibHMgLWwgJiYgY21wIG9yaWcgdW5jb21wcmVzc2VkIikKLS0gCjIuMzUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
