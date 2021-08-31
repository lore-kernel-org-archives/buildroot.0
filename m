Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787E3C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 08:51:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFB0F604D7
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 08:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFB0F604D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CC55400E4;
	Tue, 31 Aug 2021 08:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CRWsFvRzV1O4; Tue, 31 Aug 2021 08:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8291E40474;
	Tue, 31 Aug 2021 08:51:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 845A51BF82B
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 08:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7185D400E4
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 08:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQnWBvEAh0Ix for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 08:51:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72C5040474
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 08:51:28 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 592D360003;
 Tue, 31 Aug 2021 08:51:25 +0000 (UTC)
Date: Tue, 31 Aug 2021 10:51:23 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210831105123.7d566052@kmaincent-XPS-13-7390>
In-Reply-To: <20210819232630.57caadc9@windsurf>
References: <20210709094925.1605675-1-kory.maincent@bootlin.com>
 <20210819232630.57caadc9@windsurf>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] boot/arm-trusted-firmware: Update FIP
 image generation with BL33_CFG option
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

SGVsbG8gVGhvbWFzLCAKCk9uIFRodSwgMTkgQXVnIDIwMjEgMjM6MjY6MzAgKzAyMDAKVGhvbWFz
IFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cgo+IFdoYXQg
SSBkb24ndCBsaWtlIGFib3V0IHRoaXMgaXMgdGhhdCAoZm9yIG5vdykgdGhpcyBCTDMzX0NGRyB2
YXJpYWJsZQo+IGlzIHNwZWNpZmljIHRvIHRoZSBTVCBmb3JrIG9mIFRGLUEuIElmIHdlIHN0YXJ0
IGFkZGluZyBzdXBwb3J0IGZvciBhbGwKPiB0aGUgcmFuZG9tIHZhcmlhYmxlcyB0aGF0IHZlbmRv
ci1zcGVjaWZpYyBmb3JrcyBjcmVhdGUsIGl0J3Mgc29vbiBnb2luZwo+IHRvIGJlIGEgbmlnaHRt
YXJlLgoKT2ssIHRoYXQncyBmYWlyLgoKPiAKPiBJbnN0ZWFkIG9mIHRoaXMsIGNvdWxkIHlvdSB0
cnkgdG8gYWRkIHNvbWV0aGluZyBsaWtlOgo+IAo+IEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklS
TVdBUkVfQURESVRJT05BTF9WQVJJQUJMRVM9IkJMMzNfQ0ZHPSQoQklOQVJJRVNfRElSKS95b3Vy
LWR0Yi5kdGIiCj4gCj4gYW5kIHNlZSBpZiB0aGF0IHdvcmtzID8KCkl0IHdvcmtzLiBUaGFua3Mu
CgpSZWdhcmRzLApLw7ZyeQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRw
Oi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
