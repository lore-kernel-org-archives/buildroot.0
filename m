Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D73DC19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 22:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0918A60F84;
	Sat,  6 Aug 2022 22:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0918A60F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ewiUsDi8rCIt; Sat,  6 Aug 2022 22:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFB2960F85;
	Sat,  6 Aug 2022 22:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFB2960F85
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 255421BF3FF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC3A74015D
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC3A74015D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id er5UsI_485nr for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 22:01:32 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F306940117
Received: from smtpcmd03120.aruba.it (smtpcmd03120.aruba.it [62.149.158.120])
 by smtp2.osuosl.org (Postfix) with ESMTP id F306940117
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 22:01:31 +0000 (UTC)
Received: from [192.168.8.155] ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KRkRoxkLy5XbvKRkVoQdKs; Sat, 06 Aug 2022 23:54:28 +0200
Message-ID: <8aafffc2-748f-becd-cac3-da7a3fad44be@benettiengineering.com>
Date: Sat, 6 Aug 2022 23:54:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Stefano Cottafavi <stefano.cottafavi@gmail.com>
References: <CAPn86JAvLDjLZYGTvCeJDD45o7Erro2aM8wYzRO73OWW3ehfVw@mail.gmail.com>
 <575D4695-1A46-4431-90F2-63212188CDD1@benettiengineering.com>
 <CAPn86JC8tsPtbGZ=W1V5sgf70UsaFOtLWKwhdChxBg-k2RZVDA@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAPn86JC8tsPtbGZ=W1V5sgf70UsaFOtLWKwhdChxBg-k2RZVDA@mail.gmail.com>
X-CMAE-Envelope: MS4xfPrj6geTs6gWRuAnXR31XMxlbsrcm4DaMqzyfTTpzESDIij19ema0jJoXB+dRjeDBkVXzL6RhWAGWCTje++uIjF7XiflnjqzWWbH4wPcpIO9izh/K6Rj
 NOKYfVx+rxoksMfzeId+XGE8LopE3cTjyV6AJkeBw+xAeugYFyQao8ix6YJKQSSIq1FP04zZXSdr20VQIB+sHo1C0e8KqUNT2aGfNC10AnmEF0WJfa9NP/hT
 Vd/eR/ayBCVxwxmC33EYRA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659822868; bh=qzsBOxQ/dzYAXr7kPj1ubHIs7YZ8f/pcru4YpTUBwpk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=CnSW3nb5iRgBGY0zzdmvU04jQmWWURZYwBbEcC8s6dJuUHQTNCtaNQp0VlxXbZmLP
 dSr9Ofmla3d4FyuEA6QxnVX4UGqZagzQGjEEcx3fCPxPxmDfBOg+iwQAnqRoAMM4Do
 aWXy5yZk7w4QgdcYoHWb7LHQRkmcYV1v1Td7W2d3uZXPxP7I7eUgqeurrpQr/wGwTI
 L5V4BWoRpKe8seMqPp2hBZ0MjOpyH/LNl/rearKTlLM6u6aL4pUwwK/kGXCd12zOHo
 aCySI+Mxzw9SOhW4Ws/tWwoXpPItcM2PUFzH4jCks9QuBMfX8phgSrn+q22m6U0DNn
 z2QNSxYfCFRTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CnSW3nb5
