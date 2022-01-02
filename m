Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52BAC433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 22:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AC044024F;
	Sun,  2 Jan 2022 22:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFpYph-rShy2; Sun,  2 Jan 2022 22:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8BB640242;
	Sun,  2 Jan 2022 22:05:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB5DF1BF3BF
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 22:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C806D4019E
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 22:05:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hsd1rpVqvKFE for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 22:05:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF0B440165
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 22:05:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (15)
Received: from zm (pub-91.183.29.194.multiplay.pl [194.29.183.91])
 by server220076.nazwa.pl (Postfix) with ESMTP id 678C31C60DE;
 Sun,  2 Jan 2022 23:05:41 +0100 (CET)
References: <20220101193018.404937-1-james.hilliard1@gmail.com>
 <20220101193018.404937-3-james.hilliard1@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Jan 2022 23:05:17 +0100
In-reply-to: <20220101193018.404937-3-james.hilliard1@gmail.com>
Message-ID: <87a6gdhjyi.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5] package/python-packaging: enable host
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
Cc: Asaf Kahlon <asafka7@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cml0ZXM6Cgo+IFRo
aXMgaXMgcmVxdWlyZWQgYnkgcHl0aG9uLXNldHVwdG9vbHMtc2NtLgo+Cj4gU2lnbmVkLW9mZi1i
eTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4gIHBh
Y2thZ2UvcHl0aG9uLXBhY2thZ2luZy9weXRob24tcGFja2FnaW5nLm1rIHwgMyArKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0
aG9uLXBhY2thZ2luZy9weXRob24tcGFja2FnaW5nLm1rIGIvcGFja2FnZS9weXRob24tcGFja2Fn
aW5nL3B5dGhvbi1wYWNrYWdpbmcubWsKPiBpbmRleCA2YjU0ZDI0MTZkLi5lMmZiOWIxMjBiIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXBhY2thZ2luZy9weXRob24tcGFja2FnaW5nLm1r
Cj4gKysrIGIvcGFja2FnZS9weXRob24tcGFja2FnaW5nL3B5dGhvbi1wYWNrYWdpbmcubWsKPiBA
QCAtMTAsNSArMTAsOCBAQCBQWVRIT05fUEFDS0FHSU5HX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZGYvODYvYWVmNzhiYWIzYQo+ICBQWVRIT05fUEFDS0FH
SU5HX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4gIFBZVEhPTl9QQUNLQUdJTkdfTElDRU5TRSA9
IEFwYWNoZS0yLjAgb3IgQlNELTItQ2xhdXNlCj4gIFBZVEhPTl9QQUNLQUdJTkdfTElDRU5TRV9G
SUxFUyA9IExJQ0VOU0UgTElDRU5TRS5BUEFDSEUgTElDRU5TRS5CU0QKPiArSE9TVF9QWVRIT05f
UEFDS0FHSU5HX05FRURTX0hPU1RfUFlUSE9OID0gcHl0aG9uMwo+ICtIT1NUX1BZVEhPTl9QQUNL
QUdJTkdfREVQRU5ERU5DSUVTID0gaG9zdC1weXRob24tcHlwYXJzaW5nCj4KPiAgJChldmFsICQo
cHl0aG9uLXBhY2thZ2UpKQo+ICskKGV2YWwgJChob3N0LXB5dGhvbi1wYWNrYWdlKSkKClJldmll
d2VkLWJ5OiBNYXJjaW4gTmllc3Ryb2ogPG0ubmllc3Ryb2pAZ3Jpbm4tZ2xvYmFsLmNvbT4KCi0t
Ck1hcmNpbiBOaWVzdHLDs2oKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
