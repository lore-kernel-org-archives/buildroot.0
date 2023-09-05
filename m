Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC6CC83F33
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 11:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B9A940C2E;
	Tue,  5 Sep 2023 11:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B9A940C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9TECj4ARV9gc; Tue,  5 Sep 2023 11:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8D20404F1;
	Tue,  5 Sep 2023 11:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8D20404F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D003C1BF2B4
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 11:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4F3E4161D
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 11:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4F3E4161D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Gssxup1wAZT for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 11:30:48 +0000 (UTC)
X-Greylist: delayed 4047 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 05 Sep 2023 11:30:48 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1351F4096E
Received: from 3.mo560.mail-out.ovh.net (3.mo560.mail-out.ovh.net
 [46.105.58.226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1351F4096E
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 11:30:48 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.16.135])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 20B792A681
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 08:57:03 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-n8th5 (unknown [10.110.103.114])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 73F181FE9E;
 Tue,  5 Sep 2023 08:57:03 +0000 (UTC)
Received: from armadeus.com ([37.59.142.102])
 by ghost-submission-6684bf9d7b-n8th5 with ESMTPSA
 id lKBRGV/t9mRPOgAAq3vviA
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 05 Sep 2023 08:57:03 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 10:56:40 +0200
Message-ID: <20230905085640.7040-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17104389913034681323
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudehtddgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepfeeuteetvdffledtgfetudehtdehveejleetvedvudffjeehleehheehjedtgedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpiihlihgsrdhnvghtnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00468ec8dac-69d4-4342-8fee-29681c518912,
 ECF8027A8A911A1F2FD58B4409DDBC4678CF96FF)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/libzlib: bump to version 1.3
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

aHR0cHM6Ly9naXRodWIuY29tL21hZGxlci96bGliL3JlbGVhc2VzL3RhZy92MS4zCgpTaWduZWQt
b2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1
cy5jb20+Ci0tLQoKdGVzdC1wZ2sncyByZXN1bHRzIHdpdGggQlIyX1BBQ0tBR0VfWkxJQj15IGFu
ZCBCUjJfUEFDS0FHRV9MSUJaTElCPXkgOgoKICAgICAgICAgICAgICAgICAgICBib290bGluLWFy
bXY1LXVjbGliYyBbMS82XTogT0sKICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1hcm12Ny1n
bGliYyBbMi82XTogT0sKICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjdtLXVjbGliYyBb
My82XTogT0sKICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi14ODYtNjQtbXVzbCBbNC82XTog
T0sKICAgICAgICAgICAgICAgICAgICAgIGJyLWFybS1mdWxsLXN0YXRpYyBbNS82XTogT0sKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHNvdXJjZXJ5LWFybSBbNi82XTogT0sKNiBidWlsZHMs
IDAgc2tpcHBlZCwgMCBidWlsZCBmYWlsZWQsIDAgbGVnYWwtaW5mbyBmYWlsZWQsIDAgc2hvdy1p
bmZvIGZhaWxlZAoKIHBhY2thZ2UvbGliemxpYi9saWJ6bGliLmhhc2ggfCAyICstCiBwYWNrYWdl
L2xpYnpsaWIvbGliemxpYi5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ6bGliL2xpYnps
aWIuaGFzaCBiL3BhY2thZ2UvbGliemxpYi9saWJ6bGliLmhhc2gKaW5kZXggZGY1ZThkNzIzYTEy
Li4yM2JmZGE4NDc0OWYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGliemxpYi9saWJ6bGliLmhhc2gK
KysrIGIvcGFja2FnZS9saWJ6bGliL2xpYnpsaWIuaGFzaApAQCAtMSw0ICsxLDQgQEAKICMgRnJv
bSBodHRwOi8vd3d3LnpsaWIubmV0Lwotc2hhMjU2ICBkMTRjMzhlMzEzYWZjMzVhOWE4NzYwZGFk
ZjI2MDQyZjUxZWEwZjVkMTU0YjA2MzBhMzFkYTA1NDAxMDdmYjk4ICB6bGliLTEuMi4xMy50YXIu
eHoKK3NoYTI1NiAgOGE5YmEyODk4ZTFkMGQ3NzRlY2E2YmE1YjQ2MjdhMTFlNTU4OGJhODVjODg1
MTMzNmViMzhkZTQ2ODMwNTBhNyAgemxpYi0xLjMudGFyLnh6CiAjIExpY2Vuc2UgZmlsZXMsIGxv
Y2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICA4NDVlZmM3Nzg1N2Q0ODVkOTFmYjNlMGI4ODRhYWE5
MjkzNjhjNzE3YWU4MTg2YjY2ZmUxZWQyNDk1NzUzMjQzICBMSUNFTlNFCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpYnpsaWIvbGliemxpYi5tayBiL3BhY2thZ2UvbGliemxpYi9saWJ6bGliLm1rCmlu
ZGV4IGUzNDRjYzdhZDljMS4uZGE0NTJhZjhlOWVjIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYnps
aWIvbGliemxpYi5taworKysgYi9wYWNrYWdlL2xpYnpsaWIvbGliemxpYi5tawpAQCAtNCw3ICs0
LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxJQlpMSUJfVkVSU0lPTiA9IDEu
Mi4xMworTElCWkxJQl9WRVJTSU9OID0gMS4zCiBMSUJaTElCX1NPVVJDRSA9IHpsaWItJChMSUJa
TElCX1ZFUlNJT04pLnRhci54egogTElCWkxJQl9TSVRFID0gaHR0cDovL3d3dy56bGliLm5ldAog
TElCWkxJQl9MSUNFTlNFID0gWmxpYgotLSAKMi40MS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
