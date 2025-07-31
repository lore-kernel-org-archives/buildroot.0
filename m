Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742EDC87FCA
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 16:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC7F98425D;
	Thu, 31 Jul 2025 16:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1mQF1ZmKNKk; Thu, 31 Jul 2025 16:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CFE9841B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CFE9841B8;
	Thu, 31 Jul 2025 16:21:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D076168
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 16:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E49184149
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 16:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NazPMbwtNiPR for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 16:21:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B2DA842D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2DA842D5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B2DA842D5
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 16:21:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6AEB31FD33;
 Thu, 31 Jul 2025 16:21:18 +0000 (UTC)
Date: Thu, 31 Jul 2025 18:21:12 +0200
MIME-Version: 1.0
Message-Id: <20250731-openscap-v2-2-5d7fec0cb36d@bootlin.com>
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
 d=bootlin.com; s=gm1; t=1753978878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mvnQt+kin9Mr72HuOkRwRUuVRjjE7k9Lhol63Dq9n0w=;
 b=TfV+c/xIxhxDRHcHZMd/vZJQepMYfyzUIHf2W5F5d8zkKOTOH+gVgpQbSuh6O2chtLSM8p
 zK58chWaUZygMYj6+PFywoMpSG+BoJ6hdXDEFCxHG6kRjgZUIGKUl26XFkG2uJuOERJSzT
 QFPpw4obkw0uyXciFvCOXEYVZbPq24Lzr+1S64CwUTZt15F1fEVOgbCwtMJcUVcXglDWXa
 UStfcB3Y/Kiex8weCIml09kmUQ4XgdM2R7xZVAJHU0cGDwjyFiVFhk0r9sNWc5pdX2wmSr
 197rPYUOAz4CMeC33+vutRwax7iO5tAYYb49/oBzQPcr8du8xTVDN/fSMp27bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TfV+c/xI
Subject: [Buildroot] [PATCH v2 2/5] package/libcurl: Reapply "libcurl: add
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
IDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gcmVtb3Zl
IHRoZSBwb3N0LXBhdGNoIGhvb2ssIGFzIHRoZSBjb3JyZXNwb25kaW5nIGNvbW1hbmQgZG9lcyBu
b3QKICBleGlzdCBhbnltb3JlCi0tLQogcGFja2FnZS9saWJjdXJsL2xpYmN1cmwubWsgfCAxMSAr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYmN1cmwvbGliY3VybC5tayBiL3BhY2thZ2UvbGliY3VybC9saWJjdXJsLm1r
CmluZGV4IDFjZmRkYTI3ZDIxNTc3NWNiODAyMTk3OWJjOTU1YzMwYWU0ZmVhNGMuLmMzMTFmNThm
YjIyM2E2NzE3MTIwODQxMDhkNGM0YWIxOGVlNzI5ZTcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGli
Y3VybC9saWJjdXJsLm1rCisrKyBiL3BhY2thZ2UvbGliY3VybC9saWJjdXJsLm1rCkBAIC0xODks
NCArMTg5LDE1IEBAIGVuZGVmCiBMSUJDVVJMX1BPU1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0g
TElCQ1VSTF9UQVJHRVRfQ0xFQU5VUAogZW5kaWYKIAorSE9TVF9MSUJDVVJMX0RFUEVOREVOQ0lF
UyA9IGhvc3Qtb3BlbnNzbAorSE9TVF9MSUJDVVJMX0NPTkZfT1BUUyA9IFwKKwktLWRpc2FibGUt
bWFudWFsIFwKKwktLWRpc2FibGUtbnRsbS13YiBcCisJLS1kaXNhYmxlLWN1cmxkZWJ1ZyBcCisJ
LS13aXRoLXNzbCBcCisJLS13aXRob3V0LWdudXRscyBcCisJLS13aXRob3V0LW1iZWR0bHMgXAor
CS0td2l0aG91dC1uc3MKKwogJChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQorJChldmFsICQo
aG9zdC1hdXRvdG9vbHMtcGFja2FnZSkpCgotLSAKMi41MC4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
