Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DBCC433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 12:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A36760FB9;
	Wed,  2 Feb 2022 12:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-W63KSENHxa; Wed,  2 Feb 2022 12:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2942660FB6;
	Wed,  2 Feb 2022 12:49:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 042681BF576
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 12:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3D6560F81
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 12:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5rP5EKgAe2UC for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 12:49:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49E2A60615
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 12:49:31 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id FF4hn49eXI46dFF4hnSccE; Wed, 02 Feb 2022 13:49:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643806168; bh=218tz9C5heJXQUkadDVmJZlT6OiUjANi83fDtxg3P5s=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=fglSwZ2t2+GOreHG7v/p3OsGEYMmB85jwL9pg/MDBZYMox9QmtLpJs8ao7UifWz7U
 41cmMFyCF190uBuoHlP7hto2ljQdwehKnU2PxgUrIy+9+0vhAg/ntcQ5CTMwlzN1Wx
 1jKUfZOBOLS9l2EnUJ/HRI2rp/KZJVn3MuRT+qz5/vI/EE7M9orxwgFQZ5L2TY0tqB
 nHIQI/dzW2Lqeoa5GPCCLUYkTanqkFW7YycT2nHvJWPxL5A/Okpm1ATK7pTHtqnWwD
 s2HPfWToWHAip4whM+wQEQD47zHA/JAZ5x+KNF0rYLYq4nZScDPh3xUMj6hBMnM9XN
 4KKIBEkOyRHxw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 2 Feb 2022 13:49:27 +0100
