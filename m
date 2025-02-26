Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19969C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 14:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B456D820B8;
	Wed, 26 Feb 2025 14:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tn8V-fU1Vg42; Wed, 26 Feb 2025 14:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D636D820C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D636D820C1;
	Wed, 26 Feb 2025 14:36:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB1E194F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA88940669
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amtt_ySSygWi for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 14:36:47 +0000 (UTC)
X-Greylist: delayed 496 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 26 Feb 2025 14:36:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C395406D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C395406D6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.34.113;
 helo=3.mo581.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 3.mo581.mail-out.ovh.net (3.mo581.mail-out.ovh.net
 [46.105.34.113])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C395406D6
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:36:46 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.140.200])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4Z2xfM524Fz1Rw8
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:28:27 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-vdgn2 (unknown [10.110.178.91])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6BD951FEB3;
 Wed, 26 Feb 2025 14:28:27 +0000 (UTC)
Received: from armadeus.com ([37.59.142.97])
 by ghost-submission-5b5ff79f4f-vdgn2 with ESMTPSA
 id ARlTFAolv2dTIQAABrTzDg:T3
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 26 Feb 2025 14:28:27 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 26 Feb 2025 15:28:16 +0100
MIME-Version: 1.0
Message-Id: <20250226-nxp-mwifiex-kconfig-fix-v1-2-5e2a46c520a5@armadeus.com>
References: <20250226-nxp-mwifiex-kconfig-fix-v1-0-5e2a46c520a5@armadeus.com>
In-Reply-To: <20250226-nxp-mwifiex-kconfig-fix-v1-0-5e2a46c520a5@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 2669227205220232171
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiudefueehuefgkeelheefjeejgfefvdeuuddtffekvefhtdelgfehheffheeggfenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekudgmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=IkkohQCesHGPsSj4ig+Au6ai4cnB9QLZ9FBmpTP+2z8=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1740580107; v=1;
 b=JS8ATWhstLaYt9lS349x609eBjNHeYd23TFfgIrkQznDIOYq9rGOH8UVKytx1QL5OoZztF6I
 QBUZeDXOIVXG71lwzLWnfCP9j3Xc1XZ+IzBL3DAk5tqFU+6DtNGOtOCo74CA8pXrLMu7cOU5b3Z
 x6DpjO8d3B9V+nWOAYGmoJzU8zsqTGv9nw9sADVi49P4c3yXz7LcAewJz5OPiqaG8HgXXMlKZwo
 kAW6DVnkBolHca5ZbI2+LHglZSqD1E2djf3Eq9CVorfTx1egxjrOOGfI1vqfitT2+fKS3t45Ksz
 NTwUtjXpF2yHI8GuerwosPXcMGfrYFeLr2gmFHKyrmIcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=JS8ATWhs
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002acdee921-c212-44a0-b6f7-443d926faaa0,
 A50FC0A5E7C9DA406CB1ACD9B6A167DCAC5E06BF)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 2/2] package/nxp-mwifiex: enable Linux option
 RTC_CLASS
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

V2l0aG91dCBMaW51eCBvcHRpb24gUlRDX0NMQVNTIGVuYWJsZWQsIHRoZSBidWlsZCBmYWlscyB3
aXRoOgoKRVJST1I6IG1vZHBvc3Q6ICJydGNfa3RpbWVfdG9fdG0iIFsvaG9tZS9zc3p5L2RldmVs
b3BtZW50L2ViOTcyYjc4MWVhZDM1N2MzZTQ0YTg4MGNjMWI4ZTRhYjRiMTViNTgvb3V0cHV0L2J1
aWxkL254cC1td2lmaWV4LWxmLTYuNi41Ml8yLjIuMC8uL21vYWwua29dIHVuZGVmaW5lZCEKCkZp
eCB0aGF0IGJ5IGVuYmFsaW5nIFJUQ19DTEFTUy4KClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4g
U3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdl
L254cC1td2lmaWV4L254cC1td2lmaWV4Lm1rIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL254cC1td2lmaWV4L254cC1td2lmaWV4Lm1r
IGIvcGFja2FnZS9ueHAtbXdpZmlleC9ueHAtbXdpZmlleC5tawppbmRleCAzMzNmOGVjNGZiODRi
ZjE2ODZhNGVlZTdjYzZjMmMzMTM0YjUyOTU5Li40NjY3OGEyYzkxNjI1NmQwN2I3NjEyNmFmODM2
Y2RmYWY0M2Y0NjIzIDEwMDY0NAotLS0gYS9wYWNrYWdlL254cC1td2lmaWV4L254cC1td2lmaWV4
Lm1rCisrKyBiL3BhY2thZ2UvbnhwLW13aWZpZXgvbnhwLW13aWZpZXgubWsKQEAgLTE5LDYgKzE5
LDcgQEAgZGVmaW5lIE5YUF9NV0lGSUVYX0xJTlVYX0NPTkZJR19GSVhVUFMKIAkkKGNhbGwgS0NP
TkZJR19FTkFCTEVfT1BULENPTkZJR19VU0IpCiAJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxD
T05GSUdfTU1DKQogCSQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX1BDSSkKKwkkKGNh
bGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19SVENfQ0xBU1MpCiBlbmRlZgogCiAkKGV2YWwg
JChrZXJuZWwtbW9kdWxlKSkKCi0tIAoyLjQ1LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
