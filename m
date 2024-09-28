Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1238CF6495
	for <buildroot@archiver.kernel.org>; Sat, 28 Sep 2024 09:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75E65404DB;
	Sat, 28 Sep 2024 09:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKMg35JqoAgt; Sat, 28 Sep 2024 09:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20020404AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20020404AA;
	Sat, 28 Sep 2024 09:25:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6CA1BF339
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 09:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CD078133B
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 09:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMHb1e9Pnyat for <buildroot@lists.busybox.net>;
 Sat, 28 Sep 2024 09:25:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.4;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FCA8812ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FCA8812ED
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FCA8812ED
 for <buildroot@buildroot.org>; Sat, 28 Sep 2024 09:25:54 +0000 (UTC)
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-104 (Coremail) ; Sat, 28 Sep 2024 17:10:32 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sat, 28 Sep 2024 17:10:32 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
References: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
X-NTES-SC: AL_Qu2ZBfmau04o5CaaZulS7TNtxZZrMarI/pV3r/MUdfMtqDDI0D8qV0BeB3vV+cAc50IToc9uGtkp9Iuevhm4
MIME-Version: 1.0
Message-ID: <1980998d.2daf.19237e561b7.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aCgvCgD33wIIyPdmKJcDAA--.34218W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwBoXmb3wnIBtwAEsW
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=kII4oRxQi660J2EnEDV7fqIdgDunJuf7piPN4pp0YhM=; b=X
 ezJOzhnqkr8rWRi/vf5z17goEnN435gNIg5hPcA9uADCeyLeGrtjmAi9gh7gWMwn
 Ly8uizWkCrB9jie5Kcq4eDjatB66xeCXNmXXKeL8UHG1KbWk2UVLQl0vmic1j6V9
 M7Zh/WV0E2ngG2XpwKllpOVl+Y5tir+VDUg32OugxI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=XezJOzhn