Message-Id: <9DF432CD-1007-4C7A-87A6-1DAAC90BE738@benettiengineering.com>
References: <20220201171910.32728-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20220201171910.32728-1-giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfICcSfLqRnJuNGKEE+UoFkCN3wtY9VkTNLCce4VQ7YvbYFgfHE7Bopqh7urIOxTHPvp83aP+C6TjinT/moxNFtsekjyi+0432idwjl2EZ71K4v9pdOvE
 Y6UWDxNkpWDRgPSrFcWHB9jT80vouKoR9qnEvjfaikVcBIKG/Ax2a1/dMpLd8E3fThoXTK1dyjU1MZ5CJGQs2qyaf12EnsBi+igwpfy2SJ+CRn8hiXlutlmJ
 3Su6GWcCGASrIOmU05wACtiU6TElk3XlCZ+wTkiOxgfos57UdELkpfq1qvu1VULrKvMmwIoAKKsWtASYvvn7gyeH58CdNz9m+V0/dBFxTAueYhMARyeYtKAJ
 Gk2KkA0GgJjkM+xiwP5EAtMlw0Px6A==
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: disable package if we
 build for Microblaze
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
Cc: Martin Hicks <mort@bork.org>, Norbert Lange <nolange79@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxsLAoKcGxlYXNlIGRyb3AgdGhpcyBwYXRjaCBzaW5jZSB1cHN0cmVhbSBpcyB2ZXJ5IHJl
YWN0aXZlIGFuZCB0aGV54oCZcmUgd29ya2luZyBmb3IgZml4aW5nLgoKSeKAmWxsIHNlbmQgYSBw
YXRjaCBzb29uIGZvciBmaXhpbmcgaW5zdGVhZCB0aGFuIGRpc2FibGluZy4KCkJlc3QgcmVnYXJk
cwpHaXVsaW8gQmVuZXR0aQoKPiBJbCBnaW9ybm8gMSBmZWIgMjAyMiwgYWxsZSBvcmUgMTg6MTks
IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiBo
YSBzY3JpdHRvOgo+IAo+IO+7v2NyeXB0c2V0dXAgaGFzIHRoZSBzYW1lIGJ1aWxkIGZhaWx1cmUg
Zm91bmQgZm9yIGxpYmZ1c2UuIEZvciBsaWJmdXNlIEkndmUKPiBwYXRjaGVkIG1lc29uIHRoYXQg
bm93IGNvcnJlY3RseSBjaGVja3MgaWYgc3ltdmVyIGlzIGF2YWlsYWJsZToKPiBodHRwczovL2dp
dGh1Yi5jb20vbGliZnVzZS9saWJmdXNlL3B1bGwvNjIwL2NvbW1pdHMvM2FiYTA5YTVjNTZlMDE3
NzQ2YzVjMTY1MmRiYzg0NWY0ZGI3Mzc0YQo+IEJ1dCBpbiBjcnlwdHNldHVwIHRoZSBjaGVjayBp
cyBkb25lIGluIGEgaGVhZGVyIGZpbGUgd2hpbGUgYnVpbGRpbmcsIHNvIEkKPiBjYW4ndCB1c2Ug
dGhlIHNhbWUgYXBwcm9hY2ggYW5kIHRoYXQgd291bGQgdGFrZSBub3QgZmV3IHdvcmsgdG8gbW92
ZSB0aGUKPiBjaGVjayB0byBBdXRvdG9vbHMsIHNvIEkndmUgb3BlbmVkIGFuIGlzc3VlIG9uIGNy
eXB0c2V0dXAncyBnaXRsYWI6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2NyeXB0c2V0dXAvY3J5cHRz
ZXR1cC8tL2lzc3Vlcy83MDkKPiBhc2tpbmcgaWYgdGhleSBjYW4gbWFuYWdlIGl0IHRoZSB3YXkg
SSd2ZSBkb25lIGZvciBsaWJmdXNlLgo+IAo+IFNvIGxldCdzIGRpc2FibGUgY3J5cHRzZXR1cCBp
ZiB3ZSdyZSBidWlsZGluZyBvbiBNaWNyb2JsYXplIGZvciB0aGUgbW9tZW50Cj4gYW5kIHdoZW4g
dGhlIGlzc3VlIHdpbGwgYmUgZml4ZWQgdXBzdHJlYW0sIEkgd2lsbCBidW1wIHRoZSB2ZXJzaW9u
IGFuZAo+IHJlLWVuYWJsZSBidWlsZGluZyBmb3IgTWljcm9ibGF6ZS4KPiAKPiBGaXhlczoKPiBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy84NmIvODZiNmIxM2U2YmU4Mzc1
ODc1Y2FlYmNkOTFkZTkxZmVmODNmNzJlOC8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVu
ZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiAtLS0KPiBwYWNr
YWdlL2NyeXB0c2V0dXAvQ29uZmlnLmluICB8IDEgKwo+IHBhY2thZ2UvbGliYmxvY2tkZXYvQ29u
ZmlnLmluIHwgMSArCj4gcGFja2FnZS9sdWtzbWV0YS9Db25maWcuaW4gICAgfCAxICsKPiBwYWNr
YWdlL3N5c3RlbWQvQ29uZmlnLmluICAgICB8IDEgKwo+IHBhY2thZ2UvdWRpc2tzL0NvbmZpZy5p
biAgICAgIHwgMSArCj4gNSBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9jcnlwdHNldHVwL0NvbmZpZy5pbiBiL3BhY2thZ2UvY3J5cHRzZXR1
cC9Db25maWcuaW4KPiBpbmRleCBmMzY4ODNlYTQ3Li4yZjNkZDhkMmIyIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvY3J5cHRzZXR1cC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2NyeXB0c2V0dXAv
Q29uZmlnLmluCj4gQEAgLTEsNiArMSw3IEBACj4gY29uZmlnIEJSMl9QQUNLQUdFX0NSWVBUU0VU
VVAKPiAgICBib29sICJjcnlwdHNldHVwIgo+ICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9I
QVNfVEhSRUFEUyAjIGx2bTIKPiArICAgIGRlcGVuZHMgb24gIUJSMl9taWNyb2JsYXplICMgd3Jv
bmcgc3ltdmVyIGRldGVjdGlvbgo+ICAgIGRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBsdm0yLCBs
aWJhcmdvbjIKPiAgICBkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBsdm0yLCBsaWJhcmdv
bjIKPiAgICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1NZTkNfNCAjIGpzb24tYwo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2xpYmJsb2NrZGV2L0NvbmZpZy5pbiBiL3BhY2thZ2UvbGliYmxv
Y2tkZXYvQ29uZmlnLmluCj4gaW5kZXggNDM4OWZkNzk0Yy4uMzhmZTIzMzFjZiAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2xpYmJsb2NrZGV2L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbGliYmxv
Y2tkZXYvQ29uZmlnLmluCj4gQEAgLTIzLDYgKzIzLDcgQEAgY29tbWVudCAicGx1Z2lucyIKPiBj
b25maWcgQlIyX1BBQ0tBR0VfTElCQkxPQ0tERVZfQ1JZUFRPCj4gICAgYm9vbCAiY3J5cHRvIgo+
ICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ180ICMgY3J5cHRzZXR1cCAtPiBq
c29uLWMKPiArICAgIGRlcGVuZHMgb24gIUJSMl9taWNyb2JsYXplICMgY3J5cHRzZXR1cAo+ICAg
IHNlbGVjdCBCUjJfUEFDS0FHRV9DUllQVFNFVFVQCj4gCj4gY29uZmlnIEJSMl9QQUNLQUdFX0xJ
QkJMT0NLREVWX0ZTCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVrc21ldGEvQ29uZmlnLmluIGIv
cGFja2FnZS9sdWtzbWV0YS9Db25maWcuaW4KPiBpbmRleCBkZGM5YjZmM2JmLi44OGExMGJjOWRh
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbHVrc21ldGEvQ29uZmlnLmluCj4gKysrIGIvcGFja2Fn
ZS9sdWtzbWV0YS9Db25maWcuaW4KPiBAQCAtMSw2ICsxLDcgQEAKPiBjb25maWcgQlIyX1BBQ0tB
R0VfTFVLU01FVEEKPiAgICBib29sICJsdWtzbWV0YSIKPiAgICBkZXBlbmRzIG9uIEJSMl9UT09M
Q0hBSU5fSEFTX1RIUkVBRFMgIyBjcnlwdHNldHVwIC0+IGx2bTIKPiArICAgIGRlcGVuZHMgb24g
IUJSMl9taWNyb2JsYXplICMgY3J5cHRzZXR1cAo+ICAgIGRlcGVuZHMgb24gQlIyX1VTRV9NTVUg
IyBjcnlwdHNldHVwIC0+IGx2bTIKPiAgICBkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBj
cnlwdHNldHVwIC0+IGx2bTIKPiAgICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1NZTkNf
NCAjIGNyeXB0c2V0dXAgLT4ganNvbi1jCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVtZC9D
b25maWcuaW4gYi9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluCj4gaW5kZXggY2MwNzM2NTYxZS4u
ZDFlNjkyZjgyNiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluCj4gKysr
IGIvcGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbgo+IEBAIC0yMjgsNiArMjI4LDcgQEAgY29uZmln
IEJSMl9QQUNLQUdFX1NZU1RFTURfSElCRVJOQVRFCj4gY29uZmlnIEJSMl9QQUNLQUdFX1NZU1RF
TURfSE9NRUQKPiAgICBib29sICJlbmFibGUgaG9tZSBkYWVtb24iCj4gICAgZGVwZW5kcyBvbiBC
UjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgY3J5cHRzZXR1cCAtPiBsdm0yCj4gKyAgICBkZXBl
bmRzIG9uICFCUjJfbWljcm9ibGF6ZSAjIGNyeXB0c2V0dXAKPiAgICBkZXBlbmRzIG9uIEJSMl9V
U0VfTU1VICMgY3J5cHRzZXR1cCAtPiBsdm0yCj4gICAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19M
SUJTICMgY3J5cHRzZXR1cCAtPiBsdm0yCj4gICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hB
U19TWU5DXzQgIyBjcnlwdHNldHVwIC0+IGpzb24tYwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Vk
aXNrcy9Db25maWcuaW4gYi9wYWNrYWdlL3VkaXNrcy9Db25maWcuaW4KPiBpbmRleCA4MmYxMWFl
N2RlLi44YTQ4ZDg1OTI0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvdWRpc2tzL0NvbmZpZy5pbgo+
ICsrKyBiL3BhY2thZ2UvdWRpc2tzL0NvbmZpZy5pbgo+IEBAIC02LDYgKzYsNyBAQCBjb25maWcg
QlIyX1BBQ0tBR0VfVURJU0tTCj4gICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJF
QURTICMgcG9sa2l0Cj4gICAgZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSICMgZGJ1cy1nbGliIC0+
IGdsaWIyCj4gICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19TWU5DXzQgIyBsaWJibG9j
a2RldiAtPiBjcnlwdHNldHVwIC0+IGpzb24tYwo+ICsgICAgZGVwZW5kcyBvbiAhQlIyX21pY3Jv
YmxhemUgIyBjcnlwdHNldHVwCj4gICAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTICMgcG9s
a2l0IC0+IGR1a3RhcGUKPiAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfREJVUwo+ICAgIHNlbGVjdCBC
UjJfUEFDS0FHRV9EQlVTX0dMSUIKPiAtLSAKPiAyLjI1LjEKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
