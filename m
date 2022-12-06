Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4A0C352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 17:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EC8B81ECF;
	Tue,  6 Dec 2022 17:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EC8B81ECF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id USbsarnoHCeD; Tue,  6 Dec 2022 17:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A204980A4E;
	Tue,  6 Dec 2022 17:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A204980A4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 183071BF297
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 17:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F14F0400BB
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 17:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F14F0400BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJH6rUrLbGBB for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 17:17:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B508D40A6A
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B508D40A6A
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 17:17:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B6HHJZp110280;
 Tue, 6 Dec 2022 11:17:19 -0600
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B6HHJ5a021026
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Dec 2022 11:17:19 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 6
 Dec 2022 11:17:19 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 6 Dec 2022 11:17:19 -0600
Received: from uda0393673 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B6HHJYa068198;
 Tue, 6 Dec 2022 11:17:19 -0600
Received: from a0393673 by uda0393673 with local (Exim 4.95)
 (envelope-from <gadiyar@ti.com>) id 1p2bZH-0038UB-E4;
 Tue, 06 Dec 2022 11:17:19 -0600
To: <buildroot@buildroot.org>
Date: Tue, 6 Dec 2022 11:17:19 -0600
Message-ID: <20221206171719.747581-4-gadiyar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206171719.747581-1-gadiyar@ti.com>
References: <20221206171719.747581-1-gadiyar@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1670347039;
 bh=wFZleRJWWHEAAM0ZoMBXJcRuAJStgJV15h/5mg6AeqI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=oBvAecG8co1uh5HAnth4qaiWWq4hC6/DH3NxxLEtlZP/oQ2bSYkE2MxzMipUtKlN9
 0IigE3KRqtQ/jgyXmIc5x4CjOeEJD5weJeEzNlMfi/3+6LPes5EJiVGaH0TTS/OszW
 fJDA3XUEs0jdwrPMUOXA9DKxEYE7d/szP97/GIVk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=oBvAecG8
