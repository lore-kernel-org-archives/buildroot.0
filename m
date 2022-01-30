Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1956C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 17:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4138A60E75;
	Sun, 30 Jan 2022 17:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FvCxCBZPa-D8; Sun, 30 Jan 2022 17:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92FE060D6C;
	Sun, 30 Jan 2022 17:17:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FCB31BF57B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A3A340160
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VxPZSPzta1GN for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 17:17:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA42B4010E
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 17:17:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F11F4000E;
 Sun, 30 Jan 2022 17:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643563020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C31FpTZxrr7YihBVFE5skOfjk8lJMf/r/hC07L6T9VQ=;
 b=YqOYPEbRu46wyDmi12lkbu25j45DjKCZhYmvncMsHt/ItAgiZyG2tIvXA4zK0m0MkOdy20
 MW+0NGGfV6gegl8az4GFARKvevV9BdJjGkI6YswiDjuhlrF8gxpeKjYmJ/xADKwvNvBIfA
 mqdFjsuRZi3F1Dw2iSnnJyfkJ8BLer/R7+tMq9+V8DJ2ILyLKxUx9tDyC6Rke4/vy9EIGu
 64KF8noTJfLk4UDu/dKQGt5B396jkxpD1t4xSFNeIy46J11kJKOpSZssNV3J4W+GHI7Ufb
 n7Ie3bicQCnNaPwnsqrOfMuavxIhXwUOZbCJCofc4aD2bT1M/Ih3b332DlCelA==
Date: Sun, 30 Jan 2022 18:16:59 +0100
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Message-ID: <20220130181659.1e3aae5a@windsurf>
In-Reply-To: <20220129111731.736265-2-peron.clem@gmail.com>
References: <20220129111731.736265-1-peron.clem@gmail.com>
 <20220129111731.736265-2-peron.clem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/beelink_gs1: bump to linux
 5.15, atf 2.5 and u-boot 2021.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAyOSBKYW4gMjAyMiAxMjoxNzozMSArMDEwMApDbMOpbWVudCBQw6lyb24gPHBlcm9u
LmNsZW1AZ21haWwuY29tPiB3cm90ZToKCj4gVS1ib290IGxpYmZkdCBmYWlscyB0byBjb21waWxl
IG9uIENJLgo+IC91c3IvYmluL2xkOiBzY3JpcHRzL2R0Yy9kdGMtcGFyc2VyLnRhYi5vOiguYnNz
KzB4MTApOiBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIGB5eWxsb2MnOyBzY3JpcHRzL2R0Yy9kdGMt
bGV4ZXIubGV4Lm86KC5ic3MrMHgwKTogZmlyc3QgZGVmaW5lZCBoZXJlCj4gY29sbGVjdDI6IGVy
cm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCj4gCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8yMDIxNDc4MjA4Cj4gCj4gQXMgdGhpcyBmaXgg
aGFzIGJlZW4gYWxyZWFkeSB1cHN0cmVhbWVkIGp1c3QgYnVtcCBVLWJvb3QgcGFja2FnZS4KPiAK
PiBMZXQncyBhbHNvIGJ1bXAgS2VybmVsIGFuZCBBVEYgYXMgdGhlIGJvYXJkIGlzIHByb3Blcmx5
IHN1cHBvcnRlZCB1cHN0cmVhbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24g
PHBlcm9uLmNsZW1AZ21haWwuY29tPgo+IC0tLQo+ICBjb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNv
bmZpZyB8IDEwICsrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRo
b21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
