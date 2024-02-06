Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CDCC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 11:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB03E41EA7;
	Tue,  6 Feb 2024 11:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB03E41EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hmsX63Lwb1Fs; Tue,  6 Feb 2024 11:03:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 066AF41EAB;
	Tue,  6 Feb 2024 11:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 066AF41EAB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1E041BF2C6
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 11:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8778B41EA4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 11:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8778B41EA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pCNTPvneDU9m for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 11:03:01 +0000 (UTC)
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BA6441E91
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 11:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BA6441E91
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XJE9rGB5JoTDCXJE9rxIMa; Tue, 06 Feb 2024 12:02:57 +0100
Message-ID: <9e961c64-a539-4c3d-9324-dfe23315bea1@benettiengineering.com>
Date: Tue, 6 Feb 2024 12:02:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: hanyuan <hanyuan-z@qq.com>
References: <tencent_267933F59FABC482631A00CC38E64BD83205@qq.com>
 <d2a79053-ad5c-4596-9e03-8abc1811eacb@benettiengineering.com>
 <tencent_2D2306C0CCF8E74BD2B26673E6BFA9A49B05@qq.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <tencent_2D2306C0CCF8E74BD2B26673E6BFA9A49B05@qq.com>
X-CMAE-Envelope: MS4xfB9gNuehPHYNyrK34nQOihVgdRFKiRR6CIBMPmMtLMVdNANRbxzd9VUO9/J/o9L0MmduURQe+ydUqa0mGqoMr+hJHRXj2SMbsMj4E225jUYGCZl+F29b
 Nsy5adMu8i84sPGPu6xsTo9exE5jySyN02MM9E1DAzCAqAYQdOjrYwtA6T0aj53f7vDQEDaez1jf/V9n+CX59u+wJfyZV9v8qHev2DZiScBMgN9IP5LD/CLW
 74D2svD0qDlQD/DCAxPVna+vvfz6ruakV3LBmTZg+c9DBBkfs02VOiCBsiaVIZxtuT30qZzMrGv88ncYF9MD12I4fB/il5p28BgDZYs1zIpacrC2RimbhLie
 vt5gBuox
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707217377; bh=TW4OfPm+7xSjRwOJZiiUVdP/1vwL/3HtvTcPtERYvCY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=nioqqAFYTSwDWO56ufQQx0jaCwHstB3liI2709wUqEGl/FSC4FmDD/Zs4LD5NdL1o
 0tL6FweWDS7joW8qe963Lk9ItrPPLYwvYRgdi1odufqmcp0uNoq2hVrE4eRM880thD
 7UJtrxV2/jOFHo4LksM8QO9FIL+x6fmsjfHj/e//I7GBmDl5NCeWM8pQ8sGu53z9CI
 P771C7w7gp4x36bIcCRs09QxpHkECQLCaIRBuQmCbXP8UknJxgBudkVlFnxBOwzwie
 XMsJqRv3yWfWXgapqEX3nGGllHrf3vm54+TfXjy0Jq9MgqTZRT6Q2B8Rin8tzuNgwD
 IH8XB1w+Kli3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nioqqAFY
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/milkv_duo: new defconfig
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
Cc: Emil S <emil.soltys@outlook.com>, GP Orcullo <kinsamanka@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSGFueXVhbiwKCk9uIDA2LzAyLzI0IDAzOjQwLCBoYW55dWFuIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gSGVsbG8gR2l1bGlvLAo+IAo+IFRoYW5rcyEgSXTigJlzIG5pY2UgdG8gZ2V0IHlvdXIg
cmV2aWV3cy4gTGV0IG1lIGV4cGxhaW4gc29tZSBvZiB0aGVtLgo+IAo+PiAyMDI05bm0MuaciDbm
l6UgMDE6MjXvvIxHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbT4g5YaZ6YGT77yaCj4+Cj4+IEhpIEhhbnl1YW4sCj4+Cj4+IHRoYW5rIGZvciBjb250
cmlidXRpbmcsCj4+IG9uZSBpbXBvcnRhbnQgbm90ZSBpcyB0byBzd2FwIFBhdGNoIDEvMiBhbmQg
Mi8yLiBUaGlzIGlzIGJlY2F1c2UgdGhleQo+PiBhcmUgYmlzZWN0YWJsZSB0aGlzIHdheSBzaW5j
ZSBvbiBQYXRjaCAxLzIgeW91IGVuYWJsZSBwYWNrYWdlcyBhcHBlYXJpbmcKPj4gaW4gUGF0Y2gg
Mi8yLCBhbHNvLAo+IAo+IEdvdCBpdC4gU2hvdWxkIEkgbGF0ZXIgc2VudCB0aGUgUGF0Y2ggVjMg
YW5kIG1ha2UgdGhlbSBsb29rIGxpa2U6Cj4gCj4gW3YzLDEvMl0gcGFja2FnZS9taWxrdi1kdW86
IGFkZCBwYWNrYWdlcyBmb3IgbWlsa3YtZHVvCj4gW3YzLDIvMl0gY29uZmlncy9taWxrdl9kdW86
IG5ldyBkZWZjb25maWcKClllcwoKPiAKPj4gY2FuIHlvdSBwbGVhc2UgcHJvdmlkZSB0aGUgYm9h
cmQgcHJvZHVjdCB3ZWJwYWdlIFVSTCBoZXJlPwo+PiBBbmQgYWxzbyBzb21lIElPTiBpbmRpY2F0
aW9ucyB0b28/Cj4gCj4gR290IGl0LiBJIHdvdWxkIGFwcGVuZCBtb3JlIGluZm8gdG8gdGhlIHJl
YWRtZS50eHQgYWJvdXQgd2hhdCB0aGUgSU9OIG1lYW5zLgo+IAo+PiBBbGwgdGhpcyBpZiBzdGF0
ZW1lbnQgaXMgcmVkdW5kYW50IHdpdGggdGhlIGVsc2UgcGFydC4KPj4gQ2FuIHlvdSBhZGQgYSB2
YXJpYWJsZSBsaWtlOgo+PiBGSVBUT09MX0FSR1VNRU5UUyA9IGdlbmZpcCAke0JJTkFSSUVTX0RJ
Un0vZmlwLmJpbiBcCj4+IAktLU1PTklUT1JfUlVOQUREUj0weDgwMDAwMDAwIFwKPj4gCS0tQ0hJ
UF9DT05GPSR7QklOQVJJRVNfRElSfS9jaGlwX2NvbmYuYmluIFwKPj4gLS1OT1JfSU5GTz1GRkZG
RkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZGRkZG
RkZGRkZGRkZGRkYgXAo+PiAJLS1OQU5EX0lORk89MDAwMDAwMDAgXAo+PiAJLS1CTDI9JHtCSU5B
UklFU19ESVJ9L2JsMi5iaW4gXAo+PiAJLS1CTENQX0lNR19SVU5BRERSPTB4MDUyMDAyMDAgXAo+
PiAJLS1CTENQX1BBUkFNX0xPQURBRERSPTAgXAo+PiAJLS1ERFJfUEFSQU09JHtCSU5BUklFU19E
SVJ9L2Rkcl9wYXJhbS5iaW4gXAo+PiAJLS1NT05JVE9SPSR7QklOQVJJRVNfRElSfS9md19keW5h
bWljLmJpbiBcCj4+IAktLUxPQURFUl8yTkQ9JHtCSU5BUklFU19ESVJ9L3UtYm9vdC5iaW4gXAo+
Pgo+PiBhbmQgdGhlbiB5b3UgYWRkIG9yIG5vdCB0aGUgcmVtYWluaW5nIEJMQ1AqIHZhcmlhYmxl
cyBiZWxvdyBhbmQgZXhlY3V0ZQo+PiAke0JJTkFSSUVTX0RJUn0vZmlwdG9vbC5weSAke0ZJUFRP
T0xfQVJHVU1FTlRTfQo+PiBUaGVuIHRoaXMgbmVzdGVkIGlmIHN0YXRlbWVudCBhbmQuLgo+PiAu
LnRoaXMgYXJlIHJlZHVuZGFudCB0b28uIENhbiB5b3UgcHJvdmlkZSBhIHNpbmdsZSBpZi1lbHNl
LWZpIHN0YXRlbWVudAo+PiBvdXRzaWRlIHRoZSBtYWluIGlmIHN0YXRlbWVudC4uLgo+PiAuLi4g
aGVyZT8KPj4KPiAKPiBTb3JyeSBmb3IgdGhhdC4gT0ssIEkgd291bGQgbWFrZSB0aGVzZSBsaW5l
cyBsb29rIGJldHRlci4KPiAKPj4gSXMgQ1hYIG5lZWRlZCBieSBhbnkgcGFja2FnZSBzZWxlY3Rl
ZCBoZXJlPwo+IAo+IEF0IHRoYXQgdGltZSBJIHN1Ym1pdHRlZCB0aGUgcGF0Y2ggSSBoYXZlbuKA
mXQgdW5kZXJzdGFuZCB0aGUgYnVpbGRyb2904oCZcyBtaW5pbWFsCj4gcGhpbG9zb3BoeSB0b28g
bXVjaC4gU29ycnkgZm9yIHRoYXQuIEkgd291bGQgcmVtb3ZlIHRoaXMgbGluZS4KPiAKPj4gaGVy
ZSB5b3UgbmVlZDoKPj4gQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQo+PiBo
ZXJlIHlvdSBuZWVkOgo+PiBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15Cj4g
Cj4gT0suIEkgd2lsbCBhZGQgdGhlbS4KPiAKPj4gRm9yIHRoZSByZXN0IHRoZSBwYXRjaCBsb29r
cyBnb29kIGFuZCBidWlsZHMgZmluZSB1c2luZyB1dGlscy9kb2NrZXItcnVuIGV4Y2VwdCBwYWNr
YWdlIGh0b3AgdGhhdCBmYWlscyB0byBidWlsZCBkdWUgdG8gZ2NjIElDRSAxMDk4MDkgZm9yIHdo
aWNoCj4+IEkndmUgc2VudCBhIHBhdGNoOgo+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz0zOTM2NjcKPj4KPj4gU28gdGhpcyBwYXRj
aHNldCBkZXBlbmRzIG9uIHBhdGNoc2V0IGFib3ZlIGZvciBodG9wIGdjYyBJQ0UuCj4gCj4gSSB0
aGluayBJIHNob3VsZCB0ZWxsIHlvdSB0aGlzLiBJbiBmYWN0IEkgZW5jb3VudGVyZWQgYW5vdGhl
ciBnY2MgYnVnCj4gd2hlbiB1c2luZyBhbGwgdGhlIHQtaGVhZOKAmXMgb3B0aW1pemF0aW9ucyB3
aXRoIHRoZSBnbGliYy4gVGhlIGdjYyByZXBvcnRlZAo+IGludGVybmFsIGVycm9ycyB3aGVuIHdl
Cj4gCj4gK0JSMl9UQVJHRVRfT1BUSU1JWkFUSU9OPSItbWFyY2g9cnY2NGltYWZkY194dGhlYWRi
YV94dGhlYWRiYl94dGhlYWRic194dGhlYWRjbW9feHRoZWFkY29uZG1vdl94dGhlYWRmbWVtaWR4
X3h0aGVhZGZtdl94dGhlYWRpbnRfeHRoZWFkbWFjX3h0aGVhZG1lbWlkeF94dGhlYWRtZW1wYWly
X3h0aGVhZHN5bmMiCj4gCj4gU28gd2UgaGF2ZSB0byB1c2UgbXVzbCBhbmQgZmluZCB0aGlzIGJ1
ZyBpcyBub3QgcmVwb3J0ZWQgYW55bW9yZS4KCkkgd2FzIHdvbmRlcmluZyB3aHkgeW91IHdlcmUg
dXNpbmcgZXhhY3RseSBtdXNsIGFuZCBJIHN1c3BlY3RlZApzb21ldGhpbmcgbGlrZSB0aGF0LgoK
PiBNYXliZSB0aGUgaHRvcCBjb21waWxpbmcgYnVnIGNvbWVzIGZyb20gdGhlc2Ugb3B0aW1pemF0
aW9ucy4KPiBJIHdvdWxkIGhhdmUgYSB0cnkgd2hhdCB3b3VsZCBoYXBwZW4gaWYgd2UgZGlzYWJs
ZSBhbGwgdGhlIHQtaGVhZAo+IGZlYXR1cmVzIGFuZCB0aGVuIGNvbXBpbGUgdGhlIGh0b3AuIElm
IGl0IGlzIHJlYWxseSB0aGUgdC1oZWFk4oCZcyBwcm9ibGVtLAo+IG1heWJlIHdlIGNhbiBsZXQg
dGhlIHQtaGVhZOKAmXMgb3B0aW1pemF0aW9ucyBnby4KCkkndmUgd29ya2VkIGl0IGFyb3VuZCB3
aXRoIHRoaXNbMF0sIHNvIG5vIG5lZWQgdG8gcmVtb3ZlIG9wdGltaXphdGlvbnMuCgpbMF06IGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVz
PTM5MzY2NwoKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpDRU8mQ1RPQEJlbmV0dGkg
RW5naW5lZXJpbmcgc2FzCgo+IFRoYW5rcyBhZ2FpbiBmb3IgeW91ciBjYXJlZnVsIHJldmlldyEK
PiAKPiBCZXN0IHJlZ2FyZHMsCj4gSGFueXVhbgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
