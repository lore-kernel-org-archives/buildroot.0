Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79A1C433F5
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 20:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 195FE818B5;
	Tue, 23 Nov 2021 20:47:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xIulaDAcxfXA; Tue, 23 Nov 2021 20:47:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C1D581882;
	Tue, 23 Nov 2021 20:47:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C62881BF3A8
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 20:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B819E4018D
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 20:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpwmWsfyRdlz for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 20:47:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE8D0400BF
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 20:47:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b92e:f94:7d9a:74f6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 499A3B0029D;
 Tue, 23 Nov 2021 21:47:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1637700448;
 bh=Ve2r2bXYxMt/KLL8fOSt8EMUD2iX2YAiFLGc0djwo5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gBwpXU1GpASbCnrr8pJdsMijtmcD9ZVvza4RyIDsv10Igslnt55IpAoIO2IGUSTsI
 jOp4Hc1BKPKx3RlcHbSy5kFlgir6fQSG53LLG7mw4+YckFTmoRcctxZgOkODUc6OPJ
 OQ2a2N1aUjJeAysYbFfj52GsZPQbO3KnnhtwoP72TOer47ULkAAPSorC/eZPMqngiS
 5ZJBjXDOZ8WVH+SAPLSknsRapM8oZfj6wJGS+f0p+H0HtmvXkXQl+2T2Xr0waJII8W
 VqWOpLZTKLt1g/V2RE3Tpl2lzQ2SURbCu7g63Y4G0hoXh2C3J5tyI8EeBzIbEKt2yS
 4b+G61rVailpw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 Nov 2021 21:47:10 +0100
Date: Tue, 23 Nov 2021 21:47:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211123204710.GW247986@scaer>
References: <20211120231007.1944130-1-yann.morin.1998@free.fr>
 <66122ac8-f802-d8e6-eae5-6288edaedc11@gmail.com>
 <8735noozvf.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8735noozvf.fsf@dell.be.48ers.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH:LTS] gitlab-ci: update the image version
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGV0ZXIsIEFsbCwKCk9uIDIwMjEtMTEtMjIgMTg6MzcgKzAxMDAsIFBldGVyIEtvcnNnYWFyZCBz
cGFrZSB0aHVzbHk6Cj4gPj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFv
dXJAZ21haWwuY29tPiB3cml0ZXM6Cj4gID4gSGVsbG8gWWFubiwKPiAgPiBMZSAyMS8xMS8yMDIx
IMOgIDAwOjEwLCBZYW5uIEUuIE1PUklOIGEgw6ljcml0wqA6Cj4gID4+IFdlIGdldCBuZXdlciBD
QSBjZXJ0aWZpY2F0ZXMsIHRvIGdldCByaWQgb2YgdGhlIGFubm95aW5nIGlzc3VlcyB3aXRoIHRo
ZQo+ICA+PiBub3ctZXhwaXJlZCBMZXQncyBFbmNyeXB0IHJvb3QgY2VydGlmaWNhdGUuCj4gQ29t
bWl0dGVkIHRvIDIwMjEuMDIueCBhbmQgMjAyMS4wOC54LCB0aGFua3MuCj4gID4gTWF5YmUgd2Ug
Y2FuIGFsc28gYmFja3BvcnQgdGhlIHBhdGNoIHN3aXRjaGluZyB0byB0aGUgZ2l0bGFiIHJlZ2lz
dHJ5Pwo+ICA+IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIw
MjEtTm92ZW1iZXIvNjI4NTAyLmh0bWwKCkFncmVlZC4gQWZ0ZXIgaXQgaXMgYmFja3BvcnRlZCB0
byBhbGwgcmVsZXZhbnQgYnJhbmNoZXMsIHdlIGNhbgpldmVudHVhbGx5IGRyb3AgdXNpbmcgdGhl
IERvY2tlciBodWIuIEknbGwgc2VuZCBhIHBhdGNoIHVwZGF0aW5nIHRoZQptb2R1cy1vcGVyYW5k
aSBpbiB0aGUgRG9ja2VyZmlsZXMuCgo+IFdlIGNhbi4gSXMgdGhlIDIwMjExMTIwLjE5MjUgaW1h
Z2UgdGhlcmUgYWxyZWFkeT8KCkl0IGlzIGJlaW5nIHB1c2hlZCBhcyBJIGFtIHdyaXRpbmcgdGhp
cy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
