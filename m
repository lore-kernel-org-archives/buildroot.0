Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9FAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 20:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EBCD60D6B;
	Sun, 23 Jan 2022 20:57:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMKxAvRfmx84; Sun, 23 Jan 2022 20:57:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57C1960D62;
	Sun, 23 Jan 2022 20:57:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CDE51BF285
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 20:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B9D64035B
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 20:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rKgCsda-cFra for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 20:57:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E899040341
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 20:57:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a491:f028:92d2:337e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E9AD65FF9A;
 Sun, 23 Jan 2022 21:57:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642971433;
 bh=L9RgE7v7DTmSIHVlGBZN61xqSLZJZbErD70ApjnbnF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IwNHRT91qDiUtX3r1tGKi+oYjAX7scC2DJVaIzfAdqDGZ+3MzOkDRC4yieDqbByYO
 FWoatYmtkblxKUv7otJuQDp4NJqp/3JRtayxoTsaQyQcHL4U+DJj4LLeojsmwtw0wt
 IydY/u2USmaen5OM/iM8R+kS5cmTxJvr/WtAIASdnySIaSMHiW670PtekCZdd+e5+h
 9m8CCiHUC27xrFNZU+E2MLw70uJhdYyMTFZ7mmf89LNCvnozjUV2Pb95WVcI9VKqli
 32ugp3fJX3x8AP6SWE8cV+kEKeBRf46Wa9ewSChxy6nwGyc8VfQoCCkw0jzwaf+a7o
 2HsSO3oM62CNw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jan 2022 21:57:09 +0100
Date: Sun, 23 Jan 2022 21:57:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220123205709.GI2502@scaer>
References: <9c9b7005-6f85-f812-21b5-fa029136477b@gmail.com>
 <83218573-DFC3-4AA3-B21E-F5C32DBADC1B@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83218573-DFC3-4AA3-B21E-F5C32DBADC1B@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 25/28] configs/orangepi_zero_defconfig:
 enable NEON/VFPV4 FPU strategy
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2l1bGlvLCBBbGwsCgpPbiAyMDIyLTAxLTIzIDIwOjEyICswMTAwLCBHaXVsaW8gQmVuZXR0aSBz
cGFrZSB0aHVzbHk6Cj4gSGkgU2VyZ2V5LAo+IAo+IHRoYW5rIHlvdSBmb3IgdGhlIFRlc3RlZC1i
eSwgYnV0IHlvdSBzaG91bGQgcHV0IGl04oCmCj4gCj4gPiBJbCBnaW9ybm8gMjMgZ2VuIDIwMjIs
IGFsbGUgb3JlIDE5OjA4LCBTZXJnZXkgS3V6bWlub3YgPGt1em1pbm92LnNlcmdleTgxQGdtYWls
LmNvbT4gaGEgc2NyaXR0bzoKPiA+IAo+ID4g77u/MTguMDEuMjAyMiAxMzo0MywgR2l1bGlvIEJl
bmV0dGk6Cj4gPj4gVGhpcyBib2FyZCBoYXMgQWxsd2lubmVyIEgyKyhjb21wYXRpYmxlIHdpdGgg
SDMpIHRoYXQgaXMgYSBjb3J0ZXgtQTcgYW5kCj4gPj4gc3VwcG9ydHMgTkVPTi9WRlBWNCBGUFUg
c3RyYXRlZ3ksIHNvIGxldCdzIGVuYWJsZSBpdCBpbnN0ZWFkIG9mIG9ubHkgVkZQVjQuCj4gPj4g
U2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdp
bmVlcmluZy5jb20+Cj4gCj4g4oCmaGVyZSwgYWZ0ZXIgbXkgU29CLgoKTm8sIG5vdCBuZWVkZWQ6
IFBhdGNod29yayB3aWxsIGNvcnJlY3RseSBjYXRjaCBpdCB3aGVyZXZlciBpdCBpcyBhcyBsb25n
CmFzIHRoZSBtYWlsIGlzIGEgcHJvcGVyIHJlcGx5LCB3aGljaCBpdCBpcyBoZXJlLCBhbmQgeW91
IGNhbiBjaGVjayBpdCBvbgpwYXRjaHdvcms6IHRoZSAnVCcgY29sdW1uIGlzIG5vdyBzZXQgdG8g
JzEnIGZvciB0aGlzIHBhdGNoLCBhbmQgdGhlCnRlc3RlZC1ieSB0YWcgaXMgcHJvcGVybHkgYWRk
ZWQgdG8gdGhlIG1ib3ggKHdoaWNoIGlzIHdoYXQgd2UKbWFpbnRhaW5lcnMgdXNlIHdoZW4gYXBw
bHlpbmcgcGF0Y2hlcyk6CgogICAgJCBjdXJsICdodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwMTE4MTA0MzM4LjIwODEyNTktMjYtZ2l1bGlv
LmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbS9tYm94LycKICAgIFsuLi5dCiAgICBTaWdu
ZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbT4KICAgIFRlc3RlZC1ieTogU2VyZ2V5IEt1em1pbm92IDxrdXptaW5vdi5zZXJnZXk4
MUBnbWFpbC5jb20+CiAgICBbLi4uXQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBB
R0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
