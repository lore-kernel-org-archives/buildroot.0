Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65ACC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 15:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 663A78264A;
	Wed,  3 Aug 2022 15:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 663A78264A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7FVFMM2FAkE; Wed,  3 Aug 2022 15:59:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 621FE82605;
	Wed,  3 Aug 2022 15:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 621FE82605
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E01B11BF25B
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 15:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C43A54027D
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 15:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C43A54027D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ib2FgHFawAUj for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 15:59:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15E8C400A2
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15E8C400A2
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 15:59:13 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 273Fx8dn019292;
 Wed, 3 Aug 2022 10:59:08 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 273Fx7HE017366
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Aug 2022 10:59:07 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 3
 Aug 2022 10:59:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 3 Aug 2022 10:59:07 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 273Fx6R5110896;
 Wed, 3 Aug 2022 10:59:07 -0500
To: <buildroot@buildroot.org>
Date: Wed, 3 Aug 2022 10:59:06 -0500
Message-ID: <20220803155906.19630-4-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220803155906.19630-1-x-shi@ti.com>
References: <20220803155906.19630-1-x-shi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1659542348;
 bh=BJHMBOO91A0HJuCBs9tXdriXOzoN6InqfL+IT3oZFNE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=sQxsKUrhwAojCm8SuI6pmCIsu7mH0Y0/Zz2S5fqgrrYnSCGYoVtEB+xzKcSjyE36a
 1Z7aOHo8sKiS22WtlybE/KBoirNqB8xeKKsOwkz/yErBFNwuHQmO5OKf2QllYpyl3+
 RYBPRBtTaaxLtvLwFjTpBaXt54NkhAvOCfATtYv4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=sQxsKUrh
