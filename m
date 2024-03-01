Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD786C48BF6
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 00:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79B7782BC8;
	Fri,  1 Mar 2024 00:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1foqQtMTElC; Fri,  1 Mar 2024 00:06:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 609BA828DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 609BA828DA;
	Fri,  1 Mar 2024 00:06:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C08E1BF83E
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 00:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6991060F98
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 00:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dLIZX_bHpDPB for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 00:06:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 613F560F93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 613F560F93
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 613F560F93
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 00:06:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42106lck092498;
 Thu, 29 Feb 2024 18:06:47 -0600
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42106l7Q040243
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 29 Feb 2024 18:06:47 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Feb 2024 18:06:46 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Feb 2024 18:06:46 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42106kmE094917;
 Thu, 29 Feb 2024 18:06:46 -0600
Date: Thu, 29 Feb 2024 18:06:46 -0600
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240301000646.kafg3dnywl2o65od@dasso>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
 <20240227163019.2876942-16-dario.binacchi@amarulasolutions.com>
 <20240229022222.exmx2cgijdjrtnwp@dasso>
 <CABGWkvoCD4SJsRPP+uv2N0evUF8YFv9eRBHew1Lhj+UZwP9YNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvoCD4SJsRPP+uv2N0evUF8YFv9eRBHew1Lhj+UZwP9YNQ@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1709251607;
 bh=9UMmSslf/92TXY852UlcbMHLp6tJypulimeZ9T2jXm8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=A/rLlN8SImFA2IbZonCP4HxM5Dcr4GrcFas8/Ck2AHNMKfe/TXhtQKlVi66i2yQIA
 nhmEbmBjKo8/rAU4q8v3ldHB39Exvq6Bk20MqFDE812EuAXGMnh9npG1psz3cbIFqz
 2fdQoQ+D+7Mach1tpL2N97bIiX5SiLbxEb3s8YnI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=A/rLlN8S
