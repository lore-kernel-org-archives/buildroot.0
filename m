Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1112BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0CA260908;
	Sat,  8 Jan 2022 10:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xA9i756LSC6i; Sat,  8 Jan 2022 10:09:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 316FC60760;
	Sat,  8 Jan 2022 10:09:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63F1F1BF84C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C4F28174C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EPylHxtoBs1v for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:09:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B51BE81699
 for <buildroot@busybox.net>; Sat,  8 Jan 2022 10:09:42 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01BB48AE;
 Sat,  8 Jan 2022 11:09:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1641636578;
 bh=NvetL/kTTbEDiRTb65NO+YlFBsOWZ5EoSkJtTmPkWFg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=buHZi97LFQzh+Dpw3ntcsJdZwaRtuR9BEY/6l67bknLyQZAXCRuyvrhKtE4bZBCsK
 lWZGFTdESmUc4fVCoZcne2KBAOLxwhuBaHGWY/sZrTDPl27T25D0b7WkkSbf5AIjeS
 wDfHWBI+5b+rQmVQDkXc+uMxtPrjGF327zGuHFsE=
To: Arnout Vandecappelle <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, guillaume.bressaix@gmail.com
References: <20211206193109.21218-1-guillaume.bressaix@gmail.com>
 <20211206215730.GE2603@scaer>
 <cae0c1b2-34bb-b1a9-f02a-9e98ddd9fbe5@ideasonboard.com>
 <7605fae5-42db-115c-e87a-0dbc3597a99a@mind.be>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <b6cec89f-8d87-e2ee-eb42-221134575645@ideasonboard.com>
Date: Sat, 8 Jan 2022 12:09:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7605fae5-42db-115c-e87a-0dbc3597a99a@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-pybind: fix upgrade
 to version 2.6.1
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDcvMDEvMjAyMiAyMzo0OSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gCj4gCj4g
T24gMDMvMDEvMjAyMiAwOToyNCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+IEhpLAo+Pgo+PiBP
biAwNi8xMi8yMDIxIDIzOjU3LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+Pgo+Pj4gU28gSSB0aGlu
ayB3ZSByZWFsbHksIHJlYWxseSBuZWVkIGEgcGFja2FnZSAobGlrZSBzY2lweSkgdGhhdCBhY3R1
YWxseQo+Pj4gbWFrZXMgdXNlIG9mIHB5YmluZCwgc28gd2UgY2FuIHNlZSBob3cgaXQgd29ya3Ms
IGFuZCB0byBmaXggaXQuLi4KPj4KPj4gSmZ5aSwgdGhlcmUgYXJlIHR3byByZWxhdGl2ZWx5IHNp
bXBsZSBwYWNrYWdlcyBpbiBidWlsZHJvb3QgdGhhdCBjYW4gCj4+IHVzZSBweWJpbmQ6IGttc3h4
IGFuZCByd21lbS4gQm90aCB1c2UgbWVzb24gZm9yIGJ1aWxkaW5nLgo+Pgo+PiBJIGNhbiB0ZXN0
IHRoZSBuZXh0IHZlcnNpb24gb2YgdGhpcyBzZXJpZXMgd2l0aCB0aG9zZSBwYWNrYWdlcy4KPiAK
PiAgwqBJIHRyaWVkIHRvIGRvIHRoYXQuIFVuZm9ydHVuYXRlbHksIGl0IHR1cm5zIG91dCB0aGF0
IGJvdGggb2YgdGhvc2UgCj4gcGFja2FnZXMgdXNlIHRoZSBDTWFrZSB3YXkgb2YgZmluZGluZyB0
aGUgcHliaW5kMTEgZGVwZW5kZW5jeSwgYW5kIAo+IGFwcGFyZW50bHkgb3VyIGNyb3NzLWNvbXBp
bGF0aW9uLmNvbmYgZG9lc24ndCBzdXBwb3J0IGNtYWtlIHlldC4uLiBTbyAKPiBpdCdzIG5vdCB0
aGF0IHRyaXZpYWwuCgpZZXMsIEkgaGFkIGEgbG9vayBhdCB0aGlzIGFsc28uIGttc3h4IGFuZCBy
d21lbSB1c2UgdGhlIHBsYWluIG1lc29uIApkZXBlbmRlbmN5KCkgdG8gZmluZCB0aGUgcGFja2Fn
ZS4gV29ya3Mgb24gVWJ1bnR1LCBhcyBVYnVudHUncyBweWJpbmQxMSAKaW5zdGFsbHMgdGhlIGNt
YWtlIGZpbGVzLgoKSSBzdGFydGVkIHRlc3Rpbmcgd2l0aCBhIG1vcmUgbWFudWFsIGFwcHJvYWNo
IHRvIGZpbmRpbmcgcHliaW5kMTEsIGJ1dCAKZGlkbid0IGdldCBpdCB3b3JraW5nIHlldC4KCiAg
VG9taQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
