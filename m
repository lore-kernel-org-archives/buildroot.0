Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C360C5478C
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 03:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF8F6607D8;
	Thu, 29 Feb 2024 03:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0s7j_11QA3B5; Thu, 29 Feb 2024 03:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB518607F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB518607F3;
	Thu, 29 Feb 2024 03:28:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 889561BF35D
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 03:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75804416B7
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 03:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U63Qo11FUcHP for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 03:28:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7AE81416B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AE81416B2
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AE81416B2
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 03:28:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41T3SKaD124971;
 Wed, 28 Feb 2024 21:28:20 -0600
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41T3SK4u011175
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Feb 2024 21:28:20 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Feb 2024 21:28:20 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Feb 2024 21:28:20 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41T3SKs9003762;
 Wed, 28 Feb 2024 21:28:20 -0600
Date: Wed, 28 Feb 2024 21:28:20 -0600
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240229032820.x275rawclrilgamn@dasso>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
 <066a576a350d384c6547dc27b55e75c8044ed9e8.camel@gmail.com>
 <CABGWkvpMckL866WfOGeE2B_nsEWyPrjtEacgbO_gKqX9BPuW2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvpMckL866WfOGeE2B_nsEWyPrjtEacgbO_gKqX9BPuW2A@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1709177300;
 bh=d12BHZXFLjIdC4pc191jRA7lmG//GIuPqTWaHQRJXYs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=rBR7GCQSgPyKRMLsqdCTGBeVK4ZnQA4C85kmlxcleLAdfE2+hCEbR3WPoMIdZ2em/
 EMA9zSJRdsOm1Lb2kB06OBbpbmlESZG14SpK6L5sgQYfBnAZ+Gergf6249d0EBQLAJ
 03FUWsANTf3PA6uV3toj9eIg+hkWyCiUeXKyJs8E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=rBR7GCQS
Subject: Re: [Buildroot] [PATCH v7 00/17] Add support for AM62x-SK HS-FS
 devices
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

