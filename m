Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D097EC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F8CC409FA;
	Tue,  2 Aug 2022 20:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F8CC409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9sBsbp7PZcg7; Tue,  2 Aug 2022 20:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E346409E3;
	Tue,  2 Aug 2022 20:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E346409E3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 518CE1BF9B5
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C720817AB
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C720817AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C7O3z4-N26sp for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 20:05:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E193C81352
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E193C81352
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 20:05:27 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 272K5O7d090289;
 Tue, 2 Aug 2022 15:05:24 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 272K5OAU044976
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Aug 2022 15:05:24 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 2
 Aug 2022 15:05:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 2 Aug 2022 15:05:23 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 272K5M3T106903;
 Tue, 2 Aug 2022 15:05:23 -0500
To: <buildroot@buildroot.org>
Date: Tue, 2 Aug 2022 15:05:22 -0500
Message-ID: <20220802200522.4619-4-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220802200522.4619-1-x-shi@ti.com>
References: <20220802200522.4619-1-x-shi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1659470724;
 bh=Xb8jegpDzZBgI3EcZn1TGufzfQwriPM4p1cH6uIb+Ms=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vqwQjMfR4cQ4mgSuMnISjPLUiBQV5SKFuXgA7zEoNgf7y5JkIAps1cFMjyfBwqyXd
 F1fymaZ8ZRL7IyfrzJM67DTORWDD7mF5/KzTNY1neHXu1GPbRIeqfyq4Avlk+jf95w
 PeU4whZOYW0JkS25i1qX/uYuhuB87m9G61PyXc0E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=vqwQjMfR
