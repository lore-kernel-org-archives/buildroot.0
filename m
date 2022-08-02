Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF61C19F29
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 20:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FC934099C;
	Tue,  2 Aug 2022 20:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FC934099C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XenIVWHSAbmb; Tue,  2 Aug 2022 20:05:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD0654091D;
	Tue,  2 Aug 2022 20:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD0654091D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FFCB1BF3B8
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D68E60AC2
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D68E60AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id voVHUihNfUaF for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 20:05:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21F2B60A87
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21F2B60A87
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 20:05:26 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 272K5N2Q071171;
 Tue, 2 Aug 2022 15:05:23 -0500
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 272K5NGJ073218
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Aug 2022 15:05:23 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 2
 Aug 2022 15:05:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 2 Aug 2022 15:05:23 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 272K5M3S106903;
 Tue, 2 Aug 2022 15:05:23 -0500
To: <buildroot@buildroot.org>
Date: Tue, 2 Aug 2022 15:05:21 -0500
Message-ID: <20220802200522.4619-3-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220802200522.4619-1-x-shi@ti.com>
References: <20220802200522.4619-1-x-shi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1659470723;
 bh=uQb+dU9bLn5/0TkseSXWFbfFlvRCwMQWCb8gSaR3tuk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=SwX9pslD0LCh0bq9B+dDSKQYlCLJUIv1LwYg71bIoNWkZcqCg+6RabzVTdV/V6NEW
 cZjv60Mjf9hzyMifZweh9XRCiv25imm9H4ZVR7kSBlpbF0S0MRksE3GZEk7wA0chOT
 CZ56ce04L+oV0RiQTie3kXdi5pqHixfOoWHsZsQM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=SwX9pslD
Subject: [Buildroot] [PATCH 2/3] boot/ti-k3-image-gen: add new package
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

