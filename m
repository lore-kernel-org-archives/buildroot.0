Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018E2C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 05:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 621AC6069C;
	Mon,  8 Jul 2024 05:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUyfq7A3hyGN; Mon,  8 Jul 2024 05:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF17606B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF17606B9;
	Mon,  8 Jul 2024 05:20:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CC941BF48D
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 05:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4713080E84
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 05:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-9-E0GWJ36O for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 05:20:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8595380E83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8595380E83
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8595380E83
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 05:20:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06FE11BF206;
 Mon,  8 Jul 2024 05:20:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sQgnW-0014CN-00;
 Mon, 08 Jul 2024 07:20:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240528082356.215363-1-dario.binacchi@amarulasolutions.com>
Date: Mon, 08 Jul 2024 07:20:21 +0200
In-Reply-To: <20240528082356.215363-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Tue, 28 May 2024 10:23:56 +0200")
Message-ID: <87tth0sbmy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: fix build failure with
 gcc 11.x
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkRhcmlvIiA9PSBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20+IHdyaXRlczoKCiA+IFRoZSBwYXRjaCBmaXggdGhlIGZvbGxvd2luZyBidWls
ZCBmYWlsdXJlOgogPiBvdXRwdXQvaG9zdC9iaW4vYXJtLWJ1aWxkcm9vdC1saW51eC11Y2xpYmNn
bnVlYWJpaGYtZ2NjIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFCiA+
IC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgIC1PcyAtZzAgIC1waXBlIC1Xbm8tZXJyb3I9Zm9ybWF0
LXRydW5jYXRpb24gLVdhbGwgLVdleHRyYSAtV3BvaW50ZXItYXJpdGgKID4gLVd1bmluaXRpYWxp
emVkIC1Xc2lnbi1jb21wYXJlIC1XZm9ybWF0LXNlY3VyaXR5IC1Xc2l6ZW9mLXBvaW50ZXItbWVt
YWNjZXNzIC1Xbm8tcG9pbnRlci1zaWduCiA+IC1Xbm8tdW51c2VkLXBhcmFtZXRlciAtV25vLXVu
dXNlZC1yZXN1bHQgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCAtV21pc2xlYWRpbmctaW5kZW50YXRp
b24KID4gLWZuby1zdHJpY3QtYWxpYXNpbmcgLURfRk9SVElGWV9TT1VSQ0U9MiAtZnRyYXB2IC1m
emVyby1jYWxsLXVzZWQtcmVncz11c2VkIC1mbm8tYnVpbHRpbi1tZW1zZXQKID4gLWZzdGFjay1w
cm90ZWN0b3Itc3Ryb25nICAgLWZQSUMgLUkuIC1JLi4gLUkuIC1JLi8uLiAtRF9MQVJHRUZJTEVf
U09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRQogPiAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1E
X1hPUEVOX1NPVVJDRT02MDAgLURfQlNEX1NPVVJDRSAtRF9ERUZBVUxUX1NPVVJDRSAtRF9HTlVf
U09VUkNFCiA+IC1ESEFWRV9DT05GSUdfSCAtYyBwb3J0LWFpeC5jCiA+IHNoYTIuYzogSW4gZnVu
Y3Rpb24g4oCYU0hBMjU2SW5pdOKAmToKID4gc2hhMi5jOjM2MDoxOiBzb3JyeSwgdW5pbXBsZW1l
bnRlZDog4oCYLWZ6ZXJvLWNhbGwtdXNlZC1yZWdz4oCZIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyB0
YXJnZXQKID4gICAzNjAgfCB9CiA+ICAgICAgIHwgXgogPiBtYWtlWzNdOiAqKiogW01ha2VmaWxl
OjEwNjogc2hhMi5vXSBFcnJvciAxCiA+IG1ha2VbM106ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlz
aGVkIGpvYnMuLi4uCiA+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6MTk5OiBvcGVuYnNkLWNvbXBh
dC9saWJvcGVuYnNkLWNvbXBhdC5hXSBFcnJvciAyCgogPiBUaGlzIGNvbW1pdCBhcHBsaWVzIGFu
IHVwc3RyZWFtIHBhdGNoIHRoYXQgaW1wcm92ZXMgdGhlIGRldGVjdGlvbiBvZgogPiAtZnplcm8t
Y2FsbC11c2VkLXJlZ3M9dXNlZC4KCiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxk
YXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KCkNvbW1pdHRlZCB0byAyMDI0LjAy
LnggYW5kIDIwMjQuMDUueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
