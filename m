Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C85C54E71
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 15:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B631282BC0;
	Fri, 22 Mar 2024 15:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7JiObKv-goL; Fri, 22 Mar 2024 15:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F96E82BED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F96E82BED;
	Fri, 22 Mar 2024 15:11:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E5AF1BF25F
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 15:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6814C60FD7
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 15:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HcpbHniFiJJM for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 15:11:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EEA6960FD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEA6960FD6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEA6960FD6
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 15:11:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 291DCCE1009;
 Fri, 22 Mar 2024 15:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51B4C433F1;
 Fri, 22 Mar 2024 15:11:27 +0000 (UTC)
Mime-Version: 1.0
Date: Fri, 22 Mar 2024 17:11:25 +0200
Message-Id: <D00DINCDWI2B.1N6Q54IC0C3WQ@kernel.org>
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
In-Reply-To: <72dda3ce-5cf6-4830-9f18-30a64a01af15@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1711120289;
 bh=X1xnEolW6iuORh3d5ltwS1qSokB5xq2PlbLnEWjBUaI=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=RfGMRbA5lx++o0Vt3fnLS1L2deQ6ZnPynrW4qcC283hCzLDTJyYAqYsDUw/SfYvZs
 V4I6bTUVy4Wsk9P3jaVZNF+BP+ivmZaChcyFpyihYFLfoIbSaEPT4KBcmX8HZUNkTH
 yZizzGvNQRfNOeMxu0JXHj8vhdRSbzSQYCYWsBkl5/8VPu1HuzrO7VFKUue/BBkYcg
 zcQnJS2rtrzitA9Bg+rVjJHngY/6dJJ0JKX0OItg9kwImrXjEa8LK8fgNXw2ywz96a
 W8hJMlPMbCVnPsUHUt3/fAyaV+QtrlPCxmaing+zCIKlPcjnLz0imCxsPWBkAwNQWp
 50XNLSdtHytiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RfGMRbA5
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

