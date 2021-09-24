Return-Path: <SRS0=OK8R=OO=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0ABDC433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 07:04:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04993610CB
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 07:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04993610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A424B80FF3;
	Fri, 24 Sep 2021 07:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7Lr_NbZpk3u; Fri, 24 Sep 2021 07:04:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14A2180F77;
	Fri, 24 Sep 2021 07:04:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6FD61BF31E
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 07:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D731780F5A
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 07:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s4XGXmd4c1cJ for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 07:04:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A623F80F3F
 for <buildroot@busybox.net>; Fri, 24 Sep 2021 07:04:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5372BE0004;
 Fri, 24 Sep 2021 07:04:16 +0000 (UTC)
Date: Fri, 24 Sep 2021 09:04:15 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210924090415.24fb5ff4@windsurf>
In-Reply-To: <b7942247-9f9e-8517-257d-538e96cc6e32@mind.be>
References: <CAKAnv4E=JmqtbHR_EM8hL9QTjrSbjNKsBjvA5Ogiv1BYqGDVEQ@mail.gmail.com>
 <b7942247-9f9e-8517-257d-538e96cc6e32@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] buildroot u-boot.nand oob size
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net, Ivan Riabtsov <ivriabtsov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8gQXJub3V0LAoKT24gVGh1LCAyMyBTZXAgMjAyMSAyMTozMTowNCArMDIwMApBcm5vdXQg
VmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdyb3RlOgoKPiA+IHBzIGkgY2FudCB3cml0
ZSBtZXNzYWdlIHRvIGJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3Jn0LEgaSBnZXQgYQo+ID4g
bWVzc2FnZSAiVW5kZWxpdmVyZWQgTWFpbCBSZXR1cm5lZCB0byBTZW5kZXIiICAKPiAKPiAgIGxp
c3RzLmJ1aWxkcm9vdC5vcmcgaXMgb25seSB0aGUgd2Vic2l0ZS4gVGhlIG1haWwgYWRkcmVzcyBp
cyAKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZyAob3IgLm5ldCwgb3IgYnVpbGRyb290QGJ1c3li
b3gubmV0LCB0aGV5IGFsbCBlbmQgdXAgYXQgCj4gdGhlIHNhbWUgcGxhY2UpLgoKVGhpcyBpc3N1
ZSB3YXMgcmVwb3J0ZWQgb24gSVJDIGFzIHdlbGwuIElmIHlvdSByZWFkCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdCwgaXQgc2F5czoKCiAgVG8g
cG9zdCBhIG1lc3NhZ2UgdG8gYWxsIHRoZSBsaXN0IG1lbWJlcnMsIHNlbmQgZW1haWwgdG8KICBi
dWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZy4gCgpTbyBiYXNpY2FsbHksIGl0IHRlbGxzIHlv
dSB0byB1c2UgYW4gZS1tYWlsIGFkZHJlc3MgdGhhdCBkb2Vzbid0IHdvcmsgOi0vCgpCZXN0IHJl
Z2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcK
aHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
