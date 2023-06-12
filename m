Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1DAC7EE2E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 18:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEF4A4020B;
	Mon, 12 Jun 2023 18:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEF4A4020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIs6XfSQaeCF; Mon, 12 Jun 2023 18:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5EB4404C8;
	Mon, 12 Jun 2023 18:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5EB4404C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BAC11BF3F6
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 18:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7150C404C8
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 18:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7150C404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id foXOXASANsDL for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 18:55:32 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD0E04020B
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD0E04020B
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 18:55:31 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.109.39])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8maUq1BYfJMjG8maUqe8Fq; Mon, 12 Jun 2023 20:48:22 +0200
Message-ID: <4a07bfe4-9fdc-f4f5-c720-f191c2812383@benettiengineering.com>
Date: Mon, 12 Jun 2023 20:48:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Indrek Kruusa <indrek.kruusa@gmail.com>
References: <CA+fTLhgfd1TXsc106CVJWzMPKiFE2BtPW6wieF8MxhoUik=Zcg@mail.gmail.com>
 <ff7312fd-f85f-373e-2b0e-3e3d003b84ad@benettiengineering.com>
 <CA+fTLhixvdP2-A111eJQ-cne41VGnmQ5zn0jmUyEE9ZkS=931A@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CA+fTLhixvdP2-A111eJQ-cne41VGnmQ5zn0jmUyEE9ZkS=931A@mail.gmail.com>
X-CMAE-Envelope: MS4xfE0txNhHY5c02PhYW0ScuOgwA2ADbl+wy/Fvo1S53e+6DDOFOWHjDo6vrRhJ9TBZA+wZ9kOaBBCLCD2U2s1URosbAf7W5Tr6YOPhdXXtU0OLg6+VFeES
 1z/G7j3s/gvCDLd0Z31FDvsi9YWMgYmtmE4gQnFdUg5bB5hSAxFLPxScpGCObaIaa7KHh8anqhWcWSWdPXt6fMgyhU5DE4SMqsyL1ycur+y8pUfcE/9kXgG/
 AvuwBhrHXzigyEPF6OCYej1LBVdijw7yjzm0Z+Moms8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1686595702; bh=aig9tey8clDf3Y9wi3RqG39+V+nijQgu5cF8i2j4dzE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Z6sQaKLd0qiX86Ih4oMifRcqGt5yYHtH0wLE8lGthskNx2SWMqTWuhZqm1ABTg6/X
 qwVV7SKitR0ilPUlmzpR4r+hrFob4a+K0F13xmQAKMC9aJvwGzh6187jRtCWQWLEgL
 uxqYvYso8uHxNiZ4+77p/je5X4tcg6mDs7KLu/gYMrX7w21j/fHAbq3NVJFhZCP45o
 yNe10S5PYNqRpkIQOHub3Mgzlxkyra1YODU1l15sqc7Tk2G3+E60tWwwPaD80pagqX
 TsHDatvFaHD96cBAudrGWdr5r1t8t2GAZuOxEfCbT2RyRMGgANtGkC8SmBm/Y8EBSW
 uC6KSOXoo4zSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Z6sQaKLd
