Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46CAC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 20:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D95270939;
	Sun, 29 Oct 2023 20:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D95270939
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RcVFSJ4q45FP; Sun, 29 Oct 2023 20:12:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 552D270937;
	Sun, 29 Oct 2023 20:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 552D270937
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABE6A1BF870
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 20:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9255185200
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 20:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9255185200
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7eiH0sDJ3tVy for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 20:12:12 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69362851F0
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 20:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69362851F0
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c5087d19a6so53609741fa.0
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 13:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698610330; x=1699215130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tHHBgk6IVCmhs/xS/0wfDRqRSD6rbSx+fx5nHQb+lb4=;
 b=N88voaZ9hNcfPm8E2+4aZgvaHUeQRTFXF50wM7D+OE07iHrPqEoGHe4YCcI4Tia5sU
 8wK1E9sV0dmxBxOsm8c8B9E6lb6YRY/SRXUpSBi4GYMin5VKX+Ez059QzkrA3ccrfoMh
 PavmUZDyOc3nacionsZTgzYy4GdSRk/S1cdG8xGHK2yceyVsHMu00kmOM3E3OKG+aVio
 YJkw4biNcwGibTbU4qD8oX9PcM+gvNWZTUlHAbai3vZGllGxTaRLV/dN1/GMx+ga93Xz
 pioe2iKGd+LCBM4QWcqogJfn0ESSHEHUn3PsFhrxPsbU3DzufPDZyNZm6aGaNyVfLPa+
 gRYg==
X-Gm-Message-State: AOJu0YwdqjNuc/Cj32g7Ld3D97Gtn5bhhX092qGAIYSsGoNcK3DqYsxd
 Ba8AZQJTBWHrBqYs4yMBPBF2ZhuejTlSXRtS2pI=
X-Google-Smtp-Source: AGHT+IETErYKebm6aCoAroeYmonEd13pUZNhd1IpVBVSWp6HvZqQfAKU/EdYWxTRLC6mBh1Pgm3vdnUuldl3DteAVrg=
X-Received: by 2002:a19:c510:0:b0:503:34b8:20b with SMTP id
 w16-20020a19c510000000b0050334b8020bmr5756344lfe.65.1698610329685; Sun, 29
 Oct 2023 13:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231028102435.1771460-1-yegorslists@googlemail.com>
 <CAGm1_kt2d-MUxuoJ+LF_pnNeiXXWyFGzZ1XYwnTAnp84ff+FZg@mail.gmail.com>
 <CADvTj4pyC-HhUAK3iJ=zRAUaw0WRQv09n-7Y45v2L-nkwgv-Vg@mail.gmail.com>
In-Reply-To: <CADvTj4pyC-HhUAK3iJ=zRAUaw0WRQv09n-7Y45v2L-nkwgv-Vg@mail.gmail.com>
Date: Sun, 29 Oct 2023 21:11:59 +0100
Message-ID: <CAGm1_kvXMmZwf16m0h3-EqiSHjDXu07kS1pJA3eMLP9BoyC4dA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1698610330; x=1699215130; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tHHBgk6IVCmhs/xS/0wfDRqRSD6rbSx+fx5nHQb+lb4=;
 b=QslSmGcg4QfBR+TJkfe1eoBUdaHQJIjMIbtZpxhA4X6hV+MQu7cqg15nFa5yHm852/
 s/UiDmaU8fw1mBEdr7j5FSlRS6yiyLSYVjTRyanC+Rwai8EBjgv/HJ+ZtsFcr+y50Wia
 YpgjH+mUHBZjnZiGChAd1oaToLmW09xhFQsdDZw2u+mynCm/crygeEJ03fyTxhcIf9rH
 u/zRcisYwvYd6TGfgxD8xrLHhNwVpCxWUoRyXXycOEoW2ljbMWFargBgSvriQhKTdTaq
 4goJKLy8jKV5AcYUlqJeoRur+PnBSDVIdak0IRx9i/TfLOMyqXvFLGX0nSu1JwJVSZWZ
 EfBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QslSmGcg
