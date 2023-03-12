Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AEBC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C548606F2;
	Sun, 12 Mar 2023 09:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C548606F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddLClaMrrE69; Sun, 12 Mar 2023 09:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF427605F6;
	Sun, 12 Mar 2023 09:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF427605F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 457D51BF3C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EF10818D7
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EF10818D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PxtpI1UqsCug for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:07:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4090818C9
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4090818C9
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:07:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0392CE0003;
 Sun, 12 Mar 2023 09:07:39 +0000 (UTC)
Date: Sun, 12 Mar 2023 10:07:39 +0100
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= via buildroot <buildroot@buildroot.org>
Message-ID: <20230312100739.73a5714a@windsurf>
In-Reply-To: <20230306211646.3717-1-vincent.stehle@laposte.net>
References: <20230306211646.3717-1-vincent.stehle@laposte.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678612060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yfv+sw9ne75I61pJlT1n7iW2GCjzDhisJrbo+X4Cl7U=;
 b=ZxnWKNlsLgIgjgcyJvYPSdK2Int2Lqgmwoy5VutfxSWtuUXG0Ca6XxIdClnyWnRpYVU256
 ExTiqwdYTGKNiBje2E0F45VJp5fiZjGo5t9y1VlWvT0AFUWx0HCOTVp8vHmYCw9syKwTDM
 5aqKZQULj5xtTjkAj0bp3XshhwlD49b1sY1jkqzzKkgOlSfeWr4mnq4nCF0xxOEICDPXcC
 pGZaQhbX6up932uGUO4A//pD65ZVyndl1UtuLOYmkEgvE00vROHDZGoW96cozjKvWkwbk/
 Xxp2cyS40cqK0De2g7wSD49/0kPHYSGYLtoUZ8NSAUpNvuPgfADl6npXfVbOaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZxnWKNls
Subject: Re: [Buildroot] [PATCH next] package/openfpgaloader: fix typos
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
Cc: Jean Burgat <jeanburgat33@gmail.com>,
 Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAgNiBNYXIgMjAyMyAyMjoxNjo0NiArMDEwMApWaW5jZW50IFN0ZWhsw6kgdmlhIGJ1
aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBGaXggYSB0eXBvIGlu
IHRoZSBuYW1lIG9mIHR3byBjb25maWd1cmF0aW9uIG9wdGlvbnMuCj4gVGhpcyByZXBhaXJzIHRo
ZSBzZWxlY3Rpb24gb2YgbGliZ3Bpb2Qgc3VwcG9ydC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5j
ZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0Pgo+IENjOiBKZWFuIEJ1cmdh
dCA8amVhbmJ1cmdhdDMzQGdtYWlsLmNvbT4KPiAtLS0KCkFwcGxpZWQgdG8gbmV4dCwgYWZ0ZXIg
YWRkaW5nIENvbmZpZy5pbi5sZWdhY3kgaGFuZGxpbmcgZm9yCkJSMl9QQUNBS0dFX09QRU5GUEdB
TE9BREVSX0NNU0lTLiBJbmRlZWQgdGhpcyBvcHRpb24gd2FzIGFscmVhZHkgdGhlcmUsCmFuZCB3
ZSBkb24ndCB3YW50IHRvIGJyZWFrIHNpbGVudGx5IGV4aXN0aW5nIGNvbmZpZ3VyYXRpb25zLgoK
QmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
