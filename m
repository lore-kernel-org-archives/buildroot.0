Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B18C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 08:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17D1F40148;
	Sun, 19 Dec 2021 08:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LnpdWUuC5V16; Sun, 19 Dec 2021 08:23:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A1E94016C;
	Sun, 19 Dec 2021 08:23:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67EEE1BF574
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 08:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E91E84DA9
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 08:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VtgcXnIb2a0H for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 08:23:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B30684DA7
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 08:23:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C8CF05FF23;
 Sun, 19 Dec 2021 09:23:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639902214;
 bh=pY/DY04fNV0h0FN4jrN/OKdiwunPf+wMo3SZkfJ0ryM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nLnffgm+z6rR8KlHY5rsqFdXmJ5XWZ5Z29ystk4Xe6T297/lZVVKmdAd3Padej90n
 NwsMh33YBD2ZC9TmDsg42SSJhFBVqq6DrbWFuZqunyMaorj9WxCcpcRJp5mznT1J+D
 J35iza/WaKpA3G4mSUzdajILnBHy/kYbMrLlNEnoesXismH890iOvmBQER3SUsCFu2
 okYL7xMHsMUP1YJna3XsOpxWnCR2112+0ZBT6LusrLx+xlHMCAyrcf7KKFcdvT8Vnh
 WThu27fvNn4pW3RR719cNvslPoB0cfNse62j0s9H8KI/KsPCf0ZJeUavPOq6VgK6pd
 q+E+Q9KTULUtg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Dec 2021 09:23:25 +0100
