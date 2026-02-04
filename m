Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0109E83EF9
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98F3D81760;
	Wed,  4 Feb 2026 09:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gjvr75lsw6c6; Wed,  4 Feb 2026 09:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB4E8176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770197120;
	bh=5sWVsriAhra6YDvoY5Md7yCZr12P+7S+kl2p2EClwrc=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=E0ka7Vofnho/cTchLHDvcvAaP1AOrUzbLdVR3n+NkLqXW1PB8AKpqsjFq2Ypv1ido
	 JTsBTh64tgybLrRTc27rcjoFPwXKryrA9iltaDkKImYLmT5ASAZTEdYfbWEAw3Gn1a
	 fWO0WI/+5gX+zRf/z0OXDvA3ycS2kDKcKOdyrK9KKUquYex2rVidV6gQoart9p5wMv
	 9OAoW4zB359SO79FfPsfL+UjeNmpTgu4VuvfxfAqluloxb7H1r5z6R9NCkW7IEHbGx
	 F/yhdi8zk9ybAldDTku4+ICF4YpLKg/HYBQyUgvYeRi7RIJX3ETRdpqJ6qU7HkGh+x
	 3fUkVo3PwMr/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AB4E8176B;
	Wed,  4 Feb 2026 09:25:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ED94F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B5BB8176B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4O9JxD7ZLVB for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:25:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD63F81760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD63F81760
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD63F81760
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:25:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42fbc305552so6135986f8f.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 01:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770197116; x=1770801916;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vt+hWmFW++PlkkC7c6HJvaX082WtsJmUw1fPr4dSn4U=;
 b=fkyDoJDpkMWPSw/JUhWT7d1IHOR0N0oNlDOcXyL53ZLbe0OmeJQIoM0PM6eYNPfqMp
 V0oHX1SLkrR5CQ9JzerbpfbajWpH4ZmrCtA4YgY7DC3KV3rBkcj8kTEgvcoWdrrv5uzS
 7Dtsj+ACeq39k0xqJzJRKE2eqM3vM9jJ/T41D9EONK/vxXTHVBw0sL5Fo3oDy5lPq0s7
 Q+pJB1/j1FXOR1caFJxeJBJ1BBF5MWvb9lEUK/BZpN+wQOZRQsWUwgbNYt5WtAvCwqBD
 qoArtgwx+m0tNnHfWlGbmIvViXDt28WIh4xyz8VS2M7FO3R8xHLfErYz+MY3TahRKyRd
 fDrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0LOdx8Dgan3425UF1kKbJNAJBLpm5MQjmloGMVEF+isKcTHwGH5avxouIth40X6pgyCrc5GqMViU=@buildroot.org
X-Gm-Message-State: AOJu0YzBtsw6SQ1b8ZBJB9F+sTJgI8HhlXiLNQbmZtKr0BY3PIZKNO7z
 1RmlmeSUPMXm5sA+SGHHK98/WHjyLLvs40tJzZeAtsGSOpydlPJjim4nKTWe4M6vvz4Zf/3SZzz
 JMGzlsdY=
X-Gm-Gg: AZuq6aIBGdMA8vGQUDvGr1y2lsJNuDf1YNsq/6f5axZstfaTochksl0sdaxEhNoZNJs
 hTWPIK5rjPvlVW7pd89zxjeW66/DfkFUPRxa4xrBp0nI7N31obkhGKm6S8WH2zydZxtdprupOIy
 WLsFC/BXpssYbZ7QBy4xCZC6cVKCMNmRZUuHHBo5iV2iao4renZYX+MzuEcFIbPbaj5JrMgxnoP
 ycITPCwIKvv/ufJ34+j5aI1Y7lwFAgfwYmPr0B5h6dIDfSVUQhmxvpLjNEOS4SHIvYHTyCtS1Z+
 A9HdCK92Wc6CgGrfQzzrX1bpRedmEpu8kXYYpL2/kK+OeymBFdPFl3MSaTfyawwMgH05v3EEJVP
 e6A9iXyb/DGafJZ6fVIB6eqDIXv7caPysZCP/DfH7pu22UVzsrqs1yrlNEEANheFgbBBji2Ew41
 M/UA55DCfzlcffqZnUKo/2HsQ/MB9HpH3IrbGEu+buFU8tF9ZFMUbT
