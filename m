Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84026C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 14:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D80F941A54;
	Fri,  3 Jun 2022 14:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8OgdmAEOziO; Fri,  3 Jun 2022 14:25:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA04641A4D;
	Fri,  3 Jun 2022 14:25:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 575EB1BF2F3
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 14:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 466E7814BB
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 14:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUokas2iG6yx for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 14:25:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp1.osuosl.org (Postfix) with ESMTP id B96068148E
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 14:25:20 +0000 (UTC)
Received: from [192.168.50.225] ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id x8Eonb03mZPAlx8EonV0ec; Fri, 03 Jun 2022 16:25:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1654266318; bh=nLxOpCWPEAsBloAe1qQWDk1uQlJhiYepf6A+Xkypa6E=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=GNnngrXb6P1cQvcFwpGuj7oNWje3X+b+mZ5sXfr/nyu0yF+0X4Dct9DThOSoVorOP
 1byiNKq+bjWFduL/9wpvdY0J+ou5xjF/NVUszGdDPXEO+tSz4GplzNqGYR7h0wUipQ
 c8SgyCxj54CtHyrRkDq69yHpDcTRFkT92z1jWp+L/9z598tvejlmzlAi9nL9IsWcEd
 CcAfSFkMusd6oeyXr21Gwn2pjF85hZe4UPJiLe8eCnt3S7JeCL1CUy8LwDLv49aHEX
 7lJtSU51NR6jTuoT+LuiUClig99ms6RhFfiw6SvHbbe1IhlO51sA/98NeV2NXrw9Tp
 GaJZai/zSBieg==
Message-ID: <9f7b2d02-3cea-636a-fbe0-fdcc8324ab89@benettiengineering.com>
Date: Fri, 3 Jun 2022 16:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <e123582d-c613-f81a-ac0d-b23bc4d3e74a@cartal.fr>
 <6478648f-ffb3-cda2-66ad-3758ead25319@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <6478648f-ffb3-cda2-66ad-3758ead25319@mind.be>
X-CMAE-Envelope: MS4xfC1H/wIdGfTu0kvo94w+lUj8UYFWtiiIMCROAbS2vsiMYfr4CDN+y6Zs5kgtDqe64JYknYmkSFH4vxGWQP6Fu6jVBZCAKIQcTujxvavOj2eKBuIUmSYj
 IYcGLqkM7Lukk3WSP+3eh8NncUSQ8+OCec6HwubydawUnv0aDdDAQz2aEuDVOEnoEBaEgBzdQ0276+/ZOLCk8utZbOQLNlXo4gNQ616s/HfB2B0ImxMJFNmZ
 jY5kC/kArMtfsDIIzxewqC5HYY/Oru4fJE0FfuPOWSFm3RZQfUb59txIyCBsJstg
Subject: Re: [Buildroot] Make 4.3 and printvars
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
Cc: Jean-Pierre Cartal <jean-pierre@cartal.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gMDMvMDYvMjIgMTY6MDUsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3Rl
Ogo+ICDCoFNlbmRpbmcgdGhpcyBpbiBuYW1lIG9mIEplYW4tUGllcnJlLCB3aG8gaXMgbm90IG9u
IHRoZSBsaXN0Lgo+IAo+PiBIZWxsbywKPj4KPj4gQSBxdWljayBtYWlsIHRvIGxldCB5b3Uga25v
dyB0aGF0IEkgYWxzbyBmYWNlZCB0aGUgbWFrZSA0LjMgcHJpbnR2YXJzIAo+PiBpc3N1ZSB5b3Ug
bWVudGlvbmVkIGluIEJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QuCj4+Cj4+IE9uIG15IHNpZGUgaW5j
cmVhc2luZyB0aGUgc3RhY2sgc2l6ZSBsaW1pdCBhcyBmb2xsb3c6Cj4+Cj4+IHVsaW1pdCAtcyAx
NjAwMAo+Pgo+PiBzb2x2ZWQgdGhpcyBpc3N1ZS4KPj4KPj4gUmVnYXJkcy4KPiAKPiAKPiAgwqBJ
IHRlc3RlZCBpdCBteXNlbGYgYW5kIGluZGVlZCwgaXQgd29ya3MhCgpJIGNvbmZpcm0sIGl0IHdv
cmtzIQoKPiAgwqBJdCB3b3VsZCBiZSBncmVhdCBpZiBzb21lb25lIGNvdWxkIGhhY2sgdGhpcyBp
bnRvIHRoZSBNYWtlZmlsZSBpdHNlbGYgCj4gKHNvIHRoYXQgaXQgcmVjdXJzZXMgaWYgdWxpbWl0
IC1zIGlzIG5vdCBoaWdoIGVub3VnaCkgYW5kIHJldmVydCAKPiAyNWNlYzVlYTczMzI1MS4KCkkn
bSB0cnlpbmcgdG8gYnVpbGQgbGlibnNzIHRoYXQgaXMgaW1wYWN0ZWQgYnkgdGhhdCBwcm9ibGVt
IHRvbyBhbmQgc2VlCmlmIGl0IGJ1aWxkcyBjb3JyZWN0bHkuIEkgbGV0IHlvdSBrbm93IGFsbC4K
CkJlc3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQ1RPL0NFT0BCZW5ldHRpIEVuZ2luZWVy
aW5nIHNhcwoKPiAgwqBSZWdhcmRzLAo+ICDCoEFybm91dAo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
