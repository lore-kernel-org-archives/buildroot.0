Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA3BEB64D9
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 00:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF11341FC8;
	Fri, 16 Jun 2023 00:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF11341FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmxCoKbhwkli; Fri, 16 Jun 2023 00:24:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4827D41FC9;
	Fri, 16 Jun 2023 00:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4827D41FC9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B1231BF97D
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 00:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54F0683D35
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 00:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54F0683D35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ka3hi1DQDUbC for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 00:24:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72F2783D2B
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72F2783D2B
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 00:24:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35G0ODZS055467
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 19:24:13 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35G0ODC8054002
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 19:24:13 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 19:24:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 19:24:13 -0500
Received: from dasso.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35G0OCSE015831;
 Thu, 15 Jun 2023 19:24:13 -0500
To: <buildroot@buildroot.org>
Date: Thu, 15 Jun 2023 19:23:54 -0500
Message-ID: <20230616002359.4139814-6-dannenberg@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616002359.4139814-1-dannenberg@ti.com>
References: <20230616002359.4139814-1-dannenberg@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1686875053;
 bh=P55AA2lkOdJdUyARHLXFFTTPnn4yzZdBD6Z85fB54fo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=twJM0Esf3pl8p0tEb6tD2Pmr4kvsEasLmGpKHqaTJMhJQ9+zMvno4EKHXE4PEWjqn
 MveXc+5/iQA8xHWJ4+hsKjHc9Ef4oAX95GDyL9FBHA3KFOcf7YVuBeauMizRdrhUNY
 DQp0IjPoKXwQW3hS61TxZJQDiy2RYGdUo7iGaoGI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=twJM0Esf
