Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452F9C4332F
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 15:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D532040376;
	Wed,  9 Nov 2022 15:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D532040376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZCWUg8fv8fI; Wed,  9 Nov 2022 15:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D303C4048D;
	Wed,  9 Nov 2022 15:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D303C4048D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A96BF1BF29A
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 15:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 778AD607C1
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 15:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 778AD607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pgtKYT4l9I7U for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 15:54:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F98E607BC
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F98E607BC
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 15:54:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 189A1C695A
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 15:48:44 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D742640003;
 Wed,  9 Nov 2022 15:48:37 +0000 (UTC)
Date: Wed, 9 Nov 2022 16:48:36 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20221109164836.60da738e@booty>
In-Reply-To: <CC27D304-488B-42BA-88F5-0B13A7FEC403@amd.com>
References: <20221109155621.4af7f270@booty>
 <CC27D304-488B-42BA-88F5-0B13A7FEC403@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668008918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNNULyuHcd40rMsmcgGJ6LYvzSf4quV/mfANt0NrlQw=;
 b=o0HcIFUw63OlgQ03KGMj2kMA7/BrpdZSMmfULwut1N7DGveOk8TgdYyYNvnul6kFEH8D6K
 csIalSBsTJCC6ImritlOeJ+PwzGJcztgMYDctchnWajmEpyT7ZjPvakkdW0zzOJ3yCbMg8
 uxtmWEj3f1c9u+6/5sp5XRo+Bj4tlCar2lWYJU05TFejk9SYYKzCCEw3k5yfyXX/8NCkeR
 CPE+Kzn02miFHjUDx5rD7HpJ2DRyq+GxygHmWcNPOZSvpLYSirEByRo/d69b8BRalYAMJ0
 pm2t7kIYoH/kX3XSoKblXsxhvFLjo3efpv1q7zsUQE6dICYElMC2Al3m6NwLYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o0HcIFUw
Subject: Re: [Buildroot] [PATCH v4 2/2] configs/versal_vck190: new defconfig
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "O'Neal,
 Terry" <terry.oneal@amd.com>, "Chaplin, Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCA5IE5vdiAyMDIyIDE1OjEwOjI3ICswMDAwCiJGcmFnZXIsIE5lYWwiIDxuZWFsLmZy
