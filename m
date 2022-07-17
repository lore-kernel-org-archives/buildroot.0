Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5416C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 15:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17A5C409ED;
	Sun, 17 Jul 2022 15:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17A5C409ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5iwQ32fT1Hta; Sun, 17 Jul 2022 15:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16E2C40538;
	Sun, 17 Jul 2022 15:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16E2C40538
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 223031BF5A7
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 15:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF9BD41774
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 15:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF9BD41774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IRFIBdu42SC for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 15:42:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 316484176C
Received: from smtp-outgoing-1601.laposte.net (smtp-outgoing-1601.laposte.net
 [160.92.124.96])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 316484176C
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 15:42:35 +0000 (UTC)
X-mail-filterd: {"version":"1.4.3", "queueID":"4Lm8Vc0N1CzjWvm",
 "contextId":"71128012-52a5-4dbf-9907-b7c7245961c0"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0116.laposte.net (SMTP Server) with ESMTP id 4Lm8Vc0N1CzjWvm;
 Sun, 17 Jul 2022 17:42:32 +0200 (CEST)
X-mail-filterd: {"version":"1.4.3", "queueID":"4Lm8Vb6x17zjWvW",
 "contextId":"ab91902e-35da-4c9e-ba88-b3476710bc18"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 50
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (unknown [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0116.laposte.net (SMTP Server) with ESMTPSA id 4Lm8Vb6x17zjWvW;
 Sun, 17 Jul 2022 17:42:31 +0200 (CEST)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
 by romuald.bergerie (Postfix) with ESMTP id B54974BB0724;
 Sun, 17 Jul 2022 17:42:31 +0200 (CEST)
Received: from vincent by radicelle.bergerie with local (Exim 4.96)
 (envelope-from <vincent@radicelle.bergerie>) id 1oD6PZ-0001cF-1H;
 Sun, 17 Jul 2022 17:42:25 +0200
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 17:42:13 +0200
Message-Id: <20220717154213.6206-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=laposte.net; s=lpn-wlmd; t=1658072553;
 bh=jMYcgs4hyKnMUGzJHGNAcaa8HXQnx/rctU2TxvrBke4=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=BLxJhErVOuhSIRddPNEIL2wE8X23hOzDQ/u53P9YHB81ZVoaDXlX8bE4GEVEt/CEtJHUSEjNseDCZmi2nLX0t3KSplwFEXd5/MPtkG7ohzdwnIVFAQg/C9Kdl+dBJocNKPH8y5uSHPaGg5PxT7MWMThy2mgUxyzKPrj/S1o1zd8XeHXHeAD6Ob1bXyvp85ixpzrD038a3WFdX9Ywjw++HYRUJjcMv1MdLwn2w60dapoIr5+mA5biCawCGQiwnB7H0kKuGsxtKHGqJXeIs8qHksaZywuEIyO4nKlIrGzG46DGr3zWATp5H+90Ys6SJWZdjCRAu/GajZSpmrtkT4pI9Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net
 header.a=rsa-sha256 header.s=lpn-wlmd header.b=BLxJhErV
Subject: [Buildroot] [PATCH] support/testing: add test for gzip
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

QWRkIGEgc2ltcGxlIGNvbXByZXNzLXVuY29tcHJlc3MgdGVzdCB0byB2ZXJpZnkgdGhhdCBnemlw
IGlzIHdvcmtpbmcuCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3Rl
aGxlQGxhcG9zdGUubmV0PgotLS0KCgpIaSwKCkkgaGF2ZSB2ZXJpZmllZCB0aGF0IHRoaXMgdGVz
dCBydW5zIGZpbmUgYm90aCBsb2NhbGx5IGFuZCBvbiBnaXRsYWIuCgpCZXN0IHJlZ2FyZHMsClZp
bmNlbnQuCgoKIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZ3ppcC5weSB8IDQyICsrKysr
KysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZ3ppcC5w
eQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDVjM2MyNGZmN2Eu
LmIxYzIxZmY0YTQgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAt
MjkxOSw2ICsyOTE5LDcgQEAgRjoJcGFja2FnZS9pN3ovCiBGOglwYWNrYWdlL21zci10b29scy8K
IEY6CXBhY2thZ2UvcGl4ei8KIEY6CXBhY2thZ2UvemVyb2ZyZWUvCitGOglzdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X2d6aXAucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfbXNyX3Rvb2xzKgogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9waXh6LnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3plcm9m
cmVlLnB5CmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2d6
aXAucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2d6aXAucHkKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNDgzNzc4NmRhZAotLS0gL2Rldi9udWxs
CisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZ3ppcC5weQpAQCAtMCww
ICsxLDQyIEBACitpbXBvcnQgb3MKKworaW1wb3J0IGluZnJhLmJhc2V0ZXN0CisKKworY2xhc3Mg
VGVzdEd6aXAoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKKyAgICBjb25maWcgPSBpbmZyYS5iYXNl
dGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09ORklHICsgXAorICAgICAgICAiIiIKKyAgICAgICAgQlIy
X1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUz15CisgICAgICAgIEJSMl9QQUNLQUdFX0daSVA9
eQorICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19DUElPPXkKKyAgICAgICAgIyBCUjJfVEFSR0VU
X1JPT1RGU19UQVIgaXMgbm90IHNldAorICAgICAgICAiIiIKKworICAgIGRlZiB0ZXN0X3J1bihz
ZWxmKToKKyAgICAgICAgY3Bpb19maWxlID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJp
bWFnZXMiLCAicm9vdGZzLmNwaW8iKQorICAgICAgICBzZWxmLmVtdWxhdG9yLmJvb3QoYXJjaD0i
YXJtdjUiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAga2VybmVsPSJidWlsdGluIiwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG9wdGlvbnM9WyItaW5pdHJkIiwgY3Bpb19maWxlXSkK
KyAgICAgICAgc2VsZi5lbXVsYXRvci5sb2dpbigpCisKKyAgICAgICAgIyBQcmVwYXJlIGlucHV0
IGZpbGUgd2l0aCByYW5kb20gZGF0YSBhbmQgemVyb2VzLgorICAgICAgICAjIFdlIGtlZXAgdGhl
IHNpemUgc21hbGwgKDQgTUIpIGZvciB0aGUgc2FrZSBvZiB0ZXN0IHRpbWUuCisgICAgICAgIGNt
ZCA9ICJkZCBpZj0vZGV2L3VyYW5kb20gb2Y9b3JpZyBicz0xTSBjb3VudD0yICYmICIgXAorICAg
ICAgICAgICAgICAiZGQgaWY9L2Rldi96ZXJvIG9mPW9yaWcgYnM9MU0gY291bnQ9MiBzZWVrPTIi
CisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soY21kKQorCisgICAgICAgICMgQ29tcHJlc3MuCisg
ICAgICAgIGNtZCA9ICJjcCAtdiBvcmlnIGNvbXByZXNzZWQgJiYgZ3ppcCAtdiBjb21wcmVzc2Vk
IgorICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCwgdGltZW91dD02MCkKKworICAgICAgICAj
IFRlc3QuCisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soImd6aXAgLXR2IGNvbXByZXNzZWQuZ3oi
KQorCisgICAgICAgICMgVW5jb21wcmVzcy4KKyAgICAgICAgY21kID0gImNwIC12IGNvbXByZXNz
ZWQuZ3ogdW5jb21wcmVzc2VkLmd6ICYmICIgXAorICAgICAgICAgICAgICAiZ3VuemlwIC12IHVu
Y29tcHJlc3NlZC5neiIKKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PayhjbWQpCisKKyAgICAgICAg
IyBWZXJpZnkuCisgICAgICAgICMgVGhlIGxzIGlzIHRoZXJlIGZvciBkZWJ1Z2dpbmcuCisgICAg
ICAgIHNlbGYuYXNzZXJ0UnVuT2soImxzIC1sICYmIGNtcCBvcmlnIHVuY29tcHJlc3NlZCIpCi0t
IAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
