Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93419C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 09:13:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 956E061056
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 09:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 956E061056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43DEF80CFB;
	Wed, 27 Oct 2021 09:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCXg1Fbn3cdP; Wed, 27 Oct 2021 09:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1A4780C6E;
	Wed, 27 Oct 2021 09:13:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66FF71BF5B5
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 09:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 559376060F
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 09:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wplsoZYUoce for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 09:13:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from 17.mo582.mail-out.ovh.net (17.mo582.mail-out.ovh.net
 [46.105.36.150])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29175605D4
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 09:13:48 +0000 (UTC)
Received: from player797.ha.ovh.net (unknown [10.110.115.67])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 983DF23192
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 08:36:09 +0000 (UTC)
Received: from armadeus.com (lfbn-str-1-222-18.w86-243.abo.wanadoo.fr
 [86.243.182.18])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player797.ha.ovh.net (Postfix) with ESMTPSA id B0EE61F979D17;
 Wed, 27 Oct 2021 08:36:05 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002dd284f95-c06c-40f5-831a-072a80f1771e,
 2DC2F88F4F03E9DE538956C85056AC2B22471AB1)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 86.243.182.18
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 10:35:02 +0200
Message-Id: <20211027083502.5530-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1114640907831995371
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhephfdtudelleehteejffetkeehvdeuudevhfefhfduheetieegueehjeffudejueevnecuffhomhgrihhnpehusghunhhtuhdrtghomhdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdekiedrvdegfedrudekvddrudeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeljedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: [Buildroot] [PATCH v2 1/1] package/stress-ng: bump to version
 0.13.05
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

VGhlIHByb2plY3QgVVJMIHJldHVybnMgNDA0IGVycm9yIGJlY2F1c2U6CgpRdW90aW5nIENvbGlu
ZyBLaW5nOgoiVW5mb3J0dW5hdGVseSB3aGVuIEkgbGVmdCBDYW5vbmljYWwgbGFzdCB3ZWVrIHRo
ZXkgcmVtb3ZlZCBteSB0YXJiYWxscyIKClNvIHVzZSBnaXRodWIgYW5kIHVwZGF0ZSBoYXNoLgoK
U2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lA
YXJtYWRldXMuY29tPgotLS0KCkNoYW5nZXMgZm9yIHYyOgogLSBmaXggdGFyYmFsbCBuYW1lIGlu
IC5oYXNoIGZpbGUKCiBwYWNrYWdlL3N0cmVzcy1uZy9Db25maWcuaW4gICAgICB8IDIgKy0KIHBh
Y2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoIHwgMiArLQogcGFja2FnZS9zdHJlc3Mtbmcv
c3RyZXNzLW5nLm1rICAgfCA1ICsrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N0cmVzcy1uZy9Db25maWcu
aW4gYi9wYWNrYWdlL3N0cmVzcy1uZy9Db25maWcuaW4KaW5kZXggNjRiNDczYjc1Yy4uODM5Y2Ji
MWNjMCAxMDA2NDQKLS0tIGEvcGFja2FnZS9zdHJlc3MtbmcvQ29uZmlnLmluCisrKyBiL3BhY2th
Z2Uvc3RyZXNzLW5nL0NvbmZpZy5pbgpAQCAtMTIsNyArMTIsNyBAQCBjb25maWcgQlIyX1BBQ0tB
R0VfU1RSRVNTX05HCiAJICBzdWJzeXN0ZW1zIG9mIGEgY29tcHV0ZXIgYXMgd2VsbCBhcyB0aGUg
dmFyaW91cyBvcGVyYXRpbmcKIAkgIHN5c3RlbSBrZXJuZWwgaW50ZXJmYWNlcy4KIAotCSAgaHR0
cDovL2tlcm5lbC51YnVudHUuY29tL35ja2luZy9zdHJlc3MtbmcvCisJICBodHRwczovL2dpdGh1
Yi5jb20vQ29saW5JYW5LaW5nL3N0cmVzcy1uZwogCiBjb21tZW50ICJzdHJlc3MtbmcgbmVlZHMg
YSB0b29sY2hhaW4gdy8gaGVhZGVycyA+PSAzLjMiCiAJZGVwZW5kcyBvbiAhQlIyX25pb3MyICYm
ICFCUjJfYXJjCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcuaGFzaCBi
L3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoCmluZGV4IGYzZWI3NmZhODIuLjJlM2Y5
OTg3NjkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoCisrKyBi
L3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2Nh
bGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgZjM3ZjczOWU0ZDE1MzQzMzYwYTQ3OTgwYjY3ZGM4YjJh
NmJmM2Q0ZDNlZjcyN2Q1NWUyZGQ5OWEwYjY0ZjllYSAgc3RyZXNzLW5nLTAuMTMuMDEudGFyLnh6
CitzaGEyNTYgIDNkZTQ5ZTExMDA4NjY2MzRmNTQ5ZTk5YzE2NDQyODNkMGNkZTgxN2I4NDRhNjlk
Y2Y3ZjgwYWZhMjIyN2QzNTAgIHN0cmVzcy1uZy0wLjEzLjA1LnRhci5negogc2hhMjU2ICA4MTc3
Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQwMTA1MjFiODgw
NjQzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcubWsg
Yi9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcubWsKaW5kZXggZTBiMzg1ZTc1Ni4uMGIyMjg3
YzdmYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLm1rCisrKyBiL3Bh
Y2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5tawpAQCAtNCw5ICs0LDggQEAKICMKICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCiAKLVNUUkVTU19OR19WRVJTSU9OID0gMC4xMy4wMQotU1RSRVNTX05H
X1NPVVJDRSA9IHN0cmVzcy1uZy0kKFNUUkVTU19OR19WRVJTSU9OKS50YXIueHoKLVNUUkVTU19O
R19TSVRFID0gaHR0cHM6Ly9rZXJuZWwudWJ1bnR1LmNvbS9+Y2tpbmcvdGFyYmFsbHMvc3RyZXNz
LW5nCitTVFJFU1NfTkdfVkVSU0lPTiA9IDAuMTMuMDUKK1NUUkVTU19OR19TSVRFID0gJChjYWxs
IGdpdGh1YixDb2xpbklhbktpbmcsc3RyZXNzLW5nLFYkKFNUUkVTU19OR19WRVJTSU9OKSkKIFNU
UkVTU19OR19MSUNFTlNFID0gR1BMLTIuMCsKIFNUUkVTU19OR19MSUNFTlNFX0ZJTEVTID0gQ09Q
WUlORwogCi0tIAoyLjMyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
