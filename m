Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842A9C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 16:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A37960F2F;
	Sun, 17 Jul 2022 16:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A37960F2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xm140Q_rmkZm; Sun, 17 Jul 2022 16:47:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2380D60B01;
	Sun, 17 Jul 2022 16:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2380D60B01
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4627E1BF5DC
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 16:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1166831FB
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 16:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1166831FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y7tHyQZH6yys for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 16:47:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BEE5831F2
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BEE5831F2
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 16:47:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9A5A0E0003;
 Sun, 17 Jul 2022 16:47:50 +0000 (UTC)
Date: Sun, 17 Jul 2022 18:47:49 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220717184749.13a817bf@windsurf>
In-Reply-To: <20220717182632.32e8d732@windsurf>
References: <20220713115851.620731-1-thomas.petazzoni@bootlin.com>
 <20220717092020.GF2543@scaer> <20220717182632.32e8d732@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658076471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=063OTAsgBX90s2loBM4MJpkgr27cW6o4LsRRwUBbVFU=;
 b=e5g7jjnvDjV9JtmnylcTYL3hzJJcAYyCv77ZxnT2fF5GIFwU4A09Nlvuc0WrvG3CsPXEmI
 IkZGilAiBbHC8xzC7HLeRB/eKrVHg3VBrwCiVDsMAZt6ds38/P4HZr3n+ScFQ3wIvpYm6f
 z72P6b9gyAZyyOXEAtstBQhuaCptIXpP9l/Sv0bCcWeSmuxhRUrFQxbVix3xjLa5JMAgJ7
 bOSY6VQqR+4iIq98SWAmtAbh62Ov5fYZEapIrPNug7nkYjpkoIOXqf/FYpx0yp1UC8HOu5
 1o+PQFWuhdlo5ulMnX+yzY6ZMCXPKJYER+79L0p5z6kgxTcxi+QzdzutBgOwWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e5g7jjnv
Subject: Re: [Buildroot] [PATCH] package/python-pillow: fix host package
 build
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
Cc: kory.maincent@bootlin.com,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAxNyBKdWwgMjAyMiAxODoyNjozMiArMDIwMApUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gVGhhdCBiZWluZyBzYWlkLCBncmVw
cGluZyB0aHJvdWdoIHRoZSBvcHRlZV9vcyBjb2RlIGZyb20gU1QsIEkgbm8KPiBsb25nZXIgc2Vl
IHdoZXJlIHB5dGhvbi1waWxsb3cgaXMgdXNlZC4gSSd2ZSBzdGFydGVkIGEgdGVzdCBidWlsZCB0
bwo+IGNoZWNrIHRoaXMgKGJ1dCBJJ20gcHJldHR5IHN1cmUgaXQgd2FzIG5lZWRlZCBhdCBzb21l
IHBvaW50LCBhcyBJCj4gbG9va2VkIGludG8gdGhpcyB3aXRoIEvDtnJ5KS4KClNlZW1zIGxpa2Ug
dGhpcyB3aG9sZSBweXRob24tcGlsbG93IGRhbmNlIGlzIGluIGZhY3Qgbm8gbG9uZ2VyCm5lZWRl
ZC4uLiBhdCBsZWFzdCBJIGNhbiBidWlsZCB0aGUgbGF0ZXN0IE9QVEVFLU9TIGZyb20gU1Qgd2l0
aG91dApob3N0LXB5dGhvbi1waWxsb3cgaW5zdGFsbGVkIChpbiBhIGNsZWFuLCBtaW5pbWFsIFVi
dW50dSBEb2NrZXIKY29udGFpbmVyKS4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28t
b3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
