Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB50C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A4D140438;
	Mon,  5 Feb 2024 17:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A4D140438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFUm366TZdBj; Mon,  5 Feb 2024 17:20:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 419D140468;
	Mon,  5 Feb 2024 17:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 419D140468
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4386A1BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2979E8230F
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2979E8230F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zXVpQHFvKB6x for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:20:48 +0000 (UTC)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EC218230D
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EC218230D
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6e27401a244so2274565a34.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 09:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707153647; x=1707758447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZBY+KRuCfKsUEbCSLYqSMJencfTyCcUnyUrWdA390/s=;
 b=bGOhaMm7EDHS+WxKexNRnV8lgS23b23FVVIeXBOpPputFXvh20ytuOHx1FTkSGZAw5
 hlJzDERVMex9fFbf9MlHaTdE3E+Ug5nDTRK/UdF70GQ7h1U0uYqtjz1ZpTFFxIvdoBxi
 /swGFyM+/bx39qTFv7fS/SmSynNaBUoRFO3Rh+OorIyIuzKOuUQOKlFGl60+0k6LPAru
 yV2E3yDUmy7G21zikXFT9jFpJD9vb5JdOub9AV7M2cZWxTMg7O4GRArH2Z1Kbrh3ac21
 4uuwrNbPSdUUjFCF25oeiNqzivtTJvURft3JXEQC7vKoIIEFgm2YEJHE0W/iC+FNArdg
 3Y6Q==
X-Gm-Message-State: AOJu0YwKkWdOTrPb5GKn2rYDdB28iZbOH95hm9zsMjwiZEVdMMEgWcFM
 iJyvWP31Sx9Ncp8ftfNundbW2xld+e1McwDQeuiH7YqBtAW24E8biCC0PvQ/O9YLP0ri82t3HJ4
 SqARJWef94GWQ6I1zi0T9zl6Q4FY=
X-Google-Smtp-Source: AGHT+IFaDpqOxwYIhcB2P9jNXF4R7Tc0S4GEE5S2UCyiUlQNpsMDxdJpUjts8PLmbHZLzHVHZPH7COa+evP9LVhfkdw=
X-Received: by 2002:a05:6830:1558:b0:6dd:dd28:c711 with SMTP id
 l24-20020a056830155800b006dddd28c711mr248600otp.36.1707153647108; Mon, 05 Feb
 2024 09:20:47 -0800 (PST)
MIME-Version: 1.0
References: <170712853287.18164.6368517214119629150-0@git.sr.ht>
 <ZcDzGKRq7ORiW2Uq@landeda>
In-Reply-To: <ZcDzGKRq7ORiW2Uq@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Feb 2024 10:20:35 -0700
Message-ID: <CADvTj4qNNmZQWab2HZXrFS_ggMCsLNCp6ZHCEnnp5cO9pzbOyg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707153647; x=1707758447; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZBY+KRuCfKsUEbCSLYqSMJencfTyCcUnyUrWdA390/s=;
 b=icr5vx9+fdgkbLv44uCsWEXhCdpzi2FgSS+jihX1UqJ729G9DnOD9eB32wrE53XUM3
 IQzOK6NMBo1Gmk3EDh3h4t9PzVKxs/vMTcf6FNDdE+RANnAUUiaV1qKhACmy258C4uRj
 pHG2+i83n4dIomyZwENOwtm25iEO79ERT4oCXnBPB2kSXdRQW2c+jR0FjrEwy2p6W/1T
 ULB3Zqu/1X7ucCuwm1rhtUd79X3bOR4IeBOKXqDv46DK9cl9eaFew05gy+EQATEYh9oo
 4KLnh4bWjQrjIw8IykLQQqBI687aPmWkDdq4yF9qrG3RQJxlcWzmYMcRgHfcXC8EOFbn
 37/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=icr5vx9+
