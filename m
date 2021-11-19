Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C648C433EF
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 09:19:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76D4761AFD
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 09:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76D4761AFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3E8140649;
	Fri, 19 Nov 2021 09:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6AbPpZPV2Ag; Fri, 19 Nov 2021 09:19:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 299CD4063E;
	Fri, 19 Nov 2021 09:19:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DCB81BF232
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 09:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CFC281751
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 09:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id anTg6oJ32Dgs for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 09:19:12 +0000 (UTC)
X-Greylist: delayed 00:09:58 by SQLgrey-1.8.0
Received: from 8.mo560.mail-out.ovh.net (8.mo560.mail-out.ovh.net
 [188.165.52.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C32E081076
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 09:19:12 +0000 (UTC)
Received: from player755.ha.ovh.net (unknown [10.110.208.44])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 77A9123EA6
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 09:00:19 +0000 (UTC)
Received: from armadeus.com (areims-654-1-107-29.w92-131.abo.wanadoo.fr
 [92.131.114.29])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player755.ha.ovh.net (Postfix) with ESMTPSA id 8986B2484BBD3;
 Fri, 19 Nov 2021 09:00:17 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001d8052bc6-b738-4bb5-b17a-208f72005022,
 CDD263498765534C212E1D53D85F77474BF15E05)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.131.114.29
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Fri, 19 Nov 2021 09:59:02 +0100
Message-Id: <20211119085902.14877-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7467531135940750315
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdduvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeikeduhfejgeelveduhfegveelhfegvddukeejiefggfefffehuefglefhieeuteenucffohhmrghinhepphgtrhgvrdhorhhgpdhsohhurhgtvghfohhrghgvrdhnvghtnecukfhppedtrddtrddtrddtpdelvddrudefuddruddugedrvdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejheehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] [PATCH 1/1] package/pcre: fix broken URL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXMgc3RhdGVkIG9uIHd3dy5wY3JlLm9yZzoKIk5vdGUgdGhhdCB0aGUgZm9ybWVyIGZ0cC5wY3Jl
Lm9yZyBGVFAgc2l0ZSBpcyBubyBsb25nZXIgYXZhaWxhYmxlLiIKClVwZGF0ZSBfU0lURSBVUkwg
dG8gU291cmNlZm9yZ2UuCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2Vi
YXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQogcGFja2FnZS9wY3JlL3BjcmUubWsg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3BjcmUvcGNyZS5tayBiL3BhY2thZ2UvcGNyZS9wY3JlLm1rCmlu
ZGV4IDI2NGVhYTEwYzcuLmM4NWY2NzE3ZGIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcGNyZS9wY3Jl
Lm1rCisrKyBiL3BhY2thZ2UvcGNyZS9wY3JlLm1rCkBAIC01LDcgKzUsNyBAQAogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAogUENSRV9WRVJTSU9OID0gOC40NQotUENSRV9TSVRFID0gaHR0cHM6
Ly9mdHAucGNyZS5vcmcvcHViL3BjcmUKK1BDUkVfU0lURSA9IGh0dHA6Ly9kb3dubG9hZHMuc291
cmNlZm9yZ2UubmV0L3Byb2plY3QvcGNyZS9wY3JlLyQoUENSRV9WRVJTSU9OKQogUENSRV9TT1VS
Q0UgPSBwY3JlLSQoUENSRV9WRVJTSU9OKS50YXIuYnoyCiBQQ1JFX0xJQ0VOU0UgPSBCU0QtMy1D
bGF1c2UKIFBDUkVfTElDRU5TRV9GSUxFUyA9IExJQ0VOQ0UKLS0gCjIuMzIuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
