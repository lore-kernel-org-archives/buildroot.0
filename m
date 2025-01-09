Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4E1E7719A
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 19:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38FA460894;
	Thu,  9 Jan 2025 19:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7BV2jPgWQ6M; Thu,  9 Jan 2025 19:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 380616074C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 380616074C;
	Thu,  9 Jan 2025 19:04:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C687176C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B46F26076C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0TapWFxbW4k for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 19:04:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.45.10;
 helo=18.mo583.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 81CE7606C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81CE7606C8
Received: from 18.mo583.mail-out.ovh.net (18.mo583.mail-out.ovh.net
 [178.33.45.10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81CE7606C8
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:04:54 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.140.39])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4YTVmd0cRwz1Tfp
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 16:36:49 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-fjps7 (unknown [10.111.182.153])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7BB101FE94;
 Thu,  9 Jan 2025 16:36:48 +0000 (UTC)
Received: from armadeus.com ([37.59.142.104])
 by ghost-submission-5b5ff79f4f-fjps7 with ESMTPSA
 id zIZ9NR77f2epAgAAOZ7/fw:T3
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 09 Jan 2025 16:36:48 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Thu, 09 Jan 2025 17:36:27 +0100
MIME-Version: 1.0
Message-Id: <20250109-nxp-mwifiex-firmware-driver-v1-2-b2ec8b34643c@armadeus.com>
References: <20250109-nxp-mwifiex-firmware-driver-v1-0-b2ec8b34643c@armadeus.com>
In-Reply-To: <20250109-nxp-mwifiex-firmware-driver-v1-0-b2ec8b34643c@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 18095744780443446230
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedgkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeegffeifefgtdffffffvdehheejkeegvdehgeekkeeuvedvgeelveektdeiudeltdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=drsbLzDfCngv7F3Fro2HWv/i1KaHhM4ucVNu641Drtg=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1736440609; v=1;
 b=dXD8KxNyYBtiOz/KHPBQzA7GDo0sqwNUsSndTE7UqqhhDi7iLjHldcTTK7o0qTF+0F5ulht3
 QHtPwP42NlpT9+q8ZdApfwxIqwM2CFlyntB06rE8tY2/vOQcg8yN0DbmNcO0qpWCkuVs4DxKvKH
 QQQH4waPAipd2Ayg672ktYMd0IwNuZYQNacT7yGuymoqzQoXZA0VY8tm6dO4W1BC+Kz5WT+bCpz
 YLunH3enHNrJUT3hg51I+qrhCKaLdusc17CcJtMoqbPbhVXCkvbz40QMpJ0EsFUvRc8kwTOf0o6
 p3l4VAcou7bFal/SAHwcYVaanF/WKYovybUps2/twId9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=dXD8KxNy
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0052f5a3777-0257-45e9-9c35-764e69a13bff,
 72BCDE73031BAE8127C6C3DAB41EBC240DC3E12A)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 2/2] package/nxp-mwifiex: new package
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
Cc: Gilles Talis <gilles.talis@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGludXgga2VybmVsIGRyaXZlciBmcm9tIE5YUCBmb3IgV2lGaSBjaGlwc2V0cyBJVzQxNiAvIElX
NjEwIC8gSVc2MTIgLwpXODgwMSAvIFc4OTg3IC8gVzg5OTcgLyBXOTA5OC4KClNpZ25lZC1vZmYt
Ynk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNv
bT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNr
YWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL254cC1td2lm
aWV4L0NvbmZpZy5pbiAgICAgICAgfCAxMSArKysrKysrKysrKwogcGFja2FnZS9ueHAtbXdpZmll
eC9ueHAtbXdpZmlleC5oYXNoIHwgIDMgKysrCiBwYWNrYWdlL254cC1td2lmaWV4L254cC1td2lm
aWV4Lm1rICAgfCAxNSArKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDlkNDk1
ZTEwM2ZjMjAzMzc3NzQ3OTI4NTQ3ZWY0OWU2NmZmYWFkMDkuLjZkNDBiNGJmYWEzYjkyMjRjYzkw
NGQ2OWZiNmIyNmQ5Njc2YmI2NDEgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxP
UEVSUwpAQCAtMjkyMyw2ICsyOTIzLDcgQEAgTjoJU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFz
dGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgogRjoJYm9hcmQvYXJtYWRldXMvCiBGOgljb25m
aWdzL2FybWFkZXVzKgogRjoJcGFja2FnZS9ueHAtYnQtd2lmaS1maXJtd2FyZS8KK0Y6CXBhY2th
Z2UvbnhwLW13aWZpZXgvCiBGOglwYWNrYWdlL21tYy11dGlscy8KIEY6CXBhY2thZ2UvcHl0aG9u
LWZsYXNrLWpzb25ycGMvCiBGOglwYWNrYWdlL3B5dGhvbi1mbGFzay1sb2dpbi8KZGlmZiAtLWdp
dCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggM2IxNDM1YjUz
ZDUyODRhNmJjMDc5NWIzZWU2YzNlN2ZiODQ3YTJlNC4uZjgzOTRkNjA1OWZkZGFhMTcyMjdjMWNl
ZGNjMzk1ZTc5OGIyODZiZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFj
a2FnZS9Db25maWcuaW4KQEAgLTU3Miw2ICs1NzIsNyBAQCBlbmRtZW51CiAJc291cmNlICJwYWNr
YWdlL252aWRpYS1tb2Rwcm9iZS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL252aWRpYS1w
ZXJzaXN0ZW5jZWQvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9udm1lL0NvbmZpZy5pbiIK
Kwlzb3VyY2UgInBhY2thZ2UvbnhwLW13aWZpZXgvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2Fn
ZS9vZm9uby9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL29sYS9Db25maWcuaW4iCiAJc291
cmNlICJwYWNrYWdlL29wZW4yMzAwL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvbnhw
LW13aWZpZXgvQ29uZmlnLmluIGIvcGFja2FnZS9ueHAtbXdpZmlleC9Db25maWcuaW4KbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMC4uNzM5OTcwNWIyODdlODFiNWY2MTE0MzlmMDllNzVjMDEyOWM3MDE4NgotLS0gL2Rldi9u
dWxsCisrKyBiL3BhY2thZ2UvbnhwLW13aWZpZXgvQ29uZmlnLmluCkBAIC0wLDAgKzEsMTEgQEAK
K2NvbmZpZyBCUjJfUEFDS0FHRV9OWFBfTVdJRklFWAorCWJvb2wgIm54cC1td2lmaWV4IgorCWRl
cGVuZHMgb24gQlIyX0xJTlVYX0tFUk5FTAorCWhlbHAKKwkgIExpbnV4IGtlcm5lbCBkcml2ZXIg
ZnJvbSBOWFAgZm9yIFdpRmkgY2hpcHNldHMKKwkgIElXNDE2IC8gSVc2MTAgLyBJVzYxMiAvIFc4
ODAxIC8gVzg5ODcgLyBXODk5NyAvIFc5MDk4LgorCisJICBodHRwczovL2dpdGh1Yi5jb20vbnhw
LWlteC9td2lmaWV4CisKK2NvbW1lbnQgIm54cC1td2lmaWV4IG5lZWRzIGEgTGludXgga2VybmVs
IHRvIGJlIGJ1aWx0IgorCWRlcGVuZHMgb24gIUJSMl9MSU5VWF9LRVJORUwKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbnhwLW13aWZpZXgvbnhwLW13aWZpZXguaGFzaCBiL3BhY2thZ2UvbnhwLW13aWZp
ZXgvbnhwLW13aWZpZXguaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi41NTllODljYjM3ODcxNmZkNGJlZmM2MDIy
NTBhZjM0NTc1MmU5ODcwCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9ueHAtbXdpZmlleC9u
eHAtbXdpZmlleC5oYXNoCkBAIC0wLDAgKzEsMyBAQAorIyBsb2NhbGx5IGNvbXB1dGVkCitzaGEy
NTYgIGRjZmZlNmM0OGJhYmY3ZGI4MmFhYzQ3MDRiMDU2Y2ZmYzA2YTFmODAwMDhjZDljMjNhYjA0
NzlmYzg5MGJhOTkgIG54cC1td2lmaWV4LWxmLTYuNi41Ml8yLjIuMC50YXIuZ3oKK3NoYTI1NiAg
NjdkNDYxYmM0NzhkMjIwZmNkZjk5YzU5ZDhlYTE3ZmZmYmQxODgxNzE4MjgxYWE0OTQ3ZWI2MDhm
Y2Q1NjhiYiAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ueHAtbXdpZmlleC9ueHAtbXdp
ZmlleC5tayBiL3BhY2thZ2UvbnhwLW13aWZpZXgvbnhwLW13aWZpZXgubWsKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4u
ZmFhY2FhZDI4OTUzODE3MjNmZmM1OWMwNDhhMGJlMmRkMjVhYTA2OAotLS0gL2Rldi9udWxsCisr
KyBiL3BhY2thZ2UvbnhwLW13aWZpZXgvbnhwLW13aWZpZXgubWsKQEAgLTAsMCArMSwxNSBAQAor
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgbnhwLW13aWZpZXgKKyMKKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCisKK05YUF9NV0lGSUVYX1ZFUlNJT04gPSBsZi02LjYuNTJfMi4yLjAKK05Y
UF9NV0lGSUVYX1NJVEUgPSAkKGNhbGwgZ2l0aHViLG54cC1pbXgsbXdpZmlleCwkKE5YUF9NV0lG
SUVYX1ZFUlNJT04pKQorTlhQX01XSUZJRVhfTElDRU5TRSA9IEdQTC0yLjAKK05YUF9NV0lGSUVY
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCisKK05YUF9NV0lGSUVYX01BS0VfT1BUUyA9IEtFUk5F
TERJUj0kKExJTlVYX0RJUikKKworJChldmFsICQoa2VybmVsLW1vZHVsZSkpCiskKGV2YWwgJChn
ZW5lcmljLXBhY2thZ2UpKQoKLS0gCjIuNDUuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
