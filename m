Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7044DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 17:49:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C291A61186
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 17:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C291A61186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69B4881066;
	Tue, 21 Sep 2021 17:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9u6A3nPaXmI; Tue, 21 Sep 2021 17:49:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A27F80F2B;
	Tue, 21 Sep 2021 17:49:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64DA61BF3C2
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 17:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5461F607E3
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 17:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QbZ5P08diFSU for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 17:49:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E652660737
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 17:49:48 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9F49FC0002;
 Tue, 21 Sep 2021 17:49:45 +0000 (UTC)
Date: Tue, 21 Sep 2021 19:49:44 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210921194944.53b0cacc@kmaincent-XPS-13-7390>
In-Reply-To: <20210921163727.GW1053080@scaer>
References: <20210921132829.56405-1-kory.maincent@bootlin.com>
 <20210921132829.56405-2-kory.maincent@bootlin.com>
 <20210921163727.GW1053080@scaer>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/6] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8gWWFubiwKClRoYW5rcyBmb3IgdGhlIHR3byByZXZpZXdzLgoKT24gVHVlLCAyMSBTZXAg
MjAyMSAxODozNzoyNyArMDIwMAoiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVl
LmZyPiB3cm90ZToKCj4gPiAgCj4gPiAtR1JVQjJfQlVJTFRJTl9NT0RVTEVTID0gJChjYWxsIHFz
dHJpcCwkKEJSMl9UQVJHRVRfR1JVQjJfQlVJTFRJTl9NT0RVTEVTKSkKPiA+IC1HUlVCMl9CVUlM
VElOX0NPTkZJRyA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX0dSVUIyX0JVSUxUSU5fQ09O
RklHKSkKPiA+ICtHUlVCMl9CVUlMVElOX01PRFVMRVNfUEMgPSAkKGNhbGwKPiA+IHFzdHJpcCwk
KEJSMl9UQVJHRVRfR1JVQjJfQlVJTFRJTl9NT0RVTEVTX1BDKSkgK0dSVUIyX0JVSUxUSU5fTU9E
VUxFU19FRkkgPQo+ID4gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfR1JVQjJfQlVJTFRJTl9N
T0RVTEVTX0VGSSkpCj4gPiArR1JVQjJfQlVJTFRJTl9DT05GSUdfUEMgPSAkKGNhbGwKPiA+IHFz
dHJpcCwkKEJSMl9UQVJHRVRfR1JVQjJfQlVJTFRJTl9DT05GSUdfUEMpKSArR1JVQjJfQlVJTFRJ
Tl9DT05GSUdfRUZJID0KPiA+ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX0dSVUIyX0JVSUxU
SU5fQ09ORklHX0VGSSkpIEdSVUIyX0JPT1RfUEFSVElUSU9OCj4gPiA9ICQoY2FsbCBxc3RyaXAs
JChCUjJfVEFSR0VUX0dSVUIyX0JPT1RfUEFSVElUSU9OKSkgaWZlcQo+ID4gKCQoQlIyX1RBUkdF
VF9HUlVCMl9JMzg2X1BDKSx5KSAgCj4gWy0tU05JUCByZW1vdmFscy0tXQo+ID4gK0dSVUIyX0lN
QUdFX2kzODYtcGMgPSAkKEJJTkFSSUVTX0RJUikvZ3J1Yi5pbWcKPiA+ICtHUlVCMl9DRkdfaTM4
Ni1wYyA9ICQoVEFSR0VUX0RJUikvYm9vdC9ncnViL2dydWIuY2ZnCj4gPiArR1JVQjJfUFJFRklY
X2kzODYtcGMgPSAoJChHUlVCMl9CT09UX1BBUlRJVElPTikpL2Jvb3QvZ3J1Ygo+ID4gK0dSVUIy
X1RBUkdFVF9pMzg2LXBjID0gaTM4Ngo+ID4gK0dSVUIyX1BMQVRGT1JNX2kzODYtcGMgPSBwYwo+
ID4gK0dSVUIyX0JVSUxUSU5faTM4Ni1wYyA9IFBDCj4gPiArR1JVQjJfVFVQTEVTICs9IGkzODYt
cGMKPiA+ICtlbmRpZiAgCj4gCj4gQW55IHJlYXNvbiB3aHkgeW91IGhhdmUgZGVjaWRlZCBub3Qg
dG8gZ290IHdpdGggdGhlIGNvbnN0cnVjdCBJCj4gc3VnZ2VzdGVkOgo+ICAgICBHUlVCMl9UVVBM
RVMtJChCUjJfVEFSR0VUX0dSVUIyX0kzODZfUEMpICs9IGkzODYtcGMKPiAKPiBhbmQgdGhlbiB1
c2UgJChHUlVCMl9UVVBMRVMteSkgd2hlbiBpdGVyYXRpbmc/Cj4gCj4gTm90ZTogdGhpcyBpcyB1
c2VkIGV2ZXJ5d2hlcmUgaW4gdGhlIGtlcm5lbCB0cmVlLCBhbmQgd2UgYWxyZWFkeSB1c2UKPiB0
aGF0IGNvbnN0cnVjdCBpbiBxdWl0ZSBhIGZldyBwbGFjZXMsIHNvIGl0IHdvdWxkIG5vdCBiZSB0
b3RhbGx5IG5ldwo+IGFuZCBub3QgdG90YWxseSB1bmtvd24gZWl0aGVyOgo+IAo+ICAgICAkIGdp
dCBncmVwIC1FIC0tICdbXy1dXCRcKFteKV0rXClbWzpzcGFjZTpdXSpcKz0nICcqLm1rJwo+IAo+
IEJ1dCBPSywgdGhlIG11bHRpLWNvbmRpdGlvbnMgd29yayBhcyBnb29kIGlmIHlvdSBkb24ndCBs
aWtlIHRoZSAteQo+IHN0dWZmLgoKT2ggc29ycnksIEkgaGF2ZSBmb3Jnb3R0ZW4gdGhhdCBwYXJ0
LgpJdCBzZWVtcyBiZXR0ZXIgaW5kZWVkLCBJIHdpbGwgZG8gdGhhdCBpbiB2My4gCgo+IAo+ID4g
K2lmZXEgKCQoQlIyX1RBUkdFVF9HUlVCMl9JMzg2X0VGSSkseSkKPiA+ICtHUlVCMl9JTUFHRV9p
Mzg2LWVmaSA9ICQoQklOQVJJRVNfRElSKS9lZmktcGFydC9FRkkvQk9PVC9ib290aWEzMi5lZmkK
PiA+ICtHUlVCMl9DRkdfaTM4Ni1lZmkgPSAkKEJJTkFSSUVTX0RJUikvZWZpLXBhcnQvRUZJL0JP
T1QvZ3J1Yi5jZmcKPiA+ICtHUlVCMl9QUkVGSVhfaTM4Ni1lZmkgPSAvRUZJL0JPT1QKPiA+ICtH
UlVCMl9UQVJHRVRfaTM4Ni1lZmkgPSBpMzg2Cj4gPiArR1JVQjJfUExBVEZPUk1faTM4Ni1lZmkg
PSBlZmkKPiA+ICtHUlVCMl9CVUlMVElOX2kzODYtZWZpID0gRUZJICAKPiAKPiBBbGwgdGhvc2Ug
R1JVQjJfQlVJTFRJTl8kKHR1cGxlKSB2YXJpYWJsZXMgYXJlIGp1c3Qgc28gdGhhdCB5b3UgY2Fu
IGRvIGEKPiBkb3VibGUgaW5kZWlyZWN0aW9uIGFsdGVyIG9uLCB3aGljaCBpcyBoaWdobHkgdW5y
ZWFkYWJsZS4KPiAKPiBXaGF0IGFib3V0IGFzc2lnbmluZyB0aGUgb3B0aW9ucyBkaXJlY3RseToK
PiAKPiAgICAgR1JVQjJfQ09ORklHX2kzODYtcGMgPSAkKEdSVUIyX0JVSUxUSU5fQ09ORklHX1BD
KQo+ICAgICBHUlVCMl9NT0RVTEVTX2kzODYtcGMgPSAkKEdSVUIyX0JVSUxUSU5fTU9EVUxFU19Q
QykKPiAgICAgR1JVQjJfQ09ORklHX2kzODYtZWZpID0gJChHUlVCMl9CVUlMVElOX0NPTkZJR19F
RkkpCj4gICAgIEdSVUIyX01PRFVMRVNfaTM4Ni1lZmkgPSAkKEdSVUIyX0JVSUxUSU5fTU9EVUxF
U19FRkkpCj4gCj4gWy4uLl0gYW5kIHNvIG9uIFsuLi5dCj4gCj4gWy0tU05JUC0tXQo+ID4gK2lm
ZXEgKCQoQlIyX1RBUkdFVF9HUlVCMl9BUk1fVUJPT1QpLHkpCj4gPiArR1JVQjJfSU1BR0VfYXJt
LXVib290ID0gJChCSU5BUklFU19ESVIpL2Jvb3QtcGFydC9ncnViL2dydWIuaW1nCj4gPiArR1JV
QjJfQ0ZHX2FybS11Ym9vdCA9ICQoQklOQVJJRVNfRElSKS9ib290LXBhcnQvZ3J1Yi9ncnViLmNm
Zwo+ID4gK0dSVUIyX1BSRUZJWF9hcm0tdWJvb3QgPSAoJChHUlVCMl9CT09UX1BBUlRJVElPTikp
L2Jvb3QvZ3J1Ygo+ID4gK0dSVUIyX1RBUkdFVF9hcm0tdWJvb3QgPSBhcm0KPiA+ICtHUlVCMl9Q
TEFURk9STV9hcm0tdWJvb3QgPSB1Ym9vdAo+ID4gK0dSVUIyX0JVSUxUSU5fYXJtLXVib290ID0g
UEMgIAo+IAo+IFsuLi5dIGV2ZW4gZm9yIHRoaXMgc29sZSBvdXRsaWVyOgo+IAo+ICAgICBHUlVC
Ml9DT05GSUdfYXJtLXVib290ID0gJChHUlVCMl9CVUlMVElOX0NPTkZJR19QQykKPiAgICAgR1JV
QjJfTU9EVUxFU19hcm0tdWJvb3QgPSAkKEdSVUIyX0JVSUxUSU5fTU9EVUxFU19QQykKPiAKPiAo
YW5kIHdoZXJlIHdlIHNlZSB0aGF0IHRoZSBfUEMgc3VmZml4IGlzIG5vdCBuZWNlc3NhcmlseSBh
cHByb3ByaWF0ZS4KPiBidXQgbmFtaW5nIGlzIHJlYWxseSBoYXJkLi4uKQoKVHJ1ZSwgSSBkaWQg
bm90IHRob3VnaHQgb2YgdGhhdCBzb2x1dGlvbi4KCj4gCj4gWy0tU05JUC0tXQo+ID4gQEAgLTEy
OCw4ICsxNDEsOCBAQCBHUlVCMl9DT05GX0VOViA9IFwKPiA+ICAJVEFSR0VUX1NUUklQPSIkKFRB
UkdFVF9DUk9TUylzdHJpcCIKPiA+ICAKPiA+ICBHUlVCMl9DT05GX09QVFMgPSBcCj4gPiAtCS0t
dGFyZ2V0PSQoR1JVQjJfVEFSR0VUKSBcCj4gPiAtCS0td2l0aC1wbGF0Zm9ybT0kKEdSVUIyX1BM
QVRGT1JNKSBcCj4gPiArCS0taG9zdD0kKEdOVV9UQVJHRVRfTkFNRSkgXAo+ID4gKwktLWJ1aWxk
PSQoR05VX0hPU1RfTkFNRSkgXAo+ID4gIAktLXByZWZpeD0vIFwKPiA+ICAJLS1leGVjLXByZWZp
eD0vIFwKPiA+ICAJLS1kaXNhYmxlLWdydWItbWtmb250IFwKPiA+IEBAIC0xNDcsMzQgKzE2MCw0
OCBAQCBIT1NUX0dSVUIyX0NPTkZfT1BUUyA9IFwKPiA+ICAJLS1lbmFibGUtbGliemZzPW5vIFwK
PiA+ICAJLS1kaXNhYmxlLXdlcnJvciAgCj4gCj4gQXMgVGhvbWFzIHByZXZpb3VzbHkgc3VnZ2Vz
dGVkLCBJIHRoaW5rIHdlIGNhbiBqdXN0IGRyb3AgR1JVQjJfQ09ORl9PUFRTCj4gYW5kIGp1c3Qg
cHV0IHRoZSBvcHRpb25zLCBldmVuIHNoYXJlZCAsIGRpcmVjdGx5IGluIHRoZSBsb29wIFsuLi5d
CgpIaXMgc3VnZ2VzdGlvbiB3YXMgdG8gb25seSBrZWVwIG91dCBvZiBHUlVCMl9DT05GX09QVFMg
dGhlIHR3byBwYXJhbWV0ZXJpemVkCm9wdGlvbnMgIi0tdGFyZ2V0IiBhbmQgIi0td2l0aC1wbGF0
Zm9ybSIuIElmIHlvdSBwcmVmZXIgdG8gZHJvcCBhbGwgdGhlCm9wdGlvbnMgZnJvbSBHUlVCMl9D
T05GX09QVFMsIEkgY2FuIGRvIHRoYXQuCgo+IAo+ID4gKwkJJChJTlNUQUxMKSAtRCAtbSAwNjQ0
IGJvb3QvZ3J1YjIvZ3J1Yi5jZmcKPiA+ICQoR1JVQjJfQ0ZHXyQodHVwbGUpKSA7IFwKPiA+ICsJ
CSQoaWYgJChmaW5kc3RyaW5nICQoR1JVQjJfUExBVEZPUk1fJCh0dXBsZSkpLCBwYyksIFwKPiA+
ICsJCQljYXQgJChIT1NUX0RJUikvbGliL2dydWIvJCh0dXBsZSkvY2Rib290LmltZwo+ID4gJChH
UlVCMl9JTUFHRV8kKHR1cGxlKSkgPiBcCj4gPiArCQkJCSQoQklOQVJJRVNfRElSKS9ncnViLWVs
dG9yaXRvLmltZyBcCj4gPiArCQkpIFwKPiA+ICsJCSQoaWYgJChmaW5kc3RyaW5nICQoR1JVQjJf
UExBVEZPUk1fJCh0dXBsZSkpLCBlZmkpLCBcCj4gPiArCQkJZWNobyAkKG5vdGRpciAkKEdSVUIy
X0lNQUdFXyQodHVwbGUpKSkgPiBcCj4gPiArCj4gPiAkKEJJTkFSSUVTX0RJUikvZWZpLXBhcnQv
c3RhcnR1cF8kKEdSVUIyX1RBUkdFVF8kKHR1cGxlKSkubnNoIFwgIAo+IAo+IEJ1dCB0aGUgcHJl
dmlvdXMgcGF0aCAnZWZpLXBhcnQvc3RhcnR1cC5uc2gnIGlzIHdoZXJlIHRoZSBwb3N0LWJ1aWxk
Cj4gc2NyaXB0cyBhbmQgZ2VuaW1hZ2UgY29uZmlnIGZpbGVzIGxvb2sgZm9yOgo+IAo+ICAgICAk
IGdpdCBncmVwIC1FICdcLm5zaCcKPiAKPiBTbywgYnkgY2hhbmdpbmcgdGhlIHBsYWNlIHdoZXJl
IHRoZSAubnNoIGlzIHN0b3JlZCwgeW91IGFyZSBicmVha2luZwo+IHRob3NlIGJvYXJkcy4uLiBV
bmxlc3MgSSBtaXNzZWQgc29tZXRoaW5nPwoKWWVzLCBpbmRlZWQgaXQgd2lsbCBicmVhayBmZXcg
cG9zdC1idWlsZCBzY3JpcHQuCkJ5IGRlZmF1bHQgdGhlIEVGSSB3aWxsIGxvb2sgYXQgZWZpL2Jv
b3QvYm9vdHg2NC5lZmkgb3IgZWZpL2Jvb3QvYm9vdGlhMzIuZWZpCmlmIHRoZSBzdGFydHVwLm5z
aCBmaWxlIGlzIG5vdCBwcmVzZW50LiBTbyBib2FyZCBzaG91bGQgYm9vdCB3aXRob3V0IHRoYXQg
ZmlsZS4KCj4gCj4gQW5kIEkgYW0gbm90IHN1cmUgaG93IHRvIGZpeCB0aGF0LCBpbiB0aGUgZW5k
Li4uIEVzcGVjaWFsbHkgdGhlIHN5c3RlbWQKPiBjYXNlIChtZWgpLgoKTWUgbmVpdGhlci4gTWF5
YmUgd2UgY2FuIGxldCBpdCBsaWtlIHYxLCBhbmQgdGhlIDY0LWJpdCBFRkkgY29uZmlndXJhdGlv
biB3aWxsCmJlIHRoZSBvbmUgdXNlZCBpZiBib3RoIDMyLWJpdCBFRkkgYW5kIDY0LWJpdCBFRkkg
YXJlIHNlbGVjdGVkLgoKUmVnYXJkcywKS8O2cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlz
dHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