YWdlckBhbWQuY29tPiB3cm90ZToKCj4gSGkgTHVjYSwKPiAKPiA+IExlIDkgbm92LiAyMDIyIMOg
IDE1OjU2LCBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPiBhIMOpY3Jp
dCA6Cj4gPiAKPiA+IO+7v09uIFdlZCwgOSBOb3YgMjAyMiAwMjoxMjoxNCAtMDcwMAo+ID4gTmVh
bCBGcmFnZXIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+IHdyb3RlOgo+ID4gICAKPiA+PiBUaGlzIHBh
dGNoIGFkZHMgc3VwcG9ydCBmb3IgWGlsaW54IFZlcnNhbCBWQ0sxOTAgZXZhbHVhdGlvbiBib2Fy
ZC4KPiA+PiAKPiA+PiBWQ0sxOTAgZmVhdHVyZXMgY2FuIGJlIGZvdW5kIGhlcmU6Cj4gPj4gaHR0
cHM6Ly93d3cueGlsaW54LmNvbS9wcm9kdWN0cy9ib2FyZHMtYW5kLWtpdHMvdmNrMTkwLmh0bWwK
PiA+PiAKPiA+PiBUaGUgVkNLMTkwIGlzIGJhc2VkIG9uIHRoZSBYaWxpbnggVmVyc2FsIGZhbWls
eToKPiA+PiBodHRwczovL3d3dy54aWxpbnguY29tL3Byb2R1Y3RzL3NpbGljb24tZGV2aWNlcy9h
Y2FwL3ZlcnNhbC5odG1sCj4gPj4gCj4gPj4gVGhlIFZDMTkwMiBpbmNsdWRlZCB3aXRoIHRoZSBW
Q0sxOTAgZXZhbHVhdGlvbiBib2FyZCBoYXMgWGlsaW54Cj4gPj4gQUkgRW5naW5lIGFjY2xlcmF0
b3JzIGRlc2lnbmVkIGZvciBhY2NlbGVyYXRpbmcgbWFjaGluZSBsZWFybmluZwo+ID4+IGFwcGxp
Y2F0aW9ucy4gIEFsc28gaW5jbHVkZWQgaXMgYW4gdXBncmFkZSBmcm9tIHByaW9yIFp5bnEgYW5k
Cj4gPj4gWnlucU1QIGZhbWlsaWVzIHRvIEFSTSBDb3J0ZXgtQTcyIGNvcmVzLgo+ID4+IAo+ID4+
IFdoaWxlIHRoZSBMaW51eCBrZXJuZWwgZm9yIFZlcnNhbCBpcyBxdWl0ZSBzaW1pbGFyIHRvIFp5
bnFNUCwKPiA+PiB0aGUgYm9vdCBwcm9jZXNzIGhhcyBzaWduaWZpY2FudGx5IGNoYW5nZWQuCj4g
Pj4gCj4gPj4gVHJpcGxlLXJlZHVuZGFudCBNaWNyb0JsYXplIGNvcmVzIGFyZSB1c2VkIHRvIGJv
b3QgYW5kIHNldHVwCj4gPj4gVmVyc2FsIGRldmljZXMuICBGb3IgdGhpcyByZWFzb24sIGN1cnJl
bnQgYnVpbGRyb290IHN1cHBvcnQKPiA+PiB3aWxsIGRvd25sb2FkIHByZS1idWlsdCBmaXJtd2Fy
ZSBpbWFnZXMgYW5kIHVzZSBYaWxpbnggYm9vdGdlbgo+ID4+IHRvIGdlbmVyYXRlIHRoZSBib290
LmJpbiBmb3IgdGhlIHZjazE5MC4KPiA+PiAKPiA+PiBTaWduZWQtb2ZmLWJ5OiBOZWFsIEZyYWdl
ciA8bmVhbC5mcmFnZXJAYW1kLmNvbT4gIAo+ID4gCj4gPiBbLi4uXQo+ID4gICAKPiA+PiBkaWZm
IC0tZ2l0IGEvY29uZmlncy92ZXJzYWxfdmNrMTkwX2RlZmNvbmZpZyBiL2NvbmZpZ3MvdmVyc2Fs
X3ZjazE5MF9kZWZjb25maWcKPiA+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+IGluZGV4IDAw
MDAwMDAwMDAuLjhjNWQzOTFiOTcKPiA+PiAtLS0gL2Rldi9udWxsCj4gPj4gKysrIGIvY29uZmln
cy92ZXJzYWxfdmNrMTkwX2RlZmNvbmZpZwo+ID4+IEBAIC0wLDAgKzEsMzggQEAKPiA+PiArQlIy
X2FhcmNoNjQ9eQo+ID4+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVf
MTU9eQo+ID4+ICtCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC92ZXJzYWwvcG9z
dC1idWlsZC5zaCIKPiA+PiArQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvdmVy
c2FsL3Bvc3QtaW1hZ2Uuc2giCj4gPj4gK0JSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0idHR5
QU1BMCwxMTUyMDAgbW1jYmxrMHAyIHZjazE5MCIKPiA+PiArQlIyX0xJTlVYX0tFUk5FTD15Cj4g
Pj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTEw9eQo+ID4+ICtCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9OPSIkKGNhbGwgZ2l0aHViLFhpbGlueCxsaW51eC14
bG54LHhsbnhfcmViYXNlX3Y1LjE1X0xUU18yMDIyLjIpL3hsbnhfcmViYXNlX3Y1LjE1X0xUU18y
MDIyLjIudGFyLmd6Igo+ID4+ICtCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0ieGlsaW54X3Zl
cnNhbCIKPiA+PiArQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gPj4gK0JSMl9MSU5V
WF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJ4aWxpbngvdmVyc2FsLXZjazE5MC1yZXYxLjEiCj4g
Pj4gK0JSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPiA+PiArQlIyX1RBUkdF
VF9ST09URlNfRVhUMj15Cj4gPj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Cj4gPj4gKyMg
QlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKPiA+PiArQlIyX1RBUkdFVF9BUk1fVFJV
U1RFRF9GSVJNV0FSRT15Cj4gPj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VT
VE9NX1RBUkJBTEw9eQo+ID4+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RP
TV9UQVJCQUxMX0xPQ0FUSU9OPSIkKGNhbGwgZ2l0aHViLFhpbGlueCxhcm0tdHJ1c3RlZC1maXJt
d2FyZSx4bG54X3JlYmFzZV92Mi42XzIwMjIuMikveGxueF9yZWJhc2VfdjIuNl8yMDIyLjIudGFy
Lmd6Igo+ID4+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1BMQVRGT1JNPSJ2ZXJz
YWwiCj4gPj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQkwzMV9VQk9PVD15Cj4g
Pj4gK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzE9eQo+ID4+ICtCUjJfVEFSR0VUX1VC
T09UX05FRURTX0FURl9CTDMxX0VMRj15Cj4gPj4gK0JSMl9UQVJHRVRfVUJPT1Q9eQo+ID4+ICtC
UjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKPiA+PiArQlIyX1RBUkdFVF9V
Qk9PVF9DVVNUT01fVEFSQkFMTD15Cj4gPj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1RBUkJB
TExfTE9DQVRJT049IiQoY2FsbCBnaXRodWIsWGlsaW54LHUtYm9vdC14bG54LHhsbnhfcmViYXNl
X3YyMDIyLjAxXzIwMjIuMikveGxueF9yZWJhc2VfdjIwMjIuMDFfMjAyMi4yLnRhci5neiIKPiA+
PiArQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9InhpbGlueF92ZXJzYWxfdmlydCIK
PiA+PiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fTUFLRU9QVFM9IkRFVklDRV9UUkVFPXZlcnNh
bC12Y2sxOTAtcmV2MS4xIgo+ID4+ICtCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15Cj4gPj4g
K0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNTTD15Cj4gPj4gK0JSMl9UQVJHRVRfVUJPT1Rf
Rk9STUFUX0VMRj15Cj4gPj4gK0JSMl9QQUNLQUdFX1ZFUlNBTF9GSVJNV0FSRT15Cj4gPj4gK0JS
Ml9QQUNLQUdFX1ZFUlNBTF9GSVJNV0FSRV9WRVJTSU9OPSJ2MjAyMi4yIgo+ID4+ICtCUjJfUEFD
S0FHRV9WRVJTQUxfRklSTVdBUkVfQk9BUkQ9InZjazE5MCIgIAo+ID4gCj4gPiBUaGVzZSB0d28g
bGluZXMgc2hvdWxkIGJlIHJlbW92ZWQuIFRoZXkgaG9sZCB0aGUgZGVmYXVsdCB2YWx1ZXMgYWZ0
ZXIKPiA+IGl0IGhhcyBiZWVuIGFkZGVkIHRvIHBhdGNoIDEuICAKPiAKPiBXaGlsZSBmdW5jdGlv
bmFsbHksIHlvdSBhcmUgY29ycmVjdCB0aGF0IEkgY2FuIHJlbW92ZSB0aGVzZSB0d28gbGluZXMs
IEkgYW0gbm90IHN1cmUgaXQgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLgo+IAo+IEkgZGVzaWdu
ZWQgdGhlc2UgcGF0Y2hlcyB3aXRoIHRoZSBpZGVhIG9mIHN1cHBvcnRpbmcgYWRkaXRpb25hbCB2
ZXJzYWwgYm9hcmRzIGluIHRoZSBmdXR1cmUuICBXaGVuIGEgc2Vjb25kIGJvYXJkIGdldHMgc3Vw
cG9ydGVkLCBpdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgZm9yIGVhY2ggZGVmY29uZmlnIGJlIGRl
c2lnbmVkIGZvciB0aGUgc3BlY2lmaWMgYm9hcmQuCj4gCj4gSSBvbmx5IGNyZWF0ZWQgYSBkZWZh
dWx0LCBzbyB0aGF0IHRoZSBwYWNrYWdlIHdvdWxkIGFsd2F5cyBidWlsZCwgZXZlbiB3aXRoIHRl
c3RzIHdoZXJlIHRoZXNlIHBhcmFtZXRlcnMgYXJlIG5vdCBkZWZpbmVkLiAgQnV0IGluIHJlYWxp
dHksIEkgd291bGQgbGlrZSB1c2VycyB0byBhbHdheXMgc3BlY2lmeSB0aGVzZSBwYXJhbWV0ZXJz
IHRvIGdldCB0aGUgcmlnaHQgYm9vdCBmaXJtd2FyZSBmaWxlcyBmb3IgdGhlaXIgYm9hcmQuCj4g
Cj4gT25lIHRoaW5nIEkgY291bGQgZG8gaXMgZ2V0IHJpZCBvZiB0aGUgdmVyc2lvbiBkZWZpbml0
aW9uIGluIHRoZSBkZWZjb25maWcgZmlsZSBhbmQgbGV0IHRoYXQganVzdCBiZSBkZWZhdWx0IChs
YXRlc3QpIHVubGVzcyBzcGVjaWZpZWQgb3RoZXJ3aXNlIGJ5IGEgdXNlci4KClRoaW5raW5nIHR3
aWNlIGFib3V0IHRoYXQgSSB0aGluayB5b3UgaGF2ZSBhIGdvb2QgcG9pbnQgaGVyZSwgYXQgbGVh
c3QKZm9yIHRoZSB2ZXJzaW9uIHdob3NlIGRlZmF1bHQgaXMgbGlrZWx5IHRvIGNoYW5nZSBpbiB0
aGUgZnV0dXJlLiBTbyB5b3UKY2FuIGxlYXZlIGl0IGFzIGlzLCBmb3JnZXQgYWJvdXQgbXkgY29t
bWVudC4KClJldmlld2VkLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4u
Y29tPgoKLS0gCkx1Y2EgQ2VyZXNvbGksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
