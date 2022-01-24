Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBA7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 08:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26B8E60A9F;
	Mon, 24 Jan 2022 08:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0SXk30uxMyry; Mon, 24 Jan 2022 08:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 632B860A72;
	Mon, 24 Jan 2022 08:59:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 233921BF228
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F99E4014A
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86SiE-FZuViM for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 08:59:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1B10400F1
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 08:59:50 +0000 (UTC)
Received: from smtpclient.apple ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPA
 id BvCUnPtcIz0d2BvCUnSnYd; Mon, 24 Jan 2022 09:59:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643014788; bh=wn6hKwrSUlRC7Fns+FZHevzaGKJGPSF/qLDxWMrFdzE=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=D6raNJR83bM5Vx0ze0DexsfaCLE6TtnqkdQ8SyPhDIiX2jLVQurFRidQz2VXuvAkV
 rVMCZEzLvpBTnKtfDHUbi5NIBjZ4jCLVTxrVqyW8Avk0IL9g+LyLudpywHyvc9fdjB
 4jzPwzTCkqwspp5c7qsBTPe3NXsfsy3hXY6rzPBoEwpMBa67BNXWVB7WIIEpnJE8+q
 f65g/yyU+qBvrkY6wgB+euD1xnty/r3V8SNAfSlvJniLy+vPikKg7nDguVtdupBNrO
 87PIk4kCSBGpf1/QCIUxnnA3RGT5CjngHaY0Fi5jvPu5VcttYNZP4zmn8CXxD6OIJt
 ENuuGgUZG/XAQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 24 Jan 2022 09:59:45 +0100
Message-Id: <0FCF99B5-6DEF-4CEB-9686-033655A6802E@benettiengineering.com>
References: <164301384246.4708.15294151281235312059@kwain>
In-Reply-To: <164301384246.4708.15294151281235312059@kwain>
To: Antoine Tenart <atenart@kernel.org>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfMA3kgQo9+3WzgrTD5bCIahl1RFwcALhk/0FpvQmrGuhUPsW4SUh3upfgWsS8hbz3wBWKYhuIvWjxH6wquTSOGlqQWrmo7hfgpv/lKCOfgNk+LzBhK1g
 W2JBjSnH57SDJHWoyPe/TFTScrhA6jyivHo2amyWDniRKENBVjGTZYlQqHS5yuLazfP1uTb2ZhGdX5KIypZ1DmklfK2DOnUTl7pCPr674VWGiSSBvHgqzab6
 yD4FP/EqXkr4qHzpYIcLMLNQQQbCnMYlZ2z2MumDWR25qpoIULAUkueO5uneDI7juQ2njXzXJwp2YidfKbWtyPnsGjm/ZG4bPPXSxRKtTmc=
