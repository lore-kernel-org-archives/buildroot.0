Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4FEC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 15:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1EBB403C1;
	Wed,  3 Aug 2022 15:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1EBB403C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j5WhGKcGne1J; Wed,  3 Aug 2022 15:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49A5F4027D;
	Wed,  3 Aug 2022 15:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49A5F4027D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76C451BF25B
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 15:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E5E582681
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 15:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E5E582681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NfAwXIjfKENo for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 15:59:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1534E824E2
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1534E824E2
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 15:59:13 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 273Fx7pG019283;
 Wed, 3 Aug 2022 10:59:07 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 273Fx7Hq028864
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Aug 2022 10:59:07 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 3
 Aug 2022 10:59:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 3 Aug 2022 10:59:07 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 273Fx6R4110896;
 Wed, 3 Aug 2022 10:59:07 -0500
To: <buildroot@buildroot.org>
Date: Wed, 3 Aug 2022 10:59:05 -0500
Message-ID: <20220803155906.19630-3-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220803155906.19630-1-x-shi@ti.com>
References: <20220803155906.19630-1-x-shi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1659542347;
 bh=oyGER39OOgfr3utBiHavl5k+KpTpmQDMjgi+0ogBvpQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=DUvNUiZp369XEulL3gyfEswiA3C0guXQCvLO0udQaRd0zgMMzF/V0RK6Z6Y774reA
 pu+C0lnbuWPDbq6NWselavpr+nUtrrEK4AqmeOFNt9yBQrBCLZZP687LAGu9Rfb8ca
 z07C4VCou23n7rUvOZFARkB8G7MnCWVGnQbgVdyI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=DUvNUiZp
Subject: [Buildroot] [PATCH v4 2/3] boot/ti-k3-image-gen: add new package
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

