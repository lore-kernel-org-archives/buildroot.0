Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DFDC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 622D440322;
	Sun, 26 Nov 2023 21:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 622D440322
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vL-fxm1_0-lL; Sun, 26 Nov 2023 21:08:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BF5A40325;
	Sun, 26 Nov 2023 21:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BF5A40325
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDF701BF40A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96C80812A1
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96C80812A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QDKYztrO8Tnb for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:08:25 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72D7D81098
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72D7D81098
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8388C7804FD;
 Sun, 26 Nov 2023 22:08:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 22:08:18 +0100
Date: Sun, 26 Nov 2023 22:08:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: R <irgstg@gmail.com>
Message-ID: <20231126210818.GE3177259@scaer>
References: <20211030083753.192-1-irgstg@gmail.com>
 <20211031185236.25e4b639@windsurf>
 <CAGKnWQeMCt+8FZ0pPNc=F8LPhGnkt+WVL4MTujqQSUyDHTb5Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGKnWQeMCt+8FZ0pPNc=F8LPhGnkt+WVL4MTujqQSUyDHTb5Tg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701032903;
 bh=k+NPUr0lhmOMS8RtTKtih7DJbfIy8Lu/vbINbfTipUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kABUUmT8JvGJoRvDoe77fM/qwytmw4cX2y/jAWfbtYQXnPy1lSrTePd2TDm8jyv4G
 +o+P3LfnddS3YF74ZHZq0JC6DPlOAhpp0yfaVGHTee6OQ85m8Z8BILLHbO4hmjQaK8
 GBlZ4/7UYG7Ioqr6RSqH4vIAwNNzO+tK7i+dG8KLJ0hV83jpGYGykpMvET0mCNJf2n
 dKSZJYUfjf48DMGAOJRYszn0dfW2lIx1j2q+3mplWogidFv6t7ENqyV4UCYHuxg8fa
 VVyugnTnvykrHAjK1vzNjg+Imc3eSmgtST93tb5butIdIQ6Ta6P6z20f3Z+V1ZbvEO
 WF6fqtDQIn2BA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kABUUmT8
