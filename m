Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3D2C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 04:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE66D41C62;
	Wed, 13 Dec 2023 04:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE66D41C62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMdUbqtRI2Fy; Wed, 13 Dec 2023 04:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A507441D19;
	Wed, 13 Dec 2023 04:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A507441D19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8083A1BF21A
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 04:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5758B40103
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 04:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5758B40103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_FQJ0CTryPq for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 04:46:56 +0000 (UTC)
X-Greylist: delayed 941 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 13 Dec 2023 04:46:56 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 233F5400CE
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 233F5400CE
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 04:46:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BD4V8CW076158;
 Tue, 12 Dec 2023 22:31:08 -0600
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BD4V8FH119097
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 12 Dec 2023 22:31:08 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Dec 2023 22:31:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Dec 2023 22:31:08 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BD4V8ql015804;
 Tue, 12 Dec 2023 22:31:08 -0600
Date: Tue, 12 Dec 2023 22:31:08 -0600
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20231213043108.67wczb5kszs4scp3@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20230616002359.4139814-1-dannenberg@ti.com>
 <20230616002359.4139814-3-dannenberg@ti.com>
 <20230822122903.7502f8b6@windsurf>
 <14c91760-3a58-45ae-a4a0-7cfd6960e8fa@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14c91760-3a58-45ae-a4a0-7cfd6960e8fa@smile.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1702441868;
 bh=B3ZeqVqFFTz0Ik8QR6jg87BJxLuBq4Nlbc9ynMuv3k8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=suaDze0vC3obX4xZ4euNdVbdi+eB7B7ew6g2MQftGt2T/Zvmc7cdGAWQZaactB2h0
 aGOzlvNExy5xAH+PCnNS3/6CtypAOArWzR6x+QC2EF0kTpOoS11Ay5E/ig3LvWUdkQ
 vFK85+9Or4KPVXWYX1wL36pEK0H25lv4fpVrvxHQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=suaDze0v
Subject: Re: [Buildroot] [PATCH v8 02/10] boot/ti-k3-image-gen: new package
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
Cc: Andrew Davis <afd@ti.com>, Julien Olivain <ju.o@free.fr>,
 Xuanhao Shi <x-shi@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg via buildroot <buildroot@buildroot.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Andreas Dannenberg <dannenberg@ti.com>, Romain Naour <romain.naour@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRGVjZW1iZXIgMTIsIDIwMjMgdGh1cyBzYXlldGggUm9tYWluIE5hb3VyOgo+IEhlbGxvLAo+
