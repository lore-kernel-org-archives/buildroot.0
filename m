Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DB1C54E58
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 07:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E82B605E1;
	Tue, 26 Mar 2024 07:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuNuAkFidUPm; Tue, 26 Mar 2024 07:22:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4182C60823
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4182C60823;
	Tue, 26 Mar 2024 07:22:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A16151BF3A9
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 07:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D8D440444
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 07:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XOrGpb83ZnW for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 07:22:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 426664034A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 426664034A
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 426664034A
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 07:22:39 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42Q7MaqN098743;
 Tue, 26 Mar 2024 02:22:36 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42Q7MZXU015789
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Mar 2024 02:22:35 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 26
 Mar 2024 02:22:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 26 Mar 2024 02:22:35 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42Q7MZq6032901;
 Tue, 26 Mar 2024 02:22:35 -0500
Date: Tue, 26 Mar 2024 02:22:35 -0500
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240326072235.pwqxjabhs3fuekk2@dasso>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-6-dario.binacchi@amarulasolutions.com>
 <ZfoNHD-DlqkkYCRh@landeda>
 <CABGWkvpPaiC3Uz8_dG87x9n=5R+f7U-KWA_ibGnHH=GkPsTkyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvpPaiC3Uz8_dG87x9n=5R+f7U-KWA_ibGnHH=GkPsTkyw@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1711437756;
 bh=EWQGNPS9uDJHTsDB1HOQ2zYNLzwhEdes/Vh7iV6dIEc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Zi+h++AJE35xEPUmhiFoVYwPp0sAgL/3odEg08hAigckVkYd18BTdkC9J/hygsLdU
 KOpfZ9f3es+n/t2PlT7nxosU7dV1hulKsaL1rt3SrlgmcPyFwe+rRdws1sDJ161iDO
 55dFrnnEa09OdCgEHzvw54tZqkoSeGTxGim9ZhoA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Zi+h++AJ
