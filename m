Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB59EB64DC
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 08:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24059402A8;
	Sat, 15 Jul 2023 08:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24059402A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GHnxSYa4jjv; Sat, 15 Jul 2023 08:51:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A5964023F;
	Sat, 15 Jul 2023 08:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A5964023F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23BDD1BF5A0
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 08:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F116140022
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 08:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F116140022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFA_9CvLDBXz for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 08:51:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F9C4400CB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F9C4400CB
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 08:51:48 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E8C1E13F8CB;
 Sat, 15 Jul 2023 10:51:43 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 10:51:30 +0200
Message-ID: <20230715085130.103441-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689411106;
 bh=tOAbHdjfBIUQeLbz6jCBFC300Llm9S7596kcLy22hZ4=;
 h=From:To:Cc:Subject:Date:From;
 b=c0wAM9fqJ62jzbtpzrvLsAlstrPlwDqXMWGMzq2ueePGqq4apnIJSN1mA3Tigp1NE
 j26JL54lcfKXgGyG4waFAGRsgtYNKW9yi96B+uksu91z8t4V4pSVEDI4VxKrYWsI6e
 Tcg+C47FuGOQVs9QZmwCkWsVU5wqmVkpSvfgffkcZxsQ0btg6uFlTtToJzHQKA9djn
 WnXCSTtyaVL9ovA+3WumJFt4yzBpp7g1gPF6SoaarD1Ro+sAyvlOoGDt91yMSrlCAC
 PYr3FixpMK2bmt83cxu1V2SKlaAhMEp/7AN6kpE42+kdPDHKei4kzGqf1rNh5gMjZn
 K1KpwjurLMZXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c0wAM9fq
