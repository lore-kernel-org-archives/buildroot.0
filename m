Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD61C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:50:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF3F861186
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF3F861186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7D3840394;
	Tue,  9 Nov 2021 08:50:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9oRF4ljiP7x1; Tue,  9 Nov 2021 08:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2481940184;
	Tue,  9 Nov 2021 08:50:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AB641BF3B9
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AAC980BDD
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=walle.cc
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sohUrI6ZzgCa for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 08:50:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 806AC80BB6
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 08:50:17 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id EA3C422234;
 Tue,  9 Nov 2021 09:50:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636447815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CnbdJgBhf9MwChpKQRHJhCmMFpe+Wa8VHCWu21fFyck=;
 b=nyQf3D50AfjhDiAnLx9SFTsMLPyVaik+HypW/4lVJjCxethMIS9TTHjYYbHcTGrUlrmcJs
 c0vXB7/rFz55TH1wKfOzDlFpJ5SQ1ElfkdtO9AOZJ5seP96f1Zvq61TRIXRB3GZ3EVLUx+
 rYWNoNA/iD2ki71slCYAupcp51puFi4=
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 09:50:14 +0100
From: Michael Walle <michael@walle.cc>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <B4721363-6522-40D2-AA25-B015E2BD5C43@benettiengineering.com>
References: <eea83befc9a6f40dad4efa7a4ae019de@walle.cc>
 <B4721363-6522-40D2-AA25-B015E2BD5C43@benettiengineering.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <c474197dec6f55dbf2c286c20feeed61@walle.cc>
X-Sender: michael@walle.cc
Subject: Re: [Buildroot] [PATCH 7/7] board/kontron/smarc-sal28/genimage.cfg:
 fix option suffix
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?Q?Micha=C5=82_=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org, Luca Ceresoli <luca@lucaceresoli.net>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMjAyMS0xMS0wOSAwOTozOCwgc2NocmllYiBHaXVsaW8gQmVuZXR0aToKPiBIaSBNaWNoYWVs
LCBBbGwsCj4gCj4+IElsIGdpb3JubyA5IG5vdiAyMDIxLCBhbGxlIG9yZSAwOTowNSwgTWljaGFl
bCBXYWxsZQo+PiA8bWljaGFlbEB3YWxsZS5jYz4gaGEgc2NyaXR0bzoKPiAKPj4g77u/QW0gMjAy
MS0xMS0wOSAwMDowNSwgc2NocmllYiBHaXVsaW8gQmVuZXR0aToKPj4gCj4+PiBPcHRpb24gJ29m
ZnNldCA9IDRrJyBtdXN0IGJlICdvcHRpb24gPSA0SycuCj4+IAo+PiBXaHkgaXMgdGhpcyBpcyBh
ICdtdXN0Jz8gQXBwYXJlbnRseSBpdCB3b3Jrcywgbm8/Cj4gCj4gVGhpcyBpcyBhIHN0YW5kYXJk
IEnigJl2ZSBwcm9wb3NlZCBhbmQgaXTigJlzIGJlZW4gYWNjZXB0ZWQgYnkKPiBjb21taXR0aW5n
IGFsbCB0aGUgMTAyIHBhdGNoZXMuCj4gVGhlcmUgaXMgbm90IGFuIGV4aXN0aW5nIHN0YW5kYXJk
IGFuZCBJ4oCZdmUgY3JlYXRlZCBvbmUsIHRoYXTigJlzCj4gYWxsLgo+IAo+PiBTbyBpZiBhbnl0
aGluZwo+PiBpdCBpcyBmb3IgdW5pZnlpbmc7IGJ1dCBldmVuIHRoZW4gaXQncyBtb3ZpbmcgaW4g
dGhlIHdyb25nCj4+IGRpcmVjdGlvbi4gVGhlcmUgaXMgbm8gIksiIHByZWZpeCBpbiBzaSB1bml0
cy4gU3RpY3RseSBzcGVha2luZwo+PiB0aGVyZSBpcyBubyAiS0IiOyB0aGVyZSBpcyBhICJrQiIg
b3IgYSAiS2lCIi4KPiAKPiBIZXJlIHdlIGhhZCAyIGNob2ljZXMgdXNpbmcgZ2VuaW1hZ2Ug4oCc
S+KAnSBvciDigJxr4oCdLiBJIHdlbnQgZm9yCj4g4oCcS+KAnSBzaW5jZSB0aGUgbW9zdCBvZiB0
aGUgZmlsZXMgaGFkIOKAnEvigJ0uCj4gQW5kIGFueXdheSBib3RoIOKAnEvigJ0gYW5kIOKAnGvi
gJ0gYXJlIG5vdCB0aGF0IGdvb2QsIGJ1dCBpdOKAmXMgbm90Cj4gb3VyIGZhdWx0LCBpdCBkZXBl
bmRzIG9uIGdlbmltYWdlIGlucHV0IGZvcm1hdC4KPiAKPiBZYW5uIGFscmVhZHkgZXhwbGFpbmVk
IHRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIG5vdGF0aW9ucyBoZXJlOgo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjEtTm92ZW1iZXIvNjI3ODg1Lmh0
bWwKPiAKPiBZb3UgY2FuIGZvbGxvdy11cCB0aGUgdGhyZWFkIGFuZCB0aGUgbW90aXZhdGlvbnMg
b24gc3VjaCB0aGluZy4KClRoYW5rcyBmb3IgdGhlIHBvaW50ZXIsIGJ1dCBJIHdvbid0IG1ha2Ug
YSBmdXp6LiBJJ20gZmluZSB3aXRoCnRoZSBjaGFuZ2UuCgotbWljaGFlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
