Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB21C07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1F5260F6B;
	Fri, 23 Sep 2022 21:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1F5260F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7bmvNiHggEYx; Fri, 23 Sep 2022 21:46:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFFEC60BFA;
	Fri, 23 Sep 2022 21:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFFEC60BFA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A97721BF82C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84CD84023B
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84CD84023B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4VRKF5rMz4z for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:46:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81A484013B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81A484013B
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:46:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CEC91E0003;
 Fri, 23 Sep 2022 21:46:46 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:46:46 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Ignacy =?UTF-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Message-ID: <20220923234646.79302902@windsurf>
In-Reply-To: <20220922133430.l6graemwo6jg2gf5@zenon.in.qult.net>
References: <20220922133430.l6graemwo6jg2gf5@zenon.in.qult.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663969607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMTB5IAFEsbX4xZKdj23Daq5xBiRBwm7bQJxlGlLdIc=;
 b=V03Dj0voMvXmYU5yn9ChvhFSsXpSeM8WlmNV6neLYynM1EGOD9US4ncU0kS3HnOuQKIoNy
 U2brKE7Hi9w84H1Ylv3qQ4JSWvupJgsbblA+m0r/JWsJJMu2dF59Z6VlNIH3O93qYCZMV9
 srxtUaM9TsdgQwpiY4q9wDwN8r8wh9IONEIx3lrW0qmos42gM4k2ZkNmX6iqTU/rV3EUdw
 RjDv809erHpMOX6QnCp5Cu1lRxSEr4roMdtG2l7CP7P15MRsExCMTTU7P0F3QZcEoXaz1e
 roO+OnA1d0rJ326jKzxva9Q9Ac+a7yZ9YsXlDFJHmkqQ0da7uV/Uhv5Q8P7/rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V03Dj0vo
Subject: Re: [Buildroot] [PATCH v4] package/chartjs: bump to version 3.9.1
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

T24gVGh1LCAyMiBTZXAgMjAyMiAxNTozNDozMCArMDIwMApJZ25hY3kgR2F3xJlkemtpIDxpZ25h
Y3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+IHdyb3RlOgoKPiBodHRwczovL2dp
dGh1Yi5jb20vY2hhcnRqcy9DaGFydC5qcy9yZWxlYXNlcy90YWcvdjMuOS4xCj4gCj4gTGljZW5z
ZSBmaWxlIGhhcyB1cGRhdGVkIGNvcHlyaWdodCB5ZWFycyB0byAyMDE0LTIwMjIuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSWduYWN5IEdhd8SZZHpraSA8aWduYWN5Lmdhd2VkemtpQGdyZWVuLWNvbW11
bmljYXRpb25zLmZyPgo+IC0tLQo+ICBwYWNrYWdlL2NoYXJ0anMvY2hhcnRqcy5oYXNoIHwgNCAr
Ky0tCj4gIHBhY2thZ2UvY2hhcnRqcy9jaGFydGpzLm1rICAgfCA1ICsrKy0tCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKQXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