Subject: [Buildroot] [PATCH 1/1] support/testing/tests/package/test_pixz.py:
 use test_compressor_base
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
Cc: Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHRlc3RfcGl4ei5weSB0ZXN0IHdhcyBpbml0aWFsbHkgd3JpdHRlbiBhcyBhIHN0YW5kYWxv
bmUgdGVzdC4KClRoZSBjb21taXQgY2YxMzJhMTMKInN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3Rlc3RfY29tcHJlc3Nvcl9iYXNlLnB5OiBuZXcgaGVscGVyIGNsYXNzIgppbnRyb2R1Y2Vk
IGEgaGVscGVyIGNsYXNzIGZvciB0ZXN0aW5nIGRhdGEgY29tcHJlc3Npb24gcHJvZ3JhbXMuCgpU
aGlzIGNvbW1pdCByZXdyaXRlcyB0aGlzIHRlc3QgdG8gdXNlIHRoaXMgaGVscGVyIGNsYXNzLgoK
VGhlIHRlc3QgY292ZXJhZ2UgaXMgbW9zdGx5IHRoZSBzYW1lIGFzIGJlZm9yZSB0aGUgcmV3cml0
ZS4gTm90YWJsZQpkaWZmZXJlbmNlcyBhcmU6Ci0gdGhlIHRlc3QgZmlsZSBpcyBzbGlnaHRseSBz
bWFsbGVyIGZvciBmYXN0ZXIgdGVzdGluZywKLSBpdHMgY29udGVudCBsYXlvdXQgYWxzbyBzbGln
aHRseSBkaWZmZXJlbnQuCgpDYzogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBv
c3RlLm5ldD4KU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KLS0t
CiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3BpeHoucHkgfCA0OCArKysrKyst
LS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMzUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9waXh6LnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9waXh6LnB5Cmlu
ZGV4IGVlZmYxMGVhYTEuLjY2MjBiZDRhODIgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfcGl4ei5weQorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3BpeHoucHkKQEAgLTEsNDAgKzEsMTggQEAKLWltcG9ydCBvcworZnJvbSB0ZXN0
cy5wYWNrYWdlLnRlc3RfY29tcHJlc3Nvcl9iYXNlIGltcG9ydCBUZXN0Q29tcHJlc3NvckJhc2UK
IAotaW1wb3J0IGluZnJhLmJhc2V0ZXN0CiAKLQotY2xhc3MgVGVzdFBpeHooaW5mcmEuYmFzZXRl
c3QuQlJUZXN0KToKLSAgICBjb25maWcgPSBpbmZyYS5iYXNldGVzdC5CQVNJQ19UT09MQ0hBSU5f
Q09ORklHICsgXAorY2xhc3MgVGVzdFBpeHooVGVzdENvbXByZXNzb3JCYXNlKToKKyAgICBfX3Rl
c3RfXyA9IFRydWUKKyAgICBjb25maWcgPSBUZXN0Q29tcHJlc3NvckJhc2UuY29uZmlnICsgXAog
ICAgICAgICAiIiIKICAgICAgICAgQlIyX1BBQ0tBR0VfUElYWj15Ci0gICAgICAgIEJSMl9UQVJH
RVRfUk9PVEZTX0NQSU89eQotICAgICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qg
c2V0CiAgICAgICAgICIiIgotCi0gICAgZGVmIHRlc3RfcnVuKHNlbGYpOgotICAgICAgICBjcGlv
X2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJyb290ZnMuY3Bp
byIpCi0gICAgICAgIHNlbGYuZW11bGF0b3IuYm9vdChhcmNoPSJhcm12NSIsCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICBrZXJuZWw9ImJ1aWx0aW4iLAotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgb3B0aW9ucz1bIi1pbml0cmQiLCBjcGlvX2ZpbGVdKQotICAgICAgICBzZWxmLmVtdWxh
dG9yLmxvZ2luKCkKLQotICAgICAgICAjIFByZXBhcmUgaW5wdXQgZmlsZSB3aXRoIHJhbmRvbSBk
YXRhIGFuZCB6ZXJvZXMuCi0gICAgICAgICMgV2Uga2VlcCB0aGUgc2l6ZSBzbWFsbCAoNCBNQikg
Zm9yIHRoZSBzYWtlIG9mIHRlc3QgdGltZS4KLSAgICAgICAgY21kID0gImRkIGlmPS9kZXYvdXJh
bmRvbSBvZj1vcmlnIGJzPTFNIGNvdW50PTIgJiYgIiBcCi0gICAgICAgICAgICAgICJkZCBpZj0v
ZGV2L3plcm8gb2Y9b3JpZyBicz0xTSBjb3VudD0yIHNlZWs9MiIKLSAgICAgICAgc2VsZi5hc3Nl
cnRSdW5PayhjbWQpCi0KLSAgICAgICAgIyBDb21wcmVzcy4KLSAgICAgICAgIyBXZSBhc2sgZm9y
IDMgdGhyZWFkcyBmb3IgZ29vZCBtZWFzdXJlIGJ1dCB3aXRoIGEgdmVyeSBzbWFsbCBmaWxlIG9u
IGEKLSAgICAgICAgIyB1bmlwcm9jZXNzb3IgcWVtdSB0aGlzIGlzIG9ubHkgYSBsaWdodCB2YWxp
ZGF0aW9uLgotICAgICAgICBjbWQgPSAiY3AgLXYgb3JpZyBjb21wcmVzc2VkICYmIHBpeHogLXAg
MyBjb21wcmVzc2VkIgotICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCwgdGltZW91dD02MCkK
LQotICAgICAgICAjIFVuY29tcHJlc3MuCi0gICAgICAgIGNtZCA9ICJjcCAtdiBjb21wcmVzc2Vk
Lnh6IHVuY29tcHJlc3NlZC54eiAmJiBwaXh6IC1kIHVuY29tcHJlc3NlZC54eiIKLSAgICAgICAg
c2VsZi5hc3NlcnRSdW5PayhjbWQpCi0KLSAgICAgICAgIyBWZXJpZnkuCi0gICAgICAgICMgVGhl
IGxzIGlzIHRoZXJlIGZvciBkZWJ1Z2dpbmcuCi0gICAgICAgIGNtZCA9ICJscyAtbCAmJiBjbXAg
b3JpZyB1bmNvbXByZXNzZWQiCi0gICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soY21kKQorICAgIGNv
bXByZXNzX2NtZCA9ICJwaXh6IC1wMyIKKyAgICBkZWNvbXByZXNzX2NtZCA9ICJwaXh6IC1kIgor
ICAgIGNvbXByZXNzZWRfZmlsZV9leHQgPSAiLnh6IgorCisgICAgZGVmIGNoZWNrX2ludGVncml0
eV90ZXN0KHNlbGYpOgorICAgICAgICAjIERvIG5vdGhpbmcgZm9yIHRoZSBpbnRlZ3JpdHkgdGVz
dCBiZWNhdXNlICJwaXh6IiBkb2VzIG5vdAorICAgICAgICAjIGltcGxlbWVudCB0aGlzIGZlYXR1
cmUuIFRoZSAiLXQiIG9wdGlvbiBoYXMgb3RoZXIgZnVuY3Rpb25zOgorICAgICAgICAjIGh0dHBz
Oi8vZ2l0aHViLmNvbS92YXNpL3BpeHovYmxvYi92MS4wLjcvc3JjL3BpeHouMS5hc2NpaWRvYyNv
cHRpb25zCisgICAgICAgIHBhc3MKLS0gCjIuNDEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
