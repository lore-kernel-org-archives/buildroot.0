Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC73C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 20:05:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF6B1610A1
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 20:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF6B1610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C548483529;
	Fri,  3 Sep 2021 20:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MfhiR-KeJJwN; Fri,  3 Sep 2021 20:05:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3364834D3;
	Fri,  3 Sep 2021 20:05:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8BB11BF841
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 20:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D48D56068F
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 20:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2RGGYOKw6G4 for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 20:05:24 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
Received: from smtpcmd13156.aruba.it (smtpcmd13156.aruba.it [62.149.156.156])
 by smtp3.osuosl.org (Postfix) with ESMTP id 483B26065F
 for <buildroot@busybox.net>; Fri,  3 Sep 2021 20:05:24 +0000 (UTC)
Received: from [192.168.47.128] ([141.136.161.132])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MFKJmHoOpiqGsMFKKmaVxd; Fri, 03 Sep 2021 21:58:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630699098; bh=EjkJUqOSUJdL4rk3gwff7WaJVVzf4+ZmYnuA0d4/9Xg=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=ifKaAHhYIuKxex5JQnSfTAMkPoZDx/GNZgx9+MJlur5EnbchQBWpMJcStondBOWUu
 WEhKnK/XOeeAQkULPkzQgxXGY//j48C2NqR/qvv+1ajjpgDwimJ+9XNFWzjvp/4PUx
 ubyk/xI8qimblzHRBK7Ax02gz+j2wmrW4bjKBeggFVTpYmjbvjB1qwAe1lQh7lI0iZ
 eoje96J3dB9MRYATf6a2d9og0vBY46vdb8dhsMA5EAdMIWhBFfj/FW475hEDc2Tt5t
 m+Qh0A4vyJW4X7n70qXJfPfpZlR10WpF6JdBWRQKBGxj/kVxYHtSEClIZH+2jz0JSC
 eMKnN+o1zwUVA==
To: Nevo Hed <nhed+buildroot@starry.com>
References: <877dfyrwao.fsf@dell.be.48ers.dk>
 <30117DCC-D442-43F5-8388-384C8EE48769@benettiengineering.com>
 <8735qlswc0.fsf@dell.be.48ers.dk>
 <095867d2-b750-f9fb-0089-43ca736a891c@benettiengineering.com>
 <CABGDZCm57JZWuSfmma_zdVfvP=O9yiAo5SDe_uQPrmFk8N=gRA@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <2f818924-7007-a4b3-e995-f9153f20b96d@benettiengineering.com>
Date: Fri, 3 Sep 2021 21:58:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CABGDZCm57JZWuSfmma_zdVfvP=O9yiAo5SDe_uQPrmFk8N=gRA@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfBAZnFCaeSEH1pHrfDmw0JvU13hZEqc76J8G2MQMJ3oPglwXzQLl/rDWfxUHQIdqTlLBNkwADDe2ydTUFiKL7pIQv2Mw98coKV1mRClCWnQmD/nfoxCj
 z5PLqcK/HkYUOn8hFw5AJls1YXoCauXqA3KfMjPiaIZYrnTCJc+SJOPiX6+MSCMhUBedMr+lZKCXWfQ6UDWERSQEuFLzWAiBxXF4FLo3zLHsDRUTDUD1DNXj
 fvuonTQu/DPT5w3N4NrAF7keDeA5N2OAt5K2zv2e2sNoxofMThNzDKugUYO9hRIcXb3iihdHhszrDMdCgyPhrw==
Subject: Re: [Buildroot] What's wrong with patchwork
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
Cc: buildroot@busybox.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