Subject: Re: [Buildroot] package/rtl8189fs: question about the debug mode
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTIvMDYvMjMgMjA6NDEsIEluZHJlayBLcnV1c2Egd3JvdGU6Cj4gSGkgR2l1bGlvIQo+IFRo
YW5rcyBmb3IgdGhlIGZhc3QgcmVzcG9uc2UhIFN1cmUsIEkgd2lsbCB0ZXN0IHRoaXMgcGF0Y2gg
YXMgc29vbiBhcyBJIAo+IGNhbiBhbmQgd2lsbCBsZXQgeW91IGtub3chIFRoYW5rcyBhZ2FpbiEK
Ck9rLiBpZiBpdCB3b3JrcyBwbGVhc2UgYW5zd2VyIHRvIHRoZSBwYXRjaCB3aXRoIHlvdXI6ClRl
c3RlZC1ieToKYWZ0ZXIgbXkgU2lnbmVkLW9mZi1ieToKClRoYW5rIHlvdQpCZXN0IHJlZ2FyZHMK
LS0gCkdpdWxpbyBCZW5ldHRpCkNFTyZDVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4gSW5k
cmVrCj4gCj4gCj4gRSwgMTIuIGp1dW5pIDIwMjMgMTk6NTQgR2l1bGlvIEJlbmV0dGkgCj4gPGdp
dWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20gCj4gPG1haWx0bzpnaXVsaW8uYmVu
ZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPj4ga2lyanV0YXM6Cj4gCj4gICAgIEhpIEluZHJl
aywKPiAKPiAgICAgT24gMTIvMDYvMjMgMTc6MjQsIEluZHJlayBLcnV1c2Egd3JvdGU6Cj4gICAg
ICA+IEhpIQo+ICAgICAgPiBXaGVuIGJ1aWxkaW5nIHJ0bDgxODlmcyBkcml2ZXIgaW4gYnVpbGRy
b290IGN1cnJlbnRseSB0aGVuIGl0Cj4gICAgIHJ1bnMgaW4KPiAgICAgID4gZGVidWcgbW9kZSAo
b3JpZ2luYWwgTWFrZWZpbGUgbGluZSA5MTrCoENPTkZJR19SVFdfREVCVUcgPSB5KS4gSXQncwo+
ICAgICAgPiByZWFsbHkgdmVyYm9zZSAoYXQgbGVhc3QgNSByb3dzIHBlciBzZWNvbmQpIGFuZCBi
YXNpY2FsbHnCoGl0Cj4gICAgIHJlbmRlcnMgdGhlCj4gICAgICA+IHNlcmlhbCBjb25zb2xlIHVz
ZWxlc3MuCj4gICAgICA+IEkgd291bGQgbGlrZSB0byB0dXJuIG9mZiB0aGUgZGVidWcgbW9kZSBp
biBhIG5ldyBib2FyZCBjb25maWcgKHN0aWxsCj4gICAgICA+IHByZXBhcmluZyBhIHBhdGNoIGZv
ciB0aGlzKS4gQnV0IHRoZW4gSSB3b25kZXIgaG93IG90aGVyIHVzZXJzIGFyZQo+ICAgICAgPiBs
aXZpbmcgd2l0aCBpdC4gTWF5YmUgaXQgc2hvdWxkIGJlIHBhdGNoZWQgb24gcGFja2FnZSBsZXZl
bCBhbmQKPiAgICAgbm90IG9uCj4gICAgICA+IGJvYXJkIGxldmVsPwo+IAo+ICAgICBJIHRoaW5r
IHRoYXQgSSBjYW4gc2VuZCBhIHBhdGNoIGZvciB0aGlzIHRoYXQgZW4vZGlzYWJsZQo+ICAgICBD
T05GSUdfUlRXX0RFQlVHIGRlcGVuZGluZyBvbiBCUjJfRU5BQkxFX1JVTlRJTUVfREVCVUcuCj4g
Cj4gICAgIEkgc2VlIGl0IGxpa2UgYSBjb25zaXN0ZW50IHNvbHV0aW9uIGFuZCBJJ3ZlIGp1c3Qg
c2VudCBhIHBhdGNoIGZvciB0aGlzOgo+ICAgICBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMwNjEyMTY1MzQ0LjM4MjkzMDQtMS1naXVsaW8u
YmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tLyA8aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIzMDYxMjE2NTM0NC4zODI5MzA0LTEtZ2l1
bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbS8+Cj4gCj4gICAgIEJ1dCB0aGVyZSBp
cyBhbHNvIGFub3RoZXIgc29sdXRpb24gdG8gdGhpcyBieSBwYXNzaW5nIHRvIGtlcm5lbCBvcHRp
b25zCj4gICAgIHRoZSBsb2cgbGV2ZWwgb3IgZXZlbiBhdCBydW50aW1lLCB0YWtlIGEgbG9vayBo
ZXJlOgo+ICAgICBodHRwczovL2dpdGh1Yi5jb20vdWxsaS1rcm9sbC9ydGw4ODE0YXUvYmxvYi9t
YXN0ZXIvRG9jdW1lbnQvSG93X3RvX3NldF9kcml2ZXJfZGVidWdfbG9nX2xldmVsLnBkZiA8aHR0
cHM6Ly9naXRodWIuY29tL3VsbGkta3JvbGwvcnRsODgxNGF1L2Jsb2IvbWFzdGVyL0RvY3VtZW50
L0hvd190b19zZXRfZHJpdmVyX2RlYnVnX2xvZ19sZXZlbC5wZGY+Cj4gCj4gICAgIEkgaGF2ZW4n
dCB0ZXN0ZWQgaXQgYnV0IGl0IHNob3VsZCB3b3JrLgo+IAo+ICAgICBMZXQgbWUga25vdy4KPiAK
PiAgICAgQmVzdCByZWdhcmRzCj4gICAgIC0tIAo+ICAgICBHaXVsaW8gQmVuZXR0aQo+ICAgICBD
RU8mQ1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