Date: Sun, 19 Dec 2021 09:23:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <20211219082325.GB2603@scaer>
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
 <20211215180021.274991-3-thierry.bultel@linatsea.fr>
 <966fe55d-c5d7-7f5a-63ec-f68be64a38c6@mind.be>
 <f5028ffa-5461-ae87-ad4c-227605361ddf@linatsea.fr>
 <28def8c0-8d05-015e-e9b2-a25b31d9237b@mind.be>
 <7aa7dc74-284a-3c33-defa-aef4d6e11799@linatsea.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7aa7dc74-284a-3c33-defa-aef4d6e11799@linatsea.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/3] fs/dracut: new fs type
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpZXJyeSwgQWxsLAoKT24gMjAyMS0xMi0xOSAwNzo1NSArMDEwMCwgVGhpZXJyeSBCdWx0ZWwg
c3Bha2UgdGh1c2x5Ogo+ID4+PsKgWW91IHNob3VsZCBhbHNvIGNoZWNrIHRoZW4gaWYgaXQgZ2V0
cyBwcm9wZXJseSB1cGRhdGVkIGJ5Cj4gPj4+c3VwcG9ydC9taXNjL3JlbG9jYXRlLXNkay5zaCAo
SSB0aGluayB5ZXMpLgo+ID4+SSBhbSBzb3JyeSwgYnV0IEkgZG8gbm90IHNlZSB0aGUgcG9pbnQg
aGVyZSwgd291bGQgeW91IG1pbmQgZXhwbGFpbgo+ID4+cGxlYXNlID8KPiA+Cj4gPsKgSWYgdGhl
cmUncyBzdWNoIGEgd3JhcHBlciBzY3JpcHQgdGhhdCBzZXRzIHRoZSBlbnZpcm9ubWVudCB2YXJp
YWJsZXMKPiA+Y29ycmVjdGx5LCB0aGUgaWRlYSBpcyB0byBiZSBhYmxlIHRvIHVzZSB0aGF0IGFz
IHBhcnQgb2YgdGhlIFNESy4gVGhhdAo+ID5hbHNvIG1lYW5zIGl0IG11c3QgYmUgcG9zc2libGUg
dG8gbW92ZSBpdCB0byBhIGRpZmZlcmVudCBwbGFjZS4gU2luY2UgaXQKPiA+Y29udGFpbnMgaGFy
ZGNvZGVkIHBhdGhzIHRvIEhPU1RfRElSLCB0aGVzZSBuZWVkIHRvIGJlIGNoYW5nZSB3aGVuIHRo
ZSBTREsKPiA+aXMgcmVsb2NhdGVkLiBUaGUgcmVsb2NhdGUtc2RrLnNoIHNjcmlwdCBzaG91bGQg
ZG8gdGhhdCwgYnV0IGl0J3MKPiA+aW1wb3J0YW50IHRvIGNoZWNrIHRoYXQgaW5kZWVkIGl0IGRv
ZXMuCj4gCj4gSSBwcm9iYWJseSBtaXNzIHNvbWV0aGluZyBoZXJlLiBJcyBpdCBhIGJhZCBpZGVh
IHRvIC1ub3QtIHVzZSBoYXJkY29kZWQKPiBwYXRocyBpbiB0aGUgd3JhcHBlciBzY3JpcHQsIGJ1
dCBlbnZpcm9ubWVudCB2YXJpYWJsZXMgaW5zdGVhZCA/Cj4gSXQgc2hvdWxkIGJlIHNvbWV0aGlu
ZyBsaWtlOgo+IAo+IC0tLS0tLS0tLS0tLS0KPiAjIS9iaW4vYmFzaAo+IHNldCAtZQo+IAo+IGlm
IFsgLXogIiQqIiBdOyB0aGVuCj4gwqDCoMKgIGVjaG8gIk5vIGFyZ3VtZW50IHN1cHBsaWVkIgo+
IMKgwqDCoCBleGl0Cj4gZmkKPiAKPiBEUkFDVVRfTEREPSR7VEFSR0VUX0NST1NTfWxkZCBcCj4g
RFJBQ1VUX0lOU1RBTEw9IiR7SE9TVF9ESVJ9L2xpYi9kcmFjdXQvZHJhY3V0LWluc3RhbGwiIFwK
PiBkcmFjdXRiYXNlZGlyPSR7SE9TVF9ESVJ9L3Vzci9saWIvZHJhY3V0IFwKPiBkcmFjdXRzeXNy
b290ZGlyPSR7VEFSR0VUX0RJUn0gXAo+ICR7SE9TVF9ESVJ9L2Jpbi9kcmFjdXQgIiRAIgo+IC0t
LS0tLS0tLS0KClRoZSB0aGluZyBpcywgd2l0aCB0aGUgU0RLLCB0aG9zZSB2YXJpYWJsZXMgYXJl
IG5vdCBzZXQuCgogIC0gSE9TVF9ESVIgY2FuIGJlIGVhc2lseSBkZXJpdmVkOyBpdCBpczogJChk
aXJuYW1lICQoZGlybmFtZSAiJHswfSIpKQogICAgb3IgYSBsaXR0bGUgYmUgc2ltcGxlcjogJChk
aXJuYW1lICIkezAlLyp9IikKCiAgLSBUQVJHRVRfQ1JPU1MgY2FuIHByb2JhYmx5IGJlIGRlcml2
ZWQgc29tZWhvdywgYnV0IG5vdCBldmVuIHN1cmUuLi4KCiAgLSBUQUdFVF9ESVIgaGFzIHRvIGJl
IHNwZWNpZmllZCBleHBsaWNpdGx5LgoKU28sIEkgdGhpbmsgZm9yIG5vdyBpdCB3b3VsZCBiZSBv
dmVyLWVuZ2luZWVyaW5nIHRvIHRyeSBhbmQgY2F0dGVyIGZvcgp0aGUgU0RLOyB0aGlzIGNhbiBi
ZSBhY3RlZCB1cG9uIGxhdGVyLi4uCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBTbyB0aGF0
IHNob3VsZCBub3QgaW1wYWN0IHRoZSByZWxvY2F0aW9uIC4uLgo+IAo+IEJ5IHRoZSB3YXksIGlu
IGNwaW8ubWssIEkgYWxzbyBoYWQgdG8KPiAKPiBleHBvcnQgVEFSR0VUX0NST1NTCj4gCj4gCj4g
UmVnYXJkcwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cgot
LSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
