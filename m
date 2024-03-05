Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26350C54798
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 07:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6A1340137;
	Tue,  5 Mar 2024 07:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIcDu1Z4wGFq; Tue,  5 Mar 2024 07:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AA6A41557
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AA6A41557;
	Tue,  5 Mar 2024 07:07:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 152901BF32A
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 07:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F48641557
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 07:07:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rBeRE3211Jc for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 07:07:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC8BA40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC8BA40137
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC8BA40137
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 07:07:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42577POo125724;
 Tue, 5 Mar 2024 01:07:25 -0600
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42577Pnt003027
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Mar 2024 01:07:25 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 01:07:24 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 01:07:24 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42577Ope042219;
 Tue, 5 Mar 2024 01:07:24 -0600
Date: Tue, 5 Mar 2024 01:07:24 -0600
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240305070724.4qveiubco6knoioa@dasso>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
 <20240301133620.3547430-16-dario.binacchi@amarulasolutions.com>
 <d7921628-c7ad-4de1-b131-dd0b895200c5@smile.fr>
 <CABGWkvoW80Lr0Y_8yn0S5TxvBjcHrPvdhOK4Rt4qxhNx0JwzJg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvoW80Lr0Y_8yn0S5TxvBjcHrPvdhOK4Rt4qxhNx0JwzJg@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1709622445;
 bh=O51zT2e8IR9RUlieJcBz8Zkypa7pdq6zoH3s1cNcdlg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Op2B708+93DnUy6VRp/2s05kZ/esD97A/kFEh4KQqmROSWLkDS/n21FPAF7VptRLZ
 69NPmPSKzjMfFEfUko3y8qoOOv2v7zw8OgngoA1lC6rHxQHH2Ucjo7dEpM0OGXTHhn
 rPeC69Fl1hbpwm5S9dIcCrW7ez1XC7BsOyPwV1Eg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Op2B708+
Subject: Re: [Buildroot] [PATCH v8 15/23] boot/ti-k3/ti-k3-r5-loader:
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

