Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3943BC77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 20:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91DBB82034;
	Mon,  5 Jun 2023 20:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91DBB82034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGiXtHPdZ-No; Mon,  5 Jun 2023 20:04:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4C3082031;
	Mon,  5 Jun 2023 20:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4C3082031
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6701BF400
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FE9C4155B
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FE9C4155B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ll8V6yDQQEJa for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 20:04:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0DC741558
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0DC741558
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 20:04:02 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13DA9240003;
 Mon,  5 Jun 2023 20:03:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q6GQn-00DoMu-8V; Mon, 05 Jun 2023 22:03:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
References: <20230429124731.4014394-1-j.neuschaefer@gmx.net>
Date: Mon, 05 Jun 2023 22:03:57 +0200
In-Reply-To: <20230429124731.4014394-1-j.neuschaefer@gmx.net> ("Jonathan
 =?utf-8?Q?Neusch=C3=A4fer=22's?= message of "Sat, 29 Apr 2023 14:47:31
 +0200")
Message-ID: <87v8g165hu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/micropython: pass $TARGET_LDFLAGS
 to build
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkpvbmF0aGFuIiA9PSBKb25hdGhhbiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBn
bXgubmV0PiB3cml0ZXM6CgogPiBMREZMQUdTIG5lZWQgdG8gYmUgcGFzc2VkIHRvIHRoZSBtaWNy
b3B5dGhvbiBidWlsZCBzeXN0ZW0gdmlhIHRoZQogPiBMREZMQUdTX0VYVFJBIHZhcmlhYmxlLCB3
aGljaCB3YXMgc28gZmFyIG1pc3NpbmcuIFRoaXMgcGF0Y2ggYWRkcyBpdC4KCiA+IFNpZ25lZC1v
ZmYtYnk6IEpvbmF0aGFuIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+CgpDb21t
aXR0ZWQgdG8gMjAyMy4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
