Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4C8C87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 17:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 121E860C0F;
	Sat,  9 Aug 2025 17:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8h5jmMuEzG8; Sat,  9 Aug 2025 17:57:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1263E60C12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1263E60C12;
	Sat,  9 Aug 2025 17:57:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03AC31D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9D144098F
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQfzqLAXdYDn for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 17:57:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C718E4097E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C718E4097E
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C718E4097E
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:57:15 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-55b88369530so3400152e87.0
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 10:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754762234; x=1755367034;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kcUnWRXDYDhYcebS80F8Z+fQH0HQneny9IUC8eovGvY=;
 b=nowcVSGXqaBjav1LGIK6p65QJlBhAbqHf0O36YF/N4RPZ5Vm1ncnI5qFNP3K2FHJ/q
 b0guNG+QKue+oViGgwiuFbf8DWLKnBiZ59pY+65EmM27HaQ3mKq184eTN5GM/B6DyWOX
 zsMOysV/OgMtQJ/yFG7w9euUA8pQ5iGbDP6gE8WEVLBfwMsJwp4PXTyMVPnGLvQ5Ep+5
 kKulF0R6Ib2g9GbdcRxsPyckRmvm3UMM8Yx5UcbHR2cOaAHqMrsoA/w1FantgWWcNBpG
 Tus1TMmMvcaMENByiXtzKAQXGt2YsEzd4q/T/cl/vtTU1feT4sEYc/H7QGAUgPpK3T4a
 2tTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnAh8QqVlAcy9haty41fzZdRe5mvZjOSb/F7FGZaaHnbIkOXjpCjyHJydW0ibqs9iud/BB6kvUs34=@buildroot.org
X-Gm-Message-State: AOJu0YzvQ6Kvzi08pwg6tKYFQTZhfCHu/qEWb1oMeEorDoCwJowXXup0
 nsDb9N7DwhYgR6gVEpb0DM8ob6S/w9BKXHKOLVDZHwz/XuqIa+kQMQ0H3ShNw5P6tjOy1KXOfwp
 j8BaM
X-Gm-Gg: ASbGncueTISMQTas2NwrKHiwO3ncdshSnzqH+Lpo95DB3VDQZnUv9I0JOBAfSQydX69
 7Ly3IxeGiVcE7FLsyfkBayM7PYlwdnA4IvyFHBqMK29MKQnq3T93MoIvNdmEMuajWIoo2zMTm7R
 VNtHHk7m1PY9grqloo/VhxFLFpxi/UzzSwbhYbZbCec8M8bvtU9b7dUuSAMP7wwsev1sbazIXrU
 ug0uBPdx09vMSB/EdJer7FE2SyVLyCPGXJ4w/bpHnzs7Qq5Py5ZFManmKU+De1xF7OSWFDdohTl
 gCN9v2INmfos0s8fRw0J1SJcJe+ALUTybNZwDC+C2AZ5oIm8xYF7ZBbqnoXMcOUWm5iMIcnAO8i
 Vmp6rG0ol3v0EeIBaJolqniAPgBSYvt38/EX6UsEhSVPxSomcKUnPz3jyXLaj4yeLKTlUANczIU
 zOWG1auZ3zT4T7T/jd7os2EQsTgJEDZ7QrnlCoBKKmJl6NdpMFFxD/XD1EP+ejVrx6+6JEDpUNQ
 bx6B4/fAg==
X-Google-Smtp-Source: AGHT+IE3WRJ05isome2lrkGotLh+SKfZN+N77UruZFhdgZQ7MQpzo/4CuBqESyloub+XK7yrMOGTPA==
X-Received: by 2002:a05:6512:ac8:b0:55b:8767:1b0d with SMTP id
 2adb3069b0e04-55cc013e695mr1476737e87.39.1754762233475; 
 Sat, 09 Aug 2025 10:57:13 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8899f897sm3411920e87.49.2025.08.09.10.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 10:57:13 -0700 (PDT)
Message-ID: <c9397c5d-43ba-44ea-bf09-1bea98184552@smile.fr>
Date: Sat, 9 Aug 2025 19:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
References: <20250807204627.1067907-1-thomas.perale@mind.be>
Content-Language: fr
In-Reply-To: <20250807204627.1067907-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754762233; x=1755367033; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kcUnWRXDYDhYcebS80F8Z+fQH0HQneny9IUC8eovGvY=;
 b=1/TWyBfglxVXqZNPH8fdqNqeOloPlGHhPcykeCQiJ1W6gR5DTtHdCAnx3LK8k1pSFs
 ZZlrrFJarVBk2A91hvFHDgIqBL1iiJ0CXhPGoQFE4a4M6Aj4Xxmc1BOKjon+yVR2MP4B
 iX3xwUPcUHZuS5X3Qrb2vxlDPE58SseF6dy7c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=1/TWyBfg
