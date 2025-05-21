Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F06FC54E90
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 08:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C06B6606EF;
	Wed, 21 May 2025 08:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQ7DoKyvD-tB; Wed, 21 May 2025 08:43:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5D8660704
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5D8660704;
	Wed, 21 May 2025 08:43:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A177611B
 for <buildroot@buildroot.org>; Wed, 21 May 2025 08:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 874CB81C26
 for <buildroot@buildroot.org>; Wed, 21 May 2025 08:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2OF-dtwQgSf for <buildroot@buildroot.org>;
 Wed, 21 May 2025 08:43:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 343C381C18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 343C381C18
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 343C381C18
 for <buildroot@buildroot.org>; Wed, 21 May 2025 08:43:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.117.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTRMi-1uNHED3WKi-00WFLp; Wed, 21
 May 2025 10:43:29 +0200
Message-ID: <4e27d50a-1ee6-47a6-858c-3baefa29b322@gmx.de>
Date: Wed, 21 May 2025 10:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Yan <andyshrk@163.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20250519103955.49288872E7@busybox.osuosl.org>
 <3b9c0e07.4f5.196f03d322b.Coremail.andyshrk@163.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <3b9c0e07.4f5.196f03d322b.Coremail.andyshrk@163.com>
X-Provags-ID: V03:K1:W+Hz6xQvRRwtQJvnN21s21a18ewnCgSYtmye1WcW0iQRTjOtL6B
 GGAf1Xj/UzvfZQl/CexIyLoCrrr+/doY7McDjK0oW6YE7kxw0jKyCmIlBs1uqFSnKmSrDkU
 Tu1TZB8Gly6bxEPB26m5biDsehdwhmV3PSaaLpdvocHemTRZ015y1RrCx5/DM2MDM2kmCgv
 lC2t77SLm28UWkTb80Biw==
UI-OutboundReport: notjunk:1;M01:P0:dbvnwrLN0Nw=;2XnJKTZTcHxnfTQ/tFXypz6FRQq
 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
 piwkFOXjhB4zXf8c
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747817010; x=1748421810; i=fiona.klute@gmx.de;
 bh=eiIxLBjEapJghik8y9/VZ3DwpUR+OX/0rS5Xt+XAEqw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=EqdlXOExgMNA9+Rh+Bt/HVwIh9kNiiMSXqqYs2HWETuLCwRjysRV39G8KEhhSrWA
 mGkYp68ru2CwV8FtPT9N9nDBPzgC85rf9Ia0F8rHOwpFS8nlsmN5l/W7E+tSXelEe
 EuiPv3ZR23hpepgyBDlB5kavlGJKSPkKSiDF/QyGzKKazb3cCL67jYcdwtdL7RNru
 nqL7WQH9vco4DS4W4MmQ7bvY+T3DZ6p67DHeayqutW11ANSmYq3qHfgeGylvqM3QN
 98bUl5bV8pkyK+1lbDYQfztLXyFoRnRWxoEcpUaCQ6yGYhbkk7+HbNGURBdecChTY
 vqTUHcsyOix41PQEcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=EqdlXOEx
