Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03866C47258
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 18:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9105042C87;
	Thu, 11 Jan 2024 18:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9105042C87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FX3F_zvc_JUg; Thu, 11 Jan 2024 18:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA86B42CDF;
	Thu, 11 Jan 2024 18:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA86B42CDF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5AB91BF255
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC8D742CDF
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC8D742CDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RMr_hc5jSZ8V for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 18:43:52 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAD2942C87
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 18:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAD2942C87
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E6AA6B0051B;
 Thu, 11 Jan 2024 19:43:48 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 19:43:48 +0100
Date: Thu, 11 Jan 2024 19:43:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZaA25BaogT4VFbwI@landeda>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
 <20240102235957.3072102-8-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102235957.3072102-8-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704998631;
 bh=3WyMkda8WBKDRapRybolyYLvtmkJddBx0me8fXMb2W8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OHRtMlxAY/vtsPTwY9hlqFY6ekQWr2nWTWxKBhp/ng4Y1+IkAB+Jaax3b5uI+ng+8
 XuvzYbS/BpB/EgKwysuBnaloxqTjCo/dTOVXnYJ+Dq9ogjGk6Bm19z3nP0Z3/CcMp+
 YlDnXQnDM7KpNqO3KtmY7sa+41dk7oO67d75hKV3itirtfoKrd8XaSkFg+Dtl/PPvW
 PTV4JEpuiZdNQG9BTlTQSUCDBQOy+PyoT93+Ym6AcaWh7ACWvqyMt/GO67GuSK8RIm
 L8cqWKobUXUVevESqzGuuyNYIWDoJzDMKnNJL//wlqDZcYEAuKf6GNuO3NLqnni+Zf
 uylJFuTELl9Dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OHRtMlxA
