Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEE4C433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 18:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2AC0418E3;
	Wed, 12 Oct 2022 18:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2AC0418E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XcV8Jx5RqZIT; Wed, 12 Oct 2022 18:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD0A2418CD;
	Wed, 12 Oct 2022 18:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD0A2418CD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A78F61BF5A8
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 18:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 904B5400DC
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 18:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 904B5400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJVSTTBqoDRm for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 18:22:51 +0000 (UTC)
X-Greylist: delayed 02:20:00 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 280FF400BF
Received: from 11.mo583.mail-out.ovh.net (11.mo583.mail-out.ovh.net
 [46.105.47.167])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 280FF400BF
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 18:22:51 +0000 (UTC)
Received: from player739.ha.ovh.net (unknown [10.110.171.125])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 5B13B25183
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 14:46:02 +0000 (UTC)
Received: from armadeus.com (lfbn-str-1-84-188.w92-140.abo.wanadoo.fr
 [92.140.211.188])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player739.ha.ovh.net (Postfix) with ESMTPSA id 663962B95216F;
 Wed, 12 Oct 2022 14:45:59 +0000 (UTC)
X-OVh-ClientIp: 92.140.211.188
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Wed, 12 Oct 2022 16:43:10 +0200
Message-Id: <20221012144310.28145-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 15215692816699157267
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejkedgkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeehvdfhtdehudekieeihfekjedvudevfedugfeuhffgjedufedtffeileffgedufeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsuhhilhgurhhoohhtrdhnvghtpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppeduvdejrddtrddtrddupdelvddrudegtddrvdduuddrudekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001fdfd87a2-ee11-4824-9634-b4103772822d,
 FE9F4EF6251822EA91E95D070B5353786FA8A9F2)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/mmc-utils: bump to version
 dfc3b6ecda84d21418fb4408b39c5c71db4c6458
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RHJvcCBmaXJzdCBwYXRjaCwgdXBzdHJlYW1lZDoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL3V0aWxzL21tYy9tbWMtdXRpbHMuZ2l0L2NvbW1pdC8/aWQ9NTIwZjU0ZWI5NDg0NWU1OTc4
MzdhZTkwOGEwM2I5MWFlOGM4NzU4ZgoKRml4ZXM6IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzLzAxZjc4MDgxYTUwNzQzZDFmYWE1MGEwOTBjMDBiN2U5MGExN2ZhMzkKClNp
Z25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFy
bWFkZXVzLmNvbT4KLS0tCiAuLi4wMS1tbWNfY21kcy5jLWZpeC1idWlsZC13aXRoLWdjYy00Ljku
cGF0Y2ggfCAzNyAtLS0tLS0tLS0tLS0tLS0tLS0tCiBwYWNrYWdlL21tYy11dGlscy9tbWMtdXRp
bHMuaGFzaCAgICAgICAgICAgICAgfCAgNCArLQogcGFja2FnZS9tbWMtdXRpbHMvbW1jLXV0aWxz
Lm1rICAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCA0MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21tYy11dGls
cy8wMDAxLW1tY19jbWRzLmMtZml4LWJ1aWxkLXdpdGgtZ2NjLTQuOS5wYXRjaAoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbW1jLXV0aWxzLzAwMDEtbW1jX2NtZHMuYy1maXgtYnVpbGQtd2l0aC1nY2Mt
NC45LnBhdGNoIGIvcGFja2FnZS9tbWMtdXRpbHMvMDAwMS1tbWNfY21kcy5jLWZpeC1idWlsZC13
aXRoLWdjYy00LjkucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDc3MjVmOWNh
NWUuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9tbWMtdXRpbHMvMDAwMS1tbWNfY21kcy5jLWZp
eC1idWlsZC13aXRoLWdjYy00LjkucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNyArMCwwIEBA
Ci1Gcm9tIDYyMDhjYzc4ZjZlZmQxZmFmYzRmNWJjNmE0ODcyNDdhMzgzZGY4MGYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCi1Gcm9tOiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNl
QGdtYWlsLmNvbT4KLURhdGU6IFNhdCwgMjggU2VwIDIwMTkgMjA6NDQ6NTIgKzAyMDAKLVN1Ympl
Y3Q6IFtQQVRDSF0gbW1jX2NtZHMuYzogZml4IGJ1aWxkIHdpdGggZ2NjIDQuOQotCi1GaXggZm9s
bG93aW5nIGVycm9yIHdpdGggZ2NjIDQuOToKLQotbW1jX2NtZHMuYzoxOTE4Ojk6IGVycm9yOiBt
aXNzaW5nIGJyYWNlcyBhcm91bmQgaW5pdGlhbGl6ZXIgWy1XZXJyb3I9bWlzc2luZy1icmFjZXNd
Ci0gIHN0cnVjdCBycG1iX2ZyYW1lIGZyYW1lX3N0YXR1cyA9IHswfTsKLQotRml4ZXM6Ci0gLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9iZjNiNmY5ZjZlZjM5Yjk5ODQy
YjNjOTI0OTViN2JmMzU5YzY4MTU4Ci0KLVNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUg
PGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgotW1Vwc3RyZWFtIHN0YXR1czogc2VudCB0byBs
aW51eC1tbWNAdmdlci5rZXJuZWwub3JnXQotLS0tCi0gbW1jX2NtZHMuYyB8IDQgKysrLQotIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdp
dCBhL21tY19jbWRzLmMgYi9tbWNfY21kcy5jCi1pbmRleCBmYjM3MTg5Li42YjA5ZjI2IDEwMDY0
NAotLS0tIGEvbW1jX2NtZHMuYwotKysrIGIvbW1jX2NtZHMuYwotQEAgLTE5MTUsNyArMTkxNSw5
IEBAIHN0YXRpYyBpbnQgZG9fcnBtYl9vcChpbnQgZmQsCi0gCXVfaW50MTZfdCBycG1iX3R5cGU7
Ci0gCXN0cnVjdCBtbWNfaW9jX211bHRpX2NtZCAqbWlvYzsKLSAJc3RydWN0IG1tY19pb2NfY21k
ICppb2M7Ci0tCXN0cnVjdCBycG1iX2ZyYW1lIGZyYW1lX3N0YXR1cyA9IHswfTsKLSsJc3RydWN0
IHJwbWJfZnJhbWUgZnJhbWVfc3RhdHVzOwotKwotKwltZW1zZXQoJmZyYW1lX3N0YXR1cywgMCwg
c2l6ZW9mKGZyYW1lX3N0YXR1cykpOwotIAotIAlpZiAoIWZyYW1lX2luIHx8ICFmcmFtZV9vdXQg
fHwgIW91dF9jbnQpCi0gCQlyZXR1cm4gLUVJTlZBTDsKLS0tIAotMi4yMy4wCi0KZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbW1jLXV0aWxzL21tYy11dGlscy5oYXNoIGIvcGFja2FnZS9tbWMtdXRpbHMv
bW1jLXV0aWxzLmhhc2gKaW5kZXggZThiMjgyNjYxMi4uMTI1NmY2MzQ4NyAxMDA2NDQKLS0tIGEv
cGFja2FnZS9tbWMtdXRpbHMvbW1jLXV0aWxzLmhhc2gKKysrIGIvcGFja2FnZS9tbWMtdXRpbHMv
bW1jLXV0aWxzLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY29tcHV0ZWQKLXNoYTI1
NiAgZmZjOGY3NzIzM2QxYmQzOWNlNGVjNjg4MzVhZDk0YWE2NzYyNjI0ZTRlOTZmYjYwMTAyZTg3
YmE4MmRiMDgzZSAgbW1jLXV0aWxzLWQ0MGVjNTM1YjlkNGU0Yzk3NGU4YzJmYmZiNDIyY2QwMzQ4
Y2M1ZTgtYnIxLnRhci5negotc2hhMjU2ICBjMzE2NTM5M2JjZDcxMDYyNGUyOTA5MzI3YTZmYmVi
NzM2YzQ3YmRiZTY2ZGUxYzFhMzY0YWM3MzI0ZDNlNGQ2ICBtbWMuaAorc2hhMjU2ICBmNmVkMWNi
MmYwMmQ0OWRmNDI0NGY4ODcyYjQ3YjIyNzgwZGQ2MzRmYTE5ZDg1NzI5OGNlMWI3OTM3NTI3NzZm
ICBtbWMtdXRpbHMtZGZjM2I2ZWNkYTg0ZDIxNDE4ZmI0NDA4YjM5YzVjNzFkYjRjNjQ1OC1icjEu
dGFyLmd6CitzaGEyNTYgIGY1N2UzYzYxNjkxMTZhYTlmZjA2ZWVjOTU3MzRjYTAwMGU0ZDAxOTY0
NjdiYjIyMWU4MGU1MDUzMGM3NjgwODEgIG1tYy5oCmRpZmYgLS1naXQgYS9wYWNrYWdlL21tYy11
dGlscy9tbWMtdXRpbHMubWsgYi9wYWNrYWdlL21tYy11dGlscy9tbWMtdXRpbHMubWsKaW5kZXgg
Yzg0NzM3ODY5Mi4uYmY5NDA5NjdlZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9tbWMtdXRpbHMvbW1j
LXV0aWxzLm1rCisrKyBiL3BhY2thZ2UvbW1jLXV0aWxzL21tYy11dGlscy5tawpAQCAtNCw3ICs0
LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLU1NQ19VVElMU19WRVJTSU9OID0g
ZDQwZWM1MzViOWQ0ZTRjOTc0ZThjMmZiZmI0MjJjZDAzNDhjYzVlOAorTU1DX1VUSUxTX1ZFUlNJ
T04gPSBkZmMzYjZlY2RhODRkMjE0MThmYjQ0MDhiMzljNWM3MWRiNGM2NDU4CiBNTUNfVVRJTFNf
U0lURSA9IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Nq
Yi9tbWMtdXRpbHMuZ2l0CiBNTUNfVVRJTFNfU0lURV9NRVRIT0QgPSBnaXQKIE1NQ19VVElMU19M
SUNFTlNFID0gR1BMLTIuMAotLSAKMi4zNy4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
