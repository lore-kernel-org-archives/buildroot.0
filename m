Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD31C43334
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 23:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07003425B9;
	Sat, 11 Jun 2022 23:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GdieDF506Hx7; Sat, 11 Jun 2022 23:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC70B425B3;
	Sat, 11 Jun 2022 23:31:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A91AA1BF343
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 23:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93E7040133
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 23:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tv90w0Zc8v_D for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 23:31:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.steinkuehler.net (unknown [70.184.225.181])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DDAF400DD
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 23:31:55 +0000 (UTC)
Received: (qmail 12341 invoked from network); 11 Jun 2022 18:31:52 -0500
Received: from 152.ks.newtek.dhcp (HELO ?10.34.1.152?) (charles@10.34.1.152)
 by mail.steinkuehler.net with SMTP; 11 Jun 2022 18:31:52 -0500
Message-ID: <55b672a6-81d5-a050-3420-fea79054ab63@steinkuehler.net>
Date: Sat, 11 Jun 2022 18:31:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: buildroot@buildroot.org
References: <7dfaf383-9700-4b0a-83fb-952c5116e7b0@steinkuehler.net>
 <d459a460-312b-3daf-4b9f-a36974334b6b@mind.be>
From: Charles Steinkuehler <charles@steinkuehler.net>
In-Reply-To: <d459a460-312b-3daf-4b9f-a36974334b6b@mind.be>
Subject: Re: [Buildroot] Patching Package Dependencies
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhhbmtzIQoKVGhhdCdzIHByZXR0eSBtdWNoIHdoYXQgSSdkIGZpZ3VyZWQgb3V0LCBidXQgSSB3
YW50ZWQgdG8gY2hlY2sgYW5kIG1ha2UgCnN1cmUgSSBkaWRuJ3QgbWlzcyBhbnl0aGluZy4gIEkn
dmUgY3VycmVudGx5IGdvdCBhIGZvcmsgb2YgQnVpbGRyb290IAp3aXRoIGp1c3QgdGhlIG9uZSBk
ZXBlbmRlbmN5IGNoYW5nZSwgYnV0IEknbGwgcHJvYmFibHkgc3dpdGNoIHRvIApkZWZpbmluZyB0
aGUgIm15YXZyZHVkZSIgcGFja2FnZSBpbiBteSBCUjJfRVhURVJOQUwgd2l0aCB0aGUgY2hhbmdl
cyBJIG5lZWQuCgpQbGF5aW5nIGFyb3VuZCB3aXRoIGxvY2FsLm1rIGFuZCBBVlJEVURFX0VYVFJB
Q1RfREVQRU5ERU5DSUVTIGp1c3Qgc2VlbXMgCmxpa2UgYSByZWNpcGUgZm9yIGV2ZW50dWFsIGRp
c2FzdGVyLiAgOi0pCgpPbiA2LzExLzIwMjIgMTI6MzggUE0sIEFybm91dCBWYW5kZWNhcHBlbGxl
IHdyb3RlOgo+ICDCoEhpIENoYXJsZXMsCj4gCj4gT24gMDkvMDYvMjAyMiAyMzoyMSwgQ2hhcmxl
cyBTdGVpbmt1ZWhsZXIgd3JvdGU6Cj4+IEkgYW0gdXNpbmcgQnVpbGRyb290ICgyMDIyLjAyLjIp
IHdpdGggYSBjb3VwbGUgQlIyX0VYRVJOQUwgZGlyZWN0b3JpZXMgCj4+IGFuZCBJIG5lZWQgdG8g
bW9kaWZ5IGEgcGFja2FnZSBwcm92aWRlZCB3aXRoIEJ1aWxkcm9vdCAoYXZyZHVkZSkuwqAgSSAK
Pj4gY2FuIGVhc2lseSBwYXRjaCB0aGUgY29kZSBieSBhZGRpbmcgYSBwYXRjaCBmaWxlIHRvIG15
IAo+PiBCUjJfRVhURVJOQUxfRk9PX1BBVEgvcGF0Y2hlcyBkaXJlY3Rvcnkgd2hpY2ggaXMgYWRk
ZWQgdG8gCj4+IEJSMl9HTE9CQUxfUEFUQ0hfRElSLsKgIFRoZSBwcm9ibGVtIGlzIG15IGNvZGUg
Y2hhbmdlcyByZXF1aXJlIGEgbmV3IAo+PiBsaWJyYXJ5IChsaWJncGlvZCkgd2hpY2ggaXMgcGFy
dCBvZiBteSBjb25maWd1cmF0aW9uIGJ1dCBpcyBub3QgbGlzdGVkIAo+PiBhcyBhIHBhY2thZ2Ug
ZGVwZW5kZW5jeSBmb3IgYXZyZHVkZSBieSBCdWlsZHJvb3QsIHNvIGJ1aWxkcyBmYWlsLgo+Pgo+
PiBJcyB0aGVyZSBhIHdheSB0byBleHRlbmQgdGhlIGZpbGVzIHVuZGVyIEJ1aWxkcm9vdC9wYWNr
YWdlIHVzaW5nIGEgCj4+IEJSMl9FeHRlcm5hbCBkaXJlY3Rvcnk/Cj4gCj4gIMKgT2ZmaWNpYWxs
eSwgbm8gdGhlcmUgaXNuJ3QuIElmIHlvdSB3YW50IHRvIG92ZXJyaWRlIGFuIGV4aXN0aW5nIAo+
IHBhY2thZ2UgKG90aGVyIHRoYW4gcGF0Y2hpbmcgaXQpLCB0aGUgb25seSB0aGluZyB5b3UgY2Fu
IGRvIGlzIHRvIGNyZWF0ZSAKPiBhbiBlbnRpcmVseSBuZXcgcGFja2FnZSB3aXRoIGEgZGlmZmVy
ZW50IG5hbWUuCj4gCj4gIMKgVGhpcyBpcyBqdXN0IGEgdGVjaG5pY2FsIGxpbWl0YXRpb24gYmVj
YXVzZSBldmVyeXRoaW5nIGlzIGluY2x1ZGVkIAo+IHRvZ2V0aGVyIGluIG9uZSBiaWcgYG1ha2Vg
IGRhdGFiYXNlLCBhbmQgYG1ha2VgIGRvZXNuJ3QgaGF2ZSBhIHdheSB0byAKPiBvdmVycmlkZSBl
dmVyeXRoaW5nIGZyb20gYSBwcmV2aW91c2x5IGluY2x1ZGVkIG1ha2VmaWxlLiBJbiBhZGRpdGlv
biwgCj4gc29tZSBvZiB0aGUgdmFyaWFibGVzIGFyZSB1c2VkIGltbWVkaWF0ZWx5IHRvIGRlZmlu
ZSBkZXBlbmRlbmNpZXMsIHNvIGlmIAo+IHlvdSB3b3VsZCBvdmVycmlkZSB0aGVtIGluIHRoZSBl
eHRlcm5hbCwgdGhhdCBkb2Vzbid0IGhhdmUgdGhlIGRlc2lyZWQgCj4gZWZmZWN0LiBUaGlzIGlz
IHRoZSBjYXNlIGZvciBfVkVSU0lPTiBhbmQgX0RFUEVOREVOQ0lFUy4gU28geW91J3JlIG91dCAK
PiBvZiBsdWNrLgo+IAo+ICDCoFRoZXJlIGlzIG9uZSBoYWNrIHlvdSBjb3VsZCB0bywgYW5kIHRo
YXQgaXMgdG8gYWJ1c2UgbG9jYWwubWsgKHRoZSAKPiBCUjJfUEFDS0FHRV9PVkVSUklERV9GSUxF
LCBub3JtYWxseSB1c2VkIGZvciBzZXR0aW5nIE9WRVJSSURFX1NSQ0RJUikuIAo+IFRoaXMgZmls
ZSBpcyByZWFkIGJlZm9yZSB0aGUgcGFja2FnZSBtYWtlZmlsZS4gT2YgY291cnNlLCBhdnJkdWRl
Lm1rIAo+IGFscmVhZHkgZGVmaW5lcyBBVlJEVURFX0RFUEVOREVOQ0lFUywgc28gaWYgeW91J2Qg
c2V0IHNvbWV0aGluZyBpbiAKPiBsb2NhbC5taywgaXQgd291bGQganVzdCBnZXQgbG9zdC4gQnV0
IHlvdSBjb3VsZCAoYWdhaW4pIGFidXNlIAo+IEFWUkRVREVfRVhUUkFDVF9ERVBFTkRFTkNJRVMg
d2hpY2ggaXMgbm90IHNldCBieSBhdnJkdWRlLm1rLgo+IAo+ICDCoEhvd2V2ZXIsIHNpbmNlIG5v
IHBhY2thZ2UgZGVwZW5kcyBvbiBhdnJkdWRlLCBpdCdzIG11Y2ggc2ltcGxlciBhbmQgCj4gY2xl
YW5lciB0byBzaW1wbHkgYWRkIGEgbmV3IHBhY2thZ2UgbXlhdnJkdWRlIHRvIHlvdXIgZXh0ZXJu
YWwuCj4gCj4gIMKgUmVnYXJkcywKPiAgwqBBcm5vdXQKPiAKPiAKPj4KPj4gQWx0ZXJuYXRlbHks
IGlzIGRlZmluaW5nIGEgcGFja2FnZSBpbiBteSBCUjJfRXh0ZXJuYWwgZGlyZWN0b3J5IHdpdGgg
Cj4+IHRoZSBzYW1lIG5hbWUgYXMgYW4gb2ZmaWNpYWwgQnVpbGRyb290IHBhY2thZ2UgYWxsb3dl
ZC9yZWNvbW1lbmRlZD8KPj4KPj4gLi4ub3IgYXJlIHRoZXJlIGFueSBvdGhlciBzdWdnZXN0aW9u
cyBmb3IgbW9kaWZ5aW5nIGEgQnVpbGRyb290IAo+PiBwYWNrYWdlIHdpdGhvdXQgbWFraW5nIGEg
bG9jYWwgYnJhbmNoIGFuZCBhcHBseWluZyBteSBuZWVkZWQgY2hhbmdlcz8KPj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCkNoYXJsZXMgU3RlaW5rdWVo
bGVyCmNoYXJsZXNAc3RlaW5rdWVobGVyLm5ldApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
