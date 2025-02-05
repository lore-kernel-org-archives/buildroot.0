Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E455C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C4AD4178B;
	Wed,  5 Feb 2025 11:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XE1EEGmzcgV8; Wed,  5 Feb 2025 11:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAAAE41782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAAAE41782;
	Wed,  5 Feb 2025 11:48:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF3D2CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF18D60680
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QIOaPnFvnlD for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:48:44 +0000 (UTC)
X-Greylist: delayed 453 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 05 Feb 2025 11:48:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9DAD6071D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9DAD6071D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.56.124;
 helo=13.mo582.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 13.mo582.mail-out.ovh.net (13.mo582.mail-out.ovh.net
 [188.165.56.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9DAD6071D
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:48:43 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.140.215])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4Ynywz3Zl4z1LV1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:07 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-22h7p (unknown [10.108.54.171])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D66941FEC0;
 Wed,  5 Feb 2025 11:41:06 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-22h7p with ESMTPSA
 id P3yiKEpOo2ej2AEA3y/gtQ:T10
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 05 Feb 2025 11:41:06 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 05 Feb 2025 12:40:59 +0100
MIME-Version: 1.0
Message-Id: <20250205-imx-packages-bump-v1-9-2f11b86d2da5@armadeus.com>
References: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
In-Reply-To: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 5643854759218375648
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepiedufeeuheeugfekleehfeejjefgfedvuedutdffkeevhfdtlefgheehffehgefgnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=Is/uZ7kGTHUL17wWAlvEmdVL/KIkYGKsXr/F82ITd3I=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738755667; v=1;
 b=bkIgLq98K7eYG8WQEql5gSE0ZxHsU7dUXwKdxiRrrkwSrMZkeaJhZv3gEeRSHty27HzlaTco
 MRDLzhClEPi6w6Kv3LGtmipueFAFebjX9g4ukstg1XOzDELS4MbRw++yIVpEj0cv3fN7crKGly5
 EDRH1uDiilT/h4WDUeG7T6HH7QFWB37ikDuG8Rk/EozFV55XGEwfOujKHUiuGpAj126HbHrygDv
 28ys2b6GvvdFXPa1jHTeS92Vgigrz4hK9pyzNrNAoASYzWaVLIrny56QNR7sdldVWa9T6QMirCy
 uUdE+wA7xX5YxWIboo3kfYkvA0e6CcITCfUC/is5NhigQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=bkIgLq98
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007c18b7af8-224a-43c9-ace3-4fae32f1bff8,
 07F6D1151FB3B68F354E79ABC9BDBC207BB7D4D8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 09/11] package/freescale-imx/imx-sc-firmware:
 bump version to 1.17.0
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
IEp1bHkgMjAyNCIuCkFkZCBTQ1IudHh0IHRvIF9MSUNFTlNFX0ZJTEVTLgoKTm90ZTogaW4gdGhp
cyByZWxlYXNlLCB0aGUgcGFja2FnZSBzb3VyY2UgYXJjaGl2ZSBuYW1lIGNoYW5nZWQgdG8KaW5j
bHVkZSBhIHJldmlzaW9uLiBUaGlzIGNvbW1pdCBhZGRzIGEgbmV3IF9SRVZJU0lPTiB2YXJpYWJs
ZSB3aXRoIHRoZQp2YWx1ZSBwdWJsaXNoZWQgaW4gdGhlIGNvcnJlc3BvbmRpbmcgTlhQIEJTUC4K
ClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tp
QGFybWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXNjLWZpcm13YXJl
L2lteC1zYy1maXJtd2FyZS5oYXNoIHwgNyArKysrLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgv
aW14LXNjLWZpcm13YXJlL2lteC1zYy1maXJtd2FyZS5tayAgIHwgNyArKysrLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXNjLWZpcm13YXJlL2lteC1zYy1maXJtd2FyZS5oYXNo
IGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1zYy1maXJtd2FyZS9pbXgtc2MtZmlybXdhcmUu
aGFzaAppbmRleCA5NTU4NzllYjQzY2Q4ZWYwNzA3YWJkYTBmMzVjZjRmZGM4Y2Q0NDBkLi45YTEy
MzgzZTAyOWUzNDcwNDE5YjBkNWE0YWJiZjNmOTQwNDg4MWI0IDEwMDY0NAotLS0gYS9wYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvaW14LXNjLWZpcm13YXJlL2lteC1zYy1maXJtd2FyZS5oYXNoCisrKyBi
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtc2MtZmlybXdhcmUvaW14LXNjLWZpcm13YXJlLmhh
c2gKQEAgLTEsNCArMSw1IEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICAyMzMyN2Mz
OGZmYzc0NjMyMTY5NzUyOGIyYzRjNzI2ZWQ1YzNlYmFkZjRiMzEyNTkyZDUzMzY2NDcxOTU5NWJk
ICBpbXgtc2MtZmlybXdhcmUtMS4xNi4wLmJpbgotc2hhMjU2ICAxNjVmNmMwZWFjYjRkM2EwNTI4
OWRmYjc5MzMxYzlhMmMwNTIwN2ViN2E2N2VmMjhhMTE3ZjI0NmEwMTQ1NDI4ICBFVUxBCi1zaGEy
NTYgIGM5ZWU1MTg1MTBkNzJlMjU0ZDYyNzQzZjUwOTgxNjNlYWNkYjY0MjhjNmJhNGQ4MTE5YWZl
MmQxMmVkYmEwNjggIENPUFlJTkcKK3NoYTI1NiAgMDgzZTg2Y2MyNmYyMTg3ODYzNTEzNjc3MDg1
NDc0MTQ5OTYwMzExZTdlYmNhMzZkZjY5MzA2MDE0ZGFhYjk0OCAgaW14LXNjLWZpcm13YXJlLTEu
MTcuMC04MzYyNGI5LmJpbgorc2hhMjU2ICBjM2Q5YTdiMmE1YTdkYjVkYTY5MGU5YzEwODFiOThi
NjY1ODAyYzNlZmJiYmE3ZmIyMzczMzkzOTVhOTJmNjA3ICBFVUxBCitzaGEyNTYgIDYwMWZhNzkw
YzViNGQwMzU3OWJkMTgyZmI0ZDY1YTZmMzI5YTMyZmFmNDlkYjIyZjk4ZTQ2MDgyMjFlODYxZjcg
IENPUFlJTkcKK3NoYTI1NiAgYmZiZWVmMzMyZDA1Yzk2MDhjNzkwYTEyYmJiZjRjNjZhOGFjYzc2
YjE1OTE0NWJhN2VmNDhkMzc5OWNhOGE2MSAgU0NSLnR4dApkaWZmIC0tZ2l0IGEvcGFja2FnZS9m
cmVlc2NhbGUtaW14L2lteC1zYy1maXJtd2FyZS9pbXgtc2MtZmlybXdhcmUubWsgYi9wYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvaW14LXNjLWZpcm13YXJlL2lteC1zYy1maXJtd2FyZS5tawppbmRleCA1
YzllYzU5ZDhhNDM3Y2Q1NmUzZjNhM2JhM2JlNWRiYWQyYWYyMGQ5Li4xZTZkNmU3ZGQ1NWQ5MzI4
NzgzN2QyMzJhYTM5MGYwZTk3MGM1YmE3IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1p
bXgvaW14LXNjLWZpcm13YXJlL2lteC1zYy1maXJtd2FyZS5taworKysgYi9wYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvaW14LXNjLWZpcm13YXJlL2lteC1zYy1maXJtd2FyZS5tawpAQCAtNCwxMiArNCwx
MyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotSU1YX1NDX0ZJUk1XQVJFX1ZFUlNJ
T04gPSAxLjE2LjAKK0lNWF9TQ19GSVJNV0FSRV9WRVJTSU9OID0gMS4xNy4wCitJTVhfU0NfRklS
TVdBUkVfUkVWSVNJT04gPSA4MzYyNGI5CiBJTVhfU0NfRklSTVdBUkVfU0lURSA9ICQoRlJFRVND
QUxFX0lNWF9TSVRFKQotSU1YX1NDX0ZJUk1XQVJFX1NPVVJDRSA9IGlteC1zYy1maXJtd2FyZS0k
KElNWF9TQ19GSVJNV0FSRV9WRVJTSU9OKS5iaW4KK0lNWF9TQ19GSVJNV0FSRV9TT1VSQ0UgPSBp
bXgtc2MtZmlybXdhcmUtJChJTVhfU0NfRklSTVdBUkVfVkVSU0lPTiktJChJTVhfU0NfRklSTVdB
UkVfUkVWSVNJT04pLmJpbgogCiBJTVhfU0NfRklSTVdBUkVfTElDRU5TRSA9IE5YUCBTZW1pY29u
ZHVjdG9yIFNvZnR3YXJlIExpY2Vuc2UgQWdyZWVtZW50Ci1JTVhfU0NfRklSTVdBUkVfTElDRU5T
RV9GSUxFUyA9IEVVTEEgQ09QWUlORworSU1YX1NDX0ZJUk1XQVJFX0xJQ0VOU0VfRklMRVMgPSBF
VUxBIENPUFlJTkcgU0NSLnR4dAogSU1YX1NDX0ZJUk1XQVJFX1JFRElTVFJJQlVURSA9IE5PCiAK
IGRlZmluZSBJTVhfU0NfRklSTVdBUkVfRVhUUkFDVF9DTURTCgotLSAKMi40NS4zCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
