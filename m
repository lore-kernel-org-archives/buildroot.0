Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9F4C4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 16:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2F4F61396;
	Mon, 11 Dec 2023 16:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2F4F61396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-MiPJDW71-5; Mon, 11 Dec 2023 16:50:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ED44613B2;
	Mon, 11 Dec 2023 16:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ED44613B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18D6B1BF30C
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 16:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBE2F613B2
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 16:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBE2F613B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pNxFP7fwCLXK for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 16:50:19 +0000 (UTC)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C26BF61396
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 16:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C26BF61396
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-db8892a5f96so4396626276.2
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702313417; x=1702918217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gaCdZ79JceWm7dWHgA4bEi28P+6ZZ6cpzDzmbY+eTaE=;
 b=d73dvqHxajKkVJwSXWKN0DTNjJhvqO8rbtzQIG2BT4h1KBJzFck2InH/X0wfjm12du
 AdbVmjCJj8a/FP06gfPjd9efnplgEGc++2Qeoy2YJSFaw3AJOvx3g86bgrdi/b60L+N/
 UN48ChGz3DXXfVGXvd5ayHgr8LWvCILrlQRRG8Z+4jm0Rje13/p8gN2SODXvyCU2H3UP
 7HOJY2L9HKeTKQR998r+cv0Vx0gFyJeegtgCdPLnYkGXVnHd2316VtHQ8s1PoD1eyI+6
 sQyu5PTWGacxsacAnpn3fQqL4bZtl0yvGGQYXzoEGru4TYG6HR1x/sFYyCZLNy7NeUzo
 KmFg==
X-Gm-Message-State: AOJu0YyQjVe5xQQMMfexTFZ6hw/CxifwE+tnsSUs//PI+wzXA/vDlszz
 SqbqJhQ+VjkvpRkZhOP7CpJ+OD+yykmn0+mYaAc8hEWJzPZlXdw4Zppn6A==
X-Google-Smtp-Source: AGHT+IHx+M2sd/Xq6rDi4FQ9ouQJ916WIF9Tv/BgRS9nsLazJBjej8bm+g5KeKSH97amF5vTyrAIZx1e/OtUVrQLZfQ=
X-Received: by 2002:a5b:787:0:b0:db5:d88:d463 with SMTP id
 b7-20020a5b0787000000b00db50d88d463mr3025747ybq.51.1702313417575; 
 Mon, 11 Dec 2023 08:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
 <CAAE6iEVHsRZjeH8XeukovfafAq+HsCH+pC26kWOWWnBNVxgzjA@mail.gmail.com>
In-Reply-To: <CAAE6iEVHsRZjeH8XeukovfafAq+HsCH+pC26kWOWWnBNVxgzjA@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 11 Dec 2023 17:50:06 +0100
Message-ID: <CABGWkvo1jo3YSsz8W__tvY5mV==_unc1Yk9DMO5qQJX-VJQmFw@mail.gmail.com>
To: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702313417; x=1702918217;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gaCdZ79JceWm7dWHgA4bEi28P+6ZZ6cpzDzmbY+eTaE=;
 b=ZXUhszzs6TFFhRxPz3U9wDb4d98mkWHZYHSY6jVQEeP+UOBKrOhADKkvLc2VeL/ynm
 FOSb4MqLknBVQ+daofqpirlpfl0vfosV//V+PZq4h5iuOMjpXE/tm2d9k3LVyxqyo6oX
 BpOLOUqR8kul93H3oGnBTsM3Hzpni3S5HlFO8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZXUhszzs
