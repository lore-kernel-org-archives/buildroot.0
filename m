Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B779C4332F
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 15:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C20861565;
	Tue, 12 Dec 2023 15:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C20861565
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vn2hTY_SB2Bh; Tue, 12 Dec 2023 15:20:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B1E26155A;
	Tue, 12 Dec 2023 15:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B1E26155A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B81411BF3C3
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 15:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AB77435A4
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 15:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AB77435A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B34brgMHLo1v for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 15:20:50 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F10D404FE
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 15:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F10D404FE
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4SqMkh5mXWz9scC;
 Tue, 12 Dec 2023 16:20:44 +0100 (CET)
Message-ID: <65def2db-75ce-4eb0-88ac-28eaf310d21d@lindra.de>
Date: Tue, 12 Dec 2023 16:20:43 +0100
MIME-Version: 1.0
Content-Language: en-US
From: Ralf Dragon <hypnotoad@lindra.de>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231123174105.2435757-1-hypnotoad@lindra.de>
 <20231125220439.GQ3177259@scaer>
 <f0b3caa4-43ce-4f0e-a855-9726f1944644@lindra.de>
 <20231129064229.GI3177259@scaer>
 <36de4fd0-85f8-46a4-9146-05029704f458@lindra.de>
In-Reply-To: <36de4fd0-85f8-46a4-9146-05029704f458@lindra.de>
X-Rspamd-Queue-Id: 4SqMkh5mXWz9scC
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1702394444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3c6OatKUmGHN+stZkeTK0ueLHcmMDX7tQ/KITS1yeY0=;
 b=LK46+i+/lVDjpsjrffolL6k70nZFS5b4wUEgSAWx0w6KBia9CQQpZEOyKArTshMqJ2eYLe
 ifyojxfWduHY5BmKwaG9WJgjYaOHB5aThwXdF+HAaE1cmJRoHGKXJ4MygL36rNxN8WM1I9
 pSnZIUpxU3eWPAXKduyJOC5wIi1KyZGrmXtCy7C1SyCFctvBeV5ZpvSIxO1sd9vIpsgWTC
 JydbaqoI9zMiv5zAQFgOhySWJOPWlFf0+6ljCPp7TkJ3JXtAuqHDcFMTpQIM3wa1dglmzG
 9cQnziYzAF14DW6EsMTWCGNJPLsV5MWxctlGCp+VzJvDVvyBGJGhotigZ4NqzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=lindra.de header.i=@lindra.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=LK46+i+/
Subject: Re: [Buildroot] [PATCH 1/1] python-sip: fix compile error
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGVhciBhbGwsCgpoZXJlIGlzIG15IGNvbmNsdXNpb24gcmVnYXJkaW5nIHNpcDY6CgpUaGUgbGli
cmFyeSBkaXNjb250aW51ZXMgdGhlICJzaXAiIHRvb2wgdGhhdCBjb25maWd1cmUucHkgb2YgcHlx
dDUgCnNlYXJjaGVzLiBJbnN0ZWFkLCBvbmUgc2hvdWxkIHVzZSBQeVF0LWJ1aWxkZXIgKHdoaWNo
IGlzIGVhc3kgdG8gCnBhY2thZ2UpIGFuZCB0aGUgc2lwLWJ1aWxkIHRvb2wgWzFdLiBIb3dldmVy
LCB3aGVuIEkgZ2V0IGl0IHdvcmtpbmcgSSAKcnVuIGludG8gdGhlIHNhbWUgcHJvYmxlbSB3aGlj
aCBvbmNlIHdhcyBmaXhlZCBweXRob24tcHlxdDUubWs6IApzaXAtYnVpbGQgYWN0dWFsbHkgZG9l
cyBjb21waWxlIGFuZCBleGVjdXRlcyBhIHRlc3QgYmluYXJ5IGNhbGxlZCAKY2ZndGVzdF9RdENv
cmUsIHNpbWlsYXIgdG8gd2hhdCBhIGNvbmZpZ3VyZS5zaCBzY3JpcHQgZG9lcy4gVGhlIG91dHB1
dCAKZmlsZSBjZmd0ZXN0X1F0Q29yZS5vdXQgaXMgY3VycmVudGx5IGNyZWF0ZWQgYnkgYSBidWls
ZHJvb3QgaG9vayBpbiAKcHl0aG9uLXB5cXQ1Lm1rLiBXaXRoIHNpcC1idWlsZCwgYW5vdGhlciBz
b2x1dGlvbiBzZWVtcyBuZWVkZWQgYmVjYXVzZSAKc2lwLWJ1aWxkIGRlbGV0ZXMgdGhlIGZpbGUg
aW5zdGVhZCBvZiBza2lwcGluZyB0aGUgZXhlY3V0aW9uIG9mIApjZmd0ZXN0X1F0Q29yZS4gSXQg
dGhlbiB0cmllcyB0byBleGVjdXRlIGNmZ3Rlc3RfUXRDb3JlIHdoaWNoIGlzIApjb21waWxlZCBm
b3IgdGhlIHRhcmdldC4KCkkgYW0gbmVpdGhlciBhIGJ1aWxkcm9vdCBub3IgYSBweXRob24gZXhw
ZXJ0IGFuZCBkbyBub3Qga25vdyB0aGUgcHJvcGVyIAp3YXkgdG8gZW5mb3JjZSB0aGF0IHRoaXMg
aXMgZG9uZSB3aXRoIHRoZSBob3N0IGNvbXBpbGVyIGFuZCB0aGUgcmVzdCBvZiAKdGhlIGNvbXBp
bGF0aW9uIGlzIGRvbmUgZm9yIHRoZSB0YXJnZXQuIElmIHRoYXQgd291bGQgYmUgZml4ZWQsIHRo
ZW4gb25lIApjb3VsZCBwcm9iYWJseSBlYXNpbHkgYWxzbyBnZXQgcHlxdDYgdG8gcnVuLiBTbyBp
dCB3b3VsZCBiZSBnb29kIGlmIApzb21lb25lIGNvdWxkIGhhdmUgYSBsb29rIGF0IHRoaXMsIGJ1
dCBJIGNhbm5vdCBkbyB0aGF0IHNvb24uCgpCZXN0LAoKUmFsZgoKWzFdwqBodHRwczovL3d3dy5y
aXZlcmJhbmtjb21wdXRpbmcuY29tL3N0YXRpYy9Eb2NzL1B5UXQ1L2luc3RhbGxhdGlvbi5odG1s
I2J1aWxkaW5nLXB5cXQ1CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
