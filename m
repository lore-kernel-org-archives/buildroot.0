Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6839FC4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 23:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA21C4211F;
	Wed,  6 Dec 2023 23:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA21C4211F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y13k0dMpA50H; Wed,  6 Dec 2023 23:22:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFD9641E3A;
	Wed,  6 Dec 2023 23:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFD9641E3A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06E5A1BF275
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 23:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D11D43623
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 23:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D11D43623
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t99d0EelUL84 for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 23:22:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA81B400CE
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 23:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA81B400CE
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9CA8E0002;
 Wed,  6 Dec 2023 23:22:36 +0000 (UTC)
Date: Thu, 7 Dec 2023 00:22:35 +0100
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Message-ID: <20231207002235.406546b7@windsurf>
In-Reply-To: <AS1P250MB0608BD8803DA627E78F61E26A982A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <192a91$58bkb@mail.sensor-technik.de>
 <AS1P250MB0608FF5000E2423DEE2A893DA982A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 <20231130085541.519eb02b@windsurf>
 <AS1P250MB0608BD8803DA627E78F61E26A982A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1701904957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9PUkpaALGM9JB49hEskJn2p8fb1DK7Iwe8Yk1bKIFXI=;
 b=VPvkBZxHJg9uIHi5hUBtfOdriOpKI5WTnEjpCtmobPmuoAYKVwtYKo+Fp1Vp6CVlW/mVMR
 0KqkWSjM2t48TL89iqIvaER4yBm73Xrmlm6FSMrUN0yurNrcfp/NPaxClwXWfL+M4yFpfL
 e5nhVHr0Vd+2KvSrjhTDQjqGyOv1fv/ilowuWJTykWwKSsYHXZhRBtwP6lCTUItUZMMZg8
 QkED0DaGP0B+Pgo1FbZnrJWblV6NVx7vSo1okoKoDzxkBSgtfAvu1N7abeVHod7tD7eHtX
 I4GlWdNwzvciaSw9wRemRs2bRw9nBoEmCVnPXiqrxYsh8P/ov8PQFC6ZeA7Nsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VPvkBZxH
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2023-11-29
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleCwKClRoZSBiZXN0IHN0cmF0ZWd5IGlzIHRvIHJlbW92ZSB0aGUgc3R1cGlkIGFz
bSgibm9wIikgdGhhdCBhcmUgaW4gdGhpcwpsaWJyYXJ5IGNvZGUuCgpCZXN0IHJlZ2FyZHMsCgpU
aG9tYXMgUGV0YXp6b25pCgpPbiBUaHUsIDMwIE5vdiAyMDIzIDE0OjQzOjMzICswMDAwCk1pY2hl
bCBBbGV4IDxBbGV4Lk1pY2hlbEB3aWVkZW1hbm4tZ3JvdXAuY29tPiB3cm90ZToKCj4gSGVsbG8g
VGhvbWFzLAo+IAo+IHRoYW5rcyBmb3IgeW91ciByZXBseS4KPiAKPiBXaGF0IGlzIHRoZSBiZXN0
IHN0cmF0ZWd5IHRvIGZpeCB0aGlzIGJ1aWxkIGVycm9yPyBUbyBleGNsdWRlIGFyMWsgYXJjaGl0
ZWN0dXJlIGZvciB0aGlzIGxpYnJhcnkgKGRpc2FibGUgaXQgaWYgYXIxayBpcyBzZWxlY3RlZCkg
b3IgdG8gcHJvdmlkZSBhIHBhdGNoIHdoaWNoIGp1c3QgcmVtb3ZlcyB0aGUgY29ycmVzcG9uZGlu
ZyBsaW5lPwo+IAo+IEJlc3QgcmVnYXJkcywKPiBBbGV4Cj4gCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0KPiBGcm9tOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3Rs
aW4uY29tPiAKPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMzAsIDIwMjMgODo1NiBBTQo+IFRv
OiBNaWNoZWwgQWxleCA8QWxleC5NaWNoZWxAd2llZGVtYW5uLWdyb3VwLmNvbT4KPiBDYzogYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBTdWJqZWN0OiBSZTogW2F1dG9idWlsZC5idWlsZHJvb3Qu
bmV0XSBZb3VyIGRhaWx5IHJlc3VsdHMgZm9yIDIwMjMtMTEtMjkKPiAKPiBWb3JzaWNodDogRXMg
aGFuZGVsdCBzaWNoIHVtIGVpbmUgZXh0ZXJuZSBFLU1haWwgdm9tIEFic2VuZGVyIFRob21hcyBQ
ZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+LiBCaXR0ZSBrbGlja2VuIFNp
ZSBuaWNodCBhdWYgTGlua3Mgb2RlciBBbmjDpG5nZSwgc29sYW5nZSBTaWUgbmljaHQgdm9uIGRl
ciBFY2h0aGVpdCBkZXIgTmFjaHJpY2h0IMO8YmVyemV1Z3Qgc2luZC4KPiAKPiBIZWxsbyBBbGV4
LAo+IAo+IFRoZSBjb2RlIGluIGxpYnplbm9oLXBpY28gaXMgc3R1cGlkOgo+IAo+IHNpemVfdCBf
el9lbmRwb2ludF9jb25maWdfc3RybGVuKGNvbnN0IF96X3N0cl9pbnRtYXBfdCAqcywgY29uc3Qg
Y2hhciAqcHJvdG8pIHsKPiAgICAgc2l6ZV90IGxlbiA9IDA7Cj4gCj4gICAgIC8vIENhbGwgdGhl
IHJpZ2h0IGNvbmZpZ3VyYXRpb24gcGFyc2VyIGRlcGVuZGluZyBvbiB0aGUgcHJvdG9jb2wgI2lm
IFpfTElOS19UQ1AgPT0gMQo+ICAgICBpZiAoX3pfc3RyX2VxKHByb3RvLCBUQ1BfU0NIRU1BKSA9
PSB0cnVlKSB7Cj4gICAgICAgICBsZW4gPSBfel90Y3BfY29uZmlnX3N0cmxlbihzKTsKPiAgICAg
fSBlbHNlCj4gI2VuZGlmCj4gI2lmIFpfTElOS19VRFBfVU5JQ0FTVCA9PSAxIHx8IFpfTElOS19V
RFBfTVVMVElDQVNUID09IDEKPiAgICAgICAgIGlmIChfel9zdHJfZXEocHJvdG8sIFVEUF9TQ0hF
TUEpID09IHRydWUpIHsKPiAgICAgICAgIGxlbiA9IF96X3VkcF9jb25maWdfc3RybGVuKHMpOwo+
ICAgICB9IGVsc2UKPiAjZW5kaWYKPiAjaWYgWl9MSU5LX0JMVUVUT09USCA9PSAxCj4gICAgICAg
ICBpZiAoX3pfc3RyX2VxKHByb3RvLCBCVF9TQ0hFTUEpID09IHRydWUpIHsKPiAgICAgICAgIGxl
biA9IF96X2J0X2NvbmZpZ19zdHJsZW4ocyk7Cj4gICAgIH0gZWxzZQo+ICNlbmRpZgo+ICNpZiBa
X0xJTktfU0VSSUFMID09IDEKPiAgICAgICAgIGlmIChfel9zdHJfZXEocHJvdG8sIFNFUklBTF9T
Q0hFTUEpID09IHRydWUpIHsKPiAgICAgICAgIGxlbiA9IF96X3NlcmlhbF9jb25maWdfc3RybGVu
KHMpOwo+ICAgICB9IGVsc2UKPiAjZW5kaWYKPiAjaWYgWl9MSU5LX1dTID09IDEKPiAgICAgICAg
IGlmIChfel9zdHJfZXEocHJvdG8sIFdTX1NDSEVNQSkgPT0gdHJ1ZSkgewo+ICAgICAgICAgbGVu
ID0gX3pfd3NfY29uZmlnX3N0cmxlbihzKTsKPiAgICAgfSBlbHNlCj4gI2VuZGlmCj4gICAgIHsK
PiAgICAgICAgIF9fYXNtX18oIm5vcCIpOwo+ICAgICB9Cj4gCj4gICAgIHJldHVybiBsZW47Cj4g
fQo+IAo+IFNlZSB0aGUgX19hc21fXygibm9wIikuIFRoaXMgaXMgY29tcGxldGVseSBzdHVwaWQu
IEl0IGFzc3VtZXMgZXZlcnkgQ1BVIGFyY2hpdGVjdHVyZSBpbiB0aGUgd29ybGQgaGFzIGEgQ1BV
IGluc3RydWN0aW9uIG5hbWVkICJub3AiLCB3aGljaCBvZiBjb3Vyc2UgaXMgbm90IHRydWUuIEkg
ZG9uJ3QgcmVhbGx5IHNlZSB3aGF0IHRoZXkgaGF2ZSBhZGRlZCB0aGF0LCBpdCByZWFsbHkgZG9l
c24ndCBtYWtlIHNlbnNlLiBJIGJlbGlldmUgdGhpcyBmaW5hbCAiZWxzZSIgYmxvY2sgc2hvdWxk
IGJlIGRyb3BwZWQgKGFzIHdlbGwgYXMgaW4gdGhlIG5leHQgZnVuY3Rpb24sIHRoYXQgdXNlcyB0
aGUgc2FtZSBwYXR0ZXJuKS4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCj4gVGhvbWFzCj4gCj4gT24g
VGh1LCAzMCBOb3YgMjAyMyAwNzozNDozNyArMDAwMAo+IE1pY2hlbCBBbGV4IDxBbGV4Lk1pY2hl
bEB3aWVkZW1hbm4tZ3JvdXAuY29tPiB3cm90ZToKPiAKPiA+IFRob21hcywKPiA+IAo+ID4gZG8g
eW91IGhhdmUgYW55IGlkZWEgaG93IHRvIGZpeCB0aGlzIGJ1aWxkIGVycm9yPwo+ID4gCj4gPiBF
cnJvcjogdW5yZWNvZ25pemVkIGluc3RydWN0aW9uIGBub3AnCj4gPiAKPiA+IEFsZXgKPiA+IAo+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFRob21hcyBQZXRhenpvbmkg
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gPiBTZW50OiBUaHVyc2RheSwgTm92ZW1i
ZXIgMzAsIDIwMjMgNzozOCBBTQo+ID4gVG86IE1pY2hlbCBBbGV4IDxBbGV4Lk1pY2hlbEB3aWVk
ZW1hbm4tZ3JvdXAuY29tPgo+ID4gU3ViamVjdDogW2F1dG9idWlsZC5idWlsZHJvb3QubmV0XSBZ
b3VyIGRhaWx5IHJlc3VsdHMgZm9yIDIwMjMtMTEtMjkKPiA+IAo+ID4gCj4gPiBIZWxsbywKPiA+
IAo+ID4gQXV0b2J1aWxkZXIgZmFpbHVyZXMKPiA+ID09PT09PT09PT09PT09PT09PT09Cj4gPiAK
PiA+IEJlbG93IGlzIGEgbGlzdCBvZiBidWlsZCBmYWlsdXJlcyByZXBvcnRlZCBieSB0aGUgQnVp
bGRyb290IGF1dG9idWlsZGVycyBpbiByZWxhdGlvbiB0byBwYWNrYWdlcyBvciBDUFUgYXJjaGl0
ZWN0dXJlcyB5b3UgYXJlIGluIGNoYXJnZSBvZi4KPiA+IFBsZWFzZSBoZWxwIHVzIGltcHJvdmlu
ZyB0aGUgcXVhbGl0eSBvZiBCdWlsZHJvb3QgYnkgaW52ZXN0aWdhdGluZyB0aG9zZSBidWlsZCBm
YWlsdXJlcyBhbmQgc2VuZGluZyBwYXRjaGVzIHRvIGZpeCB0aGVtLgo+ID4gCj4gPiBSZXN1bHRz
IGZvciB0aGUgJ21hc3RlcicgYnJhbmNoCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gPiAKPiA+IEJ1aWxkIGZhaWx1cmVzIHJlbGF0ZWQgdG8geW91ciBwYWNrYWdlczoKPiA+
IAo+ID4gICAgIGFyY2ggICAgIHwgICAgICAgICAgICAgcmVhc29uICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1cmwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAo+ID4gLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gLS0tLS0tLS0tLS0tLSst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLQo+ID4gLS0tLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4g
LS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLQo+ID4gLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ID4gLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSstLQo+ID4gLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LSstLS0tLS0KPiA+ICAgICBvcjFrICAgICB8ICAgIGxpYnplbm9oLXBpY28tMC4xMC4wLXJjICAg
ICB8IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzY2M2I2MzE4MTBiN2Uz
OTgyZjM1NTM5ZjVkMzg4Y2Y1ZTUwOTA2NTQKPiA+IAo+ID4gCj4gPiBUaGFua3MgZm9yIHlvdXIg
Y29udHJpYnV0aW9uIHRvIEJ1aWxkcm9vdCEKPiA+IAo+ID4gLS0KPiA+IGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldCAgCj4gCj4gCj4gCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1v
d25lciBhbmQgQ0VPLCBCb290bGluIEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcgYW5kIHRyYWluaW5nIGh0dHBzOi8vYm9vdGxpbi5jb20KCgoKLS0gClRob21hcyBQZXRhenpv
bmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
