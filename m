Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E120BC433FE
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 08:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38904812C7;
	Wed, 16 Nov 2022 08:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38904812C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rkvOmEdQ5bNn; Wed, 16 Nov 2022 08:34:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D25B812CE;
	Wed, 16 Nov 2022 08:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D25B812CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF2061BF36A
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 08:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6F9A812CE
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 08:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6F9A812CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5HI2bSPqYYNh for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 08:34:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A34E812C7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A34E812C7
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 08:34:50 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 45AB7E0005;
 Wed, 16 Nov 2022 08:34:48 +0000 (UTC)
Date: Wed, 16 Nov 2022 09:34:46 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221116093446.75deaea9@booty>
In-Reply-To: <d6d839d9-7e68-6be2-7c38-98ad1294ffd2@benettiengineering.com>
References: <20221019134823.12594-1-giulio.benetti@benettiengineering.com>
 <20221030210615.49866828@windsurf>
 <901ec05a-8d90-8658-29ac-381f50ae0eaa@benettiengineering.com>
 <d6d839d9-7e68-6be2-7c38-98ad1294ffd2@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668587688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXzWZ5z+ym8RZ+6lshtZ2RrTmnN7I4RV1DXC0AEXX4A=;
 b=Gn5bDgRUJdkOzvv2e1tK2mLwMhQS+btIJl9Nk2rZdK8AKNEKhy/J8b6wsSBB8z//E2gZY/
 EdOsT16JYczObg+HCBYB0c3rjEOOa3oduJqL6Buea/ShjHGe7F4uIZpI+bt6PjFcaXdPlV
 mk62FmFF9Qf5XbEslBz90Jp1UsRMnjJYeiPpsfPcO7Wz+mREcrJRKbiMKOOkHaP4hNSg77
 MRA3SX8An4rahIwoEcDmCxQkNQfTHzSaVSvu9eYrmx1ksR+tt/K2GD9M9ZCmNd5w4gJqK5
 /G0dFB66x2ApLTMWw7vX4PGR2hcjIwbjmNyMGE6Dvlj4LMUxiSc6/7837vFp2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gn5bDgRU
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: remove wrong
 description in Config.in
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLAoKT24gV2VkLCAxNiBOb3YgMjAyMiAwMjoxNTo1NyArMDEwMApHaXVsaW8gQmVu
ZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cgo+IE9u
IDE2LzExLzIyIDAxOjMzLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiA+IEhpIFRob21hcywgTHVj
YSwKPiA+IAo+ID4gT24gMzAvMTAvMjIgMjE6MDYsIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxk
cm9vdCB3cm90ZTogIAo+ID4+IE9uIFdlZCwgMTkgT2N0IDIwMjIgMTU6NDg6MjMgKzAyMDAKPiA+
PiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4g
d3JvdGU6Cj4gPj4gIAo+ID4+PiBUaGlzIHJ0bDgxODhldSBkcml2ZXIgaXMgbm90IHRoZSBzYW1l
IGFzIHRoZSBvbmUgaW4gbWFpbmxpbmUgTGludXggdGhhdAo+ID4+PiBzdGlsbCBoYXMgcGVuZGlu
ZyB3b3JrIHRvIGJlIGRvbmUgdGhhdCBpbiB0aGlzIGRyaXZlciBpcyBkb25lLCBjaGVjazoKPiA+
Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFs
ZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9zdGFnaW5nL3I4MTg4ZXUvVE9ETwo+ID4+PiBzcGVj
aWZpY2FsbHk6Cj4gPj4+ICogU3dpdGNoIHRvIHVzZSBMSUI4MDIxMS4KPiA+Pj4gKiBTd2l0Y2gg
dG8gdXNlIE1BQzgwMjExLgo+ID4+PiAqIFN3aXRjaCB0byB1c2UgQ0ZHODAyMTEuCj4gPj4+IFNv
IGxldCdzIHJlbW92ZSB0aGUgZGVzY3JpcHRpb24gdGhhdCBpcyBub3QgdmFsaWQgYW55bW9yZS4K
PiA+Pj4KPiA+Pj4gU3VnZ2VzdGVkLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJv
b3RsaW4uY29tPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJl
bmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiA+Pj4gLS0tCj4gPj4+IFYxLT5WMjoKPiA+
Pj4gKiBpbXByb3ZlIENvbmZpZy5pbiBkZXNjcmlwdGlvbiBhcyBwb2ludGVkIGJ5IEx1Y2EgQ2Vy
ZXNvbGkKPiA+Pj4gLS0tCj4gPj4+IMKgIHBhY2thZ2UvcnRsODE4OGV1L0NvbmZpZy5pbiB8IDcg
KysrKy0tLQo+ID4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydGw4MTg4ZXUvQ29uZmln
LmluIGIvcGFja2FnZS9ydGw4MTg4ZXUvQ29uZmlnLmluCj4gPj4+IGluZGV4IDc2ZDkwODUyOTcu
LjJmYWIxZmQ1YzAgMTAwNjQ0Cj4gPj4+IC0tLSBhL3BhY2thZ2UvcnRsODE4OGV1L0NvbmZpZy5p
bgo+ID4+PiArKysgYi9wYWNrYWdlL3J0bDgxODhldS9Db25maWcuaW4KPiA+Pj4gQEAgLTQsOSAr
NCwxMCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUlRMODE4OEVVCj4gPj4+IMKgwqDCoMKgwqAgZGVw
ZW5kcyBvbiBCUjJfTElOVVhfS0VSTkVMCj4gPj4+IMKgwqDCoMKgwqAgaGVscAo+ID4+PiDCoMKg
wqDCoMKgwqDCoCBBIHN0YW5kYWxvbmUgZHJpdmVyIGZvciB0aGUgUlRMODE4OEVVIFVTQiBXaS1G
aSBhZGFwdGVyLgo+ID4+PiAtwqDCoMKgwqDCoCBUaGlzIGlzIG5lZWRlZCBvbmx5IGZvciBMaW51
eCBrZXJuZWxzIGJlZm9yZSAzLjEyLgo+ID4+PiAtwqDCoMKgwqDCoCBTaW5jZSAzLjEyLCB0aGVy
ZSBpcyBhIChzdGFnaW5nKSBkcml2ZXIgaW4gbWFpbmxpbmUsIHdpdGggYQo+ID4+PiAtwqDCoMKg
wqDCoCBzaW1pbGFyIGNvZGViYXNlLgo+ID4+PiArwqDCoMKgwqDCoCBUaGlzIHJ0bDgxODhldSBk
cml2ZXIgaXMgbm90IHRoZSBzYW1lIGFzIHRoZSBvbmUgaW4gbWFpbmxpbmUKPiA+Pj4gK8KgwqDC
oMKgwqAgTGludXggdGhhdCBzdGlsbCBoYXMgcGVuZGluZyB3b3JrIHRvIGJlIGRvbmUgdGhhdCBp
biB0aGlzCj4gPj4+ICvCoMKgwqDCoMKgIGRyaXZlciBpcyBkb25lLCBjaGVjazoKPiA+Pj4gKyAg
ICAgIAo+ID4+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL3N0YWdpbmcvcjgxODhldS9UT0RPICAK
PiA+Pgo+ID4+IEkgZG9uJ3Qgc2VlIGFueSB0aGluZyBpbiB0aGlzIFRPRE8gdGhhdCBleHBsYWlu
cyB3aHkgdGhlIG91dC1vZi10cmVlCj4gPj4gZHJpdmVyIGlzIGJldHRlciB0aGFuIHRoZSBtYWlu
bGluZSBkcml2ZXIuCj4gPj4KPiA+PiBUaGUgb3V0LW9mLXRyZWUgZHJpdmVyIGhhcyBiZWVuIGlu
dGVncmF0ZWQgaW50byBkcml2ZXJzL3N0YWdpbmcvLCBhbmQKPiA+PiB0aGlzIFRPRE8gZmlsZSBs
aXN0cyB3aGF0IHNob3VsZCBiZSBpbXByb3ZlZCBpbiB0aGUgZHJpdmVyIHNvIHRoYXQgaXQKPiA+
PiBjYW4gYmUgZ3JhZHVhdGVkIHRvIG1vdmUgb3V0c2lkZSBvZiBkcml2ZXJzL3N0YWdpbmcvIGlu
dG8gdGhlIHByb3Blcgo+ID4+IGRyaXZlcnMvbmV0L3dpcmVsZXNzLyBsb2NhdGlvbi4KPiA+Pgo+
ID4+IEkgZG9uJ3Qgc2VlIGFueXRoaW5nIGluIHRoaXMgVE9ETyB0aGF0IGluZGljYXRlcyB0aGF0
IHRoZSBvdXQtb2YtdHJlZQo+ID4+IGRyaXZlciBoYXMgIm1vcmUgZmVhdHVyZXMiIHRoYW4gdGhl
IG1haW5saW5lIGRyaXZlciwgc28gdG8gbWUgdGhlCj4gPj4gQ29uZmlnLmluIGhlbHAgdGV4dCBz
dGlsbCBtYWtlcyBzZW5zZS4KPiA+Pgo+ID4+IENvdWxkIHlvdSBnaXZlIHNvbWUgbW9yZSBkZXRh
aWxzPyAgCj4gPiAKPiA+IFRoZSBUT0RPIGZpbGVbMF0gaXMgb3V0ZGF0ZWQgYmVjYXVzZSBpdCBz
dGF0ZXMgdGhhdDoKPiA+ICogU3dpdGNoIHRvIHVzZSBMSUI4MDIxMS4KPiA+ICogU3dpdGNoIHRv
IHVzZSBNQUM4MDIxMS4KPiA+ICogU3dpdGNoIHRvIHVzZSBDRkc4MDIxMS4KPiA+IGFyZSBzdGls
bCBwZW5kaW5nLCBidXQgaXQncyB0cnVlIG5vdCBiZWNhdXNlIGlmIHdlIGNoZWNrIHRoZSBLY29u
ZmlnWzFdCj4gPiB3ZSBmaW5kICdkZXBlbmRzIG9uIENGRzgwMjExJyBhbmQgTElCODAyMTEuIEFs
c28gaWYgd2UgY2hlY2sgZm9yCj4gPiBpZWVlODAyMTFfKigpIGNhbGxzZSBpbnQgZHJpdmVycy9z
dGFnaW5nL3I4MTg4ZXUgZm9sZGVyIHdlIGZpbmQgYSBsb3Qgb2YKPiA+IGNhbGxzLiBTbyBJIHRo
aW5rIHRoaXMgbW9kdWxlIGlzIG9ubHkgYSBjb3B5IG9mIHRoZSBMaW51eCBkcml2ZXIgdGhhdAo+
ID4gY2FuIHdvcmsgYXMgc3BlY2lmaWVkIGluIHRoZSBhY3R1YWwgaGVscCh3aXRoIExpbnV4IHZl
cnNpb24gYmVmb3JlIDMuMTIuCgpJIGhhdmVuJ3QgY2hlY2tlZCBteXNlbGYsIGJ1dCBpZiB5b3Ug
dGhpbmsgdGhlIHRyYW5zaXRpb24gdG8gY2ZnODAyMTEKYW5kIGxpYjgwMjExIGlzIGNvbXBsZXRl
ZCBpbiBtYWlubGluZSwgeW91IGNhbiBzZW5kIGEgcGF0Y2ggdG8gaGF2ZSB0aGUKVE9ETyB1cGRh
dGVkIGluIHVwc3RyZWFtIExpbnV4LiBUaGF0IHdvdWxkIHJlZHVjZSBjb25mdXNpb24uCgo+ID4g
RG9lcyBpdCBtYXliZSBtYWtlIHNlbnNlIHRvIGFkZCBpbiB0aGUgaGVscCBzZWN0aW9uOgo+ID4g
YGBgCj4gPiBJZiB1c2luZyBMaW51eCAzLjEyKyBpdCdzIHJlY29tbWVuZGVkIHRvIHVzZSBMaW51
eCBkcml2ZXIKPiA+IGBgYAoKWWVzLCBhYnNvbHV0ZWx5LCBidXQgb25seSBpZiBhcmUgeW91IHJl
YXNvbmFibHkgc3VyZSB0aGF0IExpbnV4IDMuMTIgaGFzCmFsbCB0aGUgc2FtZSBydGw4MTg4ZXUg
ZmVhdHVyZXMgdGhhdCBpdCBoYXMgY3VycmVudGx5LgoKLS0gCkx1Y2EgQ2VyZXNvbGksIEJvb3Rs
aW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4u
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
