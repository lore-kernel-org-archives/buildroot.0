Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521B9CA0FFC
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 08:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9865B60E5F;
	Sat,  2 Sep 2023 08:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9865B60E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3PBDciWNBwRt; Sat,  2 Sep 2023 08:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D12B360E32;
	Sat,  2 Sep 2023 08:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D12B360E32
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4804B1BF41B
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 08:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1574C60E32
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 08:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1574C60E32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sWJqLo-50CA1 for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 08:24:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDE8660E13
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 08:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDE8660E13
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA2ECC0002;
 Sat,  2 Sep 2023 08:24:41 +0000 (UTC)
Date: Sat, 2 Sep 2023 10:24:40 +0200
To: =?UTF-8?B?S8O2cnk=?= Maincent via buildroot <buildroot@buildroot.org>
Message-ID: <20230902102440.3d9a22b3@windsurf>
In-Reply-To: <20230831081517.546751-1-kory.maincent@bootlin.com>
References: <20230831081517.546751-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693643082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0bpL6fnDY84BRSSiFlKKAZYinfGT14oX4GGEKUlP/+w=;
 b=RhdyUJMtFORA8FqYtsHi59yPxiIda8KK7uU9baapwhR/FDN/xoxoQOlxVBgmsRPpWjZR5I
 0qjVv40K19qiMsVRlGxBgqdQsJTnOHGBfjYyty4RDTtkH++vLOUHBNIIjr93fAYnrtQO3H
 d6XW3vSZxqChDpBRrmvyPKOXHyHWBjKSQkPm5vT6eDEoV2jEgVguL46tQ/MUM25vMWX6xQ
 kbZrNlssrcJUNgXydxU9yjP10XKhN4aTMrj6JtyufP18MvMCF7/P6ZwRTmODX15+LN7pOB
 lwxEEbLibeCYXZJRQQTYmdf4ERhjqtJuv49ygb/UpZAnV6cJ/AwPKHYjmFMs8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RhdyUJMt
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: Add new option for
 Marvell prestera firmware
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
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Jens Kleintje <scooby22@web.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gS8O2cnksCgpPbiBUaHUsIDMxIEF1ZyAyMDIzIDEwOjE1OjE2ICswMjAwCkvDtnJ5IE1h
aW5jZW50IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4g
RnJvbTogS29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KPiAKPiBBZGQg
dGhlIE1hcnZlbGwgcHJlc3RlcmEgZXRoZXJuZXQgY2FyZHMgZmlybXdhcmVzLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+Cj4gLS0t
Cj4gIHBhY2thZ2UvbGludXgtZmlybXdhcmUvQ29uZmlnLmluICAgICAgICAgfCA1ICsrKysrCj4g
IHBhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsgfCA1ICsrKysrCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29uZmln
LmluCj4gaW5kZXggM2FlNzI1NjRjYy4uNDAyZTc1Yzg5MCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUv
Q29uZmlnLmluCj4gQEAgLTUxMyw2ICs1MTMsMTEgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVY
X0ZJUk1XQVJFX1JUTF84MTY5Cj4gIAloZWxwCj4gIAkgIEZpcm13YXJlIGZpbGVzIGZvciBSZWFs
dGVrIDgxNjkgZ2lnYWJpdCBldGhlcm5ldCBjYXJkcwo+ICAKPiArY29uZmlnIEJSMl9QQUNLQUdF
X0xJTlVYX0ZJUk1XQVJFX01BUlZFTExfUFJFU1RFUkEKPiArCWJvb2wgIk1hcnZlbGwgUHJlc3Rl
cmEiCj4gKwloZWxwCj4gKwkgIEZpcm13YXJlIGZpbGVzIGZvciBNYXJ2ZWxsIFByZXN0ZXJhIGV0
aGVybmV0IGNhcmRzCj4gKwoKQWxwaGFiZXRpYyBvcmRlcmluZyBoZXJlIHdhcyBub3QgY29ycmVj
dCBzbyBJIGZpeGVkIHRoYXQgdXAuCgo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1X
QVJFX01BUlZFTExfUFJFU1RFUkEpLHkpCj4gK0xJTlVYX0ZJUk1XQVJFX0ZJTEVTICs9IFwKPiAr
CW1ydmwvcHJlc3RlcmEvbXZzd19wcmVzdGVyYV9mdyouaW1nCgpZb3UgZm9yZ290IHRoZSBsaWNl
bnNlIGZpbGUgaGVyZSwgYW5kIGFkZGluZyBpdHMgaGFzaC4gSSBmaXhlZCB0aGF0IHVwCmFzIHdl
bGwuCgpPbmUgdGhpbmcgSSB3b25kZXJlZCBpczoKCi1ydy1yLS1yLS0uIDEgdGhvbWFzIHRob21h
cyAxN00gIDQgYW/Du3QgIDEyOjMzIG12c3dfcHJlc3RlcmFfZndfYXJtNjQtdjQuMS5pbWcKLXJ3
eHIteHIteC4gMSB0aG9tYXMgdGhvbWFzIDE0TSAgNCBhb8O7dCAgMTI6MzMgbXZzd19wcmVzdGVy
YV9mdy12Mi4wLmltZwotcnd4ci14ci14LiAxIHRob21hcyB0aG9tYXMgMTRNICA0IGFvw7t0ICAx
MjozMyBtdnN3X3ByZXN0ZXJhX2Z3LXYzLjAuaW1nCi1ydy1yLS1yLS0uIDEgdGhvbWFzIHRob21h
cyAxNU0gIDQgYW/Du3QgIDEyOjMzIG12c3dfcHJlc3RlcmFfZnctdjQuMC5pbWcKLXJ3LXItLXIt
LS4gMSB0aG9tYXMgdGhvbWFzIDE1TSAgNCBhb8O7dCAgMTI6MzMgbXZzd19wcmVzdGVyYV9mdy12
NC4xLmltZwoKaS5lLCBlYWNoIEZXIGZpbGUgaXMgfjE1IE1CLCBidXQgb25seSBvbmUgd2lsbCBh
Y3R1YWxseSBiZSBsb2FkZWQgYnkKdGhlIGRyaXZlci4gTm90IHN1cmUgaWYgdGhpcyB3YXJyYW50
cyBhIENvbmZpZy5pbiBmb3IgZWFjaCBGVyB2ZXJzaW9uLApvciBpZiB3ZSBqdXN0IGxldCBwZW9w
bGUgcmVtb3ZlIHRoZSBmaXJtd2FyZSBmaWxlcyB0aGV5IGRvbid0IHVzZSBpbiBhCnBvc3QtYnVp
bGQgc2NyaXB0LgoKQW55d2F5LCBJIGFwcGxpZWQgeW91ciBwYXRjaCB0byBuZXh0LCB3aXRoIHRo
ZSBmaXhlcyBkZXNjcmliZWQgYWJvdmUuCgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRh
enpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
