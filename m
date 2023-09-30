Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BE2E77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 751C183DB6;
	Sat, 30 Sep 2023 14:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 751C183DB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tkhuq2XZVCIJ; Sat, 30 Sep 2023 14:08:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A73D983DE8;
	Sat, 30 Sep 2023 14:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A73D983DE8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBE911BF3EB
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4482607B0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4482607B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mgJr_SY-5YAq for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:08:10 +0000 (UTC)
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 444646068F
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 444646068F
Received: from smtpclient.apple ([151.44.13.68])
 by Aruba Outgoing Smtp  with ESMTPA
 id madaqacCWhzS9madbqKKyX; Sat, 30 Sep 2023 16:08:07 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 30 Sep 2023 16:08:05 +0200
Message-Id: <1373B8FB-F147-4BE3-AF64-74E305661340@benettiengineering.com>
References: <20230930132145.GB2579@scaer>
In-Reply-To: <20230930132145.GB2579@scaer>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: iPhone Mail (21A351)
X-CMAE-Envelope: MS4xfLEDYs2LPlxS0jM6ePbYU/MgN2PKNkaJIN6HfRr5yLRF6SFtjTcJbiGywailpirBuCGpPzJvTt7/lGe2zXyAnPcXi47n0tXaDPkua1P/8h3tcmeUS6Xe
 chiOvHI6VbsU2t6e7khHF7PCEWUsS0ahiA00CGSdSmCTY7/Ns0cuhmv5Fqzjs+hdTgAO1MVmCOCNE8gl5uSLxEbpbwsrCSj/6qo4ydLxiwdsG3IY3DUKAd1W
 fG4mUUKBwodiWUXHCeZOUGDhIhsTXSJdOaxDKjUGh8hdaeF8A+hNGFmpchDNQZVq
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1696082887; bh=Euons3nc+ROeA3IwBcG4MuYg7Fw1GL3A2z4CvaOt7Xo=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=CLXDk5ntqkOlrxByiH8u2zQAuY/Jffzr2QQcos5CaoCj0c/8/qIntIeCrnqIYAhBs
 1vkj6Ig1OhMFtIlQ0C58MvG9m+2Q3djd/1th+OxauewJbA79HcDxXqxURQekVIMvtd
 9A1RQOA63pCfuJbNhoa3RgH+hR5hl/d/ixMfJvgCoYJ6U/GE5PRGVKtxkZIAU6amVI
 H1P6QYqySdQypMBV2VrrkGDvOZ0Qke9712xe5BMnL72wPsfsjN5M0M3evDdmh8WJTU
 ybTldCdOETQ+lHS/lmvo4kIcxpci4y2vC1kuChXkvVEuWVzSQRQWG8yFYaHsQYL+4P
 be4XGh+YrrxsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CLXDk5nt
Subject: Re: [Buildroot] New maintainer on board
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot ML <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tcGxpbWVudHMgUm9tYWluIQpMb29rIGZvcndhcmQgZm9yIHlvdSB0byBjb21taXQgc29tZSBv
ZiBteSBwYXRjaGVzIDotKQoKS2luZCByZWdhcmRzCkdpdWxpbyBCZW5ldHRpCgo+IElsIGdpb3Ju
byAzMCBzZXQgMjAyMywgYWxsZSBvcmUgMTU6MjIsIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4u
MTk5OEBmcmVlLmZyPiBoYSBzY3JpdHRvOgo+IAo+IO+7v0hlbGxvIEFsbCwKPiAKPiBSb21haW4g
aGFzIGJlZW4gY29udHJpYnV0aW5nIHRvIEJ1aWxkcm9vdCBmb3IgbW9yZSBhIGRlY2FkZSBub3cs
IGFuZCBoZQo+IGhhcyBkb25lIHF1aXRlIGEgbG90IG9mIHdvcmsgaW4gdmFyaW91cyBwbGFjZXMg
aW4gQnVpbGRyb290LCBhbmQgaGFzCj4gYmVlbiBoZWxwaW5nIGR1cmluZyB0aGUgZGV2ZWxvcHBl
cnMgZGF5cyBhbmQgaGFja2F0aG9ucy4KPiAKPiBIZSBoYXMgYWdyZWVkIHRvIGpvaW4gdGhlIG1h
aW50YWluZXJzIHRlYW0sIGFuZCBmdXJ0aGVyIGhpcyBpbXBsaWNhdGlvbgo+IGluIHRoZSBwcm9q
ZWN0Lgo+IAo+IFRoZSBtb3N0IGFzdHV0ZSBvZiB5b3Ugd2lsbCBoYXZlIG5vdGljZWQgdGhhdCBS
b21haW4gaGFzIGJlZW4gcXVpY2sgdG8KPiB0YWtlIGhpcyBuZXcgZHV0aWVzIHRvIGhlYXJ0LCBh
bmQgYWxyZWFkeSBwdXNoZWQgc2lnbmlmaWNhbnQgY2hhbmdlcyB0bwo+IHRoZSB0b29sY2hhaW4g
YmVmb3JlIEkgY291bGQgZmluaXNoIHRoaXMgZW1haWwhIDotKQo+IAo+IFdlbGNvbWUgb24gYm9h
cmQgUm9tYWluLCBsZXQgdGhlIEZvcmNlIGJlIHdpdGggeW91IQo+IAo+IFJlZ2FyZHMsCj4gWWFu
biBFLiBNT1JJTi4KPiAKPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8
IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkg
NDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJl
IGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
