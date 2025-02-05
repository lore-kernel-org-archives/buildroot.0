Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437FCC02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D356440703;
	Wed,  5 Feb 2025 11:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNhFG7yLebjo; Wed,  5 Feb 2025 11:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19CD8417C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19CD8417C2;
	Wed,  5 Feb 2025 11:49:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED8FFCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D082F4022B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id djfKsjPhcell for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:49:02 +0000 (UTC)
X-Greylist: delayed 474 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 05 Feb 2025 11:49:01 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8412340181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8412340181
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.58.60;
 helo=3.mo575.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 3.mo575.mail-out.ovh.net (3.mo575.mail-out.ovh.net
 [46.105.58.60])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8412340181
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:49:01 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.148.175])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4Ynyws2SWZz1M6l
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:01 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-22h7p (unknown [10.108.54.171])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B401F1FEC9;
 Wed,  5 Feb 2025 11:41:00 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-22h7p with ESMTPSA
 id P3yiKEpOo2ej2AEA3y/gtQ:T3
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 05 Feb 2025 11:41:00 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 05 Feb 2025 12:40:52 +0100
MIME-Version: 1.0
Message-Id: <20250205-imx-packages-bump-v1-2-2f11b86d2da5@armadeus.com>
References: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
In-Reply-To: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 5642165910389910496
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepiedufeeuheeugfekleehfeejjefgfedvuedutdffkeevhfdtlefgheehffehgefgnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehjeehmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=CVTWuM2ECI3S5a37nUk0LAj/ipfSn9J59hTOCg5S1tc=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738755661; v=1;
 b=UwXTWYupJWOQNcnotpilLc528JZ1v3xoUPa6MdyUQ8SwW91t6q9N9joQZfXHi/g1BiOQKXge
 5p9EZyClsa8ogijQAl5SolF3SWNigtnfzkkLXe4cI6wDLBq/TnP/p7DiHR1+pWYEMhSkQV3Bwe9
 LpjmNm662UzmbcY5Iwke0zIm3XL2zSpXANH5DDi0DSwpNOq9LRB3PJtxzaEu89yX2f2MWY3LUhF
 EF8Y1o9k96eYse9l1UZ2VOiF3GXz0GJeTt3HXWY7m3qqNrwrg4yEdtE+VkR91IL9FUeTswvPTXb
 WV9uBRpM3ctfi2Qlb8RZRg5KyQfT5Q1HRHkQ8tz6W+iMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=UwXTWYup
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007b31305f2-354a-45bf-a1eb-8f7450f4d689,
 07F6D1151FB3B68F354E79ABC9BDBC207BB7D4D8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 02/11] package/freescale-imx/firmware-ele-imx:
 bump to version 1.3.0
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
Ni41Mi0yLjAuMCIuCgpMaWNlbnNlIGhhc2hlcyBjaGFuZ2VkIGJlY2F1c2UgdGhlIExBX09QVF9O
WFBfU29mdHdhcmVfTGljZW5zZSBjaGFuZ2VkCmZyb20gInY0OSBTZXB0ZW1iZXIgMjAyMyIgdG8g
InY1NyBKdWx5IDIwMjQiLgpBZGQgU0NSLnR4dCBmaWxlIHRvIF9MSUNFTlNFX0ZJTEVTLgoKTm90
ZTogaW4gdGhpcyByZWxlYXNlLCB0aGUgcGFja2FnZSBzb3VyY2UgYXJjaGl2ZSBuYW1lIGNoYW5n
ZWQgdG8KaW5jbHVkZSBhIHJldmlzaW9uLiBUaGlzIGNvbW1pdCBhZGRzIGEgbmV3IF9SRVZJU0lP
TiB2YXJpYWJsZSB3aXRoIHRoZQp2YWx1ZSBwdWJsaXNoZWQgaW4gdGhlIGNvcnJlc3BvbmRpbmcg
TlhQIEJTUC4KClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4u
c3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdh
cmUtZWxlLWlteC9maXJtd2FyZS1lbGUtaW14Lmhhc2ggfCA3ICsrKystLS0KIHBhY2thZ2UvZnJl
ZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgubWsgICB8IDcgKysr
Ky0tLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdh
cmUtZWxlLWlteC5oYXNoIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgv
ZmlybXdhcmUtZWxlLWlteC5oYXNoCmluZGV4IDA5MjNlNTQ2YjA2MzYxZjBhNzA5Y2YwNzQ5NDZm
NmU5NzFkMGJmMGQuLjYxODJkYzU3YmU4MjNjYTU0MTU5Y2FmNzEyN2RkMTEwMmU0OGY1YTcgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L2Zpcm13YXJl
LWVsZS1pbXguaGFzaAorKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlt
eC9maXJtd2FyZS1lbGUtaW14Lmhhc2gKQEAgLTEsNCArMSw1IEBACiAjIExvY2FsbHkgY2FsY3Vs
YXRlZAotc2hhMjU2ICA0YTA0NDAxNjhkOGRmYjk1OTg5YTE3YmU4ZmFmYjE0OTU4OWUxMTBlN2Q0
NTE4ZTVlOGEzMzQ2M2RmYjVlNWNhICBmaXJtd2FyZS1lbGUtaW14LTAuMS4wLmJpbgotc2hhMjU2
ICAyNGQ3Y2IzYTdlNTEwMTE0NjZhMTQ5YmQ5OWFjZjg5Mzg3YjgzMmJlMmQwODkwY2UyZTE4M2Rm
YmM5ZDdjYjg0ICBDT1BZSU5HCi1zaGEyNTYgIDMyODJkODhmYWQ3NjY4OTdmOTNiMDgyNzI5N2E3
MGMyNzA3ZDkzNThkYjI0Y2NjZDU3NzdhYmY3Yzk5N2RhNzcgIEVVTEEKK3NoYTI1NiAgODc5MTEw
OTgyNDc2NzM0NjIzN2U1M2FjMmM3MTI4MjRlNTQ2MDhlMjA5Mjg1OTE2MWU2YmIzZTUzODVhNzU5
NSAgZmlybXdhcmUtZWxlLWlteC0xLjMuMC0xNzk0NWZjLmJpbgorc2hhMjU2ICA2MDFmYTc5MGM1
YjRkMDM1NzliZDE4MmZiNGQ2NWE2ZjMyOWEzMmZhZjQ5ZGIyMmY5OGU0NjA4MjIxZTg2MWY3ICBD
T1BZSU5HCitzaGEyNTYgIGMzZDlhN2IyYTVhN2RiNWRhNjkwZTljMTA4MWI5OGI2NjU4MDJjM2Vm
YmJiYTdmYjIzNzMzOTM5NWE5MmY2MDcgIEVVTEEKK3NoYTI1NiAgODcyMWE2MTdhNWQ0YzdmMzY2
YWFmODU3ZWJkYTIxZWI0YzlmYzkxNzVkYzkyYjcwZjYyN2M2MTFkNDAzZWM4ZSAgU0NSLnR4dApk
aWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdh
cmUtZWxlLWlteC5tayBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L2Zp
cm13YXJlLWVsZS1pbXgubWsKaW5kZXggZDQ5M2ZlNGE5NmJlZTllYmQ3ZTczZTRiZjQ4OGJhNjc3
MDc2NGI3NC4uNDIyNTgwNWQ1MDIzZWZiZGI5MDczMzJjZmYxNDYwMzk2MzExMjgwNSAxMDA2NDQK
LS0tIGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxl
LWlteC5taworKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9maXJt
d2FyZS1lbGUtaW14Lm1rCkBAIC00LDEyICs0LDEzIEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwogCi1GSVJNV0FSRV9FTEVfSU1YX1ZFUlNJT04gPSAwLjEuMAorRklSTVdBUkVfRUxFX0lN
WF9WRVJTSU9OID0gMS4zLjAKK0ZJUk1XQVJFX0VMRV9JTVhfUkVWSVNJT04gPSAxNzk0NWZjCiBG
SVJNV0FSRV9FTEVfSU1YX1NJVEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lURSkKLUZJUk1XQVJFX0VM
RV9JTVhfU09VUkNFID0gZmlybXdhcmUtZWxlLWlteC0kKEZJUk1XQVJFX0VMRV9JTVhfVkVSU0lP
TikuYmluCitGSVJNV0FSRV9FTEVfSU1YX1NPVVJDRSA9IGZpcm13YXJlLWVsZS1pbXgtJChGSVJN
V0FSRV9FTEVfSU1YX1ZFUlNJT04pLSQoRklSTVdBUkVfRUxFX0lNWF9SRVZJU0lPTikuYmluCiAK
IEZJUk1XQVJFX0VMRV9JTVhfTElDRU5TRSA9IE5YUCBTZW1pY29uZHVjdG9yIFNvZnR3YXJlIExp
Y2Vuc2UgQWdyZWVtZW50Ci1GSVJNV0FSRV9FTEVfSU1YX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5H
IEVVTEEKK0ZJUk1XQVJFX0VMRV9JTVhfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgRVVMQSBTQ1Iu
dHh0CiBGSVJNV0FSRV9FTEVfSU1YX1JFRElTVFJJQlVURSA9IE5PCiAKIEZJUk1XQVJFX0VMRV9J
TVhfSU5TVEFMTF9JTUFHRVMgPSBZRVMKCi0tIAoyLjQ1LjMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
