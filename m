Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1881C433FE
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 00:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C13541883;
	Thu, 17 Nov 2022 00:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C13541883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gow-F2cQ7DSX; Thu, 17 Nov 2022 00:15:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95A9E4188C;
	Thu, 17 Nov 2022 00:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95A9E4188C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 820731BF954
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 00:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 679434188C
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 00:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 679434188C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UYt9kaIabAds for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 00:15:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BDA641883
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BDA641883
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 00:15:15 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AH0FBGi064014;
 Wed, 16 Nov 2022 18:15:11 -0600
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AH0FBGG082258
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Nov 2022 18:15:11 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 16
 Nov 2022 18:15:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 16 Nov 2022 18:15:11 -0600
Received: from uda0393673 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AH0FBpN017169;
 Wed, 16 Nov 2022 18:15:11 -0600
Received: from a0393673 by uda0393673 with local (Exim 4.95)
 (envelope-from <gadiyar@ti.com>) id 1ovSYh-007MCA-HC;
 Wed, 16 Nov 2022 18:15:11 -0600
To: <buildroot@buildroot.org>
Date: Wed, 16 Nov 2022 18:15:11 -0600
Message-ID: <20221117001511.1753592-4-gadiyar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117001511.1753592-1-gadiyar@ti.com>
References: <20221117001511.1753592-1-gadiyar@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1668644112;
 bh=KxiafXx5WsA0j0fnbejE/q7Od5YRQis2WENDO9wa9G0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=yMHtd7MJTlXpzmLzMYwGI6okgW+Ww51NrN/qJgm0JJAGWjGefEOQLBoybRjlVXqW8
 t+eQhTECKAum78vdaMX/+7H/uj8sEQkp7Jip4MX2w+UpR73TOPeJyjSorQntXE7/s9
 vBjpHz5HU1Qq9TzJTfVAIBWVDtC6ocQa1QI/i/+w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=yMHtd7MJ
