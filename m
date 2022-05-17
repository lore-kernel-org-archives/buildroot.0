Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF453C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 14:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F077A41A3D;
	Tue, 17 May 2022 14:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ISTY9v0FURx6; Tue, 17 May 2022 14:05:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CBDF41A39;
	Tue, 17 May 2022 14:05:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 749B61BF40A
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 14:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6344961198
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 14:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=cosmos-ink.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-CEyZwFeNSC for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 14:05:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.cosmos-ink.net (mail.cosmos-ink.net
 [IPv6:2a01:4f9:4a:25aa::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46BFA611A4
 for <buildroot@buildroot.org>; Tue, 17 May 2022 14:05:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1BBAB1C6B0D7; Tue, 17 May 2022 16:05:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cosmos-ink.net;
 s=dkim; t=1652796304;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-language:in-reply-to:references;
 bh=g57w3zmWpiEmMTYLyogng+3VRfD56ygqNsqGNGGW4PM=;
 b=W/24nXF8mhj61IMb9a5+2RVat7csLCNaRZIrQXaXxJsUIzc4eEsYY173V0J7gvMiLTqLJw
 tHBqdaZ+dI82VKvGTOWLFFs0wsUWUdmRRhXO4pUPJ19oMse0f6PS98B4eR5LRAL6PnhydM
 hXvV8H+ep44Ut8JptX+e+Ocrp95GqKzAEGFb7WCk3FQkKrl1HWhZZrtRsBy95ONHHiRJw+
 T8kcrCdmPsFpTFAWafkmLZQZERwVgTxRCKroFzw0GYrRYrJgE8u2VJHGJxBMFcJvpIASBL
 w2esleQ7qcaPUXLSDEEDDZA1c9yoeqAhguf19PS0/ZDr/qjLJZSFmFvL4FoA7g==
Message-ID: <4abf01ff-1161-1743-20da-37bef7441f01@cosmos-ink.net>
Date: Tue, 17 May 2022 16:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220517032459.3400-1-linus@cosmos-ink.net>
 <20220517053803.GN1597494@scaer>
In-Reply-To: <20220517053803.GN1597494@scaer>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] fs/squashfs: Add block size option
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
From: Linus via buildroot <buildroot@buildroot.org>
Reply-To: Linus <linus@cosmos-ink.net>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1227823338511487114=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1227823338511487114==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QptPZOGalrIxuZpaTvmd1csi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QptPZOGalrIxuZpaTvmd1csi
Content-Type: multipart/mixed; boundary="------------0uVafme9xU9BTUWRj3WOYxYU";
 protected-headers="v1"
From: Linus <linus@cosmos-ink.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <4abf01ff-1161-1743-20da-37bef7441f01@cosmos-ink.net>
Subject: Re: [PATCH 1/2] fs/squashfs: Add block size option
References: <20220517032459.3400-1-linus@cosmos-ink.net>
 <20220517053803.GN1597494@scaer>
In-Reply-To: <20220517053803.GN1597494@scaer>

--------------0uVafme9xU9BTUWRj3WOYxYU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgWWFubiwgQWxsLA0KDQo+IC4uLiB0aGVyZSBpcyBubyBuZWVkIHRvIGFkZCBpdCBhIHNl
Y29uZCB0aW1lIGJhc2VkIG9uIHRoZSBib29sZWFucy4NClVwcywgdGhhdCB3YXMgYSBsYXRl
LW5pZ2h0IG92ZXJzaWdodCBvZiBtZSB3aGVuIGNoYW5naW5nIHRoZSBhcHJvYWNoDQpvbiB0
aGUgdXNhZ2UgIjQiLXN1ZmZpeCBhbmQgdXNhZ2Ugb2YgYm9vbGVhbnMgaW4gdGhlIG1ha2Vm
aWxlLiBIYWQgMg0KcmVwb3MgKG9uZSBjbGVhbiBmb3IgdGhlIHBhdGNoIGFuZCBvbmUgd29y
ayBvbmUgdG8gdGVzdCBpdCBvdXQgb24pLiBJDQpzZWVtcyBJIGZvcmdvdCB0byBwcm9wZXJs
eSBmaXh1cCB0aGUgZmlyc3QgcGF0Y2ggZHJhZnQgb2YgYmxvY2sgc2l6ZS4NClRoYW5rcyBm
b3IgZml4aW5nIG15IG1pc3Rha2UgaGVyZSENCg0KQWxzbyBkaWRuJ3Qga25vdyBhYm91dCB0
aGUgY2hlY2stcGFja2FnZS4gVGhhbmtzIGZvciBmaXhpbmcgdGhhdA0KYXMgd2VsbCEgKEkg
U2hvdWxkIHByb2JhYmx5IHJlYWQgbW9yZSBkb2NzIHhEKQ0KDQpCZWNhdXNlIG9mIHRoZSBz
cGFjZSBJIG9ubHkgcHV0IHRoZSB2YWx1ZSBvZiAiLWIiIGludG8NCkJSMl9UQVJHRVRfUk9P
VEZTX1NRVUFTSEZTX0JTIHRvIG5vdCBuZWVkIHFzcGxpdC4NClRoZSB1c2FnZSBvZiBxc3Bs
aXQgaXMgdGhlcmVmb3JlIGN1cnJlbnRseSBub3QgbmVjZXNzYXJ5Lg0KTWF5YmUganVzdCBw
dXQgdGhlICItYiIgYWxzbyBpbiB0aGUgY29uZmlnIGFuZCBkaXNjYXJkIGl0DQppbiB0aGUg
bWFrZWZpbGUgZm9yIGJldHRlciBjbGFyaXR5IHRoZW4uIChjb21taXQgNTU1ZjhkZmQpDQoN
Cj4gTm90ZSB0aGF0IGFkZGluZyB0ZXN0cyBjYW4gYmUgZG9uZSBpbiBhIGZvbGxvd3VwIHBh
dGNoLCBvZiBjb3Vyc2UuDQoNCldpbGwgc2VuZCBhIHBhdGNoIHNob3J0bHkgZm9yIHRoYXQu
DQoNCkFsc28sIHRoYW5rcyBmb3IgdGFraW5nIHlvdXIgdGltZSBpbiB0ZXN0aW5nLCBmaXhp
bmcgYW5kIGhlbHBpbmcNCm1lIHdpdGggdGhlc2UgY2hhbmdlcyENCg0KR3JlZXRpbmdzLA0K
TGludXMgS2FzY2h1bGxhDQoNCkFtIDE3LjA1LjIyIHVtIDA3OjM4IHNjaHJpZWIgWWFubiBF
LiBNT1JJTjoNCj4gTGludXMsIEFsbCwNCj4NCj4gT24gMjAyMi0wNS0xNyAwMzoyNCArMDAw
MCwgTGludXMgS2FzY2h1bGxhIHNwYWtlIHRodXNseToNCj4+IE9uZSBhZHZhbnRhZ2Ugb2Yg
c3F1YXNoZnMgb3ZlciBzaW1pbGFyIHRlY2hub2xvZ2llcyBpcyB0aGUgc3VwcG9ydCBmb3IN
Cj4+IGJpZ2dlciBibG9jayBzaXplcy4gSG93ZXZlciB0aGUgZGVmYXVsdCBzaXplIGlzIG5v
dCBhIGxvdCBiaWdnZXINCj4+ICh0eXBpY2FsbHkgMTI4ayBpZiBubyBgLWJgIGZsYWcgc3Bl
Y2lmaWVkKS4NCj4+DQo+PiBUaGlzIHBhdGNoIGFkZHMgdGhlIGFiaWxpdHkgdG8gc2VsZWN0
IGZyb20gY29tbW9uIGJsb2NrIHNpemVzDQo+PiB3aGljaCBmb3IgZXhhbXBsZSBjYW4gYWlk
IGluIGltcHJvdmluZyBjb21wcmVzc2lvbiByYXRpby4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBMaW51cyBLYXNjaHVsbGEgPGxpbnVzQGNvc21vcy1pbmsubmV0Pg0KPj4gLS0tDQo+PiAg
IGZzL3NxdWFzaGZzL0NvbmZpZy5pbiAgIHwgNTAgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4+ICAgZnMvc3F1YXNoZnMvc3F1YXNoZnMubWsgfCAxNCAr
KysrKysrKysrKy0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2ZzL3NxdWFzaGZzL0NvbmZpZy5p
biBiL2ZzL3NxdWFzaGZzL0NvbmZpZy5pbg0KPj4gaW5kZXggNzBkNGEyMGNmMC4uMzQxZTUw
YTA4YyAxMDA2NDQNCj4+IC0tLSBhL2ZzL3NxdWFzaGZzL0NvbmZpZy5pbg0KPj4gKysrIGIv
ZnMvc3F1YXNoZnMvQ29uZmlnLmluDQo+PiBAQCAtNSw2ICs1LDU2IEBAIGNvbmZpZyBCUjJf
VEFSR0VUX1JPT1RGU19TUVVBU0hGUw0KPj4gICANCj4+ICAgaWYgQlIyX1RBUkdFVF9ST09U
RlNfU1FVQVNIRlMNCj4+ICAgDQo+PiArY2hvaWNlDQo+PiArCXByb21wdCAiYmxvY2sgc2l6
ZSINCj4+ICsJZGVmYXVsdCBCUjJfVEFSR0VUX1JPT1RGU19TUVVBU0hGU19CU18xMjhLDQo+
PiArCWhlbHANCj4+ICsJICBEYXRhIGJsb2NrIHNpemUuIEJpZ2dlciB2YWx1ZXMgY2FuIGlt
cHJvdmUNCj4+ICsJICBjb21wcmVzc2lvbiByYXRpby4NCj4+ICsNCj4+ICsJICBJZiB1bnN1
cmUsIGxlYXZlIGF0IDEyOGsgKGRlZmF1bHQpLg0KPj4gKw0KPj4gK2NvbmZpZyBCUjJfVEFS
R0VUX1JPT1RGU19TUVVBU0hGU19CU180Sw0KPj4gKwlib29sICI0ayINCj4+ICsNCj4+ICtj
b25maWcgQlIyX1RBUkdFVF9ST09URlNfU1FVQVNIRlNfQlNfOEsNCj4+ICsJYm9vbCAiOGsi
DQo+PiArDQo+PiArY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX1NRVUFTSEZTX0JTXzE2Sw0K
Pj4gKwlib29sICIxNmsiDQo+PiArDQo+PiArY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX1NR
VUFTSEZTX0JTXzMySw0KPj4gKwlib29sICIzMmsiDQo+PiArDQo+PiArY29uZmlnIEJSMl9U
QVJHRVRfUk9PVEZTX1NRVUFTSEZTX0JTXzY0Sw0KPj4gKwlib29sICI2NGsiDQo+PiArDQo+
PiArY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX1NRVUFTSEZTX0JTXzEyOEsNCj4+ICsJYm9v
bCAiMTI4ayINCj4+ICsNCj4+ICtjb25maWcgQlIyX1RBUkdFVF9ST09URlNfU1FVQVNIRlNf
QlNfMjU2Sw0KPj4gKwlib29sICIyNTZrIg0KPj4gKw0KPj4gK2NvbmZpZyBCUjJfVEFSR0VU
X1JPT1RGU19TUVVBU0hGU19CU181MTJLDQo+PiArCWJvb2wgIjUxMmsiDQo+PiArDQo+PiAr
Y29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX1NRVUFTSEZTX0JTXzEwMjRLDQo+PiArCWJvb2wg
IjEwMjRrIg0KPj4gKw0KPj4gK2VuZGNob2ljZQ0KPj4gKw0KPj4gK2NvbmZpZyBCUjJfVEFS
R0VUX1JPT1RGU19TUVVBU0hGU19CUw0KPj4gKwlzdHJpbmcNCj4+ICsJZGVmYXVsdCAiNEsi
IGlmIEJSMl9UQVJHRVRfUk9PVEZTX1NRVUFTSEZTX0JTXzRLDQo+PiArCWRlZmF1bHQgIjhL
IiBpZiBCUjJfVEFSR0VUX1JPT1RGU19TUVVBU0hGU19CU184NEsNCj4+ICsJZGVmYXVsdCAi
MTZLIiBpZiBCUjJfVEFSR0VUX1JPT1RGU19TUVVBU0hGU19CU18xNksNCj4+ICsJZGVmYXVs
dCAiMzJLIiBpZiBCUjJfVEFSR0VUX1JPT1RGU19TUVVBU0hGU19CU18zMksNCj4+ICsJZGVm
YXVsdCAiNjRLIiBpZiBCUjJfVEFSR0VUX1JPT1RGU19TUVVBU0hGU19CU182NEsNCj4+ICsJ
ZGVmYXVsdCAiMTI4SyIgaWYgQlIyX1RBUkdFVF9ST09URlNfU1FVQVNIRlNfQlNfMTI4Sw0K
Pj4gKwlkZWZhdWx0ICIyNTZLIiBpZiBCUjJfVEFSR0VUX1JPT1RGU19TUVVBU0hGU19CU18y
NTZLDQo+PiArCWRlZmF1bHQgIjUxMksiIGlmIEJSMl9UQVJHRVRfUk9PVEZTX1NRVUFTSEZT
X0JTXzUxMksNCj4+ICsJZGVmYXVsdCAiMTAyNEsiIGlmIEJSMl9UQVJHRVRfUk9PVEZTX1NR
VUFTSEZTX0JTXzEwMjRLDQo+PiArDQo+PiAgIGNvbmZpZyBCUjJfVEFSR0VUX1JPT1RGU19T
UVVBU0hGU19QQUQNCj4+ICAgCWJvb2wgInBhZCB0byBhIDRLIGJvdW5kYXJ5Ig0KPj4gICAJ
ZGVmYXVsdCB5ICMgbGVnYWN5IHdhcyBhbHdheXMgT04NCj4+IGRpZmYgLS1naXQgYS9mcy9z
cXVhc2hmcy9zcXVhc2hmcy5tayBiL2ZzL3NxdWFzaGZzL3NxdWFzaGZzLm1rDQo+PiBpbmRl
eCA3YTVlM2UzMTNlLi4xNzkwNzczZjdlIDEwMDY0NA0KPj4gLS0tIGEvZnMvc3F1YXNoZnMv
c3F1YXNoZnMubWsNCj4+ICsrKyBiL2ZzL3NxdWFzaGZzL3NxdWFzaGZzLm1rDQo+PiBAQCAt
Niw3ICs2LDE5IEBADQo+PiAgIA0KPj4gICBST09URlNfU1FVQVNIRlNfREVQRU5ERU5DSUVT
ID0gaG9zdC1zcXVhc2hmcw0KPj4gICANCj4+IC1ST09URlNfU1FVQVNIRlNfQVJHUyA9IC1u
b2FwcGVuZCAtcHJvY2Vzc29ycyAkKFBBUkFMTEVMX0pPQlMpDQo+PiArUk9PVEZTX1NRVUFT
SEZTX0FSR1MgPSAtbm9hcHBlbmQgLXByb2Nlc3NvcnMgJChQQVJBTExFTF9KT0JTKSAtYiAk
KEJSMl9UQVJHRVRfUk9PVEZTX1NRVUFTSEZTX0JTKQ0KPiBIZXJlIHlvdSBhZGRlZCB0aGUg
dmFsdWUgdG8gdGhlIG9wdGlvbiBsaXN0IHVzaW5nIHRoZSBoaWRkZW4gb3B0aW9uDQo+IHN0
cmluZywgc28uLi4NCj4NCj4+ICtpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX1NRVUFTSEZT
NF9CU182NEspLHkpDQo+PiArUk9PVEZTX1NRVUFTSEZTX0FSR1MgKz0gLWIgNjRLDQo+PiAr
ZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX1NRVUFTSEZTNF9CU18xMjhLKSx5KQ0K
Pj4gK1JPT1RGU19TUVVBU0hGU19BUkdTICs9IC1iIDEyOEsNCj4+ICtlbHNlIGlmZXEgKCQo
QlIyX1RBUkdFVF9ST09URlNfU1FVQVNIRlM0X0JTXzI1NkspLHkpDQo+PiArUk9PVEZTX1NR
VUFTSEZTX0FSR1MgKz0gLWIgMjU2Sw0KPj4gK2Vsc2UgaWZlcSAoJChCUjJfVEFSR0VUX1JP
T1RGU19TUVVBU0hGUzRfQlNfNTEySykseSkNCj4+ICtST09URlNfU1FVQVNIRlNfQVJHUyAr
PSAtYiA1MTJLDQo+PiArZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX1NRVUFTSEZT
NF9CU18xMDI0SykseSkNCj4+ICtST09URlNfU1FVQVNIRlNfQVJHUyArPSAtYiAxMDI0Sw0K
Pj4gK2VuZGlmDQo+IC4uLiB0aGVyZSBpcyBubyBuZWVkIHRvIGFkZCBpdCBhIHNlY29uZCB0
aW1lIGJhc2VkIG9uIHRoZSBib29sZWFucy4NCj4NCj4gRmluYWxseSwgaXQgd291bGQgaGF2
ZSBiZWVuIG5pY2UgdG8gYWRkIHR3byB0ZXN0IGNhc2VzIHRoYXQgYXQgbGVhc3QgdGhlDQo+
IDRLIGFuZCAxMDI0SyBvcHRpb25zIGRvIHdvcmsgKHRoZSBleGlzdGluZyB0ZXN0IHRlc3Rz
IHRoZSBkZWZhdWx0bSBpLmUNCj4gMTI4SykuIFRlc3RzIGFyZSBpbjogIHN1cHBvcnQvdGVz
dGluZy90ZXN0cy9mcy90ZXN0X3NxdWFzaGZzLnB5DQo+DQo+IE5vdGUgdGhhdCBhZGRpbmcg
dGVzdHMgY2FuIGJlIGRvbmUgaW4gYSBmb2xsb3d1cCBwYXRjaCwgb2YgY291cnNlLg0KPg0K
PiBSZWdhcmRzLA0KPiBZYW5uIEUuIE1PUklOLg0KPg0KPj4gICBpZmVxICgkKEJSMl9UQVJH
RVRfUk9PVEZTX1NRVUFTSEZTX1BBRCksKQ0KPj4gICBST09URlNfU1FVQVNIRlNfQVJHUyAr
PSAtbm9wYWQNCj4+IC0tIA0KPj4gMi4zNS4xDQo+Pg0K

--------------0uVafme9xU9BTUWRj3WOYxYU--

--------------QptPZOGalrIxuZpaTvmd1csi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWBBDrQEf5WmoR7mj8vKwZKh6i8QFAmKDq4sACgkQ8vKwZKh6
i8QtRQgAhSZMhpdM1RpCX4KJIDsggJADTxySg78jr6fEruHo2UMvEDm9Gl8biOwQ
WReOAw2VNVSa0/Zl4JiGs7nL76Rz8xqooazV4L1v7Dwu8merzq6q4uti9knrGD9b
/ZKH7sbrELgo6lira90X4d8UVLwbVDC4JGj06jjPHxGq0cqe5nOxYiuQesq/sEZc
5H7exlCZ6A2Dt6oTDEa/Pu1dqabesHLgu3R5KVtU6R83olJTJK2h+MSxnbf86LXU
QSedjFPUEou5YCWSV9rbsk/G4QIekaPbtYWCXNVZaa7wGjPzkt2q5eilH6fH9hnd
gzB1r93QtAXj4NVe85j5Q4sXwxnySg==
=DOba
-----END PGP SIGNATURE-----

--------------QptPZOGalrIxuZpaTvmd1csi--

--===============1227823338511487114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1227823338511487114==--
