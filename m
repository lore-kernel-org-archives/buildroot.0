Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02F3C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4563D4163B;
	Fri, 22 Jul 2022 21:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4563D4163B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lptBbl5jjt6c; Fri, 22 Jul 2022 21:22:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55E234159A;
	Fri, 22 Jul 2022 21:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55E234159A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3630D1BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A68C8176E
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A68C8176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yT-k1ZINnLaa for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:22:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF0D981760
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF0D981760
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:22:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EA1621BF203;
 Fri, 22 Jul 2022 21:22:10 +0000 (UTC)
Date: Fri, 22 Jul 2022 23:22:10 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20220722232210.742df319@windsurf>
In-Reply-To: <20220614164755.716683-1-raphael.melotte@mind.be>
References: <20220614164755.716683-1-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658524931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYzZx5K9/CAOBNRO7AcgCDLrcYbrDaVb88rlKHngIRA=;
 b=CRzFfz0JfmYlm9Io8m4xdqfkTbQwgBCl/VrIF2IGtQSJ5zEV6txO5TGsC4/f9XC36tFijr
 paVyaGuvKM6VPxlMWuDrtFhtLrL+LHWEVdUrbn0U/NkTql3ElEbKDQglbtn250LZMIPYlS
 O13CikrYLYXKVJWniMId4BcOZsAgT3h1jIqYCpg714XKFdHJG6X0Xtjv8D67VkMOyhFOBl
 BfggcskuaoMKnQFxniNEUmgrL3QwmxNHNqzHrGzVwHRIQjEbR4JAndhYHQdsbcAUjv3v16
 HsN2e3ZNvihb5ijPE1k84sbpjRDr5zbmqbWWtUFHFAHYLuxJyVsXwR4jEQjvVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CRzFfz0J
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: add new test for
 python-jmespath
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxNCBKdW4gMjAyMiAxODo0Nzo1MyArMDIwMApSYXBoYcOrbCBNw6lsb3R0ZSA8cmFw
aGFlbC5tZWxvdHRlQG1pbmQuYmU+IHdyb3RlOgoKPiBBZGQgYSBuZXcgcnVkaW1lbnRhcnkgdGVz
dCBpbnNwaXJlZCBieSB0aGUgZXhhbXBsZXMgZnJvbSBqbWVzcGF0aCdzCj4gUkVBRE1FIGZpbGUg
KFsxXSkuCj4gCj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vam1lc3BhdGgvam1lc3BhdGgucHkv
YmxvYi9kZXZlbG9wL1JFQURNRS5yc3QKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6ls
b3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Cj4gLS0tCj4gIC4uLi90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9qbWVzcGF0aC5weSAgfCAgNCArKysrCj4gIC4uLi90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fam1lc3BhdGgucHkgICAgfCAxMiArKysrKysr
KysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2ptZXNw
YXRoLnB5Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X3B5dGhvbl9qbWVzcGF0aC5weQoKVGhhbmtzLCBib3RoIGFwcGxpZWQgdG8gbWFzdGVy
LiBPbiB0aGUgZmlyc3QgcGF0Y2gsIEkgYWxzbyBhZGRlZCB5b3UgdG8KdGhlIERFVkVMT1BFUlMg
ZmlsZSBmb3IgdGhlIG5ldyB0ZXN0IGNhc2UgKHRoYW5rcyBmb3IgYWRkaW5nIGl0ISkuCgpUaG9t
YXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
