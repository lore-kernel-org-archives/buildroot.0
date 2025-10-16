Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D72BCCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 14:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ADD384603;
	Thu, 16 Oct 2025 14:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8lCHX8_uKQb; Thu, 16 Oct 2025 14:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88F5B845FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88F5B845FF;
	Thu, 16 Oct 2025 14:46:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 658A193E
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 14:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C48541F94
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 14:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ai-T4lCbi_99 for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 14:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACC3441F92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC3441F92
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACC3441F92
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 14:46:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0BA9E4E410FA;
 Thu, 16 Oct 2025 14:46:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D70256062C;
 Thu, 16 Oct 2025 14:46:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B4E98102F2319; 
 Thu, 16 Oct 2025 16:46:51 +0200 (CEST)
Date: Thu, 16 Oct 2025 16:46:35 +0200
MIME-Version: 1.0
Message-Id: <20251016-openscap-v3-2-d7b28e958f5f@bootlin.com>
References: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
In-Reply-To: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760626012; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=L2ufEU1tweqvkrcWnTTFGgEs7o65y13PC1Phj9N2j5o=;
 b=P665gUXiwGYUjFtFF/ug87PutoNFVEHQ82iQWMT5jrgRghImL2GsGsMJX/rm2fu25CdPkr
 8YcjcJf5SGZU4NdlOgH/+ADiO5B2S9OOgSHQOMdGTE8VwXybM9wKEeKqu4eo4vHJl+FBI3
 KyjsllqoLGIWsSgNpLSiouQsxqYCcYIqwqX4brR3uDIKeJOCLhtaBNyI5ADSCrmqlkVg2x
 ZyB3J7d4syH91LjWwVXAKNevOosBRKqKrvLswUUio1CRjsZyaK0AbD2AEG/Ja6HBkhXVi/
 CrAh+rkpV+DsBDmqVThQE/bdN+8JZNmdaLkU9eAXM62VeKHgfHeW+fxNH+Y7Yw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=P665gUXi
Subject: [Buildroot] [PATCH v3 2/5] package/libcurl: Reapply "libcurl: add
 host variant"
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: tim.hammer@nav-timing.safrangroup.com,
 nicolas.carrier@nav-timing.safrangroup.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bGliY3VybCBob3N0IGJ1aWxkIHN1cHBvcnQgaGFzIGluaXRpYWxseSBiZWVuIGFkZGVkIHdpdGgg
NzM2ZTBmYzVkNjEwCigibGliY3VybDogYWRkIGhvc3QgdmFyaWFudCIpIHdoaWxlIGFkZGluZyBz
dXBwb3J0IGZvciBob3N0LWNhcmdvIGJ1aWxkLAphbmQgcmV2ZXJ0ZWQgd2l0aCA2OWU4NDAwOGFi
ZjggKCJSZXZlcnQgImxpYmN1cmw6IGFkZCBob3N0IHZhcmlhbnQiIikKd2hlbiBzdGFuZGFsb25l
IGNhcmdvIGJ1aWxkIGhhcyBiZWVuIHJlbW92ZWQuIEluIG9yZGVyIHRvIGJyaW5nIGEgbmV3Cmhv
c3QgcGFja2FnZSBkZXBlbmRpbmcgb24gbGliY3VybCwgcmUtZW5hYmxlIGhvc3QtbGliY3VybCBi
dWlsZCBzdXBwb3J0LgpXaGlsZSBkb2luZyBzbywgcmVtb3ZlIHRoZSBub3QtbmVlZGVkLWFueW1v
cmUgcG9zdC1wYXRjaCBob29rLgoKVGhpcyByZXZlcnRzIGNvbW1pdCB3OWU4NDAwOGFiZjg3ZWFl
ZWIzZjJkNTNjODgwY2YzMzQ5MmEzYmY4LgoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOp
IDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gYWRkIC0t
ZGlzYWJsZS1saWJwc2wKCkNoYW5nZXMgaW4gdjI6Ci0gcmVtb3ZlIHRoZSBwb3N0LXBhdGNoIGhv
b2ssIGFzIHRoZSBjb3JyZXNwb25kaW5nIGNvbW1hbmQgZG9lcyBub3QKICBleGlzdCBhbnltb3Jl
Ci0tLQogcGFja2FnZS9saWJjdXJsL2xpYmN1cmwubWsgfCAxMiArKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJjdXJs
L2xpYmN1cmwubWsgYi9wYWNrYWdlL2xpYmN1cmwvbGliY3VybC5tawppbmRleCAwYWE4ODA0NGJk
ZjA1ZDE0ZDU2YjdlYjU4NzNhMDkzYWI3MzdhZTJhLi43ZDdmMmNkNmU3NzYwMjk3ODllYzJlZGI0
NDg2NDU5MGQ4ZTI5YjQwIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYmN1cmwvbGliY3VybC5tawor
KysgYi9wYWNrYWdlL2xpYmN1cmwvbGliY3VybC5tawpAQCAtMTg5LDQgKzE4OSwxNiBAQCBlbmRl
ZgogTElCQ1VSTF9QT1NUX0lOU1RBTExfVEFSR0VUX0hPT0tTICs9IExJQkNVUkxfVEFSR0VUX0NM
RUFOVVAKIGVuZGlmCiAKK0hPU1RfTElCQ1VSTF9ERVBFTkRFTkNJRVMgPSBob3N0LW9wZW5zc2wK
K0hPU1RfTElCQ1VSTF9DT05GX09QVFMgPSBcCisJLS1kaXNhYmxlLW1hbnVhbCBcCisJLS1kaXNh
YmxlLW50bG0td2IgXAorCS0tZGlzYWJsZS1jdXJsZGVidWcgXAorCS0td2l0aC1zc2wgXAorCS0t
d2l0aG91dC1nbnV0bHMgXAorCS0td2l0aG91dC1tYmVkdGxzIFwKKwktLXdpdGhvdXQtbnNzIFwK
KwktLXdpdGhvdXQtbGlicHNsCisKICQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkKKyQoZXZh
bCAkKGhvc3QtYXV0b3Rvb2xzLXBhY2thZ2UpKQoKLS0gCjIuNTEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
