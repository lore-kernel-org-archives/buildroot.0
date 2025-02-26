Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A46C18E7C
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 14:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE2106070F;
	Wed, 26 Feb 2025 14:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEAVPD0pxQtR; Wed, 26 Feb 2025 14:28:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C374B60758
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C374B60758;
	Wed, 26 Feb 2025 14:28:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 008DB94F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDD4B40930
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_GPOkVhZ5ZQ for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 14:28:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.52.147;
 helo=8.mo560.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84EE5400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84EE5400DA
Received: from 8.mo560.mail-out.ovh.net (8.mo560.mail-out.ovh.net
 [188.165.52.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84EE5400DA
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:28:29 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.2.54])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4Z2xfL6wnPz1kj1
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:28:26 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-vdgn2 (unknown [10.110.178.91])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 870921FDD5;
 Wed, 26 Feb 2025 14:28:26 +0000 (UTC)
Received: from armadeus.com ([37.59.142.97])
 by ghost-submission-5b5ff79f4f-vdgn2 with ESMTPSA
 id ARlTFAolv2dTIQAABrTzDg
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 26 Feb 2025 14:28:26 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 26 Feb 2025 15:28:14 +0100
Message-Id: <20250226-nxp-mwifiex-kconfig-fix-v1-0-5e2a46c520a5@armadeus.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP4kv2cC/x2MQQqAIBAAvxJ7bsEWTOor0aFytSWyUCgh+nvSc
 QZmHkgchRP01QORL0lyhAJNXcGyTsEzii0MpEgrohZDPnG/xQln3JYjOPHoJGNnjKLZOj0ZglK
 fkYv+z8P4vh+GCA2GaQAAAA==
X-Change-ID: 20250226-nxp-mwifiex-kconfig-fix-97702bdf5a72
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 2668945729752001515
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeevgeeghfejvdegtedukeejieetheekjeejvdfhtdeguedukeejtdeftdeugeeileenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheeitdgmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=T6FBCFtnIbPVy9CNpDREXEz/LftkwwjYygRefTrHuyA=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1740580107; v=1;
 b=oVNWTPftV2DPVDZO0Ba3htbaHpLhQd09FgJks0n8bvQvdCnh34d0ki7FM+aRcMejv6HYOOoJ
 twBnWrD0dMK29enqRUr2kANa/cflCQULz4awOEErTJdonIvbQegvJin/7PoQoqZpypnSDonk5v5
 qIK777YKgvZbTRKvXy41k+z7hvLUNkcn0s+tvPhGYpWyhNddBmg8D6zyOQqO1UIe0e700yE4GNM
 iRvXER0PVtf8OCuguD7Gi8773YMITVQAuVsx9hI1HBnzfhnDXBCowsho7Syy+TVPc2fOixdML2+
 HJrfeWEx9d6bDPPImp9ufDhwDi39Q9JjwdyBtcI/bK5OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=oVNWTPft
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00207e7c3cb-2532-43be-a055-4ceb9213bfe3,
 A50FC0A5E7C9DA406CB1ACD9B6A167DCAC5E06BF)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 0/2] package/nxp-mwifiex: fix build failures
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

VGhpcyB0d28gcGF0Y2hlcyBmaXggYnVpbGRzIGZhaWx1cmUgZHVlIHRvIEtDT05GSUdfUENJIG1p
c3R5cGVkIGFuZApSVENfQ0xBU1MgbWlzc2luZy4KClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4g
U3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0tClPDqWJhc3Rp
ZW4gU3p5bWFuc2tpICgyKToKICAgICAgcGFja2FnZS9ueHAtbXdpZmlleDogdXNlIHJpZ2h0IGtl
cm5lbCBjb25maWcgc3ltYm9sIHRvIGVuYWJsZSBQQ0kKICAgICAgcGFja2FnZS9ueHAtbXdpZmll
eDogZW5hYmxlIExpbnV4IG9wdGlvbiBSVENfQ0xBU1MKCiBwYWNrYWdlL254cC1td2lmaWV4L254
cC1td2lmaWV4Lm1rIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKLS0tCmJhc2UtY29tbWl0OiA5ZWViODEwOGM2OTc0MjkzYTQzYTQ0OGQyY2Yx
ZjIxOTkwMmQ4ZmEwCmNoYW5nZS1pZDogMjAyNTAyMjYtbnhwLW13aWZpZXgta2NvbmZpZy1maXgt
OTc3MDJiZGY1YTcyCgpCZXN0IHJlZ2FyZHMsCi0tIApTw6liYXN0aWVuIFN6eW1hbnNraSA8c2Vi
YXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
