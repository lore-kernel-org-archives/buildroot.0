Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E15CCA473
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 15:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40CD961174;
	Wed,  1 Jun 2022 15:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unnXvhACE8VQ; Wed,  1 Jun 2022 15:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5526B61159;
	Wed,  1 Jun 2022 15:43:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C26AE1BF588
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 15:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF91C8301F
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 15:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59unhX1aEpCt for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 15:43:46 +0000 (UTC)
X-Greylist: delayed 00:09:26 by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57071831A7
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 15:43:45 +0000 (UTC)
Received: from [IPV6:2a01:e0a:947:6e20:7466:2a8:2ae3:8165] (unknown
 [IPv6:2a01:e0a:947:6e20:7466:2a8:2ae3:8165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 4D28DBFB5C;
 Wed,  1 Jun 2022 17:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1654097654;
 bh=rVKHrHMTanGG3srALY5xIsStnHw8CkgUeOBsgoE9yiA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=CZAjf1TErmAS+1i/24oVN9ZwVO2qaLRQIJ2VQwtV2pGP26BanARZ7PwKr9g/W6oeE
 WjkmAQrdugqih/Z+UR/T9pZRJDs2fFSA+mu1DgFi0arxOVA4bYWI5OwqyjCJgUk/bT
 ZgBAaeH3VnjYa09riEj38O7GaeMl8gbLFCIgB5yLuRdptjVRJqsXvMwMMSBK+kqX2D
 EpvCkM79nVuudsZNlw9/4NJIP9aiBp6V5XPTHNrNCbJ8wvCLmTcFcYbCW+5/jsLU10
 ABnuBYJBmBC5FJ9p2dy2OImqZxhnOmzK98aSBKfjA5ZXTvrMNGtVpyPk9/VHMQ2Vq5
 txUNm6jvoeKUw==
Message-ID: <190ba0a2-91ea-eac6-cd31-4a80b2f3e510@grenoble.cnrs.fr>
Date: Wed, 1 Jun 2022 17:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: "ewrwcwpw@gmail.com" <ewrwcwpw@gmail.com>, buildroot@buildroot.org
References: <CAO6u9=UUrqNx3bWidqidNZXuNoCb2qWQCAaQ6wPzxeY2NjGCvA@mail.gmail.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CAO6u9=UUrqNx3bWidqidNZXuNoCb2qWQCAaQ6wPzxeY2NjGCvA@mail.gmail.com>
Subject: Re: [Buildroot] RE i386 support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpld3J3Y3dwdyB3cm90ZToKPiBTbyB3aGF0IGltcGFjdCBkb2VzIHJlbW92aW5nIHN1
cHBvcnQgZm9yIGkzODYgaGF2ZSBmb3IgY29tcGlsaW5nIGEKPiBkaXN0cm8/CgpCdWlsZHJvb3Qg
ZG9lcyBub3Qgc3VwcG9ydCB0aGUgSW50ZWwgODAzODYgQ1BVIGFueW1vcmUgKHllcywgdGhhdCBj
aGlwCmZyb20gMTk4NSkuIEl0IGRvZXMgc3RpbGwgc3VwcG9ydCB0aGUgODA0ODYgZnJvbSAxOTg5
LCB0aGUgUGVudGl1bQpmYW1pbHksIGFuZCBuZXdlciAzMi1iaXQgQ1BVcy4KCj4gSSBub3RpY2Vk
IHlvdSBjb3VsZCBzZWxlY3QgaTM4NiBpbiBtYWtlIG1lbnVjb25maWcKCkluIFRhcmdldCBvcHRp
b25zIOKGkiBUYXJnZXQgQXJjaGl0ZWN0dXJlLCB5b3UgY2FuIHNlbGVjdCAiaTM4NiIuIEl0IGlz
CmFjdHVhbGx5IHRoZSBkZWZhdWx0IGNob2ljZS4gSW4gdGhpcyBjb250ZXh0LCAiaTM4NiIgbWVh
bnMgImFueSAzMi1iaXQKeDg2IENQVSIuCgpJbiBUYXJnZXQgb3B0aW9ucyDihpIgVGFyZ2V0IEFy
Y2hpdGVjdHVyZSBWYXJpYW50LCB0aGUgY2hvaWNlICJpMzg2IiBpcwpnb25lOiB0aGUgb2xkZXN0
IENQVSB5b3UgY2FuIGNob29zZSBpcyAiaTQ4NiIuIEluIHRoaXMgY29udGV4dCwgImkzODYiCm1l
YW5zIGEgc3BlY2lmaWMgeDg2IHZhcmlhbnQsIG5hbWVseSB0aGUgSW50ZWwgODAzODYgZnJvbSAx
OTg1LgoKPiBBbHNvIGRlYmlhbiBzdGlsbCBoYXMgMzJiaXQgdmVyc2lvbnMKCkkgYmVsaWV2ZSBE
ZWJpYW4gcmVxdWlyZXMgYXQgbGVhc3QgYW4gaTY4NiB0eXBlIG9mIFBDVS4KClJlZ2FyZHMsCgpF
ZGdhci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
