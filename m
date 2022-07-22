Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9D4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9DA44239F;
	Fri, 22 Jul 2022 21:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9DA44239F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdSY3QmXP-BY; Fri, 22 Jul 2022 21:18:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B927542384;
	Fri, 22 Jul 2022 21:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B927542384
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 598051BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25ADB84180
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25ADB84180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9n4aTUjsVe5A for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:18:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1C9883F28
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1C9883F28
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:18:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3BECE60002;
 Fri, 22 Jul 2022 21:18:09 +0000 (UTC)
Date: Fri, 22 Jul 2022 23:18:08 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20220722231808.63a74eab@windsurf>
In-Reply-To: <20220614124020.710305-1-raphael.melotte@mind.be>
References: <20220614124020.710305-1-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658524689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GqYArZtqIuCnAmob5vPF5K290stR5m32MmczXVLCVag=;
 b=f94sOZet8x+Dz9vQiyrQwNmEqazpkh2yyYluGsS8uZX+8/fkNa+ajcsKgXGjqXZqEeGyfs
 JsldwoMbCNsS598NO1JMriRG3kGbKEbCfjYr+BS8z0zCtlrqz6Lu9O68hiybwi6jcJDGLu
 qXV3U4irKpnsCoXKNBFiXafLmpLeVqndhpNqJzLRUauBipm3dbTAqkv9/Tinl8KhjBN6Gi
 17PJU8ZYWYN6BJFz3fOJBD3FLHhhGtwVaDeDQAkXkXfGMI6kRKjjnyhVe+2v3dywvdFWJ2
 UnhYnMaqmBxQhySXnKI4AdnddJh8lcVJ9Bk5LhwmMohHnUhQjj/hiav17ZjhZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f94sOZet
Subject: Re: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.24.8
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxNCBKdW4gMjAyMiAxNDo0MDoxOCArMDIwMApSYXBoYcOrbCBNw6lsb3R0ZSA8cmFw
aGFlbC5tZWxvdHRlQG1pbmQuYmU+IHdyb3RlOgoKPiBDaGFuZ2Vsb2c6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9ib3RvL2JvdG8zL2Jsb2IvbWFzdGVyL0NIQU5HRUxPRy5yc3QKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Cj4gLS0tCj4g
IHBhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1ib3RvMy5oYXNoIHwgMiArLQo+ICBwYWNrYWdl
L3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMubWsgICB8IDQgKystLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCkFwcGxpZWQgdG8gbWFzdGVyLCB0
aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
