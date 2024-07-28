Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC3CC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 07:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F1DA600CA;
	Sun, 28 Jul 2024 07:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OWVUecJIYDj; Sun, 28 Jul 2024 07:09:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91C5960770
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91C5960770;
	Sun, 28 Jul 2024 07:09:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DD5C1BF32E
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38FA7605F4
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14cuxG7Bv4_6 for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 07:09:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18B68600CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18B68600CA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18B68600CA
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 07:09:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BBABFF802;
 Sun, 28 Jul 2024 07:08:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sXy1a-001zCQ-1E;
 Sun, 28 Jul 2024 09:08:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Lance Fredrickson <lancethepants@gmail.com>
References: <20240623033804.105858-1-lancethepants@gmail.com>
Date: Sun, 28 Jul 2024 09:08:58 +0200
In-Reply-To: <20240623033804.105858-1-lancethepants@gmail.com> (Lance
 Fredrickson's message of "Sat, 22 Jun 2024 21:38:04 -0600")
Message-ID: <87ed7exab9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] boot/syslinux: Fix building syslinux
 with GCC 14.x
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkxhbmNlIiA9PSBMYW5jZSBGcmVkcmlja3NvbiA8bGFuY2V0aGVwYW50c0BnbWFpbC5j
b20+IHdyaXRlczoKCiA+IEZyb206IExhbmNlIEZyZWRyaWNrc29uIDxsYW5jZXRoZXBhbnRzQGdt
YWlsLmNvbT4KID4gQWRkIG1pc3Npbmcgc3RkaW8uaCBpbmNsdWRlLiBXaXRob3V0IGl0IHJlc3Vs
dHMgaW4gdGhlIGZvbGxvd2luZyBlcnJvciB1bmRlciBHQ0MgMTQueAoKID4gLi4vLi4vLi4vY29t
MzIvbGliL3N5c2xpbnV4L2RlYnVnLmM6IEluIGZ1bmN0aW9uIOKAmHN5c2xpbnV4X2RlYnVn4oCZ
OgogPiAuLi8uLi8uLi9jb20zMi9saWIvc3lzbGludXgvZGVidWcuYzo5MTo1OiBlcnJvcjogaW1w
bGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYcHJpbnRm4oCZIFstV2ltcGxpY2l0LWZ1
bmN0aW9uLWRlY2xhcmF0aW9uXQogPiAgICA5MSB8ICAgICBwcmludGYoIkR5bmFtaWMgZGVidWcg
dW5hdmFpbGFibGVcbiIpOwoKID4gVXBzdHJlYW06IGRlYWQgKGxhc3QgcmVsZWFzZSBpbiAyMDE0
KQogPiBTaWduZWQtb2ZmLWJ5OiBMYW5jZSBGcmVkcmlja3NvbiA8bGFuY2V0aGVwYW50c0BnbWFp
bC5jb20+CgpDb21taXR0ZWQgdG8gMjAyNC4wMi54IGFuZCAyMDI0LjA1LngsIHRoYW5rcy4KCi0t
IApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
