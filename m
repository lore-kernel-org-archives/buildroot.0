Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B52C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 13:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5636C812B9;
	Fri, 10 Feb 2023 13:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5636C812B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 51hsGEHP1p0M; Fri, 10 Feb 2023 13:01:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A162A8125E;
	Fri, 10 Feb 2023 13:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A162A8125E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19E451BF370
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 13:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7DB660D60
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 13:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7DB660D60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Q0WKUEoBvnf for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 13:01:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 381F160BFF
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 381F160BFF
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 13:01:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id DC5C51814B9; Fri, 10 Feb 2023 14:01:35 +0100 (CET)
In-Reply-To: <VI1P190MB0493E0638601CE340D4AEA9C9FDE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Date: Fri, 10 Feb 2023 14:01:35 +0100
To: "Lang Daniel" <d.lang@abatec.at>
MIME-Version: 1.0
Message-ID: <42-63e64000-3-6e1e6e80@264880303>
User-Agent: SOGoMail 5.8.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1676034097; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=lk+FiekS6/z8hS34j0gfbTpQgQGQta6JtqQ0EwrwdlE=;
 b=JTeke7mJk7/cnN2fIc8owQGthiwcutZ2B6SDbMh1ZVzcFXv3GB2llFCDjlDxppvkuP+JPh
 b4Xq+W1bLiE6g+8HhmHZyaNdC+QFF9e1t5SMSOH50RrUfrx9Im1jTXQVQYiynoic+i2HVw
 4ufhUaOkaQh6dpkoJRLkXsaBjJ4iEnc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=JTeke7mJ
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/boost=3A_bump_to_versi?=
 =?utf-8?b?b24gMS44MS4w?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: =?utf-8?q?buildroot=40buildroot=2Eorg?= <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFuaWVsLAoKT24gRnJpZGF5LCBGZWJydWFyeSAxMCwgMjAyMyAxMzoyOCBDRVQsIExhbmcg
RGFuaWVsIDxkLmxhbmdAYWJhdGVjLmF0PiB3cm90ZToKCj4gSGkgTWljaGFlbCwKCj4gPiDCoEJP
T1NUX1dJVEhPVVRfRkxBR1MgKz0gJChpZiAkKEJSMl9QQUNLQUdFX0JPT1NUX1RZUEVfRVJBU1VS
RSksLHR5cGVfZXJhc3VyZSkKPiA+ICtCT09TVF9XSVRIT1VUX0ZMQUdTICs9ICQoaWYgJChCUjJf
UEFDS0FHRV9CT09TVF9UWVBFX0VSQVNVUkUpLCx1cmwpCj4gCj4gSSB0aGluayB0aGlzIGxpbmUg
aXMgc3VwcG9zZWQgdG8gYmUKPiAKPiBCT09TVF9XSVRIT1VUX0ZMQUdTICs9ICQoaWYgJChCUjJf
UEFDS0FHRV9CT09TVF9VUkwpLCx1cmwpCgp5aWtlcywgeW91IGFyZSByaWdodC4gbW92ZWQgdGhp
cyBwYXRjaCBmcm9tIGEgZGlmZmVyZW50IHN5c3RlbSBhbmQgc29tZWhvdyBmb3Jnb3QgdGhpcyBz
dHJpbmcuCnRoYW5rcyBmb3IgZmluZGluZyEKCkknbGwgcmVzdWJtaXQuCgpSZWdhcmRzLApNaWNo
YWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
