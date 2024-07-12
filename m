Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB71C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72CA040C87;
	Fri, 12 Jul 2024 20:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVm194_x-ViO; Fri, 12 Jul 2024 20:39:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA1D3412F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA1D3412F5;
	Fri, 12 Jul 2024 20:39:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75EEB1BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62B80412F5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bialCs2xN7J for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:39:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2C9340C87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2C9340C87
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2C9340C87
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:39:36 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46CKdZ0a130198;
 Fri, 12 Jul 2024 15:39:35 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46CKdZQH008846
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Jul 2024 15:39:35 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 Jul 2024 15:39:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 Jul 2024 15:39:34 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46CKdYDe082967;
 Fri, 12 Jul 2024 15:39:34 -0500
Date: Fri, 12 Jul 2024 15:39:34 -0500
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240712203934.zbqkteq4ggtkat4f@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240711060531.4067193-1-p-bhagat@ti.com>
 <e0c35138-a12c-42e3-9c7e-1eb9113b001e@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0c35138-a12c-42e3-9c7e-1eb9113b001e@smile.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1720816775;
 bh=KQO88ETijFqwNTk4yDxsUv6oHMMf+phMFil9psLhohM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=fQbjAhpgdwGG+rkQm2QIW4dDhRkEf4HqUVX7TF70Ys3adklK7XkX4IkBKcgxJhzRL
 I7dEQXfXBnW2J0zzpWtpDoNgSLlzLW8d5UWe0Uyaek7bQLcGmfOFcRY4CsrqRXjNQb
 t2T8+bmHETiom9yKdvlyN831pXaV9jP2v0opFORc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=fQbjAhpg
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
Cc: Chirag Shilwant <c-shilwant@ti.com>, Gyan Gupta <g-gupta@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, Paresh Bhagat <p-bhagat@ti.com>,
 Syed Mohammed Khasim <khasim@ti.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>,
 Sai Sree Kartheek Adivi <s-adivi@ti.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gSnVseSAxMiwgMjAyNCB0aHVzIHNheWV0aCBSb21haW4gTmFvdXIgdmlhIGJ1aWxkcm9vdDoK
