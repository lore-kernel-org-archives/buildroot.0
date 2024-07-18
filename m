Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDE6C3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 21:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CED480E8C;
	Thu, 18 Jul 2024 21:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id noQPSdvAthFg; Thu, 18 Jul 2024 21:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52CFD80E63
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52CFD80E63;
	Thu, 18 Jul 2024 21:40:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0195D1BF3A1
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFC93404B1
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0p0HYtyg9cvE for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 21:40:53 +0000 (UTC)
X-Greylist: delayed 505 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 18 Jul 2024 21:40:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F60D40133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F60D40133
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F60D40133
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:40:52 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46ILWRe8129657;
 Thu, 18 Jul 2024 16:32:27 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46ILWRKX042044
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 18 Jul 2024 16:32:27 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Jul 2024 16:32:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Jul 2024 16:32:27 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46ILWRCS033560;
 Thu, 18 Jul 2024 16:32:27 -0500
Date: Thu, 18 Jul 2024 16:32:27 -0500
To: Paresh Bhagat <p-bhagat@ti.com>
Message-ID: <20240718213227.dbeh7x37tmippbla@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240711060531.4067193-1-p-bhagat@ti.com>
 <e0c35138-a12c-42e3-9c7e-1eb9113b001e@smile.fr>
 <20240712203934.zbqkteq4ggtkat4f@bryanbrattlof.com>
 <ed192ad7-705e-4085-8019-f2a6fc707cd2@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed192ad7-705e-4085-8019-f2a6fc707cd2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721338347;
 bh=+g1VVJsdaJXmpR7H3ERlN3vKeRaZaMV1HoPBeMj9md0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=pdxNuNDsNgWPE65mNqj+0MlQv3CtazVa1tlBVW7HTCwY7tWscwBpcW/rbsuZFgj2S
 r5moCOnkaUb/jYRIB/J5ovBnq7BfwbmxluAoNMgLMDMlKXrMtEYDMVqJe2SNCwT+Zv
 Vc3nqDDlQFJKwStHpQDExpSS37TlL09vpdwxdQvE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=pdxNuNDs
Subject: Re: [Buildroot] [PATCH v4] boot/ti-k3-boot-firmware: Add config
 option to specify version
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Gyan Gupta <g-gupta@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
 Syed Mohammed Khasim <khasim@ti.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gSnVseSAxNSwgMjAyNCB0aHVzIHNheWV0aCBQYXJlc2ggQmhhZ2F0IHZpYSBidWlsZHJvb3Q6
