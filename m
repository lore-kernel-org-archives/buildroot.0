Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A80C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 12:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF0561195;
	Tue,  9 Jan 2024 12:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EF0561195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLQGDXFzXhZI; Tue,  9 Jan 2024 12:52:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8138D613F3;
	Tue,  9 Jan 2024 12:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8138D613F3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21BDE1BF616
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 12:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF819417E4
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 12:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF819417E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QMCSc_sOvdif for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 12:51:51 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3050B417DA
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 12:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3050B417DA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 629F520007;
 Tue,  9 Jan 2024 12:51:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNBa9-007T1A-07;
 Tue, 09 Jan 2024 13:51:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
 <20231203041841.492885-3-adam.duskett@amarulasolutions.com>
 <20231223222225.601aad4b@windsurf>
Date: Tue, 09 Jan 2024 13:51:48 +0100
In-Reply-To: <20231223222225.601aad4b@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 23 Dec 2023 22:22:25 +0100")
Message-ID: <87wmsiacuz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/6] package/google-breakpad: fix building
 on newer systems
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Pascal Huerst <pascal.huerst@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gT24gU2F0LCAgMiBEZWMgMjAyMyAyMToxODoz
NiAtMDcwMAogPiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25zLmNv
bT4gd3JvdGU6CgogPj4gRml4ZXMgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuIGJ1aWxkaW5nIGFn
YWluc3QgRmVkb3JhIDM5OgogPj4g4oCYdWludHB0cl904oCZIGlzIGRlZmluZWQgaW4gaGVhZGVy
IOKAmDxjc3RkaW50PuKAmTsgZGlkIHlvdSBmb3JnZXQgdG8KID4+IOKAmCNpbmNsdWRlIDxjc3Rk
aW50PuKAmT8KID4+IAogPj4gU2lnbmVkLW9mZi1ieTogQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tl
dHRAYW1hcnVsYXNvbHV0aW9ucy5jb20+CiA+PiAtLS0KID4+IC4uLmFkZC1jc3RkaW50LXRvLW1p
bmlkdW1wX2Rlc2NyaXB0b3IuaC5wYXRjaCB8IDMyICsrKysrKysrKysrKysrKysrKysKID4+IDEg
ZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCiA+PiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwMS1hZGQtY3N0ZGludC10by1taW5pZHVtcF9kZXNjcmlw
dG9yLmgucGF0Y2gKCiA+IEkndmUgYXBwbGllZCwgYnV0IGFmdGVyIGJhY2twb3J0aW5nIGluc3Rl
YWQgdGhlIHVwc3RyZWFtIGNvbW1pdCwgYW5kCiA+IGFkZGluZyBhIHJlZmVyZW5jZSB0byB0aGUg
YXV0b2J1aWxkZXIgZmFpbHVyZSBiZWluZyBmaXhlZCBieSB0aGlzCiA+IHBhdGNoLiBUaGFua3Mh
CgpDb21taXR0ZWQgdG8gMjAyMy4wMi54IGFuZCAyMDIzLjExLngsIHRoYW5rcy4KCi0tIApCeWUs
IFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