PiBIZWxsbyBQYXJlc2gsIEFsbCwKPiAKPiBMZSAxMS8wNy8yMDI0IMOgIDA4OjA1LCBQYXJlc2gg
QmhhZ2F0IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiA+IFByZXZpb3VzbHkgdGhlIHZlcnNp
b24gb2YgdGktazMtYm9vdC1maXJtd2FyZSAoVElfSzNfQk9PVF9GSVJNV0FSRV9WRVJTSU9OKSB3
YXMKPiA+IGZpeGVkIGluIG1rIGZpbGUuIEludHJvZHVjZSBhIG5ldyBjb25maWcgb3B0aW9uIEJS
Ml9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTgo+ID4gc28gdGhhdCB1
c2VyIGNhbiBjaGFuZ2UgdGhlIHZlcnNpb24gZm9yIHRpLWszLWJvb3QtZmlybXdhcmUgdXNpbmcg
bWVudWNvbmZpZy4KPiA+IAo+ID4gVGhpcyBwcm92aWRlcyBncmVhdGVyIGZsZXhpYmlsaXR5IGZv
ciB1c2VycyB0byBzZWxlY3QgZGlmZmVyZW50IHZlcnNpb25zIG9mCj4gPiB0aS1rMy1ib290LWZp
cm13YXJlIHdpdGhvdXQgbW9kaWZ5aW5nIHRoZSBidWlsZCBzY3JpcHQgZGlyZWN0bHkuCj4gCj4g
SXMgdGhlIG1haW4gcmVhc29uIHRvIGFkZCBhbiBvcHRpb24gdG8gc3BlY2lmeSB0aGUgdGktazMt
Ym9vdC1maXJtd2FyZSB2ZXJzaW9uCj4gaXMgYmVjYXVzZSBpdCBtdXN0IG1hdGNoIGV4YWN0bHkg
d2l0aCB0aGUgc2VsZWN0ZWQgdS1ib290IG9yIHRpLWszLXI1LWxvYWRlcgo+IHZlcnNpb24gZHVl
IHRvIHRoZSBUSS1TQ0kgcHJvdG9jb2wgYW5kIHRoZSBETVNDIHByZWJ1aWx0IGZpcm13YXJlIGJp
bmFyeQo+IChwcm92aWRlZCBieSBUSSkgKERNU0MgaXMgdGhlIFNlY3VyaXR5IE1hbmFnZXIgQ29y
ZSBpbiB0aGUgU29DKT8KPiAKClRoZSBUSS1TQ0kgcHJvdG9jb2wgd2lsbCBhbHdheXMgYmUgYmFj
a3dhcmQgY29tcGF0aWJsZS4gVGhlcmUgc2hvdWxkIGJlIApubyB3b3JyaWVzIGFib3V0IHVzaW5n
IGFuIG9sZGVyIFRJRlMvRE0vRE1TQyBmaXJtd2FyZSB3aXRoIG5ld2VyIGtlcm5lbHMgCmFuZCBi
b290bG9hZGVycyBhbmQgYW55IGVycm9ycyBhbnlvbmUgc2VlcyBzaG91bGQgYmUgcmVwb3J0ZWQg
dG8gVEkgc28gCml0IGNhbiBiZSBhZGRyZXNzZWQuCgpJdCBnZXRzIGEgbGl0dGxlIHdlaXJkIHdp
dGggdGhlIFRJRlMgPC0+IERNIGNvbW11bmljYXRpb24gc28gaXQncyAKcmVjb21tZW5kZWQgdG8g
a2VlcCB0aG9zZSBpbiBzeW5jLiBJIGhhdmVuJ3Qgc2VlbiBhbnkgaXNzdWVzIGJ1dCB0aGF0IApk
b2Vzbid0IG1lYW4gdGhleSBkb24ndCBleGlzdC4KCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBh
cmVzaCBCaGFnYXQgPHAtYmhhZ2F0QHRpLmNvbT4KPiA+IAo+ID4gLS0tCj4gPiBDaGFuZ2VzIHYz
IC0+IHY0Ogo+ID4gICAtIFRpIGszIC0+IFRJIEszIChTdWdnZXN0ZWQgYnkgQW5kcmVhcyBEYW5u
ZW5iZXJnKQo+ID4gICAtIGdpdC50aS5vcmcgLT4gZ2l0LnRpLmNvbSAoU3VnZ2VzdGVkIGJ5IEFu
ZHJlYXMgRGFubmVuYmVyZykKPiA+IAo+ID4gQ2hhbmdlcyB2MiAtPiB2MzoKPiA+ICAgLSBmbGV4
aWJpbHR5IC0+IGZsZXhpYmlsaXR5IChTdWdnZXN0ZWQgYnkgQ2hpcmFnIFNoaWx3YW50KQo+ID4g
Cj4gPiBDaGFuZ2VzIHYxIC0+IHYyOgo+ID4gICAtIEZpeCB3aGl0ZXNwYWNlcy9pbmRlbnRhdGlv
biBpbiBDb25maWcuaW4gZmlsZSAoU3VnZ2VzdGVkIGJ5IEJyeWFuIEJyYXR0bG9mKQo+ID4gCj4g
PiAtLS0KPiA+ICBib290L3RpLWszLWJvb3QtZmlybXdhcmUvQ29uZmlnLmluICAgICAgICAgICAg
fCAzMCArKysrKysrKysrKysrKysrKysrCj4gPiAgLi4uL3RpLWszLWJvb3QtZmlybXdhcmUubWsg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMt
Ym9vdC1maXJtd2FyZS9Db25maWcuaW4gYi9ib290L3RpLWszLWJvb3QtZmlybXdhcmUvQ29uZmln
LmluCj4gPiBpbmRleCBkODBiYjRiZGIzLi41ODFlYzBjM2I5IDEwMDY0NAo+ID4gLS0tIGEvYm9v
dC90aS1rMy1ib290LWZpcm13YXJlL0NvbmZpZy5pbgo+ID4gKysrIGIvYm9vdC90aS1rMy1ib290
LWZpcm13YXJlL0NvbmZpZy5pbgo+ID4gQEAgLTUsMyArNSwzMyBAQCBjb25maWcgQlIyX1RBUkdF
VF9USV9LM19CT09UX0ZJUk1XQVJFCj4gPiAgCSAgVGhpcyBwYWNrYWdlIGRvd25sb2FkcyBhbmQg
aW5zdGFsbHMgdGhlIFRJLXNwZWNpZmljIHRpLXN5c2Z3Cj4gPiAgCSAgYW5kIHRpLWRtIGZpcm13
YXJlIG5lZWRlZCB0byBib290IFRJIEszIHBsYXRmb3JtcyAod2hpY2gKPiA+ICAJICBpbmNsdWRl
IEFNNjJ4LCBBTTY0eCwgQU02NXggYW5kIG1vcmUpLgo+ID4gKwo+ID4gK2lmIEJSMl9UQVJHRVRf
VElfSzNfQk9PVF9GSVJNV0FSRQo+ID4gK2Nob2ljZQo+ID4gKwlwcm9tcHQgInRpLWszLWJvb3Qt
ZmlybXdhcmUgdmVyc2lvbiIKPiA+ICsJZGVmYXVsdCBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklS
TVdBUkVfTEFURVNUX1ZFUlNJT04KPiA+ICsJaGVscAo+ID4gKwkgIFNlbGVjdCB0aGUgdmVyc2lv
biBvZiBUSSBLMyBib290IGZpcm13YXJlIHlvdSB3YW50IHRvIHVzZS4KPiA+ICsKPiA+ICtjb25m
aWcgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0xBVEVTVF9WRVJTSU9OCj4gPiArCWJv
b2wgIjA5LjAyLjAwLjAwOSIKPiA+ICsKPiA+ICtjb25maWcgQlIyX1RBUkdFVF9USV9LM19CT09U
X0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OCj4gPiArCWJvb2wgIkN1c3RvbSB2ZXJzaW9uIgo+ID4g
KwloZWxwCj4gPiArCSAgVGhpcyBvcHRpb24gYWxsb3dzIHRvIHVzZSBhIHNwZWNpZmljIG9mZmlj
aWFsIHZlcnNpb24gZnJvbQo+ID4gKwkgIGdpdC50aS5jb20uCj4gCj4gV2hlbiB5b3UgdXNlIHRo
aXMgb3B0aW9uLCB5b3UgbmVlZCB0byBkaXNhYmxlIHRoZSBoYXNoIGNoZWNraW5nIHdpdGg6Cj4g
Cj4gQlJfTk9fQ0hFQ0tfSEFTSF9GT1IgKz0gJChUSV9LM19CT09UX0ZJUk1XQVJFX1NPVVJDRSkK
PiAKPiBPdGhlcndpc2UgeW91IGdldDoKPiAKPiBFUlJPUjogTm8gaGFzaCBmb3VuZCBmb3IgdGkt
bGludXgtZmlybXdhcmUtMTAuMDAuMDUudGFyLnh6Cj4gCj4gU2VlIGhvdyBpdCdzIGRvbmUgZm9y
IHRpLWszLXI1LWxvYWRlcjoKPiAKPiBpZmVxICgkKEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVS
KSQoQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfTEFURVNUX1ZFUlNJT04pLHkpCj4gQlJfTk9f
Q0hFQ0tfSEFTSF9GT1IgKz0gJChUSV9LM19SNV9MT0FERVJfU09VUkNFKQo+IGVuZGlmCj4gCgpB
aCB5ZWFoIGFuZCB3ZSBzaG91bGQgcHJvYmFibHkgYWRkIHRoZSBjb3JyZXNwb25kaW5nIGhhc2gg
ZmlsZXMgaW4gdGhlIApib2FyZCBkaXJlY3Rvcnkgb2YgdGhlIGJvYXJkcyB3aG8gdXNlIHRoaXMg
Zm9yIHdoZW4gdGhpcyB2ZXJzaW9uIApjaGFuZ2VzLiBPb3BzCgp+QnJ5YW4KCj4gQmVzdCByZWdh
cmRzLAo+IFJvbWFpbgo+IAo+IAo+ID4gKwo+ID4gK2VuZGNob2ljZQo+ID4gKwo+ID4gK2NvbmZp
ZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUUKPiA+
ICsJc3RyaW5nICJDdXN0b20gdGktazMtYm9vdC1maXJtd2FyZSB2ZXJzaW9uIgo+ID4gKwlkZXBl
bmRzIG9uIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTgo+ID4g
Kwo+ID4gK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfVkVSU0lPTgo+ID4g
KwlzdHJpbmcKPiA+ICsJZGVmYXVsdCAiMDkuMDIuMDAuMDA5IiAgICAgaWYgQlIyX1RBUkdFVF9U
SV9LM19CT09UX0ZJUk1XQVJFX0xBVEVTVF9WRVJTSU9OCj4gPiArCWRlZmF1bHQgQlIyX1RBUkdF
VF9USV9LM19CT09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFIFwKPiA+ICsJCQkJaWYg
QlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OCj4gPiArCj4gPiAr
ZW5kaWYKPiA+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLWJvb3QtZmlybXdhcmUvdGktazMtYm9v
dC1maXJtd2FyZS5tayBiL2Jvb3QvdGktazMtYm9vdC1maXJtd2FyZS90aS1rMy1ib290LWZpcm13
YXJlLm1rCj4gPiBpbmRleCA5MzMyNzMyYWQ0Li4zNTAzODFlYmJlIDEwMDY0NAo+ID4gLS0tIGEv
Ym9vdC90aS1rMy1ib290LWZpcm13YXJlL3RpLWszLWJvb3QtZmlybXdhcmUubWsKPiA+ICsrKyBi
L2Jvb3QvdGktazMtYm9vdC1maXJtd2FyZS90aS1rMy1ib290LWZpcm13YXJlLm1rCj4gPiBAQCAt
NCw3ICs0LDcgQEAKPiA+ICAjCj4gPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ICAKPiA+
IC1USV9LM19CT09UX0ZJUk1XQVJFX1ZFUlNJT04gPSAwOS4wMi4wMC4wMDkKPiA+ICtUSV9LM19C
T09UX0ZJUk1XQVJFX1ZFUlNJT04gPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19C
T09UX0ZJUk1XQVJFX1ZFUlNJT04pKQo+ID4gIFRJX0szX0JPT1RfRklSTVdBUkVfU0lURSA9IGh0
dHBzOi8vZ2l0LnRpLmNvbS9jZ2l0L3Byb2Nlc3Nvci1maXJtd2FyZS90aS1saW51eC1maXJtd2Fy
ZS9zbmFwc2hvdAo+ID4gIFRJX0szX0JPT1RfRklSTVdBUkVfU09VUkNFID0gdGktbGludXgtZmly
bXdhcmUtJChUSV9LM19CT09UX0ZJUk1XQVJFX1ZFUlNJT04pLnRhci54ego+ID4gIFRJX0szX0JP
T1RfRklSTVdBUkVfSU5TVEFMTF9JTUFHRVMgPSBZRVMKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
