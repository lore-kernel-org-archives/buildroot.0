Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F86EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 09:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 843F3409DD;
	Sat, 22 Jul 2023 09:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 843F3409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2uLHye-DbvlP; Sat, 22 Jul 2023 09:48:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50B57409AC;
	Sat, 22 Jul 2023 09:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50B57409AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 440EF1BF37C
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 09:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D5D7401C9
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 09:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D5D7401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AMhMoYbfkr_3 for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 09:48:54 +0000 (UTC)
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CC1940012
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 09:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CC1940012
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1b06a46e1a9so2113050fac.2
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 02:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690019333; x=1690624133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=imaQ8TPpNaLcpsYpXtfZcPveLT0VE5qL4B+Rwta6aU8=;
 b=hSTqUc0fdZiP9MMN5ZXtA/yZ19g4iCrq5/9fuwnjwIcjQQ7d3YyiOhRaH2Ya7XyBcu
 f3iWoWktUpzQYx1lPXS53q1F+XtL7D11JEXIgFaOsuyeLoCP7TV4SqcryF6IzBuNNw91
 zVEBiSwg8DLdetuRb4JbqAEaVTzFs/5kTcVrQ6AKT03uykTY5hLwJLVkbXApPx+Xxzw+
 P5M1RopTGZ6RKKUrGHt4l661lejmRLIFQfu9PsVUgLGP28ExKg5ldCRjKG1pkXiGvfJj
 MrHRUc/aAxV6gJnxkGqPoV0pzl3SA/IyKG/fMZ1rW96eDbzt25JiZhIXwDDoP9mI2lV0
 aFTw==
X-Gm-Message-State: ABy/qLaiFTNmLvt4nTVZOQs41MCe8mpk4deqKoY88lqfbHrbSekc+fsn
 NbyiEqvSv9WaBKYbbJzuYzcEEzQCfeTVJ40ORYSlpXroFD8=
X-Google-Smtp-Source: APBJJlHohk/0D2yEoNQHHXeL7/gqzKXcHxPvAUGTrSrJRGO2UhufkqFPdt42pQop5uTtOVgofPjsjWea9cd2HEu+cGQ=
X-Received: by 2002:a05:6871:554:b0:1b0:21ef:6e1a with SMTP id
 t20-20020a056871055400b001b021ef6e1amr4600353oal.40.1690019333003; Sat, 22
 Jul 2023 02:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLWrZ-zemgtEsJKLJXeA7tiaPCHeR4wZGT01_e0+bkCS0pjuA@mail.gmail.com>
In-Reply-To: <CAOLWrZ-zemgtEsJKLJXeA7tiaPCHeR4wZGT01_e0+bkCS0pjuA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 22 Jul 2023 03:48:40 -0600
Message-ID: <CADvTj4oRw=YOWqW5CsAKCrfCng_fu+ED5KfUfMCju_=oGhBbgg@mail.gmail.com>
To: Andreas <andreasembbuild@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690019333; x=1690624133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=imaQ8TPpNaLcpsYpXtfZcPveLT0VE5qL4B+Rwta6aU8=;
 b=RL1Hr3nMLxKQFskB2ChLf7bQfDqBhFJoxuUX8lRWrNk9yBJ60vc51iFVeCZN9w9CWp
 kD64FehB8AoFKvYMCa6cKARraLKEyeNSi3lnM+t6GxG8HUE1U6KEmuXpiwLK8z7OSAu7
 hvvh94A0bdydJrTIjPgzPb0RaTIvQLwNZN7ZakW7Ufx9wh0BYZ+CAV1EjjYVan1hD+lu
 DuREHVCWL5S/Yj5gBgZ1a1H4uOlBe3JpOrljG/izW/4jXOnLcwCdoRGOrTf7WGg9zuUL
 UWZ1EOGaiaaxfCDGLamAOR+urx18ZZ1+b5O6gVp36tAp1EEvOH3CEeyQ4gJn8TjiukrL
 NXnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=RL1Hr3nM
Subject: Re: [Buildroot] Support for package python-rpds-py
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

