Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3417C54E71
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 16:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A8FD60705;
	Fri, 22 Mar 2024 16:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-f_wsdq5mrT; Fri, 22 Mar 2024 16:46:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FD1960FE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FD1960FE2;
	Fri, 22 Mar 2024 16:46:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E43F61BF287
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 16:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0E0B4185F
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 16:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XUK13XJncrm2 for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 16:46:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55;
 helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1CF104186B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CF104186B
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CF104186B
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 16:46:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 56555CE17E3;
 Fri, 22 Mar 2024 16:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DAFC43394;
 Fri, 22 Mar 2024 16:46:08 +0000 (UTC)
Mime-Version: 1.0
Date: Fri, 22 Mar 2024 18:46:06 +0200
Message-Id: <D00FJ589HXI0.DRMQSWUMUDRW@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0
References: <20240321182126.24115-1-jarkko@kernel.org>
 <20240321182126.24115-3-jarkko@kernel.org>
 <be88778f-53fc-493b-829a-2434ea0782ef@linux.ibm.com>
 <a043db624b2d3c57bf6f43c949b63e1b0d1dfbe9.camel@kernel.org>
 <72edf77b90bc03df925a5b3116c981e90a868e7e.camel@kernel.org>
 <D005ME2OYT34.NPTNEUOG5JFC@kernel.org>
 <72dda3ce-5cf6-4830-9f18-30a64a01af15@linux.ibm.com>
 <D00DINCDWI2B.1N6Q54IC0C3WQ@kernel.org>
 <267dc37d-86aa-407f-96e0-5be4d2464b13@linux.ibm.com>
In-Reply-To: <267dc37d-86aa-407f-96e0-5be4d2464b13@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1711125970;
 bh=fMa9rnF0R+/+ZgPpYyjfTzzE2Jle2s9pKyquNJgq31w=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=U9g2WP0IJKbBrRrNc1aaejMN0q93jZflJ/vwPIQFTt1n5la+DKXhxVceM9h1F0aAw
 t0lezMX7BpBjF4anL+4vcA4Y/5SsT4G2ZIT4xwXo8kAW5F0Tt34F9rqWZuzBJ3g2ng
 E5sWwZGNgYQDGwpKER93cwG35r/Freaa+gUxMZcBupwkN74x+ZBoUqW9OuvPT+xbL2
 53S9wEpurL7S65rVQ5BbWqpAnXYtkzsmLfQtJJuGBmaf4P6xgLDRbaMEmLncY6t68u
 0R0tP1+kwEuZOiLKIPj/kmgLnZ5feqP8UoO+jc/I/dHJxxuV4YFvs09c38vGVYEZAY
 znPTXD+gbGZSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=U9g2WP0I