SGkgRGFyaW8sIFJvbWFpbiwKCk9uIFN1biwgTWFyIDAzLCAyMDI0IGF0IDEwOjU0OjA5QU0gKzAx
MDAsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IEhlbGxvIFJvbWFpbiwKPiAKPiBPbiBTdW4sIE1h
ciAzLCAyMDI0IGF0IDEyOjAz4oCvQU0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUu
ZnI+IHdyb3RlOgo+ID4KPiA+IEhlbGxvIERhcmlvLAo+ID4KPiA+IExlIDAxLzAzLzIwMjQgw6Ag
MTQ6MzYsIERhcmlvIEJpbmFjY2hpIGEgw6ljcml0IDoKPiA+ID4gUmVjZW50IHZlcnNpb25zIG9m
IFUtQm9vdCBhcmUgY2FwYWJsZSBvZiBidWlsZGluZyB0aWJvb3QzLmJpbiB1c2luZwo+ID4gPiBC
aW5tYW4uIEluIHRoaXMgY2FzZSwgbGV0J3MgY29weSBpdCB0byB0aGUgYmluYXJpZXMgZGlyZWN0
b3J5Lgo+ID4gPgo+ID4gPiBUaGUgdXNlIG9mIGBmaW5kJyBjb21tYW5kIGlzIGp1c3RpZmllZCBi
eSB0aGUgbmVlZCB0byB1c2UgYSByZWdleAo+ID4gPiBleHByZXNzaW9uIHRvIHNlbGVjdCB0aGUg
Y29ycmVjdCBmaWxlLiBUaGlzIGlzIG5vdCBwb3NzaWJsZSB3aXRoIGEKPiA+ID4gc2ltcGxlIGBj
cCcgY29tbWFuZC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRh
cmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4gPgo+ID4gPiAtLS0KPiA+ID4K
PiA+ID4gQ2hhbmdlcyBpbiB2ODoKPiA+ID4gLSBVc2UgdGhlIGBmaW5kJyBjb21tYW5kIGluIHBp
cGUgd2l0aCB0aGUgYGNwJyBjb21tYW5kLgo+ID4gPgo+ID4gPiBDaGFuZ2VzIGluIHY2Ogo+ID4g
PiAtIFJlcGxhY2UgYGZpbmQnIGNvbW1hbmQgd2l0aCBgY3AnIG9uZS4KPiA+ID4KPiA+ID4gQ2hh
bmdlcyBpbiB2NToKPiA+ID4gLSBSZXBsYWNlIHRpYm9vdDMtKi0kKFRJX0szX1I1X0xPQURFUl9T
RUNUWVBFKS0qLmJpbiB3aXRoCj4gPiA+ICAgdGlib290My0kKFRJX0szX1I1X0xPQURFUl9TT0Mp
LSQoVElfSzNfUjVfTE9BREVSX1NFQ1RZUEUpLSouYmluCj4gPiA+Cj4gPiA+IEFkZGVkIGluIHY0
Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2No
aUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBib290L3RpLWszLXI1LWxv
YWRlci90aS1rMy1yNS1sb2FkZXIubWsgfCA0ICsrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUtbG9h
ZGVyL3RpLWszLXI1LWxvYWRlci5tayBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxv
YWRlci5tawo+ID4gPiBpbmRleCBmZGIwNThmM2I3MmEuLjlhMDVkMDA1MDY3YSAxMDA2NDQKPiA+
ID4gLS0tIGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gPiA+ICsr
KyBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ID4gPiBAQCAtNzAs
OCArNzAsMTIgQEAgZGVmaW5lIFRJX0szX1I1X0xPQURFUl9CVUlMRF9DTURTCj4gPiA+ICAgICAg
ICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAkKFRJX0szX1I1X0xPQURFUl9NQUtFKSAtQyAkKEBE
KSAkKFRJX0szX1I1X0xPQURFUl9NQUtFX09QVFMpCj4gPiA+ICBlbmRlZgo+ID4gPgo+ID4gPiAr
VElfSzNfUjVfTE9BREVSX1NFQ1RZUEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfVElf
SzNfU0VDVFlQRSkpCj4gPiA+ICtUSV9LM19SNV9MT0FERVJfU09DID0gJChjYWxsIHFzdHJpcCwk
KEJSMl9QQUNLQUdFX1RJX0szX1NPQykpCj4gPiA+ICsKPiA+ID4gIGRlZmluZSBUSV9LM19SNV9M
T0FERVJfSU5TVEFMTF9JTUFHRVNfQ01EUwo+ID4gPiAgICAgICBjcCAkKEBEKS9zcGwvdS1ib290
LXNwbC5iaW4gJChCSU5BUklFU19ESVIpL3I1LXUtYm9vdC1zcGwuYmluCj4gPiA+ICsgICAgIGNk
ICQoQEQpOyBmaW5kIC4vIC10eXBlIGYgLXJlZ2V4ICJcLlwvdGlib290My0kKFRJX0szX1I1X0xP
QURFUl9TT0MpLSQoVElfSzNfUjVfTE9BREVSX1NFQ1RZUEUpLVteLV0qLi5iaW4iIC1leGVjIGNw
IHt9ICQoQklOQVJJRVNfRElSKS90aWJvb3QzLmJpbiBcOwo+ID4KPiA+IEkgYmVsaWV2ZSB0aGVy
ZSBpcyBtaXNzaW5nIHN0ZXAgaGVyZSBmb3IgdGhlIEFNNjUgdmFyaWFudCAodXNpbmcgc3BsaXQg
YmluYXJ5Cj4gPiBiYXNlZCBCb290IEZsb3cpIFsxXS4KPiA+Cj4gPiBXaXRoIHRoZSB0aS1rMy1p
bWFnZS1nZW4gcmVtb3ZhbCwgd2UgbmVlZCB0byBjb3B5IHN5c2Z3Ki5pdGIgZ2VuZXJhdGVkIGJ5
IGJpbm1hbgo+ID4gKHRpLWszLXI1LWxvYWRlcikgb3RoZXJ3aXNlIHRoZSBzeXN0ZW0gd29uJ3Qg
Ym9vdC4KCkNvcnJlY3QsIGdvb2QgY2F0Y2ggUm9tYWluLgoKPiA+IFRvbyBiYWQgdGhhdCB3ZSBk
b24ndCBoYXZlIGEgQU02NSBkZWZjb25maWcgZm9yIHRlc3RpbmcuCj4gPiBBbmRyZWFzLCBEbyB5
b3UgdGhpbmsgeW91IGNhbiBjb250cmlidXRlIGEgbmV3IGRlZmNvbmZpZyBmb3IgdGhlIFRNRFg2
NTRJREtFVk0gPwo+ID4KPiA+IE9uIG15IHNpZGUsIEkgaGF2ZSBhIHBhdGNoIHNlcmllcyBmb3Ig
dGhlIFNLLVREQTRWTSB0aGF0IGFsc28gcmVxdWlyZXMKPiA+IHN5c2Z3Ki5pdGIgYmluYXJ5LgoK
Um9tYWluLCBXb3VsZCB5b3UgbWluZCByb2xsaW5nIHRoaXMgJ2NwJyBhZGRpdGlvbiBpbnRvIHlv
dXIgdXBjb21pbmcKSjcyMUUqIHZhcmlhbnQgc2VyaWVzPyAgU2luY2UgaXQncyB0aGUgc2FtZSBi
b290IGFyY2hpdGVjdHVyZSBJIHRoaW5rCnRoYXQgd291bGQgYmUgYSBnb29kIGNvbWJpbmF0aW9u
LCBhbmQgdGhpcyB3YXkgeW91IGNhbiBtYWtlIHN1cmUgaXQKcmVhbGx5IHdvcmtzIGZvciB5b3Uu
CgpUaGVuLCBhcyBhIGZvbGxvdy11cCwgSSB3b3VsZCB0aGVuIGxpa2UgdG8gcHJlcGFyZS90ZXN0
IGFuIEFNNjUKZGVmY29uZmlnIGFuZCByZWxhdGVkIGJvYXJkIHN1cHBvcnQgYW5kIHN1Ym1pdCBp
dCB1cHN0cmVhbS4gSSBmZWVsCkkgcmVhbGx5IHdhbnQgdG8gdGFrZSB0aGlzIG9uIHNpbmNlIEkg
Y29uc2lkZXIgQU02NSB0byBiZSAibXkgYmFieSIgKEkKd2FzIHRoZSBmaXJzdCB0byBpbnRlZ3Jh
dGUvZGVidWcvYnJpbmd1cCBhbmQgc3VjY2Vzc2Z1bGx5IGV4ZWN1dGUgdGhlCmZ1bGwgUk9NLT5V
LUJvb3QtPkxpbnV4IGJvb3QgZmxvdyBiZWZvcmUgd2UgZXZlbiBoYWQgc2lsaWNvbi4uLjopCgpU
aGFua3MsIEFuZHJlYXMKCi0tCkFuZHJlYXMgRGFubmVuYmVyZwpUZXhhcyBJbnN0cnVtZW50cyBJ
bmMKCj4gPgo+ID4gWzFdIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRy
b290LzIwMjQtRmVicnVhcnkvNjg1NjY2Lmh0bWwKPiAKPiBDYW4gd2UsIGZvciBub3csIGNvbnNp
ZGVyIHRoaXMgbW9kaWZpY2F0aW9uIHVubmVjZXNzYXJ5LCBtZXJnZSB0aGUKPiBzZXJpZXMsIGFu
ZCBwcm9jZWVkIGxhdGVyCj4gd2l0aCBhbnkgZnVydGhlciBpbXByb3ZlbWVudHM/IEVzcGVjaWFs
bHkgY29uc2lkZXJpbmcgdGhhdCB0aGVyZSBpc24ndAo+IGN1cnJlbnRseSBhIGNvbmZpZ3VyYXRp
b24KPiBmb3IgYW02NSBpbiBCdWlsZHJvb3Q/Cj4gCj4gVGhhbmtzIGFuZCByZWdhcmRzLAo+IERh
cmlvCj4gCj4gPgo+ID4gQmVzdCByZWdhcmRzLAo+ID4gUm9tYWluCj4gPgo+ID4KPiA+ID4gIGVu
ZGVmCj4gPiA+Cj4gPiA+ICAkKGV2YWwgJChrY29uZmlnLXBhY2thZ2UpKQo+ID4KPiAKPiAKPiAt
LSAKPiAKPiBEYXJpbyBCaW5hY2NoaQo+IAo+IFNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9w
ZXIKPiAKPiBkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiAKPiAKPiBBbWFydWxhIFNvbHV0aW9ucyBTUkwK
PiAKPiBWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKPiAKPiBU
LiArMzkgMDQyIDI0MyA1MzEwCj4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+IAo+IHd3dy5h
bWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