IAo+IExlIDIyLzA4LzIwMjMgw6AgMTI6MjksIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9v
dCBhIMOpY3JpdMKgOgo+ID4gSGVsbG8gQW5kcmVhcywKPiA+IAo+ID4gT24gVGh1LCAxNSBKdW4g
MjAyMyAxOToyMzo1MSAtMDUwMAo+ID4gQW5kcmVhcyBEYW5uZW5iZXJnIHZpYSBidWlsZHJvb3Qg
PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPiA+IAo+ID4+IEZyb206IFh1YW5oYW8g
U2hpIDx4LXNoaUB0aS5jb20+Cj4gPj4KPiA+PiBUaGlzIGlzIHRoZSBpbWFnZSBnZW5lcmF0b3Ig
dGhhdCBidWlsZHMgdGhlIGluaXRpYWwgYm9vdCBiaW5hcnksCj4gPj4gdGlib290My5iaW4sIGZv
ciB0aGUgUjUgY29yZSBvbiBUSSdzIEszIGZhbWlseSBvZiBkZXZpY2VzLgo+ID4+IFRoaXMgcmVx
dWlyZXMgdGhlIFI1IFNQTCBvdXRwdXQgZnJvbSB0aGUgdGktazMtcjUtbG9hZGVyIHBhY2thZ2Uu
Cj4gPj4KPiA+PiBodHRwczovL2dpdC50aS5jb20vY2dpdC9rMy1pbWFnZS1nZW4vazMtaW1hZ2Ut
Z2VuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBYdWFuaGFvIFNoaSA8eC1zaGlAdGkuY29tPgo+
ID4+IFNpZ25lZC1vZmYtYnk6IEFuYW5kIEdhZGl5YXIgPGdhZGl5YXJAdGkuY29tPgo+ID4+IFNp
Z25lZC1vZmYtYnk6IEFuZHJlYXMgRGFubmVuYmVyZyA8ZGFubmVuYmVyZ0B0aS5jb20+Cj4gPj4g
UmV2aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5l
ZXJpbmcuY29tPgo+ID4+IEFja2VkLWJ5OiBBbmRyZXcgRGF2aXMgPGFmZEB0aS5jb20+Cj4gPj4g
VGVzdGVkLWJ5OiBCcnlhbiBCcmF0dGxvZiA8YmJAdGkuY29tPgo+ID4+IENjOiBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gPj4gUmV2aWV3ZWQtYnk6IEZyYW5jb2lzIFBl
cnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgo+ID4+IFJldmlld2VkLWJ5OiBKdWxpZW4g
T2xpdmFpbiA8anUub0BmcmVlLmZyPgo+ID4gCj4gPiBJIGhhdmUgYXBwbGllZCB0aGlzLCBidXQg
YWZ0ZXIgZG9pbmcgYSBsb3Qgb2YgY2hhbmdlcy4KPiAKPiBJbmRlZWQsIFRJIGszIGlzIHJlYWxs
eSBjb21wbGV4IHRvIGZvbGxvdy4KPiBJIGhhdmUgb24gcmVtYXJrIGJlbG93Lgo+IAoKLi4uCgo+
ID4gCj4gPiBJJ3ZlIGNoYW5nZWQgdGhpcyB3aG9sZSB0aGluZyB0byB1c2UgY2hvaWNlcyBmb3Ig
dGhlIFNvQyBhbmQgc2VjdXJpdHkKPiA+IHR5cGUuIEZvciB0aGUgImNvbmZpZyB0eXBlIiwgaXQg
d2FzIGFsd2F5cyAiZXZtIiBmb3Igbm93LCBhbmQgdGhlCj4gPiBmaXJtd2FyZSBmaWxlcyBvbmx5
IGV4aXN0IGZvciAiZXZtIiwgc28gSSBkcm9wcGVkIHRoaXMgb3B0aW9uIGFuZAo+ID4gc2ltcGx5
IGhhcmRjb2RlZCAiZXZtIiBpbiB0aGUgcGFja2FnZS4gSXQgY2FuIGFsd2F5cyBiZSByZXZpc2l0
ZWQgbGF0ZXIKPiA+IG9uLiBTbyBpdCBsb29rcyBsaWtlIHRoaXM6Cj4gPiAKPiA+ICtpZiBCUjJf
VEFSR0VUX1RJX0szX0lNQUdFX0dFTgo+ID4gK2Nob2ljZQo+ID4gKyAgICAgICBwcm9tcHQgIlNv
QyBmYW1pbHkiCj4gPiArCj4gPiArY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NP
Q19BTTYyQVgKPiA+ICsgICAgICAgYm9vbCAiYW02MmF4Igo+ID4gKwo+ID4gK2NvbmZpZyBCUjJf
VEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TT0NfQU02MlgKPiA+ICsgICAgICAgYm9vbCAiYW02Mngi
Cj4gPiArCj4gPiArY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQ19BTTY0WAo+
ID4gKyAgICAgICBib29sICJhbTY0eCIKPiA+ICsKPiA+ICtjb25maWcgQlIyX1RBUkdFVF9USV9L
M19JTUFHRV9HRU5fU09DX0FNNjVYCj4gPiArICAgICAgIGJvb2wgImFtNjV4Igo+IAo+IEkgZG9u
J3QgdGhpbmsgQU02NXggY2FuIGJ1aWxkIGhlcmUgZHVlIHRvIGEgdGktazMtaW1hZ2UtZ2VuIGNo
ZWNrIFsxXQo+IAo+IEluZGVlZCBBTTY1WCBTb0MgZG9lc24ndCBzdXBwb3J0ICJjb21iaW5lZCBi
b290IGltYWdlIiBzbyBpdCByZXF1aXJlcyB0byBub3QKPiBkZWZpbmUgU0JMIGltYWdlLgo+IAo+
IEkgYmVsZWl2ZSB3ZSBuZWVkIGFuIG9wdGlvbiB0byBleHBsaWNpdGVseSBzdXBwb3J0ICJjb21i
aW5lZCBib290IGZsb3cgb25seSBTb0MiCj4gb3IgImNvbWJpbmVkIGJvb3QgZmxvdyBub3Qgc3Vw
cG9ydGVkIGF0IGFsbCBieSB0aGUgU29DIiBvciAiY29tYmluZWQgb3IKPiBub24tY29tYmluZWQg
Ym9vdCBmbG93IHN1cHBvcnRlZCBieSB0aGUgU29DIgo+IAo+IFsxXQo+IGh0dHBzOi8vZ2l0LnRp
LmNvbS9jZ2l0L2szLWltYWdlLWdlbi9rMy1pbWFnZS1nZW4vdHJlZS9NYWtlZmlsZT9oPTA5LjAw
LjAwLjAwMSNuMTY0Cj4gCgpPbmUgb2YgdGhlIGNvb2xlciB0aGluZ3MgZnJvbSBVLUJvb3QgaXMg
dGhlIGJpbm1hbiBzeXN0ZW1bMF0gdGhhdCBhIGZldyAKVGknZXJzIGhhdmUgYmVlbiBwb3J0aW5n
IG1vc3Qgb2YgdGhpcyBzY3JpcHRpbmcgb3ZlciB0byB1dGlsaXplLiBNb3JlIAptb2Rlcm4gcmVs
ZWFzZXMgb2YgVS1Cb290IChpIHRoaW5rIDIwMjMuMDQgaWlyYykgc2hvdWxkbid0IG5lZWQgCmsz
LWltYWdlLWdlbiBhbnltb3JlLgoKQnV0IHllYWggdGhlIEo3MjFlIChCZWFnbGVCb25lIEFJNjQp
IHdpbGwgaGF2ZSB0aGlzIGlzc3VlIGFzIHdlbGwuCgo+ID4gKwo+ID4gK2VuZGNob2ljZQo+ID4g
Kwo+IAo+IFsuLi5dCj4gCj4gPiAKPiA+PiArCj4gPj4gKyMgVGhlIHRpLWszLWltYWdlLWdlbiBt
YWtlZmlsZXMgc2VlbSB0byBuZWVkIHNvbWUgZmVhdHVyZSBmcm9tIE1ha2UgdjQuMCwKPiA+PiAr
IyBzaW1pbGFyIHRvIHUtYm9vdC4gRXhwbGljaXRseSB1c2UgJChCUjJfTUFLRSkgaGVyZSwgYXMg
dGhlIGJ1aWxkCj4gPj4gKyMgb3RoZXJ3aXNlIGZhaWxzIHdpdGggc29tZSBtaXNsZWFkaW5nIGVy
cm9yIG1lc3NhZ2UuCj4gPj4gK1RJX0szX0lNQUdFX0dFTl9NQUtFID0gJChCUjJfTUFLRSkKPiA+
PiArVElfSzNfSU1BR0VfR0VOX01BS0VfT1BUUyA9IFwKPiA+PiArCVNPQz0kKFRJX0szX0lNQUdF
X0dFTl9TT0MpIFwKPiA+PiArCVNPQ19UWVBFPSQoVElfSzNfSU1BR0VfR0VOX1NPQ19UWVBFKSBc
Cj4gPj4gKwlDT05GSUc9JChUSV9LM19JTUFHRV9HRU5fQ09ORklHKSBcCj4gPj4gKwlDUk9TU19D
T01QSUxFPSQoSE9TVF9ESVIpL2Jpbi9hcm0tbm9uZS1lYWJpLSBcCj4gPj4gKwlTQkw9JChCSU5B
UklFU19ESVIpL3I1LXUtYm9vdC1zcGwuYmluIFwKPiA+PiArCU89JChARCkvdG1wIFwKPiA+PiAr
CUJJTl9ESVI9JChARCkKPiA+PiArCj4gPj4gK2RlZmluZSBUSV9LM19JTUFHRV9HRU5fQlVJTERf
Q01EUwo+ID4+ICsJJChUSV9LM19JTUFHRV9HRU5fTUFLRSkgLUMgJChARCkgJChUSV9LM19JTUFH
RV9HRU5fTUFLRV9PUFRTKQo+ID4+ICtlbmRlZgo+ID4gCj4gPiBUaGUgaW50ZXJtZWRpYXRlIHZh
cmlhYmxlcyB3ZXJlIG5vdCByZWFsbHkgdXNlZnVsLCBzbyBjaGFuZ2VkIHRvOgo+ID4gCj4gPiAr
ZGVmaW5lIFRJX0szX0lNQUdFX0dFTl9CVUlMRF9DTURTCj4gPiArICAgICAgICQoVEFSR0VUX01B
S0VfRU5WKSBcCj4gPiArICAgICAgICQoQlIyX01BS0UpIC1DICQoQEQpIFwKPiA+ICsgICAgICAg
ICAgICAgICBTT0M9JChUSV9LM19JTUFHRV9HRU5fU09DKSBcCj4gPiArICAgICAgICAgICAgICAg
U09DX1RZUEU9JChUSV9LM19JTUFHRV9HRU5fU0VDVFlQRSkgXAo+ID4gKyAgICAgICAgICAgICAg
IENPTkZJRz1ldm0gXAo+ID4gKyAgICAgICAgICAgICAgIENST1NTX0NPTVBJTEU9JChIT1NUX0RJ
UikvYmluL2FybS1ub25lLWVhYmktIFwKPiA+ICsgICAgICAgICAgICAgICBTQkw9JChCSU5BUklF
U19ESVIpL3I1LXUtYm9vdC1zcGwuYmluIFxTQkwgaW1hZ2UgaXMgZGVmaW5lZCBoZXJlLCBzbyBp
dCBjYW4ndCB3b3JrIGZvciBhbiBBTTY1WCBTb0MgKGxpa2UgZm9yIGo3MjFlCj4gU29DKSBiZWNh
dXNlIHRoZSBTb0MgY2Fubm90IGJ1aWxkIGNvbWJpbmVkIGJvb3QgaW1hZ2UgKFNCTCBtdXN0IG5v
dCBiZSBkZWZpbmVkKS4KPiAKPiBJIGhhdmUgYSBTSy1UREE0Vk0gYm9hcmQgKGo3MjFlIFNvQykg
YW5kIEknZCBsaWtlIHRvIHJld29yayB0aGVzZXMgdGktazMKPiBwYWNrYWdlcyBmb3IgdGhpcyBT
b0MgYnV0IGl0IGZhaWwgYmVmb3JlIHJlYWNoaW5nIHUtYm9vdCBvbiBBNzIgY29yZS4KCihXaGF0
IEkgZ2V0IGZvciByZXNwb25kaW5nIHdoaWxlIEkgcmVhZCkgWWVhaCB3ZSB3aWxsIGNyYXNoIHdo
ZW4gd2UKY2FuJ3QgbG9hZCB0aGUgZmlybXdhcmUgaW4gdGhlIHN5c2Z3Lml0YiBiaW5hcnkuIFRo
ZSBhbTY1eCBhbmQgajcyMWUgYXJlIAp0aGUgb25seSAyIEszIGdlbmVyYXRpb24gU29DcyB0byBs
b2FkIGZpcm13YXJlIHRoaXMgd2F5LCBtYWtpbmcgdGhlbSAKa2luZGEgYW5kIGVkZ2UgY2FzZS4K
Cj4gCj4gSSBob3BlIHRvIGhhdmUgc29tZSBzcGFyZSB0aW1lIHRvIHRha2UgYSBsb29rIGF0IHRo
ZSBpc3N1ZS4KPgoKV2hlbmV2ZXIgSSBmaW5kIHNvbWUgaWRsZSBjeWNsZXMgSSB3YW50ZWQgdG8g
c3RhcnQgcmV3b3JraW5nIHRoZSBVLUJvb3QgCmFuZCB0aGUgdGktazMtcjUtbG9hZGVyIHRvIHRh
a2UgYWR2YW50YWdlIG9mIGJpbm1hbi4KCkkgaGF2ZSBhIF92ZXJ5XyByb3VnaCBpZGVhIG9mIGhv
dyB0byBkbyB0aGlzIGFzIGFuIEJSMl9FWFRFUk5BTCB0cmVlIApoZXJlWzFdIGlmIHlvdSBuZWVk
IHNvbWV0aGluZyBub3cgYnV0IG15IGhvcGUgaXMgdG8gZ2V0IG15IGdhcmJhZ2UgCmNsZWFuZWQg
dXAgYW5kIG1lcmdlZCByYXRoZXIgdGhhbiBwcGwgc3RhcnQgdXNpbmcgd2hhdCBJIGhhdmUgOykK
ClswXWh0dHBzOi8vZG9jcy51LWJvb3Qub3JnL2VuL2xhdGVzdC9kZXZlbG9wL3BhY2thZ2UvYmlu
bWFuLmh0bWwjdXNpbmctYmlubWFuClsxXWh0dHBzOi8vZ2l0LnNyLmh0L35icnlhbmIvdGktYnVp
bGRyb290Cgp+QnJ5YW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
