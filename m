Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E286CC433FE
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 19:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73BA281414;
	Thu, 17 Nov 2022 19:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73BA281414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IYsRQkBSsWbm; Thu, 17 Nov 2022 19:48:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B78C813FE;
	Thu, 17 Nov 2022 19:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B78C813FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCF461BF3D7
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 19:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B59404012F
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 19:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B59404012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esx856Cki_Y3 for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 19:48:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D23E400C4
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D23E400C4
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 19:48:48 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.88.137])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vksRoiWu26OFPvksRoOyTM; Thu, 17 Nov 2022 20:48:47 +0100
Message-ID: <b954a6db-f94c-96d4-524e-be7fbed67765@benettiengineering.com>
Date: Thu, 17 Nov 2022 20:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: James Hilliard <james.hilliard1@gmail.com>
References: <CADvTj4qYnqsAjQMZQHBTdpxgiZ2VoLtewn9uWa1QzPjriT_VZg@mail.gmail.com>
 <A7C2FFDF-A321-49E6-A82C-3DA7C936C65E@benettiengineering.com>
 <CADvTj4rMLacz40pDcGWWE9MrBx-X6yYvrreST83Exa2yRAM_8w@mail.gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CADvTj4rMLacz40pDcGWWE9MrBx-X6yYvrreST83Exa2yRAM_8w@mail.gmail.com>
X-CMAE-Envelope: MS4xfPnjSuwxdzKhYbHU3sdY3i/QIft+SBwkTNByiMxF+BFH9g1k/Y+ZLsfC5xJjs8Xz1la8kH7uhn/h/3u8jqPDWsoRiTtiNMlkI0ldFkagDeADhD80FyIW
 39lpgA3J+ajATKOq91AwLbdStuOZd4XQ3/w+CiBxVgf6OqW6Xb6Es2SrxZOX+VL3gakHz2ZlCZjvkXDA/jrXSI3gOp1+rwJEV7ggD060ncszQ+lrXRuNB+tM
 t3pODqDiW6Tu5+KPXnsSZXaXnsN209C7H6a2W/DOKQrFlegNDIuDSHQ0w7wk0nEP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1668714527; bh=TS70fd0YJvv8f0wbXeGnyG3Z2pWj/Lvtn/zdBlD87kg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=O0OQTJ24qF6WMBP0imWQ6dR1eK3BP4YqMBWKbWnErI+e3LrDs5/nMtnnp2PaFCItH
 f3iXrhBpnDZ0EZeaWr4UfVqhK78ESooxnPbBsTqOppS1CBVvyMtVrCOKCn9vEvjELZ
 yuDqWHfjTI9sTZUbKVj8c443qrm0gCHZOgrHbhuTQIOy5RON3ksEQrBTW2UgfmNhj3
 2LWeAHVf4Cfd7Ojdhiu0iFv2YL3GQ5A0UljJoee9Mtz+BxSqhvaOTgEohSLm3BDCHC
 o8rDQHcfP1/uAa8TKinDjBSD5nVOv6J74oXTZi5GBd/3uHVoNilt1XGgF4sHU0EXcu
 4RKwqNEtn1Xew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=O0OQTJ24
Subject: Re: [Buildroot] [PATCH] package/libnss: disable parallel build with
 Make 4.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiAyMC8xMC8yMiAxNToyOSwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gT24g
