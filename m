Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB28EC0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 15:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6784840086;
	Fri, 31 Jan 2025 15:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sScHnj1oYS2; Fri, 31 Jan 2025 15:01:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9D5E401E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9D5E401E3;
	Fri, 31 Jan 2025 15:01:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9455616E
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 15:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 838B760821
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 15:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1oSkxvfnkMUA for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 15:01:18 +0000 (UTC)
X-Greylist: delayed 3747 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 31 Jan 2025 15:01:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4388E605A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4388E605A8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.56.132;
 helo=17.mo583.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 17.mo583.mail-out.ovh.net (17.mo583.mail-out.ovh.net
 [46.105.56.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4388E605A8
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 15:01:15 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.148.49])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4YkwHF1qQYz1Frc
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 12:31:21 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-tvvqh (unknown [10.110.164.228])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DA0311FE5C;
 Fri, 31 Jan 2025 12:31:18 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
 by ghost-submission-5b5ff79f4f-tvvqh with ESMTPSA
 id UoMXHZbCnGdTPAEAkO+b4w
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Fri, 31 Jan 2025 12:31:18 +0000
X-OVh-ClientIp: 176.158.98.230
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 31 Jan 2025 13:30:58 +0100
MIME-Version: 1.0
Message-Id: <20250131-add-wlr-randr-package-v2-1-7ea1a44b5b7e@armadeus.com>
X-B4-Tracking: v=1; b=H4sIAIHCnGcC/4WNQQ6CMBBFr0Jm7RimhKKuvIdhMWkHaZRCpooaw
 t2tXMDl+/n//QWSaJAEp2IBlTmkMMYMZleA6zleBYPPDKY0dUnUIHuPr7uicvSKE7sb5xJ7S82
 BiCs2kLeTShfem/fSZu5Deoz62W5m+qX/jDMhYWkqcxRbu8Z2Z9aBvTzT3o0DtOu6fgGy6oGXv
 QAAAA==