Subject: [Buildroot] [PATCH v4 3/3] board/ti/am64x_sk: add new board
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
From: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Reply-To: Xuanhao Shi <x-shi@ti.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkcyBzdXBwb3J0IGZvciB0aSdzIGFtNjR4X3NrIGJvYXJkLgpBZGRzIHRoZSBjb25maWdzIGZv
ciBnZW5lcmF0aW5nIG91dHB1dCBzZGNhcmQgaW1hZ2UuCkFkZHMgdGhlIGRlZmNvbmZpZ3MgZm9y
IGFtNjR4X3NrLgoKVGhlIEFNNjR4X3NrIGJvYXJkIGlzIGRlc2lnbmVkIGZvciB0aGUgQU02NDIg
U29DIHdpdGgKdHdvIEFSTSBDb3J0ZXgtQTUzIGFuZCBmb3VyIEFSTSBDb3J0ZXgtUjUuIEl0IGFs
c28Kc3VwcG9ydHMgUkogNDUgRXRoZXJuZXQsIFdpLUZpLCBhbmQgQmx1ZXRvb3RoLgoKTW9yZSBp
bmZvcm1hdGlvbiBhYm91dCB0aGUgYm9hcmQgY2FuIGJlIGZvdW5kIGF0OgpodHRwczovL3d3dy50
aS5jb20vdG9vbC9TSy1BTTY0CgpTaWduZWQtb2ZmLWJ5OiBYdWFuaGFvIFNoaSA8eC1zaGlAdGku
Y29tPgpTaWduZWQtb2ZmLWJ5OiBBbmFuZCBHYWRpeWFyIDxnYWRpeWFyQHRpLmNvbT4KUmV2aWV3
ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcu
Y29tPgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrKwogYm9hcmQv
dGkvYW02NHhfc2svZ2VuaW1hZ2UuY2ZnIHwgMjcgKysrKysrKysrKysrKysrKysrKwogYm9hcmQv
dGkvYW02NHhfc2svcmVhZG1lLnR4dCAgIHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogY29uZmlncy9hbTY0eF9za19kZWZjb25maWcgICAgIHwgNDggKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDEyOCBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvdGkvYW02NHhfc2svZ2VuaW1hZ2UuY2ZnCiBjcmVh
dGUgbW9kZSAxMDA2NDQgYm9hcmQvdGkvYW02NHhfc2svcmVhZG1lLnR4dAogY3JlYXRlIG1vZGUg
MTAwNjQ0IGNvbmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVS
UyBiL0RFVkVMT1BFUlMKaW5kZXggYjIxZGVmMTExYy4uZTNkOTk0NDNlOSAxMDA2NDQKLS0tIGEv
REVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xMjgsOCArMTI4LDEwIEBAIEY6CXBhY2th
Z2UvbGlieG1scnBjLwogRjoJcGFja2FnZS9weXRob24tZG9jb3B0LwogCiBOOglBbmFuZCBHYWRp
eWFyIDxnYWRpeWFyQHRpLmNvbT4KK0Y6CWJvYXJkL3RpL2FtNjR4X3NrLwogRjoJYm9vdC90aS1r
My1pbWFnZS1nZW4vCiBGOglib290L3RpLWszLXI1LWxvYWRlci8KK0Y6CWNvbmZpZ3MvYW02NHhf
c2tfZGVmY29uZmlnCiAKIE46CUFuZHLDqSBad2luZyA8bmVydkBkYXduY3Jvdy5kZT4KIEY6CXBh
Y2thZ2UvbGlia3JiNS8KQEAgLTMwMjYsOCArMzAyOCwxMCBAQCBOOglXb2pjaWVjaCBOaXppxYRz
a2kgPG5pemlha0BzcG94Lm9yZz4KIEY6CXBhY2thZ2UvZnd1cC8KIAogTjoJWHVhbmhhbyBTaGkg
PFgxNTAwMDE3N0BnbWFpbC5jb20+CitGOglib2FyZC90aS9hbTY0eF9zay8KIEY6CWJvb3QvdGkt
azMtaW1hZ2UtZ2VuLwogRjoJYm9vdC90aS1rMy1yNS1sb2FkZXIvCitGOgljb25maWdzL2FtNjR4
X3NrX2RlZmNvbmZpZwogCiBOOglZYWlyIEJlbiBBdnJhaGFtIDx5YWlyYmFAcHJvdG9ubWFpbC5j
b20+CiBGOglwYWNrYWdlL2Nhc3luYy8KZGlmZiAtLWdpdCBhL2JvYXJkL3RpL2FtNjR4X3NrL2dl
bmltYWdlLmNmZyBiL2JvYXJkL3RpL2FtNjR4X3NrL2dlbmltYWdlLmNmZwpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4yNjMwNGZlOThmCi0tLSAvZGV2L251bGwKKysrIGIv
Ym9hcmQvdGkvYW02NHhfc2svZ2VuaW1hZ2UuY2ZnCkBAIC0wLDAgKzEsMjcgQEAKK2ltYWdlIGJv
b3QudmZhdCB7CisJdmZhdCB7CisJCWZpbGVzID0geworCQkJInRpYm9vdDMuYmluIiwKKwkJCSJ0
aXNwbC5iaW4iLAorCQkJInUtYm9vdC5pbWciLAorCQl9CisJfQorCisJc2l6ZSA9IDE2TQorfQor
CitpbWFnZSBzZGNhcmQuaW1nIHsKKwloZGltYWdlIHsKKwl9CisKKwlwYXJ0aXRpb24gdS1ib290
IHsKKwkJcGFydGl0aW9uLXR5cGUgPSAweEMKKwkJYm9vdGFibGUgPSAidHJ1ZSIKKwkJaW1hZ2Ug
PSAiYm9vdC52ZmF0IgorCX0KKworCXBhcnRpdGlvbiByb290ZnMgeworCQlwYXJ0aXRpb24tdHlw
ZSA9IDB4ODMKKwkJaW1hZ2UgPSAicm9vdGZzLmV4dDQiCisJfQorfQpkaWZmIC0tZ2l0IGEvYm9h
cmQvdGkvYW02NHhfc2svcmVhZG1lLnR4dCBiL2JvYXJkL3RpL2FtNjR4X3NrL3JlYWRtZS50eHQK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uOWUxODRjOTg2NgotLS0gL2Rl
di9udWxsCisrKyBiL2JvYXJkL3RpL2FtNjR4X3NrL3JlYWRtZS50eHQKQEAgLTAsMCArMSw0OSBA
QAorVGV4YXMgSW5zdHVtZW50cyBBTTY0eCBTSyBUZXN0IGFuZCBEZXZlbG9wbWVudCBCb2FyZAor
CitEZXNjcmlwdGlvbgorPT09PT09PT09PT0KKworVGhlc2UgY29uZmlndXJhdGlvbnMgd2lsbCBi
dWlsZCBhIGNvbXBsZXRlIGltYWdlIGFuZAorZGV2aWNlIHRyZWUgYmxvYnMgZm9yIHRoZSB0aGUg
VEkgQU02NHhfc2sgYm9hcmQuCisKK0hvdyB0byBidWlsZCBpdAorPT09PT09PT09PT09PT09CisK
K1NlbGVjdCB0aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uIGZvciB0aGUgdGFyZ2V0OgorJCBtYWtl
IGFtNjR4X3NrX2RlZmNvbmZpZworCitPcHRpb25hbDogbW9kaWZ5IHRoZSBjb25maWd1cmF0aW9u
OgorJCBtYWtlIG1lbnVjb25maWcKKworQnVpbGQ6CiskIG1ha2UKKworUmVzdWx0IG9mIHRoZSBi
dWlsZDoKKz09PT09PT09PT09PT09PT09PT0KK291dHB1dC9pbWFnZXMvCisrLS0gc29jCisrLS0g
dGktY29ubmVjdGl2aXR5CisrLS0gYmwzMS5iaW4KKystLSBib290LnZmYXQKKystLSBJbWFnZQor
Ky0tIGszLWFtNjQyLXNrLmR0YgorKy0tIHI1LXUtYm9vdC1zcGwuYmluCisrLS0gcm9vdGZzLmV4
dDIKKystLSByb290ZnMuZXh0NAorKy0tIHJvb3Rmcy50YXIKKystLSBzZGNhcmQuaW1nCisrLS0g
dGVlLmJpbgorKy0tIHRlZS1oZWFkZXJfdjIuYmluCisrLS0gdGVlLXBhZ2VhYmxlX3YyLmJpbgor
Ky0tIHRlZS1wYWdlcl92Mi5iaW4KKystLSB0aWJvb3QzLmJpbgorKy0tIHRpc3BsLmJpbgorKy0t
IHUtYm9vdC5pbWcKKworVG8gY29weSB0aGUgaW1hZ2UgZmlsZSB0byB0aGUgc2RjYXJkIHVzZSBk
ZDoKKyQgZGQgaWY9b3V0cHV0L2ltYWdlcy9zZGNhcmQuaW1nIG9mPS9kZXYvc2RYCisKK0luc2Vy
dCB0aGUgU0RjYXJkIGludG8gdGhlIEFNNjR4X3NrIGJvYXJkLCBhbmQgcG93ZXIgaXQgdXAgd2l0
aAorYSBVU0IgVHlwZS1DIGNvbm5lY3Rvci4gVGhlIHN5c3RlbSBzaG91bGQgY29tZSB1cC4gWW91
IGNhbiB1c2UKK2EgbWljcm8tVVNCIHRvIGNvbm5lY3QgdG8gdGhlIGNvbm5lY3RvciBsYWJsZWQg
TUFJTl9VQVJUMCB0bworY29tbXVuaWNhdGUgd2l0aCB0aGUgYm9hcmQuCmRpZmYgLS1naXQgYS9j
b25maWdzL2FtNjR4X3NrX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjYwYTRlZmNhZjAKLS0tIC9kZXYv
bnVsbAorKysgYi9jb25maWdzL2FtNjR4X3NrX2RlZmNvbmZpZwpAQCAtMCwwICsxLDQ4IEBACitC
UjJfYWFyY2g2ND15CitCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJzdXBwb3J0L3Njcmlw
dHMvZ2VuaW1hZ2Uuc2giCitCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL3Rp
L2FtNjR4X3NrL2dlbmltYWdlLmNmZyIKK0JSMl9MSU5VWF9LRVJORUw9eQorQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVkVSU0lPTj15CitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSI1LjE5IgorQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJRz15CitC
UjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RU
U19OQU1FPSJ0aS9rMy1hbTY0Mi1zayIKK0JSMl9MSU5VWF9LRVJORUxfSU5TVEFMTF9UQVJHRVQ9
eQorQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkU9eQorQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdB
UkVfVElfV0wxOFhYPXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQorQlIyX1RBUkdFVF9ST09U
RlNfRVhUMl80PXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKK0JSMl9UQVJH
RVRfQVJNX1RSVVNURURfRklSTVdBUkU9eQorQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FS
RV9DVVNUT01fVkVSU0lPTj15CitCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RP
TV9WRVJTSU9OX1ZBTFVFPSJ2Mi43LjAiCitCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJF
X1BMQVRGT1JNPSJrMyIKK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfVEFSR0VUX0JP
QVJEPSJsaXRlIgorQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9CTDMyX09QVEVFPXkK
K0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQURESVRJT05BTF9WQVJJQUJMRVM9IlNQ
RD1vcHRlZWQiCitCUjJfVEFSR0VUX09QVEVFX09TPXkKK0JSMl9UQVJHRVRfT1BURUVfT1NfQ1VT
VE9NX0dJVD15CitCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9SRVBPX1VSTD0iaHR0cHM6Ly9n
aXRodWIuY29tL09QLVRFRS9vcHRlZV9vcy5naXQiCitCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RP
TV9SRVBPX1ZFUlNJT049IjMuMTguMCIKK0JSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9O
X0NSWVBUT0dSQVBIWT15CitCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JNPSJrMyIKK0JSMl9U
QVJHRVRfVElfSzNfSU1BR0VfR0VOPXkKK0JSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQz0i
YW02NHgiCitCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9DT05GSUc9ImV2bSIKK0JSMl9UQVJH
RVRfVElfSzNfUjVfTE9BREVSX0JPQVJEPSJhbTY0eF9ldm0iCitCUjJfVEFSR0VUX1VCT09UPXkK
K0JSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQorQlIyX1RBUkdFVF9VQk9P
VF9DVVNUT01fVkVSU0lPTj15CitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVF
PSIyMDIyLjEwLXJjMSIKK0JSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJhbTY0eF9l
dm1fYTUzIgorQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQorQlIyX1RBUkdFVF9VQk9PVF9O
RUVEU19PUEVOU1NMPXkKK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzE9eQorIyBCUjJf
VEFSR0VUX1VCT09UX0ZPUk1BVF9CSU4gaXMgbm90IHNldAorQlIyX1RBUkdFVF9VQk9PVF9GT1JN
QVRfSU1HPXkKK0JSMl9UQVJHRVRfVUJPT1RfU1BMPXkKK0JSMl9UQVJHRVRfVUJPT1RfU1BMX05B
TUU9InRpc3BsLmJpbiIKK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX01BS0VPUFRTPSJURUU9JChC
SU5BUklFU19ESVIpL3RlZS1wYWdlcl92Mi5iaW4iCitCUjJfUEFDS0FHRV9IT1NUX0RPU0ZTVE9P
TFM9eQorQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15CitCUjJfUEFDS0FHRV9IT1NUX01UT09M
Uz15Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
