Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1817DC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2F1581462;
	Sun, 13 Nov 2022 21:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2F1581462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6r-zrxy6lCLK; Sun, 13 Nov 2022 21:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 098468145D;
	Sun, 13 Nov 2022 21:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 098468145D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0816C1BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7A6D60BEA
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7A6D60BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WuFtR6uOwQwr for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:55:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B152E60BDD
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B152E60BDD
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:55:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 82227FF803;
 Sun, 13 Nov 2022 21:55:35 +0000 (UTC)
Date: Sun, 13 Nov 2022 22:55:34 +0100
To: "=?UTF-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LI=?= (Leonid Yuriev)"
 <leo@yuriev.ru>
Message-ID: <20221113225534.0d225fab@windsurf>
In-Reply-To: <20221110111109.99724-1-leo@yuriev.ru>
References: <20221110111109.99724-1-leo@yuriev.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668376535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVYGrLMvIUoyA0oWxKbVrRuxwj87WSov/SJvjwS7ewc=;
 b=JN6cJl9jFIjl0mEay6moehHklWEovKaDfNdoVlRIH8O+7OqqRLWUOBSm0XB/YmUkzO/bUt
 gv/ay3HVL5+9tLrvDpgvL9iSMF5ok55LDOhd7uvsQHAfF1StWdgmtdiKVggiB0/5aoE51+
 Svb0nP4sk64hQmdLWLOwdpEwnaliE76UJn5jK7N310JbQ24pwP0LwyvYKbSwRRodwCHUa/
 r5tIoPpo6Dgonh1NiJImES3fh4fioCrdapytQAd1GMM7a1s3+0Z9pXCl6w7bB2G26a6K6O
 fUt6kMqBylG1cyF3YXPiBrP0Dv9ZraHdGAikfFLfnA6wKzWwsU5husEeexFatw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JN6cJl9j
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.13
 "Swashplate"
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxMCBOb3YgMjAyMiAxNDoxMTowOCArMDMwMArQm9C10L7QvdC40LQg0K7RgNGM0LXQ
siAoTGVvbmlkIFl1cmlldikgPGxlb0B5dXJpZXYucnU+IHdyb3RlOgoKPiBUaGlzIGlzIHN0YWJs
ZSBidWdmaXggcmVsZWFzZSBvZiBsaWJtZGJ4LCBpbiBGYW1pbHkgR2xvcnkgYW5kCj4gaW4gbWVt
b3J5IG9mIEJvcmlzIFl1cmlldiAodGhlIGludmVudG9yIG9mIEhlbGljb3B0ZXIgYW5kCj4gU3dh
c2hwbGF0ZSBpbiAxOTExKSBvbiBoaXMgMTMzcmQgYmlydGhkYXkuCj4gCj4gSXQgaXMgcmVhc29u
YWJsZSB0byBiYWNrcG9ydCB0aGlzIHBhdGNoIHRvIGFsbCBhcHBsaWNhYmxlIHJlbGVhc2VzL2Jy
YW5jaGVzIG9mIEJ1aWxkcm9vdC4KPiAKPiBSZWxlYXNlIG5vdGVzIGZvciB2MC4xMS4xMwo+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpBcHBsaWVkIHRvIG5leHQsIHRoYW5rcy4KClRob21h
cwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