VGhpcyBpcyB0aGUgaW1hZ2UgZ2VuZXJhdG9yIHRoYXQgYnVpbGRzIHRoZSBmdWxsIGJvb3QgYmlu
YXJ5LAp0aWJvb3QzLmJpbiwgZm9yIHRoZSBSNSBjb3JlIG9uIFRJJ3MgazMgZGV2aWNlcy4KVGhp
cyByZXF1aXJlcyB0aGUgUjUgc3BsIG91dHB1dCBmcm9tIHRoZSB0aS1rMy1yNS1sb2FkZXIgcGFj
a2FnZS4KCmh0dHBzOi8vZ2l0LnRpLmNvbS9jZ2l0L2szLWltYWdlLWdlbi9rMy1pbWFnZS1nZW4K
ClNpZ25lZC1vZmYtYnk6IFh1YW5oYW8gU2hpIDx4LXNoaUB0aS5jb20+ClNpZ25lZC1vZmYtYnk6
IEFuYW5kIEdhZGl5YXIgPGdhZGl5YXJAdGkuY29tPgpSZXZpZXdlZC1ieTogR2l1bGlvIEJlbmV0
dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Ci0tLQogREVWRUxPUEVS
UyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogYm9vdC9Db25maWcuaW4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBib290L3RpLWszLWltYWdlLWdlbi9D
b25maWcuaW4gICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrCiBib290L3RpLWszLWlt
YWdlLWdlbi90aS1rMy1pbWFnZS1nZW4uaGFzaCB8ICAyICsrCiBib290L3RpLWszLWltYWdlLWdl
bi90aS1rMy1pbWFnZS1nZW4ubWsgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrCiA1IGZp
bGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3Rp
LWszLWltYWdlLWdlbi9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWlt
YWdlLWdlbi90aS1rMy1pbWFnZS1nZW4uaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGkt
azMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tawoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMg
Yi9ERVZFTE9QRVJTCmluZGV4IGU0OThkMmZmMDMuLmIyMWRlZjExMWMgMTAwNjQ0Ci0tLSBhL0RF
VkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTI4LDYgKzEyOCw3IEBAIEY6CXBhY2thZ2Uv
bGlieG1scnBjLwogRjoJcGFja2FnZS9weXRob24tZG9jb3B0LwogCiBOOglBbmFuZCBHYWRpeWFy
IDxnYWRpeWFyQHRpLmNvbT4KK0Y6CWJvb3QvdGktazMtaW1hZ2UtZ2VuLwogRjoJYm9vdC90aS1r
My1yNS1sb2FkZXIvCiAKIE46CUFuZHLDqSBad2luZyA8bmVydkBkYXduY3Jvdy5kZT4KQEAgLTMw
MjUsNiArMzAyNiw3IEBAIE46CVdvamNpZWNoIE5pemnFhHNraSA8bml6aWFrQHNwb3gub3JnPgog
RjoJcGFja2FnZS9md3VwLwogCiBOOglYdWFuaGFvIFNoaSA8WDE1MDAwMTc3QGdtYWlsLmNvbT4K
K0Y6CWJvb3QvdGktazMtaW1hZ2UtZ2VuLwogRjoJYm9vdC90aS1rMy1yNS1sb2FkZXIvCiAKIE46
CVlhaXIgQmVuIEF2cmFoYW0gPHlhaXJiYUBwcm90b25tYWlsLmNvbT4KZGlmZiAtLWdpdCBhL2Jv
b3QvQ29uZmlnLmluIGIvYm9vdC9Db25maWcuaW4KaW5kZXggY2UxN2IyZGY2Yi4uMWIyNWJhY2Zl
ZSAxMDA2NDQKLS0tIGEvYm9vdC9Db25maWcuaW4KKysrIGIvYm9vdC9Db25maWcuaW4KQEAgLTIy
LDYgKzIyLDcgQEAgc291cmNlICJib290L3M1MDAtYm9vdGxvYWRlci9Db25maWcuaW4iCiBzb3Vy
Y2UgImJvb3Qvc2hpbS9Db25maWcuaW4iCiBzb3VyY2UgImJvb3Qvc3VuMjBpLWQxLXNwbC9Db25m
aWcuaW4iCiBzb3VyY2UgImJvb3Qvc3lzbGludXgvQ29uZmlnLmluIgorc291cmNlICJib290L3Rp
LWszLWltYWdlLWdlbi9Db25maWcuaW4iCiBzb3VyY2UgImJvb3QvdGktazMtcjUtbG9hZGVyL0Nv
bmZpZy5pbiIKIHNvdXJjZSAiYm9vdC91Ym9vdC9Db25maWcuaW4iCiBzb3VyY2UgImJvb3QvdmV4
cHJlc3MtZmlybXdhcmUvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1pbWFnZS1n
ZW4vQ29uZmlnLmluIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjAwNDE2ZGNlZmMKLS0tIC9kZXYvbnVsbAorKysg
Yi9ib290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4KQEAgLTAsMCArMSwyNCBAQAorY29uZmln
IEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOCisJYm9vbCAidGktazMtaW1hZ2UtZ2VuIgorCXNl
bGVjdCBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUgorCWhlbHAKKwkgIFVzZSBUSSdzIGszLWlt
YWdlLWdlbiB0byBidWlsZCBhIHNlcGFyYXRlIGJhcmUgbWV0YWwKKwkgIGJvb3QgYmluYXJ5IGZy
b20gYSBzZXBhcmF0ZSBzcGwuIEN1cnJlbnRseSBzdXBwb3J0cworCSAgdmVyc2lvbiAwOC4wNC4w
MC4wMDUgYXMgZGVmYXVsdC4KKworCSAgaHR0cHM6Ly9naXQudGkuY29tL2NnaXQvazMtaW1hZ2Ut
Z2VuL2szLWltYWdlLWdlbi8KKworY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NP
QworCXN0cmluZyAiU09DIHR5cGUgZm9yIGltYWdlIGdlbiIKKwlkZXBlbmRzIG9uIEJSMl9UQVJH
RVRfVElfSzNfSU1BR0VfR0VOCisJaGVscAorCSAgVGhlIHRhcmdldCBTb0Mgb3B0aW9uIGZvciBp
bWFnZSBnZW4uCisJICBGb3IgZXhhbXBsZSwgImFtNjR4IiBmb3IgQU02NFggYm9hcmRzLgorCitj
b25maWcgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fQ09ORklHCisJc3RyaW5nICJDT05GSUcg
dHlwZSBmb3IgaW1hZ2UgZ2VuIgorCWRlcGVuZHMgb24gQlIyX1RBUkdFVF9USV9LM19JTUFHRV9H
RU4KKwloZWxwCisJICBUaGUgYm9hcmQgY29uZmlnIG9wdGlvbiBmb3IgaW1hZ2UgZ2VuLgorCSAg
VXN1YWxseSAic2siIG9yICJldm0iLgorCmRpZmYgLS1naXQgYS9ib290L3RpLWszLWltYWdlLWdl
bi90aS1rMy1pbWFnZS1nZW4uaGFzaCBiL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdl
LWdlbi5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmUzMDdhMDJh
NjcKLS0tIC9kZXYvbnVsbAorKysgYi9ib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1n
ZW4uaGFzaApAQCAtMCwwICsxLDIgQEAKKyMgTG9jYWxseSBjYWxjdWxhdGVkCitzaGEyNTYgIGU1
ODVkYzg2OGFkYTIxZWYzMzg5MTU5NTQxZDY2OWI4OGJjNDA2YjQ1MzQ3MGU5MmRhODVkOTIyMmQy
NzFjOTYgIGszLWltYWdlLWdlbi0wOC4wNC4wMC4wMDUudGFyLmd6CmRpZmYgLS1naXQgYS9ib290
L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4ubWsgYi9ib290L3RpLWszLWltYWdlLWdl
bi90aS1rMy1pbWFnZS1nZW4ubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MC4uMWY5NzQ5MDM5MgotLS0gL2Rldi9udWxsCisrKyBiL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3Rp
LWszLWltYWdlLWdlbi5tawpAQCAtMCwwICsxLDMzIEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IworIworIyB0aS1rMy1pbWFnZS1nZW4KKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1RJ
X0szX0lNQUdFX0dFTl9WRVJTSU9OID0gMDguMDQuMDAuMDA1CitUSV9LM19JTUFHRV9HRU5fU0lU
RSA9IGh0dHBzOi8vZ2l0LnRpLmNvbS9jZ2l0L2szLWltYWdlLWdlbi9rMy1pbWFnZS1nZW4vc25h
cHNob3QKK1RJX0szX0lNQUdFX0dFTl9TT1VSQ0UgPSBrMy1pbWFnZS1nZW4tJChUSV9LM19JTUFH
RV9HRU5fVkVSU0lPTikudGFyLmd6CitUSV9LM19JTUFHRV9HRU5fTElDRU5TRSA9IEJTRC0zLUNs
YXVzZQorVElfSzNfSU1BR0VfR0VOX0xJQ0VOU0VfRklMRVMgPSBzeXN0ZW0tZmlybXdhcmUtaW1h
Z2UtZ2VuLTEuMC1tYW5pZmVzdC5odG1sCitUSV9LM19JTUFHRV9HRU5fSU5TVEFMTF9JTUFHRVMg
PSBZRVMKK1RJX0szX0lNQUdFX0dFTl9ERVBFTkRFTkNJRVMgPSBob3N0LWFybS1nbnUtdG9vbGNo
YWluIHRpLWszLXI1LWxvYWRlcgorVElfSzNfSU1BR0VfR0VOX01BS0UgPSAkKEJSMl9NQUtFKQor
VElfSzNfSU1BR0VfR0VOX1NPQyA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX1RJX0szX0lN
QUdFX0dFTl9TT0MpKQorVElfSzNfSU1BR0VfR0VOX0NPTkZJRyA9ICQoY2FsbCBxc3RyaXAsJChC
UjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9DT05GSUcpKQorVElfSzNfSU1BR0VfR0VOX01BS0Vf
T1BUUyA9IFwKKwlTT0M9JChUSV9LM19JTUFHRV9HRU5fU09DKSBcCisJQ09ORklHPSQoVElfSzNf
SU1BR0VfR0VOX0NPTkZJRykgXAorCUNST1NTX0NPTVBJTEU9JChIT1NUX0FSTV9HTlVfVE9PTENI
QUlOX0lOU1RBTExfRElSKS9iaW4vYXJtLW5vbmUtZWFiaS0gXAorCVNCTD0kKEJJTkFSSUVTX0RJ
UikvcjUtdS1ib290LXNwbC5iaW4gXAorCU89JChCSU5BUklFU19ESVIpIFwKKwlCSU5fRElSPSQo
QklOQVJJRVNfRElSKQorCitkZWZpbmUgVElfSzNfSU1BR0VfR0VOX0JVSUxEX0NNRFMKKwkkKFRJ
X0szX0lNQUdFX0dFTl9NQUtFKSAtQyAkKEBEKSAkKFRJX0szX0lNQUdFX0dFTl9NQUtFX09QVFMp
CitlbmRlZgorCitkZWZpbmUgVElfSzNfSU1BR0VfR0VOX0lOU1RBTExfSU1BR0VTX0NNRFMKKwlj
cCAkKEBEKS90aWJvb3QzLmJpbiAkKEJJTkFSSUVTX0RJUikKK2VuZGVmCisKKyQoZXZhbCAkKGdl
bmVyaWMtcGFja2FnZSkpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
