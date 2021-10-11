Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F410C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 18:39:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4440360E98
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 18:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4440360E98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E24AF402CB;
	Mon, 11 Oct 2021 18:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I429e3fQDh03; Mon, 11 Oct 2021 18:39:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D5AF402C2;
	Mon, 11 Oct 2021 18:39:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 209B51BF3B9
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 18:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FD65608B9
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 18:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nh3vR_ZDZst4 for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 18:39:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E80BF608B7
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 18:39:53 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 52944C0007;
 Mon, 11 Oct 2021 18:39:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1ma0DF-0000n0-GQ; Mon, 11 Oct 2021 20:39:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
References: <20210907120750.31432-1-raphael.melotte@mind.be>
 <20210907120750.31432-2-raphael.melotte@mind.be>
 <87v92dht9d.fsf@dell.be.48ers.dk>
Date: Mon, 11 Oct 2021 20:39:49 +0200
In-Reply-To: <87v92dht9d.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 04 Oct 2021 14:25:02 +0200")
Message-ID: <87ee8rpfre.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: fix
 building on mips with GCC10
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCj4+Pj4+ICJSYXBoYcOrbCIgPT0gUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVs
b3R0ZUBtaW5kLmJlPiB3cml0ZXM6CiA+PiBQb3J0IHRoZSBmb2xsb3dpbmcgdXBzdHJlYW0gY29t
bWl0OgogPj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcveHNlcnZlci8tL21l
cmdlX3JlcXVlc3RzLzU5MS9kaWZmcz9jb21taXRfaWQ9MDE0OGExNWRhMTYxNmE4NjhkNzFhYmUx
YjU2ZTNmMjhjYzc5NTMzYwoKID4+IFRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyBidWlsZCBlcnJv
ciBvbiBtaXBzIHdpdGggR0NDMTA6CiA+PiBDQ0xEICAgICBsaWJpbnQxMC5sYQogPj4gYnVpbGRy
b290L291dHB1dC9ob3N0L2xpYi9nY2MvbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS8xMC4z
LjAvLi4vLi4vLi4vLi4vbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS9iaW4vbGQ6IC5saWJz
L2hlbHBlcl9tZW0ubzooLmJzcysweDApOiBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIGBJT1BvcnRC
YXNlJzsgLmxpYnMvaGVscGVyX2V4ZWMubzooLmJzcysweDApOiBmaXJzdCBkZWZpbmVkIGhlcmUK
CiA+PiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1p
bmQuYmU+CgogPiBDb21taXR0ZWQgdG8gMjAyMS4wNS54IGFuZCAyMDIxLjA4LngsIHRoYW5rcy4K
CkFuZCAyMDIxLjAyLnguCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
