Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80284EB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 16:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F93B42402;
	Thu, 22 Jun 2023 16:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F93B42402
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPq7sy8lXRpM; Thu, 22 Jun 2023 16:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E05F423E9;
	Thu, 22 Jun 2023 16:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E05F423E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 230E11BF3D1
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8A564205A
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8A564205A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZKcQiqELOqGf for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 16:02:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76AE642045
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76AE642045
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 16:02:21 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MG2HTh057216;
 Thu, 22 Jun 2023 11:02:17 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MG2HI0024660
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 22 Jun 2023 11:02:17 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 11:02:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 11:02:17 -0500
Received: from dasso.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MG2Gix107613;
 Thu, 22 Jun 2023 11:02:17 -0500
To: <buildroot@buildroot.org>
Date: Thu, 22 Jun 2023 11:02:05 -0500
Message-ID: <20230622160212.2063472-5-dannenberg@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622160212.2063472-1-dannenberg@ti.com>
References: <20230622160212.2063472-1-dannenberg@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1687449737;
 bh=9w3B7p0WtMx5dQK1aZRUtLc4BbyXA8rF/UYsBUggYGE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=h8B5lLAVTqYIzTaK2la5dQ9XpdczQF7MzmZ7ede+f11QUs0iVuKm6iHJ8VYB/yQBl
 iL/GNGLfsWWJJj8T1d+zGjyiU9BNFGXPG72HqJmqLOlDMetqubx2yvpwSSqtu/fgnd
 TwDVrcu78YQa7Odu4SpuTs2WKKVXQEoCZsKfH6Ug=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=h8B5lLAV
Subject: [Buildroot] [PATCH v9 04/11] board/ti/am64x_sk: add new board
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
Cc: Bryan
 Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>, Julien Olivain <ju.o@free.fr>,
 Xuanhao Shi <x-shi@ti.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Anand Gadiyar <gadiyar@ti.com>, Romain Naour <romain.naour@gmail.com>, Andreas
 Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4KCkFkZHMgc3VwcG9ydCBmb3IgVEkncyBT