Subject: [Buildroot] [PATCH 3/3] board/ti/am64x_sk: add new board
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkcyBzdXBwb3J0IGZvciB0aSdzIGFtNjR4X3NrIGJvYXJkLgpBZGRzIHRoZSBjb25maWdzIGZv
ciBnZW5lcmF0aW5nIG91dHB1dCBzZGNhcmQgaW1hZ2UuCkFkZHMgdGhlIGRlZmNvbmZpZ3MgZm9y
IGFtNjR4X3NrLgoKU2lnbmVkLW9mZi1ieTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4KLS0t
CiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgfCAgNCArKysKIGJvYXJkL3RpL2FtNjR4
X3NrL2dlbmltYWdlLmNmZyB8IDI3ICsrKysrKysrKysrKysrKysrKysKIGJvYXJkL3RpL2FtNjR4
X3NrL3JlYWRtZS50eHQgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IGNvbmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnICAgICB8IDQ4ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAxMjggaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjR4X3NrL2dlbmltYWdlLmNmZwogY3JlYXRlIG1vZGUg
MTAwNjQ0IGJvYXJkL3RpL2FtNjR4X3NrL3JlYWRtZS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBj
b25maWdzL2FtNjR4X3NrX2RlZmNvbmZpZwoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZF
TE9QRVJTCmluZGV4IGIyMWRlZjExMWMuLmUzZDk5NDQzZTkgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BF
UlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTI4LDggKzEyOCwxMCBAQCBGOglwYWNrYWdlL2xpYnht
bHJwYy8KIEY6CXBhY2thZ2UvcHl0aG9uLWRvY29wdC8KIAogTjoJQW5hbmQgR2FkaXlhciA8Z2Fk
aXlhckB0aS5jb20+CitGOglib2FyZC90aS9hbTY0eF9zay8KIEY6CWJvb3QvdGktazMtaW1hZ2Ut
Z2VuLwogRjoJYm9vdC90aS1rMy1yNS1sb2FkZXIvCitGOgljb25maWdzL2FtNjR4X3NrX2RlZmNv
bmZpZwogCiBOOglBbmRyw6kgWndpbmcgPG5lcnZAZGF3bmNyb3cuZGU+CiBGOglwYWNrYWdlL2xp
YmtyYjUvCkBAIC0zMDI2LDggKzMwMjgsMTAgQEAgTjoJV29qY2llY2ggTml6acWEc2tpIDxuaXpp
YWtAc3BveC5vcmc+CiBGOglwYWNrYWdlL2Z3dXAvCiAKIE46CVh1YW5oYW8gU2hpIDxYMTUwMDAx
NzdAZ21haWwuY29tPgorRjoJYm9hcmQvdGkvYW02NHhfc2svCiBGOglib290L3RpLWszLWltYWdl
LWdlbi8KIEY6CWJvb3QvdGktazMtcjUtbG9hZGVyLworRjoJY29uZmlncy9hbTY0eF9za19kZWZj
b25maWcKIAogTjoJWWFpciBCZW4gQXZyYWhhbSA8eWFpcmJhQHByb3Rvbm1haWwuY29tPgogRjoJ
cGFja2FnZS9jYXN5bmMvCmRpZmYgLS1naXQgYS9ib2FyZC90aS9hbTY0eF9zay9nZW5pbWFnZS5j
ZmcgYi9ib2FyZC90aS9hbTY0eF9zay9nZW5pbWFnZS5jZmcKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uMjYzMDRmZTk4ZgotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL3Rp
L2FtNjR4X3NrL2dlbmltYWdlLmNmZwpAQCAtMCwwICsxLDI3IEBACitpbWFnZSBib290LnZmYXQg
eworCXZmYXQgeworCQlmaWxlcyA9IHsKKwkJCSJ0aWJvb3QzLmJpbiIsCisJCQkidGlzcGwuYmlu
IiwKKwkJCSJ1LWJvb3QuaW1nIiwKKwkJfQorCX0KKworCXNpemUgPSAxNk0KK30KKworaW1hZ2Ug
c2RjYXJkLmltZyB7CisJaGRpbWFnZSB7CisJfQorCisJcGFydGl0aW9uIHUtYm9vdCB7CisJCXBh
cnRpdGlvbi10eXBlID0gMHhDCisJCWJvb3RhYmxlID0gInRydWUiCisJCWltYWdlID0gImJvb3Qu
dmZhdCIKKwl9CisKKwlwYXJ0aXRpb24gcm9vdGZzIHsKKwkJcGFydGl0aW9uLXR5cGUgPSAweDgz
CisJCWltYWdlID0gInJvb3Rmcy5leHQ0IgorCX0KK30KZGlmZiAtLWdpdCBhL2JvYXJkL3RpL2Ft
NjR4X3NrL3JlYWRtZS50eHQgYi9ib2FyZC90aS9hbTY0eF9zay9yZWFkbWUudHh0Cm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjllMTg0Yzk4NjYKLS0tIC9kZXYvbnVsbAor
KysgYi9ib2FyZC90aS9hbTY0eF9zay9yZWFkbWUudHh0CkBAIC0wLDAgKzEsNDkgQEAKK1RleGFz
IEluc3R1bWVudHMgQU02NHggRXZhbHVhdGlvbiBNb2R1bGVzCisKK0Rlc2NyaXB0aW9uCis9PT09
PT09PT09PQorCitUaGVzZSBjb25maWd1cmF0aW9ucyB3aWxsIGJ1aWxkIGEgY29tcGxldGUgaW1h
Z2UgYW5kIAorZGV2aWNlIHRyZWUgYmxvYnMgZm9yIHRoZSB0aGUgVEkgQU02NHhfc2sgYm9hcmQu
CisKK0hvdyB0byBidWlsZCBpdAorPT09PT09PT09PT09PT09CisKK1NlbGVjdCB0aGUgZGVmYXVs
dCBjb25maWd1cmF0aW9uIGZvciB0aGUgdGFyZ2V0OgorJCBtYWtlIGFtNjR4X3NrX2RlZmNvbmZp
ZworCitPcHRpb25hbDogbW9kaWZ5IHRoZSBjb25maWd1cmF0aW9uOgorJCBtYWtlIG1lbnVjb25m
aWcKKworQnVpbGQ6CiskIG1ha2UKKworUmVzdWx0IG9mIHRoZSBidWlsZDoKKz09PT09PT09PT09
PT09PT09PT0KK291dHB1dC9pbWFnZXMvCisrLS0gc29jCisrLS0gdGktY29ubmVjdGl2aXR5Cisr
LS0gYmwzMS5iaW4KKystLSBib290LnZmYXQKKystLSBJbWFnZQorKy0tIGszLWFtNjQyLXNrLmR0
YgorKy0tIHI1LXUtYm9vdC1zcGwuYmluCisrLS0gcm9vdGZzLmV4dDIKKystLSByb290ZnMuZXh0
NAorKy0tIHJvb3Rmcy50YXIKKystLSBzZGNhcmQuaW1nCisrLS0gdGVlLmJpbgorKy0tIHRlZS1o
ZWFkZXJfdjIuYmluCisrLS0gdGVlLXBhZ2VhYmxlX3YyLmJpbgorKy0tIHRlZS1wYWdlcl92Mi5i
aW4KKystLSB0aWJvb3QzLmJpbgorKy0tIHRpc3BsLmJpbgorKy0tIHUtYm9vdC5pbWcKKworVG8g
Y29weSB0aGUgaW1hZ2UgZmlsZSB0byB0aGUgc2RjYXJkIHVzZSBkZDoKKyQgZGQgaWY9b3V0cHV0
L2ltYWdlcy9zZGNhcmQuaW1nIG9mPS9kZXYvc2RYCisKK0luc2VydCB0aGUgU0RjYXJkIGludG8g
dGhlIEFNNjR4X3NrIGJvYXJkLCBhbmQgcG93ZXIgaXQgdXAgd2l0aCAKK2EgVVNCIFR5cGUtQyBj
b25uZWN0b3IuIFRoZSBzeXN0ZW0gc2hvdWxkIGNvbWUgdXAuIFlvdSBjYW4gdXNlIAorYSBtaWNy
by1VU0IgdG8gY29ubmVjdCB0byB0aGUgY29ubmVjdG9yIGxhYmxlZCBNQUlOX1VBUlQwIHRvIAor
Y29tbXVuaWNhdGUgd2l0aCB0aGUgYm9hcmQuCmRpZmYgLS1naXQgYS9jb25maWdzL2FtNjR4X3Nr
X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAuLjYwYTRlZmNhZjAKLS0tIC9kZXYvbnVsbAorKysgYi9jb25m
aWdzL2FtNjR4X3NrX2RlZmNvbmZpZwpAQCAtMCwwICsxLDQ4IEBACitCUjJfYWFyY2g2ND15CitC
UjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2gi
CitCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL3RpL2FtNjR4X3NrL2dlbmlt
YWdlLmNmZyIKK0JSMl9MSU5VWF9LRVJORUw9eQorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVS
U0lPTj15CitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE5IgorQlIy
X0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJRz15CitCUjJfTElOVVhfS0VSTkVM
X0RUU19TVVBQT1JUPXkKK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJ0aS9rMy1h
bTY0Mi1zayIKK0JSMl9MSU5VWF9LRVJORUxfSU5TVEFMTF9UQVJHRVQ9eQorQlIyX1BBQ0tBR0Vf
TElOVVhfRklSTVdBUkU9eQorQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfVElfV0wxOFhYPXkK
K0JSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQorQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKK0JS
Ml9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKK0JSMl9UQVJHRVRfQVJNX1RSVVNURURf
RklSTVdBUkU9eQorQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lP
Tj15CitCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVF
PSJ2Mi43LjAiCitCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1BMQVRGT1JNPSJrMyIK
K0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfVEFSR0VUX0JPQVJEPSJsaXRlIgorQlIy
X1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9CTDMyX09QVEVFPXkKK0JSMl9UQVJHRVRfQVJN
X1RSVVNURURfRklSTVdBUkVfQURESVRJT05BTF9WQVJJQUJMRVM9IlNQRD1vcHRlZWQiCitCUjJf
VEFSR0VUX09QVEVFX09TPXkKK0JSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX0dJVD15CitCUjJf
VEFSR0VUX09QVEVFX09TX0NVU1RPTV9SRVBPX1VSTD0iaHR0cHM6Ly9naXRodWIuY29tL09QLVRF
RS9vcHRlZV9vcy5naXQiCitCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9SRVBPX1ZFUlNJT049
IjMuMTguMCIKK0JSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWT15
CitCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JNPSJrMyIKK0JSMl9UQVJHRVRfVElfSzNfSU1B
R0VfR0VOPXkKK0JSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQz0iYW02NHgiCitCUjJfVEFS
R0VUX1RJX0szX0lNQUdFX0dFTl9DT05GSUc9ImV2bSIKK0JSMl9UQVJHRVRfVElfSzNfUjVfTE9B
REVSX0JPQVJEPSJhbTY0eF9ldm0iCitCUjJfVEFSR0VUX1VCT09UPXkKK0JSMl9UQVJHRVRfVUJP
T1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQorQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lP
Tj15CitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIyLjEwLXJjMSIK
K0JSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJhbTY0eF9ldm1fYTUzIgorQlIyX1RB
UkdFVF9VQk9PVF9ORUVEU19EVEM9eQorQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMPXkK
K0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzE9eQorIyBCUjJfVEFSR0VUX1VCT09UX0ZP
Uk1BVF9CSU4gaXMgbm90IHNldAorQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfSU1HPXkKK0JSMl9U
QVJHRVRfVUJPT1RfU1BMPXkKK0JSMl9UQVJHRVRfVUJPT1RfU1BMX05BTUU9InRpc3BsLmJpbiIK
K0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX01BS0VPUFRTPSJURUU9JChCSU5BUklFU19ESVIpL3Rl
ZS1wYWdlcl92Mi5iaW4iCitCUjJfUEFDS0FHRV9IT1NUX0RPU0ZTVE9PTFM9eQorQlIyX1BBQ0tB
R0VfSE9TVF9HRU5JTUFHRT15CitCUjJfUEFDS0FHRV9IT1NUX01UT09MUz15Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
