Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B928C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 16:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 331F540C2E;
	Tue,  8 Aug 2023 16:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 331F540C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PK_3a998v136; Tue,  8 Aug 2023 16:50:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50A1740C24;
	Tue,  8 Aug 2023 16:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50A1740C24
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E68A41BF5A5
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B223740C1B
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B223740C1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLsfxcNKowv2 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 16:49:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49C1340BF1
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 16:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49C1340BF1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D1FAFF807;
 Tue,  8 Aug 2023 16:49:46 +0000 (UTC)
Date: Tue, 8 Aug 2023 18:49:46 +0200
To: =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez via buildroot <buildroot@buildroot.org>
Message-ID: <20230808184946.6ba9f29b@windsurf>
In-Reply-To: <20230808142427.290337-1-clement.ramirez@bootlin.com>
References: <20230808142427.290337-1-clement.ramirez@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691513387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7Qc36fOypgfdI5fyb3qRDlDHLIN66OU4heG/g1h7CQ=;
 b=Yd6MqIQSPI432GtiPwtAmaXwNnolHy6ckwxk8HX74iltGihUxu0qBvHUPl/HtO+ZwtDTur
 FJC7ciEUPOFoL36yPE9YKlRBhg/vBPZCUZRPss41RziBhqT4K7SGLDXHzzpRVFy74PYfg5
 9kxYIPeW19jCP5JvJrWXJrdhRAgDh/+JTBTnEn2tnBuev+23wDh0JsvfvGX7igze14gu/F
 sM6/22V5VBMBBXlm3jtchHgwFzro1tUkZrXdHEZzW4Ty2GKvg2tbHYGRf6uHydhyW9fxZm
 6OBzRSlFDKwJRvUf/Uck7chtHYpFgr5RbKt0dwYZM7MztryUmJfxHmX8YmB+5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yd6MqIQS
Subject: Re: [Buildroot] [PATCH 1/1] package/aubio: add AUBIO_CPE_ID_VENDOR
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAgOCBBdWcgMjAyMyAxNjoyNDoyNyArMDIwMApDbMOpbWVudCBSYW1pcmV6IHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gY3BlOjIuMzphOmF1
YmlvOmF1YmlvIGlzIGEgdmFsaWQgaWRlbnRpZmllciBmb3IKPiB0aGlzIHBhY2thZ2U6Cj4gaHR0
cHM6Ly9udmQubmlzdC5nb3YvcHJvZHVjdHMvY3BlL3NlYXJjaC9yZXN1bHRzP25hbWluZ0Zvcm1h
dD0yLjMma2V5d29yZD1hdWJpbwo+IAo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFJhbWlyZXog
PGNsZW1lbnQucmFtaXJlekBib290bGluLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9hdWJpby9hdWJp
by5tayB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCkFwcGxpZWQgdG8g
bWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxp
bgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