Subject: Re: [Buildroot] [PATCH buildroot] package/python-minimalmodbus: fix
 empty package
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
Cc: ~bubu <bubu@bubu1.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBGZWIgNSwgMjAyNCBhdCA3OjM54oCvQU0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gTWFyY3VzLCBBbGwsCj4KPiBPbiAyMDIzLTA5LTIx
IDIyOjM5ICswMjAwLCB+YnVidSBzcGFrZSB0aHVzbHk6Cj4gPiBGcm9tOiBNYXJjdXMgSG9mZm1h
bm4gPG1hcmN1cy5ob2ZmbWFubkBvdGhlcm1vLmRlPgo+ID4KPiA+IENhbGxpbmcgYHNldHVwLnB5
YCBidWlsZCBidWlsZHMgYW5kIGluc3RhbGxzICBhbiBlbXB0eSBwYWNrYWdlCj4gPiBhZnRlciB1
cHN0cmVhbSBjaGFuZ2VkIHRoZWlyIHBhY2thZ2luZy4gQ2FsbGluZyBzZXR1cHRvb2xzIHZpYQo+
ID4gYHB5dGhvbiAtbSBidWlsZGAgYnVpbGRzIHRoZSBwYWNrYWdlIGNvcnJlY3RseS4KPgo+IEFw
cGxpZWQgdG8gbWFzdGVyLCBhZnRlciBmaXhpbmcgdGhlIGF1dGhyb3NoaXAgYW5kIFNvYiBhcyB3
ZSBkaXNjdXNzZWQKPiBJUkwsIHRoYW5rcy4KCkZZSSB3ZSBzaG91bGQgYmUgYWJsZSB0byByZXZl
cnQgdGhpcyBvbmNlIHdlIG1pZ3JhdGUgc2V0dXB0b29scyBpbmZyYXN0cnVjdHVyZQp0byBwZXA1
MTc6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gv
MjAyMzExMjYxODA4NDAuMjA4MTk0NS01LWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCgo+Cj4g
UmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3B5dGhvbi1t
aW5pbWFsbW9kYnVzL3B5dGhvbi1taW5pbWFsbW9kYnVzLm1rIHwgMyArKy0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcHl0aG9uLW1pbmltYWxtb2RidXMvcHl0aG9uLW1pbmltYWxtb2RidXMubWsg
Yi9wYWNrYWdlL3B5dGhvbi1taW5pbWFsbW9kYnVzL3B5dGhvbi1taW5pbWFsbW9kYnVzLm1rCj4g
PiBpbmRleCA1YTZlNzczM2JlLi5jYjhhMGQ4Y2M5IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9w
eXRob24tbWluaW1hbG1vZGJ1cy9weXRob24tbWluaW1hbG1vZGJ1cy5tawo+ID4gKysrIGIvcGFj
a2FnZS9weXRob24tbWluaW1hbG1vZGJ1cy9weXRob24tbWluaW1hbG1vZGJ1cy5tawo+ID4gQEAg
LTcsNyArNyw4IEBACj4gPiAgUFlUSE9OX01JTklNQUxNT0RCVVNfVkVSU0lPTiA9IDIuMS4xCj4g
PiAgUFlUSE9OX01JTklNQUxNT0RCVVNfU09VUkNFID0gbWluaW1hbG1vZGJ1cy0kKFBZVEhPTl9N
SU5JTUFMTU9EQlVTX1ZFUlNJT04pLnRhci5nego+ID4gIFBZVEhPTl9NSU5JTUFMTU9EQlVTX1NJ
VEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMzcvZmMvOGE1OGY3
YmNkZWNlNzUxZjE2YTRhOWFhYzc4MGFjZDEyODhhYThhYzZhZGJmZmRkNzY0Yzg4ZmI3MWM2Cj4g
PiAtUFlUSE9OX01JTklNQUxNT0RCVVNfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiA+ICtQWVRI
T05fTUlOSU1BTE1PREJVU19ERVBFTkRFTkNJRVMgPSBob3N0LXB5dGhvbi1zZXR1cHRvb2xzCj4g
PiArUFlUSE9OX01JTklNQUxNT0RCVVNfU0VUVVBfVFlQRSA9IHBlcDUxNwo+ID4gIFBZVEhPTl9N
SU5JTUFMTU9EQlVTX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCj4gPiAgUFlUSE9OX01JTklNQUxNT0RC
VVNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiA+Cj4gPiAtLQo+ID4gMi4zOC41Cj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06
ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jp
bi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNw
aXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
