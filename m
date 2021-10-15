Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB708C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 09:28:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2775A61151
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 09:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2775A61151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B54B983B2D;
	Fri, 15 Oct 2021 09:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUm2R3i-v2Yl; Fri, 15 Oct 2021 09:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35D3983B25;
	Fri, 15 Oct 2021 09:28:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A0DE1BF48C
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 09:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52539404ED
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 09:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3BDPkJMLE2EH for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 09:28:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4273E40486
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 09:28:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 11609C000A;
 Fri, 15 Oct 2021 09:28:48 +0000 (UTC)
Date: Fri, 15 Oct 2021 11:28:48 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Message-ID: <20211015112848.49b34150@windsurf>
In-Reply-To: <20211015111917.7619aaf3@kmaincent-XPS-13-7390>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-3-kory.maincent@bootlin.com>
 <20211006181104.GD2081069@scaer>
 <20211007102318.556f7fc2@kmaincent-XPS-13-7390>
 <20211007095326.GA2814782@scaer>
 <20211007144351.629d2de0@kmaincent-XPS-13-7390>
 <20211007162931.GH2081069@scaer>
 <20211011122736.3b0df127@kmaincent-XPS-13-7390>
 <20211014200207.GC368016@scaer>
 <20211015111917.7619aaf3@kmaincent-XPS-13-7390>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/7] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAxNSBPY3QgMjAyMSAxMToxOTozOSArMDIwMApLw7ZyeSBNYWluY2VudCA8a29yeS5t
YWluY2VudEBib290bGluLmNvbT4gd3JvdGU6Cgo+ID4gQW5kIHJlLXN0YXJ0aW5nIHRoZSBidWls
ZCBzdWNjZWVkcy4gIAo+IAo+IFdlaXJkLCBJIGRvIG5vdCBmYWNlIHRoaXMgYnVpbGQgZXJyb3Ig
d2l0aCB0aGUgc2FtZSBkZWZjb25maWcuCgpJdCdzIGEgcGFyYWxsZWwgYnVpbGQgaXNzdWUsIHdo
aWNoIG1lYW5zIGl0J3MgYSByYWNlIGNvbmRpdGlvbi4gSXQgd2lsbApub3QgaGFwcGVuIGFsbCB0
aGUgdGltZS4gVHJ5IG9uIGEgYnVpbGQgc2VydmVyIHdpdGggbG90cyBvZiBDUFUgY29yZXMsCmFu
ZCBkbyB0aGUgYnVpbGQgaW4gYSBsb29wIG11bHRpcGxlIHRpbWVzLgoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
