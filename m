Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69012C07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:43:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F404C610A7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F404C610A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C75896067E;
	Tue, 20 Jul 2021 21:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9ex4GMj3qJS; Tue, 20 Jul 2021 21:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A62600C9;
	Tue, 20 Jul 2021 21:43:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 696321BF9B2
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6604F6003C
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQczQgVQds5P for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:39:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D3CC6002E
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:39:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3E3C0240004;
 Tue, 20 Jul 2021 21:39:51 +0000 (UTC)
Date: Tue, 20 Jul 2021 23:39:50 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20210720233950.29752fd1@windsurf>
In-Reply-To: <20210630234717.21742-2-raphael.melotte@mind.be>
References: <20210630234717.21742-1-raphael.melotte@mind.be>
 <20210630234717.21742-2-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/4] package/gumbo-parser: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720213950.KUH9QYvFawcDQAzqwj1b7qu0sft9oEeG26UR-q-faG4@z>

SGVsbG8sCgpPbiBUaHUsICAxIEp1bCAyMDIxIDAxOjQ3OjE0ICswMjAwClJhcGhhw6tsIE3DqWxv
dHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4gd3JvdGU6Cgo+IEd1bWJvIGlzIGFuIGltcGxl
bWVudGF0aW9uIG9mIHRoZSBIVE1MNSBwYXJzaW5nIGFsZ29yaXRobSBpbXBsZW1lbnRlZAo+IGFz
IGEgcHVyZSBDOTkgbGlicmFyeSB3aXRoIG5vIG91dHNpZGUgZGVwZW5kZW5jaWVzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4K
CkkndmUgYXBwbGllZCwgd2l0aCBvbmUgaW1wb3J0YW50IGNoYW5nZSwgc2VlIGJlbG93LgoKPiAr
R1VNQk9fUEFSU0VSX1ZFUlNJT04gPSAwLjEwLjEKPiArR1VNQk9fUEFSU0VSX1NJVEUgPSAkKGNh
bGwgZ2l0aHViLGdvb2dsZSxndW1iby1wYXJzZXIsdiQoR1VNQk9fUEFSU0VSX1ZFUlNJT04pKQo+
ICtHVU1CT19QQVJTRVJfTElDRU5TRSA9IEFwYWNoZS0yLjAKPiArR1VNQk9fUEFSU0VSX0xJQ0VO
U0VfRklMRVMgPSBDT1BZSU5HCj4gK0dVTUJPX1BBUlNFUl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMK
PiArCj4gK2RlZmluZSBHVU1CT19QQVJTRVJfUlVOX0FVVE9HRU4KPiArCWNkICQoQEQpICYmIFBB
VEg9JChCUl9QQVRIKSAuL2F1dG9nZW4uc2gKPiArZW5kZWYKPiArR1VNQk9fUEFSU0VSX1BSRV9D
T05GSUdVUkVfSE9PS1MgKz0gR1VNQk9fUEFSU0VSX1JVTl9BVVRPR0VOCgpUaGlzIGlzIG5vdCBn
b29kLCBhcyBpdCBkb2Vzbid0IGFkZCBhdXRvY29uZi9hdXRvbWFrZSB0byB0aGUKZGVwZW5kZW5j
aWVzIG9mIHRoZSBwYWNrYWdlLiBTbyBJJ3ZlIHJlcGxhY2VkIHdpdGg6CgpHVU1CT19QQVJTRVJf
QVVUT1JFQ09ORiA9IFlFUwoKd2hpY2ggZG9lcyB3b3JrLgoKVGhhbmtzIQoKVGhvbWFzCi0tIApU
aG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
