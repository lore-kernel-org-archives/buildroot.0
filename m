Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721AFC352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 17:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 189826104D;
	Tue,  6 Dec 2022 17:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 189826104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duZOhaWLLuUl; Tue,  6 Dec 2022 17:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D3EB61047;
	Tue,  6 Dec 2022 17:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D3EB61047
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28C9F1BF95F
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 17:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 041C580A4E
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 17:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 041C580A4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyKbVIIv3wrP for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 17:17:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B20ED81E7B
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B20ED81E7B
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 17:17:23 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B6HHJWX110271;
 Tue, 6 Dec 2022 11:17:19 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B6HHJ6f105128
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Dec 2022 11:17:19 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 6
 Dec 2022 11:17:19 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 6 Dec 2022 11:17:19 -0600
Received: from uda0393673 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B6HHJBj067276;
 Tue, 6 Dec 2022 11:17:19 -0600
Received: from a0393673 by uda0393673 with local (Exim 4.95)
 (envelope-from <gadiyar@ti.com>) id 1p2bZH-0038U5-CO;
 Tue, 06 Dec 2022 11:17:19 -0600
To: <buildroot@buildroot.org>
Date: Tue, 6 Dec 2022 11:17:17 -0600
Message-ID: <20221206171719.747581-2-gadiyar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206171719.747581-1-gadiyar@ti.com>
References: <20221206171719.747581-1-gadiyar@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1670347039;
 bh=ldd7B29o1puO1QLiBSoSkJukGYT9Ezi3H1ZVxJQ7kyw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=VHAkcgrO0rBej201XpyEQJyF42Yd2ypD+Jhr8jEBQccQWcuwoIBrcTMO4uaWZSWkc
 Mv93ViDs9crGWMdnYCGfcDzaJGd0eDGmDcs0uWvpWUUKLUe6BBbUFzMPcRJs+1m/R7
 t2InaeUsCrBsicNivSY8XaNqW5+2Tx7nRDDYbw60=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=VHAkcgrO
Subject: [Buildroot] [PATCH v7 1/3] boot/ti-k3-r5-loader: add new package
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

RnJvbTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4KClRoaXMgaXMgYSBzZXBhcmF0ZSBVLUJv
b3QgcGFja2FnZSB0aGF0IHdvdWxkIGJ1aWxkCnRoZSBpbnRlcm1lZGlhdGUgc3BsIGJpbmFyeSBm
b3IgdGhlIFI1IGNvcmUgb24gVEkncyBrMyBib2FyZHMuClVzdWFsbHksIHRoZSByZXN1bHRpbmcg
c3BsIHdpbGwgYmUgdXNlZCBmb3IgazMtaW1hZ2UtZ2VuCnRvIGJ1aWxkIHRoZSBmdWxsIFI1IGJv
b3QgYmluYXJ5IHRpYm9vdDMuYmluLgoKU2lnbmVkLW9mZi1ieTogWHVhbmhhbyBTaGkgPHgtc2hp
QHRpLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5hbmQgR2FkaXlhciA8Z2FkaXlhckB0aS5jb20+ClJl
dmlld2VkLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbT4KQWNrZWQtYnk6IEFuZHJldyBEYXZpcyA8YWZkQHRpLmNvbT4KVGVzdGVkLWJ5OiBC
cnlhbiBCcmF0dGxvZiA8YmJAdGkuY29tPgpDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPgpDYzogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+
Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysK
IGJvb3QvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogYm9vdC90
aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluICAgICAgICAgICAgfCAzMiArKysrKysrKysrKysrKysK
IGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoIHwgIDIgKwogYm9vdC90
aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rICAgfCA0OSArKysrKysrKysrKysrKysr
KysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgYm9vdC90aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQg
Ym9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2gKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKCmRpZmYgLS1naXQg
YS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCAyMzNmZGE0YzcxLi42MmQ3N2I2YzRiIDEw
MDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTEyOCw2ICsxMjgsOSBA
QCBGOglwYWNrYWdlL2Rjcm9uLwogRjoJcGFja2FnZS9saWJ4bWxycGMvCiBGOglwYWNrYWdlL3B5
dGhvbi1kb2NvcHQvCiAKK046CUFuYW5kIEdhZGl5YXIgPGdhZGl5YXJAdGkuY29tPgorRjoJYm9v
dC90aS1rMy1yNS1sb2FkZXIvCisKIE46CUFuZHLDqSBad2luZyA8bmVydkBkYXduY3Jvdy5kZT4K
IEY6CXBhY2thZ2UvbGlia3JiNS8KIEY6CXBhY2thZ2Uvb3BlbmFsLwpAQCAtMzA1NSw2ICszMDU4
LDkgQEAgRjoJcGFja2FnZS9weXRob24tcHl1c2IvCiBOOglXb2pjaWVjaCBOaXppxYRza2kgPG5p
emlha0BzcG94Lm9yZz4KIEY6CXBhY2thZ2UvZnd1cC8KIAorTjoJWHVhbmhhbyBTaGkgPFgxNTAw
MDE3N0BnbWFpbC5jb20+CitGOglib290L3RpLWszLXI1LWxvYWRlci8KKwogTjoJWWFpciBCZW4g
QXZyYWhhbSA8eWFpcmJhQHByb3Rvbm1haWwuY29tPgogRjoJcGFja2FnZS9jYXN5bmMvCiBGOglw
YWNrYWdlL2dsb294LwpkaWZmIC0tZ2l0IGEvYm9vdC9Db25maWcuaW4gYi9ib290L0NvbmZpZy5p
bgppbmRleCA0MDQ3MmFlMDdkLi5jZTE3YjJkZjZiIDEwMDY0NAotLS0gYS9ib290L0NvbmZpZy5p
bgorKysgYi9ib290L0NvbmZpZy5pbgpAQCAtMjIsNiArMjIsNyBAQCBzb3VyY2UgImJvb3QvczUw
MC1ib290bG9hZGVyL0NvbmZpZy5pbiIKIHNvdXJjZSAiYm9vdC9zaGltL0NvbmZpZy5pbiIKIHNv
dXJjZSAiYm9vdC9zdW4yMGktZDEtc3BsL0NvbmZpZy5pbiIKIHNvdXJjZSAiYm9vdC9zeXNsaW51
eC9Db25maWcuaW4iCitzb3VyY2UgImJvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbiIKIHNv
dXJjZSAiYm9vdC91Ym9vdC9Db25maWcuaW4iCiBzb3VyY2UgImJvb3QvdmV4cHJlc3MtZmlybXdh
cmUvQ29uZmlnLmluIgogCmRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcu
aW4gYi9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uYmI2MTQwZjhhNgotLS0gL2Rldi9udWxsCisrKyBiL2Jvb3QvdGkt
azMtcjUtbG9hZGVyL0NvbmZpZy5pbgpAQCAtMCwwICsxLDMyIEBACitjb25maWcgQlIyX1RBUkdF
VF9USV9LM19SNV9MT0FERVIKKwlib29sICJ0aS1rMy1yNS1sb2FkZXIiCisJaGVscAorCSAgU2Vw
YXJhdGUgVS1Cb290IGJ1aWxkIGZvciBSNSBjb3JlcyBvbiBUSSdzIGszIGJvYXJkcy4KKwkgIFVz
dWFsbHkgdXNlZCB0byBidWlsZCB0aWJvb3QzLmJpbiB3aXRoIGszLWltYWdlLWdlbi4KKworaWYg
QlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVIKK2Nob2ljZQorCXByb21wdCAiSzMgUjUgTG9hZGVy
IGNvbmZpZ3VyYXRpb24iCisJZGVmYXVsdCBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0Vf
REVGQ09ORklHCisKK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0VfREVGQ09O
RklHCisJYm9vbCAiVXNpbmcgYW4gaW4tdHJlZSBib2FyZCBkZWZjb25maWcgZmlsZSIKKworY29u
ZmlnIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9DVVNUT01fQ09ORklHCisJYm9vbCAi
VXNpbmcgYSBjdXN0b20gYm9hcmQgKGRlZiljb25maWcgZmlsZSIKKworZW5kY2hvaWNlCisKK2Nv
bmZpZyBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9CT0FSRF9ERUZDT05GSUcKKwlzdHJpbmcg
IkJvYXJkIGRlZmNvbmZpZyIKKwlkZXBlbmRzIG9uIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVS
X1VTRV9ERUZDT05GSUcKKwloZWxwCisJICBOYW1lIG9mIHRoZSBib2FyZCBmb3Igd2hpY2ggVEkg
SzMgUjUgTG9hZGVyIHNob3VsZCBiZQorCSAgYnVpbHQsIHdpdGhvdXQgdGhlIF9kZWZjb25maWcg
c3VmZml4LgorCitjb25maWcgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9NX0NPTkZJ
R19GSUxFCisJc3RyaW5nICJDb25maWd1cmF0aW9uIGZpbGUgcGF0aCIKKwlkZXBlbmRzIG9uIEJS
Ml9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9DVVNUT01fQ09ORklHCisJaGVscAorCSAgUGF0
aCB0byB0aGUgVEkgSzMgUjUgTG9hZGVyIGNvbmZpZ3VyYXRpb24gZmlsZS4KK2VuZGlmCmRpZmYg
LS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaCBiL2Jvb3Qv
dGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLmZiNmNlN2MyYTYKLS0tIC9kZXYvbnVsbAorKysgYi9ib290L3Rp
LWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaApAQCAtMCwwICsxLDIgQEAKKyMgTG9j
YWxseSBjb21wdXRlZDoKK3NoYTI1NiAgNmQ2OWQ1ZTQ2MzVjYjNmYTc4NTJiZjE1Zjg4Y2EzNDJl
Zjc3NDAxOTZlNzE5NjFkMzU3MmRlYjU4YmE0NGJlYSAgdS1ib290LTIwMjIuMTAtcmMxLnRhci5i
ejIKZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayBi
L2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi44YTJhM2ZkYWQ0Ci0tLSAvZGV2L251bGwKKysrIGIvYm9v
dC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCkBAIC0wLDAgKzEsNDkgQEAKKyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHRpLWszLXI1LWxvYWRlci5taworIworIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKKworVElfSzNfUjVfTE9BREVSX1ZFUlNJT04gPSAyMDIyLjEwCitU
SV9LM19SNV9MT0FERVJfU0lURSA9IGh0dHBzOi8vZnRwLmRlbnguZGUvcHViL3UtYm9vdAorVElf
SzNfUjVfTE9BREVSX1NPVVJDRSA9IHUtYm9vdC0kKFRJX0szX1I1X0xPQURFUl9WRVJTSU9OKS50
YXIuYnoyCitUSV9LM19SNV9MT0FERVJfTElDRU5TRSA9IEdQTC0yLjArCitUSV9LM19SNV9MT0FE
RVJfTElDRU5TRV9GSUxFUyA9IExpY2Vuc2VzL2dwbC0yLjAudHh0CitUSV9LM19SNV9MT0FERVJf
Q1BFX0lEX1ZFTkRPUiA9IGRlbngKK1RJX0szX1I1X0xPQURFUl9DUEVfSURfUFJPRFVDVCA9IHUt
Ym9vdAorVElfSzNfUjVfTE9BREVSX0lOU1RBTExfSU1BR0VTID0gWUVTCitUSV9LM19SNV9MT0FE
RVJfREVQRU5ERU5DSUVTID0gXAorCWhvc3QtcGtnY29uZiBcCisJJChCUjJfTUFLRV9IT1NUX0RF
UEVOREVOQ1kpIFwKKwlob3N0LWFybS1nbnUtdG9vbGNoYWluIFwKKwlob3N0LW9wZW5zc2wKKwor
VElfSzNfUjVfTE9BREVSX01BS0UgPSAkKEJSMl9NQUtFKQorVElfSzNfUjVfTE9BREVSX01BS0Vf
RU5WID0gJChUQVJHRVRfTUFLRV9FTlYpCitUSV9LM19SNV9MT0FERVJfS0NPTkZJR19ERVBFTkRF
TkNJRVMgPSBcCisJaG9zdC1hcm0tZ251LXRvb2xjaGFpbiBcCisJJChCUjJfTUFLRV9IT1NUX0RF
UEVOREVOQ1kpIFwKKwkkKEJSMl9CSVNPTl9IT1NUX0RFUEVOREVOQ1kpIFwKKwkkKEJSMl9GTEVY
X0hPU1RfREVQRU5ERU5DWSkKKworVElfSzNfUjVfTE9BREVSX0JPQVJEID0gJChjYWxsIHFzdHJp
cCwkKEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0JPQVJEKSkKK2lmZXEgKCQoQlIyX1RBUkdF
VF9USV9LM19SNV9MT0FERVJfVVNFX0RFRkNPTkZJRykseSkKK1RJX0szX1I1X0xPQURFUl9LQ09O
RklHX0RFRkNPTkZJRyA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURF
Ul9CT0FSRF9ERUZDT05GSUcpKV9kZWZjb25maWcKK2Vsc2UgaWZlcSAoJChCUjJfVEFSR0VUX1RJ
X0szX1I1X0xPQURFUl9VU0VfQ1VTVE9NX0NPTkZJRykseSkKK1RJX0szX1I1X0xPQURFUl9LQ09O
RklHX0ZJTEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VT
VE9NX0NPTkZJR19GSUxFKSkKK2VuZGlmICMgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNF
X0RFRkNPTkZJRworVElfSzNfUjVfTE9BREVSX01BS0VfT1BUUyA9IFwKKwlDUk9TU19DT01QSUxF
PSQoSE9TVF9ESVIpL2Jpbi9hcm0tbm9uZS1lYWJpLSBcCisJQVJDSD1hcm0gXAorCUhPU1RDQz0i
JChIT1NUQ0MpICQoc3Vic3QgLUkvLC1pc3lzdGVtIC8sJChzdWJzdCAtSSAvLC1pc3lzdGVtIC8s
JChIT1NUX0NGTEFHUykpKSIgXAorCUhPU1RMREZMQUdTPSIkKEhPU1RfTERGTEFHUykiCisKK2Rl
ZmluZSBUSV9LM19SNV9MT0FERVJfQlVJTERfQ01EUworCSQoVEFSR0VUX0NPTkZJR1VSRV9PUFRT
KSAkKFRJX0szX1I1X0xPQURFUl9NQUtFKSAtQyAkKEBEKSAkKFRJX0szX1I1X0xPQURFUl9NQUtF
X09QVFMpCitlbmRlZgorCitkZWZpbmUgVElfSzNfUjVfTE9BREVSX0lOU1RBTExfSU1BR0VTX0NN
RFMKKwljcCAkKEBEKS9zcGwvdS1ib290LXNwbC5iaW4gJChCSU5BUklFU19ESVIpL3I1LXUtYm9v
dC1zcGwuYmluCitlbmRlZgorCiskKGV2YWwgJChrY29uZmlnLXBhY2thZ2UpKQotLSAKMi4zNC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