Subject: Re: [Buildroot] [PATCH v3 07/11] package/flutter-engine: Add
 profile runtime mode selection
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRhbSwgQWxsLAoKT24gMjAyNC0wMS0wMiAxNjo1OSAtMDcwMCwgQWRhbSBEdXNrZXR0IHNwYWtl
IHRodXNseToKPiBCdWlsZHJvb3Qgb25seSBvZmZlcnMgdHdvIHBvc3NpYmxlIHJ1bnRpbWUgbW9k
ZXMgZm9yIEZsdXR0ZXIgdGhhdCBhcmUKPiBhdXRvbWF0aWNhbGx5IHNlbGVjdGVkIGJhc2VkIG9u
IHdoYXQgdGhlIHVzZXIgaGFzIHNlbGVjdGVkOgo+ICAgLSBkZWJ1ZyBpZiBCUjJfRU5BQkxFX1JV
TlRJTUVfREVCVUcgaXMgZW5hYmxlZC4KPiAgIC0gcmVsZWFzZSBpZiBCUjJfRU5BQkxFX1JVTlRJ
TUVfREVCVUcgaXMgbm90IGVuYWJsZWQuCj4gCj4gSG93ZXZlciwgRmx1dHRlciBhbHNvIG9mZmVy
cyB0aGUgcHJvZmlsZSBydW50aW1lIG1vZGUgb3B0aW9uLgo+IAo+IEZyb20gaHR0cHM6Ly9kb2Nz
LmZsdXR0ZXIuZGV2L3Rlc3RpbmcvYnVpbGQtbW9kZXM6Cj4gCj4gYGBgCj4gIlVzZSBwcm9maWxl
IG1vZGUgd2hlbiB5b3Ugd2FudCB0byBhbmFseXplIHBlcmZvcm1hbmNlLiIKPiAKPiBXaGF0IGlz
IHByb2ZpbGUgbW9kZT8KPiBTb21lIGRlYnVnZ2luZyBhYmlsaXR5IGlzIG1haW50YWluZWQgaW4g
cHJvZmlsZSBtb2RlLCB3aGljaCBpcyBlbm91Z2ggdG8KPiBwcm9maWxlIHlvdXIgYXBwJ3MgcGVy
Zm9ybWFuY2UuIFByb2ZpbGUgbW9kZSBpcyB0dXJuZWQgb2ZmIG9uIHRoZSBlbXVsYXRvcgo+IGFu
ZCBzaW11bGF0b3IgYmVjYXVzZSB0aGVpciBiZWhhdmlvciBkb2VzIG5vdCByZXByZXNlbnQgYWN0
dWFsIHBlcmZvcm1hbmNlLgo+IGBgYAo+IAo+IEFzIEZsdXR0ZXIgcHJvamVjdHMgY2FuIGJlIGhl
YXZ5IGFuZCBjb25zdW1lIG1hbnkgcmVzb3VyY2VzLCBpdCBpcyBuZWNlc3NhcnkKPiB0byBhbGxv
dyB1c2VycyBkZXZlbG9waW5nIGEgRmx1dHRlciBhcHBsaWNhdGlvbiB0byBwcm9maWxlIHRoZWly
IGFwcGxpY2F0aW9uCj4gZHVyaW5nIGRldmVsb3BtZW50Lgo+IAo+IFRoaXMgcGF0Y2ggaW50cm9k
dWNlcyBhIG5ldyBjaG9pY2U6IEZMVVRURVJfRU5HSU5FX1JVTlRJTUVfTU9ERV9QUk9GSUxFLgo+
IElmIHVuc2VsZWN0ZWQsIHRoZSBnbG9iYWwgb3B0aW9uIEJSMl9FTkFCTEVfUlVOVElNRV9ERUJV
RyBjb250aW51ZXMgdG8KPiBkZXRlcm1pbmUgd2hldGhlciB0byBidWlsZCBGbHV0dGVyIGluIHJl
bGVhc2Ugb3IgZGVidWcgbW9kZS4gVGhpcyBuZXcgb3B0aW9uCj4gbWF5IGNvbmZ1c2Ugc29tZSB1
c2VycyB3aG8gd29uZGVyIHdoZXJlIHRoZSByZWxlYXNlIGFuZCBkZWJ1ZyBvcHRpb25zIGFyZSwg
c28KPiB0aGUgaGVscCBtZW51IHNlY3Rpb24gdW5kZXIgdGhlIEZMVVRURVJfRU5HSU5FX1JVTlRJ
TUVfTU9ERV9QUk9GSUxFIG9wdGlvbgo+IGV4cGxhaW5zIHRoYXQgdGhlIGdsb2JhbCBCUjJfRU5B
QkxFX1JVTlRJTUVfREVCVUcgb3B0aW9uIGNvbnRyb2xzIHRoZSBkZWJ1Zwo+IGFuZCByZWxlYXNl
IG1vZGVzLgoKVGhhbmtzLCB0aGlzIGlzIGEgcHJldHR5IGdvb2QgY29tbWl0IGxvZyEgSXQgaGFz
IGFsbCB0aGUgbmVkZGVkCmluZm9ybWF0aW9uOiB0aGUgY3VycmVudCBzdGF0ZSwgdGhlIGlzc3Vl
IHRoYXQgY2F1c2VzLCBob3cgeW91IGZpeGVkIGl0LAphbmQgc29tZSBpbXBvcnRhbnQgbm90ZSBh
Ym91dCBsaWZ0aW5nIGFuIGFtYmlndWl0eSBmb3IgdGhlIHVzZXIuIFRoYW5rcyEKCj4gU2lnbmVk
LW9mZi1ieTogQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5jb20+
CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4g
LS0tCj4gIHBhY2thZ2UvZmx1dHRlci1lbmdpbmUvQ29uZmlnLmluICAgICAgICAgfCAyNSArKysr
KysrKysrKysrKysrKysrKysrKysKPiAgcGFja2FnZS9mbHV0dGVyLWVuZ2luZS9mbHV0dGVyLWVu
Z2luZS5tayB8ICA0ICsrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmx1dHRlci1lbmdpbmUvQ29u
ZmlnLmluIGIvcGFja2FnZS9mbHV0dGVyLWVuZ2luZS9Db25maWcuaW4KPiBpbmRleCAyZWM1Yjkw
ZmZkLi4zYzkyZTQwZjc0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZmx1dHRlci1lbmdpbmUvQ29u
ZmlnLmluCj4gKysrIGIvcGFja2FnZS9mbHV0dGVyLWVuZ2luZS9Db25maWcuaW4KPiBAQCAtMzks
NiArMzksMzEgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0ZMVVRURVJfRU5HSU5FCj4gIAo+ICAJICBo
dHRwczovL2dpdGh1Yi5jb20vZmx1dHRlci9lbmdpbmUKPiAgCj4gK2lmIEJSMl9QQUNLQUdFX0ZM
VVRURVJfRU5HSU5FCj4gKwo+ICtjb25maWcgRkxVVFRFUl9FTkdJTkVfUlVOVElNRV9NT0RFX1BS
T0ZJTEUKPiArCWJvb2wgImVuYWJsZSBwcm9maWxpbmciCj4gKwloZWxwCj4gKwkgIFNvbWUgZGVi
dWdnaW5nIGFiaWxpdHkgaXMgbWFpbnRhaW5lZOKAlGVub3VnaCB0byBwcm9maWxlIHlvdXIKPiAr
CSAgYXBwcyBwZXJmb3JtYW5jZS4gUHJvZmlsZSBtb2RlIGlzIGRpc2FibGVkIG9uIHRoZSBlbXVs
YXRvcgo+ICsJICBhbmQgc2ltdWxhdG9yLCBiZWNhdXNlIHRoZWlyIGJlaGF2aW9yIGlzIG5vdCBy
ZXByZXNlbnRhdGl2ZQo+ICsJICBvZiByZWFsIHBlcmZvcm1hbmNlLiBQcm9maWxlIG1vZGUgaXMg
c2ltaWxhciB0byByZWxlYXNlIG1vZGUsCj4gKwkgIHdpdGggdGhlIGZvbGxvd2luZyBkaWZmZXJl
bmNlczoKPiArCj4gKwkgIC0gU29tZSBzZXJ2aWNlIGV4dGVuc2lvbnMsIHN1Y2ggYXMgdGhlIG9u
ZSB0aGF0IGVuYWJsZXMgdGhlCj4gKwkgICAgcGVyZm9ybWFuY2Ugb3ZlcmxheSwgYXJlIGVuYWJs
ZWQuCj4gKwo+ICsJICAtIFRyYWNpbmcgaXMgZW5hYmxlZCwgYW5kIHRvb2xzIHN1cHBvcnRpbmcg
c291cmNlLWxldmVsCj4gKwkgICAgZGVidWdnaW5nIChzdWNoIGFzIERldlRvb2xzKSBjYW4gY29u
bmVjdCB0byB0aGUgcHJvY2Vzcy4KPiArCj4gKwkgIElmIHRoaXMgb3B0aW9uIGlzIGxlZnQgdW5z
ZWxlY3RlZCwgdGhlIGdsb2JhbCBvcHRpb24KPiArCSAgQlIyX0VOQUJMRV9SVU5USU1FX0RFQlVH
IGRldGVybWluZXMgd2hldGhlciB0byBidWlsZCBGbHV0dGVyCj4gKwkgIGluIHJlbGVhc2Ugb3Ig
ZGVidWcgbW9kZS4KPiArCj4gKwkgIGh0dHBzOi8vZG9jcy5mbHV0dGVyLmRldi90ZXN0aW5nL2J1
aWxkLW1vZGVzI3Byb2ZpbGUKPiArCj4gK2VuZGlmCj4gKwo+ICBjb21tZW50ICJmbHV0dGVyLWVu
Z2luZSBuZWVkcyBhbiBPcGVuR0wgb3IgT3BlbkdMRVMgYmFja2VuZCIKPiAgCWRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfRkxVVFRFUl9FTkdJTkVfQVJDSF9TVVBQT1JUUwo+ICAJZGVwZW5kcyBvbiAh
QlIyX1BBQ0tBR0VfSEFTX0xJQkdMICYmICFCUjJfUEFDS0FHRV9IQVNfTElCR0xFUwo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL2ZsdXR0ZXItZW5naW5lLm1rIGIvcGFja2Fn
ZS9mbHV0dGVyLWVuZ2luZS9mbHV0dGVyLWVuZ2luZS5tawo+IGluZGV4IGMzYWMxNDRmMmEuLmU5
NzI2MTIwOTcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9mbHV0dGVyLWVuZ2luZS9mbHV0dGVyLWVu
Z2luZS5tawo+ICsrKyBiL3BhY2thZ2UvZmx1dHRlci1lbmdpbmUvZmx1dHRlci1lbmdpbmUubWsK
PiBAQCAtNTIsNyArNTIsOSBAQCBGTFVUVEVSX0VOR0lORV9UQVJHRVRfQVJDSCA9IHg2NAo+ICBG
TFVUVEVSX0VOR0lORV9UQVJHRVRfVFJJUFBMRSA9IHg4Nl82NC11bmtub3duLWxpbnV4LWdudQo+
ICBlbmRpZgo+ICAKPiAtaWZlcSAoJChCUjJfRU5BQkxFX1JVTlRJTUVfREVCVUcpLHkpCj4gK2lm
ZXEgKCQoRkxVVFRFUl9FTkdJTkVfUlVOVElNRV9NT0RFX1BST0ZJTEUpLHkpCj4gK0ZMVVRURVJf
RU5HSU5FX1JVTlRJTUVfTU9ERT1wcm9maWxlCj4gK2Vsc2UgaWZlcSAoJChCUjJfRU5BQkxFX1JV
TlRJTUVfREVCVUcpLHkpCj4gIEZMVVRURVJfRU5HSU5FX1JVTlRJTUVfTU9ERT1kZWJ1Zwo+ICBl
bHNlCj4gIEZMVVRURVJfRU5HSU5FX1JVTlRJTUVfTU9ERT1yZWxlYXNlCj4gLS0gCj4gMi40My4w
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBB
R0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
