Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72451C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C91441620;
	Wed,  5 Feb 2025 11:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTDfj2BRlDDP; Wed,  5 Feb 2025 11:41:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 499E741770
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 499E741770;
	Wed,  5 Feb 2025 11:41:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE9ECCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB937409EF
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQLKZ1rChFgP for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:41:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.63.230;
 helo=7.mo575.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80981409BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80981409BD
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net
 [46.105.63.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80981409BD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:05 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.148.175])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4Ynywv0cTXz1qc1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:03 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-22h7p (unknown [10.108.54.171])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5C8B01FEE1;
 Wed,  5 Feb 2025 11:41:02 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-22h7p with ESMTPSA
 id P3yiKEpOo2ej2AEA3y/gtQ:T5
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 05 Feb 2025 11:41:02 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 05 Feb 2025 12:40:54 +0100
MIME-Version: 1.0
Message-Id: <20250205-imx-packages-bump-v1-4-2f11b86d2da5@armadeus.com>
References: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
In-Reply-To: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 5642728860491901920
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepiedufeeuheeugfekleehfeejjefgfedvuedutdffkeevhfdtlefgheehffehgefgnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehjeehmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=FiOWK1NWTn1GTqFXNwpfO8RbL36zFkcmBpug+7hkk/Y=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738755663; v=1;
 b=iZ1johy8fkj64uAoEO7bl67RQcmkvbNnxNLEBsRT4rp214NgINLxDsdBzaHh1jVZKQfZpylz
 AUqe5YZTy8hphtMPR17qsGNF2W2S58iMGbVnoDJjjkQoFR2rLE+509YgcHloKPRWYE9E74jbIPg
 jak/GkDDHaETm59hodhEXweJ1ANzRudir05DfiFoRAm1ol5nX6nZjnAzU67GLYsHNQ5+OV4tdJc
 QKLVsaOeTX6ouPZMm7TpdkGDiJp+hBCDbszrzUiLUmM0bxUc2V4hvijZ619OZmCzSE8OYPPksJx
 iKdvkL2+DEGPk+DYxEjF8QB6eiQdw+DnR6lfJ2QPSwD8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=iZ1johy8
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007c4732c7c-3071-418b-a50d-8e4d9c2f2c0f,
 07F6D1151FB3B68F354E79ABC9BDBC207BB7D4D8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 04/11] package/freescale-imx/firmware-imx: bump
 version to 8.26
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyB2ZXJzaW9uIGlzIGFsaWduZWQgd2l0aCBOWFAgTGludXggQlNQIHZlcnNpb24gImxmLTYu
Ni41NS0yLjAuMCIuCgpMaWNlbnNlIGhhc2hlcyBjaGFuZ2VkIGJlY2F1c2UgdGhlIExBX09QVF9O
WFBfU29mdHdhcmVfTGljZW5zZSBjaGFuZ2VkCmZyb20gInY1NiBBcHJpbCAyMDI0IiB0byAidjU3
IEp1bHkgMjAyNCIuCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0
aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQogcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zp
cm13YXJlLWlteC9maXJtd2FyZS1pbXguaGFzaCB8IDYgKysrLS0tCiBwYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXgvZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5tayAgIHwgNCArKy0tCiAyIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5oYXNoIGIvcGFja2Fn
ZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJtd2FyZS1pbXguaGFzaAppbmRleCBkNjA2
YWU2ZGE2YjNjNzE2N2QzMDc4YTk4YTdlMWYwMjdiYzgzOGVjLi42MDYwNzVjODVlYjEzZWEzM2Q1
NTUwZjRkN2E2ODcxNWVhNGUwNmNlIDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgv
ZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5oYXNoCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlt
eC9maXJtd2FyZS1pbXgvZmlybXdhcmUtaW14Lmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIExvY2Fs
bHkgY2FsY3VsYXRlZAotc2hhMjU2ICAyZTI3OTYyMzMyMTk3ZWJlYmJiMzAxMzhmNmRmYjM2NTM2
MWQ0OGQ3ZWZhNTY1ZGY5N2M0Zjc5Mjg1YjFjYTUwICBmaXJtd2FyZS1pbXgtOC4yNC1mYmUwYTRj
LmJpbgotc2hhMjU2ICBjOWVlNTE4NTEwZDcyZTI1NGQ2Mjc0M2Y1MDk4MTYzZWFjZGI2NDI4YzZi
YTRkODExOWFmZTJkMTJlZGJhMDY4ICBDT1BZSU5HCi1zaGEyNTYgIDE2NWY2YzBlYWNiNGQzYTA1
Mjg5ZGZiNzkzMzFjOWEyYzA1MjA3ZWI3YTY3ZWYyOGExMTdmMjQ2YTAxNDU0MjggIEVVTEEKK3No
YTI1NiAgYjJmY2Y4NGEwNDE3Njc4YWE0NDFiMWJjZGU5ZWNlNDY3ZjhiZDA2M2E2M2Q4MzkwNjg0
ZjhlMzc3NjhkODRjZiAgZmlybXdhcmUtaW14LTguMjYtZDRjMzNhYi5iaW4KK3NoYTI1NiAgNjAx
ZmE3OTBjNWI0ZDAzNTc5YmQxODJmYjRkNjVhNmYzMjlhMzJmYWY0OWRiMjJmOThlNDYwODIyMWU4
NjFmNyAgQ09QWUlORworc2hhMjU2ICBjM2Q5YTdiMmE1YTdkYjVkYTY5MGU5YzEwODFiOThiNjY1
ODAyYzNlZmJiYmE3ZmIyMzczMzkzOTVhOTJmNjA3ICBFVUxBCiBzaGEyNTYgIDQwZDAyZjZkNmI0
ZTk0ZDkzMDc1Mjk0MDhmMzcyZjVhOTkwOGNmM2QxNTZlYzUzM2E0ZTU0Mjc0YjQwZjI3MWUgIFND
Ui50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgvZmly
bXdhcmUtaW14Lm1rIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJtd2Fy
ZS1pbXgubWsKaW5kZXggODY2NmQ3NmE3MzA5MDdiZjE4ZjI0Y2Y2MjA3NTE5ZTIzZTQ1MDBlZC4u
NjIwNzcyMzhhNzA1OGY3YjZhYzExZDYxNTY1NTY3M2FlYjY5YjIzYiAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJtd2FyZS1pbXgubWsKKysrIGIvcGFj
a2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJtd2FyZS1pbXgubWsKQEAgLTQsOCAr
NCw4IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1GSVJNV0FSRV9JTVhfVkVSU0lP
TiA9IDguMjQKLUZJUk1XQVJFX0lNWF9SRVZJU0lPTiA9IGZiZTBhNGMKK0ZJUk1XQVJFX0lNWF9W
RVJTSU9OID0gOC4yNgorRklSTVdBUkVfSU1YX1JFVklTSU9OID0gZDRjMzNhYgogRklSTVdBUkVf
SU1YX1NJVEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lURSkKIEZJUk1XQVJFX0lNWF9TT1VSQ0UgPSBm
aXJtd2FyZS1pbXgtJChGSVJNV0FSRV9JTVhfVkVSU0lPTiktJChGSVJNV0FSRV9JTVhfUkVWSVNJ
T04pLmJpbgogCgotLSAKMi40NS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