VGh1LCBPY3QgMjAsIDIwMjIgYXQgMjo1MyBBTSBHaXVsaW8gQmVuZXR0aQo+IDxnaXVsaW8uYmVu
ZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPj4KPj4gSGkgSmFtZXMsCj4+Cj4+
PiBJbCBnaW9ybm8gMjAgb3R0IDIwMjIsIGFsbGUgb3JlIDAyOjIzLCBKYW1lcyBIaWxsaWFyZCA8
amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gaGEgc2NyaXR0bzoKPj4+Cj4+PiDvu79PbiBXZWQs
IE9jdCAxOSwgMjAyMiBhdCA3OjM2IFBNIEphbWVzIEhpbGxpYXJkCj4+PiA8amFtZXMuaGlsbGlh
cmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+Pj4gT24gV2VkLCBPY3QgMTksIDIwMjIgYXQg
Mzo1NSBQTSBHaXVsaW8gQmVuZXR0aQo+Pj4+PiA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2lu
ZWVyaW5nLmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+IEZpeGVzOgo+Pj4+PiBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy80MzMvNDMzNWQwZDg0NTQwMzVhOGY3NDY0NWJhOGQ2
YzIzMjlhYjJlNTQ4MC8KPj4+Pgo+Pj4+IEhtbSwgdGhpcyBsb29rcyBsaWtlIGEgYnVnIGluIHRo
ZSBsaWJuc3MgbWFrZWZpbGUsIHdoYXQgd2FzIHRoZSBmYWlsdXJlCj4+Pj4gc2VlbiB3aXRoIG1h
a2UgNC4zIGhlcmU6Cj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjIw
MTAxMjEwOTUyLjIxNDgyNTYtMS1naXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29t
Lwo+Pj4KPj4+IFRoaXMgcGF0Y2ggYWxzbyBkb2VzIG5vdCBmaXggdGhlIGJ1aWxkIHdpdGggbWFr
ZSA0LjQobWFrZSBmcm9tIG1hc3RlciBicmFuY2gpCj4+PiBmcm9tIG15IHRlc3RpbmcuCj4+Pgo+
Pj4gRXZlbiB3aXRob3V0IHNodWZmbGUgbW9kZSBlbmFibGVkIHRoZSBidWlsZCBhcHBlYXJzIHRv
IGFsd2F5cyBmYWlsLgo+Pgo+PiBUaGFuayB5b3UgZm9yIHRlc3RpbmcsIEkgaGF2ZSBmb3Jnb3R0
ZW4gZXhhY3RseSB0byBhc2sgeW91IHRvIGRvIGl0IDotKSBzaW5jZSBhbG1vc3QgYWxsIHRoZSBm
YWlsdXJlcyBjb21lcyBmcm9tIHlvdXIgYXNhaGktbWluaSB0aGF0IEkgcmVtZW1iZXIgdG8gaGF2
ZSBNYWtlIDQuNC4KPiAKPiBJJ20gcnVubmluZyBtYWtlIG1hc3RlciBicmFuY2ggb24gYWxsIG15
IGF1dG9idWlsZGVycyBhdCB0aGUgbW9tZW50LAo+IHRoZSBmYWlsdXJlcyBhcmVuJ3QgbGltaXRl
ZCB0byBhc2FoaS1taW5pOgo+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC8/cmVhc29u
PWxpYm5zcy0zLjg0Cj4gCj4+Cj4+IFNvIEkgdHJ5IHRvIHJlcHJvZHVjZSB0aGUgYnVnIGhlcmUg
YXQgbWUgYW5kIGZpbmQgb3V0IGEgZml4Lgo+IAo+IFVzZSBtYWtlIG1hc3RlciBicmFuY2ggZnJv
bSBoZXJlIGZvciB0ZXN0aW5nOgo+IGdpdCBjbG9uZSBodHRwczovL2dpdC5zYXZhbm5haC5nbnUu
b3JnL2dpdC9tYWtlLmdpdAo+IAoKQWZ0ZXIgbG90IG9mIHRpbWUgSSd2ZSBmb3VuZCBhIHdheSB0
byBmaXggdGhpcyBidWcgd2l0aCB0aGlzIHBhdGNoOgpodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIxMTE3MTk0NTA1Ljk0OTg0Ni0xLWdpdWxp
by5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20vCgpDYW4geW91IHBsZWFzZSBnaXZlIGEg
dHJ5IGF0IHlvdSB0b28gYW5kIGdpdmUgYSBUZXN0ZWQtYnkgdGFnPwoKVGhhbmsgeW91CkJlc3Qg
cmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQ0VPL0NUT0BCZW5ldHRpIEVuZ2luZWVyaW5nIHNh
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
