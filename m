Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1D4C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F22A660E6F;
	Sat, 23 Jul 2022 17:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F22A660E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0PAyjS6RGJIS; Sat, 23 Jul 2022 17:49:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 155C760D61;
	Sat, 23 Jul 2022 17:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 155C760D61
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF2031BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A94734049F
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A94734049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1g4KLMxs3opW for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:49:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24B6040A06
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24B6040A06
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:49:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2E0E21C0002;
 Sat, 23 Jul 2022 17:49:43 +0000 (UTC)
Date: Sat, 23 Jul 2022 19:49:42 +0200
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen via buildroot <buildroot@buildroot.org>
Message-ID: <20220723194942.580c859f@windsurf>
In-Reply-To: <20220621090148.3326277-1-jose.pekkarinen@unikie.com>
References: <20220621090148.3326277-1-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658598583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xtmzYc06q9+KaxdftInpoxKnJqE9OB7pBmMUi22eNRQ=;
 b=Ta/k1aCgCpRNNssKTWYYZoLTnwPS4+8pLP7hENiyxWlN0dfNuzqXOdo6A+rPP+uZw/CagS
 Fd19YFeLKwNX96mWfwkpRBzQ2tEAbAMMbyfk2IO4ffJWRUCUIvd+sWEdvQFsZ+2SMntrlD
 67O2FfJviZzWDeZcd/ffFcMT/+LMnTKCYliW5fXASQksKRlFLnwp+Yp45UqamUcFbKCxbI
 f6c7ppc5j7WQHOzH9WqSNF+VlfwdfRMwxl5zrS/mIY8pNVTazThXJL0ff+fHA8oF1VmDPx
 zTqYiH6b9ZitGpxCGEOqnxrB9S4PYoMJI045EtcfJAUjWkxmWJF2q4u3peJscA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ta/k1aCg
Subject: Re: [Buildroot] [PATCH] package/python-lark: new package
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
Cc: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMSBKdW4gMjAyMiAxMjowMTo0OCArMDMwMApKb3PDqSBQZWtrYXJpbmVuIHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gU2lnbmVkLW9mZi1i
eTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Cj4gLS0tCj4g
IERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9D
b25maWcuaW4gICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL3B5dGhvbi1sYXJr
L0NvbmZpZy5pbiAgICAgICAgfCAgNyArKysrKysrCj4gIHBhY2thZ2UvcHl0aG9uLWxhcmsvcHl0
aG9uLWxhcmsuaGFzaCB8ICA1ICsrKysrCj4gIHBhY2thZ2UvcHl0aG9uLWxhcmsvcHl0aG9uLWxh
cmsubWsgICB8IDE0ICsrKysrKysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0
aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tbGFyay9Db25maWcu
aW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWxhcmsvcHl0aG9uLWxhcmsu
aGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tbGFyay9weXRob24tbGFy
ay5tawoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6
em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcK
aHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