Subject: [Buildroot] [PATCH v6 3/3] board/ti/am64x_sk: add new board
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
From: Anand Gadiyar via buildroot <buildroot@buildroot.org>
Reply-To: Anand Gadiyar <gadiyar@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Andrew Davis <afd@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4KCkFkZHMgc3VwcG9ydCBmb3IgdGkncyBh
bTY0eF9zayBib2FyZC4KQWRkcyB0aGUgY29uZmlncyBmb3IgZ2VuZXJhdGluZyBvdXRwdXQgc2Rj
YXJkIGltYWdlLgpBZGRzIHRoZSBkZWZjb25maWdzIGZvciBhbTY0eF9zay4KClRoZSBBTTY0eF9z
ayBib2FyZCBpcyBkZXNpZ25lZCBmb3IgdGhlIEFNNjQyIFNvQyB3aXRoCnR3byBBUk0gQ29ydGV4
LUE1MyBhbmQgZm91ciBBUk0gQ29ydGV4LVI1LiBJdCBhbHNvCnN1cHBvcnRzIFJKIDQ1IEV0aGVy
bmV0LCBXaS1GaSwgYW5kIEJsdWV0b290aC4KCk1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGJv
YXJkIGNhbiBiZSBmb3VuZCBhdDoKaHR0cHM6Ly93d3cudGkuY29tL3Rvb2wvU0stQU02NAoKU2ln
bmVkLW9mZi1ieTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5h
bmQgR2FkaXlhciA8Z2FkaXlhckB0aS5jb20+ClJldmlld2VkLWJ5OiBHaXVsaW8gQmVuZXR0aSA8
Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KQWNrZWQtYnk6IEFuZHJldyBE
YXZpcyA8YWZkQHRpLmNvbT4KQ2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNv
bT4KQ2M6IEJyeWFuIEJyYXR0bG9mIDxiYkB0aS5jb20+Ci0tLQogREVWRUxPUEVSUyAgICAgICAg
ICAgICAgICAgICAgIHwgIDQgKysrCiBib2FyZC90aS9hbTY0eF9zay9nZW5pbWFnZS5jZmcgfCAy
NyArKysrKysrKysrKysrKysrKysrCiBib2FyZC90aS9hbTY0eF9zay9yZWFkbWUudHh0ICAgfCA0
OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBjb25maWdzL2FtNjR4X3NrX2Rl
ZmNvbmZpZyAgICAgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVz
IGNoYW5nZWQsIDEyNiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvdGkv
YW02NHhfc2svZ2VuaW1hZ2UuY2ZnCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvdGkvYW02NHhf
c2svcmVhZG1lLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3MvYW02NHhfc2tfZGVmY29u
ZmlnCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggZTY5OWI2ZWM4
MS4uMzhjY2VjMmYyMCAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBA
IC0xMjksOCArMTI5LDEwIEBAIEY6CXBhY2thZ2UvbGlieG1scnBjLwogRjoJcGFja2FnZS9weXRo
b24tZG9jb3B0LwogCiBOOglBbmFuZCBHYWRpeWFyIDxnYWRpeWFyQHRpLmNvbT4KK0Y6CWJvYXJk
L3RpL2FtNjR4X3NrLwogRjoJYm9vdC90aS1rMy1pbWFnZS1nZW4vCiBGOglib290L3RpLWszLXI1
LWxvYWRlci8KK0Y6CWNvbmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnCiAKIE46CUFuZHLDqSBad2lu
ZyA8bmVydkBkYXduY3Jvdy5kZT4KIEY6CXBhY2thZ2UvbGlia3JiNS8KQEAgLTMwNTAsOCArMzA1
MiwxMCBAQCBOOglXb2pjaWVjaCBOaXppxYRza2kgPG5pemlha0BzcG94Lm9yZz4KIEY6CXBhY2th
Z2UvZnd1cC8KIAogTjoJWHVhbmhhbyBTaGkgPFgxNTAwMDE3N0BnbWFpbC5jb20+CitGOglib2Fy
ZC90aS9hbTY0eF9zay8KIEY6CWJvb3QvdGktazMtaW1hZ2UtZ2VuLwogRjoJYm9vdC90aS1rMy1y
NS1sb2FkZXIvCitGOgljb25maWdzL2FtNjR4X3NrX2RlZmNvbmZpZwogCiBOOglZYWlyIEJlbiBB
dnJhaGFtIDx5YWlyYmFAcHJvdG9ubWFpbC5jb20+CiBGOglwYWNrYWdlL2Nhc3luYy8KZGlmZiAt
LWdpdCBhL2JvYXJkL3RpL2FtNjR4X3NrL2dlbmltYWdlLmNmZyBiL2JvYXJkL3RpL2FtNjR4X3Nr
L2dlbmltYWdlLmNmZwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4yNjMw
NGZlOThmCi0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvdGkvYW02NHhfc2svZ2VuaW1hZ2UuY2Zn
CkBAIC0wLDAgKzEsMjcgQEAKK2ltYWdlIGJvb3QudmZhdCB7CisJdmZhdCB7CisJCWZpbGVzID0g
eworCQkJInRpYm9vdDMuYmluIiwKKwkJCSJ0aXNwbC5iaW4iLAorCQkJInUtYm9vdC5pbWciLAor
CQl9CisJfQorCisJc2l6ZSA9IDE2TQorfQorCitpbWFnZSBzZGNhcmQuaW1nIHsKKwloZGltYWdl
IHsKKwl9CisKKwlwYXJ0aXRpb24gdS1ib290IHsKKwkJcGFydGl0aW9uLXR5cGUgPSAweEMKKwkJ
Ym9vdGFibGUgPSAidHJ1ZSIKKwkJaW1hZ2UgPSAiYm9vdC52ZmF0IgorCX0KKworCXBhcnRpdGlv
biByb290ZnMgeworCQlwYXJ0aXRpb24tdHlwZSA9IDB4ODMKKwkJaW1hZ2UgPSAicm9vdGZzLmV4
dDQiCisJfQorfQpkaWZmIC0tZ2l0IGEvYm9hcmQvdGkvYW02NHhfc2svcmVhZG1lLnR4dCBiL2Jv
YXJkL3RpL2FtNjR4X3NrL3JlYWRtZS50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uODA5NmZjYjJkNAotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL3RpL2FtNjR4X3Nr
L3JlYWRtZS50eHQKQEAgLTAsMCArMSw0OSBAQAorVGV4YXMgSW5zdHVtZW50cyBBTTY0eCBTSyBU
ZXN0IGFuZCBEZXZlbG9wbWVudCBCb2FyZAorCitEZXNjcmlwdGlvbgorPT09PT09PT09PT0KKwor
VGhlc2UgY29uZmlndXJhdGlvbnMgd2lsbCBidWlsZCBhIGNvbXBsZXRlIGltYWdlIGFuZAorZGV2
aWNlIHRyZWUgYmxvYnMgZm9yIHRoZSB0aGUgVEkgQU02NHhfc2sgYm9hcmQuCisKK0hvdyB0byBi
dWlsZCBpdAorPT09PT09PT09PT09PT09CisKK1NlbGVjdCB0aGUgZGVmYXVsdCBjb25maWd1cmF0
aW9uIGZvciB0aGUgdGFyZ2V0OgorJCBtYWtlIGFtNjR4X3NrX2RlZmNvbmZpZworCitPcHRpb25h
bDogbW9kaWZ5IHRoZSBjb25maWd1cmF0aW9uOgorJCBtYWtlIG1lbnVjb25maWcKKworQnVpbGQ6
CiskIG1ha2UKKworUmVzdWx0IG9mIHRoZSBidWlsZDoKKz09PT09PT09PT09PT09PT09PT0KK291
dHB1dC9pbWFnZXMvCisrLS0gc29jCisrLS0gdGktY29ubmVjdGl2aXR5CisrLS0gYmwzMS5iaW4K
KystLSBib290LnZmYXQKKystLSBJbWFnZQorKy0tIGszLWFtNjQyLXNrLmR0YgorKy0tIHI1LXUt
Ym9vdC1zcGwuYmluCisrLS0gcm9vdGZzLmV4dDIKKystLSByb290ZnMuZXh0NAorKy0tIHJvb3Rm
cy50YXIKKystLSBzZGNhcmQuaW1nCisrLS0gdGVlLmJpbgorKy0tIHRlZS1oZWFkZXJfdjIuYmlu
CisrLS0gdGVlLXBhZ2VhYmxlX3YyLmJpbgorKy0tIHRlZS1wYWdlcl92Mi5iaW4KKystLSB0aWJv
b3QzLmJpbgorKy0tIHRpc3BsLmJpbgorKy0tIHUtYm9vdC5pbWcKKworVG8gY29weSB0aGUgaW1h
Z2UgZmlsZSB0byB0aGUgc2RjYXJkIHVzZSBkZDoKKyQgZGQgaWY9b3V0cHV0L2ltYWdlcy9zZGNh
cmQuaW1nIG9mPS9kZXYvc2RYCisKK0luc2VydCB0aGUgU0RjYXJkIGludG8gdGhlIEFNNjR4X3Nr
IGJvYXJkLCBhbmQgcG93ZXIgaXQgdXAgd2l0aAorYSBVU0IgVHlwZS1DIGNvbm5lY3Rvci4gVGhl
IHN5c3RlbSBzaG91bGQgY29tZSB1cC4gWW91IGNhbiB1c2UKK2EgbWljcm8tVVNCIHRvIGNvbm5l
Y3QgdG8gdGhlIGNvbm5lY3RvciBsYWJsZWQgTUFJTl9VQVJUMCB0bworY29tbXVuaWNhdGUgd2l0
aCB0aGUgYm9hcmQuCmRpZmYgLS1naXQgYS9jb25maWdzL2FtNjR4X3NrX2RlZmNvbmZpZyBiL2Nv
bmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLmYxYWNkNDkzMjYKLS0tIC9kZXYvbnVsbAorKysgYi9jb25maWdzL2FtNjR4X3NrX2Rl
ZmNvbmZpZwpAQCAtMCwwICsxLDQ2IEBACitCUjJfYWFyY2g2ND15CitCUjJfUk9PVEZTX1BPU1Rf
SU1BR0VfU0NSSVBUPSJzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giCitCUjJfUk9PVEZTX1BP
U1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL3RpL2FtNjR4X3NrL2dlbmltYWdlLmNmZyIKK0JSMl9M
SU5VWF9LRVJORUw9eQorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15CitCUjJfTElO
VVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjAuOSIKK0JSMl9MSU5VWF9LRVJORUxf
VVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQorQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15
CitCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0idGkvazMtYW02NDItc2siCitCUjJf
TElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUPXkKK0JSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJF
PXkKK0JSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX1RJX1dMMThYWD15CitCUjJfVEFSR0VUX1JP
T1RGU19FWFQyPXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15CitCUjJfVEFSR0VUX1JPT1RG
U19FWFQyX1NJWkU9IjEyME0iCitCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFPXkKK0JS
Ml9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT049eQorQlIyX1RBUkdF
VF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTl9WQUxVRT0idjIuNy4wIgorQlIy
X1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0iazMiCitCUjJfVEFSR0VUX0FS
TV9UUlVTVEVEX0ZJUk1XQVJFX1RBUkdFVF9CT0FSRD0ibGl0ZSIKK0JSMl9UQVJHRVRfQVJNX1RS
VVNURURfRklSTVdBUkVfQkwzMl9PUFRFRT15CitCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1X
QVJFX0FERElUSU9OQUxfVkFSSUFCTEVTPSJTUEQ9b3B0ZWVkIgorQlIyX1RBUkdFVF9PUFRFRV9P
Uz15CitCUjJfVEFSR0VUX09QVEVFX09TX05FRURTX1BZVEhPTl9DUllQVE9HUkFQSFk9eQorQlIy
X1RBUkdFVF9PUFRFRV9PU19QTEFURk9STT0iazMiCitCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dF
Tj15CitCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TT0M9ImFtNjR4IgorQlIyX1RBUkdFVF9U
SV9LM19JTUFHRV9HRU5fU09DX1RZUEU9ImdwIgorQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5f
Q09ORklHPSJldm0iCitCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9CT0FSRF9ERUZDT05GSUc9
ImFtNjR4X2V2bV9yNSIKK0JSMl9UQVJHRVRfVUJPT1Q9eQorQlIyX1RBUkdFVF9VQk9PVF9CVUlM
RF9TWVNURU1fS0NPTkZJRz15CitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkKK0JS
Ml9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjIuMTAiCitCUjJfVEFSR0VU
X1VCT09UX0JPQVJEX0RFRkNPTkZJRz0iYW02NHhfZXZtX2E1MyIKK0JSMl9UQVJHRVRfVUJPT1Rf
TkVFRFNfRFRDPXkKK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNTTD15CitCUjJfVEFSR0VU
X1VCT09UX05FRURTX0FURl9CTDMxPXkKKyMgQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfQklOIGlz
IG5vdCBzZXQKK0JSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0lNRz15CitCUjJfVEFSR0VUX1VCT09U
X1NQTD15CitCUjJfVEFSR0VUX1VCT09UX1NQTF9OQU1FPSJ0aXNwbC5iaW4iCitCUjJfVEFSR0VU
X1VCT09UX0NVU1RPTV9NQUtFT1BUUz0iVEVFPSQoQklOQVJJRVNfRElSKS90ZWUtcGFnZXJfdjIu
YmluIgorQlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKK0JSMl9QQUNLQUdFX0hPU1RfR0VO
SU1BR0U9eQorQlIyX1BBQ0tBR0VfSE9TVF9NVE9PTFM9eQotLSAKMi4zNC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