X-Received: by 2002:a05:600c:5491:b0:477:5ad9:6df1 with SMTP id
 5b1f17b1804b1-4830e92ca38mr35073455e9.3.1770197115616; 
 Wed, 04 Feb 2026 01:25:15 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830fe86bebsm13869825e9.10.2026.02.04.01.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 01:25:15 -0800 (PST)
Message-ID: <ba449fc7-15d8-4a94-8140-2b114d1e6df7@smile.fr>
Date: Wed, 4 Feb 2026 10:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Jardin <vjardin@free.fr>, buildroot@buildroot.org
References: <20260107180630.2471280-1-vjardin@free.fr>
 <20260107180630.2471280-2-vjardin@free.fr>
 <ea887719-ada5-4163-a8a3-fd5a3045c9cf@smile.fr>
Content-Language: fr
In-Reply-To: <ea887719-ada5-4163-a8a3-fd5a3045c9cf@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770197116; x=1770801916; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vt+hWmFW++PlkkC7c6HJvaX082WtsJmUw1fPr4dSn4U=;
 b=CaWkB7l3CrKKqYi6bKSkWuFkolXzjJNuAGNgfKO6kDUq4G9vYl5EAlizEzTUinU84u
 Diox5JGYII99heqEriQgzV3/8BCG3IB/E94Af+Z2hbNsuElZm/vp1uZXFgHiSX9peaXQ
 h4sh2C5GVzRJ9ca+O6D1pTCNtS82RL8w7bvSc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=CaWkB7l3
Subject: Re: [Buildroot] [PATCH v1 1/1] package/rpmsg-echo-test: new package
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

