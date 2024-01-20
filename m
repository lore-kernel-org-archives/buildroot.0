Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B99C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 18:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDD1183ED1;
	Sat, 20 Jan 2024 18:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDD1183ED1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cayhPchB_pH9; Sat, 20 Jan 2024 18:48:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B3F0827DD;
	Sat, 20 Jan 2024 18:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B3F0827DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D5AB1BF409
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 18:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB10160EEB
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 18:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB10160EEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cfznhRtqX9nE for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 18:48:49 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2986160EE8
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 18:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2986160EE8
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N0G5n-1rDyVW1zWh-00xLRF; Sat, 20 Jan 2024 19:48:45 +0100
Message-ID: <e2970474-911a-457f-b2b5-aecfcf11904b@vivier.eu>
Date: Sat, 20 Jan 2024 19:48:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240120172839.763337-1-fontaine.fabrice@gmail.com>
 <faad09fc-7f14-42a9-8671-5882b55b39a2@vivier.eu>
 <CAPi7W82=koh3t-qVCMt_J1W46AXeB25r7hDszxvsOZrQgyBWRw@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; keydata=
 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
In-Reply-To: <CAPi7W82=koh3t-qVCMt_J1W46AXeB25r7hDszxvsOZrQgyBWRw@mail.gmail.com>
X-Provags-ID: V03:K1:xda3LEI+VVCur4XYIj53qt6L67mn1VhLIvoJDvdJQg4kZUvGPL4
 cqEgwTDALklINkTD+YjDgKvTwt9aMZrRIMYvSYPWUur6qtI2YN0G/VCUSECu0J0J1LmXFms
 b/p5Sg+Pge/Sk35q163f/JYmdt4EQGOOos2LhN3vHtTuWtk06huu5VP82weWKxpw8KI5Kgn
 Drv0u3v4H1bmdJT+/Q48g==
UI-OutboundReport: notjunk:1;M01:P0:lvAbFz+gzY0=;WfgRlOzhQJLBjk7Uyee3ZGKJEwO
 2ucwymySSSpKPI7B80C55BIxY7aHVtfucVrpFxh/GQPmBk6lcAD+juyHZW+VlES382JbX8KQQ
 JebvJaoYZ8diBZk069YUpgHjLULxAidq3JGfw5EUU4td8UPfZGX/DXSPPiA0t9UOqNCPeePBX
 KzI4ZTH03GFk+DKn/6GG/R6vOiOxDPyrwtJi4bJD0EHWuFAQgMOUEP62wCihENfM2u7V8HOYz
 7/nuKthRtEnODoi7BdKBxxSEWoR8uLjbqAXjYDodlFrNZb7VlrMd/Xp2MYUUa8OJpiKN45erb
 DUFkXyEezWyKRYaKEYXGT5IeMY0E7Ylb7qZM0V80ut6ZpkB0vr4x9OXAhjA0du6LxhObLUJcC
 PemJj9SN992TtOF/Ks0XBKDZ05ISFL7LeQYQJAiPACSL/TylQCuFBz1a5o0xYYq8VidV9rKI7
 GEWqQf2v4gcBUQHj5Dg6rnZs/E1HNLTs1CPNfxq6sKzzapG//G1vl+S7edzLtp+SbgL4ORl0m
 eUqan3bu5AbUTSzkL0dJeydop99OhRqy+0b9Ux1Xfmbi0IifPIIprCfFGLYzsivDbj6TL6t6/
 Fu3XoHGlC4zEZYuF92WuElDTmP19t/D6rBFqSKEMd6fQD/9+czT6ZMxZb7GT6xuDNzebGwbEl
 Oq85SSAiyn6CHZBvrRbrnSJYyIF+t/KHB9BrM0DkZAxEtZkj3+Wz86dl+MLdcZ5+TasBX+dXx
 XLDENXhFaXtymii3wV6Jw8LHaeCzZgUdWbsxqmowxz8B7NTELZISNsNWW82FrUw40TTDuRN2f
 wRnMo4A9XbxweRgIMlhOFQW5CwBMe/BDfhcQSb7MOUGBh7yrZ3hsowyJV7YDpBylVmIHyUtFW
 mKGtN0WG/RyBWkQ==