VGhpcyBpcyB0aGUgaW1hZ2UgZ2VuZXJhdG9yIHRoYXQgYnVpbGRzIHRoZSBmdWxsIGJvb3QgYmlu
YXJ5LAp0aWJvb3QzLmJpbiwgZm9yIHRoZSBSNSBjb3JlIG9uIFRJJ3MgazMgZGV2aWNlcy4KVGhp
cyByZXF1aXJlcyB0aGUgUjUgc3BsIG91dHB1dCBmcm9tIHRoZSB0aS1rMy1yNS1sb2FkZXIgcGFj
a2FnZS4KCmh0dHBzOi8vZ2l0LnRpLmNvbS9jZ2l0L2szLWltYWdlLWdlbi9rMy1pbWFnZS1nZW4K
U2lnbmVkLW9mZi1ieTogWHVhbmhhbyBTaGkgPHgtc2hpQHRpLmNvbT4KLS0tCiBERVZFTE9QRVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCiBib290L0NvbmZpZy5pbiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIGJvb3QvdGktazMtaW1hZ2UtZ2VuL0Nv
bmZpZy5pbiAgICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysKIGJvb3QvdGktazMtaW1h
Z2UtZ2VuL3RpLWszLWltYWdlLWdlbi5oYXNoIHwgIDIgKysKIGJvb3QvdGktazMtaW1hZ2UtZ2Vu
L3RpLWszLWltYWdlLWdlbi5tayAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysKIDUgZmls
ZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGkt
azMtaW1hZ2UtZ2VuL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGktazMtaW1h
Z2UtZ2VuL3RpLWszLWltYWdlLWdlbi5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9vdC90aS1r
My1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBi
L0RFVkVMT1BFUlMKaW5kZXggZTQ5OGQyZmYwMy4uYjIxZGVmMTExYyAxMDA2NDQKLS0tIGEvREVW
RUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xMjgsNiArMTI4LDcgQEAgRjoJcGFja2FnZS9s
aWJ4bWxycGMvCiBGOglwYWNrYWdlL3B5dGhvbi1kb2NvcHQvCiAKIE46CUFuYW5kIEdhZGl5YXIg
PGdhZGl5YXJAdGkuY29tPgorRjoJYm9vdC90aS1rMy1pbWFnZS1nZW4vCiBGOglib290L3RpLWsz
LXI1LWxvYWRlci8KIAogTjoJQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgpAQCAtMzAy
NSw2ICszMDI2LDcgQEAgTjoJV29qY2llY2ggTml6acWEc2tpIDxuaXppYWtAc3BveC5vcmc+CiBG
OglwYWNrYWdlL2Z3dXAvCiAKIE46CVh1YW5oYW8gU2hpIDxYMTUwMDAxNzdAZ21haWwuY29tPgor
RjoJYm9vdC90aS1rMy1pbWFnZS1nZW4vCiBGOglib290L3RpLWszLXI1LWxvYWRlci8KIAogTjoJ
WWFpciBCZW4gQXZyYWhhbSA8eWFpcmJhQHByb3Rvbm1haWwuY29tPgpkaWZmIC0tZ2l0IGEvYm9v
dC9Db25maWcuaW4gYi9ib290L0NvbmZpZy5pbgppbmRleCBjZTE3YjJkZjZiLi4xYjI1YmFjZmVl
IDEwMDY0NAotLS0gYS9ib290L0NvbmZpZy5pbgorKysgYi9ib290L0NvbmZpZy5pbgpAQCAtMjIs
NiArMjIsNyBAQCBzb3VyY2UgImJvb3QvczUwMC1ib290bG9hZGVyL0NvbmZpZy5pbiIKIHNvdXJj
ZSAiYm9vdC9zaGltL0NvbmZpZy5pbiIKIHNvdXJjZSAiYm9vdC9zdW4yMGktZDEtc3BsL0NvbmZp
Zy5pbiIKIHNvdXJjZSAiYm9vdC9zeXNsaW51eC9Db25maWcuaW4iCitzb3VyY2UgImJvb3QvdGkt
azMtaW1hZ2UtZ2VuL0NvbmZpZy5pbiIKIHNvdXJjZSAiYm9vdC90aS1rMy1yNS1sb2FkZXIvQ29u
ZmlnLmluIgogc291cmNlICJib290L3Vib290L0NvbmZpZy5pbiIKIHNvdXJjZSAiYm9vdC92ZXhw
cmVzcy1maXJtd2FyZS9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9ib290L3RpLWszLWltYWdlLWdl
bi9Db25maWcuaW4gYi9ib290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4KbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMDA0MTZkY2VmYwotLS0gL2Rldi9udWxsCisrKyBi
L2Jvb3QvdGktazMtaW1hZ2UtZ2VuL0NvbmZpZy5pbgpAQCAtMCwwICsxLDI0IEBACitjb25maWcg
QlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU4KKwlib29sICJ0aS1rMy1pbWFnZS1nZW4iCisJc2Vs
ZWN0IEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSCisJaGVscAorCSAgVXNlIFRJJ3MgazMtaW1h
Z2UtZ2VuIHRvIGJ1aWxkIGEgc2VwYXJhdGUgYmFyZSBtZXRhbAorCSAgYm9vdCBiaW5hcnkgZnJv
bSBhIHNlcGFyYXRlIHNwbC4gQ3VycmVudGx5IHN1cHBvcnRzCisJICB2ZXJzaW9uIDA4LjA0LjAw
LjAwNSBhcyBkZWZhdWx0LgorCisJICBodHRwczovL2dpdC50aS5jb20vY2dpdC9rMy1pbWFnZS1n
ZW4vazMtaW1hZ2UtZ2VuLworCitjb25maWcgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU09D
CisJc3RyaW5nICJTT0MgdHlwZSBmb3IgaW1hZ2UgZ2VuIgorCWRlcGVuZHMgb24gQlIyX1RBUkdF
VF9USV9LM19JTUFHRV9HRU4KKwloZWxwCisJICBUaGUgdGFyZ2V0IFNvQyBvcHRpb24gZm9yIGlt
YWdlIGdlbi4KKwkgIEZvciBleGFtcGxlLCAiYW02NHgiIGZvciBBTTY0WCBib2FyZHMuCisKK2Nv
bmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9DT05GSUcKKwlzdHJpbmcgIkNPTkZJRyB0
eXBlIGZvciBpbWFnZSBnZW4iCisJZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dF
TgorCWhlbHAKKwkgIFRoZSBib2FyZCBjb25maWcgb3B0aW9uIGZvciBpbWFnZSBnZW4uCisJICBV
c3VhbGx5ICJzayIgb3IgImV2bSIuCisKZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtaW1hZ2UtZ2Vu
L3RpLWszLWltYWdlLWdlbi5oYXNoIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2Ut
Z2VuLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZTMwN2EwMmE2
NwotLS0gL2Rldi9udWxsCisrKyBiL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdl
bi5oYXNoCkBAIC0wLDAgKzEsMiBAQAorIyBMb2NhbGx5IGNhbGN1bGF0ZWQKK3NoYTI1NiAgZTU4
NWRjODY4YWRhMjFlZjMzODkxNTk1NDFkNjY5Yjg4YmM0MDZiNDUzNDcwZTkyZGE4NWQ5MjIyZDI3
MWM5NiAgazMtaW1hZ2UtZ2VuLTA4LjA0LjAwLjAwNS50YXIuZ3oKZGlmZiAtLWdpdCBhL2Jvb3Qv
dGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tayBiL2Jvb3QvdGktazMtaW1hZ2UtZ2Vu
L3RpLWszLWltYWdlLWdlbi5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li4xZjk3NDkwMzkyCi0tLSAvZGV2L251bGwKKysrIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vdGkt
azMtaW1hZ2UtZ2VuLm1rCkBAIC0wLDAgKzEsMzMgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CisjCisjIHRpLWszLWltYWdlLWdlbgorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworVElf
SzNfSU1BR0VfR0VOX1ZFUlNJT04gPSAwOC4wNC4wMC4wMDUKK1RJX0szX0lNQUdFX0dFTl9TSVRF
ID0gaHR0cHM6Ly9naXQudGkuY29tL2NnaXQvazMtaW1hZ2UtZ2VuL2szLWltYWdlLWdlbi9zbmFw
c2hvdAorVElfSzNfSU1BR0VfR0VOX1NPVVJDRSA9IGszLWltYWdlLWdlbi0kKFRJX0szX0lNQUdF
X0dFTl9WRVJTSU9OKS50YXIuZ3oKK1RJX0szX0lNQUdFX0dFTl9MSUNFTlNFID0gQlNELTMtQ2xh
dXNlCitUSV9LM19JTUFHRV9HRU5fTElDRU5TRV9GSUxFUyA9IHN5c3RlbS1maXJtd2FyZS1pbWFn
ZS1nZW4tMS4wLW1hbmlmZXN0Lmh0bWwKK1RJX0szX0lNQUdFX0dFTl9JTlNUQUxMX0lNQUdFUyA9
IFlFUworVElfSzNfSU1BR0VfR0VOX0RFUEVOREVOQ0lFUyA9IGhvc3QtYXJtLWdudS10b29sY2hh
aW4gdGktazMtcjUtbG9hZGVyCitUSV9LM19JTUFHRV9HRU5fTUFLRSA9ICQoQlIyX01BS0UpCitU
SV9LM19JTUFHRV9HRU5fU09DID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfVElfSzNfSU1B
R0VfR0VOX1NPQykpCitUSV9LM19JTUFHRV9HRU5fQ09ORklHID0gJChjYWxsIHFzdHJpcCwkKEJS
Ml9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX0NPTkZJRykpCitUSV9LM19JTUFHRV9HRU5fTUFLRV9P
UFRTID0gXAorCVNPQz0kKFRJX0szX0lNQUdFX0dFTl9TT0MpIFwKKwlDT05GSUc9JChUSV9LM19J
TUFHRV9HRU5fQ09ORklHKSBcCisJQ1JPU1NfQ09NUElMRT0kKEhPU1RfQVJNX0dOVV9UT09MQ0hB
SU5fSU5TVEFMTF9ESVIpL2Jpbi9hcm0tbm9uZS1lYWJpLSBcCisJU0JMPSQoQklOQVJJRVNfRElS
KS9yNS11LWJvb3Qtc3BsLmJpbiBcCisJTz0kKEJJTkFSSUVTX0RJUikgXAorCUJJTl9ESVI9JChC
SU5BUklFU19ESVIpCisKK2RlZmluZSBUSV9LM19JTUFHRV9HRU5fQlVJTERfQ01EUworCSQoVElf
SzNfSU1BR0VfR0VOX01BS0UpIC1DICQoQEQpICQoVElfSzNfSU1BR0VfR0VOX01BS0VfT1BUUykK
K2VuZGVmCisKK2RlZmluZSBUSV9LM19JTUFHRV9HRU5fSU5TVEFMTF9JTUFHRVNfQ01EUworCWNw
ICQoQEQpL3RpYm9vdDMuYmluICQoQklOQVJJRVNfRElSKQorZW5kZWYKKworJChldmFsICQoZ2Vu
ZXJpYy1wYWNrYWdlKSkKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