Subject: [Buildroot] [PATCH v8 05/10] board/ti/am62x_sk: add new board
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Xuanhao Shi <x-shi@ti.com>, Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4KCkFkZHMgc3VwcG9ydCBmb3IgVEkncyBT
Sy1BTTYyIGJvYXJkIGJ5IGludHJvZHVjaW5nIHRoZQphbTYyeF9za19kZWZjb25maWcgZmlsZSBh
bmQgcmVsYXRlZCBzdXBwb3J0IGZpbGVzLgoKTW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgYm9h
cmQgY2FuIGJlIGZvdW5kIGF0OgpodHRwczovL3d3dy50aS5jb20vdG9vbC9TSy1BTTYyCgpTaWdu
ZWQtb2ZmLWJ5OiBYdWFuaGFvIFNoaSA8eC1zaGlAdGkuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZWFzIERhbm5lbmJlcmcgPGRhbm5lbmJlcmdAdGkuY29tPgotLS0KIERFVkVMT1BFUlMgICAgICAg
ICAgICAgICAgICAgICB8ICA0ICsrKwogYm9hcmQvdGkvYW02Mnhfc2svZ2VuaW1hZ2UuY2ZnIHwg
MjcgKysrKysrKysrKysrKysrKysrKysKIGJvYXJkL3RpL2FtNjJ4X3NrL3JlYWRtZS50eHQgICB8
IDI2ICsrKysrKysrKysrKysrKysrKysrCiBjb25maWdzL2FtNjJ4X3NrX2RlZmNvbmZpZyAgICAg
fCA0NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQs
IDEwMiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvdGkvYW02Mnhfc2sv
Z2VuaW1hZ2UuY2ZnCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvdGkvYW02Mnhfc2svcmVhZG1l
LnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3MvYW02Mnhfc2tfZGVmY29uZmlnCgpkaWZm
IC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggNjQ4NTA2MWQ0ZC4uNzRiZWRm
NTYwMyAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xMjksOSAr
MTI5LDExIEBAIEY6CXBhY2thZ2UvbGlieG1scnBjLwogRjoJcGFja2FnZS9weXRob24tZG9jb3B0
LwogCiBOOglBbmFuZCBHYWRpeWFyIDxnYWRpeWFyQHRpLmNvbT4KK0Y6CWJvYXJkL3RpL2FtNjJ4
X3NrLwogRjoJYm9hcmQvdGkvYW02NHhfc2svCiBGOglib290L3RpLWszLWltYWdlLWdlbi8KIEY6
CWJvb3QvdGktazMtcjUtbG9hZGVyLworRjoJY29uZmlncy9hbTYyeF9za19kZWZjb25maWcKIEY6
CWNvbmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnCiAKIE46CUFuZHLDqSBad2luZyA8bmVydkBkYXdu
Y3Jvdy5kZT4KQEAgLTMwMjMsOSArMzAyNSwxMSBAQCBOOglXb2pjaWVjaCBOaXppxYRza2kgPG5p
emlha0BzcG94Lm9yZz4KIEY6CXBhY2thZ2UvZnd1cC8KIAogTjoJWHVhbmhhbyBTaGkgPFgxNTAw
MDE3N0BnbWFpbC5jb20+CitGOglib2FyZC90aS9hbTYyeF9zay8KIEY6CWJvYXJkL3RpL2FtNjR4
X3NrLwogRjoJYm9vdC90aS1rMy1pbWFnZS1nZW4vCiBGOglib290L3RpLWszLXI1LWxvYWRlci8K
K0Y6CWNvbmZpZ3MvYW02Mnhfc2tfZGVmY29uZmlnCiBGOgljb25maWdzL2FtNjR4X3NrX2RlZmNv
bmZpZwogCiBOOglZYWlyIEJlbiBBdnJhaGFtIDx5YWlyYmFAcHJvdG9ubWFpbC5jb20+CmRpZmYg
LS1naXQgYS9ib2FyZC90aS9hbTYyeF9zay9nZW5pbWFnZS5jZmcgYi9ib2FyZC90aS9hbTYyeF9z
ay9nZW5pbWFnZS5jZmcKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMjYz
MDRmZTk4ZgotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL3RpL2FtNjJ4X3NrL2dlbmltYWdlLmNm
ZwpAQCAtMCwwICsxLDI3IEBACitpbWFnZSBib290LnZmYXQgeworCXZmYXQgeworCQlmaWxlcyA9
IHsKKwkJCSJ0aWJvb3QzLmJpbiIsCisJCQkidGlzcGwuYmluIiwKKwkJCSJ1LWJvb3QuaW1nIiwK
KwkJfQorCX0KKworCXNpemUgPSAxNk0KK30KKworaW1hZ2Ugc2RjYXJkLmltZyB7CisJaGRpbWFn
ZSB7CisJfQorCisJcGFydGl0aW9uIHUtYm9vdCB7CisJCXBhcnRpdGlvbi10eXBlID0gMHhDCisJ
CWJvb3RhYmxlID0gInRydWUiCisJCWltYWdlID0gImJvb3QudmZhdCIKKwl9CisKKwlwYXJ0aXRp
b24gcm9vdGZzIHsKKwkJcGFydGl0aW9uLXR5cGUgPSAweDgzCisJCWltYWdlID0gInJvb3Rmcy5l
eHQ0IgorCX0KK30KZGlmZiAtLWdpdCBhL2JvYXJkL3RpL2FtNjJ4X3NrL3JlYWRtZS50eHQgYi9i
b2FyZC90aS9hbTYyeF9zay9yZWFkbWUudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAuLmNjYmIyNDg5NmIKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC90aS9hbTYyeF9z
ay9yZWFkbWUudHh0CkBAIC0wLDAgKzEsMjYgQEAKK1RleGFzIEluc3R1bWVudHMgU0stQU02MiBU
ZXN0IGFuZCBEZXZlbG9wbWVudCBCb2FyZAorCitEZXNjcmlwdGlvbgorPT09PT09PT09PT0KK1Ro
aXMgY29uZmlndXJhdGlvbiB3aWxsIGJ1aWxkIGEgY29tcGxldGUgaW1hZ2UgZm9yIHRoZSBUSSBT
Sy1BTTYyIGJvYXJkLgorCitIb3cgdG8gQnVpbGQKKz09PT09PT09PT09PQorU2VsZWN0IHRoZSBk
ZWZhdWx0IGNvbmZpZ3VyYXRpb24gZm9yIHRoZSB0YXJnZXQ6CiskIG1ha2UgYW02Mnhfc2tfZGVm
Y29uZmlnCisKK09wdGlvbmFsOiBtb2RpZnkgdGhlIGNvbmZpZ3VyYXRpb246CiskIG1ha2UgbWVu
dWNvbmZpZworCitCdWlsZDoKKyQgbWFrZQorCitUbyBjb3B5IHRoZSByZXN1bHRpbWcgb3V0cHV0
IGltYWdlIGZpbGUgdG8gYW4gU0QgY2FyZCB1c2UgZGQ6CiskIGRkIGlmPW91dHB1dC9pbWFnZXMv
c2RjYXJkLmltZyBvZj0vZGV2L3NkWCBicz0xTQorCitIb3cgdG8gUnVuCis9PT09PT09PT09CitJ
bnNlcnQgdGhlIFNEIGNhcmQgaW50byB0aGUgU0stQU02MiBib2FyZCwgYW5kIHBvd2VyIGl0IHVw
IHRocm91Z2gKK3RoZSBVU0IgVHlwZS1DIGNvbm5lY3Rvci4gVGhlIHN5c3RlbSBzaG91bGQgY29t
ZSB1cC4gWW91IGNhbiB1c2UKK2EgbWljcm8tVVNCIGNhYmxlIHRvIGNvbm5lY3QgdG8gdGhlIGNv
bm5lY3RvciBsYWJlbGVkIFVBUlQgdG8KK2NvbW11bmljYXRlIHdpdGggdGhlIGJvYXJkLgpkaWZm
IC0tZ2l0IGEvY29uZmlncy9hbTYyeF9za19kZWZjb25maWcgYi9jb25maWdzL2FtNjJ4X3NrX2Rl
ZmNvbmZpZwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi40YmFiZjI2NzE5
Ci0tLSAvZGV2L251bGwKKysrIGIvY29uZmlncy9hbTYyeF9za19kZWZjb25maWcKQEAgLTAsMCAr
MSw0NSBAQAorQlIyX2FhcmNoNjQ9eQorQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3Vw
cG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgorQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSIt
YyBib2FyZC90aS9hbTYyeF9zay9nZW5pbWFnZS5jZmciCitCUjJfTElOVVhfS0VSTkVMPXkKK0JS
Ml9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQorQlIyX0xJTlVYX0tFUk5F
TF9EVFNfU1VQUE9SVD15CitCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0idGkvazMt
YW02MjUtc2siCitCUjJfTElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUPXkKK0JSMl9QQUNLQUdF
X0xJTlVYX0ZJUk1XQVJFPXkKK0JSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX1RJX1dMMThYWD15
CitCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15CitC
UjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjI1Nk0iCitCUjJfVEFSR0VUX0FSTV9UUlVTVEVE
X0ZJUk1XQVJFPXkKK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJ
T049eQorQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTl9WQUxV
RT0idjIuNy4wIgorQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0iazMi
CitCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1RBUkdFVF9CT0FSRD0ibGl0ZSIKK0JS
Ml9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQkwzMl9PUFRFRT15CitCUjJfVEFSR0VUX09Q
VEVFX09TPXkKK0JSMl9UQVJHRVRfT1BURUVfT1NfUExBVEZPUk09ImszIgorQlIyX1RBUkdFVF9U
SV9LM19JTUFHRV9HRU49eQorQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU09DPSJhbTYyeCIK
K0JSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQ19UWVBFPSJncCIKK0JSMl9UQVJHRVRfVElf
SzNfSU1BR0VfR0VOX0NPTkZJRz0iZXZtIgorQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVI9eQor
QlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQk9BUkRfREVGQ09ORklHPSJhbTYyeF9ldm1fcjUi
CitCUjJfVEFSR0VUX1VCT09UPXkKK0JSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05G
SUc9eQorQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTj15CitCUjJfVEFSR0VUX1VCT09U
X0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIyLjEwIgorQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9E
RUZDT05GSUc9ImFtNjJ4X2V2bV9hNTMiCitCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15CitC
UjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eQorQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19B
VEZfQkwzMT15CitCUjJfVEFSR0VUX1VCT09UX05FRURTX1RJX0szX0RNPXkKK0JSMl9UQVJHRVRf
VUJPT1RfVElfSzNfRE1fU09DPSJhbTYyeHgiCisjIEJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0JJ
TiBpcyBub3Qgc2V0CitCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JTUc9eQorQlIyX1RBUkdFVF9V
Qk9PVF9TUEw9eQorQlIyX1RBUkdFVF9VQk9PVF9TUExfTkFNRT0idGlzcGwuYmluIgorQlIyX1RB
UkdFVF9VQk9PVF9DVVNUT01fTUFLRU9QVFM9IlRFRT0kKEJJTkFSSUVTX0RJUikvdGVlLXBhZ2Vy
X3YyLmJpbiIKK0JSMl9QQUNLQUdFX0hPU1RfRE9TRlNUT09MUz15CitCUjJfUEFDS0FHRV9IT1NU
X0dFTklNQUdFPXkKK0JSMl9QQUNLQUdFX0hPU1RfTVRPT0xTPXkKLS0gCjIuMzQuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
