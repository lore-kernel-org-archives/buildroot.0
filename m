Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11900E7736A
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 10:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAB4561737;
	Sat, 30 Sep 2023 10:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAB4561737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GGckW7a3ZU3; Sat, 30 Sep 2023 10:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E2DB61701;
	Sat, 30 Sep 2023 10:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E2DB61701
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78C5D1BF3EB
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52B2561701
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52B2561701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VsIOEJGo4hSw for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 10:35:22 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D79361077
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 10:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D79361077
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE27B240003;
 Sat, 30 Sep 2023 10:35:18 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmXJe-00AP6M-3r; Sat, 30 Sep 2023 12:35:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20230928201215.5296482AEA@busybox.osuosl.org>
Date: Sat, 30 Sep 2023 12:35:18 +0200
In-Reply-To: <20230928201215.5296482AEA@busybox.osuosl.org> (Yann E. MORIN's
 message of "Thu, 28 Sep 2023 22:05:26 +0200")
Message-ID: <87r0mg9cex.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/nodejs: fix parallel build
 further
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

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IGNvbW1pdDogaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29t
bWl0Lz9pZD1kNTc0ZTJhNGY0NDA5MDNhMGUzMmRlNmRlYjgyNzViMWYzODVkYTJlCiA+IGJyYW5j
aDogaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD1yZWZzL2hl
YWRzL21hc3RlcgoKID4gQ29tbWl0IDg0YzI0YWIxYjVhNyAocGFja2FnZS9ub2RlanM6IGZpeCBw
YXJhbGxlbCBidWlsZCkgbWFkZSB1c2Ugb2YKID4gQlIyX0pMRVZFTCB0byBzZXQgdGhlIG51bWJl
ciBvZiBqb2JzIG5vZGVqcyBzaG91bGQgdXNlIGluc3RlYWQgb2YgdXNpbmcKID4gdGhlIG51bWJl
ciBvZiBDUFVzICgrMikuCgogPiBIb3dldmVyLCBCUjJfSkxFVkVMIGNhbiBiZSBzZXQgdG8gMCBi
eSB0aGUgdXNlciwgdG8gbGV0IEJ1aWxkcm9vdCBkZXRlY3QKID4gdGhlIG51bWJlciBvZiBDUFVz
ICgrMSksIGFuZCBzdG9yZXMgaXQgaW4gUEFSQUxMRUxfSk9CUywgYW5kIGxlYXZlcwogPiBCUjJf
SkxFVkVMIHVudG91Y2hlZCwgc28gMC4KCiA+IFRodXMsIHdlIGNhbiBlbmQgdXAgc3Bhd25pbmcg
YSBidWlsZCBieSBwYXNzaW5nIC1qMCB0byBuaW5qYSwgd2hpY2ggaXQKID4gaW50ZXJwcmV0cyBh
cyAibm8gLWxpbWl0IHlvbG8iIGFuZCBkb2VzIG5vdCBsaW1pdCB0aGUgbnVtYmVyIG9qIGpvYnMg
aXQKID4gc3Bhd25zLCB3aGljaCB1c3VhbGx5IGVuZHMgdXAgaW4gYW4gT09NIHNvbWV3aGVyZS4u
LgoKID4gRml4IHRoaXMgYnkgdXNpbmcgUEFSQUxMRUxfSk9CUy4KCiA+IFJlcG9ydGVkLWJ5OiBD
w6lkcmljICYgQ28KID4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4x
OTk4QGZyZWUuZnI+CgpDb21taXR0ZWQgdG8gMjAyMy4wMi54IGFuZCAyMDIzLjA4LngsIHRoYW5r
cy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