SGVsbG8gVmluY2VudCwgQWxsLAoKTGUgMDMvMDIvMjAyNiDDoCAyMzoyMiwgUm9tYWluIE5hb3Vy
IGEgw6ljcml0wqA6Cj4gSGVsbG8gVmluY2VudCwgQWxsLAo+IAo+IExlIDA3LzAxLzIwMjYgw6Ag
MTk6MDYsIFZpbmNlbnQgSmFyZGluIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPj4gTGludXgg
dXNlcnNwYWNlIFJQTXNnIGVjaG9fdGVzdCBkZW1vIGZyb20gdGhlIE9wZW5BTVAgc3lzdGVtCj4+
IHJlZmVyZW5jZSBleGFtcGxlcy4gVGhpcyBhcHBsaWNhdGlvbiB1c2VzIHRoZSBMaW51eCBrZXJu
ZWwgUlBNc2cKPj4gZnJhbWV3b3JrIHRvIHNlbmQgYnVmZmVycyB0byBhIHJlbW90ZSBwcm9jZXNz
b3IgYW5kIHZlcmlmeSB0aGUKPj4gZWNob2VkIGRhdGEuCj4+Cj4+IFJlcXVpcmVzIGtlcm5lbCBo
ZWFkZXJzID49IDQuMTEgZm9yIGxpbnV4L3JwbXNnLmguCj4gCj4gU2luY2UgdGhpcyBwYWNrYWdl
IGlzIGEgZGVtbyBwYWNrYWdlIGZvciB0ZXN0aW5nIGEgYmFzaWMgZXhhbXBsZSBvZiBPcGVuQU1Q
Cj4gcnBtc2csIGl0IGNvdWxkIGJlIG1vdmVkIGludG8gc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvPG9wZW5hbXA+IGRpcmVjdG9yeQo+IGFuZCB1c2VkIGJ5IGEgcnVudGltZSB0ZXN0Lgo+
IAo+IElzIHRoaXMgcGFja2FnZSBjYW4gYmUgcmVhbGx5IHVzZWQgb3RoZXIgdGhhbiB0ZXN0aW5n
IE9wZW5BTVA/Cj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgSmFyZGluIDx2amFyZGlu
QGZyZWUuZnI+Cj4+IC0tLQo+PiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCj4+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKPj4gIHBhY2thZ2UvcnBtc2ctZWNoby10ZXN0L0NvbmZpZy5pbiAgICAg
ICAgICAgIHwgMTcgKysrKysrKysrKwo+PiAgcGFja2FnZS9ycG1zZy1lY2hvLXRlc3QvcnBtc2ct
ZWNoby10ZXN0Lmhhc2ggfCAgMyArKwo+PiAgcGFja2FnZS9ycG1zZy1lY2hvLXRlc3QvcnBtc2ct
ZWNoby10ZXN0Lm1rICAgfCAzNSArKysrKysrKysrKysrKysrKysrKwo+PiAgNSBmaWxlcyBjaGFu
Z2VkLCA1NyBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ycG1z
Zy1lY2hvLXRlc3QvQ29uZmlnLmluCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ycG1z
Zy1lY2hvLXRlc3QvcnBtc2ctZWNoby10ZXN0Lmhhc2gKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3JwbXNnLWVjaG8tdGVzdC9ycG1zZy1lY2hvLXRlc3QubWsKPj4KPj4gZGlmZiAtLWdp
dCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4+IGluZGV4IGY5ODJlMzEyM2EuLjVkOTY4Y2U5
MTcgMTAwNjQ0Cj4+IC0tLSBhL0RFVkVMT1BFUlMKPj4gKysrIGIvREVWRUxPUEVSUwo+PiBAQCAt
MzM1OSw2ICszMzU5LDcgQEAgRjoJcGFja2FnZS9iZnNjcmlwdHMvCj4+ICBGOglwYWNrYWdlL2Rw
ZGsvCj4+ICBGOglwYWNrYWdlL2xpYmVjb2xpLwo+PiAgRjoJcGFja2FnZS9saWJ5YW5nLWNwcC8K
Pj4gK0Y6CXBhY2thZ2UvcnBtc2ctZWNoby10ZXN0Lwo+PiAgRjoJcGFja2FnZS9zeXNyZXBvLWNw
cC8KPj4gIAo+PiAgTjoJVmluY2VudCBQcmluY2UgPHZpbmNlbnQucHJpbmNlLmZyQGdtYWlsLmNv
bT4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4K
Pj4gaW5kZXggZGVmM2RiMGU1MC4uYTdiOGVlNjhlZSAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9D
b25maWcuaW4KPj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPj4gQEAgLTU4OSw2ICs1ODksNyBA
QCBlbmRtZW51Cj4+ICAJc291cmNlICJwYWNrYWdlL3JuZy10b29scy9Db25maWcuaW4iCj4+ICAJ
c291cmNlICJwYWNrYWdlL3JvY2tjaGlwLW1hbGkvQ29uZmlnLmluIgo+PiAgCXNvdXJjZSAicGFj
a2FnZS9yb2NrY2hpcC1ya2Jpbi9Db25maWcuaW4iCj4+ICsJc291cmNlICJwYWNrYWdlL3JwbXNn
LWVjaG8tdGVzdC9Db25maWcuaW4iCj4+ICAJc291cmNlICJwYWNrYWdlL3JzNDg1Y29uZi9Db25m
aWcuaW4iCj4+ICAJc291cmNlICJwYWNrYWdlL3J0Yy10b29scy9Db25maWcuaW4iCj4+ICAJc291
cmNlICJwYWNrYWdlL3J0bDgxODhldS9Db25maWcuaW4iCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3JwbXNnLWVjaG8tdGVzdC9Db25maWcuaW4gYi9wYWNrYWdlL3JwbXNnLWVjaG8tdGVzdC9Db25m
aWcuaW4KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uMzJmM2Qz
NzE1Ngo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2UvcnBtc2ctZWNoby10ZXN0L0Nv
bmZpZy5pbgo+PiBAQCAtMCwwICsxLDE3IEBACj4+ICtjb25maWcgQlIyX1BBQ0tBR0VfUlBNU0df
RUNIT19URVNUCj4+ICsJYm9vbCAicnBtc2ctZWNoby10ZXN0Igo+PiArCWRlcGVuZHMgb24gQlIy
X1VTRV9NTVUgIyBMaW51eCB1c2Vyc3BhY2Ugb25seQo+PiArCWRlcGVuZHMgb24gQlIyX1RPT0xD
SEFJTl9IRUFERVJTX0FUX0xFQVNUXzRfMTEgIyBsaW51eC9ycG1zZy5oCj4+ICsJaGVscAo+PiAr
CSAgTGludXggdXNlcnNwYWNlIFJQTXNnIGVjaG9fdGVzdCBkZW1vIGZyb20gdGhlIE9wZW5BTVAK
Pj4gKwkgIHN5c3RlbSByZWZlcmVuY2UgZXhhbXBsZXMuCj4+ICsKPj4gKwkgIFRoaXMgYXBwbGlj
YXRpb24gdXNlcyB0aGUgTGludXgga2VybmVsIFJQTXNnIGZyYW1ld29yawo+PiArCSAgdG8gc2Vu
ZCBidWZmZXJzIHRvIGEgcmVtb3RlIHByb2Nlc3NvciBhbmQgdmVyaWZ5IHRoZQo+PiArCSAgZWNo
b2VkIGRhdGEgKHNlZSAiZWNob190ZXN0IiBkZW1vIGluIHRoZSBPcGVuQU1QIGRvY3MpLgo+PiAr
Cj4+ICsJICBodHRwczovL2dpdGh1Yi5jb20vT3BlbkFNUC9vcGVuYW1wLXN5c3RlbS1yZWZlcmVu
Y2UKPj4gKwo+PiArY29tbWVudCAicnBtc2ctZWNoby10ZXN0IG5lZWRzIGEgdG9vbGNoYWluIHcv
IGtlcm5lbCBoZWFkZXJzID49IDQuMTEiCj4+ICsJZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+PiAr
CWRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF80XzExCj4+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3JwbXNnLWVjaG8tdGVzdC9ycG1zZy1lY2hvLXRlc3QuaGFzaCBiL3Bh
Y2thZ2UvcnBtc2ctZWNoby10ZXN0L3JwbXNnLWVjaG8tdGVzdC5oYXNoCj4+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjQxZjhjYTRiZjgKPj4gLS0tIC9kZXYvbnVs
bAo+PiArKysgYi9wYWNrYWdlL3JwbXNnLWVjaG8tdGVzdC9ycG1zZy1lY2hvLXRlc3QuaGFzaAo+
PiBAQCAtMCwwICsxLDMgQEAKPj4gKyMgTG9jYWxseSBjb21wdXRlZAo+PiArc2hhMjU2ICA4MDU5
ZmJkZTc0ZjcyNmVmZDc3OGYxMzkzZTc1ZjViNTU0ODcxZWE4YTlmNTEyNzg5MTI4MzhlYTQxNDAz
MWNhICBycG1zZy1lY2hvLXRlc3QtdjIwMjUuMDQuMC50YXIuZ3oKPj4gK3NoYTI1NiAgNjIzNDU3
ODhhMDE5NTk2MzYwYzdmNGU0MDI2Mjc4Y2M4NDc1NGRlNmJlYWZhYzgyZWEwZGUwNjQ3YjIzYzZl
ZCAgTElDRU5TRS5tZAo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycG1zZy1lY2hvLXRlc3QvcnBt
c2ctZWNoby10ZXN0Lm1rIGIvcGFja2FnZS9ycG1zZy1lY2hvLXRlc3QvcnBtc2ctZWNoby10ZXN0
Lm1rCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjNmOThhZWE3
YzQKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9wYWNrYWdlL3JwbXNnLWVjaG8tdGVzdC9ycG1z
Zy1lY2hvLXRlc3QubWsKPj4gQEAgLTAsMCArMSwzNSBAQAo+PiArIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPj4gKyMKPj4gKyMgcnBtc2ctZWNoby10ZXN0Cj4+ICsjCj4+ICsjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+PiArCj4+ICtSUE1TR19FQ0hPX1RFU1RfVkVSU0lPTiA9IHYyMDI1LjA0LjAK
Pj4gK1JQTVNHX0VDSE9fVEVTVF9TSVRFID0gJChjYWxsIGdpdGh1YixPcGVuQU1QLG9wZW5hbXAt
c3lzdGVtLXJlZmVyZW5jZSwkKFJQTVNHX0VDSE9fVEVTVF9WRVJTSU9OKSkKPj4gK1JQTVNHX0VD
SE9fVEVTVF9TVUJESVIgPSBleGFtcGxlcy9saW51eC9ycG1zZy1lY2hvLXRlc3QKPiAKPiBUaGlz
IGlzIHRoZSBzYW1lIHNvdXJjZXMgYXMgcnBtc2ctdXRpbHMgWzFdLCBjYW4geW91IGNoZWNrIGlm
IGl0IHdvdWxkIGJlCj4gcG9zc2libGUgdG8gc2hhcmUgdGhlIHNhbWUgcGFja2FnZSBmb3IgcnBt
c2ctdXRpbHMgYW5kIHJwbXNnLWVjaG8tdGVzdCA/Cj4gCj4gWzFdCj4gaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI2MDEwNzE4MDQ0MS4yNDcw
OTQ0LTItdmphcmRpbkBmcmVlLmZyLwo+IAo+PiArCj4+ICtSUE1TR19FQ0hPX1RFU1RfTElDRU5T
RSA9IEJTRC0zLUNsYXVzZQo+PiArUlBNU0dfRUNIT19URVNUX0xJQ0VOU0VfRklMRVMgPSBMSUNF
TlNFLm1kCj4+ICsKPj4gK2RlZmluZSBSUE1TR19FQ0hPX1RFU1RfQlVJTERfQ01EUwo+PiArCSQo
VEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpIC1DICQoQEQpLyQoUlBNU0dfRUNIT19URVNUX1NVQkRJ
UikgXAo+PiArCQlDQz0iJChUQVJHRVRfQ0MpIiBcCj4+ICsJCUxEPSIkKFRBUkdFVF9MRCkiIFwK
Pj4gKwkJQ0ZMQUdTPSIkKFRBUkdFVF9DRkxBR1MpIiBcCj4+ICsJCUxERkxBR1M9IiQoVEFSR0VU
X0xERkxBR1MpIgo+PiArZW5kZWYKPj4gKwo+PiArZGVmaW5lIFJQTVNHX0VDSE9fVEVTVF9JTlNU
QUxMX1RBUkdFVF9DTURTCj4+ICsJJChJTlNUQUxMKSAtRCAtbSAwNzU1IFwKPj4gKwkJJChARCkv
JChSUE1TR19FQ0hPX1RFU1RfU1VCRElSKS9lY2hvX3Rlc3QgXAo+PiArCQkkKFRBUkdFVF9ESVIp
L3Vzci9iaW4vZWNob190ZXN0Cj4gCj4gSXQncyBwcm9taXNpbmcsIHRoZSBuZXh0IHN0ZXAgaXMg
dG8gdXNlIGl0IGZyb20gYSBydW50aW1lIHRlc3QuCgpPYmlvdXNseSwgaXQgd291bGQgcmVxdWly
ZXMgYSByZW1vdGVwcm9jIHJ1bm5pbmcgaW4gUWVtdS4uLiB0aGUgcnVudGltZSB0ZXN0CnNldHVw
IGxvb2tzIGNvbXBsZXggYnV0IGxvb2sgaG93IG9wZW5BTVAgdGhlaXIgZGVtb3M6CgpodHRwczov
L29wZW5hbXAucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2RlbW9zL2RvY2tlcl9pbWFnZXMuaHRt
bAoKSXQgbWF5IHJlcXVpcmVzIHNvbWUgY3VzdG9tIGNoYW5nZXMgaW4gdGhlIHRlc3Qgc2V0dXAg
dG8gc3RhcnQgc2V2ZXJhbCBxZW11Cmluc3RhbmNlcyBidXQgaXQncyBzaG91bGQgYmUgZG9hYmxl
LiBCdXQgdGhlbiB0aGUgcXVlc3Rpb24gaXMsIGhvdyB0bwpvYnRhaW4vYnVpbGQgdGhlIGJhcmVt
ZXRhbC9ydG9zIGZpcm13YXJlIHJ1bm5pbmcgb24gdGhlIHJlbW90ZWNvcmUgPwoKQmVzdCByZWdh
cmRzLApSb21haW4KCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAKPiAKPj4gK2VuZGVm
Cj4+ICsKPj4gK2RlZmluZSBSUE1TR19FQ0hPX1RFU1RfTElOVVhfQ09ORklHX0ZJWFVQUwo+PiAr
CSQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX1JQTVNHKQo+PiArCSQoY2FsbCBLQ09O
RklHX0VOQUJMRV9PUFQsQ09ORklHX1JQTVNHX0NIQVIpCj4+ICsJJChjYWxsIEtDT05GSUdfRU5B
QkxFX09QVCxDT05GSUdfUlBNU0dfQ1RSTCkKPj4gKwkkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BU
LENPTkZJR19SUE1TR19WSVJUSU8pCj4+ICtlbmRlZgo+PiArCj4+ICskKGV2YWwgJChnZW5lcmlj
LXBhY2thZ2UpKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