Subject: Re: [Buildroot] [RFC PATCH] package/pkg-python.mk: PEP517: add
 support for setuptools backend
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: adam.duskett@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIGFsbCwKCk9uIFNhdCwgT2N0IDI4LCAyMDIzIGF0IDEyOjQ04oCvUE0gSmFtZXMg
SGlsbGlhcmQKPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBP
Y3QgMjgsIDIwMjMgYXQgNDozMeKAr0FNIFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29n
bGVtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIGFsbCwKPj4KPj4gT24gU2F0LCBPY3QgMjgsIDIw
MjMgYXQgMTI6MjXigK9QTSA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+PiA+
Cj4+ID4gRnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+
PiA+Cj4+ID4gU2luY2UgdmVyc2lvbiA0MS4wLjAsIHNldHVwdG9vbHMgaGFzIGFuIGV4cGVyaW1l
bnRhbCBQRVA1MTcgc3VwcG9ydC4KPj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJl
bW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPj4gPiAtLS0KPj4gPiAgcGFja2FnZS9w
a2ctcHl0aG9uLm1rIHwgMiArLQo+PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPj4gPgo+PiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1weXRob24u
bWsgYi9wYWNrYWdlL3BrZy1weXRob24ubWsKPj4gPiBpbmRleCAyOGVlNGNiODVmLi4wMGY3MWY2
YjE5IDEwMDY0NAo+PiA+IC0tLSBhL3BhY2thZ2UvcGtnLXB5dGhvbi5tawo+PiA+ICsrKyBiL3Bh
Y2thZ2UvcGtnLXB5dGhvbi5tawo+PiA+IEBAIC0zMDAsNyArMzAwLDcgQEAgaWZlcSAoJCQoJCgy
KV9TRVRVUF9UWVBFKSxzZXR1cHRvb2xzLXJ1c3QpCj4+ID4gICQoMilfREVQRU5ERU5DSUVTICs9
IGhvc3QtcHl0aG9uLXNldHVwdG9vbHMtcnVzdAo+PiA+ICBlbmRpZgo+PiA+ICBlbHNlIGlmbmVx
ICgkJChmaWx0ZXIgZmxpdCBtYXR1cmluIHBlcDUxNywkJCgkKDIpX1NFVFVQX1RZUEUpKSwpCj4+
ID4gLSQoMilfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0aG9uLXB5cGEtYnVpbGQgaG9zdC1weXRo
b24taW5zdGFsbGVyCj4+ID4gKyQoMilfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0aG9uLXB5cGEt
YnVpbGQgaG9zdC1weXRob24taW5zdGFsbGVyIGhvc3QtcHl0aG9uLXNldHVwdG9vbHMKPj4gPiAg
aWZlcSAoJCQoJCgyKV9TRVRVUF9UWVBFKSxmbGl0KQo+PiA+ICAkKDIpX0RFUEVOREVOQ0lFUyAr
PSBob3N0LXB5dGhvbi1mbGl0LWNvcmUKPj4gPiAgZW5kaWYKPj4KPj4gVGhpcyBwYXRjaCBpcyBt
b3JlIGEgd29ya2Fyb3VuZCB0byBjb252ZXJ0IHN1Y2ggcGFja2FnZXMgYXMKPj4gcHl0aG9uLXRv
cm5hZG8sIHB5dGhvbi1jb25maWdvYmosIGV0Yy4gdG8gUEVQNTE3IGluZnJhc3RydWN0dXJlLiBU
aGVzZQo+PiBwYWNrYWdlcyBqdXN0IHVzZSBhIGJ1aWxkLXN5c3RlbSBzZWN0aW9uIGFuZCBvdGhl
cndpc2UgcmVseSBvbiB0aGUKPj4gc2V0dXAucHkgZmlsZToKPgo+Cj4gQXJlIHRoZXNlIGZhaWxp
bmcgdG8gYnVpbGQgd2l0aG91dCBQRVA1MTcgaW5mcmFzdHJ1Y3R1cmUgZm9yIHNldHVwdG9vbHM/
CgpObywgdGhleSBhcmUgd29ya2luZyBhcyBleHBlY3RlZCBpbiBib3RoICJ3b3JsZHMiLgoKPj4K
Pj4gW2J1aWxkLXN5c3RlbV0KPj4gcmVxdWlyZXMgPSBbInNldHVwdG9vbHMiXQo+PiBidWlsZC1i
YWNrZW5kID0gInNldHVwdG9vbHMuYnVpbGRfbWV0YSIKPj4KPj4gV2hhdCBpcyB0aGUgcGxhbiB0
byBzdXBwb3J0IHRoaXMgYmFja2VuZD8gSnVzdCB1c2Ugc2V0dXB0b29scy1ydXN0IG9yCj4+IGNv
bnZlcnQgIl9TRVRVUF9UWVBFPXNldHVwdG9vbHMiIHRvIFBFUDUxNyBhZnRlciB0aGUgaW50cm9k
dWN0aW9uIG9mCj4+IFB5dGhvbiAxMi54Pwo+Cj4KPiBJIGFscmVhZHkgaGF2ZSBhIHBhdGNoIGNv
bnZlcnRpbmcgb3VyIHNldHVwdG9vbHMgaW5mcmFzdHJ1Y3R1cmUgdG8gUEVQNTE3Ogo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDIzMDkzMDE1MjUxNy4xMDc3NTc2LTMtamFt
ZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KCkkgaGF2ZSBvdmVybG9va2VkIHlvdXIgc2VyaWVzLiBN
ZWFud2hpbGUsIEkgY291bGQgdGVzdCBpdCAoYXMgeW91IGhhdmUKcHJvYmFibHkgc2VlbikgYW5k
IHNvIGZhciwgYm90aCBteSBwYWNrYWdlcyBhbmQgdG9ybmFkbyBjb3VsZCBiZQpzdWNjZXNzZnVs
bHkgYnVpbHQuIEJ1dCBhdCBzb21lIHBvaW50LCBJIHJhbiBhY3Jvc3MgdGhlIHB5dGhvbi1tc2dw
YWNrCmlzc3VlLCB3aGljaCB5b3UgaGF2ZSBhbHJlYWR5IHRyaWVkIHRvIGZpeC4gQXJlIHlvdSBn
b2luZyB0byBwb3N0IHY0Cm9mIHlvdXIgc2VyaWVzIGNvbnRhaW5pbmcgdGhlIHB5dGhvbi1tc2dw
YWNrIGZpeD8KClJlZ2FyZHMsClllZ29yCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
