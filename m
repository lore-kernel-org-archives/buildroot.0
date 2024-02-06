Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1E2C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8564B8214D;
	Tue,  6 Feb 2024 17:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id as2GttwmXOBz; Tue,  6 Feb 2024 17:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 870FA82173
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 870FA82173;
	Tue,  6 Feb 2024 17:51:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 088F21BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D530040A39
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D530040A39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4J8UZHQcNTu for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:51:12 +0000 (UTC)
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E3CE40B67
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E3CE40B67
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XPbBrMKUEoTDCXPbCr28po; Tue, 06 Feb 2024 18:51:10 +0100
Message-ID: <bfb88e4c-6730-4220-9f9c-da451af52735@benettiengineering.com>
Date: Tue, 6 Feb 2024 18:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: franco ariel <fran.millocs@live.com.ar>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <PH0PR19MB5409C4B7C56D0550E15A83ABD0462@PH0PR19MB5409.namprd19.prod.outlook.com>
 <71301602-56ac-46b4-a853-bd71ed74da27@benettiengineering.com>
 <PH0PR19MB54097969BD5D5FAEF521E458D0462@PH0PR19MB5409.namprd19.prod.outlook.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <PH0PR19MB54097969BD5D5FAEF521E458D0462@PH0PR19MB5409.namprd19.prod.outlook.com>
X-CMAE-Envelope: MS4xfEWZTZeNxSwnX3SB+70HG72SPuTym2DMWIDxTgZ4RbinacSJLZb7SYJmHUAxgwmu+2HwKygTBGLy38m/oLhHliG11B3nzqjnAjhFoLm8Vt32GLtTEBUI
 Xo8bdNFbisKWlUtnqYJAAqJ/KPKUdm6M7HATAVsW6P1T0+UwvCdnfYwLYnFe0IbAxEjidUlO8Y6v0XoeeO97JKb7c9Y5A0/Wims81rTC3vkpFfACoU/HbiUM
 l8v2LunuT++a2n8DxlgGrQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707241870; bh=IGKHG+K3d+/cPqVysn1sdpPN/iNY6bUcmPzEFCLEuMg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=O0TMSsAfs9+Z8QSdRW0NZYauIu6AcIykqV95yuQA48v8LcyNWj6wBuWdU8HDFfozW
 7D8mee2TFmv4EdqNT3/YKlWdhWpoxFfJpnklG9EB95lUpRT8z8J87HyfeNnWspThon
 tyIi0EGDKkjmIQF3imSSu0p6MXZJ7b34nOOZ9uTP6rnuVfNhKYbaziil23kTif706D
 AbUSb/XTQwXbGLBKzyi1skDQhGQmOrt0Fh1iec5Z92aYvjzk6W/EK0ukHV9PFO7Nsu
 4daUTijHHcv5vGkql9FUv40lRa2x9sIqVL2gPaZkqLHUePRJEGIkNykhbjklDdd5Wx
 7zuDLqCx8UNSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=O0TMSsAf
Subject: Re: [Buildroot] Best board to fast boot
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

