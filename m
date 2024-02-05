Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8801EC4829A
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44E84418AC;
	Mon,  5 Feb 2024 22:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44E84418AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjzoqO0Ah9CY; Mon,  5 Feb 2024 22:21:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B36241B51;
	Mon,  5 Feb 2024 22:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B36241B51
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF04C1BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C897B82001
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C897B82001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVvyf7Ashxau for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:20:53 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6960881FF5
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6960881FF5
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a2f79e79f0cso22992366b.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 14:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707171651; x=1707776451;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+b7BRHLEg3V8GH/vvQOgH4GMiJtPgGtZAerch60gPLU=;
 b=U4Bg8X4n6P3NJeWKjx86nECA9In8yp//6ZxqxnNxepFy/A/RppXFgl1lluIbEGOyo9
 +Jlxi6Naka/1dPaV3qhBMpXaXHeKJTFsI3d0+oBIAPc7jH1tpOINEmL+6J/UcQq2zrR9
 9xp3afZU/HUZkRyCXyIoibbX1u1xAJ9/yEKSw7y1T1zut2znon+6rtZsUhVDRIPkknOZ
 vM610hzhqY1G3zyZDjirLr5JL9k2YdoG7cQOvADu39DOQDyFA1ZrilWE028GKybn8aPN
 g8RJ9QcaV5cgko7yJ8qa+CBWh/28pUIbCicu9u6O8ZAjAvBC0QO9JEqpYcnxGhSaiyQX
 hRCg==
X-Gm-Message-State: AOJu0YwzotBB9AcYwhf/X10UYJdBMRz/VsCmQKZyAkqbeq0QKo4q3WQR
 bpZXGNc1RNv7dwOB0diXBzr3WmBaF/7169a646chifvaLyrEcxgiSGMvwlpVcQU=
X-Google-Smtp-Source: AGHT+IEVOfyfVf8/AbzldjYwk6p0LiKTrChfwvmovVXSDLuNeRAqMiE7VRPvD4M7K5YLq5YouhY3tA==
X-Received: by 2002:a17:907:7798:b0:a38:b54:a87 with SMTP id
 ky24-20020a170907779800b00a380b540a87mr347213ejc.11.1707171651514; 
 Mon, 05 Feb 2024 14:20:51 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWOZgfEGTA1ZqikJe/vgGmFQklvyLP04YllvbP9g6t6Hyv5dbwHi95MHPazMuN8lXF9vi8XsD2TEPG1qukyZhIq5/vUPGsgWA==
Received: from [192.168.101.106] (87-88-191-254.abo.bbox.fr. [87.88.191.254])
 by smtp.gmail.com with ESMTPSA id
 hw19-20020a170907a0d300b00a36c6b0485asm323303ejc.103.2024.02.05.14.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 14:20:51 -0800 (PST)