Subject: Re: [Buildroot] [PATCH 1/1] package/petitboot: fix NLS build
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjAvMDEvMjAyNCDDoCAxODo0NiwgRmFicmljZSBGb250YWluZSBhIMOpY3JpdMKgOgo+IExl
IHNhbS4gMjAgamFudi4gMjAyNCDDoCAxODozNywgTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2
aWVyLmV1PiBhIMOpY3JpdCA6Cj4+Cj4+IExlIDIwLzAxLzIwMjQgw6AgMTg6MjgsIEZhYnJpY2Ug
Rm9udGFpbmUgYSDDqWNyaXQgOgo+Pj4gRml4IHRoZSBmb2xsb3dpbmcgTkxTIGJ1aWxkIGZhaWx1
cmUgb24gbXVzbCByYWlzZWQgY29tbWl0Cj4+PiBiZjk1ODNhNTAyNzZmNTJlZGJjMzdkOWY4NWRm
NWYyY2M3ZmRiNWRjOgo+Pj4KPj4+IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2Ut
NC9vdXRwdXQtMS9ob3N0L2xpYi9nY2MvbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LW11c2wvMTMu
Mi4wLy4uLy4uLy4uLy4uL21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC1tdXNsL2Jpbi9sZDogZGlz
Y292ZXIvcGJfZGlzY292ZXItcGItZGlzY292ZXIubzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBz
eW1ib2wgJ2xpYmludGxfdGV4dGRvbWFpbicKPj4+Cj4+PiBGaXhlczoKPj4+ICAgIC0gaHR0cDov
L2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNmQ0NDBkOTZlODExNjc0MDQxYjVhMWZk
YWU5NmQ0YzM3NzgyNGMyYQo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUg
PGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiAgICBwYWNrYWdlL3BldGl0
Ym9vdC9wZXRpdGJvb3QubWsgfCAxMCArKysrKysrKystCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcGV0aXRib290L3BldGl0Ym9vdC5tayBiL3BhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC5t
awo+Pj4gaW5kZXggYzRlYjIwYjQ0ZC4uMjA4N2YwMWIwOSAxMDA2NDQKPj4+IC0tLSBhL3BhY2th
Z2UvcGV0aXRib290L3BldGl0Ym9vdC5tawo+Pj4gKysrIGIvcGFja2FnZS9wZXRpdGJvb3QvcGV0
aXRib290Lm1rCj4+PiBAQCAtNywxMCArNywxOCBAQAo+Pj4gICAgUEVUSVRCT09UX1ZFUlNJT04g
PSAxLjE0Cj4+PiAgICBQRVRJVEJPT1RfU09VUkNFID0gcGV0aXRib290LXYkKFBFVElUQk9PVF9W
RVJTSU9OKS50YXIuZ3oKPj4+ICAgIFBFVElUQk9PVF9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29t
L29wZW4tcG93ZXIvcGV0aXRib290L3JlbGVhc2VzL2Rvd25sb2FkL3YkKFBFVElUQk9PVF9WRVJT
SU9OKQo+Pj4gLVBFVElUQk9PVF9ERVBFTkRFTkNJRVMgPSBlbGZ1dGlscyBuY3Vyc2VzIHVkZXYg
aG9zdC1iaXNvbiBob3N0LWZsZXggbHZtMgo+Pj4gK1BFVElUQk9PVF9ERVBFTkRFTkNJRVMgPSBc
Cj4+PiArICAgICBlbGZ1dGlscyBcCj4+PiArICAgICBuY3Vyc2VzIFwKPj4+ICsgICAgIHVkZXYg
XAo+Pj4gKyAgICAgaG9zdC1iaXNvbiBcCj4+PiArICAgICBob3N0LWZsZXggXAo+Pj4gKyAgICAg
bHZtMiBcCj4+PiArICAgICAkKFRBUkdFVF9OTFNfREVQRU5ERU5DSUVTKQo+Pj4gICAgUEVUSVRC
T09UX0xJQ0VOU0UgPSBHUEwtMi4wCj4+PiAgICBQRVRJVEJPT1RfTElDRU5TRV9GSUxFUyA9IENP
UFlJTkcKPj4+Cj4+PiArUEVUSVRCT09UX0NPTkZfRU5WID0gTERGTEFHUz0iJChUQVJHRVRfTERG
TEFHUykgJChUQVJHRVRfTkxTX0xJQlMpIgo+Pgo+PiBzaG91bGQgaXQgYmUKPj4KPj4gUEVUSVRC
T09UX0NPTkZfRU5WID0gTERGTEFHUz0iJChUQVJHRVRfTERGTEFHUykgTElCUz0kKFRBUkdFVF9O
TFNfTElCUykKPiAKPiBObywgc2V0dGluZyBMSUJTIHRvIFRBUkdFVF9OTFNfTElCUyB3aWxsIHJh
aXNlIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZToKPiAKPiAgICBHRU4gICAgICBkaXNjb3Zl
ci9ncnViMi9ncnViMi1wYXJzZXIucm8KPiAvaG9tZS9mYWJyaWNlL2J1aWxkcm9vdC9vdXRwdXQv
aG9zdC9iaW4vbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LW11c2wtbGQ6Cj4gY2Fubm90IGZpbmQg
LWxpbnRsOiBmaWxlIGZvcm1hdCBub3QgcmVjb2duaXplZAo+IAo+IEkgYXNzdW1lIHRoYXQgdGhp
cyBidWlsZCBmYWlsdXJlIGlzIHJhaXNlZCBiZWNhdXNlIHBldGl0Ym9vdCBhbHNvCj4gYnVpbGRz
IGhvc3QgdG9vbHMgc3VjaCBhcyBncnViMi1wYXJzZXIucm8gd2hpY2ggY2FuJ3QgZmluZCBhIC1s
aW50bAo+IGxpYnJhcnkgY29tcGF0aWJsZSB3aXRoIHRoZSBob3N0Lgo+IApSZXZpZXdlZC1ieTog
TGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
