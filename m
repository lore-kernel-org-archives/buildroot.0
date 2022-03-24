Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7FEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 22:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3C7641CBB;
	Thu, 24 Mar 2022 22:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HSUQInVD7HTW; Thu, 24 Mar 2022 22:35:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE92241CB7;
	Thu, 24 Mar 2022 22:35:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBB8D1BF36A
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB3E141CB7
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cx6qhrYFQvzs for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 22:35:45 +0000 (UTC)
X-Greylist: delayed 00:07:20 by SQLgrey-1.8.0
Received: from forward100o.mail.yandex.net (forward100o.mail.yandex.net
 [37.140.190.180])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF40A41CB6
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 22:35:44 +0000 (UTC)
Received: from iva1-b95cb40edbfe.qloud-c.yandex.net
 (iva1-b95cb40edbfe.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:3080:0:640:b95c:b40e])
 by forward100o.mail.yandex.net (Yandex) with ESMTP id 328A652AB161;
 Fri, 25 Mar 2022 01:28:17 +0300 (MSK)
Received: from iva4-50c21cb1cb18.qloud-c.yandex.net
 (iva4-50c21cb1cb18.qloud-c.yandex.net [2a02:6b8:c0c:1510:0:640:50c2:1cb1])
 by iva1-b95cb40edbfe.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 Ri0R2nEMku-SGeORFeK; Fri, 25 Mar 2022 01:28:17 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=corrigendum.ru; s=mail;
 t=1648160897; bh=Oe0urb3No1te24snF04h36zvZdQJV56+zs4KFcpDJxw=;
 h=In-Reply-To:From:To:Subject:Cc:References:Date:Message-ID;
 b=nVu8SI0V6wR2ib5Rp1vqc2a9ATFYfHDWY/SpLAKdBWLBC7kA/hB3nYRCpH0QIE0cC
 osRXFAjA9Hii/VQ5p5YJmbk0gdngZZQOknlUmVHlZ+GlEjs0DcjVPWT4paEdNZGWMi
 oM268GcX97s/KPPcqeHzQ027EC1blyW2SB2CYR34=
Authentication-Results: iva1-b95cb40edbfe.qloud-c.yandex.net;
 dkim=pass header.i=@corrigendum.ru
Received: by iva4-50c21cb1cb18.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 7AbA6KDHGR-SGJO82Jd; Fri, 25 Mar 2022 01:28:16 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <87bd50d3-72e9-2211-b53f-4046381e7419@corrigendum.ru>
Date: Fri, 25 Mar 2022 01:28:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220313175615.406390-1-james.hilliard1@gmail.com>
 <5313758f-f64d-f9f8-cdf2-3ca2ab426c7e@mind.be>
