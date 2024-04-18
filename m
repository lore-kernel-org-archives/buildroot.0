Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEA2C4345F
	for <buildroot@archiver.kernel.org>; Thu, 18 Apr 2024 14:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F2A401BA;
	Thu, 18 Apr 2024 14:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhvtafitMzrN; Thu, 18 Apr 2024 14:08:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68EE1400FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68EE1400FF;
	Thu, 18 Apr 2024 14:08:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98EA41BF38A
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 14:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91C22400D0
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 14:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdY577cYtBqF for <buildroot@lists.busybox.net>;
 Thu, 18 Apr 2024 14:08:26 +0000 (UTC)
X-Greylist: delayed 1204 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 18 Apr 2024 14:08:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94315400AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94315400AE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.53.149;
 helo=2.mo560.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net
 [188.165.53.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94315400AE
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 14:08:25 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.139.16])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4VKzDg44lfz1MP9
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 13:30:43 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-qsftx (unknown [10.110.113.89])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 338FC1FEAC;
 Thu, 18 Apr 2024 13:30:43 +0000 (UTC)
Received: from armadeus.com ([37.59.142.96])
 by ghost-submission-6684bf9d7b-qsftx with ESMTPSA
 id mMI/CYMgIWatKgAA+KpgKg
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 18 Apr 2024 13:30:43 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Thu, 18 Apr 2024 15:30:35 +0200
Message-ID: <20240418133035.30749-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2342716233658395627
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudektddgieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeffueffgfevieffleetlefgteejffeuffeuhfffieekhfekgffhjeejueefudetgeenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001660e74f1-9c03-488d-810b-a83abba761d6,
 31C41825992BF42792DF6AF3D249BD517F6A2ED9)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself for Armadeus boards
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
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lA
YXJtYWRldXMuY29tPgotLS0KIERFVkVMT1BFUlMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXgg
Mzk5YjI5MzFmZjNkLi43YTFmYTQzZjRiMGQgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIv
REVWRUxPUEVSUwpAQCAtMjc3Nyw2ICsyNzc3LDggQEAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2Uvc2FtcGxlX251Lm51CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X251LnB5CiAKIE46CVPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tp
QGFybWFkZXVzLmNvbT4KK0Y6CWJvYXJkL2FybWFkZXVzLworRjoJY29uZmlncy9hcm1hZGV1cyoK
IEY6CXBhY2thZ2UvbW1jLXV0aWxzLwogRjoJcGFja2FnZS9weXRob24tZmxhc2stanNvbnJwYy8K
IEY6CXBhY2thZ2UvcHl0aG9uLWZsYXNrLWxvZ2luLwotLSAKMi40My4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
