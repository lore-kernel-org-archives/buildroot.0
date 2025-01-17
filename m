Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591F8C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 22:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D05B84CE2;
	Fri, 17 Jan 2025 22:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5ZK0VRus0mD; Fri, 17 Jan 2025 22:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2A3B84CDE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2A3B84CDE;
	Fri, 17 Jan 2025 22:36:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F420F94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 22:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF57642979
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 22:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dU6_Av2xxiMG for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 22:36:14 +0000 (UTC)
X-Greylist: delayed 599 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 17 Jan 2025 22:36:12 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F002E429AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F002E429AC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.40.108;
 helo=3.mo583.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 3.mo583.mail-out.ovh.net (3.mo583.mail-out.ovh.net
 [46.105.40.108])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F002E429AC
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 22:36:12 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.140.166])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4YZYwk3DHkz1RNx
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 22:16:22 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-xcbmk (unknown [10.110.188.136])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 31CFA1FD2D;
 Fri, 17 Jan 2025 22:16:22 +0000 (UTC)
Received: from armadeus.com ([37.59.142.103])
 by ghost-submission-5b5ff79f4f-xcbmk with ESMTPSA
 id tGZEA7bWimedFwAA2bCKiA
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Fri, 17 Jan 2025 22:16:22 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 17 Jan 2025 23:16:18 +0100
MIME-Version: 1.0
Message-Id: <20250117-add-wlr-randr-package-v1-1-02329e65c76f@armadeus.com>
X-B4-Tracking: v=1; b=H4sIALHWimcC/x2MQQqDQAwAvyI5G9is2JV+pXgIJq1B2UoWWkH8u
 4vHgZk5oKibFng2B7j+rNg3V6C2gWnm/FE0qQwxxD4QJWQR/K+OzlkcN54WrhLLg9JAxB1HqO3
 m+rb9/r7G87wA8E19tmcAAAA=
X-Change-ID: 20250117-add-wlr-randr-package-ad617811a3a2
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 15471553572895648747
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrudeifedgudehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfefueffgfekudefveehffetteevtdejkedujefgvdegjeehteevhedvieelffenucffohhmrghinhepshhrrdhhthenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkeefmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=NnwW399fWEPf5aKy3UC0aJvBqzn/V2iGj5LnRh+yWGI=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1737152182; v=1;
 b=HFxXJkq3CLLzwx98PQrI9TpuilJtP+k4g9dkV8Snmq1fGDO9XUPmm47Yp9d4dtYauKS69fG6
 qOOCcnE0pNQ8sW0yzmLDQW9bznJN+zwx5FeotqOmsl0OwPxynAuMYBqacmS5DM673xghipfsnTz
 Mog245QH+WLq+w8L6xctmBBxxl1x4/DosPNsogLm53YaimNGfThAuRyeH1gKcAWnJ9S2vTJJ9KU
 RTy4ivIEDdGv3iavWsGgq/+u1h8L1fVWAl2T21jjtYTmYNFOQdrpu6aiv4TzrFlpEwO4yiKffQg
 9Um4f2susaBxHGV2+CQ7O700hoQZwcKxRdzUjjBgEw/pQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=HFxXJkq3
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005c55c9624-108d-4981-9b16-fa190909d21b,
 B049E90426917BB4F3A6CFC693788001C48801E2)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH] package/wlr-randr: new package
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

VXRpbGl0eSB0byBtYW5hZ2Ugb3V0cHV0cyBvZiBhIFdheWxhbmQgY29tcG9zaXRvci4KClNpZ25l
ZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFk
ZXVzLmNvbT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBh
Y2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS93bHItcmFuZHIv
Q29uZmlnLmluICAgICAgfCAgNyArKysrKysrCiBwYWNrYWdlL3dsci1yYW5kci93bHItcmFuZHIu
aGFzaCB8ICA1ICsrKysrCiBwYWNrYWdlL3dsci1yYW5kci93bHItcmFuZHIubWsgICB8IDE0ICsr
KysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCAyZDhhZTgyODliNzZhMzIyMDlhZWNh
YTNmZTU3NWExNWM0YTg3YTczLi4xMjkyNzkwZWM2MDBhYzY1Y2EyZmM1NjljMGZkZjNkMDc4ZDlk
ZjZlIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTI5MjQsNiAr
MjkyNCw3IEBAIEY6CWNvbmZpZ3MvYXJtYWRldXMqCiBGOglwYWNrYWdlL21tYy11dGlscy8KIEY6
CXBhY2thZ2UvcHl0aG9uLWZsYXNrLWpzb25ycGMvCiBGOglwYWNrYWdlL3B5dGhvbi1mbGFzay1s
b2dpbi8KK0Y6CXBhY2thZ2Uvd2xyLXJhbmRyLwogRjoJcGFja2FnZS9xdDUvcXQ1Y2hhcnRzLwog
CiBOOglTZW15b24gS29sZ2Fub3YgPHNlbWVuYWs5NEBtYWlsLnJ1PgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCA0MDAxODM1MTZlNjU5ZWM5
OGNhY2MwMWQ5MzllYjk2ZWU3MTVhYjJkLi5hMWEyODcxNDkxODY5MDIyMzUzY2Q5MjE3NDU3YzI0
NTViZDEzMDIyIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0Nv
bmZpZy5pbgpAQCAtMjc4Myw2ICsyNzgzLDcgQEAgY29tbWVudCAiVXRpbGl0aWVzIgogCXNvdXJj
ZSAicGFja2FnZS90bXV4L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvdHR5ZC9Db25maWcu
aW4iCiAJc291cmNlICJwYWNrYWdlL3doaWNoL0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2Uv
d2xyLXJhbmRyL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uvd3RmdXRpbC9Db25maWcuaW4i
CiAJc291cmNlICJwYWNrYWdlL3htbHN0YXJsZXQvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2Fn
ZS94eGhhc2gvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS93bHItcmFuZHIvQ29uZmln
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
