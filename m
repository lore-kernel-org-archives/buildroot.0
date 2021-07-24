Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91B5C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:38:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95D7C60E0C
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95D7C60E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B475834DB;
	Sat, 24 Jul 2021 21:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oI3eECA1kt4Y; Sat, 24 Jul 2021 21:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5216834CB;
	Sat, 24 Jul 2021 21:38:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C054B1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE8EA834CB
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Xv1K9pKOBD8 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5C05834B6
 for <buildroot@busybox.net>; Sat, 24 Jul 2021 21:38:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CE2741C0006;
 Sat, 24 Jul 2021 21:38:21 +0000 (UTC)
Date: Sat, 24 Jul 2021 23:38:20 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20210724233820.75126717@windsurf>
In-Reply-To: <20210723095113.26189-1-jose.pekkarinen@unikie.com>
References: <20210723095113.26189-1-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] Remove deprecated matchpathcon calls
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

T24gRnJpLCAyMyBKdWwgMjAyMSAxMjo1MToxMyArMDMwMApKb3PDqSBQZWtrYXJpbmVuIDxqb3Nl
LnBla2thcmluZW5AdW5pa2llLmNvbT4gd3JvdGU6Cgo+IFRoaXMgcGF0Y2ggcmVtb3ZlcyBtYXRj
aHBhdGhjb24gY2FsbHMgZnJvbQo+IHRoZSBhdWRpdGQgaW5pdCBzY3JpcHQsIHJlbW92aW5nIHNv
bWUgZGVwcmVjYXRlZAo+IHdhcm5pbmcgaW4gdGhlIGluaXQgcHJvY2Vzcy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4KPiBD
aGFuZ2UtSWQ6IEkyMmJkZjczZGU3MzJlOWQxMDdlYzA2YTRiOTQzNGU3MGVlYzY2MmE1Cj4gLS0t
Cj4gIHBhY2thZ2UvYXVkaXQvUzAyYXVkaXRkIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghIEkn
dmUgcmV3b3JrZWQgYSBiaXQgdGhlIGNvbW1pdCBsb2csIGFuZCBhcHBsaWVkCnRvIG1hc3Rlci4K
ClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