T24gOS8zLzIxIDk6MzggUE0sIE5ldm8gSGVkIHdyb3RlOgo+IEJUVyBlYWNoIGFuZCBldmVyeSBt
ZXNzYWdlIGNvbWluZ8KgZnJvbSB0aGUgbWFpbGluZyBsaXN0IG92ZXIgdGhlIHBhc3QgCj4gZmV3
IGRheXMgc2VlbXMgdG8gYmUgZmxhZ2dlZCBieSBnbWFpLCBldmVuIGlmIHRoZSBzZW5kZXIgaXMg
d2l0aGluIGdtYWlsLgo+IFRyeWluZyB0byBndWVzcyB3aGF0IGdtYWlsIGlzIHRoaW5raW5nIG1p
Z2h0IGJlIGFuIHVwaGlsbCBiYXR0bGUgYnV0IAo+IHdvbmRlcmluZyBhYm91dCB0aGF0IGxpc3Qg
Y2hhbmdlIC0KPiBEb2VzIHRoZSBtYWlsaW5nIGxpc3QgY2hhbmdlIG1hcCB0byBleGlzdGluZyBE
S0lNL1NQRj8KPiAKPiBpbWFnZS5wbmcKCkFoLCBhbnl3YXkgSSdtIG5vdCBob3N0ZWQgb24gZ21h
aWwuIEJ1dCBwcmV0dHkgc3RyYW5nZSBmb3IgdGhlIGdtYWlsIApob3N0ZWQgb25lcy4KCi0tIApH
aXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKPiBPbiBGcmksIFNlcCAzLCAy
MDIxIGF0IDEyOjQ5IFBNIEdpdWxpbyBCZW5ldHRpIAo+IDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRp
ZW5naW5lZXJpbmcuY29tIAo+IDxtYWlsdG86Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbT4+IHdyb3RlOgo+IAo+ICAgICBPbiA5LzMvMjEgMjowMCBQTSwgUGV0ZXIgS29yc2dh
YXJkIHdyb3RlOgo+ICAgICAgPj4+Pj4+ICJHaXVsaW8iID09IEdpdWxpbyBCZW5ldHRpCj4gICAg
IDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tCj4gICAgIDxtYWlsdG86Z2l1
bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4+IHdyaXRlczoKPiAgICAgID4KPiAg
ICAgID4gSGksCj4gICAgICA+Cj4gICAgICA+wqAgwqA+IFRoaXMgcGF0Y2hbMV0gc3RpbGwgZG9l
c27igJl0IHNob3cgdXAuCj4gICAgICA+wqAgwqA+IERvIEkgcmVzZW5kIGl0Pwo+ICAgICAgPgo+
ICAgICAgPiBZZXMsIHBsZWFzZS4KPiAgICAgID4KPiAgICAgID7CoCDCoD4gTWF5YmUgb3RoZXIg
cGF0Y2hlcyBoYXZlIGJlZW4gbG9zdCBvbiBwYXRjaHdvcmsuIEkgZG9u4oCZdCBrbm93IGlmCj4g
ICAgICA+wqAgwqA+IHBhdGNod29yayB3b3JrcyBpbiBwb2xsaW5nIG9yIHRyaWdnZXJpbmcuCj4g
ICAgICA+Cj4gICAgICA+IFRoZSB3YXkgaXQgd29ya3MgaXMgdGhhdCBwYXRjaHdvcmsgaXMgc3Vi
c2NyaWJlZCB0byB0aGUgbGlzdCBhbmQKPiAgICAgbG9va3MKPiAgICAgID4gZm9yIHBhdGNoZXMg
aW4gdGhlIG1haWxzLiBJZiBpdCBkaWRuJ3QgcmVjZWl2ZSB0aGUgbWFpbCB3aXRoIHRoZQo+ICAg
ICBwYXRjaAo+ICAgICAgPiB0aGVuIGl0IHdpbGwgbm90IHNob3cgdXAuCj4gICAgICA+Cj4gICAg
ICA+IFNvcnJ5IGZvciB0aGUgdHJvdWJsZS4KPiAgICAgID4KPiAKPiAgICAgT2ssIG5vIHByb2Js
ZW0gYXQgYWxsIQo+IAo+ICAgICBLaW5kIHJlZ2FyZHMKPiAgICAgLS0gCj4gICAgIEdpdWxpbyBC
ZW5ldHRpCj4gICAgIEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCj4gICAgIF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gICAgIGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiAgICAgYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcgPG1haWx0bzpidWlsZHJv
b3RAbGlzdHMuYnVpbGRyb290Lm9yZz4KPiAgICAgaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gICAgIDxodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3Q+Cj4gCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