Subject: Re: [Buildroot] [PATCH 00/11] Add support for AM62x-SK HS-FS devices
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRnJhbsOnb2lzLAoKT24gU3VuLCBEZWMgMywgMjAyMyBhdCA1OjE54oCvUE0gRnJhbsOnb2lz
IFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPiB3cm90ZToKPgo+Cj4KPiBMZSBtZXIu
IDI5IG5vdi4gMjAyMyDDoCAxODoyNiwgRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFt
YXJ1bGFzb2x1dGlvbnMuY29tPiBhIMOpY3JpdCA6Cj4+Cj4+IFRoZSBTSy1BTTYyQi1QMSBpcyB0
aGUgbmV3ZXN0IHZlcnNpb24gb2YgU0stQU02MndoaWNoIGluY2x1ZGVzCj4+IGhpZ2gtc2VjdXJp
dHkgZmllbGQtc2VjdXJhYmxlIChIUy1GUykgc2lsaWNvbiB0byBvcHRpb25hbGx5IGN1c3RvbWl6
ZSBrZXlzCj4+IGFuZCBlbmNyeXB0aW9uIGZvciBzZWN1cml0eSBhcHBsaWNhdGlvbnMuCj4+IFRo
aXMgcmVxdWlyZXMgZW5hYmxpbmcgdGhlIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NFQ1RZ
UEVfSFNfRlMgb3B0aW9uLAo+PiB3aGljaCwgaG93ZXZlciwgd2FzIGJ1Z2d5LiBUaGlzIHNlcmll
cyBmaXhlcyB0aGUgZXJyb3JzIGFuZCBidW1wcyB0aGUgTGludXgKPj4ga2VybmVsIGFuZCBVLUJv
b3QgcmVxdWlyZWQgZm9yIHN1Y2ggYSBuZXcgZGV2aWNlLgo+Pgo+PiBEYXJpbyBCaW5hY2NoaSAo
MTEpOgo+PiAgIGJvb3QvdGktazMtY29yZS1zZWNkZXY6IG5ldyBwYWNrYWdlCj4+ICAgYm9vdC90
aS1rMy1pbWFnZS1nZW46IG1hbmFnZSBIUyBoYXJkd2FyZQo+Cj4KPiBUaGVzZSB0d28gZmlyc3Qg
cGF0Y2hlcyBhcmUgc2ltaWxhciB0byB0aGlzIG9uZTogW3Y5LDA3LzExXSBwYWNrYWdlL3RpLWNv
cmUtc2VjZGV2LWszOiBuZXcgcGFja2FnZQo+IHNlZSBodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMwNjIyMTYwMjEyLjIwNjM0NzItOC1kYW5u
ZW5iZXJnQHRpLmNvbS8KPgpDb3VsZCB5b3UgcGxlYXNlIGJlIG1vcmUgZXhwbGljaXQ/CkkgaGF2
ZSByZWFkIHRoZSBsaW5rIGFuZCBoYXZlIHNvbWUgZG91YnRzIGFib3V0IGhvdyB0byBwcm9jZWVk
LiBUaGUKc2VyaWVzIHlvdSBwb2ludGVkIG91dCBoYXNuJ3QgYmVlbgptZXJnZWQsIGFuZCBzZXZl
cmFsIG1vbnRocyBoYXZlIHBhc3NlZC4gSXQgc2VlbXMgdG8gbWUgdGhhdCBpdCBjYW4gbm8KbG9u
Z2VyIGJlIG1lcmdlZCBiZWNhdXNlLGluIHRoZQptZWFudGltZSwgYSBzaW1wbGVyIHNlcmllcyAo
aXQgZGlkIG5vdCBhZGQgdGktY29yZS1zZWNkZXYtazMpIGhhcyBiZWVuCmFjY2VwdGVkLiBVbmxp
a2UgdGhlIHBhdGNoIHlvdQogaW5kaWNhdGVkLCBJIGhhdmUgZGVjaWRlZCB0byBhZGQgdGktY29y
ZS1zZWNkZXYtazMgdG8gdS1ib290LCByYXRoZXIKdGhhbiB0aGUgcGFja2FnZSBkaXJlY3Rvcnks
IGFzIG5vdGhpbmcKIGlzIGluc3RhbGxlZCBpbiB0aGUgcm9vdGZzIGJ1dCBvbmx5IGluIHRoZSBi
aW5hcnkgZGlyZWN0b3J5LiBJIGFsc28KYmVsaWV2ZSwgYXMgcmVxdWVzdGVkIGJ5IHRoZSByZXZp
ZXcsIHRoYXQgSSBoYXZlCiBrZXB0IHRoZSBtYW5hZ2VtZW50IG9mIHRoaXMgcGFja2FnZSBzaW1w
bGUuCldoYXQgZG8geW91IHRoaW5rPwoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwoKPiBGcmFu
w6dvaXMKPgo+Pgo+PiAgIHBhY2thZ2UvcHl0aG9uLWpzb25zY2hlbWE6IGFkZCBob3N0IHZhcmlh
bnQKPj4gICBwYWNrYWdlL3B5dGhvbi1hdHRyczogYWRkIGhvc3QgdmFyaWFudAo+PiAgIHBhY2th
Z2UvcHl0aG9uLXJlZmVyZW5jaW5nOiBhZGQgaG9zdCB2YXJpYW50Cj4+ICAgcGFja2FnZS9weXRo
b24tcnBkcy1weTogYWRkIGhvc3QgdmFyaWFudAo+PiAgIHBhY2thZ2UvcHl0aG9uLWpzb25zY2hl
bWEtc3BlY2lmaWNhdGlvbnM6IGFkZCBob3N0IHZhcmlhbnQKPj4gICBib290L3RpLWszLXI1LWxv
YWRlcjogc2V0IGJpbm1hbiBlbnZpcm9ubWVudCB2YXJpYWJsZQo+PiAgIGJvb3QvdWJvb3Q6IHNl
dCBCSU5NQU5fSU5ESVJTIGZvciBUSSBLMyBETQo+PiAgIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVm
Y29uZmlnOiBidW1wIFUtQm9vdCB2ZXJzaW9uIHRvIDIwMjMuMTAKPj4gICBjb25maWdzL3RpX2Ft
NjJ4X3NrX2RlZmNvbmZpZzogYnVtcCBMaW51eCB2ZXJzaW9uIHRvIDYuNi4xCj4+Cj4+ICBERVZF
TE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4+ICBib2Fy
ZC90aS9hbTYyeC1zay9nZW5pbWFnZS5jZmcgICAgICAgICAgICAgICAgfCAgNyArKy0KPj4gIGJv
YXJkL3RpL2FtNjJ4LXNrL3Bvc3QtYnVpbGQuc2ggICAgICAgICAgICAgICB8IDQ5ICsrKysrKysr
KysrKysrKysrKysKPj4gIGJvYXJkL3RpL2FtNjJ4LXNrL3Bvc3QtaW1hZ2Uuc2ggICAgICAgICAg
ICAgICB8ICA1ICsrCj4+ICBib290L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMSArCj4+ICBib290L3RpLWszLWNvcmUtc2VjZGV2L0NvbmZpZy5pbiAgICAgICAg
ICAgICAgfCAgOSArKysrCj4+ICBib290L3RpLWszLWNvcmUtc2VjZGV2L3RpLWszLWNvcmUtc2Vj
ZGV2Lmhhc2ggfCAgMyArKwo+PiAgYm9vdC90aS1rMy1jb3JlLXNlY2Rldi90aS1rMy1jb3JlLXNl
Y2Rldi5tayAgIHwgMTkgKysrKysrKwo+PiAgYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmlu
ICAgICAgICAgICAgICAgIHwgIDEgKwo+PiAgYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1h
Z2UtZ2VuLm1rICAgICAgIHwgMTYgKysrKystCj4+ICBib290L3RpLWszLXI1LWxvYWRlci90aS1r
My1yNS1sb2FkZXIubWsgICAgICAgfCAgMSArCj4+ICBib290L3Vib290L3Vib290Lm1rICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMyArLQo+PiAgY29uZmlncy90aV9hbTYyeF9za19kZWZj
b25maWcgICAgICAgICAgICAgICAgIHwgMjAgKysrKysrLS0KPj4gIHBhY2thZ2UvQ29uZmlnLmlu
Lmhvc3QgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrCj4+ICBwYWNrYWdlL3B5dGhvbi1h
dHRycy9Db25maWcuaW4uaG9zdCAgICAgICAgICAgfCAgOCArKysKPj4gIHBhY2thZ2UvcHl0aG9u
LWF0dHJzL3B5dGhvbi1hdHRycy5tayAgICAgICAgICB8ICA2ICsrKwo+PiAgLi4uL0NvbmZpZy5p
bi5ob3N0ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrCj4+ICAuLi4vcHl0aG9u
LWpzb25zY2hlbWEtc3BlY2lmaWNhdGlvbnMubWsgICAgICAgfCAgNSArKwo+PiAgcGFja2FnZS9w
eXRob24tanNvbnNjaGVtYS9Db25maWcuaW4uaG9zdCAgICAgIHwgIDYgKysrCj4+ICAuLi4vcHl0
aG9uLWpzb25zY2hlbWEvcHl0aG9uLWpzb25zY2hlbWEubWsgICAgfCAgNiArKysKPj4gIHBhY2th
Z2UvcHl0aG9uLXJlZmVyZW5jaW5nL0NvbmZpZy5pbi5ob3N0ICAgICB8ICA2ICsrKwo+PiAgLi4u
L3B5dGhvbi1yZWZlcmVuY2luZy9weXRob24tcmVmZXJlbmNpbmcubWsgIHwgIDcgKysrCj4+ICBw
YWNrYWdlL3B5dGhvbi1ycGRzLXB5L0NvbmZpZy5pbi5ob3N0ICAgICAgICAgfCAgOCArKysKPj4g
IHBhY2thZ2UvcHl0aG9uLXJwZHMtcHkvcHl0aG9uLXJwZHMtcHkubWsgICAgICB8ICAxICsKPj4g
IDI0IGZpbGVzIGNoYW5nZWQsIDE5MiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+PiAg
Y3JlYXRlIG1vZGUgMTAwNzU1IGJvYXJkL3RpL2FtNjJ4LXNrL3Bvc3QtYnVpbGQuc2gKPj4gIGNy
ZWF0ZSBtb2RlIDEwMDc1NSBib2FyZC90aS9hbTYyeC1zay9wb3N0LWltYWdlLnNoCj4+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgYm9vdC90aS1rMy1jb3JlLXNlY2Rldi9Db25maWcuaW4KPj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWNvcmUtc2VjZGV2L3RpLWszLWNvcmUtc2VjZGV2Lmhh
c2gKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWNvcmUtc2VjZGV2L3RpLWszLWNv
cmUtc2VjZGV2Lm1rCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tYXR0cnMv
Q29uZmlnLmluLmhvc3QKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1qc29u
c2NoZW1hLXNwZWNpZmljYXRpb25zL0NvbmZpZy5pbi5ob3N0Cj4+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9weXRob24tanNvbnNjaGVtYS9Db25maWcuaW4uaG9zdAo+PiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXJlZmVyZW5jaW5nL0NvbmZpZy5pbi5ob3N0Cj4+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tcnBkcy1weS9Db25maWcuaW4uaG9zdAo+
Pgo+PiAtLQo+PiAyLjQzLjAKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKCgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4
IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBM
ZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMg
NTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