Subject: Re: [Buildroot] [PATCH v3] package/refpolicy: Add option to disable
 "dontaudit" rules
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
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDI0IGdlbiAyMDIyLCBhbGxlIG9yZSAwOTo0NSwgQW50b2luZSBUZW5hcnQg
PGF0ZW5hcnRAa2VybmVsLm9yZz4gaGEgc2NyaXR0bzoKPiAKPiDvu79RdW90aW5nIEdpdWxpbyBC
ZW5ldHRpICgyMDIyLTAxLTIzIDIzOjIxOjUwKQo+PiAKPj4gUmUtcmVhZGluZyB0aGlzIGFmdGVy
IHNvbWUgZGF5IGl0IGxvb2tzIHRvIG1lIGxpa2UgdGhlIHNpbXBsZQo+PiBCUjJfUEFDS0FHRV9S
RUZQT0xJQ1lfRU5BQkxFQVVESVQgaXMgY29ycmVjdC4gQmVjYXVzZSBpdCAiUmVtb3ZlcyBhbGwg
Cj4+IGRvbnRhdWRpdCBydWxlcyBmcm9tIHBvbGljeS5jb25mIiwgc28gaXQncyB0cnVlIHRoYXQg
aXQgZW5hYmxlcyBhdWRpdCAKPj4gbG9ncyBpbiB0aGUgZW5kLiBJdCdzIGEgdmVyeSBzcGVjaWZp
YyBvcHRpb25zIGFuZCB0aGUgb25lIHdobyB3aWxsIHVzZSAKPj4gaXQgd2lsbCBrbm93IHdoYXQg
aGUgd2lsbCBlbmFibGUgYW5kIG1vc3Qgb2YgYWxsIHdlIGNhbiBzcGVjaWZ5IGluIHRoZSAKPj4g
aGVscCBzZWN0aW9uIHRoYXQ6Cj4+ICJSZW1vdmVzIGFsbCBkb250YXVkaXQgcnVsZXMgZnJvbSBw
b2xpY3kuY29uZiIKPiAKPj4gRG9lcyBpdCB3b3JrIGZvciB5b3U/Cj4gCj4gQXMgbG9uZyBhcyB0
aGUgaGVscCB0ZXh0IGlzIGNsZWFyIGVub3VnaCBmb3IgdGhlIHVzZXIsIGVpdGhlciBjb25maWcK
PiBvcHRpb24gbmFtZSBzaG91bGQgYmUgYWNjZXB0YWJsZS4gVXNpbmcgdGhlIGFib3ZlIGlzIGdv
b2QgdG8gaGF2ZSBhbiAxOjEKPiBtYXBwaW5nIHdpdGggdGhlIHRhcmdldCBuYW1lLCBhdCB0aGUg
ZXhwZW5zZSBvZiBoYXZpbmcgdGhlIGhlbHAgdGV4dCBub3QKPiBtYXRjaGluZyBpdCBhbmQgYW4g
dW5jbGVhciBvcHRpb24gbmFtZSBmcm9tIHRoZSB1c2VyIHBlcnNwZWN0aXZlIChpdCdzIGEKPiBi
aXQgd2VpcmQgbm90IHRvIGVuYWJsZSBpdCwgYXQgZmlyc3QpLiBGb3IgX1dJVEhfRE9OVEFVRElU
XywgdGhlCj4gb3Bwb3NpdGUgaXMgdHJ1ZS4gSSdkIHNheSB0aGVyZSBpcyBubyBwZXJmZWN0IHNv
bHV0aW9uLCB3ZSBjYW4gZWl0aGVyCj4gc3RheSBjbG9zZSB0byB0aGUgcmVmcG9saWN5IGludGVy
bmFscyBvciBoYXZlIHRoZSBCdWlsZHJvb3Qgc3BlY2lmaWNzCj4gbW9yZSBjb25zaXN0ZW50OyBu
b3Qgc3VyZSB3aGljaCBpcyBiZXR0ZXIuCgpJ4oCZZCBnbyBmb3IgQnVpbGRyb290IGNvbnNpc3Rl
bmN5IHNpbmNlIHdl4oCZcmUgaW4gQnVpbGRyb290LiBJZiBzb21lb25lIGVuYWJsZXMgcmVmcG9s
aWN5IHBhY2thZ2UgYW5kIGVuYWJsZXMg4oCcRW5hYmxlIGF1ZGl04oCdLCBJIGV4cGVjdCB0byBz
ZWUgYXVkaXQgbG9nLiBSaWdodD8KClRoaXMgaXMgbWUgYXQgbGVhc3QgdGhhdCBJ4oCZdmUgbmV2
ZXIgdXNlZCByZWZwb2xpY3kgc28gSeKAmW0gYWdub3N0aWMgaW4gdGhlIHRvcGljLCBzbyBtYXli
ZSBhIG5ldXRyYWwg4oCcdXNlIGNhc2XigJwgOi0pCgpCZXN0IHJlZ2FyZHMKR2l1bGlvCgo+IAo+
IFRoYW5rcywKPiBBbnRvaW5lCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