Subject: Re: [Buildroot] [PATCH] package/tini: fix build w/ musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAwNy8wOC8yMDI1IMOgIDIyOjQ2LCBUaG9tYXMgUGVyYWxl
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBXaGVuIGJ1aWxkaW5nIHRpbmkgd2l0aCBtdXNs
IGxpYmMsIHRoZSBmb2xsb3dpbmcgZXJyb3Igb2NjdXJzIGR1ciB0bwo+IG1pc3NpbmcgZGVjbGFy
YXRpb24gb2YgJ2Jhc2VuYW1lJzoKPiAKPiBgYGAKPiAvaG9tZS9idWlsZHJvb3QvaW5zdGFuY2Ut
MC9vdXRwdXQtMS9idWlsZC90aW5pLTAuMTkuMC9zcmMvdGluaS5jOiBJbiBmdW5jdGlvbiAncHJp
bnRfdXNhZ2UnOgo+IC9ob21lL2J1aWxkcm9vdC9pbnN0YW5jZS0wL291dHB1dC0xL2J1aWxkL3Rp
bmktMC4xOS4wL3NyYy90aW5pLmM6MjI3OjM2OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24g
b2YgZnVuY3Rpb24gJ2Jhc2VuYW1lJyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0K
PiAgIDIyNyB8ICAgICAgICAgZnByaW50ZihmaWxlLCAiJXMgKCVzKVxuIiwgYmFzZW5hbWUobmFt
ZSksIFRJTklfVkVSU0lPTl9TVFJJTkcpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fgo+IG1ha2U6ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5t
azoyNzM6IC9ob21lL2J1aWxkcm9vdC9pbnN0YW5jZS0wL291dHB1dC0xL2J1aWxkL3RpbmktMC4x
OS4wLy5zdGFtcF9idWlsdF0gRXJyb3IgMQo+IG1ha2U6IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9t
ZS9idWlsZHJvb3QvaW5zdGFuY2UtMC9idWlsZHJvb3QnCj4gYGBgCj4gCj4gVGhpcyBlcnJvciBj
YW4gYmUgcmVwcm9kdWNlZCB3aXRoOgo+IAo+IGBgYAo+IGNhdCA+LmNvbmZpZyA8PEVPRgo+IEJS
Ml9hYXJjaDY0PXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiBCUjJfVE9PTENIQUlOX0VY
VEVSTkFMX0JPT1RMSU49eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BQVJDSDY0
X01VU0xfQkxFRURJTkdfRURHRT15Cj4gQlIyX1BBQ0tBR0VfS1ZNVE9PTD15Cgprdm10b29sPyBz
aG91bGQgYmUgdGluaSBoZXJlPwoKT3RoZXJ3aXNlOgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3Vy
IDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gRU9GCj4g
bWFrZSBvbGRkZWZjb25maWcKPiBtYWtlIHRpbmkKPiBgYGAKPiAKPiBUaGlzIHBhdGNoIGFkZHMg
dGhlIHVwc3RyZWFtIGNvbW1pdCBbMV0sIHRoYXQgZml4ZXMgdGhpcyBpc3N1ZSBieQo+IGluY2x1
ZGluZyBgbGliZ2VuLmhgLgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20va3JhbGxpbi90aW5p
L2NvbW1pdC85MjRjNGJkNjAyODQ1NzE4ODk0MmVjYmZkYzc1ZTZhMzQzZmE5Mzk1Cj4gCj4gRml4
ZXM6IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9mMGQvZjBkMTBjZDI1
ZjNiMGUyYTRhZjcyNjZmNzQxN2IzMzllYTVkMjQyYQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQ
ZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KPiAtLS0KPiAgLi4udXBwb3J0LXBvc2l4LWJh
c2VuYW1lLWZyb20tbXVzbC1saWJjLnBhdGNoIHwgNzYgKysrKysrKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS90aW5pLzAwMDEtc3VwcG9ydC1wb3NpeC1iYXNlbmFtZS1mcm9tLW11c2wtbGliYy5wYXRj
aAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3RpbmkvMDAwMS1zdXBwb3J0LXBvc2l4LWJhc2Vu
YW1lLWZyb20tbXVzbC1saWJjLnBhdGNoIGIvcGFja2FnZS90aW5pLzAwMDEtc3VwcG9ydC1wb3Np
eC1iYXNlbmFtZS1mcm9tLW11c2wtbGliYy5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMC4uMTc0NDVkNWIzYgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNr
YWdlL3RpbmkvMDAwMS1zdXBwb3J0LXBvc2l4LWJhc2VuYW1lLWZyb20tbXVzbC1saWJjLnBhdGNo
Cj4gQEAgLTAsMCArMSw3NiBAQAo+ICtGcm9tIDkyNGM0YmQ2MDI4NDU3MTg4OTQyZWNiZmRjNzVl
NmEzNDNmYTkzOTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IEhhdWtlIE1laHJ0
ZW5zIDxoYXVrZUBoYXVrZS1tLmRlPgo+ICtEYXRlOiBTdW4sIDE0IEFwciAyMDI0IDE1OjMzOjUx
ICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gU3VwcG9ydCBQT1NJWCBiYXNlbmFtZSgpIGZyb20g
bXVzbCBsaWJjCj4gKwo+ICtNdXNsIGxpYmMgMS4yLjUgcmVtb3ZlZCB0aGUgZGVmaW5pdGlvbiBv
ZiB0aGUgYmFzZW5hbWUoKSBmdW5jdGlvbiBmcm9tCj4gK3N0cmluZy5oIGFuZCBvbmx5IHByb3Zp
ZGVzIGl0IGluIGxpYmdlbi5oIGFzIHRoZSBQT1NJWCBzdGFuZGFyZAo+ICtkZWZpbmVzIGl0Lgo+
ICsKPiArVGhpcyBjaGFuZ2UgZml4ZXMgY29tcGlsYXRpb24gd2l0aCBtdXNsIGxpYmMgMS4yLjUu
Cj4gK2BgYGAKPiArYnVpbGRfZGlyL3RhcmdldC1taXBzXzI0a2NfbXVzbC90aW5pLTAuMTkuMC9z
cmMvdGluaS5jOjIyNzozNjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9u
ICdiYXNlbmFtZScgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gKyAgMjI3IHwg
ICAgICAgICBmcHJpbnRmKGZpbGUsICIlcyAoJXMpXG4iLCBiYXNlbmFtZShuYW1lKSwgVElOSV9W
RVJTSU9OX1NUUklORyk7Cj4gK2J1aWxkX2Rpci90YXJnZXQtbWlwc18yNGtjX211c2wvdGluaS0w
LjE5LjAvc3JjL3RpbmkuYzoyMjc6MjU6IGVycm9yOiBmb3JtYXQgJyVzJyBleHBlY3RzIGFyZ3Vt
ZW50IG9mIHR5cGUgJ2NoYXIgKicsIGJ1dCBhcmd1bWVudCAzIGhhcyB0eXBlICdpbnQnIFstV2Vy
cm9yPWZvcm1hdD1dCj4gKyAgMjI3IHwgICAgICAgICBmcHJpbnRmKGZpbGUsICIlcyAoJXMpXG4i
LCBiYXNlbmFtZShuYW1lKSwgVElOSV9WRVJTSU9OX1NUUklORyk7Cj4gKyAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICB+XiAgICAgICAgICB+fn5+fn5+fn5+fn5+fgo+ICsgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgfAo+ICsgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgIGNoYXIgKiAgICAgaW50Cj4gKyAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAlZAo+ICsKPiArYGBgYAo+ICsKPiArYmFzZW5hbWUoKSBtb2RpZmllcyB0aGUgaW5wdXQg
c3RyaW5nLCBjb3B5IGl0IGZpcnN0IHdpdGggc3RyZHVwKCksIElmCj4gK3N0cmR1cCgpIHJldHVy
bnMgTlVMTCB0aGUgY29kZSB3aWxsIGhhbmRsZSBpdC4KPiArCj4gK1NpZ25lZC1vZmYtYnk6IEhh
dWtlIE1laHJ0ZW5zIDxoYXVrZUBoYXVrZS1tLmRlPgo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRo
dWIuY29tL2tyYWxsaW4vdGluaS9jb21taXQvOTI0YzRiZDYwMjg0NTcxODg5NDJlY2JmZGM3NWU2
YTM0M2ZhOTM5NQo+ICtTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxl
QG1pbmQuYmU+Cj4gKy0tLQo+ICsgc3JjL3RpbmkuYyB8IDE1ICsrKysrKysrKysrLS0tLQo+ICsg
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gKwo+ICtk
aWZmIC0tZ2l0IGEvc3JjL3RpbmkuYyBiL3NyYy90aW5pLmMKPiAraW5kZXggNzkxNGQzYS4uNDFk
MTUwNiAxMDA2NDQKPiArLS0tIGEvc3JjL3RpbmkuYwo+ICsrKysgYi9zcmMvdGluaS5jCj4gK0BA
IC0xNCw2ICsxNCw3IEBACj4gKyAjaW5jbHVkZSA8c3RkbGliLmg+Cj4gKyAjaW5jbHVkZSA8dW5p
c3RkLmg+Cj4gKyAjaW5jbHVkZSA8c3RkYm9vbC5oPgo+ICsrI2luY2x1ZGUgPGxpYmdlbi5oPgo+
ICsgCj4gKyAjaW5jbHVkZSAidGluaUNvbmZpZy5oIgo+ICsgI2luY2x1ZGUgInRpbmlMaWNlbnNl
LmgiCj4gK0BAIC0yMjQsMTQgKzIyNSwxOSBAQCBpbnQgc3Bhd24oY29uc3Qgc2lnbmFsX2NvbmZp
Z3VyYXRpb25fdCogY29uc3Qgc2lnY29uZl9wdHIsIGNoYXIqIGNvbnN0IGFyZ3ZbXSwgaQo+ICsg
fQo+ICsgCj4gKyB2b2lkIHByaW50X3VzYWdlKGNoYXIqIGNvbnN0IG5hbWUsIEZJTEUqIGNvbnN0
IGZpbGUpIHsKPiArLQlmcHJpbnRmKGZpbGUsICIlcyAoJXMpXG4iLCBiYXNlbmFtZShuYW1lKSwg
VElOSV9WRVJTSU9OX1NUUklORyk7Cj4gKysJY2hhciAqZGlyYywgKmJuYW1lOwo+ICsrCj4gKysJ
ZGlyYyA9IHN0cmR1cChuYW1lKTsKPiArKwlibmFtZSA9IGJhc2VuYW1lKGRpcmMpOwo+ICsrCj4g
KysJZnByaW50ZihmaWxlLCAiJXMgKCVzKVxuIiwgYm5hbWUsIFRJTklfVkVSU0lPTl9TVFJJTkcp
Owo+ICsgCj4gKyAjaWYgVElOSV9NSU5JTUFMCj4gKy0JZnByaW50ZihmaWxlLCAiVXNhZ2U6ICVz
IFBST0dSQU0gW0FSR1NdIHwgLS12ZXJzaW9uXG5cbiIsIGJhc2VuYW1lKG5hbWUpKTsKPiArKwlm
cHJpbnRmKGZpbGUsICJVc2FnZTogJXMgUFJPR1JBTSBbQVJHU10gfCAtLXZlcnNpb25cblxuIiwg
Ym5hbWUpOwo+ICsgI2Vsc2UKPiArLQlmcHJpbnRmKGZpbGUsICJVc2FnZTogJXMgW09QVElPTlNd
IFBST0dSQU0gLS0gW0FSR1NdIHwgLS12ZXJzaW9uXG5cbiIsIGJhc2VuYW1lKG5hbWUpKTsKPiAr
KwlmcHJpbnRmKGZpbGUsICJVc2FnZTogJXMgW09QVElPTlNdIFBST0dSQU0gLS0gW0FSR1NdIHwg
LS12ZXJzaW9uXG5cbiIsIGJuYW1lKTsKPiArICNlbmRpZgo+ICstCWZwcmludGYoZmlsZSwgIkV4
ZWN1dGUgYSBwcm9ncmFtIHVuZGVyIHRoZSBzdXBlcnZpc2lvbiBvZiBhIHZhbGlkIGluaXQgcHJv
Y2VzcyAoJXMpXG5cbiIsIGJhc2VuYW1lKG5hbWUpKTsKPiArKwlmcHJpbnRmKGZpbGUsICJFeGVj
dXRlIGEgcHJvZ3JhbSB1bmRlciB0aGUgc3VwZXJ2aXNpb24gb2YgYSB2YWxpZCBpbml0IHByb2Nl
c3MgKCVzKVxuXG4iLCBibmFtZSk7Cj4gKyAKPiArIAlmcHJpbnRmKGZpbGUsICJDb21tYW5kIGxp
bmUgb3B0aW9uczpcblxuIik7Cj4gKyAKPiArQEAgLTI2MSw2ICsyNjcsNyBAQCB2b2lkIHByaW50
X3VzYWdlKGNoYXIqIGNvbnN0IG5hbWUsIEZJTEUqIGNvbnN0IGZpbGUpIHsKPiArIAlmcHJpbnRm
KGZpbGUsICIgICVzOiBTZW5kIHNpZ25hbHMgdG8gdGhlIGNoaWxkJ3MgcHJvY2VzcyBncm91cC5c
biIsIEtJTExfUFJPQ0VTU19HUk9VUF9HUk9VUF9FTlZfVkFSKTsKPiArIAo+ICsgCWZwcmludGYo
ZmlsZSwgIlxuIik7Cj4gKysJZnJlZShkaXJjKTsKPiArIH0KPiArIAo+ICsgdm9pZCBwcmludF9s
aWNlbnNlKEZJTEUqIGNvbnN0IGZpbGUpIHsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
