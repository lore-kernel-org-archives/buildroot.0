Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1572C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 07:31:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D1CD6137F
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 07:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D1CD6137F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0278D40377;
	Tue, 19 Oct 2021 07:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id geIwPWRc6qmO; Tue, 19 Oct 2021 07:31:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30329402DD;
	Tue, 19 Oct 2021 07:31:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E5C01BF5A6
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 07:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A03960B05
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 07:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NA148WYibMjN for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 07:31:40 +0000 (UTC)
X-Greylist: delayed 00:15:47 by SQLgrey-1.8.0
Received: from 8.mo582.mail-out.ovh.net (8.mo582.mail-out.ovh.net
 [178.33.42.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19B8460A35
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 07:31:40 +0000 (UTC)
Received: from player774.ha.ovh.net (unknown [10.110.208.144])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 40CDB2353C
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 07:15:50 +0000 (UTC)
Received: from armadeus.com (lfbn-str-1-222-18.w86-243.abo.wanadoo.fr
 [86.243.182.18])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player774.ha.ovh.net (Postfix) with ESMTPSA id 78A84237400C9;
 Tue, 19 Oct 2021 07:15:46 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00640ef951c-37bc-4fc1-b856-f6317d9e287d,
 B4556B2E88E414B87AB5E6F2D21E3CB4D1397D35)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 86.243.182.18
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 09:14:47 +0200
Message-Id: <20211019071447.20439-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8116893904883477483
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvuddgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpefhtdduleelheetjeffteekhedvueduvefhfefhudehteeigeeuheejffdujeeuveenucffohhmrghinhepuhgsuhhnthhurdgtohhmpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpkeeirddvgeefrddukedvrddukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: bump to version 0.13.05
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
YXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2Uvc3RyZXNzLW5nL0NvbmZpZy5pbiAgICAgIHwgMiAr
LQogcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLmhhc2ggfCAyICstCiBwYWNrYWdlL3N0cmVz
cy1uZy9zdHJlc3MtbmcubWsgICB8IDUgKystLS0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3RyZXNzLW5nL0Nv
bmZpZy5pbiBiL3BhY2thZ2Uvc3RyZXNzLW5nL0NvbmZpZy5pbgppbmRleCA2NGI0NzNiNzVjLi44
MzljYmIxY2MwIDEwMDY0NAotLS0gYS9wYWNrYWdlL3N0cmVzcy1uZy9Db25maWcuaW4KKysrIGIv
cGFja2FnZS9zdHJlc3MtbmcvQ29uZmlnLmluCkBAIC0xMiw3ICsxMiw3IEBAIGNvbmZpZyBCUjJf
UEFDS0FHRV9TVFJFU1NfTkcKIAkgIHN1YnN5c3RlbXMgb2YgYSBjb21wdXRlciBhcyB3ZWxsIGFz
IHRoZSB2YXJpb3VzIG9wZXJhdGluZwogCSAgc3lzdGVtIGtlcm5lbCBpbnRlcmZhY2VzLgogCi0J
ICBodHRwOi8va2VybmVsLnVidW50dS5jb20vfmNraW5nL3N0cmVzcy1uZy8KKwkgIGh0dHBzOi8v
Z2l0aHViLmNvbS9Db2xpbklhbktpbmcvc3RyZXNzLW5nCiAKIGNvbW1lbnQgInN0cmVzcy1uZyBu
ZWVkcyBhIHRvb2xjaGFpbiB3LyBoZWFkZXJzID49IDMuMyIKIAlkZXBlbmRzIG9uICFCUjJfbmlv
czIgJiYgIUJSMl9hcmMKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5o
YXNoIGIvcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLmhhc2gKaW5kZXggZjNlYjc2ZmE4Mi4u
M2FjZWQ2OWJiYyAxMDA2NDQKLS0tIGEvcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLmhhc2gK
KysrIGIvcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLmhhc2gKQEAgLTEsMyArMSwzIEBACiAj
IExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBmMzdmNzM5ZTRkMTUzNDMzNjBhNDc5ODBiNjdk
YzhiMmE2YmYzZDRkM2VmNzI3ZDU1ZTJkZDk5YTBiNjRmOWVhICBzdHJlc3MtbmctMC4xMy4wMS50
YXIueHoKK3NoYTI1NiAgM2RlNDllMTEwMDg2NjYzNGY1NDllOTljMTY0NDI4M2QwY2RlODE3Yjg0
NGE2OWRjZjdmODBhZmEyMjI3ZDM1MCAgc3RyZXNzLW5nLTAuMTMuMDUudGFyLnh6CiBzaGEyNTYg
IDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUy
MWI4ODA2NDMgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1u
Zy5tayBiL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5tawppbmRleCBlMGIzODVlNzU2Li4w
YjIyODdjN2ZiIDEwMDY0NAotLS0gYS9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcubWsKKysr
IGIvcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLm1rCkBAIC00LDkgKzQsOCBAQAogIwogIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotU1RSRVNTX05HX1ZFUlNJT04gPSAwLjEzLjAxCi1TVFJF
U1NfTkdfU09VUkNFID0gc3RyZXNzLW5nLSQoU1RSRVNTX05HX1ZFUlNJT04pLnRhci54egotU1RS
RVNTX05HX1NJVEUgPSBodHRwczovL2tlcm5lbC51YnVudHUuY29tL35ja2luZy90YXJiYWxscy9z
dHJlc3MtbmcKK1NUUkVTU19OR19WRVJTSU9OID0gMC4xMy4wNQorU1RSRVNTX05HX1NJVEUgPSAk
KGNhbGwgZ2l0aHViLENvbGluSWFuS2luZyxzdHJlc3MtbmcsViQoU1RSRVNTX05HX1ZFUlNJT04p
KQogU1RSRVNTX05HX0xJQ0VOU0UgPSBHUEwtMi4wKwogU1RSRVNTX05HX0xJQ0VOU0VfRklMRVMg
PSBDT1BZSU5HCiAKLS0gCjIuMzIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