Subject: Re: [Buildroot] [PATCH] package/glibc: optional MTE support in glibc
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UiwgQWxsLAoKW3BsZWFzZSBkbyBub3QgdG9wLXBvc3QsIGJ1dCBkbyByZXBseSBpbi1saW5lLCBs
aWtlIEkgZG8gYmVsb3ddCgpPbiAyMDIzLTExLTI2IDIyOjI4ICswMjAwLCBSIHNwYWtlIHRodXNs
eToKPiBJdCBoYXMgYmVlbiBhIHdoaWxlLi4uIGFuZCBJJ20gcmVhbGx5IHNvcnJ5IGZvciB0aGF0
LgoKTm8gd29ycmllcywgd2UgYWxsIGhhdmUgYSBsaWZlIG91dHNpZGUgb3BlbiBzb3VyY2UgcHJv
amVjdHMhIDstKQoKPiBCdXQgSSBkbyB0aGluayB0aGlzIGNhbiBiZSB1c2VmdWwgLSBJIHRvb2sg
YSBsb29rIGF0IHRoZSBjb2RlIGEtYml0Cj4gYW5kIGhhdmVuJ3Qgc2VlbiBpdCBzdXBwb3J0cyBj
b21waWxpbmcgZ2xpYmMgd2l0aCBNVEUuCj4gTWF5IEkgY29udGludWUgdG8gcmVzb2x2ZSB5b3Vy
IGNvbW1lbnRzPwoKSGF2aW5nIE1URSBzdXBwb3J0IGxvb2tzIGludGVyZXN0aW5nLCBzbyB5ZXMs
IHlvdSBhcmUgd2VsY29tZSB0bwpjb250aW51ZSB3b3JraW5nIG9uIHRoYXQhCgo+IHNob3VsZCBp
dCBiZSBpbiB0aGlzIHRocmVhZCBvciBhIG5ldyBvbmUgaXMgcHJlZmVycmVkPwoKSWYgeW91IHdh
bnQgdG8gcmVwbHkgdG8gdGhlIGNvbW1lbnRzLCB0aGVuIGp1c3QgZG8gc28gYXMgYSByZXBseSB0
bwpUaG9tYXMnIGVtYWlsLCBhbmQgcmVwbHkgdG8gaW5kaXZpZHVhbCBjb21tZW50cyB0aGVyZSAo
bGlrZSBJJ20gZG9pbmcKZm9yIHlvdXIgb3duIG1haWwpLgoKSWYgeW91IHdhbnQgdG8gcmVzZW5k
IGEgbmV3IHBhdGNoIHdoaWNoIGFkZHJlc3NlcyBUaG9tYXMnIGNvbW1lbnRzLCB0aGVuCnNlbmQg
aXQgYXMgYSBuZXcgdGhyZWFkLiBEb247dCBmb3JnZXQgdG8gYWRkIGEgY2hhbmdlbG9nLCBzZWUg
dGhlIG1hbnVhbApmb3IgZnVydGhlciBkZXRhaWxzOgoKICAgIGh0dHBzOi8vYnVpbGRyb290Lm9y
Zy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1sI3N1Ym1pdHRpbmctcGF0Y2hlcwoKUmVnYXJk
cywKWWFubiBFLiBNT1JJTi4KCj4gVGhhbmtzIDopCj4gT24gU3VuLCBPY3QgMzEsIDIwMjEgYXQg
Nzo1MuKAr1BNIFRob21hcyBQZXRhenpvbmkgPCBbMV10aG9tYXMucGV0YXp6b25pQGJvb3RsaW4u
Y29tPiB3cm90ZToKPiAKPiAgIEhlbGxvLAo+IAo+ICAgVGhhbmtzIGEgbG90IGZvciB5b3VyIGNv
bnRyaWJ1dGlvbiEgU2VlIGJlbG93IHNvbWUgY29tbWVudHMuCj4gCj4gICBPbiBTYXQsIDMwIE9j
dCAyMDIxIDExOjM3OjUwICswMzAwCj4gICAiIFsyXWlyZ3N0Z0BnbWFpbC5jb20iIDwgWzNdaXJn
c3RnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gICA+IEFkZGluZyBvcHRpb24gQlIyX1BBQ0tBR0Vf
R0xJQkNfTVRFIHRvIGNvbmZpZ3VyZSBnbGliYyB3aXRoIE1URSBzdXBwb3J0Lgo+ICAgPiBXaGVu
IGVuYWJsZWQsIGdsaWJjcyBjb25maWd1cmF0aW9uIHByb2Nlc3MgcnVucyB3aXRoIGAtLWVuYWJs
ZS1tZW1vcnktdGFnZ2luZ2AgWzFdLgo+ICAgPgo+ICAgPiBNVEUgKE1lbW9yeSBUYWdnaW5nIEV4
dGVuc2lvbikgaXMgYW4gSVNBIGV4dGVuc2lvbiB3aGljaCBhaW1zIHRvIGltcHJvdmUgc2VjdXJp
dHkgb24gQVJNdjguNS1BIFsyXS4KPiAgID4gVGhlIGxpbnV4IGtlcm5lbCBzdXBwb3J0cyB0aGlz
IGZlYXR1cmUgdmlhIENPTkZJR19BUk02NF9NVEUuCj4gICA+IEluIG9yZGVyIGZvciBnbGliYydz
IE1URSBzdXBwb3J0IHRvIHdvcmsgcHJvcGVybHksIHRoZSBydW5uaW5nIGtlcm5lbCBoYXMgdG8g
c3VwcG9ydCB0aGF0Lgo+IAo+ICAgQ291bGQgeW91IHdyYXAgdGhlIGxpbmVzIG9mIHlvdXIgY29t
bWl0IGxvZyB0byA3MiBjb2x1bW5zPwo+IAo+ICAgPiBkZXBlbmRlbmNpZXM6Cj4gICA+wqAgLSBz
dXBwb3J0ZWQgb24gYWFyY2g2NCBvbmx5IChCUjJfYWFyY2g2NCkKPiAgID7CoCAtIHJlcXVpcmVz
IGJpbnV0aWxzIHZlcnNpb24gMi4zMy4xIG9yIG5ld2VyICghQjJfQklOVVRJTFNfVkVSU0lPTl8y
XzMyX1gpCj4gICA+wqAgLSByZXF1aXJlcyBhdCBsZWFzdCBsaW51eCA1LjQgaGVhZGVycyAoQlIy
X1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVfNCkKPiAgID4KPiAgID4gWzFdCj4gICBbNF1o
dHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1nbGliYy5naXQ7YT1ibG9iO2Y9SU5TVEFMTDto
PTAyZGNmNmIxY2EzYTRjNDNhMTdmZGNhZTVlN2RhZTgxODljMWM1MGI7aGI9SEVBRCNsMTQ1Cj4g
ICA+IFsyXSBbNV1odHRwczovL2NvbW11bml0eS5hcm0uY29tL2RldmVsb3Blci9pcC1wcm9kdWN0
cy9wcm9jZXNzb3JzL2IvcHJvY2Vzc29ycy1pcC1ibG9nL3Bvc3RzL2VuaGFuY2luZy1tZW1vcnkt
c2FmZXR5Cj4gICA+Cj4gICA+IFNpZ25lZC1vZmYtYnk6IFs2XWlyZ3N0Z0BnbWFpbC5jb20gPCBb
N11pcmdzdGdAZ21haWwuY29tPgo+IAo+ICAgQ291bGQgeW91IHJlc2VuZCB3aXRoIGEgcmVhbCBu
YW1lID8gV2UgY2Fubm90IGFjY2VwdCBhbm9ueW1vdXMKPiAgIGNvbnRyaWJ1dGlvbnMuCj4gCj4g
ICA+ICtjb25maWcgQlIyX1BBQ0tBR0VfR0xJQkNfTVRFCj4gICA+ICvCoCDCoCDCoGJvb2wgIklu
c3RhbGwgZ2xpYmMgc3VwcG9ydCBmb3IgTVRFIgo+IAo+ICAgUmVwZWF0aW5nIHRoYXQgaXQncyBn
bGliYyByZWxhdGVkIGlzIG5vdCBuZWNlc3NhcnksIGFuZCBtYWtpbmcgIk1URSIKPiAgIGV4cGxp
Y2l0IHNlZW1zIHVzZWZ1bC4gU28gcGVyaGFwczoKPiAKPiAgIMKgIMKgIMKgIMKgIGJvb2wgImVu
YWJsZSBNZW1vcnkgVGFnZ2luZyBFeHRlbnNpb24gKE1URSkgc3VwcG9ydCIKPiAKPiAgID4gK8Kg
IMKgIMKgZGVwZW5kcyBvbiBCUjJfYWFyY2g2NAo+ICAgPiArwqAgwqAgwqBkZXBlbmRzIG9uICFC
UjJfQklOVVRJTFNfVkVSU0lPTl8yXzMyX1gKPiAgID4gK8KgIMKgIMKgZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfNV80Cj4gICA+ICvCoCDCoCDCoGhlbHAKPiAgID4g
K8KgIMKgIMKgIMKgRW5hYmxpbmcgdGhpcyBvcHRpb24gd2lsbCBjb25maWd1cmUsIGNvbXBpbGUK
PiAgID4gK8KgIMKgIMKgIMKgYW5kIGluc3RhbGwgZ2xpYmMgc3VwcG9ydCBmb3IgTVRFIChNZW1v
cnkgVGFnZ2luZyBFeHRlbnNpb24pLgo+ICAgPiArwqAgwqAgwqAgwqBQbGVhc2UgYmUgYXdhcmUs
IGluIG9yZGVyIGZvciB0aGF0IHRvIHdvcmsgcHJvcGVybHksCj4gICA+ICvCoCDCoCDCoCDCoGtl
cm5lbCBzdXBwb3J0IGZvciBNVEUgKENPTkZJR19BUk02NF9NVEUpLCBhbmQgYQo+ICAgPiArwqAg
wqAgwqAgwqBzdXBwb3J0ZWQgQ1BVIGFyZSBuZWVkZWQuCj4gCj4gICBJbnN0ZWFkIG9mIGp1c3Qg
c2F5aW5nIHNvLCB5b3UgY291bGQgZG8gdGhpcyBpbiBbOF1nbGliYy5tazoKPiAKPiAgIGlmZXEg
KCQoQlIyX1BBQ0tBR0VfR0xJQkNfTVRFKSx5KQo+ICAgR0xJQkNfQ09ORl9PUFRTICs9IC0tZW5h
YmxlLW1lbW9yeS10YWdnaW5nCj4gICBkZWZpbmUgR0xJQkNfTElOVVhfQ09ORklHX0ZJWFVQUwo+
ICAgwqAgwqAgwqAgwqAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfQVJNNjRfTVRF
KQo+ICAgZW5kZWYKPiAgIGVuZGlmCj4gCj4gICBPZiBjb3Vyc2UsIHlvdSBuZWVkIHRvIGFkZCAk
KEdMSUJDX0NPTkZfT1BUUykgaW5zaWRlCj4gICBHTElCQ19DT05GSUdVUkVfQ01EUy4KPiAKPiAg
IE90aGVyIHRoYW4gdGhhdCwgaXQgbG9va3MgZ29vZCB0byBtZS4KPiAKPiAgIERvIHdlIG5lZWQg
c3BlY2lhbCBjb21waWxlciBvcHRpb25zIHRvIG1ha2UgdXNlIG9mIE1URSA/Cj4gCj4gICBCZXN0
IHJlZ2FyZHMsCj4gCj4gICBUaG9tYXMKPiAgIC0tCj4gICBUaG9tYXMgUGV0YXp6b25pLCBjby1v
d25lciBhbmQgQ0VPLCBCb290bGluCj4gICBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nIGFuZCB0cmFpbmluZwo+ICAgWzldaHR0cHM6Ly9ib290bGluLmNvbQo+IAo+IExpbmtz
Ogo+IDEuIG1haWx0bzp0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tCj4gMi4gbWFpbHRvOmly
Z3N0Z0BnbWFpbC5jb20KPiAzLiBtYWlsdG86aXJnc3RnQGdtYWlsLmNvbQo+IDQuIGh0dHBzOi8v
c291cmNld2FyZS5vcmcvZ2l0Lz9wPWdsaWJjLmdpdDthPWJsb2I7Zj1JTlNUQUxMO2g9MDJkY2Y2
YjFjYTNhNGM0M2ExN2ZkY2FlNWU3ZGFlODE4OWMxYzUwYjtoYj1IRUFEI2wxNDUKPiA1LiBodHRw
czovL2NvbW11bml0eS5hcm0uY29tL2RldmVsb3Blci9pcC1wcm9kdWN0cy9wcm9jZXNzb3JzL2Iv
cHJvY2Vzc29ycy1pcC1ibG9nL3Bvc3RzL2VuaGFuY2luZy1tZW1vcnktc2FmZXR5Cj4gNi4gbWFp
bHRvOmlyZ3N0Z0BnbWFpbC5jb20KPiA3LiBtYWlsdG86aXJnc3RnQGdtYWlsLmNvbQo+IDguIGh0
dHA6Ly9nbGliYy5tawo+IDkuIGh0dHBzOi8vYm9vdGxpbi5jb20KCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
