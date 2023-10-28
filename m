Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7F0C0032E
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 10:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E12B0828B3;
	Sat, 28 Oct 2023 10:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E12B0828B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s4Ne2msho5Zc; Sat, 28 Oct 2023 10:31:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 359668269C;
	Sat, 28 Oct 2023 10:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 359668269C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82B6C1BF2CD
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 10:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68B518266C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 10:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68B518266C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fM0ghBZlNEkh for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 10:31:02 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E7C48266A
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 10:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E7C48266A
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507a98517f3so4030023e87.0
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 03:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698489060; x=1699093860;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Rt+Ry4IRfPcM853+pMwT4nqteEBTz8WD07CEW9jgR0=;
 b=s/qAmdIgi5zLQdwmedA9AU0Qa9nlmtKbHN75XgrbJcoYM614eAmIHmsYdXaoFVwKy5
 GhG7gyOupzUuVd27bVU6dn/1JntxlvPSJfiNZlHh+ZXyMgL9CrUry0zsx8JQIjLzizfE
 Lz0mx8a9YXQ8HFTFqMZwZzbHsGlEHXWnsgprbiLHWT0rBKtcS8VF6uvUx0vkIr/wMind
 UPJjOiQY2i+Eg67a/Gc8rZQA5wRmstntxmoLBz5yMfHapeGBZuEg7MjeVQN8wNfDo0Nh
 hO/9K0VAZD9gqzfrc3AxJ41NH6wzZS5weK5YuirDgysFQ47RSPMNu73hs2z+QPnyMa9z
 i3sQ==
X-Gm-Message-State: AOJu0YyK2crMjKC+oJyDYeEwDp0Pk+46JM5/XYa911dhA2iNAHp8ChI8
 ZgH8S0+Y5v7KqAmhwGFy7IakdZ2TlAUiopeKo3JIra60wwU=
X-Google-Smtp-Source: AGHT+IHiPqCtQlqeZOBrulx7nMjW/WyfUn/Hm7O7Zi9h59yPURybBHo3pGDLuLtiVMlFUTt+Dg0OXIovx5JhzOCOrZs=
X-Received: by 2002:a19:650c:0:b0:507:9996:f62b with SMTP id
 z12-20020a19650c000000b005079996f62bmr2826578lfb.56.1698489059603; Sat, 28
 Oct 2023 03:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231028102435.1771460-1-yegorslists@googlemail.com>
In-Reply-To: <20231028102435.1771460-1-yegorslists@googlemail.com>
Date: Sat, 28 Oct 2023 12:30:47 +0200
Message-ID: <CAGm1_kt2d-MUxuoJ+LF_pnNeiXXWyFGzZ1XYwnTAnp84ff+FZg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1698489060; x=1699093860; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Rt+Ry4IRfPcM853+pMwT4nqteEBTz8WD07CEW9jgR0=;
 b=W6+VWRmmhmK967Awjk9rN/bOG76RqRqVlwro0SqdANK3cU50RdA6wXpsHJTIBRIGF/
 /KqlzB2wa57KsG2QGCGZ4KDDyATbyoH/X0fR2UVGB2pHp7aqquwlyIy1uBL2EmqrSvCK
 B7rhkADlSpwcB9TUGeMnVwKoLr5rtRmS/oEmFDpz4nQj35BXLbeVAlLjbt91H6MM2ubJ
 /9IC91MUbG2B2vF/m/iYyNnl55GNYbMNw9b+sAFpHuAOJGWkSlzfy9tXxW3whfX2fix+
 JmAyZ3o214P7rwd+teQq/S1mxd1wyKXKaSLyhFbmXDnnCf/BSql+BOeFuc4Dd5J882Y4
 I5HA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W6+VWRmm
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
Cc: adam.duskett@amarulasolutions.com, james.hilliard1@gmail.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gU2F0LCBPY3QgMjgsIDIwMjMgYXQgMTI6MjXigK9QTSA8eWVnb3JzbGlzdHNA
Z29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xp
c3RzQGdvb2dsZW1haWwuY29tPgo+Cj4gU2luY2UgdmVyc2lvbiA0MS4wLjAsIHNldHVwdG9vbHMg
aGFzIGFuIGV4cGVyaW1lbnRhbCBQRVA1MTcgc3VwcG9ydC4KPgo+IFNpZ25lZC1vZmYtYnk6IFll
Z29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2Fn
ZS9wa2ctcHl0aG9uLm1rIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1weXRob24ubWsgYi9w
YWNrYWdlL3BrZy1weXRob24ubWsKPiBpbmRleCAyOGVlNGNiODVmLi4wMGY3MWY2YjE5IDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvcGtnLXB5dGhvbi5tawo+ICsrKyBiL3BhY2thZ2UvcGtnLXB5dGhv
bi5tawo+IEBAIC0zMDAsNyArMzAwLDcgQEAgaWZlcSAoJCQoJCgyKV9TRVRVUF9UWVBFKSxzZXR1
cHRvb2xzLXJ1c3QpCj4gICQoMilfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0aG9uLXNldHVwdG9v
bHMtcnVzdAo+ICBlbmRpZgo+ICBlbHNlIGlmbmVxICgkJChmaWx0ZXIgZmxpdCBtYXR1cmluIHBl
cDUxNywkJCgkKDIpX1NFVFVQX1RZUEUpKSwpCj4gLSQoMilfREVQRU5ERU5DSUVTICs9IGhvc3Qt
cHl0aG9uLXB5cGEtYnVpbGQgaG9zdC1weXRob24taW5zdGFsbGVyCj4gKyQoMilfREVQRU5ERU5D
SUVTICs9IGhvc3QtcHl0aG9uLXB5cGEtYnVpbGQgaG9zdC1weXRob24taW5zdGFsbGVyIGhvc3Qt
cHl0aG9uLXNldHVwdG9vbHMKPiAgaWZlcSAoJCQoJCgyKV9TRVRVUF9UWVBFKSxmbGl0KQo+ICAk
KDIpX0RFUEVOREVOQ0lFUyArPSBob3N0LXB5dGhvbi1mbGl0LWNvcmUKPiAgZW5kaWYKClRoaXMg
cGF0Y2ggaXMgbW9yZSBhIHdvcmthcm91bmQgdG8gY29udmVydCBzdWNoIHBhY2thZ2VzIGFzCnB5
dGhvbi10b3JuYWRvLCBweXRob24tY29uZmlnb2JqLCBldGMuIHRvIFBFUDUxNyBpbmZyYXN0cnVj
dHVyZS4gVGhlc2UKcGFja2FnZXMganVzdCB1c2UgYSBidWlsZC1zeXN0ZW0gc2VjdGlvbiBhbmQg
b3RoZXJ3aXNlIHJlbHkgb24gdGhlCnNldHVwLnB5IGZpbGU6CgpbYnVpbGQtc3lzdGVtXQpyZXF1
aXJlcyA9IFsic2V0dXB0b29scyJdCmJ1aWxkLWJhY2tlbmQgPSAic2V0dXB0b29scy5idWlsZF9t
ZXRhIgoKV2hhdCBpcyB0aGUgcGxhbiB0byBzdXBwb3J0IHRoaXMgYmFja2VuZD8gSnVzdCB1c2Ug
c2V0dXB0b29scy1ydXN0IG9yCmNvbnZlcnQgIl9TRVRVUF9UWVBFPXNldHVwdG9vbHMiIHRvIFBF
UDUxNyBhZnRlciB0aGUgaW50cm9kdWN0aW9uIG9mClB5dGhvbiAxMi54PwoKUmVnYXJkcywKWWVn
b3IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
