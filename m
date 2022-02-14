Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F23C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 17:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2297C81410;
	Mon, 14 Feb 2022 17:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hLVnXjvEsZxu; Mon, 14 Feb 2022 17:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50F2082656;
	Mon, 14 Feb 2022 17:05:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5002E1BF338
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 17:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DF9660F44
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 17:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOdXoY4vIXbf for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 17:05:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF23060674
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 17:05:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:892f:28b2:cec5:360f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 992FF20041C;
 Mon, 14 Feb 2022 18:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644858300;
 bh=LBfrWISI0vdI2T+sNcHmUpcFK16x1vkWdH5vNvZWFQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RHOcODT4lLU74z4bH25y335MTDVSiJjWatsGY6un0nx+DZVNq+Jr0mjXjSyUt2rRK
 1z5DNsh1OLmTDyGJ3ouHFLKlk+lGRBGmRc82Y7+gqUBR1KEXSjXOmDbJidqvEzA3MO
 MSjgnQtkk3xvENJk/Uawv31wzZHFCaKH0A7dbOiHk44QWh7bN59mdXc6/1XRkdhz/F
 v2H0cBByaSQQRMLy9/xv9bFpf0FTmIe6VHcUwtzk4B0/PrwH+OXAxq4u8KqA4R/UpT
 j8/73pSTCv6Qw6mVAyqAyIZWFm7QLYoUhuJVGMTeuPh0bOZOGR3nxshAxkBqxI5Gzg
 xdUQDges66+pw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 14 Feb 2022 18:04:56 +0100
Date: Mon, 14 Feb 2022 18:04:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <20220214170456.GE38097@scaer>
References: <20220214162413.17301-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214162413.17301-1-luca@lucaceresoli.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] utils/docker-run: use portable bash
 shebang
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

THVjYSwgQWxsLAoKU2VyaWVzIG9mIHR3byBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQXMg
R2l1bGlvIHJlcXVlc3RlZCwgYW4gYWRkaXRpb25hbCBwYXRjaCB0byB1c2UgLS1ybSB3b3VsZCBi
ZSBuaWNlLgoKQW5kIG5vdyB0aGVyZSBpcyBzb21ldGhpbmcgdGhhdCBzdHJpa2VzIG1lOiB3ZSBi
aW5kLW1vdW50IHRoZSBCdWlsZHJvb3QKdHJlZSBhcyB0aGUgaG9tZSBvZiB0aGUgYnItdXNlciwg
c28gd2UgZG9uJ3QgaGF2ZSBhbnkgZmlsZSBmcm9tIHRoZQpici11c2VyIGF2dmFpbGFibGUgYXQg
YWxsLCBzbyB3ZSBjYW4gYXMgd2VsbCBydW4gdGhlIGNvbnRhaW5lciB3aXRoIHRoZQpsb2NhbCB1
c2VyLCBieSBydW5uaW5nIHdpdGg6CgogICAgICAgIC0tdXNlciAkKGlkIC11KTokKGlkIC1nKQoK
VGhpcyB3YXksIHRoZXJlIHdpbCBubyBsb25nZXIgYmUgYW55IGlzc3VlIHdpdGggZmlsZSBhY2Nj
ZXNzIHJpZ2h0cy4KClRoZXJlIHdvdWxkIGhvd2V2ZXIgYmUgdGhlIGlzc3VlIHRoYXQgdGhlIHBh
dGhzIGluIHRoZSBjb250YWluZXIgd291bGQKbm90IGJlIHRoZSBzYW1lIGFzIG9uIHRoZSBob3N0
LCBidXQgd2UgY2FuIGFsc28gYWxsZXZpYXRlIHRoYXQgaXN1ZSBieQpkb2luZyB0aGUgYmluZC1t
b3VudCBpbiB0aGUgc2FtZSBsb2NhdGlvbiAoRG9ja2VyIGNyZWF0ZXMgdGhlIG1vbnRwb2ludApp
ZiBpdCBkb2VzIG5vdCBleGlzdHMgcHJpb3IgZG8gZG9pbmcgdGhlIG1vdW50KSwgYW5kIGNoYW5n
ZSB0aGUgY3dkOgoKICAgIGV4ZWMgZG9ja2VyIHJ1biBcCiAgICAgICAgLWl0IC0tcm0gXAogICAg
ICAgIC0td29ya2RpciAiJHtNQUlOX0RJUn0iIFwKICAgICAgICAtLW1vdW50ICJ0eXBlPWJpbmQs
c3JjPSR7TUFJTl9ESVJ9LGRzdD0ke01BSU5fRElSfSIgXAogICAgICAgICIke0lNQUdFfSIgXAog
ICAgICAgICIkQCIKCkV0IHZvaWzDoCwgdGhhdCdzIG11Y2ggbW9yZSBpbnRlcmVzdGluZyBub3ch
IDotXQoKQ2FyZSB0byBzZW5kIGEgcGF0Y2ggcGxlYXNlPyA7LSkKClJlZ2FyZHMsCllhbm4gRS4g
TU9SSU4uCgpPbiAyMDIyLTAyLTE0IDE3OjI0ICswMTAwLCBMdWNhIENlcmVzb2xpIHNwYWtlIHRo
dXNseToKPiAvdXNyL2Jpbi9iYXNoIGRvZXMgbm90IGV4aXN0IG9uIFVidW50dSAyMDE4LjA0LiBV
c2UgdGhlIG1vcmUgcG9ydGFibGUKPiBhbHRlcm5hdGl2ZSAvYmluL2Jhc2guCj4gCj4gTm90ZSB0
aGF0IGN1cnJlbnRseSAiL3Vzci9iaW4vYmFzaCIgZG9lcyBub3QgYXBwZWFyIGFueXdoZXJlIGlu
IHRoZQo+IEJ1aWxkcm9vdCBzb3VyY2UgY29kZSwgd2hpbGUgIi9iaW4vYmFzaCIgaXMgdXNlZCBi
eSBtYW55IHNjcmlwdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBDZXJlc29saSA8bHVjYUBs
dWNhY2VyZXNvbGkubmV0Pgo+IEZpeGVzOiAyNDJlOWQ3MmU3ZDIgKCJ1dGlscy9kb2NrZXItcnVu
OiBuZXcgc2NyaXB0IikKPiAtLS0KPiAgdXRpbHMvZG9ja2VyLXJ1biB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3V0aWxzL2RvY2tlci1ydW4gYi91dGlscy9kb2NrZXItcnVuCj4gaW5kZXggMDYxNGYxMzI1ZDc4
Li45NzlhZWM2OWI5NDYgMTAwNzU1Cj4gLS0tIGEvdXRpbHMvZG9ja2VyLXJ1bgo+ICsrKyBiL3V0
aWxzL2RvY2tlci1ydW4KPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyEvdXNyL2Jpbi9iYXNoCj4gKyMh
L2Jpbi9iYXNoCj4gIHNldCAtbyBlcnJleGl0IC1vIHBpcGVmYWlsCj4gIERJUj0kKGRpcm5hbWUg
IiR7MH0iKQo+ICBNQUlOX0RJUj0kKHJlYWRsaW5rIC1mICIke0RJUn0vLi4iKQo+IC0tIAo+IDIu
MzUuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