Subject: Re: [Buildroot] [PATCH v9 05/22] boot/ti-k3-r5-loader: bump to
 version 2024.01
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 bryce@redpinelabs.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFN1biwgTWFyIDI0LCAyMDI0IGF0IDA1OjIyOjMzUE0gKzAxMDAsIERhcmlv
IEJpbmFjY2hpIHdyb3RlOgo+IEhpIFlhbm4sCj4gCj4gT24gVHVlLCBNYXIgMTksIDIwMjQgYXQg
MTE6MDnigK9QTSBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6
Cj4gPgo+ID4gRGFyaW8sIEFsbCwKPiA+Cj4gPiBPbiAyMDI0LTAzLTA0IDE2OjMyICswMTAwLCBE
YXJpbyBCaW5hY2NoaSBzcGFrZSB0aHVzbHk6Cj4gPiA+IEFsbCBpbi10cmVlIGNvbmZpZ3Mgd2l0
aCB0aGUgdGktazMtcjUgYm9vdGxvYWRlciB1c2UgYSBjdXN0b20gdmVyc2lvbiwKPiA+ID4gc28g
dGhpcyBwYXRjaCBpcyBtb3N0bHkgZm9yIHRoZSBtZW51Y29uZmlnIGRlZmF1bHQgdmVyc2lvbgo+
ID4gPgo+ID4gPiBTdWdnZXN0ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxl
LmZyPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlA
YW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiBbLS1TTklQLS1dCj4gPiA+IGRpZmYgLS1naXQgYS9i
b290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaCBiL2Jvb3QvdGktazMtcjUt
bG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoCj4gPiA+IGluZGV4IGM1ZDFjYjhlMDlmMC4uZmJl
NWQyMTU0MDlkIDEwMDY0NAo+ID4gPiAtLS0gYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1y
NS1sb2FkZXIuaGFzaAo+ID4gPiArKysgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1s
b2FkZXIuaGFzaAo+ID4gPiBAQCAtMSwzICsxLDMgQEAKPiA+ID4gICMgTG9jYWxseSBjb21wdXRl
ZDoKPiA+ID4gLXNoYTI1NiAgNTBiNDQ4MmE1MDViYzI4MWJhODQ3MGMzOTlhM2MyNmUxNDVlMjli
MjM1MDBiYzM1YzUwZGViZDdmYTQ2YmRmOCAgdS1ib290LTIwMjIuMTAudGFyLmJ6Mgo+ID4KPiA+
IFJlbW92aW5nIHRoaXMgaGFzaCBtZWFucyB0aGF0IGRlZmNvbmZpZ3MgdGhhdCBzdGlsbCByZWZl
cmVuY2UgdGhlCj4gPiAyMDIyLjEwIHZlcnNpb24sIG5vIGxvbmdlciBoYXZlIGEgaGFzaCB0byB2
YWxpZGF0ZSB0aGUgZG93bmxvYWQgYWdhaW5zdCwKPiA+IHdoaWNoIG1ha2UgaXQgc3VzY2VwdGli
bGUgdG8gQ1ZFLTIwMjMtNDM2MDggWzBdIFsxXS4KPiA+Cj4gPiBUaGF0IHdhcyBhbHJlYWR5IHRo
ZSBjYXNlIGZvciB0aGUgdHdvIHRpLWFtNj94IGRlZmNvbmZpZyBpbiB0aGUgdGhlIHR3bwo+ID4g
cHJldmlvdXMgcGF0Y2hlcywgYXMgdGhleSBhbHJlYWR5IHVzZWQgYSBjdXN0b20ga2VybmVsLCBh
IGN1c3RtIEFURiwgYQo+ID4gY3VzdG9tIHUtYm9vdDogdGhlIGhhc2hlcyBjYW4ndCBiZSBjaGVj
a2VkIGZvciB0aG9zZSB2ZXJzaW9ucywgc28gdGhlCj4gPiB0d28gdGkgYW0/eCBkZWZjb25maWdz
IGFscmVhZHkgaGl0IENWRS0yMDIzLTQzNjA4Lgo+ID4KPiA+IFdlIGFscmVhZHkgZml4ZWQgYW5v
dGhlciBkZWZjb25maWcgZm9yIGEgc2ltaWxhciBpc3N1ZSwgc2VlIGNvbW1pdAo+ID4gOWViYmZl
ZmYzODcgKGNvbmZpZ3Mvcm9jazViOiBhZGQgaGFzaCBmb3IgY3VzdG9tIGtlcm5lbCkuCj4gPgo+
ID4gQ291bGQgeW91IGxvb2sgaW50byBkb2luZyB0aGUgc2FtZSBmb3IgdGhvc2UgdG8gVEkgYW02
P3ggZGVmY29uZmlnLAo+ID4gcGxlYXNlPwo+IAo+IFRoYW5rcyBmb3IgdGhlIGluZm8uCj4gWWVz
IEkgd2lsbCBhZGQgYSBwYXRjaCBmb3IgdGhpcyBwb2ludCBpbiB2ZXJzaW9uIDEwIG9mIHRoZSBz
ZXJpZXMuCj4gCj4gPgo+ID4gSW4gdGhlIG1lYW50aW1lLCBJIGtlcHQgdGhlIGhhc2ggZm9yIDIw
MjIuMTAgZm9yIHRpLWszLXI1LWxvYWRlcgo+ID4gKHJlYWxseSwgZm9yIHVib290KSwgdG8gYWJ2
b2lkIHRoZSBpc3N1ZSBhdCBsZWFzdCBmb3IgdGktazMtcjUtbG9hZGVyLgo+ID4KPiA+IFNwZWFr
aW5nIG9mIHRoYXQsIGJ5IHRoZSB3YXksIHRpLWszLXI1LWxvYWRlciByZWFsbHkgaXMgdWJvb3Qs
IHNvIEkKPiA+IHRoaW5rIHRoYXQgaXQgc2hvdWxkIHNoYXJlOgo+ID4KPiA+ICAxLiB0aGUgc2Ft
ZSBETF9ESVI6ICAgVElfSzNfUjVfTE9BREVSX0RMX1NVQkRJUiA9IHVib290Cj4gPgo+ID4gIDIu
IHRoZSBzYW1lIGhhc2ggZmlsZTogIGhhdmUgdGktazMtcjUtbG9hZGVyLmhhc2ggYmUgYSBzeW1s
aW5rIHRvCj4gPiAgICAgdWJvb3QuaGFzaCAgKGFuZCBoYXZlIGEgeG9tbWVudCBhdCB0aGUgdG9w
IG9mIHRoYXQgaGFzaCBmaWxlIHRoYXQgaXQKPiA+ICAgICBpcyBzaGFyZWQgYW5kIHRoYXQgb2xk
IGhhc2hlcyBzaG91bGQvY2FuIGJlIGtlcHQpCj4gPgo+ID4gRG8geW91IHRoaW5rIHRoYXQgbWFr
ZXMgc2Vuc2U/IElmIHNvLCB3b3VsZCB5b3UgbGlrZSB0byBsb29rIGludG8gaXQ/Cj4gCj4gSSB0
aGluayBsaWtlIHlvdSB0aGF0IHdoZXJlIHBvc3NpYmxlIGl0IGlzIGJldHRlciBub3QgdG8gcmVw
bGljYXRlIGNvZGUuCj4gVGhpcyBzZXJpZXMgaGFzIGJlZW4gb25nb2luZyBzaW5jZSBOb3ZlbWJl
ciAyMDIzLCBzdGFydGVkIHRvIGZpeCB0aGUKPiBjb21waWxhdGlvbiBmb3IgdGhlIEhTX0ZTIGRl
dmljZSBmb3IgdGhlIHRpX2FtNjJ4X3NrX2RlZmNvbmZpZyBjb25maWd1cmF0aW9uLgo+IER1cmlu
ZyB0aGUgcmV2aWV3IHByb2Nlc3MsIGl0IGhhcyBhZGRlZCBhZGRpdGlvbmFsIHBhdGNoZXMKPiAo
dGlfYW02NHhfc2tfZGVmY29uZmlnLAo+IGFuZCByZW1vdmFsIG9mIHRoZSB0aS1rMy1pbWFnZS1n
ZW4gcGFja2FnZSkgd2hpY2ggc3RpbGwgdG9kYXkgaGF2ZSBub3QKPiBhbGxvd2VkIHRoZQo+IHNl
cmllcyB0byBiZSBtZXJnZWQgYW5kIHRoZXJlZm9yZSB0byBmaXggdGhlIGlzc3VlLgo+IFNvLCBJ
IHdvdWxkIHByZWZlciB0byBhZGRyZXNzIHRoaXMgYXNwZWN0IGluIGEgc2VwYXJhdGUgc2VyaWVz
IGZyb20KPiB0aGlzIG9uZSBpbiBvcmRlcgo+IG5vdCB0byBmdXJ0aGVyIHNsb3cgaXQgZG93bi4K
CkknZCBsaWtlIHRvIGZpbmlzaCBHUFUgc3VwcG9ydCBmb3IgQU02eHggdG9vIGFuZCBwdXNoIHRo
aXMgaGVyZSwgYnV0IGFzCmxvbmcgYXMgd2UgZG9uJ3QgaGF2ZSBiYXNlIHN1cHBvcnQgSSdtIGtp
bmQgb2YgYmxvY2tlZCBvbiB0aGlzLiBBbmQKdGhhdCdzIHByb2JhYmx5IGp1c3Qgb25lIGV4YW1w
bGUuIEkgdGhpbmsgYXMgbG9uZyBhcyB0aGVyZSBhcmUgbm8KcmVncmVzc2lvbnMgaW4gd2hhdCB0
aGlzIHNlcmllcyBpcyB0cnlpbmcgdG8gZG8gd2h5IG5vdCBhZ3JlZSB0byBtZXJnZSAmCml0ZXJh
dGUgdG8gZ2V0IHRoZSBiYXNlIHN1cHBvcnQgb3V0IG9mIHRoZSB3YXkuIEJ1dCBkZWZpbml0ZWx5
CmFwcHJlY2lhdGluZyBhbGwgeW91ciBncmVhdCBmZWVkYmFjayBoZXJlIGZvciBmdXJ0aGVyIGlt
cHJvdmVtZW50IHNvCnBsZWFzZSBkb24ndCBtaXMtaW50ZXJwcmV0IG15IGNvbW1lbnQuCgotLQpB
bmRyZWFzIERhbm5lbmJlcmcKVGV4YXMgSW5zdHJ1bWVudHMgSW5jCgoKCj4gRG8geW91IGFncmVl
Pwo+IAo+IFRoYW5rcyBhbmQgcmVnYXJkcywKPiBEYXJpbwo+ID4KPiA+IFswXSBodHRwczovL2N2
ZS5taXRyZS5vcmcvY2dpLWJpbi9jdmVuYW1lLmNnaT9uYW1lPTIwMjMtNDM2MDgKPiA+IFsxXSBo
dHRwczovL3RhbG9zaW50ZWxsaWdlbmNlLmNvbS92dWxuZXJhYmlsaXR5X3JlcG9ydHMvVEFMT1Mt
MjAyMy0xODQ0Cj4gPgo+ID4gUmVnYXJkcywKPiA+IFlhbm4gRS4gTU9SSU4uCj4gPgo+ID4gPiAr
c2hhMjU2ICBiOTk2MTFmMWVkMjM3YmYzNTQxYmRjODQzNGI2OGM5NmE2ZTA1OTY3MDYxZjk5MjQ0
M2NiMzBhYWJlYmVmNWIzICB1LWJvb3QtMjAyNC4wMS50YXIuYnoyCj4gPiA+ICBzaGEyNTYgIDgx
NzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4
ODA2NDMgIExpY2Vuc2VzL2dwbC0yLjAudHh0Cj4gPiA+IC0tCj4gPiA+IDIuNDMuMAo+ID4gPgo+
ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
PiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo+ID4KPiA+IC0tCj4gPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+ID4gfCAgWWFubiBFLiBN
T1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNv
bnNwaXJhY3k6IHwKPiA+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gPiB8ICszMyA1NjEgMDk5
IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVy
ZSBpcyBubyAgfAo+ID4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiA+ICctLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tLS0nCj4gCj4gCj4gCj4gLS0gCj4gCj4gRGFyaW8gQmluYWNjaGkKPiAKPiBTZW5pb3Ig
RW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCj4gCj4gZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0
aW9ucy5jb20KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gCj4gCj4g
QW1hcnVsYSBTb2x1dGlvbnMgU1JMCj4gCj4gVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2
aXNvLCBWZW5ldG8sIElUCj4gCj4gVC4gKzM5IDA0MiAyNDMgNTMxMAo+IGluZm9AYW1hcnVsYXNv
bHV0aW9ucy5jb20KPiAKPiB3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