Subject: Re: [Buildroot] [PATCH RFC 2/2] package/swtpm: add host package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpIE1hciAyMiwgMjAyNCBhdCA1OjQ4IFBNIEVFVCwgU3RlZmFuIEJlcmdlciB3cm90ZToK
Pgo+Cj4gT24gMy8yMi8yNCAxMToxMSwgSmFya2tvIFNha2tpbmVuIHdyb3RlOgo+ID4gT24gRnJp
IE1hciAyMiwgMjAyNCBhdCA0OjA0IFBNIEVFVCwgU3RlZmFuIEJlcmdlciB3cm90ZToKPiA+Pgo+
ID4+Cj4gPj4gT24gMy8yMi8yNCAwNTowMCwgSmFya2tvIFNha2tpbmVuIHdyb3RlOgo+ID4+PiBP
biBGcmkgTWFyIDIyLCAyMDI0IGF0IDEwOjM1IEFNIEVFVCwgSmFya2tvIFNha2tpbmVuIHdyb3Rl
Ogo+ID4+Pj4gT24gRnJpLCAyMDI0LTAzLTIyIGF0IDEwOjIyICswMjAwLCBKYXJra28gU2Fra2lu
ZW4gd3JvdGU6Cj4gPj4+Pj4gT24gVGh1LCAyMDI0LTAzLTIxIGF0IDE2OjMwIC0wNDAwLCBTdGVm
YW4gQmVyZ2VyIHdyb3RlOgo+ID4+Pj4+Pgo+ID4+Pj4+Pgo+ID4+Pj4+PiBPbiAzLzIxLzI0IDE0
OjIxLCBKYXJra28gU2Fra2luZW4gd3JvdGU6Cj4gPj4+Pj4+PiBBZGQgc3d0cG0gYW5kIGl0cyBk
ZXBlbmRlbmN5IGxpYnRwbXMgdG8gaG9zdCBwYWNrYWdlcy4gVGhlc2UgYXJlCj4gPj4+Pj4+PiB1
c2VmdWwKPiA+Pj4+Pj4+IGZvciBlbXVsYXRpbmcgVFBNIGluIFFFTVUgZW52aXJvbm1lbnQuCj4g
Pj4+Pj4+Pgo+ID4+Pj4+Pj4gTGluazogaHR0cHM6Ly9naXRsYWIuY29tL2phcmtrb2pzL2xpbnV4
LXRwbWRkLXRlc3QKPiA+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEphcmtrbyBTYWtraW5lbiA8amFy
a2tvQGtlcm5lbC5vcmc+Cj4gPj4+Pj4+PiAtLS0KPiA+Pj4+Pj4KPiA+Pj4+Pj4+ICstLS0KPiA+
Pj4+Pj4+ICsgY29uZmlndXJlLmFjIHwgMTYgKysrKysrKystLS0tLS0tLQo+ID4+Pj4+Pj4gKyAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4+Pj4+Pj4g
Kwo+ID4+Pj4+Pj4gK2RpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKPiA+
Pj4+Pj4+ICtpbmRleCA0OWNhZjk2Li40YWNjNzYzIDEwMDY0NAo+ID4+Pj4+Pj4gKy0tLSBhL2Nv
bmZpZ3VyZS5hYwo+ID4+Pj4+Pj4gKysrKyBiL2NvbmZpZ3VyZS5hYwo+ID4+Pj4+Pj4gK0BAIC0z
OTQsMjAgKzM5NCwyMCBAQCBBU19JRihbdGVzdCAieCRlbmFibGVfZGVmYXVsdF9wY3JfYmFua3Mi
Cj4gPj4+Pj4+PiAhPQo+ID4+Pj4+Pj4gIngiXSxbCj4gPj4+Pj4+PiArIHBjcl9iYW5rX2NoZWNr
cwo+ID4+Pj4+Pj4gKyBBQ19TVUJTVChbREVGQVVMVF9QQ1JfQkFOS1NdKQo+ID4+Pj4+Pj4gKwo+
ID4+Pj4+Pj4gKy1BQ19QQVRIX1BST0coW0VYUEVDVF0sIGV4cGVjdCkKPiA+Pj4+Pj4+ICstaWYg
dGVzdCAieCRFWFBFQ1QiID0gIngiOyB0aGVuCj4gPj4+Pj4+PiArLQlBQ19NU0dfRVJST1IoW2V4
cGVjdCBpcyByZXF1aXJlZDogZXhwZWN0IHBhY2thZ2VdKQo+ID4+Pj4+Pj4gKy1maQo+ID4+Pj4+
Pj4gKysjIEFDX1BBVEhfUFJPRyhbRVhQRUNUXSwgZXhwZWN0KQo+ID4+Pj4+Pj4gKysjIGlmIHRl
c3QgIngkRVhQRUNUIiA9ICJ4IjsgdGhlbgo+ID4+Pj4+Pj4gKysjwqAJQUNfTVNHX0VSUk9SKFtl
eHBlY3QgaXMgcmVxdWlyZWQ6IGV4cGVjdCBwYWNrYWdlXSkKPiA+Pj4+Pj4+ICsrIyBmaQo+ID4+
Pj4+Pj4gKwo+ID4+Pj4+Pj4gKyBBQ19QQVRIX1BST0coW0dBV0tdLCBnYXdrKQo+ID4+Pj4+Pj4g
KyBpZiB0ZXN0ICJ4JEdBV0siID0gIngiOyB0aGVuCj4gPj4+Pj4+PiArwqAJQUNfTVNHX0VSUk9S
KFtnYXdrIGlzIHJlcXVpcmVkOiBnYXdrIHBhY2thZ2VdKQo+ID4+Pj4+Pj4gKyBmaQo+ID4+Pj4+
Pj4gKwo+ID4+Pj4+Pj4gKy1BQ19QQVRIX1BST0coW1NPQ0FUXSwgc29jYXQpCj4gPj4+Pj4+PiAr
LWlmIHRlc3QgIngkU09DQVQiID0gIngiOyB0aGVuCj4gPj4+Pj4+PiArLQlBQ19NU0dfRVJST1Io
W3NvY2F0IGlzIHJlcXVpcmVkOiBzb2NhdCBwYWNrYWdlXSkKPiA+Pj4+Pj4+ICstZmkKPiA+Pj4+
Pj4+ICsrIyBBQ19QQVRIX1BST0coW1NPQ0FUXSwgc29jYXQpCj4gPj4+Pj4+PiArKyMgaWYgdGVz
dCAieCRTT0NBVCIgPSAieCI7IHRoZW4KPiA+Pj4+Pj4+ICsrI8KgCUFDX01TR19FUlJPUihbc29j
YXQgaXMgcmVxdWlyZWQ6IHNvY2F0IHBhY2thZ2VdKQo+ID4+Pj4+Pj4gKysjIGZpCj4gPj4+Pj4+
Cj4gPj4+Pj4+Cj4gPj4+Pj4+IGNhdCBhbmQgZXhwZWN0IGFyZSB1c2VkIGZvciBydW5uaW5nIHRo
ZSB0ZXN0IGNhc2VzLiBXaGVuIG5vdAo+ID4+Pj4+PiBydW5uaW5nCj4gPj4+Pj4+IHRoZSB0ZXN0
cyB0aGVuIGFuIGFsdGVybmF0aXZlIHRvIGNvbW1lbnRpbmcgdGhlIGFib3ZlIG91dCBtYXkgYmUg
dG8KPiA+Pj4+Pj4gZG8KPiA+Pj4+Pj4gdGhlIGZvbGxvd2luZyBiZWZvcmUgcnVubmluZyBhdXRv
Z2VuLnNoOgo+ID4+Pj4+Pgo+ID4+Pj4+PiB0bXBkaXI9JChta3RlbXAgLWQpIHx8IGV4aXQgMQo+
ID4+Pj4+PiBjcCAvdXNyL2Jpbi90cnVlICIke3RtcGRpcn0vc29jYXQiCj4gPj4+Pj4+IGNwIC91
c3IvYmluL3RydWUgIiR7dG1wZGlyfS9leHBlY3QiCj4gPj4+Pj4+Cj4gPj4+Pj4+IFBBVEg9JFBB
VEg6JHt0bXBkaXJ9Cj4gPj4+Pj4+IC4vYXV0b2dlbiAtLXByZWZpeD0uLi4KPiA+Pj4+Pj4gcm0g
LXJmICIke3RtcGRpcn0iCj4gPj4+Pj4+Cj4gPj4+Pj4+ICAgwqDCoMKgwqAgU3RlZmFuCj4gPj4+
Pj4KPiA+Pj4+PiAuLi4gd2hpY2ggd291bGQgYmUgbW9yZSB0ZWRpb3VzIHRoYW4gc2ltcGx5IGNv
bW1lbnRpbmcgdGhlbSBvdXQKPiA+Pj4+PiBiZWNhdXNlIHRoZW4geW91IHdvdWxkIGhhdmUgdG8g
dHdlYWsgdGhlIGJ1aWxkIGl0c2VsZiB3aXRoIG1hbnVhbAo+ID4+Pj4+IHN0ZXBzIGluc3RlYWQg
b2YgdXNpbmcgYXV0b3Rvb2xzIGJ1aWxkIGNvbW1hbmQuCj4gPj4+Pj4KPiA+Pj4+PiBVcCB1bnRp
bCB0aGlzIGlzIGZpeGVkIGluIHRoZSB1cHN0cmVhbSBwcm9qZWN0LCB3ZSBhcmUgYmV0dGVyIG9m
Zgo+ID4+Pj4+IHNpbXBseSBjb21tZW50aW5nIHRoZW0gb3V0LCBhcyB0aGV5IGFyZSB0ZXN0IGRl
cGVuZGVuY3ksIG5vdCBhIGJ1aWxkCj4gPj4+Pj4gZGVwZW5kZW5jeSBmb3IgYnVpbGRpbmcgZS5n
LiBpbml0cmFtZnMgaW1hZ2Ugb3Igc29tZSBvdGhlciB0eXBlIG9mCj4gPj4+Pj4gT1MgaW1hZ2Uu
Cj4gPj4+Pgo+ID4+Pj4gQW5kIHRoZXJlJ3MgYSBsb3Qgb2Ygc2hlbmFuaWdhbnMgcmVsYXRlZCB0
byB0aGUgY3Jvc3MtY29tcGlsYXRpb24KPiA+Pj4+IGVudmlyb25tZW50LCB3aGljaCByZW5kZXIg
b3V0IHRoZSBzdWdnZXN0aW9uIGFueXdheSBpbiB0aGF0IGZvcm0uCj4gPj4+Pgo+ID4+Pj4gSXQn
cyBhIGJ1ZyBiZWNhdXNlIG5laXRoZXIgc29jYXQgbm9yIGV4cGVjdCBhcmUgYWN0dWEgYnVpbGQK
PiA+Pj4+IGRlcGVuZGVuY2llcywgYW5kIHRoZSBwYXRjaCB3b3JrcyBhcm91bmQgdGhlIGJ1Zy4K
PiA+Pj4KPiA+Pj4gSSBwdXQgb3V0IGFuIGlzc3VlOgo+ID4+Pgo+ID4+PiBodHRwczovL2dpdGh1
Yi5jb20vc3RlZmFuYmVyZ2VyL3N3dHBtL2lzc3Vlcy84NDMKPiA+PiBUaGlzIFBSIHNob3VsZCBo
ZWxwIHJlc29sdmUgdGhlIGlzc3VlOgo+ID4+Cj4gPj4gaHR0cHM6Ly9naXRodWIuY29tL3N0ZWZh
bmJlcmdlci9zd3RwbS9wdWxsLzg0NAo+ID4gCj4gPiBJdCBkb2VzIHRoYW5rcyEKPiA+IAo+ID4g
QXMgY29tbWVudGVkIHRvIHRoZSBQUiBJIHdhcyBzdWNjZXNzZnVsbHkgYWJsZSB0byBydW4gZnVs
bCBUUE0yCj4gPiBrc2VsZnRlc3Q6Cj4gPiAKPiA+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qYXJra29q
cy9saW51eC10cG1kZC10ZXN0Ly0vY29tbWl0cy9zd3RwbS1maXgKPiA+IAo+ID4gUG9zc2libGUg
dG8gdGFnIGEgdmVyc2lvbiB3aXRoIHRoZSBmaXg/IEFsdGVybmF0aXZlbHkgSSBjYW4gZXhwb3J0
Cj4KPiBJJ2xsIGNyZWF0ZSB2MC44LjIgd2l0aCBvbmx5IHRoaXMgcGF0Y2guCgpPSywgY29vbCwg
dGhhbmtzIQoKQlIsIEphcmtrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
