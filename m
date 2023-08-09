Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04458C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96BEC41B6B;
	Wed,  9 Aug 2023 17:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96BEC41B6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hVdEY-2KkYdv; Wed,  9 Aug 2023 17:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C5FF41B4A;
	Wed,  9 Aug 2023 17:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C5FF41B4A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C6541BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1484E40614
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1484E40614
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5QuwFsTuHizR for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:40:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 212A740525
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 212A740525
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E9CF240006;
 Wed,  9 Aug 2023 17:40:30 +0000 (UTC)
Date: Wed, 9 Aug 2023 19:40:29 +0200
To: =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez via buildroot <buildroot@buildroot.org>
Message-ID: <20230809194029.4c1acc82@windsurf>
In-Reply-To: <20230809093237.326383-1-clement.ramirez@bootlin.com>
References: <20230809093237.326383-1-clement.ramirez@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691602830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ge+eWKP0hKaFDu+xgRUHGGLlpzCvTVMTc7VaX42hvbU=;
 b=InRCm7+44KGORXj5xKw81iVAuuXCZJlF5k9h9uxA91MY2znglZpRqb3e2A6VvCkdr0zMqt
 ic4jBbBQwFOxgmprWyW/NX9cXhOLpPi+kTXQMBmS4009awhDwBJZAnqyUDTdP2YUkpJbHu
 O3qqMpl93fGa1yq6QxUx187ouvCjCYnEwnPOjJA+w2ZbTAYiLIBBkemJLBebNNF31jYMLd
 AijrW5HyE+HY+1fZT2k89FDftJ2S48vEy+Dku3gWaV4hev2Udx1LyVCVRIVSksp9ztbshh
 lNaiMiyDXDkqMpU2ZBgB0iZAJwH7T3pfEYVjrH4WayMcvWqgHVF70IvnPKECxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=InRCm7+4
Subject: Re: [Buildroot] [PATCH 1/1] package/flite: add FLITE_CPE_ID_VENDOR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAgOSBBdWcgMjAyMyAxMTozMjozNyArMDIwMApDbMOpbWVudCBSYW1pcmV6IHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gY3BlOjIuMzphOmNt
dTpmbGl0ZSBpcyBhIHZhbGlkIGlkZW50aWZpZXIgZm9yCj4gdGhpcyBwYWNrYWdlOgo+IGh0dHBz
Oi8vbnZkLm5pc3QuZ292L3Byb2R1Y3RzL2NwZS9zZWFyY2gvcmVzdWx0cz9uYW1pbmdGb3JtYXQ9
Mi4zJmtleXdvcmQ9ZmxpdGUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBSYW1pcmV6IDxj
bGVtZW50LnJhbWlyZXpAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvZmxpdGUvZmxpdGUu
bWsgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpBcHBsaWVkIHRvIG1h
c3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