T24gU2F0LCBKdWwgMjIsIDIwMjMgYXQgMzozNeKAr0FNIEFuZHJlYXMgPGFuZHJlYXNlbWJidWls
ZEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBJIG5lZWQgdGhlIHBhY2thZ2UgcHl0aG9u
LXJwZHMtcHkgdGhhdCBpcyBhIGRlcGVuZGVuY3kgb2YgdGhlIHJlZmVyZW5jaW5nIHBhY2thZ2Ug
YW5kIGRlcGVuZHMgaXRzZWxmIG9uIHB5dGhvbi1tYXR1cmluLgo+IEkgY29uZmlndXJlZCBpdCBh
cyBmb2xsb3dzOgo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIwo+ICMgcHl0aG9uLXJwZHMt
cHkKPiAjCj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPgo+IFBZVEhPTl9SUERTX1BZX1ZFUlNJ
T04gPSAwLjguMTAKPiBQWVRIT05fUlBEU19QWV9TT1VSQ0UgPSBycGRzX3B5LSQoUFlUSE9OX1JQ
RFNfUFlfVkVSU0lPTikudGFyLmd6Cj4gUFlUSE9OX1JQRFNfUFlfU0lURSA9IGh0dHBzOi8vZmls
ZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9lNi9mZS83ZDA3YmMwOGNjZTJjY2FlMmM3ZTVj
OTZkOWIzOTc2YzRlMWZhNWUyNDg5ODlkY2EwYTU4YmM3NjI4ZjgKPiBQWVRIT05fUlBEU19QWV9T
RVRVUF9UWVBFID0gcGVwNTE3Cj4gUFlUSE9OX1JQRFNfUFlfTElDRU5TRSA9IE1JVAo+IFBZVEhP
Tl9SUERTX1BZX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gUFlUSE9OX1JQRFNfUFlfREVQRU5E
RU5DSUVTID0gaG9zdC1weXRob24tbWF0dXJpbgo+Cj4gJChldmFsICQocHl0aG9uLXBhY2thZ2Up
KQoKWW91IGFyZW4ndCBzZXR0aW5nIHNvbWUgc3R1ZmYgbGlrZSB0aGUgZW52IGNvcnJlY3RseSwg
c2VlCnB5dGhvbi1vcmpzb24gYXMgYW4gZXhhbXBsZToKaHR0cHM6Ly9naXRodWIuY29tL2J1aWxk
cm9vdC9idWlsZHJvb3QvYmxvYi8yMDIzLjA1LjEvcGFja2FnZS9weXRob24tb3Jqc29uL3B5dGhv
bi1vcmpzb24ubWsKCj4KPiBUaGUgb25lIGZvciBtYXR1cmluIGxvb2tzIGFzIGZvbGxvd3M6Cj4K
PiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICMKPiAjIHB5dGhvbi1tYXR1cmluCj4gIwo+ICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4KPiBQWVRIT05fTUFUVVJJTl9WRVJTSU9OID0gMS4wLjAK
PiBQWVRIT05fTUFUVVJJTl9TT1VSQ0UgPSBtYXR1cmluLSQoUFlUSE9OX01BVFVSSU5fVkVSU0lP
TikudGFyLmd6Cj4gUFlUSE9OX01BVFVSSU5fU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9z
dGVkLm9yZy9wYWNrYWdlcy8xYy9kZS81ZjU2Yjc3MTc5NTk1YmE1Mjc4NmVlZGIwODFmYzZiMGYx
ZDBhNDQ5NmJjNzc2NjBlOGZlYWJkNjA3ZWMKPiBQWVRIT05fTUFUVVJJTl9TRVRVUF9UWVBFID0g
c2V0dXB0b29scwo+IFBZVEhPTl9NQVRVUklOX0xJQ0VOU0UgPSBNSVQgT1IgQXBhY2hlLTIuMAo+
IFBZVEhPTl9NQVRVUklOX0xJQ0VOU0VfRklMRVMgPSBsaWNlbnNlLWFwYWNoZSBsaWNlbnNlLW1p
dAo+IEhPU1RfUFlUSE9OX01BVFVSSU5fREVQRU5ERU5DSUVTID0gXAo+IGhvc3QtcHl0aG9uLXNl
dHVwdG9vbHMtcnVzdCBcCj4gaG9zdC1ydXN0Ywo+IEhPU1RfUFlUSE9OX01BVFVSSU5fRU5WID0g
XAo+ICQoSE9TVF9QS0dfQ0FSR09fRU5WKSBcCj4gUFlPM19DUk9TU19MSUJfRElSPSIkKEhPU1Rf
RElSKS9saWIvcHl0aG9uJChQWVRIT04zX1ZFUlNJT05fTUFKT1IpIgo+ICMgV2UgbmVlZCB0byB2
ZW5kb3IgdGhlIENhcmdvIGNyYXRlcyBhdCBkb3dubG9hZCB0aW1lCj4gUFlUSE9OX01BVFVSSU5f
RE9XTkxPQURfUE9TVF9QUk9DRVNTID0gY2FyZ28KPiBQWVRIT05fTUFUVVJJTl9ET1dOTE9BRF9E
RVBFTkRFTkNJRVMgPSBob3N0LXJ1c3RjCj4gSE9TVF9QWVRIT05fTUFUVVJJTl9ETF9FTlYgPSAk
KEhPU1RfUEtHX0NBUkdPX0VOVikKPgo+ICQoZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2thZ2UpKQo+
Cj4gU28gZmFyIHNvIGdvLiBIb3dldmVyLCBJIGdldCB0aGUgZm9sbG93aW5nIGVycm9yIGZvciBp
bnN0YWxsaW5nIGl0IG9uIHRoZSB0YXJnZXQ6Cj4KPiBFUlJPUjogYXJjaGl0ZWN0dXJlIGZvciAi
L3Vzci9saWIvcHl0aG9uMy4xMC9zaXRlLXBhY2thZ2VzL3JwZHMvcnBkcy5jcHl0aG9uLTMxMC1h
cm0tbGludXgtZ251ZWFiaWhmLnNvIiBpcyAiQWR2YW5jZWQgTWljcm8gRGV2aWNlcyBYODYtNjQi
LCBzaG91bGQgYmUgIkFSTSIuCj4KPiBXaGF0IGNvdWxkIGJlIHRoZSBjYXVzZSBvZiB0aGUgZXJy
b3IgYW5kIGhvdyBjYW4gSSBwcmV2ZW50IGl0Pwo+IEZvciBzb21lIG1vcmUgb3ZlcmFsbCBjb250
ZXh0IEkgdHJ5IHRvIGNvbXBpbGUgdGhlIHBhY2thZ2UgcHl0aG9uLW5vdGVib29rIG5vdGVib29r
PT02LjUuNCwgdGhhdCBpdHNlbGYgZGVwZW5kcyBvbiBpcHl0aG9uIGFuZCBpcHlrZXJuZWwgd2hp
Y2ggcmVxdWlyZSBqdXB5dGVybGFiLXdpZGdldHMgYW5kIGp1cHl0ZXJsYWItcHlnbWVudHMgdGhh
dCB0aHJvdyBhIHNpbWlsYXIgZXJyb3IuCj4KPiBLaW5kIFJlZ2FyZHMsCj4gQW5kcmVhcwo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
