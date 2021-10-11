Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E451C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:04:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBE5760F3A
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBE5760F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 634EA40421;
	Mon, 11 Oct 2021 21:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CD841IB76amq; Mon, 11 Oct 2021 21:04:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0296404B9;
	Mon, 11 Oct 2021 21:04:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D956B1BF279
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C78C5608F2
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p7S3NjaqNTjB for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:04:13 +0000 (UTC)
X-Greylist: delayed 03:05:01 by SQLgrey-1.8.0
Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net
 [188.165.53.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF6C860903
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:04:13 +0000 (UTC)
Received: from player734.ha.ovh.net (unknown [10.109.156.62])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 442CB21180
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 17:14:18 +0000 (UTC)
Received: from armadeus.com (areims-651-1-268-65.w92-131.abo.wanadoo.fr
 [92.131.103.65])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 3805022F0A126;
 Mon, 11 Oct 2021 17:14:14 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0023b5d5a3e-eab6-4f1e-8597-8d4f4079a199,
 D241232BFA8FB54BA392F7EFFB6D138FCD87D671)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 92.131.103.65
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 19:13:14 +0200
Message-Id: <20211011171314.22564-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8136034205154470891
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtiedguddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeikedufefhjedvudefteffueevfffggeeukeegvddvheduieffvdfhhfduhfdvveenucffohhmrghinhepuhgsuhhnthhurdgtohhmnecukfhppedtrddtrddtrddtpdelvddrudefuddruddtfedrieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: bump to version 0.13.04
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lA
YXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoIHwgMiAr
LQogcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdl
L3N0cmVzcy1uZy9zdHJlc3MtbmcuaGFzaCBiL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5o
YXNoCmluZGV4IGYzZWI3NmZhODIuLjJmZGQ4OWE0OTEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc3Ry
ZXNzLW5nL3N0cmVzcy1uZy5oYXNoCisrKyBiL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5o
YXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgZjM3Zjcz
OWU0ZDE1MzQzMzYwYTQ3OTgwYjY3ZGM4YjJhNmJmM2Q0ZDNlZjcyN2Q1NWUyZGQ5OWEwYjY0Zjll
YSAgc3RyZXNzLW5nLTAuMTMuMDEudGFyLnh6CitzaGEyNTYgIDAyNzc5NDMwMzNmYzk3NTBhYTg2
OWIzZmExMDk2NjNmMzU0MGQyMzNhM2RkYzMwMGQzYTg2OWVjYmQ1NmY0NTEgIHN0cmVzcy1uZy0w
LjEzLjA0LnRhci54egogc2hhMjU2ICA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2
NzVhZmI1MTRkNGU2OGE0MDQwMTA1MjFiODgwNjQzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcubWsgYi9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3Mtbmcu
bWsKaW5kZXggZTBiMzg1ZTc1Ni4uYjhmN2NlOTU2YiAxMDA2NDQKLS0tIGEvcGFja2FnZS9zdHJl
c3Mtbmcvc3RyZXNzLW5nLm1rCisrKyBiL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5tawpA
QCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVNUUkVTU19OR19W
RVJTSU9OID0gMC4xMy4wMQorU1RSRVNTX05HX1ZFUlNJT04gPSAwLjEzLjA0CiBTVFJFU1NfTkdf
U09VUkNFID0gc3RyZXNzLW5nLSQoU1RSRVNTX05HX1ZFUlNJT04pLnRhci54egogU1RSRVNTX05H
X1NJVEUgPSBodHRwczovL2tlcm5lbC51YnVudHUuY29tL35ja2luZy90YXJiYWxscy9zdHJlc3Mt
bmcKIFNUUkVTU19OR19MSUNFTlNFID0gR1BMLTIuMCsKLS0gCjIuMzIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