SGkgRnJhbmNvLAoKT24gMDYvMDIvMjQgMTg6MzQsIGZyYW5jbyBhcmllbCB3cm90ZToKPiBIaSBH
aXVsaW8sCj4gCj4gVGhhbmsgeW91IGZvciB5b3UgYW5zd2VyLgo+IAo+IEJhc2VkIG9uIHRoZSBQ
REYgSSBzZWUgdGhhdCBJIGNhbid0IGRvIHRob3NlIG9wdGltaXphdGlvbnMgb24gbXkgcnBpNCwg
Cj4gYmVjYXVzZSB0aGUgYm9vdGxvYWRlciBpcyBub3Qgb3BlbiBzb3VyY2UsIHJpZ2h0PyAKCkl0
IGRlcGVuZHMgaWYgeW91IGFscmVhZHkgdHJpZWQgYWxsIHBvc3NpYmxlIHJwaSBib290bG9hZGVy
IG9wdGlvbnMuClRha2UgYSBsb29rIGhlcmU6Cmh0dHBzOi8vZm9ydW1zLnJhc3BiZXJyeXBpLmNv
bS92aWV3dG9waWMucGhwP3Q9Mjc3MDEwI3AxNjg0NDQ2Cgp0aGF0IHdheSB5b3UgY2FuIHplcm8g
Ym9vdF9kZWxheS4gU29tZW9uZSBjbGFpbXMgdGhhdCBpdCBkb2Vzbid0CndvcmssIGJ1dCBpdCdz
IHdvcnRoIGEgdHJ5IHRvIGdldCAyLzMgc2Vjb25kcyBsZXNzLgpBbHNvIEkgdGhpbmsgdGhlcmUg
Y291bGQgYmUgb3RoZXIgb3B0aW9ucyB0byB0d2Vhay4KClRoZW4gaXQgZGVwZW5kcyB3aGVuIHlv
dSBsYXVuY2ggeW91ciBxdCBhcHBsaWNhdGlvbiwgSSBtZWFuIGluIHdoaWNoCnNjcmlwdCBhbmQg
aXQgYWxzbyBkZXBlbmRzIHdoaWNoIGluaXQgc3lzdGVtIHlvdSB1c2UuCkJ1c3lib3ggb25lIGlz
IHByZXR0eSBmYXN0LCBidXQgaXQgZGVwZW5kcyBpZiBmb3IgZXhhbXBsZSB5b3UgbGVhdmUKYWxs
IGluaXQuZCBzY3JpcHRzIGFzIHRoZXkgYXJlLgpMZXQncyBzYXkgeW91IHdhaXQgZm9yIG5ldHdv
cmsgdG8gYmUgY29ubmVjdGVkKHdhaXRpbmcgZm9yIGhhbmRzaGFrZQpldGMuKSwgdGhhdCB3aWxs
IHJlc3VsdCBpbiBtYW55IHNlY29uZHMgd2FzdGVkLgoKU28sIHRoZSBCZWFnbGVib2FyZAo+IGxv
b2tzIGdvb2QgYnV0LCB0aGUgUkFNIGlzIHF1aXRlIGxvdywgSSB3YXMgbG9va2luZyBmb3Igc29t
ZXRoaW5nIGJldHRlciAKPiB0byBydW4gbXkgcXQgYXBwbGljYXRpb24sIHdoaWNoIGhhcyBzbW9v
dGggYW5pbWF0aW9ucyBhbmQgdHJhbnNpdGlvbnMsIAo+IEJMRSwgdG91Y2hzY3JlZW4gc3VwcG9y
dCwgZXRjLiB3aXRjaCBib2FyZCwgd2l0aCB0aGUgYm9vdGxvYWRlciBvcGVuIAo+IHNvdXJjZSwg
Y2FuIEkgdXNlIHRvIGJvb3QgYXMgZmFzdCBhcyBwb3NzaWJsZSBpbnRvIHRoZSBxdCBhcHA/CgpJ
IHdvdWxkIHRyeSB0byBvcHRpbWl6ZSB3aGF0IHlvdSBnZXQgdG8gdW5kZXJzdGFuZCBtb3JlIGRl
ZXBseSB3aGF0J3MKZ29pbmcgb24uIEJlY2F1c2UgcnBpNCBwcm9jZXNzb3IgQkNNMjcxMSBpcyBy
ZWFsbHkgdmVyeSB2ZXJ5IGZhc3QuCk90aGVyd2lzZSB5b3UgY2FuIHN3aXRjaCB0byBhbnkgcmVh
ZHkgdG8gZ28gZGVmY29uZmlnIHdlIGhhdmUgYW5kIGRpZwp0aGUgYm9hcmQgdGhhdCBmaXRzIGJl
dHRlciBmb3IgeW91LiBUaGF0IHdheSB5b3Ugd2lsbCBoYXZlIHUtYm9vdCBpbgpnZW5lcmFsIGFu
ZCB5b3UgY2FuIHNhdmUgdGltZSwgYnV0IGFnYWluLCBvbiBib290X2RlbGF5LgoKVGhlIGNob2lj
ZSBpcyB5b3VycyBvZiBjb3Vyc2UuCgotLSAKR2l1bGlvIEJlbmV0dGkKQ0VPJkNUT0BCZW5ldHRp
IEVuZ2luZWVyaW5nIHNhcwoKPiBUaGFuayB5b3UsCj4gRnJhbmNvCj4gCj4gCj4gCj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gKkRlOirCoEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRp
ZW5naW5lZXJpbmcuY29tPgo+ICpFbnZpYWRvOirCoG1hcnRlcywgNiBkZSBmZWJyZXJvIGRlIDIw
MjQgMDY6NTIKPiAqUGFyYToqwqBmcmFuY28gYXJpZWwgPGZyYW4ubWlsbG9jc0BsaXZlLmNvbS5h
cj47IFRob21hcyBQZXRhenpvbmkgdmlhIAo+IGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9v
dC5vcmc+Cj4gKkFzdW50bzoqwqBSZTogW0J1aWxkcm9vdF0gQmVzdCBib2FyZCB0byBmYXN0IGJv
b3QKPiBIaSBGcmFuY28sCj4gCj4gT24gMDYvMDIvMjQgMDU6MTQsIGZyYW5jbyBhcmllbCB3cm90
ZToKPj4gSGVsbG8gZ3V5cyEKPj4gSSBmZXcgd2Vla3MgYWdvIEkgc3RhcnRlZCB3b3JraW5nIHdp
dGggYnVpbGRyb290IG9uIHJwaTQsIGFuZCBpdCdzIGxvb2sKPj4gYW1hemluZywgdGhhbmtzIHRv
IHRoZSBjb21tdW5pdHkgSSB3YXMgYWJsZSB0byBydW4gYSBmbHV0dGVyIGFwcCBvbiBteQo+PiBy
cGk0LiBCdXQgbm93LCBJIHdhbnQgdG8ga2VlcCBnb2luZyBmb3J3YXJkIHdpdGggbXkgcHJvamVj
dCwgc28gwr9XaXRjaAo+PiBvbmUgYXJlIHRoZSBiZXN0IGJvYXJkIHRvIGFjaGlldmUgdGUgYmVz
dCBib290IHRpbWUgdG8gYSBRdCBhcHBsaWNhdGlvbj8KPj4gSSB3YXMgbG9va2luZyBmb3IgdGhl
IFJvY2twcm82NCBmcm9tIHBpbmUgYnV0IEknbSBub3Qgc3VyZSwgc2luY2UgdGhlcmUKPj4gaXMg
bm90IHNvIG11Y2ggaW5mb3JtYXRpb24gYWJvdXQgdGhpcyBib2FyZC4KPj4KPj4gV2hhdCBkbyB5
b3UgdGhpbmsgaXQgd2lsbCBiZSBnb29kIGZvciBteSBwcm9qZWN0PyBPbiBycGk0IEkgd2FzIGFi
bGUgdG8KPj4gZ2V0IDEwc2VjIGJvb3QgdGltZSB1bnRpbCB0aGUgcXQgYXBwIHNob3dzIHVwLiBB
bmQgSSB3YW50IHRvIGFjaGlldmUKPj4gbGVzcyB0aGFuIDdzLgo+IAo+IFRoaXMgZGVwZW5kcyBh
IGxvdCBvbiBvcHRpbWl6YXRpb24geW91IGRvIG9uIGJvb3Rsb2FkZXIsIGxpbnV4IGFuZCBpbml0
Cj4gc2NyaXB0Lgo+IAo+IEkgc3VnZ2VzdCB5b3UgdG8gdGFrZSBhIGxvb2sgYXQgdGhlc2Ugc2xp
ZGVzOgo+IGh0dHBzOi8vYm9vdGxpbi5jb20vZG9jL3RyYWluaW5nL2Jvb3QtdGltZS9ib290LXRp
bWUtc2xpZGVzLnBkZiAKPiA8aHR0cHM6Ly9ib290bGluLmNvbS9kb2MvdHJhaW5pbmcvYm9vdC10
aW1lL2Jvb3QtdGltZS1zbGlkZXMucGRmPgo+IAo+IEJlc3QgcmVnYXJkcwo+IC0tCj4gR2l1bGlv
IEJlbmV0dGkKPiBDRU8mQ1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