Subject: Re: [Buildroot] [PATCH v7 15/17] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgpPbiBUaHUsIEZlYiAyOSwgMjAyNCBhdCAxMjozNzo1N1BNICswMTAwLCBEYXJp
byBCaW5hY2NoaSB3cm90ZToKPiBIaSBBbmRyZWFzLAo+IAo+IE9uIFRodSwgRmViIDI5LCAyMDI0
IGF0IDM6MjLigK9BTSBBbmRyZWFzIERhbm5lbmJlcmcgPGRhbm5lbmJlcmdAdGkuY29tPiB3cm90
ZToKPiA+Cj4gPiBIaSBEYXJpbywKPiA+Cj4gPiBPbiBUdWUsIEZlYiAyNywgMjAyNCBhdCAwNToz
MDoxN1BNICswMTAwLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiA+ID4gUmVjZW50IHZlcnNpb25z
IG9mIFUtQm9vdCBhcmUgY2FwYWJsZSBvZiBidWlsZGluZyB0aWJvb3QzLmJpbiB1c2luZwo+ID4g
PiBCaW5tYW4uIEluIHRoaXMgY2FzZSwgbGV0J3MgY29weSBpdCB0byB0aGUgYmluYXJpZXMgZGly
ZWN0b3J5Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiA+Cj4gPiA+IC0tLQo+ID4gPgo+ID4g
PiBDaGFuZ2VzIGluIHY2Ogo+ID4gPiAtIFJlcGxhY2UgYGZpbmQnIGNvbW1hbmQgd2l0aCBgY3An
IG9uZS4KPiA+ID4KPiA+ID4gQ2hhbmdlcyBpbiB2NToKPiA+ID4gLSBSZXBsYWNlIHRpYm9vdDMt
Ki0kKFRJX0szX1I1X0xPQURFUl9TRUNUWVBFKS0qLmJpbiB3aXRoCj4gPiA+ICAgdGlib290My0k
KFRJX0szX1I1X0xPQURFUl9TT0MpLSQoVElfSzNfUjVfTE9BREVSX1NFQ1RZUEUpLSouYmluCj4g
PiA+Cj4gPiA+IEFkZGVkIGluIHY0Cj4gPiA+Cj4gPiA+ICBib290L3RpLWszLXI1LWxvYWRlci90
aS1rMy1yNS1sb2FkZXIubWsgfCA0ICsrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL3Rp
LWszLXI1LWxvYWRlci5tayBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5t
awo+ID4gPiBpbmRleCBmZGIwNThmM2I3MmEuLmNiZGI2NTMyNzhmOCAxMDA2NDQKPiA+ID4gLS0t
IGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gPiA+ICsrKyBiL2Jv
b3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ID4gPiBAQCAtNzAsOCArNzAs
MTIgQEAgZGVmaW5lIFRJX0szX1I1X0xPQURFUl9CVUlMRF9DTURTCj4gPiA+ICAgICAgICQoVEFS
R0VUX0NPTkZJR1VSRV9PUFRTKSAkKFRJX0szX1I1X0xPQURFUl9NQUtFKSAtQyAkKEBEKSAkKFRJ
X0szX1I1X0xPQURFUl9NQUtFX09QVFMpCj4gPiA+ICBlbmRlZgo+ID4gPgo+ID4gPiArVElfSzNf
UjVfTE9BREVSX1NFQ1RZUEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfVElfSzNfU0VD
VFlQRSkpCj4gPiA+ICtUSV9LM19SNV9MT0FERVJfU09DID0gJChjYWxsIHFzdHJpcCwkKEJSMl9Q
QUNLQUdFX1RJX0szX1NPQykpCj4gPiA+ICsKPiA+ID4gIGRlZmluZSBUSV9LM19SNV9MT0FERVJf
SU5TVEFMTF9JTUFHRVNfQ01EUwo+ID4gPiAgICAgICBjcCAkKEBEKS9zcGwvdS1ib290LXNwbC5i
aW4gJChCSU5BUklFU19ESVIpL3I1LXUtYm9vdC1zcGwuYmluCj4gPiA+ICsgICAgIGNwICQoQEQp
L3RpYm9vdDMtJChUSV9LM19SNV9MT0FERVJfU09DKS0kKFRJX0szX1I1X0xPQURFUl9TRUNUWVBF
KS0qLmJpbiAkKEJJTkFSSUVTX0RJUikvdGlib290My5iaW4KPiA+Cj4gPiBIYXZlIHlvdSB0cmll
ZCBkb2luZyBhIGNsZWFuIGJ1aWxkIG9mIHRpX2FtNjR4X3NrX2RlZmNvbmZpZz8gV2hlbiBJIGRv
Cj4gPiB0aGF0IHRoZSBjaGFuZ2UgYWJvdmUgYnJlYWtzIHRoZSBidWlsZC4uLgo+ID4KPiA+IDxz
bmlwPgo+ID4gPj4+IHRpLWszLXI1LWxvYWRlciAyMDIyLjEwIEluc3RhbGxpbmcgdG8gaW1hZ2Vz
IGRpcmVjdG9yeQo+ID4gY3AgL2hvbWUvYTA3OTcwNTkvZ2l0L2J1aWxkcm9vdC9vdXRwdXQvYnVp
bGQvdGktazMtcjUtbG9hZGVyLTIwMjIuMTAvc3BsL3UtYm9vdC1zcGwuYmluIC9ob21lL2EwNzk3
MDU5L2dpdC9idWlsZHJvb3Qvb3V0cHV0L2ltYWdlcy9yNS11LWJvb3Qtc3BsCj4gPiAuYmluCj4g
PiBjcCAvaG9tZS9hMDc5NzA1OS9naXQvYnVpbGRyb290L291dHB1dC9idWlsZC90aS1rMy1yNS1s
b2FkZXItMjAyMi4xMC90aWJvb3QzLWFtNjR4LWdwLSouYmluIC9ob21lL2EwNzk3MDU5L2dpdC9i
dWlsZHJvb3Qvb3V0cHV0L2ltYWdlcy90aWJvb3QzLmIKPiA+IGluCj4gPiBjcDogY2Fubm90IHN0
YXQgJy9ob21lL2EwNzk3MDU5L2dpdC9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3RpLWszLXI1LWxv
YWRlci0yMDIyLjEwL3RpYm9vdDMtYW02NHgtZ3AtKi5iaW4nOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5Cj4gPiBtYWtlWzFdOiAqKiogW3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6MzY0OiAvaG9t
ZS9hMDc5NzA1OS9naXQvYnVpbGRyb290L291dHB1dC9idWlsZC90aS1rMy1yNS1sb2FkZXItMjAy
Mi4xMC8uc3RhbXBfaW1hZ2VzX2luc3RhbGxlZF0gRXJyb3IgMQo+ID4gbWFrZTogKioqIFtNYWtl
ZmlsZTo4MjogX2FsbF0gRXJyb3IgMgo+ID4gPHNuaXA+Cj4gPgo+ID4gTG9va3MgbGlrZSB0aGUg
dGlib290My5iaW4gZmlsZSBpcyBhbHJlYWR5IHRoZXJlLCBhbmQgbm90aGluZyBuZWVkcyB0bwo+
ID4gYmUgY29waWVkIG9yIHJlbmFtZWQuIE5vdCBzdXJlIHdoYXQgaXMgYmVzdCB3YXkgdG8gbWFu
YWdlIHRoaXMKPiA+IGRlcGVuZGVuY3kgYXMgdGhpcyBpcyB0aGUgYmVoYXZpb3Igb2YgdGhlIG9s
ZGVyIFUtQm9vdC4gSSdkIHByb2JhYmx5Cj4gPiBqdXN0IG1pZ3JhdGUgdGhlIGFtNjR4X3NrIHN1
cHBvcnQgdG8gYmlubWFuIHRvbyBhbHNvIHVzaW5nIHRoZQo+ID4gc2FtZS9uZXdlciBVLUJvb3Qg
eW91IGFyZSBhbHJlYWR5IHVzaW5nIGZvciBBTTYyeCwgbWFraW5nIGV2ZXJ5dGhpbmcKPiA+IGVx
dWl2YWxlbnQgb2YgdGhlIGFtNjJ4X3NrIHN1cHBvcnQgeW91IGFyZSBmb2N1c2VkIG9uIHdpdGgg
dGhpcyBzZXJpZXMuCj4gCj4gSSBhbSBtb2RpZnlpbmcgdGhlIGNvbmZpZ3VyYXRpb24gdGlfYW02
NHhfc2tfZGVmY29uZmlnIHNvIHRoYXQsCj4gc2ltaWxhcmx5IHRvIHdoYXQgd2FzIGRvbmUgZm9y
IHRpX2FtNjJ4X3NrX2RlZmNvbmZpZywKPiBpdCB1c2VzIGEgVS1Cb290IDIwMjQuMDEgdGhhdCBt
YWtlcyB1c2Ugb2YgYmlubWFuOgo+IAo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDAyMjQyMDU2NTQuMTU0Njc0NC0xNy1kYXJpby5iaW5h
Y2NoaUBhbWFydWxhc29sdXRpb25zLmNvbS8KCkFoIG9rIEkgc2VlIHlvdXIgZWFybGllciBwb3N0
IG9uIHRoaXMgbm93LiBOb3RoaW5nIHdyb25nIHdpdGggdHJ5aW5nIHRvCnNwbGl0IHRoaW5ncyAo
aXQncyBub3QgZnVuIHRyeWluZyB0byBtYWludGFpbiB+MjAgcGF0Y2hlcyBpbiBvbmUgZ28pIGJ1
dAp3ZSBjYW4ndCBicmVhayB0aGluZ3Mgb2J2aW91c2x5LgoKSWYgdGhlIGNvbmNlcm4gaXMgYXJv
dW5kIHRlc3RpbmcsIEknbGwgYmUgaGFwcHkgdG8gaGVscCB3aWggdGhpcywgSSBjYW4KcmVhZGls
eSBhY2Nlc3MgR1AgYW5kIEhTLUZTIHZhcmlhbnRzIG9mIFNLLUFNNjQgYW5kIGhlbHAgdGVzdGlu
ZyBvbgpzaG9ydCBub3RpY2UuIFdpbGwga2VlcCBhIGNsb3NlIGV5ZSBvdXQgZm9yIGFueXRoaW5n
IHlvdSBtYXkgbmVlZCB0aGF0IEkKY2FuIHBpdGNoIGluIGhlcmUuCgpUaGFua3MsCgotLQpBbmRy
ZWFzIERhbm5lbmJlcmcKVGV4YXMgSW5zdHJ1bWVudHMgSW5jCgoKPiAKPiBUaGFua3MgYW5kIHJl
Z2FyZHMsCj4gRGFyaW8KPiAKPiA+Cj4gPiAtLQo+ID4gQW5kcmVhcyBEYW5uZW5iZXJnCj4gPiBU
ZXhhcyBJbnN0cnVtZW50cyBJbmMKPiA+Cj4gPgo+ID4KPiA+Cj4gPgo+ID4gPiAgZW5kZWYKPiA+
ID4KPiA+ID4gICQoZXZhbCAkKGtjb25maWctcGFja2FnZSkpCj4gPiA+IC0tCj4gPiA+IDIuNDMu
MAo+ID4gPgo+IAo+IAo+IAo+IC0tIAo+IAo+IERhcmlvIEJpbmFjY2hpCj4gCj4gU2VuaW9yIEVt
YmVkZGVkIExpbnV4IERldmVsb3Blcgo+IAo+IGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlv
bnMuY29tCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IAo+IAo+IEFt
YXJ1bGEgU29sdXRpb25zIFNSTAo+IAo+IFZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlz
bywgVmVuZXRvLCBJVAo+IAo+IFQuICszOSAwNDIgMjQzIDUzMTAKPiBpbmZvQGFtYXJ1bGFzb2x1
dGlvbnMuY29tCj4gCj4gd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
