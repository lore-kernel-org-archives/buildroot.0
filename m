Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC59C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 21:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A522183B07;
	Wed, 20 Apr 2022 21:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofnt5b_bUqkW; Wed, 20 Apr 2022 21:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFA1383404;
	Wed, 20 Apr 2022 21:07:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EB2D1BF20F
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 21:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CBAF6114F
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 21:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GywbfZwiapBt for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 21:07:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F70C6113C
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 21:07:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7d82:8745:111f:47d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4B8235FF33;
 Wed, 20 Apr 2022 23:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650488839;
 bh=tWvQY0UBJLS2y5kJ47c1S+5/B56S2mVl0RPAKVd8FMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BSdyJQdGD6/ThzcfUHlMuKEh++VT3Xjaq+Kh5A6Vz+IIjSHb5kZ8r8yPgAaRf2E14
 2bF5O0oJ4zRWgC7IMor2Qqh2xq5o8rNGBtAbEgK/dSIvnzxkrKtaymvXKczWStqn5p
 Vgy9aChLWBRgxHTLTFdmGMbRKtlARpOTzTTNIDxe6oe8EhHjqO6ob1+Up7kO9YMeiT
 4aWztBX65IR/4bIkvZraboNabtqOsERVaBpwlC4/lYN5Pab75vSG9bNGa6qBOBnJh1
 Cx+DGWQk7n2xRVvQ6mVDRqfRz2W+N1BQ+xiDcY8hQ5D+DdabtMszA3Vy+q9bWbITOl
 i1sPEeE+DNeoQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Apr 2022 23:07:14 +0200
Date: Wed, 20 Apr 2022 23:07:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Message-ID: <20220420210714.GJ2730@scaer>
References: <20220310152048.633340-1-theo.lebrun@bootlin.com>
 <20220420205708.GI2730@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220420205708.GI2730@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] package/ragel: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGjDqW8sIEFsbCwKCk9uIDIwMjItMDQtMjAgMjI6NTcgKzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bh
a2UgdGh1c2x5Ogo+IE9uIDIwMjItMDMtMTAgMTY6MjAgKzAxMDAsIFRow6lvIExlYnJ1biB2aWEg
YnVpbGRyb290IHNwYWtlIHRodXNseToKPiA+IFRoaXMgaXMgYW4gaG9zdC1vbmx5IHBhY2thZ2Ug
dGhhdCBkb2VzIHByZXByb2Nlc3NpbmcgdG8gLnJsIGZpbGVzIHRvCj4gPiB0dXJuIHRoZW0gaW50
byAuYyBvciAuY3BwIGZpbGVzLgpbLS1TTklQLS1dCj4gPiArUkFHRUxfVkVSU0lPTiA9IDYuMTAK
PiA+ICtSQUdFTF9TSVRFID0gaHR0cHM6Ly93d3cuY29sbS5uZXQvZmlsZXMvcmFnZWwvCj4gPiAr
UkFHRUxfTElDRU5TRSA9IEdQTC0yLjAKPiA+ICtSQUdFTF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlO
Rwo+ID4gK1JBR0VMX0NPTkZfT1BUUyA9IFwKPiA+ICsJLS1kaXNhYmxlLXNpbGVudC1ydWxlcyBc
Cj4gPiArCS0tZGlzYWJsZS1tYW51YWwgXAo+ID4gKwktLWRpc2FibGUtZGVwZW5kZW5jeS10cmFj
a2luZwoKR2FoLCBJIGZvcmdvdCB0byBjb21tZW50IGFib3V0IHRob3NlIGJlZm9yZSBwdXNoaW5n
IGFuZCBzZW5kaW5nIHRoZQpwcmV2aW91cyBtYWlsLi4uCgpTbywgd2h5IHdlcmUgLS1kaXNhYmxl
LXNpbGVudC1ydWxlcyBhbmQgLS1kaXNhYmxlLWRlcGVuZGVuY3ktdHJhY2tpbmcKbmVlZGVkPyBV
c3VhbGx5LCB0aGV5IGFyZSBub3QgbmVlZGVkLCBhbmQgd2UgZG8gbm90IGV2ZW4gc2V0IHRoZW0g
aW4gb3VyCmF1dG90b29scy1wYWNrYWdlIGluZnJhLgoKSWYgdGhleSBhcmUgcmVhbGx5IGltcG9y
dGFudCwgY291bGQgeW91IHBsZWFzZSBzZW5kIGEgZm9sbG93dXAgdGhhdCBhZGRzCmEgY29tbWVu
dCBhYm92ZSBSQUdFTF9DT05GX09QVFM/IEFuZCBpZiB0aGV5IGFyZSBub3QgbmVlZGVkLCBjYW4g
eW91CnNlbmQgYSBmb2xsb3d1cCBwYXRjaCB0aGF0IHJlbW92ZXMgdGhlbT8KClJlZ2FyZHMsCllh
bm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJ
TiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNw
aXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0t
LS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwK
fCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAg
IHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
