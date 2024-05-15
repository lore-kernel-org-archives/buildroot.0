Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73ADC25B7A
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 13:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6560180C22;
	Wed, 15 May 2024 13:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFhWITW9haog; Wed, 15 May 2024 13:24:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64C1A80D5A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64C1A80D5A;
	Wed, 15 May 2024 13:24:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 553B21BF2C2
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 13:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97F0680C22
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 13:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ni1MogOf_oz1 for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 13:24:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81F9680D20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81F9680D20
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81F9680D20
 for <buildroot@buildroot.org>; Wed, 15 May 2024 13:24:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C2131BF216;
 Wed, 15 May 2024 13:24:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s7Eby-001DEd-1e;
 Wed, 15 May 2024 15:24:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240424195943.527542-1-romain.naour@smile.fr>
 <cf8d7018-75b3-4446-b452-aca634733d2a@smile.fr>
Date: Wed, 15 May 2024 15:24:02 +0200
In-Reply-To: <cf8d7018-75b3-4446-b452-aca634733d2a@smile.fr> (Romain Naour's
 message of "Tue, 30 Apr 2024 23:41:14 +0200")
Message-ID: <87y18bqkct.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/testing: TestATFAllwinner: add
 missing openssl dependency
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

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdy
aXRlczoKCiA+IExlIDI0LzA0LzIwMjQgw6AgMjE6NTksIFJvbWFpbiBOYW91ciBhIMOpY3JpdMKg
OgogPj4gVGhlIGNvbW1pdCBbMV0gdXBkYXRlZCB0aGUgdS1ib290IHZlcnNpb24gd2l0aCB0aGUg
b25lIHVzZWQgYnkKID4+IG9yYW5nZXBpX3plcm9fcGx1czJfZGVmY29uZmlnIGJ1dCB0aGUgZGVw
ZW5kZW5jeSBvbiBvcGVuc3NsCiA+PiB3YXMgZm9yZ290dGVuLgogPj4gCiA+PiBGaXhlczoKID4+
IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjcwMzIy
MTg2OAogPj4gCiA+PiBbMV0gZWIxNjE0OGRkZGM2YmUzOWIwZDg1MDE4MWMyNDYxZmRhYmExZWU2
ZgogPj4gCiA+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWls
ZS5mcj4KCkNvbW1pdHRlZCB0byAyMDI0LjAyLngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtv
cnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
