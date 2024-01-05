Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA84C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE973436D6;
	Fri,  5 Jan 2024 12:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE973436D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6UmzBV27ES-A; Fri,  5 Jan 2024 12:41:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 265F2401ED;
	Fri,  5 Jan 2024 12:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 265F2401ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4118E1BF385
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2839761486
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2839761486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pCGM25tlJz6I for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:41:42 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2990760EF1
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2990760EF1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5535240007;
 Fri,  5 Jan 2024 12:41:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rLjW6-006548-1k;
 Fri, 05 Jan 2024 13:41:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ralf Dragon <hypnotoad@lindra.de>
References: <20231212160112.94272-1-hypnotoad@lindra.de>
Date: Fri, 05 Jan 2024 13:41:38 +0100
In-Reply-To: <20231212160112.94272-1-hypnotoad@lindra.de> (Ralf Dragon's
 message of "Tue, 12 Dec 2023 17:01:11 +0100")
Message-ID: <87bka02br1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] python-sip: fix compile error
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
Cc: gwenhael.goavec-merou@trabucayre.com, yann.morin.1998@free.fr,
 asafka7@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJhbGYiID09IFJhbGYgRHJhZ29uIDxoeXBub3RvYWRAbGluZHJhLmRlPiB3cml0ZXM6
CgogPiBXaXRob3V0IHRoZSBwYXRjaCwgcHl0aG9uLXNpcCBmYWlscyB0byBjb21waWxlIHdpdGg6
CiA+IHNpcGxpYi5jOiBJbiBmdW5jdGlvbiDigJhzaXBfYXBpX2dldF9mcmFtZeKAmToKID4gc2lw
bGliLmM6MTM3NTA6MjI6IGVycm9yOiBpbnZhbGlkIHVzZSBvZiB1bmRlZmluZWQgdHlwZSDigJhz
dHJ1Y3QgX2ZyYW1l4oCZCiA+IDEzNzUwIHwgICAgICAgICBmcmFtZSA9IGZyYW1lLT5mX2JhY2s7
CgogPiBUaGlzIGxpa2VseSBmaXhlcyBidWcgMTUyMDEgWzFdLgoKCgogPiBbMV0gaHR0cHM6Ly9i
dWdzLmJ1aWxkcm9vdC5vcmcvc2hvd19idWcuY2dpP2lkPTE1MjAxCgoKID4gU2lnbmVkLW9mZi1i
eTogUmFsZiBEcmFnb24gPGh5cG5vdG9hZEBsaW5kcmEuZGU+CiA+IC0tLQogPiBCYWNrcG9ydCB0
bzogMjAyMy4wMi54CgpDb21taXR0ZWQgdG8gMjAyMy4wMi54IGFuZCAyMDIzLjExLngsIHRoYW5r
cy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
