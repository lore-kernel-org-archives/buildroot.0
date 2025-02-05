Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC36C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F75C415F0;
	Wed,  5 Feb 2025 11:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zf1nSiTzkty0; Wed,  5 Feb 2025 11:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 354B24161D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 354B24161D;
	Wed,  5 Feb 2025 11:46:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B799412A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BED581FE5
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sl6qtcS5oE4T for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:46:39 +0000 (UTC)
X-Greylist: delayed 157529 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 05 Feb 2025 11:46:38 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68E1281FD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68E1281FD3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=87.98.174.144;
 helo=16.mo583.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 16.mo583.mail-out.ovh.net (16.mo583.mail-out.ovh.net
 [87.98.174.144])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68E1281FD3
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:46:38 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.9.127])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4Ynywy5BHVz1V2d
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:06 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-22h7p (unknown [10.108.54.171])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BB7731FE6C;
 Wed,  5 Feb 2025 11:41:05 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-22h7p with ESMTPSA
 id P3yiKEpOo2ej2AEA3y/gtQ:T9
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 05 Feb 2025 11:41:05 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 05 Feb 2025 12:40:58 +0100
MIME-Version: 1.0
Message-Id: <20250205-imx-packages-bump-v1-8-2f11b86d2da5@armadeus.com>
References: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
In-Reply-To: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 5643573287213591520
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepiedufeeuheeugfekleehfeejjefgfedvuedutdffkeevhfdtlefgheehffehgefgnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkeefmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=E6+kKwx1Y4WAT2FINcKey33dObZP9WJwS2d42qjmohM=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738755666; v=1;
 b=hsl5gqXg2qQLXptq0O6PcYZCI1KUgw44y7SjkD06PnsAa0D/TRgSOKb4PYYknFSF9pWUm6ND
 kum/3XsLd9tUBWjHSSL2huJ+caFLsIIltfRvbUA5imAtmFf67fZrK4mzwbWtAsnLK3zw9SSJ4yL
 cFp+Zq4U8+U4yfxVJq4UATnTv3KZsS9Vwa5zEY5z3zp2D4HheUGJ6xljyD850sRMid1/Pzv4JmU
 JxN5O/BFHmsK7wMar+ZR9R2rj12vWxWkET4Zz5SuFP1sATj7r5xyWc61K7SFPJ4B6sPWi3N2m4h
 5uws52scIi9w1iYHwgHMFRNxGxKKA8YIaSFvuTJf7s4RA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=hsl5gqXg
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007d352d686-e134-4123-9b1a-23ed402126c5,
 07F6D1151FB3B68F354E79ABC9BDBC207BB7D4D8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 08/11] package/freescale-imx/imx-seco: bump
 version to 5.9.4.1
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
IEp1bHkgMjAyNCIuCkFkZCBTQ1IudHh0IGFuZCBTQ1ItaW14LXNlY28udHh0IHRvIF9MSUNFTlNF
X0ZJTEVTLgoKTm90ZTogaW4gdGhpcyByZWxlYXNlLCB0aGUgcGFja2FnZSBzb3VyY2UgYXJjaGl2
ZSBuYW1lIGNoYW5nZWQgdG8KaW5jbHVkZSBhIHJldmlzaW9uLiBUaGlzIGNvbW1pdCBhZGRzIGEg
bmV3IF9SRVZJU0lPTiB2YXJpYWJsZSB3aXRoIHRoZQp2YWx1ZSBwdWJsaXNoZWQgaW4gdGhlIGNv
cnJlc3BvbmRpbmcgTlhQIEJTUC4KClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tp
IDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXgvaW14LXNlY28vaW14LXNlY28uaGFzaCB8IDggKysrKystLS0KIHBhY2thZ2UvZnJlZXNj
YWxlLWlteC9pbXgtc2Vjby9pbXgtc2Vjby5tayAgIHwgNyArKysrLS0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvaW14LXNlY28vaW14LXNlY28uaGFzaCBiL3BhY2thZ2UvZnJlZXNjYWxl
LWlteC9pbXgtc2Vjby9pbXgtc2Vjby5oYXNoCmluZGV4IGE5MWRiYzIyNzQ1ZDAxMzBmNmY1YmU1
ZGYyZTM0MGVmYWM2MTZkNGIuLjVjMjllYzRmYTljN2Q1NjZlMWMyODgzYTI2ZmYzM2IwYWMzZDZm
ZDggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtc2Vjby9pbXgtc2Vjby5o
YXNoCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtc2Vjby9pbXgtc2Vjby5oYXNoCkBA
IC0xLDQgKzEsNiBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgOWIwNGJlMzM4MTRh
OWNiZGE5YmJmY2I2NzExNTg1Y2Y3ZTRlZDI1Mjc3OTM4MTNjOTUyMzBmMzUwMzIzY2JhNyAgaW14
LXNlY28tNS45LjQuYmluCi1zaGEyNTYgIDE2NWY2YzBlYWNiNGQzYTA1Mjg5ZGZiNzkzMzFjOWEy
YzA1MjA3ZWI3YTY3ZWYyOGExMTdmMjQ2YTAxNDU0MjggIEVVTEEKLXNoYTI1NiAgYzllZTUxODUx
MGQ3MmUyNTRkNjI3NDNmNTA5ODE2M2VhY2RiNjQyOGM2YmE0ZDgxMTlhZmUyZDEyZWRiYTA2OCAg
Q09QWUlORworc2hhMjU2ICBiZDhkYzAxOTY2MDc2ODM2YWFiZmY1M2YyNDYzMjk1Mjk0MTY2NTk1
MDA2ZTFkYjQzMGRiMjFiNmZmYTZiNjY3ICBpbXgtc2Vjby01LjkuNC4xLTAzMzM1OTYuYmluCitz
aGEyNTYgIGMzZDlhN2IyYTVhN2RiNWRhNjkwZTljMTA4MWI5OGI2NjU4MDJjM2VmYmJiYTdmYjIz
NzMzOTM5NWE5MmY2MDcgIEVVTEEKK3NoYTI1NiAgNjAxZmE3OTBjNWI0ZDAzNTc5YmQxODJmYjRk
NjVhNmYzMjlhMzJmYWY0OWRiMjJmOThlNDYwODIyMWU4NjFmNyAgQ09QWUlORworc2hhMjU2ICA5
MmQ3YTY1OTRjZWNlNGQ1OWY0ZGE0Njc3ZjMxMjhhYTQ5OTdmZDQ5OTU1YWVlNTBhNmZlZDMyZTM4
MDBkZjc2ICBTQ1IudHh0CitzaGEyNTYgIDkyZDdhNjU5NGNlY2U0ZDU5ZjRkYTQ2NzdmMzEyOGFh
NDk5N2ZkNDk5NTVhZWU1MGE2ZmVkMzJlMzgwMGRmNzYgIFNDUi1pbXgtc2Vjby50eHQKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtc2Vjby9pbXgtc2Vjby5tayBiL3BhY2th
Z2UvZnJlZXNjYWxlLWlteC9pbXgtc2Vjby9pbXgtc2Vjby5tawppbmRleCA0YWZhYzgwMDViNmIz
MmYzYzk2ZTVmYWNmYmNmY2UyNzQ0M2Q0OGI5Li4wMTJmMzY3MDk5YzEyYjAxZDA3OTc4ZGIxM2Fk
ZjA5MGQ0Y2U2ZTg0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXNlY28v
aW14LXNlY28ubWsKKysrIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1zZWNvL2lteC1zZWNv
Lm1rCkBAIC00LDEyICs0LDEzIEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1JTVhf
U0VDT19WRVJTSU9OID0gNS45LjQKK0lNWF9TRUNPX1ZFUlNJT04gPSA1LjkuNC4xCitJTVhfU0VD
T19SRVZJU0lPTiA9IDAzMzM1OTYKIElNWF9TRUNPX1NJVEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lU
RSkKLUlNWF9TRUNPX1NPVVJDRSA9IGlteC1zZWNvLSQoSU1YX1NFQ09fVkVSU0lPTikuYmluCitJ
TVhfU0VDT19TT1VSQ0UgPSBpbXgtc2Vjby0kKElNWF9TRUNPX1ZFUlNJT04pLSQoSU1YX1NFQ09f
UkVWSVNJT04pLmJpbgogCiBJTVhfU0VDT19MSUNFTlNFID0gTlhQIFNlbWljb25kdWN0b3IgU29m
dHdhcmUgTGljZW5zZSBBZ3JlZW1lbnQKLUlNWF9TRUNPX0xJQ0VOU0VfRklMRVMgPSBFVUxBIENP
UFlJTkcKK0lNWF9TRUNPX0xJQ0VOU0VfRklMRVMgPSBFVUxBIENPUFlJTkcgU0NSLnR4dCBTQ1It
aW14LXNlY28udHh0CiBJTVhfU0VDT19SRURJU1RSSUJVVEUgPSBOTwogCiBkZWZpbmUgSU1YX1NF
Q09fRVhUUkFDVF9DTURTCgotLSAKMi40NS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