SGkgRGFyaW8sCkkganVzdCB0ZXN0ZWQgeW91IHY3IHNlcmllcyBvbiB0b3Agb2YgQnVpbGRyb290
IGNvbW1pdC4uLgoKNzVhMzU2MjMyNCAoInN1cHBvcnQvc2NyaXB0cy9wa2ctc3RhdHM6IHNvcnQg
Q1ZFcyBpbiBIVE1MIG91dHB1dCIpCgouLi5vbiBib3RoIEdQIGFuZCBIUy1GUyB2YXJpYW50cyBv
ZiB0aGUgU0stQU02MiBib2FyZCBkb2luZyBhbiBTRApDYXJkLWJhc2VkIGJvb3QuIEV2ZXJ5dGhp
bmcgc2VlbXMgdG8gd29yayB3aXRob3V0IGlzc3VlcywgdGhlIGVudGlyZQpib290IGxvZyBsb29r
cyBjbGVhbiBhcyBmYXIgYXMgSSBjYW4gdGVsbCwgYW5kIGV2ZW4gbmV0d29ya2luZyB3b3Jrcy4K
CkFsc28gdGhhbmtzIGZvciBhbGwgeW91ciBlZmZvcnRzIHVwc3RyZWFtaW5nIHRoaXMsIEkga25v
dyBpdCdzIGEgdG9uIG9mCndvcmsuCgpUZXN0ZWQtYnk6IEFuZHJlYXMgRGFubmVuYmVyZyA8ZGFu
bmVuYmVyZ0B0aS5jb20+CgoKCk9uIFdlZCwgRmViIDI4LCAyMDI0IGF0IDA5OjA3OjQ0QU0gKzAx
MDAsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IEhpIEFsZXhhbmRlciwKPiAKPiBPbiBXZWQsIEZl
YiAyOCwgMjAyNCBhdCAxOjA24oCvQU0gQWxleGFuZGVyIFN2ZXJkbGluCj4gPGFsZXhhbmRlci5z
dmVyZGxpbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEhlbGxvIERhcmlvLCBSb21haW4hCj4g
Pgo+ID4gT24gVHVlLCAyMDI0LTAyLTI3IGF0IDE3OjMwICswMTAwLCBEYXJpbyBCaW5hY2NoaSB3
cm90ZToKPiA+ID4gVGhlIFNLLUFNNjJCLVAxIGlzIHRoZSBuZXdlc3QgdmVyc2lvbiBvZiBTSy1B
TTYyIHdoaWNoIGluY2x1ZGVzCj4gPiA+IGhpZ2gtc2VjdXJpdHkgZmllbGQtc2VjdXJhYmxlIChI
Uy1GUykgc2lsaWNvbiB0byBvcHRpb25hbGx5IGN1c3RvbWl6ZSBrZXlzCj4gPiA+IGFuZCBlbmNy
eXB0aW9uIGZvciBzZWN1cml0eSBhcHBsaWNhdGlvbnMuCj4gPiA+IFRoaXMgcmVxdWlyZXMgZW5h
YmxpbmcgdGhlIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEVfSFNfRlMgb3B0aW9u
LAo+ID4gPiB3aGljaCwgaG93ZXZlciwgd2FzIGJ1Z2d5LiBUaGlzIHNlcmllcyBmaXhlcyB0aGUg
ZXJyb3JzIGFuZCBidW1wcyB0aGUgTGludXgKPiA+ID4ga2VybmVsIGFuZCBVLUJvb3QgcmVxdWly
ZWQgZm9yIHN1Y2ggYSBuZXcgZGV2aWNlLgo+ID4gPgo+ID4gPiBEYXJpbyBCaW5hY2NoaSAoMTcp
Ogo+ID4gPiAgIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnOiBmaXggQlIyX1RBUkdFVF9P
UFRFRV9PU19QTEFURk9STQo+ID4gPiAgICAgc2V0dGluZwo+ID4gPiAgIGNvbmZpZ3MvdGlfYW02
NHhfc2tfZGVmY29uZmlnOiBmaXggQlIyX1RBUkdFVF9PUFRFRV9PU19QTEFURk9STQo+ID4gPiAg
ICAgc2V0dGluZwo+ID4gPiAgIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnOiBleHBsaWNp
dGx5IHNldCB0aGUgdGktazMtcjUtbG9hZGVyCj4gPiA+ICAgICB2ZXJzaW9uCj4gPiA+ICAgY29u
Zmlncy90aV9hbTY0eF9za19kZWZjb25maWc6IGV4cGxpY2l0bHkgc2V0IHRoZSB0aS1rMy1yNS1s
b2FkZXIKPiA+ID4gICAgIHZlcnNpb24KPiA+ID4gICBib290L3RpLWszLXI1LWxvYWRlcjogYnVt
cCB0byB2ZXJzaW9uIDIwMjQuMDEKPiA+ID4gICBwYWNrYWdlL3B5dGhvbi1hdHRyczogYWRkIGhv
c3QgdmFyaWFudAo+ID4gPiAgIHBhY2thZ2UvcHl0aG9uLXJwZHMtcHk6IGFkZCBob3N0IHZhcmlh
bnQKPiA+ID4gICBwYWNrYWdlL3B5dGhvbi1yZWZlcmVuY2luZzogYWRkIGhvc3QgdmFyaWFudAo+
ID4gPiAgIHBhY2thZ2UvcHl0aG9uLWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnM6IGFkZCBob3N0
IHZhcmlhbnQKPiA+ID4gICBwYWNrYWdlL3B5dGhvbi1qc29uc2NoZW1hOiBhZGQgaG9zdCB2YXJp
YW50Cj4gPiA+ICAgYm9vdC90aS1rMy1yNS1sb2FkZXI6IHNldCBiaW5tYW4gZW52aXJvbm1lbnQK
PiA+ID4gICBib290L3Vib290OiBhZGQgQlIyX1RBUkdFVF9VQk9PVF9VU0VfQklOTUFOIG9wdGlv
bgo+ID4gPiAgIHBhY2thZ2UvdGktazM6IG1vdmUgVElfSzNfe1NFQ1RZUEUsU09DfSBvdXQgb2Yg
dGhlIGltYWdlLWdlbiBzY29wZQo+ID4gPiAgIHBhY2thZ2UvdGktazM6IGRpc2FibGUgSFMtRlMg
Zm9yIEFNNjUgU09DCj4gPiA+ICAgYm9vdC90aS1rMy90aS1rMy1yNS1sb2FkZXI6IGluc3RhbGwg
dGlib290My5iaW4KPiA+ID4gICBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZzogYnVtcCBV
LUJvb3QgdmVyc2lvbiB0byAyMDI0LjAxCj4gPiA+ICAgY29uZmlncy90aV9hbTYyeF9za19kZWZj
b25maWc6IGJ1bXAgTGludXggdmVyc2lvbiB0byA2LjYuMTcKPiA+Cj4gPiBJJ20gc29ycnkgZm9y
IG1pc2xlYWRpbmcgeW91IHdpdGggdGhlIHJlc3VsdHMgd2l0aCB2Ni4KPiA+IEkndmUgYnVpbHQg
djcgc2VyaWVzIGZvciBHUCBhbmQgaXQgcnVucyBmaW5lIG9uIFNLLUFNNjIgKEdQKS4KPiA+IFNl
ZW1zIEkndmUgbWVzc2VkIHVwIGVpdGhlciBib290IGRpcCBzd2l0Y2hlcyBpbml0aWFsbHkgb3Ig
dGhlIHNlcmlhbAo+ID4gY29uc29sZS4gVGhhbmtzIGZvciB5b3VyIGVmZm9ydHMhCj4gCj4gTmlj
ZSEKPiBUaGFuayB5b3UgZm9yIHlvdXIgdGVzdHMuCj4gCj4gVGhhbmtzIGFuZCByZWdhcmRzLAo+
IERhcmlvCj4gCj4gPgo+ID4gVGVzdGVkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRl
ci5zdmVyZGxpbkBnbWFpbC5jb20+Cj4gPgo+ID4gLS0KPiA+IEFsZXhhbmRlciBTdmVyZGxpbi4K
PiA+Cj4gCj4gCj4gLS0gCj4gCj4gRGFyaW8gQmluYWNjaGkKPiAKPiBTZW5pb3IgRW1iZWRkZWQg
TGludXggRGV2ZWxvcGVyCj4gCj4gZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20K
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gCj4gCj4gQW1hcnVsYSBT
b2x1dGlvbnMgU1JMCj4gCj4gVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5l
dG8sIElUCj4gCj4gVC4gKzM5IDA0MiAyNDMgNTMxMAo+IGluZm9AYW1hcnVsYXNvbHV0aW9ucy5j
b20KPiAKPiB3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
