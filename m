Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC76C3DA42
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 17:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90F67412EC;
	Tue,  9 Jul 2024 17:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qeo-Kk5Y3DQD; Tue,  9 Jul 2024 17:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72BD74131C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72BD74131C;
	Tue,  9 Jul 2024 17:06:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9E81BF852
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 17:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C3CE60859
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 17:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0JHGM5yORg7 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 17:06:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9B3F607EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9B3F607EC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9B3F607EC
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 17:06:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 222791C0002;
 Tue,  9 Jul 2024 17:06:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sREIj-006vAA-1Z;
 Tue, 09 Jul 2024 19:06:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240702133655.2425922-1-dario.binacchi@amarulasolutions.com>
 <20240702133655.2425922-2-dario.binacchi@amarulasolutions.com>
Date: Tue, 09 Jul 2024 19:06:49 +0200
In-Reply-To: <20240702133655.2425922-2-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Tue, 2 Jul 2024 15:36:55 +0200")
Message-ID: <87msmqjxzq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/libmad: drop GCC's
 "-fforce-mem" option
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
bHV0aW9ucy5jb20+IHdyaXRlczoKCiA+IFRoZSBjb21taXQgZml4ZXMgdGhlIGZvbGxvd2luZyBj
b21waWxhdGlvbiBlcnJvcjoKID4gICAgIGk2ODYtYnVpbGRyb290LWxpbnV4LWdudS1nY2MuYnJf
cmVhbDogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kLWxpbmUgb3B0aW9uIOKAmC1mZm9yY2Ut
bWVt4oCZCgogPiBGcm9tIEdDQyA0LjMgcmVsZWFzZSBub3RlcyBbMV06CgogPiAgICAgVGhlIC1m
Zm9yY2UtbWVtIG9wdGlvbiBoYXMgYmVlbiByZW1vdmVkIGJlY2F1c2UgaXQgaGFzIGhhZCBubyBl
ZmZlY3QKID4gICAgIGluIHRoZSBsYXN0IGZldyBHQ0MgcmVsZWFzZXMuCgogPiBbMV0gaHR0cHM6
Ly9nY2MuZ251Lm9yZy9nY2MtNC4zL2NoYW5nZXMuaHRtbAogPiBTaWduZWQtb2ZmLWJ5OiBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CgpDb21taXR0
ZWQgdG8gMjAyNC4wMi54IGFuZCAyMDI0LjA1LngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtv
cnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
