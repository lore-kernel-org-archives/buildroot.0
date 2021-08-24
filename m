Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09613C4320A
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 21:53:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC4A8613B1
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 21:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC4A8613B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A63D4011B;
	Tue, 24 Aug 2021 21:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ZXOkx9si0VF; Tue, 24 Aug 2021 21:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFB6740224;
	Tue, 24 Aug 2021 21:53:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F6481BF2A2
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 21:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E7CF42567
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 21:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3RJu7XgldKGI for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 21:53:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44FC040246
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 21:53:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 131DAFF805;
 Tue, 24 Aug 2021 21:53:00 +0000 (UTC)
Date: Tue, 24 Aug 2021 23:53:00 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20210824235300.628afdd5@windsurf>
In-Reply-To: <20210822200519.1757151-1-salvador.joseluis@gmail.com>
References: <20210822200519.1757151-1-salvador.joseluis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/zfs: Fix cross-platform-compilations
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Philippe Serbruyns <Philippe.Serbruyns@ugent.be>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

T24gU3VuLCAyMiBBdWcgMjAyMSAyMjowNToxOSArMDIwMApKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1
Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFRoaXMgcGF0Y2ggZml4
ZXMgdGhlIGBtYWtlYCBleGVjdXRlZCBmcm9tIHRoZSBga2VybmVsLm00YCBpbgo+IGNyb3NzLXBs
YXRmb3JtLWNvbXBpbGF0aW9ucyBlbnZpcm9ubWVudHM6Cj4gaHR0cHM6Ly9naXRodWIuY29tL29w
ZW56ZnMvemZzL2Jsb2IvemZzLTIuMC41L2NvbmZpZy9rZXJuZWwubTQjTDU4OAo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21h
aWwuY29tPgo+IC0tLQo+IEhlbGxvIGFsbC4KClRoYW5rcyBmb3IgeW91ciBjb250cmlidXRpb24u
IEJhc2VkIG9uIHRoZSBmZWVkYmFjayBmcm9tIFJvbWFpbiwgSSBoYXZlCm1hcmtlZCB0aGlzIHBh
dGNoIGFzICJDaGFuZ2VzIFJlcXVlc3RlZCIuCgpCZXN0IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRo
b21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVz
eWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
