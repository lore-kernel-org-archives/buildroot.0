Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5E5C433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 06:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1601A60FD7;
	Tue, 18 Oct 2022 06:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1601A60FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bfe5sY6pjapW; Tue, 18 Oct 2022 06:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5431B60FB7;
	Tue, 18 Oct 2022 06:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5431B60FB7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9424C1BF35F
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 06:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78E8D417AC
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 06:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78E8D417AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJAJEvUwGawU for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 06:59:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B628F417BA
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B628F417BA
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 06:59:48 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EC8DC240007;
 Tue, 18 Oct 2022 06:59:44 +0000 (UTC)
Date: Tue, 18 Oct 2022 08:59:43 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20221018085943.104f227f@booty>
In-Reply-To: <20221017211048.43d2394c@gmx.net>
References: <20221017073953.510219-1-luca.ceresoli@bootlin.com>
 <20221017211048.43d2394c@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666076386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZZSgeKLtelGat08WxLSDOuefXzc7k/mbjD0GlwE+0g=;
 b=bOyf7t8r2YZl/PKUBEx8P3Po/aMFg4qc2+AZJYSVqnWdd65mHJ6acm5hvA8MoSx1VLD6FZ
 IX6XC0D1Kib5pdBw1ypD+9S05O4rzeaZSK40AwnK0qINHfa7OGmaawfQ53Cy+cDiPG8HWa
 Ty0J+NsNyqKLrx02M9l2vkIEylexAw3l6MvW8kgreZ7+yRK5xh/P4g96TYNOCHlQ/NnRVS
 nbo232W4i9yEpWpL7Z8S310jftnRLPO0lngsSm9zKQ4TeVlfLnhuH9kdMOsjCahMGEFVqm
 azp9YDQ4AVwHQs1AIRY38/BlU2pBIigidfmfLEMjhf+2TvstGGxSJ61ydVUSFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bOyf7t8r
Subject: Re: [Buildroot] [PATCH] rtl8188eu: remove package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Luca Ceresoli via buildroot <buildroot@buildroot.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 TIAN Yuanhao <tianyuanhao3@163.com>,
 William =?UTF-8?Q?Wennerstr=C3=B6m?= <william@willeponken.me>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsIEdpdWxpbywgUGV0ciwKClRoYW5rIHlvdSBhbGwgZm9yIHRoZSBmZWVkYmFjayAt
LSBJIHNlZSBteSBwYXRjaCB3b3JrZWQgZWZmZWN0aXZlbHkgOikKCllvdSBhbGwgc2VlbSB0byBr
bm93IHdheSBtb3JlIHRoYW4gSSBkbywgd2hpY2ggaXMgbm90IHN1cnByaXNpbmcgYXMgSSdtIG5v
dAphY3RpdmVseSB1c2luZyB0aGlzIHBhY2thZ2UgYW55bW9yZS4KCk9uIE1vbiwgMTcgT2N0IDIw
MjIgMjE6MTA6NDggKzAyMDAKUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PiB3cm90
ZToKCj4gSGVsbG8gTHVjYSwgKiwKPiAKPiBPbiBNb24sIDE3IE9jdCAyMDIyIDA5OjM5OjUzICsw
MjAwLCBMdWNhIENlcmVzb2xpIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
PiB3cm90ZToKPiAKPiA+IEZyb206IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxp
bi5jb20+Cj4gPiAKPiA+IFRoaXMgcGFja2FnZSBmYWlscyBidWlsZGluZyB3aXRoIGEga2VybmVs
ID49IDYuMCBbMF0gZHVlIHRvIGludGVybmFsIEFQSQo+ID4gY2hhbmdlcyBbMV06Cj4gPiAKPiA+
ICAgLi4uL2lvY3RsX2NmZzgwMjExLmM6IEluIGZ1bmN0aW9uIOKAmHJ0d19jZmc4MDIxMV9pbmRp
Y2F0ZV9jb25uZWN04oCZOgo+ID4gICAuLi5pb2N0bF9jZmc4MDIxMS5jOjcwOToxMjogZXJyb3I6
IOKAmHN0cnVjdCBjZmc4MDIxMV9yb2FtX2luZm/igJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhj
aGFubmVs4oCZCj4gPiAgIDcwOSB8ICAgcm9hbV9pbmZvLmNoYW5uZWwgPSBub3RpZnlfY2hhbm5l
bDsKPiA+ICAgICAgIHwgICAgICAgICAgICBeCj4gPiAgIC4uLmlvY3RsX2NmZzgwMjExLmM6NzEw
OjEyOiBlcnJvcjog4oCYc3RydWN0IGNmZzgwMjExX3JvYW1faW5mb+KAmSBoYXMgbm8gbWVtYmVy
IG5hbWVkIOKAmGJzc2lk4oCZCj4gPiAgIDcxMCB8ICAgcm9hbV9pbmZvLmJzc2lkID0gY3VyX25l
dHdvcmstPm5ldHdvcmsuTWFjQWRkcmVzczsKPiA+ICAgICAgIHwgICAgICAgICAgICBeCj4gPiAK
PiA+IFRoZXJlIGlzIGN1cnJlbnRseSBubyBmaXggaW4gdGhlIGdpdGh1YiByZXBvc2l0b3J5LCBh
bmQgaXQncyBwcm9iYWJseSBub3QKPiA+IHdvcnRoIGZpeGluZyBiZWNhdXNlLCBhcyB0aGUgQ29u
ZmlnLmluIGhlbHAgdGV4dCBzdGF0ZXM6Cj4gPiAKPiA+ICAgVGhpcyBpcyBuZWVkZWQgb25seSBm
b3IgTGludXgga2VybmVscyBiZWZvcmUgMy4xMi4KPiA+ICAgU2luY2UgMy4xMiwgdGhlcmUgaXMg
YSAoc3RhZ2luZykgZHJpdmVyIGluIG1haW5saW5lLCB3aXRoIGEKPiA+ICAgc2ltaWxhciBjb2Rl
YmFzZS4gIAo+IAo+IERlc3BpdGUgdGhlIGJ1aWxkcm9vdCBoZWxwIHRleHQgdGhlIHJ0bDgxODhl
dSBjb2RlIGJhc2UgaXMgc3RpbGwgbWFpbnRhaW5lZAo+IHNlZSBlLmcuICdydGw4MTg4ZXU6IEZp
eCBidWlsZHMgZm9yIGtlcm5lbCA2LjAgJyhbMl0pIGFuZCB0aGUgdmFyaW91cyBmb3Jrcy91cHN0
cmVhbQo+IHZlcnNpb25zIHRlbmQgdG8gc3VwcG9ydCBkaWZmZXJlbnQgZmVhdHVyZSBzZXRzIHJl
Z2FyZGluZyBJQlNTIGFuZC9vciBtb25pdG9yCj4gbW9kZSBldGMuIC0gbm90IHN1cmUgYWJvdXQg
dGhpcyBvbmUgYnV0IHZhbGlkIGZvciBzb21lIG90aGVyIHJ0bHh4eHggb25lcyksCgpHb29kIHRv
IGtub3chIFdoeSBub3QgYWRkaW5nIHRoaXMgaW5mbyB0byBDb25maWcuaW4gdG9vPyBJdCB3b3Vs
ZCBhdm9pZApvdGhlcnMgdHJ5aW5nIHRvIHJlbW92ZSB0aGUgcGFja2FnZSBhZ2Fpbi4KCi0tIApM
dWNhIENlcmVzb2xpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