T24gRnJpIE1hciAyMiwgMjAyNCBhdCA0OjA0IFBNIEVFVCwgU3RlZmFuIEJlcmdlciB3cm90ZToK
Pgo+Cj4gT24gMy8yMi8yNCAwNTowMCwgSmFya2tvIFNha2tpbmVuIHdyb3RlOgo+ID4gT24gRnJp
IE1hciAyMiwgMjAyNCBhdCAxMDozNSBBTSBFRVQsIEphcmtrbyBTYWtraW5lbiB3cm90ZToKPiA+
PiBPbiBGcmksIDIwMjQtMDMtMjIgYXQgMTA6MjIgKzAyMDAsIEphcmtrbyBTYWtraW5lbiB3cm90
ZToKPiA+Pj4gT24gVGh1LCAyMDI0LTAzLTIxIGF0IDE2OjMwIC0wNDAwLCBTdGVmYW4gQmVyZ2Vy
IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+Cj4gPj4+PiBPbiAzLzIxLzI0IDE0OjIxLCBKYXJra28gU2Fr
a2luZW4gd3JvdGU6Cj4gPj4+Pj4gQWRkIHN3dHBtIGFuZCBpdHMgZGVwZW5kZW5jeSBsaWJ0cG1z
IHRvIGhvc3QgcGFja2FnZXMuIFRoZXNlIGFyZQo+ID4+Pj4+IHVzZWZ1bAo+ID4+Pj4+IGZvciBl
bXVsYXRpbmcgVFBNIGluIFFFTVUgZW52aXJvbm1lbnQuCj4gPj4+Pj4KPiA+Pj4+PiBMaW5rOiBo
dHRwczovL2dpdGxhYi5jb20vamFya2tvanMvbGludXgtdHBtZGQtdGVzdAo+ID4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEphcmtrbyBTYWtraW5lbiA8amFya2tvQGtlcm5lbC5vcmc+Cj4gPj4+Pj4gLS0t
Cj4gPj4+Pgo+ID4+Pj4+ICstLS0KPiA+Pj4+PiArIGNvbmZpZ3VyZS5hYyB8IDE2ICsrKysrKysr
LS0tLS0tLS0KPiA+Pj4+PiArIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCj4gPj4+Pj4gKwo+ID4+Pj4+ICtkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIv
Y29uZmlndXJlLmFjCj4gPj4+Pj4gK2luZGV4IDQ5Y2FmOTYuLjRhY2M3NjMgMTAwNjQ0Cj4gPj4+
Pj4gKy0tLSBhL2NvbmZpZ3VyZS5hYwo+ID4+Pj4+ICsrKysgYi9jb25maWd1cmUuYWMKPiA+Pj4+
PiArQEAgLTM5NCwyMCArMzk0LDIwIEBAIEFTX0lGKFt0ZXN0ICJ4JGVuYWJsZV9kZWZhdWx0X3Bj
cl9iYW5rcyIKPiA+Pj4+PiAhPQo+ID4+Pj4+ICJ4Il0sWwo+ID4+Pj4+ICsgcGNyX2JhbmtfY2hl
Y2tzCj4gPj4+Pj4gKyBBQ19TVUJTVChbREVGQVVMVF9QQ1JfQkFOS1NdKQo+ID4+Pj4+ICsKPiA+
Pj4+PiArLUFDX1BBVEhfUFJPRyhbRVhQRUNUXSwgZXhwZWN0KQo+ID4+Pj4+ICstaWYgdGVzdCAi
eCRFWFBFQ1QiID0gIngiOyB0aGVuCj4gPj4+Pj4gKy0JQUNfTVNHX0VSUk9SKFtleHBlY3QgaXMg
cmVxdWlyZWQ6IGV4cGVjdCBwYWNrYWdlXSkKPiA+Pj4+PiArLWZpCj4gPj4+Pj4gKysjIEFDX1BB
VEhfUFJPRyhbRVhQRUNUXSwgZXhwZWN0KQo+ID4+Pj4+ICsrIyBpZiB0ZXN0ICJ4JEVYUEVDVCIg
PSAieCI7IHRoZW4KPiA+Pj4+PiArKyPCoAlBQ19NU0dfRVJST1IoW2V4cGVjdCBpcyByZXF1aXJl
ZDogZXhwZWN0IHBhY2thZ2VdKQo+ID4+Pj4+ICsrIyBmaQo+ID4+Pj4+ICsKPiA+Pj4+PiArIEFD
X1BBVEhfUFJPRyhbR0FXS10sIGdhd2spCj4gPj4+Pj4gKyBpZiB0ZXN0ICJ4JEdBV0siID0gIngi
OyB0aGVuCj4gPj4+Pj4gK8KgCUFDX01TR19FUlJPUihbZ2F3ayBpcyByZXF1aXJlZDogZ2F3ayBw
YWNrYWdlXSkKPiA+Pj4+PiArIGZpCj4gPj4+Pj4gKwo+ID4+Pj4+ICstQUNfUEFUSF9QUk9HKFtT
T0NBVF0sIHNvY2F0KQo+ID4+Pj4+ICstaWYgdGVzdCAieCRTT0NBVCIgPSAieCI7IHRoZW4KPiA+
Pj4+PiArLQlBQ19NU0dfRVJST1IoW3NvY2F0IGlzIHJlcXVpcmVkOiBzb2NhdCBwYWNrYWdlXSkK
PiA+Pj4+PiArLWZpCj4gPj4+Pj4gKysjIEFDX1BBVEhfUFJPRyhbU09DQVRdLCBzb2NhdCkKPiA+
Pj4+PiArKyMgaWYgdGVzdCAieCRTT0NBVCIgPSAieCI7IHRoZW4KPiA+Pj4+PiArKyPCoAlBQ19N
U0dfRVJST1IoW3NvY2F0IGlzIHJlcXVpcmVkOiBzb2NhdCBwYWNrYWdlXSkKPiA+Pj4+PiArKyMg
ZmkKPiA+Pj4+Cj4gPj4+Pgo+ID4+Pj4gY2F0IGFuZCBleHBlY3QgYXJlIHVzZWQgZm9yIHJ1bm5p
bmcgdGhlIHRlc3QgY2FzZXMuIFdoZW4gbm90Cj4gPj4+PiBydW5uaW5nCj4gPj4+PiB0aGUgdGVz
dHMgdGhlbiBhbiBhbHRlcm5hdGl2ZSB0byBjb21tZW50aW5nIHRoZSBhYm92ZSBvdXQgbWF5IGJl
IHRvCj4gPj4+PiBkbwo+ID4+Pj4gdGhlIGZvbGxvd2luZyBiZWZvcmUgcnVubmluZyBhdXRvZ2Vu
LnNoOgo+ID4+Pj4KPiA+Pj4+IHRtcGRpcj0kKG1rdGVtcCAtZCkgfHwgZXhpdCAxCj4gPj4+PiBj
cCAvdXNyL2Jpbi90cnVlICIke3RtcGRpcn0vc29jYXQiCj4gPj4+PiBjcCAvdXNyL2Jpbi90cnVl
ICIke3RtcGRpcn0vZXhwZWN0Igo+ID4+Pj4KPiA+Pj4+IFBBVEg9JFBBVEg6JHt0bXBkaXJ9Cj4g
Pj4+PiAuL2F1dG9nZW4gLS1wcmVmaXg9Li4uCj4gPj4+PiBybSAtcmYgIiR7dG1wZGlyfSIKPiA+
Pj4+Cj4gPj4+PiAgwqDCoMKgwqAgU3RlZmFuCj4gPj4+Cj4gPj4+IC4uLiB3aGljaCB3b3VsZCBi
ZSBtb3JlIHRlZGlvdXMgdGhhbiBzaW1wbHkgY29tbWVudGluZyB0aGVtIG91dAo+ID4+PiBiZWNh
dXNlIHRoZW4geW91IHdvdWxkIGhhdmUgdG8gdHdlYWsgdGhlIGJ1aWxkIGl0c2VsZiB3aXRoIG1h
bnVhbAo+ID4+PiBzdGVwcyBpbnN0ZWFkIG9mIHVzaW5nIGF1dG90b29scyBidWlsZCBjb21tYW5k
Lgo+ID4+Pgo+ID4+PiBVcCB1bnRpbCB0aGlzIGlzIGZpeGVkIGluIHRoZSB1cHN0cmVhbSBwcm9q
ZWN0LCB3ZSBhcmUgYmV0dGVyIG9mZgo+ID4+PiBzaW1wbHkgY29tbWVudGluZyB0aGVtIG91dCwg
YXMgdGhleSBhcmUgdGVzdCBkZXBlbmRlbmN5LCBub3QgYSBidWlsZAo+ID4+PiBkZXBlbmRlbmN5
IGZvciBidWlsZGluZyBlLmcuIGluaXRyYW1mcyBpbWFnZSBvciBzb21lIG90aGVyIHR5cGUgb2YK
PiA+Pj4gT1MgaW1hZ2UuCj4gPj4KPiA+PiBBbmQgdGhlcmUncyBhIGxvdCBvZiBzaGVuYW5pZ2Fu
cyByZWxhdGVkIHRvIHRoZSBjcm9zcy1jb21waWxhdGlvbgo+ID4+IGVudmlyb25tZW50LCB3aGlj
aCByZW5kZXIgb3V0IHRoZSBzdWdnZXN0aW9uIGFueXdheSBpbiB0aGF0IGZvcm0uCj4gPj4KPiA+
PiBJdCdzIGEgYnVnIGJlY2F1c2UgbmVpdGhlciBzb2NhdCBub3IgZXhwZWN0IGFyZSBhY3R1YSBi
dWlsZAo+ID4+IGRlcGVuZGVuY2llcywgYW5kIHRoZSBwYXRjaCB3b3JrcyBhcm91bmQgdGhlIGJ1
Zy4KPiA+IAo+ID4gSSBwdXQgb3V0IGFuIGlzc3VlOgo+ID4gCj4gPiBodHRwczovL2dpdGh1Yi5j
b20vc3RlZmFuYmVyZ2VyL3N3dHBtL2lzc3Vlcy84NDMKPiBUaGlzIFBSIHNob3VsZCBoZWxwIHJl
c29sdmUgdGhlIGlzc3VlOgo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL3N0ZWZhbmJlcmdlci9zd3Rw
bS9wdWxsLzg0NAoKSXQgZG9lcyB0aGFua3MhCgpBcyBjb21tZW50ZWQgdG8gdGhlIFBSIEkgd2Fz
IHN1Y2Nlc3NmdWxseSBhYmxlIHRvIHJ1biBmdWxsIFRQTTIKa3NlbGZ0ZXN0OgoKaHR0cHM6Ly9n
aXRsYWIuY29tL2phcmtrb2pzL2xpbnV4LXRwbWRkLXRlc3QvLS9jb21taXRzL3N3dHBtLWZpeAoK
UG9zc2libGUgdG8gdGFnIGEgdmVyc2lvbiB3aXRoIHRoZSBmaXg/IEFsdGVybmF0aXZlbHkgSSBj
YW4gZXhwb3J0CnlvdXIgcGF0Y2ggZnJvbSB5b3VyIHRyZWUgYW5kIGluY2x1ZGUgaXQgdG8gdGhl
IG5leHQgcmV2aXNpb24gb2YKdGhpcyBwYXRjaCBzZXQuCgpCUiwgSmFya2tvCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