Subject: Re: [Buildroot] OpenCV modules headers not in the SDK
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU3RlZmFubywKCk9uIDA2LzA4LzIyIDIwOjE1LCBTdGVmYW5vIENvdHRhZmF2aSB3cm90ZToK
PiBIaSBHaXVsaW8sCj4gdGhhbmtzIGZvciB0aGUgcXVpY2sgcmVwbHkuIEhlcmUncyB0aGUgZGVm
Y29uZmlnIAo+IGh0dHBzOi8vcGFzdGViaW4uY29tL1hzaDVkNEhHIDxodHRwczovL3Bhc3RlYmlu
LmNvbS9Yc2g1ZDRIRz4KPiBGb3IgdGhlIHNha2Ugb2YgY29tcGxldGVuZXNzIEkgZGlkbid0IHJl
bW92ZSBhbnkgb2YgdGhlIGxpbmVzLCBidXQgc29tZSAKPiBhcmUgc3BlY2lmaWMgdG8gbXkgb3V0
LW9mLXRyZWUgZm9sZGVyIGFuZCBvdmVybGF5cywgc28geW91IG1pZ2h0IHdhbnQgdG8gCj4gZ2V0
IHJpZCBvZiB0aG9zZS4KPiAKPiBJJ20gY3VycmVudGx5IGJ1aWxkaW5nIHRoZSAyMDIyLjA1LjEg
dGFnIHdpdGggU0hBIAo+IDJlMzk5ODkzYjRmNjBmMWUxMDMyMjhkZjZlNDQzOWQ0ZTRhYzNkZDUK
ClRoYW5rIHlvdS4gSSdtIGJ1aWxkaW5nIGl0IHJpZ2h0IG5vdy4gVGhlIHBhY2thZ2Ugb3BlbmN2
NC5tayBsb29rcwpjb3JyZWN0IGJlY2F1c2UgaXQgZG9lcyBoYXZlIE9QRU5DVjRfSU5TVEFMTF9T
VEFHSU5HID0gWUVTLCBhbmQgdGhhdApzaG91bGQgaW5zdGFsbCB0aGUgaGVhZGVyIGZpbGVzLiBJ
ZiB0aGVyZSBpcyBhIGJ1ZyBpdCBjb3VsZCBiZSBpbnNpZGUKb3BlbmN2NCBjbWFrZSBpdHNlbGYu
CgpCeSB0aGUgd2F5LCBJIGd1ZXNzIHRoZSBwcm9ibGVtIHlvdSdyZSBleHBlcmllbmNlIGlzIHRo
YXQgeW91IGFmdGVyCmJ1aWxkaW5nIHRoZSBCdWlsZHJvb3QncyBkZWZjb25maWcgeW91IHRyeSB0
byBidWlsZCBhbm90aGVyIGFwcGxpY2F0aW9uCihpLmUuIGEgcXQ1IGFwcGxpY2F0aW9uKSB0aGF0
IHJlcXVpcmVzIG9wZW5jdjQgYW5kIGl0IGNhbid0IGZpbmQgdGhlCmhlYWRlcnMsIHJpZ2h0PwoK
QmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoK
PiBMb29raW5nIGZvcndhcmQgdG8geW91ciBpbnNpZ2h0cy4KPiAKPiBCZXN0Cj4gU3RlZmFubwo+
IAo+IE9uIFNhdCwgQXVnIDYsIDIwMjIgYXQgNzo0MyBQTSBHaXVsaW8gQmVuZXR0aSAKPiA8Z2l1
bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbSAKPiA8bWFpbHRvOmdpdWxpby5iZW5l
dHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+PiB3cm90ZToKPiAKPiAgICAgSGkgU3RlZmFubywK
PiAKPj4gICAgIElsIGdpb3JubyA2IGFnbyAyMDIyLCBhbGxlIG9yZSAxOToyOSwgU3RlZmFubyBD
b3R0YWZhdmkKPj4gICAgIDxzdGVmYW5vLmNvdHRhZmF2aUBnbWFpbC5jb20gPG1haWx0bzpzdGVm
YW5vLmNvdHRhZmF2aUBnbWFpbC5jb20+Pgo+PiAgICAgaGEgc2NyaXR0bzoKPj4KPj4gICAgIO+7
vwo+PiAgICAgSGkgYWxsLAo+PiAgICAgSSd2ZSBzdWNjZXNzZnVsbHkgYnVpbHQgQnVpbGRyb290
IDIwMjIuMDUgZm9yIHRoZSBSYXNwYmVycnkgUGk0Cj4+ICAgICBhZGRpbmcgc3VwcG9ydCBmb3Ig
UXQ1IGFuZCBPcGVuQ1YgKGluY2x1ZGluZyBvYmpkZXRlY3QgbW9kdWxlCj4+ICAgICBhbW9uZ3N0
IGZldyBvdGhlcikuCj4+ICAgICBJJ3ZlIGFsc28gbWFuYWdlZCB0byBnZW5lcmF0ZcKgdGhlIFNE
SyBmb3Igc3VjaCBhIGJ1aWxkIGhvd2V2ZXIgSQo+PiAgICAgY2FuJ3QgZmluZCB0aGUgaGVhZGVy
IGZpbGVzIG9mIHRob3NlIE9wZW5DViBtb2R1bGVzIGFueXdoZXJlIGluCj4+ICAgICB0aGUgU0RL
Lgo+Pgo+PiAgICAgSXMgdGhpcyBleHBlY3RlZCBvciBhIGJ1Zz8KPiAKPiAgICAgSXQgbG9va3Mg
bGlrZSBhIGJ1Zy4gQ2FuIHlvdSBwbGVhc2UgcGFzdGViaW4geW91ciBzcGVjaWZpYyBkZWZjb25m
aWc/Cj4gCj4gICAgIFlvdSBjYW4gb2J0YWluIGl0IG1vdmluZyB0byB5b3VyIG91dHB1dCBmb2xk
ZXIgYW5kIMKgaXNzdWluZzoKPiAgICAgJCBtYWtlIHNhdmVkZWNvbmZpZwo+ICAgICB0aGVuIHlv
dSBvYnRhaW4gYSBmaWxlIGNhbGxlZCBkZWZjb25maWcgc28gY29weSBhbmQgcGFzdGUgaXQgb24K
PiAgICAgcGFzdGViaW4gYW5kIHByb3ZpZGUgaGVyZQo+ICAgICB0aGUgbGluayB0byB0aGUgcGFz
dGViaW4gYW5kIGFsc28gdGhlIFNIQTEgY29tbWl0IG9mIHlvdXIgQnVpbGRyb290Cj4gICAgIGdp
dCBvciB0aGUgc3BlY2lmaWMgdmVyc2lvbi4KPiAKPiAgICAgVGhpcyB3YXkgd2UgY2FuIGhlbHAg
eW91Lgo+IAo+ICAgICBCZXN0IHJlZ2FyZHMKPiAgICAg4oCUCj4gICAgIEdpdWxpbyBCZW5ldHRp
Cj4gICAgIENFTy9DVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKPiAKPj4KPj4gICAgIENoZWVy
cywKPj4gICAgIFN0ZWZhbm8KPj4gICAgIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4+ICAgICBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+ICAgICBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZyA8bWFpbHRvOmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPgo+PiAg
ICAgaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cj4+ICAgICA8aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Pgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