X-Change-ID: 20250117-add-wlr-randr-package-ad617811a3a2
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 14022238915843124085
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeevfffhfffhvddtkeetteffjeevgefgtddvleffjeehhfdvjeeutdetkeekfeefgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhsrhdrhhhtnecukfhppeduvdejrddtrddtrddupddujeeirdduheekrdelkedrvdeftddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkeefmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=FA6aFvxmBhhP7AkA/GN8pk0kyOcJqg3av3VIfygTmII=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738326681; v=1;
 b=nFcMbLIr5up+5Lr2p7usx/rd2zXbwPU/tQMVda56q5Ex9dQNPiurGMlKrfL51fr0o4Opl6Oc
 zrjE6/ntjbtc170jOG7QGswMbxP94eCNmux5ykzUvDz1ppUQpF6rzv6qa/Wr4FFBdqW8qPUbm+g
 04CHFPJMJk+nYnFeIBeWzXS7MyTbNg74g0EdAKLDgXDSA00csV+FlCCX/QkXzfIjhJXxaPKO/CZ
 2MBI7hwBC8czvslOwbfHnk1KQH7lNbGkpsthvJo3vBAtDar6sSW6CbTRGhNUt4D5WrbmC4eUxVS
 x2iMFetuFbdSa2sMXR6XQLsDUkrHDAUcWKCASZF75pn4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=nFcMbLIr
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0020c2c12dd-3ed1-4890-8dbc-1d62f276a5ea,
 A753F2F03190AFFFA0B706D5F1E8190A5B9835AD)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH v2] package/wlr-randr: new package
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXRpbGl0eSB0byBtYW5hZ2Ugb3V0cHV0cyBvZiBhIFdheWxhbmQgY29tcG9zaXRvci4KClRlc3Rl
ZC1ieTogRmlvbmEgS2x1dGUgKFdJV0EpIDxmaW9uYS5rbHV0ZUBnbXguZGU+ClNpZ25lZC1vZmYt
Ynk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNv
bT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gRURJVE1FOiBkZXNjcmliZSB3aGF0IGlzIG5ldyBpbiB0
aGlzIHNlcmllcyByZXZpc2lvbi4KLSBFRElUTUU6IHVzZSBidWxsZXRwb2ludHMgYW5kIHRlcnNl
IGRlc2NyaXB0aW9ucy4KLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjUwMTE3LWFkZC13bHItcmFuZHItcGFja2FnZS12MS0xLTAyMzI5ZTY1Yzc2ZkBhcm1hZGV1cy5j
b20KLS0tCkNoYW5nZXMgaW4gdjI6CiAtIE1vdmUgdGhlIHBhY2thZ2UgdG8gIkdyYXBoaWMgbGli
cmFyaWVzIGFuZCBhcHBsaWNhdGlvbnMKICAgKGdyYXBoaWMvdGV4dCkiLgogLSBMaW5rIHRvIHYx
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMTE3LWFkZC13bHItcmFuZHItcGFja2Fn
ZS12MS0xLTAyMzI5ZTY1Yzc2ZkBhcm1hZGV1cy5jb20KLS0tCiBERVZFTE9QRVJTICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwg
IDEgKwogcGFja2FnZS93bHItcmFuZHIvQ29uZmlnLmluICAgICAgfCAgNyArKysrKysrCiBwYWNr
YWdlL3dsci1yYW5kci93bHItcmFuZHIuaGFzaCB8ICA1ICsrKysrCiBwYWNrYWdlL3dsci1yYW5k
ci93bHItcmFuZHIubWsgICB8IDE0ICsrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDI4
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRl
eCAyZDhhZTgyODliNzZhMzIyMDlhZWNhYTNmZTU3NWExNWM0YTg3YTczLi4xMjkyNzkwZWM2MDBh
YzY1Y2EyZmM1NjljMGZkZjNkMDc4ZDlkZjZlIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBi
L0RFVkVMT1BFUlMKQEAgLTI5MjQsNiArMjkyNCw3IEBAIEY6CWNvbmZpZ3MvYXJtYWRldXMqCiBG
OglwYWNrYWdlL21tYy11dGlscy8KIEY6CXBhY2thZ2UvcHl0aG9uLWZsYXNrLWpzb25ycGMvCiBG
OglwYWNrYWdlL3B5dGhvbi1mbGFzay1sb2dpbi8KK0Y6CXBhY2thZ2Uvd2xyLXJhbmRyLwogRjoJ
cGFja2FnZS9xdDUvcXQ1Y2hhcnRzLwogCiBOOglTZW15b24gS29sZ2Fub3YgPHNlbWVuYWs5NEBt
YWlsLnJ1PgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5p
bgppbmRleCA0MDAxODM1MTZlNjU5ZWM5OGNhY2MwMWQ5MzllYjk2ZWU3MTVhYjJkLi45MTBhOGYw
YjkxYmFhNGYxNzQxMjI0NTRjMTI1NjEzZDA1N2YwODY3IDEwMDY0NAotLS0gYS9wYWNrYWdlL0Nv
bmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMzQxLDYgKzM0MSw3IEBAIGNvbW1l
bnQgIkdyYXBoaWMgYXBwbGljYXRpb25zIgogCXNvdXJjZSAicGFja2FnZS9zd2F5YmcvQ29uZmln
LmluIgogCXNvdXJjZSAicGFja2FnZS90ZXNzZXJhY3Qtb2NyL0NvbmZpZy5pbiIKIAlzb3VyY2Ug
InBhY2thZ2UvdGluaWZpZXIvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS93bHItcmFuZHIv
Q29uZmlnLmluIgogCiBjb21tZW50ICJHcmFwaGljIGxpYnJhcmllcyIKIAlzb3VyY2UgInBhY2th
Z2UvY2VndWkvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS93bHItcmFuZHIvQ29uZmln
LmluIGIvcGFja2FnZS93bHItcmFuZHIvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjQ1NmM4NDU0OWI2
NTk3ZjU1MTZlODFhMjNmNGRhOTMyOTExOWNiODgKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdl
L3dsci1yYW5kci9Db25maWcuaW4KQEAgLTAsMCArMSw3IEBACitjb25maWcgQlIyX1BBQ0tBR0Vf
V0xSX1JBTkRSCisJYm9vbCAid2xyLXJhbmRyIgorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfV0FZ
TEFORCAjIHdheWxhbmQtY2xpZW50CisJaGVscAorCSAgVXRpbGl0eSB0byBtYW5hZ2Ugb3V0cHV0
cyBvZiBhIFdheWxhbmQgY29tcG9zaXRvci4KKworCSAgaHR0cHM6Ly9naXQuc3IuaHQvfmVtZXJz
aW9uL3dsci1yYW5kcgpkaWZmIC0tZ2l0IGEvcGFja2FnZS93bHItcmFuZHIvd2xyLXJhbmRyLmhh
c2ggYi9wYWNrYWdlL3dsci1yYW5kci93bHItcmFuZHIuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi44MGNmZGUw
NjMzODM2ZTRlZmZhMmQ1MmI0MTc3MzFhOTM3NDYzYWIyCi0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS93bHItcmFuZHIvd2xyLXJhbmRyLmhhc2gKQEAgLTAsMCArMSw1IEBACisjIEhhc2ggZnJv
bSBodHRwczovL2dpdC5zci5odC9+ZW1lcnNpb24vd2xyLXJhbmRyL3JlZnMvdjAuNC4xCitzaGEy
NTYgIGZkNTc4MzAwMmMxM2QzNzI2Nzg5OGU1NzFmMDNiNjE4MzYzZDEzOTUyYTI2NGNmM2Q2MWEz
NTM4Mzg2OWQ2MzEgIHdsci1yYW5kci0wLjQuMS50YXIuZ3oKKworIyBIYXNoIGZvciBsaWNlbnNl
IGZpbGVzOgorc2hhMjU2ICA3ZjNlODQ0YTU1MGRhNzRkNWYwYTYzNWFlMTI2M2NiN2RhZmRhN2Jk
MTVhYzM3MzY0ZGRkZTg1ZGU4M2E3OGM3ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3ds
ci1yYW5kci93bHItcmFuZHIubWsgYi9wYWNrYWdlL3dsci1yYW5kci93bHItcmFuZHIubWsKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMC4uMjI3OWUyMjkyNjhlM2Y1OTI4NTAyZTJmNTkxNjUyZGIxZWIxZWI0NQotLS0gL2Rl
di9udWxsCisrKyBiL3BhY2thZ2Uvd2xyLXJhbmRyL3dsci1yYW5kci5tawpAQCAtMCwwICsxLDE0
IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyB3bHItcmFuZHIKKyMKKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCisKK1dMUl9SQU5EUl9WRVJTSU9OID0gMC40LjEKK1dMUl9SQU5EUl9T
SVRFID0gaHR0cHM6Ly9naXQuc3IuaHQvfmVtZXJzaW9uL3dsci1yYW5kci9yZWZzL2Rvd25sb2Fk
L3YkKFdMUl9SQU5EUl9WRVJTSU9OKQorV0xSX1JBTkRSX0xJQ0VOU0UgPSBNSVQKK1dMUl9SQU5E
Ul9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQorIyBob3N0LXdheWxhbmQgaXMgZm9yIHdheWxhbmQt
c2Nhbm5lcgorV0xSX1JBTkRSX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBob3N0LXdheWxh
bmQgd2F5bGFuZAorCiskKGV2YWwgJChtZXNvbi1wYWNrYWdlKSkKCi0tLQpiYXNlLWNvbW1pdDog
Y2ZlMGU5NDViMzBlYzYxZWRkYzZiOGVhNTcyMTE4NjMwY2ZkMWNiMQpjaGFuZ2UtaWQ6IDIwMjUw
MTE3LWFkZC13bHItcmFuZHItcGFja2FnZS1hZDYxNzgxMWEzYTIKCkJlc3QgcmVnYXJkcywKLS0g
ClPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
