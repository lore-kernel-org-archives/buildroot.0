Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3694EC52D7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 09:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9EA840083;
	Mon, 12 Aug 2024 09:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNtpXv9zjJRQ; Mon, 12 Aug 2024 09:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F76C40023
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F76C40023;
	Mon, 12 Aug 2024 09:51:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F21371BF27C
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF6E740448
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eudSxWr7ffTN for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 09:51:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A63A140425
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A63A140425
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A63A140425
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 09:51:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CDE7E0004;
 Mon, 12 Aug 2024 09:51:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sdRi0-006tyn-2a;
 Mon, 12 Aug 2024 11:51:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240216211344.1807353-2-raphael.melotte@mind.be>
 <20240607163208.1445715-1-raphael.melotte@mind.be>
 <20240713223430.039c274c@windsurf>
Date: Mon, 12 Aug 2024 11:51:24 +0200
In-Reply-To: <20240713223430.039c274c@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 13 Jul 2024 22:34:30 +0200")
Message-ID: <87cymekr1f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/5] package: python-pymupdf: add missing
 python-zlib dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gT24gRnJpLCAgNyBKdW4gMjAyNCAxODozMjow
MiArMDIwMAogPiBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVp
bGRyb290Lm9yZz4gd3JvdGU6CgogPj4gSXQgdHVybnMgb3V0IHRoYXQgcHl0aG9uLXB5bXVwZGYg
ZG9lc24ndCByZXF1aXJlIHpsaWIgZGlyZWN0bHksIGJ1dCBpdAogPj4gZG9lcyByZXF1aXJlIHRo
ZSB6bGliIHB5dGhvbiBtb2R1bGUuCiA+PiAKID4+IFRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyBy
dW50aW1lIGVycm9yOgogPj4gCiA+PiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6
CiA+PiBGaWxlICI8c3RkaW4+IiwgbGluZSAxLCBpbiA8bW9kdWxlPgogPj4gRmlsZSAiL3Vzci9s
aWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL2ZpdHovX19pbml0X18ucHkiLCBsaW5lIDIyLCBp
biA8bW9kdWxlPgogPj4gRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL2Zp
dHovZml0ei5weSIsIGxpbmUgMzQwMiwgaW4gPG1vZHVsZT4KID4+IEZpbGUgIi91c3IvbGliL3B5
dGhvbjMuMTEvZ3ppcC5weSIsIGxpbmUgOSwgaW4gPG1vZHVsZT4KID4+IE1vZHVsZU5vdEZvdW5k
RXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAnemxpYicKID4+IAogPj4gU2lnbmVkLW9mZi1ieTogUmFw
aGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgoKID4gWW91IGhhZCBmb3Jn
b3R0ZW4gdG8gZHJvcCB0aGUgInpsaWIiIGRlcGVuZGVuY3kgaW4gTVVQREZfREVQRU5ERU5DSUVT
LAogPiBzbyBJIGRyb3BwZWQgaXQgYXMgd2VsbC4gQW5kIGFwcGxpZWQgeW91ciBwYXRjaCEKCiA+
IEFuZCBpbiBmYWN0IHRoaXMgbGVhZCBtZSB0byBsb29rIG1vcmUgaW50byBtdXBkZiwgYW5kIEkg
d2FzIGN1cmlvdXMgdG8KID4gc2VlIHdoeSBpdCBkZXBlbmRlZCBvbiBYMTEuIEV4Y2VwdCBpdCBk
b2VzIG5vdDogaXQgaXMgYSBwdXJlbHkgb3B0aW9uYWwKID4gZGVwZW5kZW5jeS4gQW5kIEkgZm91
bmQgb3RoZXIgdGhpbmdzIHRoYXQgd2VyZSBub3QgY29ycmVjdC91c2VmdWwKID4gYW55bW9yZSBp
biB0aGUgcGFja2FnZSBzbyBJIGRpZCBhIGZldyBwcmVwYXJhdGlvbiBjb21taXRzOgoKID4gaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2Y3ZGVhYTEz
MzBiYWFkMzAzYWZiNzZhNzcxMWZhZWViMWRkZmVlNWQKID4gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzkwZjBhNDg0NjcxMDk4ZjlhOTRjZTY2Yjhm
OGFmOTRlMTA2YWUxMDYKID4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vY29tbWl0LzJjMGQ3YjcyYzA5OTNhNTVjOGRjYjdiMzhkODU3OTJlMWJmNmU4YmMKCiA+
IGFuZCB1bHRpbWF0ZWx5LCBJIGRyb3BwZWQgdGhlIFgub3JnIGRlcGVuZGVuY3kgYWxzbyBvbiBw
eXRob24tcHltdXBkZjoKCiA+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2NvbW1pdC9lZGZhNmYyOTc4NWU2MThiNzU3MzliNzAyZmM4NjNlZTI0MTA5MDhkCgpD
b21taXR0ZWQgYWxsIDQgdG8gMjAyNC4wMi54IGFuZCAyMDI0LjA1LngsIHRoYW5rcy4KCi0tIApC
eWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