Sy1BTTY0IGJvYXJkIGJ5IGludHJvZHVjaW5nIHRoZQphbTY0eF9za19kZWZjb25maWcgZmlsZSBh
bmQgcmVsYXRlZCBzdXBwb3J0IGZpbGVzLgoKTW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgYm9h
cmQgY2FuIGJlIGZvdW5kIGF0OgpodHRwczovL3d3dy50aS5jb20vdG9vbC9TSy1BTTY0CgpTaWdu
ZWQtb2ZmLWJ5OiBYdWFuaGFvIFNoaSA8eC1zaGlAdGkuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmFu
ZCBHYWRpeWFyIDxnYWRpeWFyQHRpLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBEYW5uZW5i
ZXJnIDxkYW5uZW5iZXJnQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgpBY2tlZC1ieTogQW5kcmV3IERhdmlz
IDxhZmRAdGkuY29tPgpUZXN0ZWQtYnk6IEJyeWFuIEJyYXR0bG9mIDxiYkB0aS5jb20+CkNjOiBS
b21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBGcmFuY29p
cyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4KUmV2aWV3ZWQtYnk6IEp1bGllbiBP
bGl2YWluIDxqdS5vQGZyZWUuZnI+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAg
IHwgIDQgKysrKwogYm9hcmQvdGkvYW02NHhfc2svZ2VuaW1hZ2UuY2ZnIHwgMjcgKysrKysrKysr
KysrKysrKysrKysrCiBib2FyZC90aS9hbTY0eF9zay9yZWFkbWUudHh0ICAgfCAyNiArKysrKysr
KysrKysrKysrKysrKwogY29uZmlncy9hbTY0eF9za19kZWZjb25maWcgICAgIHwgNDQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAxMDEgaW5zZXJ0
aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjR4X3NrL2dlbmltYWdlLmNm
ZwogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjR4X3NrL3JlYWRtZS50eHQKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBjb25maWdzL2FtNjR4X3NrX2RlZmNvbmZpZwoKZGlmZiAtLWdpdCBhL0RF
VkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDdlZDlmMDQwY2MuLmE0ZDcyOTk4M2IgMTAwNjQ0
Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTI5LDggKzEyOSwxMCBAQCBG
OglwYWNrYWdlL2xpYnhtbHJwYy8KIEY6CXBhY2thZ2UvcHl0aG9uLWRvY29wdC8KIAogTjoJQW5h
bmQgR2FkaXlhciA8Z2FkaXlhckB0aS5jb20+CitGOglib2FyZC90aS9hbTY0eF9zay8KIEY6CWJv
b3QvdGktazMtaW1hZ2UtZ2VuLwogRjoJYm9vdC90aS1rMy1yNS1sb2FkZXIvCitGOgljb25maWdz
L2FtNjR4X3NrX2RlZmNvbmZpZwogCiBOOglBbmRyw6kgWndpbmcgPG5lcnZAZGF3bmNyb3cuZGU+
CiBGOglwYWNrYWdlL2xpYmtyYjUvCkBAIC0zMDIxLDggKzMwMjMsMTAgQEAgTjoJV29qY2llY2gg
Tml6acWEc2tpIDxuaXppYWtAc3BveC5vcmc+CiBGOglwYWNrYWdlL2Z3dXAvCiAKIE46CVh1YW5o
YW8gU2hpIDxYMTUwMDAxNzdAZ21haWwuY29tPgorRjoJYm9hcmQvdGkvYW02NHhfc2svCiBGOgli
b290L3RpLWszLWltYWdlLWdlbi8KIEY6CWJvb3QvdGktazMtcjUtbG9hZGVyLworRjoJY29uZmln
cy9hbTY0eF9za19kZWZjb25maWcKIAogTjoJWWFpciBCZW4gQXZyYWhhbSA8eWFpcmJhQHByb3Rv
bm1haWwuY29tPgogRjoJcGFja2FnZS9jYXN5bmMvCmRpZmYgLS1naXQgYS9ib2FyZC90aS9hbTY0
eF9zay9nZW5pbWFnZS5jZmcgYi9ib2FyZC90aS9hbTY0eF9zay9nZW5pbWFnZS5jZmcKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMjYzMDRmZTk4ZgotLS0gL2Rldi9udWxs
CisrKyBiL2JvYXJkL3RpL2FtNjR4X3NrL2dlbmltYWdlLmNmZwpAQCAtMCwwICsxLDI3IEBACitp
bWFnZSBib290LnZmYXQgeworCXZmYXQgeworCQlmaWxlcyA9IHsKKwkJCSJ0aWJvb3QzLmJpbiIs
CisJCQkidGlzcGwuYmluIiwKKwkJCSJ1LWJvb3QuaW1nIiwKKwkJfQorCX0KKworCXNpemUgPSAx
Nk0KK30KKworaW1hZ2Ugc2RjYXJkLmltZyB7CisJaGRpbWFnZSB7CisJfQorCisJcGFydGl0aW9u
IHUtYm9vdCB7CisJCXBhcnRpdGlvbi10eXBlID0gMHhDCisJCWJvb3RhYmxlID0gInRydWUiCisJ
CWltYWdlID0gImJvb3QudmZhdCIKKwl9CisKKwlwYXJ0aXRpb24gcm9vdGZzIHsKKwkJcGFydGl0
aW9uLXR5cGUgPSAweDgzCisJCWltYWdlID0gInJvb3Rmcy5leHQ0IgorCX0KK30KZGlmZiAtLWdp
dCBhL2JvYXJkL3RpL2FtNjR4X3NrL3JlYWRtZS50eHQgYi9ib2FyZC90aS9hbTY0eF9zay9yZWFk
bWUudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmZlODNjNjc1ZjUK
LS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC90aS9hbTY0eF9zay9yZWFkbWUudHh0CkBAIC0wLDAg
KzEsMjYgQEAKK1RleGFzIEluc3R1bWVudHMgU0stQU02NCBUZXN0IGFuZCBEZXZlbG9wbWVudCBC
b2FyZAorCitEZXNjcmlwdGlvbgorPT09PT09PT09PT0KK1RoaXMgY29uZmlndXJhdGlvbiB3aWxs
IGJ1aWxkIGEgY29tcGxldGUgaW1hZ2UgZm9yIHRoZSBUSSBTSy1BTTY0IGJvYXJkLgorCitIb3cg
dG8gQnVpbGQKKz09PT09PT09PT09PQorU2VsZWN0IHRoZSBkZWZhdWx0IGNvbmZpZ3VyYXRpb24g
Zm9yIHRoZSB0YXJnZXQ6CiskIG1ha2UgYW02NHhfc2tfZGVmY29uZmlnCisKK09wdGlvbmFsOiBt
b2RpZnkgdGhlIGNvbmZpZ3VyYXRpb246CiskIG1ha2UgbWVudWNvbmZpZworCitCdWlsZDoKKyQg
bWFrZQorCitUbyBjb3B5IHRoZSByZXN1bHRpbWcgb3V0cHV0IGltYWdlIGZpbGUgdG8gYW4gU0Qg
Y2FyZCB1c2UgZGQ6CiskIGRkIGlmPW91dHB1dC9pbWFnZXMvc2RjYXJkLmltZyBvZj0vZGV2L3Nk
WCBicz0xTQorCitIb3cgdG8gUnVuCis9PT09PT09PT09CitJbnNlcnQgdGhlIFNEIGNhcmQgaW50
byB0aGUgU0stQU02MiBib2FyZCwgYW5kIHBvd2VyIGl0IHVwIHRocm91Z2gKK3RoZSBVU0IgVHlw
ZS1DIGNvbm5lY3Rvci4gVGhlIHN5c3RlbSBzaG91bGQgY29tZSB1cC4gWW91IGNhbiB1c2UKK2Eg
bWljcm8tVVNCIGNhYmxlIHRvIGNvbm5lY3QgdG8gdGhlIGNvbm5lY3RvciBsYWJlbGVkIERFQlVH
IENPTlNPTEUKK3RvIGNvbW11bmljYXRlIHdpdGggdGhlIGJvYXJkLgpkaWZmIC0tZ2l0IGEvY29u
Zmlncy9hbTY0eF9za19kZWZjb25maWcgYi9jb25maWdzL2FtNjR4X3NrX2RlZmNvbmZpZwpuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi40MTFiM2Q1YjBmCi0tLSAvZGV2L251
bGwKKysrIGIvY29uZmlncy9hbTY0eF9za19kZWZjb25maWcKQEAgLTAsMCArMSw0NCBAQAorQlIy
X2FhcmNoNjQ9eQorQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRz
L2dlbmltYWdlLnNoIgorQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyBib2FyZC90aS9h
bTY0eF9zay9nZW5pbWFnZS5jZmciCitCUjJfTElOVVhfS0VSTkVMPXkKK0JSMl9MSU5VWF9LRVJO
RUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQorQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9S
VD15CitCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0idGkvazMtYW02NDItc2siCitC
UjJfTElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUPXkKK0JSMl9QQUNLQUdFX0xJTlVYX0ZJUk1X
QVJFPXkKK0JSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX1RJX1dMMThYWD15CitCUjJfVEFSR0VU
X1JPT1RGU19FWFQyPXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15CitCUjJfVEFSR0VUX1JP
T1RGU19FWFQyX1NJWkU9IjEyME0iCitCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFPXkK
K0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT049eQorQlIyX1RB
UkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTl9WQUxVRT0idjIuNy4wIgor
QlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0iazMiCitCUjJfVEFSR0VU
X0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1RBUkdFVF9CT0FSRD0ibGl0ZSIKK0JSMl9UQVJHRVRfQVJN
X1RSVVNURURfRklSTVdBUkVfQkwzMl9PUFRFRT15CitCUjJfVEFSR0VUX09QVEVFX09TPXkKK0JS
Ml9UQVJHRVRfT1BURUVfT1NfUExBVEZPUk09ImszIgorQlIyX1RBUkdFVF9USV9LM19JTUFHRV9H
RU49eQorQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fRldfVFlQRV9USVNDST15CitCUjJfVEFS
R0VUX1RJX0szX0lNQUdFX0dFTl9TT0M9ImFtNjR4IgorQlIyX1RBUkdFVF9USV9LM19JTUFHRV9H
RU5fU09DX1RZUEVfR1A9eQorQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fQ09ORklHPSJldm0i
CitCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUj15CitCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURF
Ul9CT0FSRF9ERUZDT05GSUc9ImFtNjR4X2V2bV9yNSIKK0JSMl9UQVJHRVRfVUJPT1Q9eQorQlIy
X1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15CitCUjJfVEFSR0VUX1VCT09UX0NV
U1RPTV9WRVJTSU9OPXkKK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIw
MjIuMTAiCitCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0iYW02NHhfZXZtX2E1MyIK
K0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfRFRDPXkKK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BF
TlNTTD15CitCUjJfVEFSR0VUX1VCT09UX05FRURTX0FURl9CTDMxPXkKKyMgQlIyX1RBUkdFVF9V
Qk9PVF9GT1JNQVRfQklOIGlzIG5vdCBzZXQKK0JSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0lNRz15
CitCUjJfVEFSR0VUX1VCT09UX1NQTD15CitCUjJfVEFSR0VUX1VCT09UX1NQTF9OQU1FPSJ0aXNw
bC5iaW4iCitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9NQUtFT1BUUz0iVEVFPSQoQklOQVJJRVNf
RElSKS90ZWUtcGFnZXJfdjIuYmluIgorQlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKK0JS
Ml9QQUNLQUdFX0hPU1RfR0VOSU1BR0U9eQorQlIyX1BBQ0tBR0VfSE9TVF9NVE9PTFM9eQotLSAK
Mi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
