Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DDFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 02:54:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5787660F0F
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 02:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5787660F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ozlabs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E67AD60765;
	Sun, 10 Oct 2021 02:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VssTZorN07bu; Sun, 10 Oct 2021 02:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A8760750;
	Sun, 10 Oct 2021 02:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30D641BF2CB
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 02:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F4084013C
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 02:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ozlabs.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FseaOdNkKKKk for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 02:54:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F10A84013A
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 02:54:46 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HRmjn2gYMz4xbV;
 Sun, 10 Oct 2021 13:54:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1633834478;
 bh=mI3bLOQbsOvNJPjo7+aTKFw0op6tIjZpkbXKJbGWyHc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=f7lSvM3TKDtlyMMUTlVGYoygowLyiKBClyWNx12HF+d91GWRzjqgYfkKbJfv8683z
 LWM9c+YXej+Juk4Y7hBWRGt2Y4ratjGYrz0PEUCkKe7jhpObl8ONzSL1h4pm19D4LJ
 6hgqcvsN5ItVkM0QeWupMi3zIDDhLodLuI30QZZExafxwIOHxgiKCpZGpI8UxM7enO
 XMXwQ97Pl7UMm0oatGxm7pHtIEzviBSvdm8M+CKYhsPs4KjQ/CHLEiiiJ8Utgpe/u7
 sDxyVBsRnDSdVh633iHiwjDKj6jiaTIs/mloRvTnOr/C5b4O2mJCZp+hDvMuVfQzVN
 8NLleYYBncc3w==
Message-ID: <9a43025b2c5eb6be4848e07ff761e6a86080e50c.camel@ozlabs.org>
From: Jeremy Kerr <jk@ozlabs.org>
To: Baruch Siach <baruch@tkos.co.il>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun, 10 Oct 2021 10:54:32 +0800
In-Reply-To: <87bl3ym1qr.fsf@tarshish>
References: <87a6jl5qvb.fsf@tarshish> <20211007060119.GG2081069@scaer>
 <87bl3ym1qr.fsf@tarshish>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Subject: Re: [Buildroot] Buildroot patchwork strange Submitter
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmFydWNoLAoKPiBZb3UgY2FuIHNlZSB0aGF0IHRoZSAnRnJvbScgaGVhZGVyIHNob3dzIHRo
ZSBjb3JyZWN0IHNlbmRlcjoKPiAKPiDCoCBGcm9tOiBZYWlyIEJlbi1BdnJhaGFtIHZpYSBidWls
ZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPgoKVGhhdCdzIG5vdCByZWFsbHkgdGhlIGNv
cnJlY3Qgc2VuZGVyOyBpdCdzIGJlZW4gbW9kaWZpZWQgYnkgdGhlIGxpc3QKc29mdHdhcmUuCgo+
IEkgc2VlIHRoZSBzYW1lIGluIHRoaXMgZW1haWwgZnJvbSBteSBhcmNoaXZlLgo+IAo+IFN0aWxs
LCBwYXRjaHdvcmsgcHJldmlvdXNseSB1c2VkIG15IG5hbWUgYXMgIlN1Ym1pdHRlciIsIGFuZCBu
b3cKPiBDaHJpc3RpYW4ncy4gU28gSSB0aGluayBzb21ldGhpbmcgaXMgd3Jvbmcgd2l0aCBwYXRj
aHdvcmsuCgpZZXAsIHdlIHRyeSB0byBmaW5kIHRoZSBjb3JyZWN0IHNlbmRlciBpZiB0aGUgRnJv
bTogaGVhZGVyIHJlcG9ydHMgdGhlCmxpc3QgYWRkcmVzcyBhcyB0aGUgc2VuZGVyLgoKSG93ZXZl
ciwgdGhlIGJ1aWxkcm9vdCBsaXN0IGhhcyBjaGFuZ2VkIGJhY2stYW5kLWZvcnRoIGJldHdlZW4K
YnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcgYW5kIGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
IGEgY291cGxlIG9mCnRpbWVzIHJlY2VudGx5LiBUaGUgbGlzdCBhZGRyZXNzIHdhcyBzZXQgdG8K
YnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcsIHdoaWNoIGRpZG4ndCBtYXRjaCB0aGF0ICd2
aWEnIGhlYWRlci4KCkkndmUgc2luY2Ugc2V0IGl0IHRvIGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
LCBzbyB0aGUgcmV2ZXJzZS1kbWFyYy1maXgKc2hvdWxkIHdvcmsgYWdhaW4gLSBsZXQgbWUga25v
dyBob3cgaXQgZ29lcy4KCkNoZWVycywKCgpKZXJlbXkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