Subject: Re: [Buildroot] [PATCH v2 1/1] package: Add iotools package
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
Cc: Andy Yan <andyshrk@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkhpIFNoZXZjaGVua2/vvIwKVGhhbmtzIGZvciB5b3VyIHBhdGNo77yMSSBoYXZlIGEgcXVpY2sg
dGVzdCB3aXRoIHRoaXMgdG9vbCwgaXQgY2FuIHdvcmsgb24gYXJtNjQgcGxhdGZvcm0uCkJ1dCBp
IGZvdW5kIGl0IGFsc28gIGxhY2tzIHNvbWUgZmVhdHVyZXMgdGhhdCBJTyBkb2Vzbid0IGhhdmUs
IHN1Y2ggYXMgaW8gY21kIHN1cHBvcnQgYSBsZW5ndGgKYXJndW1lbnRzLCB0aGF0IG1ha2UgaXQg
Y2FuIHJlYWQgSXQgY2FuIHJlYWQgYSBiYXRjaCBvZiByZWdpc3RlcnMgYXQgb25jZS4KV291bGQg
eW91IGNvbnNpZGVyIGFkZGluZyB0aGVzZSBmZWF0dXJlcyBpbiB0aGUgZnV0dXJlPwoKQXQgMjAy
NC0wOS0yOCAwMjozNDo1OSwgIkFuZHkgU2hldmNoZW5rbyIgPGFuZHJpeS5zaGV2Y2hlbmtvQGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6Cj5UaGUgaW90b29scyBwYWNrYWdlIHByb3ZpZGVzIGEgc2V0
IG9mIHNpbXBsZSBjb21tYW5kIGxpbmUgdG9vbHMgd2hpY2gKPmFsbG93IGFjY2VzcyB0byBoYXJk
d2FyZSBkZXZpY2UgcmVnaXN0ZXJzLiBTdXBwb3J0ZWQgcmVnaXN0ZXIgaW50ZXJmYWNlcwo+aW5j
bHVkZSBQQ0ksIElPLCBtZW1vcnkgbWFwcGVkIElPLCBTTUJ1cywgQ1BVSUQsIGFuZCBNU1IuIEFs
c28gaW5jbHVkZWQKPmFyZSBzb21lIHV0aWxpdGllcyB3aGljaCBhbGxvdyBmb3Igc2ltcGxlIGFy
aXRobWV0aWMsIGxvZ2ljYWwsIGFuZCBvdGhlcgo+b3BlcmF0aW9ucy4KPgo+SWYgeW91IGV2ZXIg
aGF2ZSB0byBkZWJ1ZyBoYXJkd2FyZSwgeW91IGNvdWxkIHByb2JhYmx5IHVzZSB0aGVzZSB0b29s
cy4KPgo+U2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0Bs
aW51eC5pbnRlbC5jb20+Cj4tLS0KPgo+djI6IHJlbW92ZWQgZXhwbGljaXQgc3RyaXAgKEJhcnVj
aCksIGFkZGVkIHRvIERFVkVMT1BFUlMKPgo+IERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAg
fCAgMSArCj4gcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICB8ICAxICsKPiBwYWNrYWdlL2lv
dG9vbHMvQ29uZmlnLmluICAgIHwgMTQgKysrKysrKysrKysrKysKPiBwYWNrYWdlL2lvdG9vbHMv
aW90b29scy5oYXNoIHwgIDMgKysrCj4gcGFja2FnZS9pb3Rvb2xzL2lvdG9vbHMubWsgICB8IDIw
ICsrKysrKysrKysrKysrKysrKysrCj4gNSBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCsp
Cj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaW90b29scy9Db25maWcuaW4KPiBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9pb3Rvb2xzL2lvdG9vbHMuaGFzaAo+IGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL2lvdG9vbHMvaW90b29scy5tawo+Cj5kaWZmIC0tZ2l0IGEvREVWRUxPUEVS
UyBiL0RFVkVMT1BFUlMKPmluZGV4IGMzYjFkNjZiMDE2Yi4uMTU4MzEzYmU5MzM1IDEwMDY0NAo+
LS0tIGEvREVWRUxPUEVSUwo+KysrIGIvREVWRUxPUEVSUwo+QEAgLTIzMCw2ICsyMzAsNyBAQCBG
OglwYWNrYWdlL3N5c2RpZy8KPiAKPiBOOglBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5r
b0BnbWFpbC5jb20+Cj4gRjoJcGFja2FnZS9mYi10ZXN0LWFwcC8KPitGOglwYWNrYWdlL2lvdG9v
bHMvCj4gCj4gTjoJQW5pc3NlIEFzdGllciA8YW5pc3NlQGFzdGllci5ldT4KPiBGOglwYWNrYWdl
L2dvLwo+ZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4K
PmluZGV4IGJmYmVjMWMyMWQwNC4uMDg5NzdhM2E5MmRiIDEwMDY0NAo+LS0tIGEvcGFja2FnZS9D
b25maWcuaW4KPisrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj5AQCAtNTMzLDYgKzUzMyw3IEBAIGVu
ZG1lbnUKPiAJc291cmNlICJwYWNrYWdlL2k3ei9Db25maWcuaW4iCj4gCXNvdXJjZSAicGFja2Fn
ZS9pbnB1dC1ldmVudC1kYWVtb24vQ29uZmlnLmluIgo+IAlzb3VyY2UgInBhY2thZ2UvaW50ZWwt
bWljcm9jb2RlL0NvbmZpZy5pbiIKPisJc291cmNlICJwYWNrYWdlL2lvdG9vbHMvQ29uZmlnLmlu
Igo+IAlzb3VyY2UgInBhY2thZ2UvaXBtaXRvb2wvQ29uZmlnLmluIgo+IAlzb3VyY2UgInBhY2th
Z2UvaXBtaXV0aWwvQ29uZmlnLmluIgo+IAlzb3VyY2UgInBhY2thZ2UvaXJkYS11dGlscy9Db25m
aWcuaW4iCj5kaWZmIC0tZ2l0IGEvcGFja2FnZS9pb3Rvb2xzL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
aW90b29scy9Db25maWcuaW4KPm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj5pbmRleCAwMDAwMDAwMDAw
MDAuLmZmYTFhMzY2NjczOAo+LS0tIC9kZXYvbnVsbAo+KysrIGIvcGFja2FnZS9pb3Rvb2xzL0Nv
bmZpZy5pbgo+QEAgLTAsMCArMSwxNCBAQAo+K2NvbmZpZyBCUjJfUEFDS0FHRV9JT1RPT0xTCj4r
CWJvb2wgImlvdG9vbHMiCj4rCWhlbHAKPisJICBUb29scyBmb3IgcG9raW5nIGFsbCB0eXBlcyBv
ZiBJTywgc3VwcG9ydGVkIGFyZToKPisJICAtIENNT1MgTlZSQU0gKHZpYSAvZGV2L252cmFtKQo+
KwkgIC0gQ1BVIElEICh4ODYpCj4rCSAgLSBJTyBwb3J0ICh4ODYsIFBvd2VyUEMpCj4rCSAgLSBN
TUlPCj4rCSAgLSBNU1IgKHg4NikKPisJICAtIFBDSSBjb25maWd1cmF0aW9uIHNwYWNlCj4rCSAg
LSBTQ09NIChQb3dlclBDKQo+KwkgIC0gU01CdXMKPisKPisJICBodHRwczovL2dpdGh1Yi5jb20v
YW5keS1zaGV2L2lvdG9vbHMKPmRpZmYgLS1naXQgYS9wYWNrYWdlL2lvdG9vbHMvaW90b29scy5o
YXNoIGIvcGFja2FnZS9pb3Rvb2xzL2lvdG9vbHMuaGFzaAo+bmV3IGZpbGUgbW9kZSAxMDA2NDQK
PmluZGV4IDAwMDAwMDAwMDAwMC4uMTFkN2ZmYjczZTM5Cj4tLS0gL2Rldi9udWxsCj4rKysgYi9w
YWNrYWdlL2lvdG9vbHMvaW90b29scy5oYXNoCj5AQCAtMCwwICsxLDMgQEAKPisjIExvY2FsbHkg
Y29tcHV0ZWQKPitzaGEyNTYgIDEzYjhiODdjN2QxZjIyYjhkOGY1MGM0OTlhZjA5Zjk0MTRhMDg3
OWQ2OWMyMjM5M2YxMDUxZWQ0YmYyOGYzNzggIGlvdG9vbHMtdjEuNy50YXIuZ3oKPitzaGEyNTYg
IGFiMTVmZDUyNmJkOGRkMThhOWU3N2ViYzEzOTY1NmJmNGQzM2U5N2ZjNzIzOGNkMTFiZjYwZTJi
OWI4NjY2YzYgIENPUFlJTkcKPmRpZmYgLS1naXQgYS9wYWNrYWdlL2lvdG9vbHMvaW90b29scy5t
ayBiL3BhY2thZ2UvaW90b29scy9pb3Rvb2xzLm1rCj5uZXcgZmlsZSBtb2RlIDEwMDY0NAo+aW5k
ZXggMDAwMDAwMDAwMDAwLi4wM2I4N2M4OWU5ZDAKPi0tLSAvZGV2L251bGwKPisrKyBiL3BhY2th
Z2UvaW90b29scy9pb3Rvb2xzLm1rCj5AQCAtMCwwICsxLDIwIEBACj4rIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPisjCj4rIyBpb3Rvb2xzCj4rIwo+KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4r
Cj4rSU9UT09MU19WRVJTSU9OID0gdjEuNwo+K0lPVE9PTFNfU0lURSA9ICQoY2FsbCBnaXRodWIs
YW5keS1zaGV2LGlvdG9vbHMsJChJT1RPT0xTX1ZFUlNJT04pKQo+K0lPVE9PTFNfTElDRU5TRSA9
IEdQTC0yLjArCj4rSU9UT09MU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+Kwo+K2RlZmluZSBJ
T1RPT0xTX0JVSUxEX0NNRFMKPisJJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgLUMgJChARCkg
Q1JPU1NfQ09NUElMRT0kKFRBUkdFVF9DUk9TUykgYWxsCj4rZW5kZWYKPisKPitkZWZpbmUgSU9U
T09MU19JTlNUQUxMX1RBUkdFVF9DTURTCj4rCSQoSU5TVEFMTCkgLW0gMDc1NSAtdCAkKFRBUkdF
VF9ESVIpL3Vzci9iaW4gLUQgJChARCkvaW90b29scwo+K2VuZGVmCj4rCj4rJChldmFsICQoZ2Vu
ZXJpYy1wYWNrYWdlKSkKPi0tIAo+Mi40My4wLnJjMS4xMzM2LmczNmI1MjU1YTAzYWMKPgo+X19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj5odHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
