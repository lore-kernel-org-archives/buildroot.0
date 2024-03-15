Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8427C54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 18:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D43560F37;
	Fri, 15 Mar 2024 18:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i7mZL72QR-Ip; Fri, 15 Mar 2024 18:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5418960F3A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5418960F3A;
	Fri, 15 Mar 2024 18:00:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E08B91BF2F0
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 18:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCD6B60F25
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 18:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMpNVkOxaEEt for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 18:00:39 +0000 (UTC)
X-Greylist: delayed 1799 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 15 Mar 2024 18:00:38 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2466E60F48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2466E60F48
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=87.98.139.208;
 helo=16.mo582.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 16.mo582.mail-out.ovh.net (16.mo582.mail-out.ovh.net
 [87.98.139.208])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2466E60F48
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 18:00:38 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.140.34])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4TxB202m1lz1HFt
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 17:24:24 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-llb2t (unknown [10.110.178.109])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E971C1FE99;
 Fri, 15 Mar 2024 17:24:23 +0000 (UTC)
Received: from armadeus.com ([37.59.142.96])
 by ghost-submission-6684bf9d7b-llb2t with ESMTPSA
 id Yj5CNEeE9GUofwEAtblo1w
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Fri, 15 Mar 2024 17:24:23 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 18:24:16 +0100
Message-ID: <20240315172416.29862-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9531868611576589291
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrjeelgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepueejhfekteelueelfffhleevjeeuuedtieetleetvddvhedvjeeiveffgefhtedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001ac2c2aac-8904-43cb-9052-72b62c829595,
 FE7737175D47A8C08FE60349033B39621578489C)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: bump version to 2.6
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lA
YXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFzaCB8IDIgKy0K
IHBhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnQt
dGVzdHMvcnQtdGVzdHMuaGFzaCBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFzaAppbmRl
eCBlYjI4ZjRkNDQxYTYuLjAxNzQ0N2JjZTY2NSAxMDA2NDQKLS0tIGEvcGFja2FnZS9ydC10ZXN0
cy9ydC10ZXN0cy5oYXNoCisrKyBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFzaApAQCAt
MSw0ICsxLDQgQEAKICMgRnJvbSBodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9s
aW51eC91dGlscy9ydC10ZXN0cy9zaGEyNTZzdW1zLmFzYwotc2hhMjU2ICAyZWQyZTRjOTY1Yzdm
MzM2YTE1ZDMzNTRkZWMwOTBlMjdhMGIxZTlhZGE5MWFlMGI5ZWYxOGJiY2I5OTM4NzRlICBydC10
ZXN0cy0yLjUudGFyLnh6CitzaGEyNTYgIDc2MWQxMGM0YjdmNWIyODQwMGYwYzMwMWZlMDE3MWVh
YTc0ZjM0N2RmNjRjYjM1OTIxMDI1NGI4ZTZhZmYxOWYgIHJ0LXRlc3RzLTIuNi50YXIueHoKICMg
bG9jYWxseSBjb21wdXRlZCBoYXNoCiBzaGEyNTYgIGFiMTVmZDUyNmJkOGRkMThhOWU3N2ViYzEz
OTY1NmJmNGQzM2U5N2ZjNzIzOGNkMTFiZjYwZTJiOWI4NjY2YzYgIENPUFlJTkcKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMubWsgYi9wYWNrYWdlL3J0LXRlc3RzL3J0LXRl
c3RzLm1rCmluZGV4IDhhZDQyMTVlZTE5Mi4uNGIxYWEzMTc5NjQ3IDEwMDY0NAotLS0gYS9wYWNr
YWdlL3J0LXRlc3RzL3J0LXRlc3RzLm1rCisrKyBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMu
bWsKQEAgLTYsNyArNiw3IEBACiAKIFJUX1RFU1RTX1NJVEUgPSAkKEJSMl9LRVJORUxfTUlSUk9S
KS9saW51eC91dGlscy9ydC10ZXN0cwogUlRfVEVTVFNfU09VUkNFID0gcnQtdGVzdHMtJChSVF9U
RVNUU19WRVJTSU9OKS50YXIueHoKLVJUX1RFU1RTX1ZFUlNJT04gPSAyLjUKK1JUX1RFU1RTX1ZF
UlNJT04gPSAyLjYKIFJUX1RFU1RTX0xJQ0VOU0UgPSBHUEwtMi4wKwogUlRfVEVTVFNfTElDRU5T
RV9GSUxFUyA9IENPUFlJTkcKIAotLSAKMi40My4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