Message-ID: <3d4fe1c8-8d8f-4740-9185-2a6ff43405fc@smile.fr>
Date: Mon, 5 Feb 2024 23:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240205214837.3497535-1-ju.o@free.fr>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240205214837.3497535-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707171651; x=1707776451;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+b7BRHLEg3V8GH/vvQOgH4GMiJtPgGtZAerch60gPLU=;
 b=0cgUMWX//cYJKy0DNx2KjJ6UD98lEQPL0wKGYpltzs+hffo71bZx8wG8BWKesWmTTv
 bHli0la3JGs702CiLuS+9fufYzFsf/A0Q1f4zEHzXA7UOhu1F8Uahisni62T2m7TpDtN
 XZ/Q2fDL/iOHnshbw7OIk0PUOJELkJtt0uLdFL5pel5lUlj9UbL+zdgtyPZCHOQZzfWF
 2y7F69YPfLi1DMVRi8Tr3kUEc+9Ki34BpEGgDy1c6zC0sX0k5kMoV6PKsbJ4oG8UHx0m
 sUk9mr2JJiNdHpk2GB+n/g3+fE4wMY0cn70VWs58HcyrUj6ztbB4UEyiTNex5x1UzNz1
 bJvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=0cgUMWX/
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: netcat: improve test
 robustness
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKTGUgMDUvMDIvMjAyNCDDoCAyMjo0OCwgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBVbmRlciBzb21lIGNvbmRpdGlvbnMgKG1vc3RseSBzbG93IGV4ZWN1dGlvbiBk
dWUgdG8gdGVzdCBob3N0IGxvYWQpLAo+IHRoZSBuZXRjYXQgcnVudGltZSB0ZXN0IGNhbiByYW5k
b21seSBmYWlsLiBUaGlzIGlzIGR1ZSB0byBzZXZlcmFsCj4gZmFjdHM6Cj4gCj4gLSB0aGUgc2xl
ZXAgdGltZSBiZXR3ZWVuIHRoZSBzZXJ2ZXIgYW5kIGNsaWVudCBpcyB0b28gc2hvcnQsCj4gLSB0
aGUgdXNlIG9mIG5ldGNhdCBvcHRpb24gLWMgY291bGQgY2xvc2UgdGhlIGNvbm5lY3Rpb24gYmVm
b3JlIHRoZQo+ICAgc2VydmVyIGNvdWxkIHJlY2VpdmUgYWxsIHRoZSBkYXRhLgo+IAo+IFRoaXMg
Y29tbWl0IGltcHJvdmVzIHRoZSB0ZXN0IHJvYnVzdG5lc3MgYnkgaW5jcmVhc2luZyB0aGUgc2xl
ZXAgdGltZSwKPiBhbmQgYnkgcmVkdWNpbmcgdGhlIGFtb3VudCBvZiB0cmFuc2ZlcnJlZCBkYXRh
IChmcm9tIDFNQiBvZiByYW5kb20gZGF0YSwKPiB0byBhIHNpbXBsZXIgc3RyaW5nIG9mIGZldyBi
eXRlcykuIEFsc28sIHRvIG1ha2Ugc3VyZSBuZXRjYXQgY2Fubm90IHdhaXQKPiBvbiBETlMgcmVz
b2x1dGlvbiwgdGhpcyBjb21taXQgYWxzbyBhZGRzIHRoZSAtbiBvcHRpb24uCj4gCj4gRml4ZXM6
Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy82MDkz
ODU0NjY0CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4K
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAtLS0K
PiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZXRjYXQucHkgfCAxOSArKysr
KysrKystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X25ldGNhdC5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmV0
Y2F0LnB5Cj4gaW5kZXggYjNlZmE0YzQwYi4uODhkNThhNzJmMyAxMDA2NDQKPiAtLS0gYS9zdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25ldGNhdC5weQo+ICsrKyBiL3N1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmV0Y2F0LnB5Cj4gQEAgLTIyLDIwICsyMiwxOSBA
QCBjbGFzcyBUZXN0TmV0Q2F0KGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4gIAo+ICAgICAgICAg
IHNlbGYuYXNzZXJ0UnVuT2soIm5jIC0tdmVyc2lvbiIpCj4gIAo+IC0gICAgICAgIGluX2ZpbGUg
PSAiaW5wdXQuYmluIgo+IC0gICAgICAgIG91dF9maWxlID0gIm91dHB1dC5iaW4iCj4gKyAgICAg
ICAgbXNnID0gIkhlbGxvIEJ1aWxkcm9vdCEiCj4gKyAgICAgICAgb3V0X2ZpbGUgPSAib3V0cHV0
LnR4dCIKPiAgICAgICAgICBwb3J0ID0gMTIzNDUKPiAgCj4gLSAgICAgICAgY21kID0gZiJkZCBp
Zj0vZGV2L3VyYW5kb20gb2Y9e2luX2ZpbGV9IGJzPTFrIGNvdW50PTFrIgo+ICsgICAgICAgIGNt
ZCA9IGYibmMgLW4gLWwgLXAge3BvcnR9ID4ge291dF9maWxlfSAyPiAvZGV2L251bGwgJiIKPiAg
ICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCkKPiAgCj4gLSAgICAgICAgY21kID0gZiJuYyAt
bCAtcCB7cG9ydH0gPiB7b3V0X2ZpbGV9ICYiCj4gLSAgICAgICAgc2VsZi5hc3NlcnRSdW5Payhj
bWQpCj4gLQo+IC0gICAgICAgIHRpbWUuc2xlZXAoMSkKPiArICAgICAgICB0aW1lLnNsZWVwKDUp
Cj4gIAo+IC0gICAgICAgIGNtZCA9IGYiY2F0IHtpbl9maWxlfSB8IG5jIC1jIDEyNy4wLjAuMSB7
cG9ydH0iCj4gKyAgICAgICAgY21kID0gZiJlY2hvICd7bXNnfScgfCBuYyAtbiAtYyAxMjcuMC4w
LjEge3BvcnR9Igo+ICAgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soY21kKQo+ICAKPiAtICAgICAg
ICBjbWQgPSBmImNtcCB7aW5fZmlsZX0ge291dF9maWxlfSIKPiAtICAgICAgICBzZWxmLmFzc2Vy
dFJ1bk9rKGNtZCkKPiArICAgICAgICBjbWQgPSBmImNhdCB7b3V0X2ZpbGV9Igo+ICsgICAgICAg
IG91dCwgcmV0ID0gc2VsZi5lbXVsYXRvci5ydW4oY21kKQo+ICsgICAgICAgIHNlbGYuYXNzZXJ0
RXF1YWwocmV0LCAwKQo+ICsgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwob3V0WzBdLCBtc2cpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
