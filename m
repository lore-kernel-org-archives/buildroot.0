Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B41C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 08:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E04E83313;
	Mon, 14 Mar 2022 08:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3G4GnZYzwBxQ; Mon, 14 Mar 2022 08:39:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84915829EE;
	Mon, 14 Mar 2022 08:39:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D48E1BF38C
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 08:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 639744092C
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 08:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4SWwuqeLrQL for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 08:39:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DE1740761
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 08:39:52 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C8997FF802;
 Mon, 14 Mar 2022 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647247190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6bcNsPVjSSoPT9Y8HnsvNVnO6iS1hwiR5P9wXJniTM=;
 b=Pq0vE9Wnywz7/XBNGMLAhQ7L2HUv7czo6GwewAS3reZA1DnQ3g1V77KVTP/Sv2BYajDN9u
 e+gv+fvrQqQ7jADHhRrFwiQ97QYhvuzeDuxjuWgW8SgyBqOGYrLbRH2ga8adIsUjEryo/K
 92qT6U8HvS8Y2eG8D/c2VIYxgc8Pb4m7obZ6ZgU3nhep+4Wqr3joFjLVQtkIG1fxwi3U+9
 d32EO/XjZubSNophqhowcv0FYtEIrAdzIgzw5r4mF+dQONZ1c0Isoa8XhwstmOJwdZrHVo
 nfzpz/pbCENnsyj8knN6Ew8GoICWvAhuQ1F691I1m2Q63tLdlpa58VRsaT/4CQ==
Date: Mon, 14 Mar 2022 09:38:26 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220314093826.5a30c765@fixe.home>
In-Reply-To: <20220311214332.4405ad89@windsurf>
References: <20220311123636.13415-1-clement.leger@bootlin.com>
 <20220311123636.13415-2-clement.leger@bootlin.com>
 <20220311214332.4405ad89@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/7] package/python-cryptography: enable
 host package
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
From: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgRnJpLCAxMSBNYXIgMjAyMiAyMTo0MzozMiArMDEwMCwKVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4gYSDDqWNyaXQgOgoKPiBIZWxsbyBDbMOpbWVudCwK
PiAKPiBPbiBGcmksIDExIE1hciAyMDIyIDEzOjM2OjMwICswMTAwCj4gQ2zDqW1lbnQgTMOpZ2Vy
IDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPiB3cm90ZToKPiAKPiA+ICtIT1NUX1BZVEhPTl9D
UllQVE9HUkFQSFlfREVQRU5ERU5DSUVTID0gXAo+ID4gKwlob3N0LXB5dGhvbi1zZXR1cHRvb2xz
LXJ1c3QgXAo+ID4gKwlob3N0LXB5dGhvbi1jZmZpIFwKPiA+ICsJaG9zdC1ydXN0YyBcCj4gPiAr
CW9wZW5zc2wgIAo+IAo+IFRoaXMgb3BlbnNzbCBkZXBlbmRlbmN5IHNlZW1zIGV4dHJlbWVseSBk
dWJpb3VzLiBXaHkgd291bGQgYSBob3N0Cj4gcGFja2FnZSBkZXBlbmQgb24gdGhlIHRhcmdldCB2
YXJpYW50IG9mIG9wZW5zc2w/CgpZZXMsIG9mIGNvdXJzZSB0aGF0IGlzIGEgaG9zdC1vcGVuc3Ns
IGRlcGVuZGVuY3kgdGhhdCBpcyBuZWVkZWQuCgo+IAo+ID4gIFBZVEhPTl9DUllQVE9HUkFQSFlf
RU5WID0gXAo+ID4gIAkkKFBLR19DQVJHT19FTlYpIFwKPiA+ICAJUFlPM19DUk9TU19MSUJfRElS
PSIkKFNUQUdJTkdfRElSKS91c3IvbGliL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKSIK
PiA+IEBAIC0yNyw0ICszMiw2IEBAIFBZVEhPTl9DUllQVE9HUkFQSFlfRExfRU5WID0gXAo+ID4g
IAkkKFBLR19DQVJHT19FTlYpIFwKPiA+ICAJQlJfQ0FSR09fTUFOSUZFU1RfUEFUSD1zcmMvcnVz
dC9DYXJnby50b21sCj4gPiAgCj4gPiArICAKPiAKPiBTcHVyaW91cyBuZXdsaW5lIGFkZGVkLgo+
IAo+ID4gICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKPiA+ICskKGV2YWwgJChob3N0LXB5dGhv
bi1wYWNrYWdlKSkgIAo+IAo+IFRob21hcwoKCgotLSAKQ2zDqW1lbnQgTMOpZ2VyLApFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyIGF0IEJvb3RsaW4KaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