Cj4gSGkgQnJ5YW4sIFJvbWFpbgo+IE9uIDEzLzA3LzI0IDAyOjA5LCBCcnlhbiBCcmF0dGxvZiB3
cm90ZToKPiA+IE9uIEp1bHkgMTIsIDIwMjQgdGh1cyBzYXlldGggUm9tYWluIE5hb3VyIHZpYSBi
dWlsZHJvb3Q6Cj4gPiA+IEhlbGxvIFBhcmVzaCwgQWxsLAo+ID4gPiAKPiA+ID4gTGUgMTEvMDcv
MjAyNCDDoCAwODowNSwgUGFyZXNoIEJoYWdhdCB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4g
PiA+ID4gUHJldmlvdXNseSB0aGUgdmVyc2lvbiBvZiB0aS1rMy1ib290LWZpcm13YXJlIChUSV9L
M19CT09UX0ZJUk1XQVJFX1ZFUlNJT04pIHdhcwo+ID4gPiA+IGZpeGVkIGluIG1rIGZpbGUuIElu
dHJvZHVjZSBhIG5ldyBjb25maWcgb3B0aW9uIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FS
RV9DVVNUT01fVkVSU0lPTgo+ID4gPiA+IHNvIHRoYXQgdXNlciBjYW4gY2hhbmdlIHRoZSB2ZXJz
aW9uIGZvciB0aS1rMy1ib290LWZpcm13YXJlIHVzaW5nIG1lbnVjb25maWcuCj4gPiA+ID4gCj4g
PiA+ID4gVGhpcyBwcm92aWRlcyBncmVhdGVyIGZsZXhpYmlsaXR5IGZvciB1c2VycyB0byBzZWxl
Y3QgZGlmZmVyZW50IHZlcnNpb25zIG9mCj4gPiA+ID4gdGktazMtYm9vdC1maXJtd2FyZSB3aXRo
b3V0IG1vZGlmeWluZyB0aGUgYnVpbGQgc2NyaXB0IGRpcmVjdGx5Lgo+ID4gPiBJcyB0aGUgbWFp
biByZWFzb24gdG8gYWRkIGFuIG9wdGlvbiB0byBzcGVjaWZ5IHRoZSB0aS1rMy1ib290LWZpcm13
YXJlIHZlcnNpb24KPiA+ID4gaXMgYmVjYXVzZSBpdCBtdXN0IG1hdGNoIGV4YWN0bHkgd2l0aCB0
aGUgc2VsZWN0ZWQgdS1ib290IG9yIHRpLWszLXI1LWxvYWRlcgo+ID4gPiB2ZXJzaW9uIGR1ZSB0
byB0aGUgVEktU0NJIHByb3RvY29sIGFuZCB0aGUgRE1TQyBwcmVidWlsdCBmaXJtd2FyZSBiaW5h
cnkKPiA+ID4gKHByb3ZpZGVkIGJ5IFRJKSAoRE1TQyBpcyB0aGUgU2VjdXJpdHkgTWFuYWdlciBD
b3JlIGluIHRoZSBTb0MpPwo+ID4gPiAKPiA+IFRoZSBUSS1TQ0kgcHJvdG9jb2wgd2lsbCBhbHdh
eXMgYmUgYmFja3dhcmQgY29tcGF0aWJsZS4gVGhlcmUgc2hvdWxkIGJlCj4gPiBubyB3b3JyaWVz
IGFib3V0IHVzaW5nIGFuIG9sZGVyIFRJRlMvRE0vRE1TQyBmaXJtd2FyZSB3aXRoIG5ld2VyIGtl
cm5lbHMKPiA+IGFuZCBib290bG9hZGVycyBhbmQgYW55IGVycm9ycyBhbnlvbmUgc2VlcyBzaG91
bGQgYmUgcmVwb3J0ZWQgdG8gVEkgc28KPiA+IGl0IGNhbiBiZSBhZGRyZXNzZWQuCj4gPiAKPiA+
IEl0IGdldHMgYSBsaXR0bGUgd2VpcmQgd2l0aCB0aGUgVElGUyA8LT4gRE0gY29tbXVuaWNhdGlv
biBzbyBpdCdzCj4gPiByZWNvbW1lbmRlZCB0byBrZWVwIHRob3NlIGluIHN5bmMuIEkgaGF2ZW4n
dCBzZWVuIGFueSBpc3N1ZXMgYnV0IHRoYXQKPiA+IGRvZXNuJ3QgbWVhbiB0aGV5IGRvbid0IGV4
aXN0Lgo+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUGFyZXNoIEJoYWdhdCA8cC1iaGFnYXRA
dGkuY29tPgo+ID4gPiA+IAo+ID4gPiA+IC0tLQo+ID4gPiA+IENoYW5nZXMgdjMgLT4gdjQ6Cj4g
PiA+ID4gICAgLSBUaSBrMyAtPiBUSSBLMyAoU3VnZ2VzdGVkIGJ5IEFuZHJlYXMgRGFubmVuYmVy
ZykKPiA+ID4gPiAgICAtIGdpdC50aS5vcmcgLT4gZ2l0LnRpLmNvbSAoU3VnZ2VzdGVkIGJ5IEFu
ZHJlYXMgRGFubmVuYmVyZykKPiA+ID4gPiAKPiA+ID4gPiBDaGFuZ2VzIHYyIC0+IHYzOgo+ID4g
PiA+ICAgIC0gZmxleGliaWx0eSAtPiBmbGV4aWJpbGl0eSAoU3VnZ2VzdGVkIGJ5IENoaXJhZyBT
aGlsd2FudCkKPiA+ID4gPiAKPiA+ID4gPiBDaGFuZ2VzIHYxIC0+IHYyOgo+ID4gPiA+ICAgIC0g
Rml4IHdoaXRlc3BhY2VzL2luZGVudGF0aW9uIGluIENvbmZpZy5pbiBmaWxlIChTdWdnZXN0ZWQg
YnkgQnJ5YW4gQnJhdHRsb2YpCj4gPiA+ID4gCj4gPiA+ID4gLS0tCj4gPiA+ID4gICBib290L3Rp
LWszLWJvb3QtZmlybXdhcmUvQ29uZmlnLmluICAgICAgICAgICAgfCAzMCArKysrKysrKysrKysr
KysrKysrCj4gPiA+ID4gICAuLi4vdGktazMtYm9vdC1maXJtd2FyZS5tayAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ID4gPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMt
Ym9vdC1maXJtd2FyZS9Db25maWcuaW4gYi9ib290L3RpLWszLWJvb3QtZmlybXdhcmUvQ29uZmln
LmluCj4gPiA+ID4gaW5kZXggZDgwYmI0YmRiMy4uNTgxZWMwYzNiOSAxMDA2NDQKPiA+ID4gPiAt
LS0gYS9ib290L3RpLWszLWJvb3QtZmlybXdhcmUvQ29uZmlnLmluCj4gPiA+ID4gKysrIGIvYm9v
dC90aS1rMy1ib290LWZpcm13YXJlL0NvbmZpZy5pbgo+ID4gPiA+IEBAIC01LDMgKzUsMzMgQEAg
Y29uZmlnIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRQo+ID4gPiA+ICAgCSAgVGhpcyBw
YWNrYWdlIGRvd25sb2FkcyBhbmQgaW5zdGFsbHMgdGhlIFRJLXNwZWNpZmljIHRpLXN5c2Z3Cj4g
PiA+ID4gICAJICBhbmQgdGktZG0gZmlybXdhcmUgbmVlZGVkIHRvIGJvb3QgVEkgSzMgcGxhdGZv
cm1zICh3aGljaAo+ID4gPiA+ICAgCSAgaW5jbHVkZSBBTTYyeCwgQU02NHgsIEFNNjV4IGFuZCBt
b3JlKS4KPiA+ID4gPiArCj4gPiA+ID4gK2lmIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FS
RQo+ID4gPiA+ICtjaG9pY2UKPiA+ID4gPiArCXByb21wdCAidGktazMtYm9vdC1maXJtd2FyZSB2
ZXJzaW9uIgo+ID4gPiA+ICsJZGVmYXVsdCBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVf
TEFURVNUX1ZFUlNJT04KPiA+ID4gPiArCWhlbHAKPiA+ID4gPiArCSAgU2VsZWN0IHRoZSB2ZXJz
aW9uIG9mIFRJIEszIGJvb3QgZmlybXdhcmUgeW91IHdhbnQgdG8gdXNlLgo+ID4gPiA+ICsKPiA+
ID4gPiArY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9MQVRFU1RfVkVSU0lP
Tgo+ID4gPiA+ICsJYm9vbCAiMDkuMDIuMDAuMDA5Igo+ID4gPiA+ICsKPiA+ID4gPiArY29uZmln
IEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTgo+ID4gPiA+ICsJ
Ym9vbCAiQ3VzdG9tIHZlcnNpb24iCj4gPiA+ID4gKwloZWxwCj4gPiA+ID4gKwkgIFRoaXMgb3B0
aW9uIGFsbG93cyB0byB1c2UgYSBzcGVjaWZpYyBvZmZpY2lhbCB2ZXJzaW9uIGZyb20KPiA+ID4g
PiArCSAgZ2l0LnRpLmNvbS4KPiA+ID4gV2hlbiB5b3UgdXNlIHRoaXMgb3B0aW9uLCB5b3UgbmVl
ZCB0byBkaXNhYmxlIHRoZSBoYXNoIGNoZWNraW5nIHdpdGg6Cj4gPiA+IAo+ID4gPiBCUl9OT19D
SEVDS19IQVNIX0ZPUiArPSAkKFRJX0szX0JPT1RfRklSTVdBUkVfU09VUkNFKQo+ID4gPiAKPiA+
ID4gT3RoZXJ3aXNlIHlvdSBnZXQ6Cj4gPiA+IAo+ID4gPiBFUlJPUjogTm8gaGFzaCBmb3VuZCBm
b3IgdGktbGludXgtZmlybXdhcmUtMTAuMDAuMDUudGFyLnh6Cj4gPiA+IAo+ID4gPiBTZWUgaG93
IGl0J3MgZG9uZSBmb3IgdGktazMtcjUtbG9hZGVyOgo+ID4gPiAKPiA+ID4gaWZlcSAoJChCUjJf
VEFSR0VUX1RJX0szX1I1X0xPQURFUikkKEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0xBVEVT
VF9WRVJTSU9OKSx5KQo+ID4gPiBCUl9OT19DSEVDS19IQVNIX0ZPUiArPSAkKFRJX0szX1I1X0xP
QURFUl9TT1VSQ0UpCj4gPiA+IGVuZGlmCj4gPiA+IAo+ID4gQWggeWVhaCBhbmQgd2Ugc2hvdWxk
IHByb2JhYmx5IGFkZCB0aGUgY29ycmVzcG9uZGluZyBoYXNoIGZpbGVzIGluIHRoZQo+ID4gYm9h
cmQgZGlyZWN0b3J5IG9mIHRoZSBib2FyZHMgd2hvIHVzZSB0aGlzIGZvciB3aGVuIHRoaXMgdmVy
c2lvbgo+ID4gY2hhbmdlcy4gT29wcwo+ID4gCj4gPiB+QnJ5YW4KPiAKPiBJIHNlZSBoYXNoIGNo
ZWNraW5nIGlzIGRpc2FibGVkIG9ubHkgd2hlbiB1c2luZyB0aGUgbGF0ZXN0IHZlcnNpb24gYW5k
IG5vdAo+IHdoZW4gYSBjdXN0b20gdmVyc2lvbiBpcyBzcGVjaWZpZWQuIFNvIHNob3VsZCBpIGRp
c2FibGUgaGFzaCBjaGVja2luZyBmb3IKPiBsYXRlc3QgdmVyc2lvbiBoZXJlIHRvbz8KPiAKCkht
bSBJIHNlZSB3aGF0IHlvdSdyZSB0YWxraW5nIGFib3V0LiBXZSBtYXkgbm90IHdhbnQgdG8gZGlz
YWJsZSB0aGUgaGFzaCAKY2hlY2sgZm9yIGFueSBvcHRpb24uIElmIHdlIGFsbG93IGJvYXJkcyB0
byBiZWdpbiBwaW5uaW5nIGEgCmN1c3RvbS9zcGVjaWZpYyB2ZXJzaW9uIG9mIFRJRlMvRE0vRE1T
QyB0aGV5IHdpbGwgbmVlZCB0byBwdXQgdGhlIGhhc2ggCmluIHRoZWlyIGJvYXJkIGZvbGRlciB0
byBhdm9pZCBiYWQgZG93bmxvYWRzLgoKSWYgdGhleSB3YW50IHRvIHByb3RvdHlwZSBzb21ldGhp
bmcgcXVpY2tseSB0aGV5IHNob3VsZCBwcm9iYWJseSB1c2UgdGhlIApsb2NrYS5tayBvdmVycmlk
ZSBzeXN0ZW0uIAoKfkJyeWFuCgo+IFJlZ2FyZHMsCj4gCj4gUGFyZXNoCj4gCj4gPiAKPiA+ID4g
QmVzdCByZWdhcmRzLAo+ID4gPiBSb21haW4KPiA+ID4gCj4gPiA+IAo+ID4gPiA+ICsKPiA+ID4g
PiArZW5kY2hvaWNlCj4gPiA+ID4gKwo+ID4gPiA+ICtjb25maWcgQlIyX1RBUkdFVF9USV9LM19C
T09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFCj4gPiA+ID4gKwlzdHJpbmcgIkN1c3Rv
bSB0aS1rMy1ib290LWZpcm13YXJlIHZlcnNpb24iCj4gPiA+ID4gKwlkZXBlbmRzIG9uIEJSMl9U
QVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTgo+ID4gPiA+ICsKPiA+ID4g
PiArY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9WRVJTSU9OCj4gPiA+ID4g
KwlzdHJpbmcKPiA+ID4gPiArCWRlZmF1bHQgIjA5LjAyLjAwLjAwOSIgICAgIGlmIEJSMl9UQVJH
RVRfVElfSzNfQk9PVF9GSVJNV0FSRV9MQVRFU1RfVkVSU0lPTgo+ID4gPiA+ICsJZGVmYXVsdCBC
UjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUUgXAo+ID4g
PiA+ICsJCQkJaWYgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9O
Cj4gPiA+ID4gKwo+ID4gPiA+ICtlbmRpZgo+ID4gPiA+IGRpZmYgLS1naXQgYS9ib290L3RpLWsz
LWJvb3QtZmlybXdhcmUvdGktazMtYm9vdC1maXJtd2FyZS5tayBiL2Jvb3QvdGktazMtYm9vdC1m
aXJtd2FyZS90aS1rMy1ib290LWZpcm13YXJlLm1rCj4gPiA+ID4gaW5kZXggOTMzMjczMmFkNC4u
MzUwMzgxZWJiZSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9ib290L3RpLWszLWJvb3QtZmlybXdhcmUv
dGktazMtYm9vdC1maXJtd2FyZS5tawo+ID4gPiA+ICsrKyBiL2Jvb3QvdGktazMtYm9vdC1maXJt
d2FyZS90aS1rMy1ib290LWZpcm13YXJlLm1rCj4gPiA+ID4gQEAgLTQsNyArNCw3IEBACj4gPiA+
ID4gICAjCj4gPiA+ID4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gPiA+IC1USV9LM19C
T09UX0ZJUk1XQVJFX1ZFUlNJT04gPSAwOS4wMi4wMC4wMDkKPiA+ID4gPiArVElfSzNfQk9PVF9G
SVJNV0FSRV9WRVJTSU9OID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfVElfSzNfQk9PVF9G
SVJNV0FSRV9WRVJTSU9OKSkKPiA+ID4gPiAgIFRJX0szX0JPT1RfRklSTVdBUkVfU0lURSA9IGh0
dHBzOi8vZ2l0LnRpLmNvbS9jZ2l0L3Byb2Nlc3Nvci1maXJtd2FyZS90aS1saW51eC1maXJtd2Fy
ZS9zbmFwc2hvdAo+ID4gPiA+ICAgVElfSzNfQk9PVF9GSVJNV0FSRV9TT1VSQ0UgPSB0aS1saW51
eC1maXJtd2FyZS0kKFRJX0szX0JPT1RfRklSTVdBUkVfVkVSU0lPTikudGFyLnh6Cj4gPiA+ID4g
ICBUSV9LM19CT09UX0ZJUk1XQVJFX0lOU1RBTExfSU1BR0VTID0gWUVTCj4gPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiA+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+ID4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
