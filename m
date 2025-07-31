Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C53AC87FD2
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 16:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 225C784149;
	Thu, 31 Jul 2025 16:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8Ob_R3OlvmX; Thu, 31 Jul 2025 16:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 475C7842F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 475C7842F6;
	Thu, 31 Jul 2025 16:21:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C62B2168
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 16:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EEF184149
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 16:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6eHM58axvGZ for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 16:21:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD5748410B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD5748410B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD5748410B
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 16:21:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5202205B1;
 Thu, 31 Jul 2025 16:21:19 +0000 (UTC)
Date: Thu, 31 Jul 2025 18:21:15 +0200
MIME-Version: 1.0
Message-Id: <20250731-openscap-v2-5-5d7fec0cb36d@bootlin.com>
References: <20250731-openscap-v2-0-5d7fec0cb36d@bootlin.com>
In-Reply-To: <20250731-openscap-v2-0-5d7fec0cb36d@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeghfetffeuhfehkeekleffffdvuefggfevjefftddvffduheettdeiveetteenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepsggrrhhutghhsehtkhhoshdrtghordhilhdprhgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgp
 dhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhimhdrhhgrmhhmvghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753978880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ya5/FiTbpQwwGhJJtMrGpJIRizyL+jXZaUEpNKv4zrI=;
 b=okqzbRkT4Ujvtbxn8WfoXT34uVoOGIK1xI6aI/lxAk7BL1i85nTp7VDCoiJ1c9rns/kLJj
 73OXoDeKbrgmlWfjSstXE2l6lK2hjBBzQp5LukIFs/WcYssEtfBbFaqTmwUWKugSOnO2BT
 MnwcnFllTTb1q07fLHY0fkalZ2cSREE9wiIONWZz1SxCz1AVeyLKfusuW2jdC5q/1nMf01
 Irq56EuzSK6Uahi6nrW3qvuvHIvxID1WjP2bSHAGMq/d6dWZM+r+fy2Zyn9isbUhaV9xQk
 r1AL5A6b9B/a8yrbv/eNwZblJjZjRuU1S6dn/1E9Pa0Cc6dobtaRncIh7LzmvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=okqzbRkT
Subject: [Buildroot] [PATCH v2 5/5] support/testing: add runtime testing for
 compliance-as-code
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

QWRkIHNvbWUgYmFzaWMgcnVudGltZSB0ZXN0aW5nIGZvciBvcGVuc2NhcC9jb21wbGlhbmNlLWFz
LWNvZGUuIEJ5CnJ1bm5pbmcgYSBzaW5nbGUgY29tbWFuZCwgd2UgdGVzdCB0aGF0OgotIHRoZSBv
c2NhcCBiaW5hcnkgaXMgaW5zdGFsbGVkIGFuZCBjYW4gZXhlY3V0ZQotIHRoZSBjb21wbGlhbmNl
LWFzLWNvZGUgcG9saWN5IGZpbGVzIGFyZSBwcm9wZXJseSBpbnN0YWxsZWQKLSBvc2NhcCBjYW4g
cGFyc2UgYSBwb2xpY3kgZmlsZSwgYW5kIHNvIHRob3NlIGFyZSBjb3JyZWN0bHkgYnVpbHQKClNp
Z25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
Ci0tLQpDaGFuZ2VzIGluIHYyOgotIG5ldyBjb21taXQKLS0tCiBERVZFTE9QRVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIC4uLi90ZXN0cy9wYWNrYWdl
L3Rlc3RfY29tcGxpYW5jZV9hc19jb2RlLnB5ICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvREVW
RUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggN2FlYTc1ZDI2N2E3YmI0YjY1YWY5N2Q5ODQ1NGVk
NWJlMjNiODVlMC4uNWU0ZTFhMDI2MDc2ZTY2Zjg3MjdlODY4ZjNhOGNiM2I1MDUyNzAwNyAxMDA2
NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xNTYsNiArMTU2LDcgQEAg
TjoJQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KIEY6CXBhY2th
Z2UvbGlieG1sc2VjMS8KIEY6CXBhY2thZ2Uvb3BlbnNjYXAvCiBGOglwYWNrYWdlL2NvbXBsaWFu
Y2UtYXMtY29kZS8KK0Y6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfY29tcGxp
YW5jZV9hc19jb2RlLnB5CiAKIE46CUFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyQGFsaXN0YWly
MjMubWU+CiBGOglib2FyZC9zaWZpdmUvCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X2NvbXBsaWFuY2VfYXNfY29kZS5weSBiL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfY29tcGxpYW5jZV9hc19jb2RlLnB5Cm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjEwYTUz
YzEyZDBjMjZkY2YxMjRlZTY0ZDI2MGFiNmFkYjQ3NjVjMGUKLS0tIC9kZXYvbnVsbAorKysgYi9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2NvbXBsaWFuY2VfYXNfY29kZS5weQpA
QCAtMCwwICsxLDIzIEBACitpbXBvcnQgb3MKK2Zyb20gaW5mcmEuYmFzZXRlc3QgaW1wb3J0IEJS
VGVzdCwgQkFTSUNfVE9PTENIQUlOX0NPTkZJRworCisKK2NsYXNzIFRlc3RDb21wbGlhbmNlQXND
b2RlKEJSVGVzdCk6CisgICAgY29uZmlnID0gQkFTSUNfVE9PTENIQUlOX0NPTkZJRyArIFwKKyAg
ICAgICAgIiIiCisgICAgICAgIEJSMl9QQUNLQUdFX0NPTVBMSUFOQ0VfQVNfQ09ERT15CisgICAg
ICAgIEJSMl9QQUNLQUdFX0NPTVBMSUFOQ0VfQVNfQ09ERV9QUk9EVUNUUz0iZGViaWFuMTIiCisg
ICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQorICAgICAgICAjIEJSMl9UQVJHRVRfUk9P
VEZTX1RBUiBpcyBub3Qgc2V0CisgICAgICAgICIiIgorCisgICAgZGVmIHRlc3RfcnVuKHNlbGYp
OgorICAgICAgICBjcGlvX2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdl
cyIsICJyb290ZnMuY3BpbyIpCisgICAgICAgIHNlbGYuZW11bGF0b3IuYm9vdChhcmNoPSJhcm12
NSIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBrZXJuZWw9ImJ1aWx0aW4iLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucz1bIi1pbml0cmQiLCBjcGlvX2ZpbGVdKQorICAg
ICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkKKworICAgICAgICAjIENoZWNrIHRoYXQgb3NjYXAg
Y2FuIHBhcnNlIHRoZSBnZW5lcmF0ZWQgZGF0YXN0cmVhbQorICAgICAgICBzZWxmLmFzc2VydFJ1
bk9rKAorICAgICAgICAgICAgICAgICJvc2NhcCBpbmZvIC9ldGMvb3BlbnNjYXAvc3NnLWRlYmlh
bjEyLWRzLnhtbCIsIHRpbWVvdXQ9MTApCgotLSAKMi41MC4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
