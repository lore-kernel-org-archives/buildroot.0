Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF37C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 11:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B0B28039D;
	Sun, 26 Jan 2025 11:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3WvmE_SCb-a; Sun, 26 Jan 2025 11:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D582819BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D582819BE;
	Sun, 26 Jan 2025 11:14:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CA16F10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D8FD8039D
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZA8rrfXBETr for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 11:14:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F73680EBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F73680EBF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F73680EBF
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:14:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1EE11BF203;
 Sun, 26 Jan 2025 11:14:18 +0000 (UTC)
Date: Sun, 26 Jan 2025 12:14:18 +0100
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Robin Jarry <robin@jarry.cc>, Brandon Maier <brandon.maier@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Message-ID: <20250126121418.28a0e655@windsurf>
In-Reply-To: <20250102164630.25695-2-vjardin@free.fr>
References: <D67L0SLHFKBX.2N0314A43JOJC@gmail.com>
 <20250102164630.25695-1-vjardin@free.fr>
 <20250102164630.25695-2-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737890059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HnEoetOWUuOxJ7fL2byEt1RuVbiDjogIG0TKP1Dx0XE=;
 b=cKgK+mwCdZ9cYbgcEJiTBFDM0tdhAlsEL+p3KOgmrNYRO5JkEHELpM7qYo2LJP6C5n7P4c
 x45B7hMDqP9b9df0m0n7waNDoB9RL/cxLkdpMT1EshgBQBE8qzFaMP0agiSuqRBODQxZ87
 bSY5wXZxPFd/RzmFgUq53DVV1zCdu3Qud0Y7yXJhc9s+lCKbAv4/51Kcx5GFo3oKndNs9H
 9qr51vuzY7qgKngMkEyqiA4fIjFyhHcLlKLW/8xhdcTUCmY9dt+VUkktVrEe12NlU1r65b
 gsN/wWD8g7FTNRXJPQToCJkWQR3iZpAAG6tv+XlULgUJWOGS8LuP7zXgLUUVtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cKgK+mwC
Subject: Re: [Buildroot] [PATCH v6 1/2] package/pkg-meson: h files only into
 sysroot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUaHUsICAyIEphbiAyMDI1IDE3OjQ2OjI5ICswMTAwClZpbmNlbnQgSmFyZGlu
IDx2amFyZGluQGZyZWUuZnI+IHdyb3RlOgoKPiBNYW55IHBhY2thZ2VzIGJ1aWx0IHdpdGggQnVp
bGRyb290IGFuZCBtZXNvbiBjdXJyZW50bHkgaW5zdGFsbCBoZWFkZXIKPiBmaWxlcyBpbnRvIGJv
dGg6Cj4gICAtIHRoZSB0YXJnZXTigJlzIC91c3IvaW5jbHVkZSwgYW5kCj4gICAtIHRoZSBzeXNy
b2904oCZcyAvdXNyL2luY2x1ZGUuCj4gCj4gV2hlbiBGT09fTUVTT05fSU5TVEFMTF9UQUdTID0g
WUVTLCBlbnN1cmUgdGhhdCBoZWFkZXIgZmlsZXMgYXJlCj4gaW5zdGFsbGVkIGV4Y2x1c2l2ZWx5
IGluIHRoZSBzdGFnaW5nIChzeXNyb290KSB0YXJnZXQgZHVyaW5nIHRoZQo+IGJ1aWxkIHByb2Nl
c3MuCj4gCj4gVGhlIGRlZmF1bHQgaXMgRk9PX01FU09OX0lOU1RBTExfVEFHUyA/PSBOTyBpbiBv
cmRlciB0byBhdm9pZAo+IGNoYW5naW5nIHRvIHRoaXMgbmV3IGJlaGF2aW91ciBmb3IgdGhlIHRp
bWUgYmVpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBKYXJkaW4gPHZqYXJkaW5AZnJl
ZS5mcj4KPiBTdWdnZXN0ZWQtYnk6IFJvYmluIEphcnJ5IDxyb2JpbkBqYXJyeS5jYz4KPiBTdWdn
ZXN0ZWQtYnk6IEJyYW5kb24gTWFpZXIgPGJyYW5kb24ubWFpZXJAZ21haWwuY29tPgoKVGhhbmtz
IFZpbmNlbnQgZm9yIHRoZSBwYXRjaC4KCkkgYW0gbm90IHN1cmUgd2Ugd2FudCB0aGlzIGJlaGF2
aW9yLCBhcyBpdCB3b3VsZCBvbmx5IGJlIGFwcGxpY2FibGUgdG8KbWVzb24gcGFja2FnZXMuIEZv
ciBhbGwgb3RoZXIgcGFja2FnZXMsIHdlIGluc3RhbGwgcHJldHR5IG11Y2gKZXZlcnl0aGluZyB0
byB0YXJnZXQsIGFuZCB0aGVuIHdpcGUtb3V0IHdoYXQncyBuZWVkZWQgaW4KdGFyZ2V0LWZpbmFs
aXplLiBTbyBJJ20gbm90IHN1cmUgd2hhdCBpcyB0aGUgYmVuZWZpdCBvZiBkaXZlcmdpbmcgZnJv
bQp0aGlzIGNvbW1vbiBiZWhhdmlvciBqdXN0IGZvciBtZXNvbiBwYWNrYWdlcy4KClRoaXMgaXMg
bm90IGEgc3Ryb25nIGZlZWxpbmcsIGJ1dCBhcyBvdGhlciBidWlsZCBzeXN0ZW1zIGRvbid0IGhh
dmUKdGhpcyBjb25jZXB0IG9mIGluc3RhbGxpbmcgb25seSB0aGUgcnVudGltZSwgSSdtIG5vdCBz
dXJlIGl0IG1ha2VzIGEKbG90IG9mIHNlbnNlIHRvIHVzZSB0aGF0IGp1c3QgZm9yIG1lc29uLWJh
c2VkIHBhY2thZ2VzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQg
Q0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRy
YWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