Subject: [Buildroot] [PATCH v7 3/3] board/ti/am64x_sk: add new board
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
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
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
YXZpcyA8YWZkQHRpLmNvbT4KVGVzdGVkLWJ5OiBCcnlhbiBCcmF0dGxvZiA8YmJAdGkuY29tPgpD
YzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgpDYzogRnJhbmNvaXMgUGVy
cmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAg
ICAgICAgICAgIHwgIDQgKysrCiBib2FyZC90aS9hbTY0eF9zay9nZW5pbWFnZS5jZmcgfCAyNyAr
KysrKysrKysrKysrKysrKysrCiBib2FyZC90aS9hbTY0eF9zay9yZWFkbWUudHh0ICAgfCA0OSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBjb25maWdzL2FtNjR4X3NrX2RlZmNv
bmZpZyAgICAgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hh
bmdlZCwgMTI0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC90aS9hbTY0
eF9zay9nZW5pbWFnZS5jZmcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC90aS9hbTY0eF9zay9y
ZWFkbWUudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9hbTY0eF9za19kZWZjb25maWcK
CmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBiNWI2Y2QwYTk5Li44
NDg4NmUxZmE0IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTEy
OSw4ICsxMjksMTAgQEAgRjoJcGFja2FnZS9saWJ4bWxycGMvCiBGOglwYWNrYWdlL3B5dGhvbi1k
b2NvcHQvCiAKIE46CUFuYW5kIEdhZGl5YXIgPGdhZGl5YXJAdGkuY29tPgorRjoJYm9hcmQvdGkv
YW02NHhfc2svCiBGOglib290L3RpLWszLWltYWdlLWdlbi8KIEY6CWJvb3QvdGktazMtcjUtbG9h
ZGVyLworRjoJY29uZmlncy9hbTY0eF9za19kZWZjb25maWcKIAogTjoJQW5kcsOpIFp3aW5nIDxu
ZXJ2QGRhd25jcm93LmRlPgogRjoJcGFja2FnZS9saWJrcmI1LwpAQCAtMzA2MCw4ICszMDYyLDEw
IEBAIE46CVdvamNpZWNoIE5pemnFhHNraSA8bml6aWFrQHNwb3gub3JnPgogRjoJcGFja2FnZS9m
d3VwLwogCiBOOglYdWFuaGFvIFNoaSA8WDE1MDAwMTc3QGdtYWlsLmNvbT4KK0Y6CWJvYXJkL3Rp
L2FtNjR4X3NrLwogRjoJYm9vdC90aS1rMy1pbWFnZS1nZW4vCiBGOglib290L3RpLWszLXI1LWxv
YWRlci8KK0Y6CWNvbmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnCiAKIE46CVlhaXIgQmVuIEF2cmFo
YW0gPHlhaXJiYUBwcm90b25tYWlsLmNvbT4KIEY6CXBhY2thZ2UvY2FzeW5jLwpkaWZmIC0tZ2l0
IGEvYm9hcmQvdGkvYW02NHhfc2svZ2VuaW1hZ2UuY2ZnIGIvYm9hcmQvdGkvYW02NHhfc2svZ2Vu
aW1hZ2UuY2ZnCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjI2MzA0ZmU5
OGYKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC90aS9hbTY0eF9zay9nZW5pbWFnZS5jZmcKQEAg
LTAsMCArMSwyNyBAQAoraW1hZ2UgYm9vdC52ZmF0IHsKKwl2ZmF0IHsKKwkJZmlsZXMgPSB7CisJ
CQkidGlib290My5iaW4iLAorCQkJInRpc3BsLmJpbiIsCisJCQkidS1ib290LmltZyIsCisJCX0K
Kwl9CisKKwlzaXplID0gMTZNCit9CisKK2ltYWdlIHNkY2FyZC5pbWcgeworCWhkaW1hZ2Ugewor
CX0KKworCXBhcnRpdGlvbiB1LWJvb3QgeworCQlwYXJ0aXRpb24tdHlwZSA9IDB4QworCQlib290
YWJsZSA9ICJ0cnVlIgorCQlpbWFnZSA9ICJib290LnZmYXQiCisJfQorCisJcGFydGl0aW9uIHJv
b3RmcyB7CisJCXBhcnRpdGlvbi10eXBlID0gMHg4MworCQlpbWFnZSA9ICJyb290ZnMuZXh0NCIK
Kwl9Cit9CmRpZmYgLS1naXQgYS9ib2FyZC90aS9hbTY0eF9zay9yZWFkbWUudHh0IGIvYm9hcmQv
dGkvYW02NHhfc2svcmVhZG1lLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi44MDk2ZmNiMmQ0Ci0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvdGkvYW02NHhfc2svcmVh
ZG1lLnR4dApAQCAtMCwwICsxLDQ5IEBACitUZXhhcyBJbnN0dW1lbnRzIEFNNjR4IFNLIFRlc3Qg
YW5kIERldmVsb3BtZW50IEJvYXJkCisKK0Rlc2NyaXB0aW9uCis9PT09PT09PT09PQorCitUaGVz
ZSBjb25maWd1cmF0aW9ucyB3aWxsIGJ1aWxkIGEgY29tcGxldGUgaW1hZ2UgYW5kCitkZXZpY2Ug
dHJlZSBibG9icyBmb3IgdGhlIHRoZSBUSSBBTTY0eF9zayBib2FyZC4KKworSG93IHRvIGJ1aWxk
IGl0Cis9PT09PT09PT09PT09PT0KKworU2VsZWN0IHRoZSBkZWZhdWx0IGNvbmZpZ3VyYXRpb24g
Zm9yIHRoZSB0YXJnZXQ6CiskIG1ha2UgYW02NHhfc2tfZGVmY29uZmlnCisKK09wdGlvbmFsOiBt
b2RpZnkgdGhlIGNvbmZpZ3VyYXRpb246CiskIG1ha2UgbWVudWNvbmZpZworCitCdWlsZDoKKyQg
bWFrZQorCitSZXN1bHQgb2YgdGhlIGJ1aWxkOgorPT09PT09PT09PT09PT09PT09PQorb3V0cHV0
L2ltYWdlcy8KKystLSBzb2MKKystLSB0aS1jb25uZWN0aXZpdHkKKystLSBibDMxLmJpbgorKy0t
IGJvb3QudmZhdAorKy0tIEltYWdlCisrLS0gazMtYW02NDItc2suZHRiCisrLS0gcjUtdS1ib290
LXNwbC5iaW4KKystLSByb290ZnMuZXh0MgorKy0tIHJvb3Rmcy5leHQ0CisrLS0gcm9vdGZzLnRh
cgorKy0tIHNkY2FyZC5pbWcKKystLSB0ZWUuYmluCisrLS0gdGVlLWhlYWRlcl92Mi5iaW4KKyst
LSB0ZWUtcGFnZWFibGVfdjIuYmluCisrLS0gdGVlLXBhZ2VyX3YyLmJpbgorKy0tIHRpYm9vdDMu
YmluCisrLS0gdGlzcGwuYmluCisrLS0gdS1ib290LmltZworCitUbyBjb3B5IHRoZSBpbWFnZSBm
aWxlIHRvIHRoZSBzZGNhcmQgdXNlIGRkOgorJCBkZCBpZj1vdXRwdXQvaW1hZ2VzL3NkY2FyZC5p
bWcgb2Y9L2Rldi9zZFgKKworSW5zZXJ0IHRoZSBTRGNhcmQgaW50byB0aGUgQU02NHhfc2sgYm9h
cmQsIGFuZCBwb3dlciBpdCB1cCB3aXRoCithIFVTQiBUeXBlLUMgY29ubmVjdG9yLiBUaGUgc3lz
dGVtIHNob3VsZCBjb21lIHVwLiBZb3UgY2FuIHVzZQorYSBtaWNyby1VU0IgdG8gY29ubmVjdCB0
byB0aGUgY29ubmVjdG9yIGxhYmxlZCBNQUlOX1VBUlQwIHRvCitjb21tdW5pY2F0ZSB3aXRoIHRo
ZSBib2FyZC4KZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYW02NHhfc2tfZGVmY29uZmlnIGIvY29uZmln
cy9hbTY0eF9za19kZWZjb25maWcKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MC4uYjhhZDJmYjY4YQotLS0gL2Rldi9udWxsCisrKyBiL2NvbmZpZ3MvYW02NHhfc2tfZGVmY29u
ZmlnCkBAIC0wLDAgKzEsNDQgQEAKK0JSMl9hYXJjaDY0PXkKK0JSMl9ST09URlNfUE9TVF9JTUFH
RV9TQ1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKK0JSMl9ST09URlNfUE9TVF9T
Q1JJUFRfQVJHUz0iLWMgYm9hcmQvdGkvYW02NHhfc2svZ2VuaW1hZ2UuY2ZnIgorQlIyX0xJTlVY
X0tFUk5FTD15CitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKK0JSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMC45IgorQlIyX0xJTlVYX0tFUk5FTF9VU0Vf
QVJDSF9ERUZBVUxUX0NPTkZJRz15CitCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKK0JS
Ml9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJ0aS9rMy1hbTY0Mi1zayIKK0JSMl9MSU5V
WF9LRVJORUxfSU5TVEFMTF9UQVJHRVQ9eQorQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkU9eQor
QlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfVElfV0wxOFhYPXkKK0JSMl9UQVJHRVRfUk9PVEZT
X0VYVDI9eQorQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VY
VDJfU0laRT0iMTIwTSIKK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkU9eQorQlIyX1RB
UkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTj15CitCUjJfVEFSR0VUX0FS
TV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSJ2Mi43LjAiCitCUjJfVEFS
R0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1BMQVRGT1JNPSJrMyIKK0JSMl9UQVJHRVRfQVJNX1RS
VVNURURfRklSTVdBUkVfVEFSR0VUX0JPQVJEPSJsaXRlIgorQlIyX1RBUkdFVF9BUk1fVFJVU1RF
RF9GSVJNV0FSRV9CTDMyX09QVEVFPXkKK0JSMl9UQVJHRVRfT1BURUVfT1M9eQorQlIyX1RBUkdF
VF9PUFRFRV9PU19QTEFURk9STT0iazMiCitCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTj15CitC
UjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TT0M9ImFtNjR4IgorQlIyX1RBUkdFVF9USV9LM19J
TUFHRV9HRU5fU09DX1RZUEU9ImdwIgorQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fQ09ORklH
PSJldm0iCitCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9CT0FSRF9ERUZDT05GSUc9ImFtNjR4
X2V2bV9yNSIKK0JSMl9UQVJHRVRfVUJPT1Q9eQorQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNU
RU1fS0NPTkZJRz15CitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkKK0JSMl9UQVJH
RVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjIuMTAiCitCUjJfVEFSR0VUX1VCT09U
X0JPQVJEX0RFRkNPTkZJRz0iYW02NHhfZXZtX2E1MyIKK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNf
RFRDPXkKK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNTTD15CitCUjJfVEFSR0VUX1VCT09U
X05FRURTX0FURl9CTDMxPXkKKyMgQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfQklOIGlzIG5vdCBz
ZXQKK0JSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0lNRz15CitCUjJfVEFSR0VUX1VCT09UX1NQTD15
CitCUjJfVEFSR0VUX1VCT09UX1NQTF9OQU1FPSJ0aXNwbC5iaW4iCitCUjJfVEFSR0VUX1VCT09U
X0NVU1RPTV9NQUtFT1BUUz0iVEVFPSQoQklOQVJJRVNfRElSKS90ZWUtcGFnZXJfdjIuYmluIgor
QlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKK0JSMl9QQUNLQUdFX0hPU1RfR0VOSU1BR0U9
eQorQlIyX1BBQ0tBR0VfSE9TVF9NVE9PTFM9eQotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