From: =?UTF-8?B?0KDQvtC80LDQvSDQlNC+0L3Rh9C10L3QutC+?= <dpb@corrigendum.ru>
In-Reply-To: <5313758f-f64d-f9f8-cdf2-3ca2ab426c7e@mind.be>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-python: migrate flit to
 new bootstrapping sequence
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgoyNC4wMy4yMDIyIDIzOjM3LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSDQv9C40YjQtdGCOgoK
Pj4gwqAgZWxzZQo+PiDCoCAkKDIpX0JBU0VfRU5WID0gJCQoSE9TVF9QS0dfUFlUSE9OX1BFUDUx
N19FTlYpCj4+IC0kKDIpX0JBU0VfQlVJTERfQ01EID0gLW0gYnVpbGQgLW4gLXcKPj4gLSQoMilf
QkFTRV9JTlNUQUxMX0NNRCA9ICQoVE9QRElSKS9zdXBwb3J0L3NjcmlwdHMvcHlpbnN0YWxsZXIu
cHkgCj4+IGRpc3QvKiAkJChIT1NUX1BLR19QWVRIT05fUEVQNTE3X0lOU1RBTExfT1BUUykKPj4g
KyMgVXNlIGZsaXQgYnVpbHQgaW4gd2hlZWwgYnVpbGRlciBmb3IgcGFja2FnZXMgdGhhdCBhcmUg
Cj4+IGhvc3QtcHl0aG9uLXB5cGEtYnVpbGQgZGVwZW5kZW5jaWVzLgo+PiArIyBUaGlzIGlzIG5l
ZWRlZCB0byBhdm9pZCBhIGNpcmN1bGFyIHdpdGggaG9zdC1weXRob24tcHlwYS1idWlsZCBhbmQg
Cj4+IHRob3NlIGRlcGVuZGVuY2llcy4KPj4gKyMKPj4gKyQoMilfQkFTRV9CVUlMRF9DTUQgPSAk
JChpZiBcCj4+ICvCoMKgwqDCoMKgwqDCoCAkJChmaWx0ZXIgXAo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBob3N0LXB5dGhvbi1mbGl0LWNvcmUgaG9zdC1weXRob24taW5zdGFsbGVyIAo+PiBo
b3N0LXB5dGhvbi1wZXA1MTcgaG9zdC1weXRob24tdG9tbGksIFwKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgJCgxKSkgXAo+PiArwqDCoMKgwqDCoMKgwqAgLCBcCj4+ICvCoMKgwqDCoMKgwqDC
oCAtbSBmbGl0X2NvcmUud2hlZWwsIFwKPj4gK8KgwqDCoMKgwqDCoMKgIC1tIGJ1aWxkIC1uIC13
IFwKPiAKPiAgwqBUaGlzIGlzIGFkZGluZyB3YXkgdG9vIG11Y2ggY29tcGxleGl0eSB0byB0aGUg
aW5mcmEganVzdCB0byBzdXBwb3J0IAo+IHRoZXNlIGZvdXIgcGFja2FnZXMuIEkgdGhpbmsgdGhl
cmUgYSBhIGNvdXBsZSBvZiBiZXR0ZXIgb3B0aW9uczoKPiAKPiAtIGRvbid0IHVzZSBweXRob24g
aW5mcmEgYXQgYWxsIGZvciB0aGVzZSBwYWNrYWdlczsgb3IKPiAtIHNldCBIT1NUX1BZVEhPTl9G
TElUX0NPUkVfQlVJTERfQ01EUyBldGMuIGluIHB5dGhvbi1mbGl0LWNvcmUubWs7IG9yCj4gLSBh
ZGQgYSBmaWZ0aCBTRVRVUF9UWVBFICJnZW5lcmljIiBvciAiY3VzdG9tIiBvciBzb21ldGhpbmcs
IHdoaWNoIAo+IHJlcXVpcmVzICQoMilfQkFTRV8qIHRvIGJlIHNldCBieSB0aGUgcHl0aG9uLWZs
aXQtY29yZS5tazsKPiAtIGluIHRoZSBpbmZyYSBjaGFuZ2UgaXQgdG8gJCgyKV9CQVNFX0JVSUxE
X0NNRCA/PSwgc2V0IAo+IEhPU1RfUFlUSE9OX0ZMSVRfQ09SRV9CQVNFX0JVSUxEX0NNRCBpbiBw
eXRob24tZmxpdC1jb3JlLm1rOyBvcgo+IC0gYWRkIGEgZmlmdGggU0VUVVBfVFlQRSAiZmxpdC1i
b290c3RyYXAiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQgd2hpY2ggCj4gb25seSBnZXRzIHVzZWQg
YnkgdGhlIHByb2JsZW1hdGljIHBhY2thZ2VzLgo+IAo+IAo+ICDCoFRoZSBsYXR0ZXIgdHdvIG9w
dGlvbnMgaGF2ZSBteSBwcmVmZXJlbmNlIGJlY2F1c2UgSSB0aGluayB0aGV5IGFyZSB0aGUgCj4g
Y2xlYW5lc3QsIGJ1dCBhbnkgb2YgdGhlbSBpcyBPSyBmb3IgbWUuIFRoZSAiZ2VuZXJpYyIgc2V0
dXAgdHlwZSBhbmQgdGhlIAo+IG92ZXJyaWRhYmxlIF9CQVNFX0JVSUxEX0NNRCB3b3VsZCBhbHNv
IHJlcXVpcmUgYW4gdXBkYXRlIGluIHRoZSBtYW51YWwuCgpJTU8sIHRoZSBzaW1wbGVzdCBpbXBs
ZW1lbnRhdGlvbiB3b3VsZCBiZToKCjEuIEZvciBob3N0LXB5dGhvbi1mbGl0LWNvcmUgYW5kIGhv
c3QtcHl0aG9uLWluc3RhbGxlciwgdXNlIApob3N0LWdlbmVyaWMtcGFja2FnZSBhbmQgZGVmaW5l
IHRoZSBidWlsZCBhbmQgaW5zdGFsbCBjb21tYW5kcyBtYW51YWxseS4KCjIuIEZvciBldmVyeSBv
dGhlciBwYWNrYWdlIHdob3NlIFNFVFVQX1RZUEUgaXMgImZsaXQiLCBoYXZlIGl0IGRlcGVuZCBv
biAKanVzdCBob3N0LXB5dGhvbi1mbGl0LWNvcmUgYW5kIGhvc3QtcHl0aG9uLWluc3RhbGxlciwg
YW5kIGJ1aWxkIHdpdGggCiJweXRob24gLW0gZmxpdF9jb3JlLndoZWVsIi4gSW4gb3RoZXIgd29y
ZHMsIGRvbid0IHVzZSAKaG9zdC1weXRob24tcHlwYS1idWlsZC4KCkkgZG9uJ3QgdGhpbmsgdGhl
cmUgYXJlIGFueSBhZHZhbnRhZ2VzIGluIHVzaW5nIHB5cGEtYnVpbGQgb3ZlciBqdXN0IApydW5u
aW5nIGZsaXRfY29yZS53aGVlbCBkaXJlY3RseSwgYW5kIGRyb3BwaW5nIGl0IHdvdWxkIHJlZHVj
ZSB0aGUgCm51bWJlciBvZiBwYWNrYWdlcyB0aGF0IG5lZWQgc3BlY2lhbCBoYW5kbGluZyBhbmQg
c2ltcGxpZnkgdGhlIApkZXBlbmRlbmN5IHRyZWUuCgoKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cHl0aG9uLWZsaXQtY29yZS9weXRob24tZmxpdC1jb3JlLm1rIAo+PiBiL3BhY2thZ2UvcHl0aG9u
LWZsaXQtY29yZS9weXRob24tZmxpdC1jb3JlLm1rCj4+IGluZGV4IDBlMDU4YTFmMTcuLmQyMDZh
NzJmODIgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWZsaXQtY29yZS9weXRob24tZmxp
dC1jb3JlLm1rCj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWZsaXQtY29yZS9weXRob24tZmxpdC1j
b3JlLm1rCj4+IEBAIC04LDYgKzgsNiBAQCBQWVRIT05fRkxJVF9DT1JFX1ZFUlNJT04gPSAzLjcu
MQo+PiDCoCBQWVRIT05fRkxJVF9DT1JFX1NPVVJDRSA9IGZsaXRfY29yZS0kKFBZVEhPTl9GTElU
X0NPUkVfVkVSU0lPTikudGFyLmd6Cj4+IMKgIFBZVEhPTl9GTElUX0NPUkVfU0lURSA9IAo+PiBo
dHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMTUvZDEvZDg3OThiODNlOTUz
ZmQ2Zjg2Y2E5YjUwZjkzZWVjNDY0YTkzMDViMDY2MTQ2OWM4MjM0ZTYxMDk1NDgxIAo+Pgo+PiDC
oCBQWVRIT05fRkxJVF9DT1JFX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKPj4gLVBZVEhPTl9GTElU
X0NPUkVfU0VUVVBfVFlQRSA9IHBlcDUxNwo+PiArUFlUSE9OX0ZMSVRfQ09SRV9TRVRVUF9UWVBF
ID0gZmxpdAo+IAo+ICDCoFRoaXMgbWVhbnMgdGhlcmUncyBubyBwYWNrYWdlIGFueSBtb3JlIHRo
YXQgdXNlcyBwZXA1MTcgc2V0dXAgdHlwZS4gRG8gCj4geW91IHRoaW5rIGl0J3MgZXZlciBnb2lu
ZyB0byBiZSB1c2VkIGFnYWluPyBPciBjYW4gd2UgcmVtb3ZlIGl0IGFsdG9nZXRoZXI/CgpJIHRo
aW5rIHB5dGhvbi1zZXR1cHRvb2xzIGNvdWxkIGJlIGEgcG90ZW50aWFsIHVzZXIgb2YgdGhpcywg
aWYgCnB5dGhvbi1weXBhLWJ1aWxkIGV2ZXIgYmVjb21lcyBidWlsZGFibGUgd2l0aG91dCBzZXR1
cHRvb2xzICh3aGljaCBpdCAKdmVyeSB3ZWxsIG1pZ2h0KS4KCi1Sb21hbi4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