Subject: Re: [Buildroot] [git commit branch/next] package/busybox: save
 shell history only on exit
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMjEuMDUuMjUgdW0gMDI6Mjcgc2NocmllYiBBbmR5IFlhbjoKPiAKPiBIZWxsb++8jAo+IAo+
IEF0IDIwMjUtMDUtMTkgMTk6MDA6MDAsICJUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3Qi
IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4+IGNvbW1pdDogaHR0cHM6Ly9naXQu
YnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD0zZmZkY2M1YjlkYjJhNzAzMjU5Zjkw
MGZkYzgyNTFjNGUwZDE0ZGZiCj4+IGJyYW5jaDogaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9i
dWlsZHJvb3QvY29tbWl0Lz9pZD1yZWZzL2hlYWRzL25leHQKPj4KPj4gQm90aCBidXN5Ym94LmNv
bmZpZyBhbmQgYnVzeWJveC1taW5pbWFsLmNvbmZpZyBzZXQKPj4gQ09ORklHX0ZFQVRVUkVfRURJ
VElOR19TQVZFSElTVE9SWT15LiBUaGlzIGNhdXNlcyB0aGUgQnVzeWJveCBzaGVsbCB0bwo+PiB3
cml0ZSB0aGUgaGlzdG9yeSBmaWxlIGFmdGVyIGV2ZXJ5IGNvbW1hbmQsIHdoaWNoIGNhbiBiZSBh
IHByb2JsZW0gb24KPj4gc3RvcmFnZSB3aXRoIGxpbWl0ZWQgd3JpdGUgY3ljbGVzIChlLmcuIGVN
TUMpLgo+Pgo+PiBTZXQgQ09ORklHX0ZFQVRVUkVfRURJVElOR19TQVZFX09OX0VYSVQ9eSB0byBj
aGFuZ2UgYmVoYXZpb3IgdG8gd3JpdGUKPj4gdGhlIGhpc3RvcnkgZmlsZSBvbmx5IG9uIGV4aXQs
IHdoaWNoIHJlZHVjZXMgd3JpdGVzIHdpdGhvdXQgbG9zaW5nIHRoZQo+PiBoaXN0b3J5IGZlYXR1
cmUuCj4gCj4gQWZ0ZXIgYXBwbHlpbmcgdGhpcyBwYXRjaCwgbXkgc2hlbGwgaGlzdG9yeSB3YXMg
bG9zdCBhZnRlciBJIHJlYm9vdCBteSBib2FyZCB3aXRoIHJlYm9vdCBjb21tYW5kLgo+IElmIEkg
ZW5hYmxlIHRoZSBvcHRpb24gQ09ORklHX0ZFQVRVUkVfRURJVElOR19TQVZFSElTVE9SWT15LCB0
aGUgc2hlbGwgaGlzdG9yeSB3aWxsIGNvbWUgYmFjayBhZnRlciByZWJvb3QuCj4gV2FzIGl0IHNv
bWV0aGluZyBJIG1pc3NlZCBpbiB0aGUgZGV0YWlscz8KClRoYXQncyB1bmZvcnR1bmF0ZWx5IHRy
dWUsIHRoZSBCdXN5Ym94IHNoZWxsIGRvZXNuJ3Qgc2VlbSB0byBjbGVhbmx5IApleGl0IGR1cmlu
ZyBzaHV0ZG93biAoYXQgbGVhc3Qgb3ZlciBTU0gsIG5vdCBzdXJlIGFib3V0IHNlcmlhbCkuIEkg
CnVzdWFsbHkgdXNlICJyZWJvb3Q7IGV4aXQiIHRvIGF2b2lkIHRoYXQgb24gbXkgZGV2IHN5c3Rl
bXMuCgpCZXN0IHJlZ2FyZHMsCkZpb25hCgo+PiBTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSAo
V0lXQSkgPGZpb25hLmtsdXRlQGdteC5kZT4KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6
em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPj4gLS0tCj4+IHBhY2thZ2UvYnVz
eWJveC9idXN5Ym94LW1pbmltYWwuY29uZmlnIHwgMiArLQo+PiBwYWNrYWdlL2J1c3lib3gvYnVz
eWJveC5jb25maWcgICAgICAgICB8IDIgKy0KPj4gMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2J1c3lib3gv
YnVzeWJveC1taW5pbWFsLmNvbmZpZyBiL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94LW1pbmltYWwu
Y29uZmlnCj4+IGluZGV4IDk3MzNkZDIxNTYuLjFlNGI0MDQ0NzkgMTAwNjQ0Cj4+IC0tLSBhL3Bh
Y2thZ2UvYnVzeWJveC9idXN5Ym94LW1pbmltYWwuY29uZmlnCj4+ICsrKyBiL3BhY2thZ2UvYnVz
eWJveC9idXN5Ym94LW1pbmltYWwuY29uZmlnCj4+IEBAIC0xMDUsNyArMTA1LDcgQEAgQ09ORklH
X0ZFQVRVUkVfRURJVElOR19NQVhfTEVOPTEwMjQKPj4gQ09ORklHX0ZFQVRVUkVfRURJVElOR19W
ST15Cj4+IENPTkZJR19GRUFUVVJFX0VESVRJTkdfSElTVE9SWT05OTkKPj4gQ09ORklHX0ZFQVRV
UkVfRURJVElOR19TQVZFSElTVE9SWT15Cj4+IC0jIENPTkZJR19GRUFUVVJFX0VESVRJTkdfU0FW
RV9PTl9FWElUIGlzIG5vdCBzZXQKPj4gK0NPTkZJR19GRUFUVVJFX0VESVRJTkdfU0FWRV9PTl9F
WElUPXkKPj4gQ09ORklHX0ZFQVRVUkVfUkVWRVJTRV9TRUFSQ0g9eQo+PiBDT05GSUdfRkVBVFVS
RV9UQUJfQ09NUExFVElPTj15Cj4+ICMgQ09ORklHX0ZFQVRVUkVfVVNFUk5BTUVfQ09NUExFVElP
TiBpcyBub3Qgc2V0Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2J1c3lib3gvYnVzeWJveC5jb25m
aWcgYi9wYWNrYWdlL2J1c3lib3gvYnVzeWJveC5jb25maWcKPj4gaW5kZXggNjlkODk2YmViZC4u
ODIzZmNkMmI0NiAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9idXN5Ym94L2J1c3lib3guY29uZmln
Cj4+ICsrKyBiL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94LmNvbmZpZwo+PiBAQCAtMTA4LDcgKzEw
OCw3IEBAIENPTkZJR19GRUFUVVJFX0VESVRJTkdfTUFYX0xFTj0xMDI0Cj4+IENPTkZJR19GRUFU
VVJFX0VESVRJTkdfVkk9eQo+PiBDT05GSUdfRkVBVFVSRV9FRElUSU5HX0hJU1RPUlk9OTk5Cj4+
IENPTkZJR19GRUFUVVJFX0VESVRJTkdfU0FWRUhJU1RPUlk9eQo+PiAtIyBDT05GSUdfRkVBVFVS
RV9FRElUSU5HX1NBVkVfT05fRVhJVCBpcyBub3Qgc2V0Cj4+ICtDT05GSUdfRkVBVFVSRV9FRElU
SU5HX1NBVkVfT05fRVhJVD15Cj4+IENPTkZJR19GRUFUVVJFX1JFVkVSU0VfU0VBUkNIPXkKPj4g
Q09ORklHX0ZFQVRVUkVfVEFCX0NPTVBMRVRJT049eQo+PiAjIENPTkZJR19GRUFUVVJFX1VTRVJO
QU1FX0NPTVBMRVRJT04gaXMgbm90IHNldAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAoKCi0tIApEaXBsLi1JbmcuIEZpb25hIEtsdXRlCk1vbGx3aXR6ZXIg
U3RyLiAyCjQ0MTQxIERvcnRtdW5kCkdlcm1hbnkKClVTdC4tSUQvVkFUIG51bWJlcjogREUzNjM0
ODg5NDQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
