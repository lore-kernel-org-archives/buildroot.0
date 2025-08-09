Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FA9C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 18:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D2B640B81;
	Sat,  9 Aug 2025 18:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jd4X5uNnfMKD; Sat,  9 Aug 2025 18:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 218EC40B73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 218EC40B73;
	Sat,  9 Aug 2025 18:05:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8858E1D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 18:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82B458130E
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 18:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ovlb9rAQ5cwo for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 18:05:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7315481300
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7315481300
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7315481300
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 18:05:43 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b7892609a5so1733607f8f.1
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 11:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754762741; x=1755367541;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F3t+iLbT9JvOVT0pVsq9a2OkqucXOFJSN2eaj9PCeUI=;
 b=K04CptF3BP2SqKy14+2lyf971Enn/zmcbDgod2MM4vXhxF3S476Uxof49sY6UNopxU
 GSQgERXCn7ulsmMbFnNYrDmBup7EGgDSbTgdHgepLLC8GkcgzaQN3ir8sseDnx9YDDez
 +gxpBV4EIA37tTeQNNfOFH+MnpAOMhJQw+MALeFkTXBbavBkHKpjjifVCF/RvyhpaX3W
 /BhvBIsDy8OpTl9CuZg2+HdwY3mnvijnUm2ibtvu5YCSIJHu/k7KOr5oX2lr1Kr0KEs5
 x2P/UFzLFnclfiHztSWH1siPIpQlsdVwsqkRRVFj0jm7jc+oftklGmK8IK3nwifYo6h+
 4Ltw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz5R35UPIYfxqhBhsg1Zr1srL8hsjSvmmFPD55v3gdL3i5s7tRADVQBsznyB5m00hdZh8i7kK7zMo=@buildroot.org
X-Gm-Message-State: AOJu0YzESYIRdtDOe/YFSqMvvWy2IYv37DHUuxanMNGs0bo+veRrOtt8
 gu0BHzR6Yaf07aQdMdVjh/dVv06OtJ4DGTJNfOCeffBjyxwUNKlmeW+eGtanmF0tfkY=
X-Gm-Gg: ASbGnctsjK+mvtXbZV8mDRsdPXB3AYUEpKEfMqfcuQCsZm8Uo1Toi2oCab6b9j7eikJ
 zb2c4vF567Rp6LpqVd/PdDiQ8RAcSVL9NXkfsEcXR44oY/UAXaiHcrBzOEd/tGbwP+29r7rN3Rb
 yDn7pW3fraH8NED6hHLConQv/S43C2ovaJUnuKsF0iehATDD7ndUDAZO7d8L4YaNbDH5pebhnJF
 crIj1rXwoMtdIG8O5i89QMwJqGB13N/qlcr5jVFeImt1HNbXDvEC78os7Ywz0fe35llfr3J0faN
 qJZ0UkDLp037j2IOtchdNxhcP0XyUYZzJLjbMI1VvcXYgoJE5A2pgoittjQ+up84q+agROWmh+f
 9P5itbr6fogWkZmpe+mX4gtmQDT4RAXOigu876JRYmQxRiIidvbbFUtkHHqhrxn7NsQRP2jKTVq
 IfNMOSc+g6wW7yjZYOooxz9/asoTimXH/UDyOSWreBH7NhlEjbOQvS+XastBpw
X-Google-Smtp-Source: AGHT+IFXysu+sGgQ67OnpKrlcwTGIIFEsEdJhInXn79SGTro/yRQe8wypby+u/Rz+z7Fb/MrQiU08A==
X-Received: by 2002:a5d:5846:0:b0:3b7:95bc:a7ea with SMTP id
 ffacd0b85a97d-3b900b2d960mr5674595f8f.22.1754762741096; 
 Sat, 09 Aug 2025 11:05:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e586ad64sm181943035e9.20.2025.08.09.11.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 11:05:40 -0700 (PDT)
Message-ID: <d99579f5-ed38-4683-bb5b-c3e3b6815487@smile.fr>
Date: Sat, 9 Aug 2025 20:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>
References: <20250805194251.3397164-1-thomas.perale@mind.be>
Content-Language: fr, en-US
In-Reply-To: <20250805194251.3397164-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754762741; x=1755367541; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F3t+iLbT9JvOVT0pVsq9a2OkqucXOFJSN2eaj9PCeUI=;
 b=V+igZeI9GJ1ePh5K+OTFHhrJ6AoDV9noxFEP6Ed2WDLL/td5OIdKV7ASgUjAQK4pZZ
 S9qx8Y8q4kAzO95ij1jRQRNyiZcFbbSeb6IEHDTRBGYXZ5JPo6fphgRwx/QxkBHsG6BE
 HN+9R2oGI/YFBhQqTgOdscATq/jl+XoccsONg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=V+igZeI9
Subject: Re: [Buildroot] [PATCH] package/pthreadpool: fix thread dependency
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAwNS8wOC8yMDI1IMOgIDIxOjQyLCBUaG9tYXMgUGVyYWxl
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBPbiBhdXRvYnVpbGRlciBjb25maWcgd2l0aCBC
UjJfVE9PTENIQUlOX0hBU19USFJFQURTIG5vdCBzZXQgdGhlCj4gZm9sbG93aW5nIGVycm9yIGhh
cHBlbnMgd2hlbiBidWlsZGluZyB0aGUgcHRocmVhZHBvb2wgcGFja2FnZToKPiAKPiBgYGAKPiAt
LSBMb29raW5nIGZvciBwdGhyZWFkX2NyZWF0ZSBpbiBwdGhyZWFkcwo+IC0tIExvb2tpbmcgZm9y
IHB0aHJlYWRfY3JlYXRlIGluIHB0aHJlYWRzIC0gbm90IGZvdW5kCj4gLS0gTG9va2luZyBmb3Ig
cHRocmVhZF9jcmVhdGUgaW4gcHRocmVhZAo+IC0tIExvb2tpbmcgZm9yIHB0aHJlYWRfY3JlYXRl
IGluIHB0aHJlYWQgLSBub3QgZm91bmQKPiAtLSBDaGVjayBpZiBjb21waWxlciBhY2NlcHRzIC1w
dGhyZWFkCj4gLS0gQ2hlY2sgaWYgY29tcGlsZXIgYWNjZXB0cyAtcHRocmVhZCAtIG5vCj4gQ01h
a2UgRXJyb3IgYXQgL2hvbWUvYnVpbGRyb290L2luc3RhbmNlLTAvb3V0cHV0LTEvaG9zdC9zaGFy
ZS9jbWFrZS0zLjMxL01vZHVsZXMvRmluZFBhY2thZ2VIYW5kbGVTdGFuZGFyZEFyZ3MuY21ha2U6
MjMzIChtZXNzYWdlKToKPiAgIENvdWxkIE5PVCBmaW5kIFRocmVhZHMgKG1pc3Npbmc6IFRocmVh
ZHNfRk9VTkQpCj4gQ2FsbCBTdGFjayAobW9zdCByZWNlbnQgY2FsbCBmaXJzdCk6Cj4gICAvaG9t
ZS9idWlsZHJvb3QvaW5zdGFuY2UtMC9vdXRwdXQtMS9ob3N0L3NoYXJlL2NtYWtlLTMuMzEvTW9k
dWxlcy9GaW5kUGFja2FnZUhhbmRsZVN0YW5kYXJkQXJncy5jbWFrZTo2MDMgKF9GUEhTQV9GQUlM
VVJFX01FU1NBR0UpCj4gICAvaG9tZS9idWlsZHJvb3QvaW5zdGFuY2UtMC9vdXRwdXQtMS9ob3N0
L3NoYXJlL2NtYWtlLTMuMzEvTW9kdWxlcy9GaW5kVGhyZWFkcy5jbWFrZToyMjYgKEZJTkRfUEFD
S0FHRV9IQU5ETEVfU1RBTkRBUkRfQVJHUykKPiAgIENNYWtlTGlzdHMudHh0OjE0MyAoRklORF9Q
QUNLQUdFKQo+IAo+IC0tIENvbmZpZ3VyaW5nIGluY29tcGxldGUsIGVycm9ycyBvY2N1cnJlZCEK
PiBgYGAKPiAKPiBUaGlzIGNhbiBiZSByZXByb2R1Y2VkIHdpdGg6Cj4gCj4gYGBgCj4gY2F0ID4u
Y29uZmlnIDw8RU9GCj4gQlIyX2FybWViPXkKPiBCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9VQ0xJ
QkM9eQo+IEJSMl9QVEhSRUFEU19OT05FPXkKPiBCUjJfUEFDS0FHRV9QVEhSRUFEUE9PTD15Cj4g
RU9GCj4gbWFrZSBvbGRkZWZjb25maWcKPiBtYWtlIHB0aHJlYWRwb29sCj4gYGBgCj4gCj4gU2lu
Y2UgdGhlIGludHJvZHVjdGlvbiBvZiB0aGlzIHBhY2thZ2UgaW4gWzFdLCB0aGUgZGVwZW5kZW5j
eSB3YXMgbm90Cj4gaW5jbHVkZWQuIFNpbmNlIHRoaXMgcGFja2FnZSB3YXMgcGFydCBvZiB0aGUg
dGVuc29yZmxvdy1saXRlCj4gZGVwZW5kZW5jaWVzIHRoYXQgcmVxdWlyZWQgdGhyZWFkIGl0IHdh
cyBub3QgYW4gaXNzdWUuCj4gCj4gVGhpcyBwYXRjaCBhZGRzIEJSMl9UT09MQ0hBSU5fSEFTX1RI
UkVBRFMgaW4gdGhlIGRlcGVuZGVuY3kgdG8gYXZvaWQKPiBlcnJvcnMgd2hlbiBidWlsdCBhcyBh
IHN0YW5kYWxvbmUgcGFja2FnZS4KPiAKPiBbMV0gZjI0ODZhNmNmOSBwYWNrYWdlL3B0aHJlYWRw
b29sOiBuZXcgcGFja2FnZQo+IAo+IEZpeGVzOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qu
b3JnL3Jlc3VsdHMvMzVhLzM1YWExMDBkNzJjNjg3NTM1MGFkMTBjNTdmMDI4ZjA0MDUyY2JmNzkK
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Cj4g
LS0tCj4gIHBhY2thZ2UvcHRocmVhZHBvb2wvQ29uZmlnLmluIHwgMSArCj4gIHBhY2thZ2UveG5u
cGFjay9Db25maWcuaW4gICAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B0aHJlYWRwb29s
L0NvbmZpZy5pbiBiL3BhY2thZ2UvcHRocmVhZHBvb2wvQ29uZmlnLmluCj4gaW5kZXggMTk0YWUz
M2Y4NS4uMzI4OGI1NmRlZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B0aHJlYWRwb29sL0NvbmZp
Zy5pbgo+ICsrKyBiL3BhY2thZ2UvcHRocmVhZHBvb2wvQ29uZmlnLmluCj4gQEAgLTEsNSArMSw2
IEBACj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9QVEhSRUFEUE9PTAo+ICAJYm9vbCAicHRocmVhZHBv
b2wiCj4gKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPiAgCXNlbGVjdCBC
UjJfUEFDS0FHRV9GWERJVgo+ICAJaGVscAo+ICAJICBQdGhyZWFkcG9vbCBpcyBhIHBvcnRhYmxl
IGFuZCBlZmZpY2llbnQgdGhyZWFkIHBvb2wKCldpdGggdGhpcyBuZXcgZGVwZW5kZW5jeSBhZGRl
ZCwgeW91IHNob3VsZCBhZGQgYSBrY29uZmlnIGNvbW1lbnQ6Cgpjb21tZW50ICJwdGhyZWFkcG9v
bCBuZWVkcyBhIHRvb2xjaGFpbiB3LyB0aHJlYWRzIgoJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJ
Tl9IQVNfVEhSRUFEUwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3hubnBhY2svQ29uZmlnLmluIGIvcGFja2FnZS94bm5wYWNrL0NvbmZpZy5pbgo+IGluZGV4
IGU0YjkyZjYxZTguLjc5NGM1YzQ3ZDIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS94bm5wYWNrL0Nv
bmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UveG5ucGFjay9Db25maWcuaW4KPiBAQCAtOSw3ICs5LDcg
QEAgY29uZmlnIEJSMl9QQUNLQUdFX1hOTlBBQ0sKPiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0Vf
WE5OUEFDS19BUkNIX1NVUFBPUlRTCj4gIAlkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQ
UAo+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkgIyBDKysxNAo+
IC0JZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgY3B1aW5mbwo+ICsJZGVw
ZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgY3B1aW5mbywgcHRocmVhZHBvb2wK
PiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9DUFVJTkZPCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfRlAx
Ngo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0ZYRElWCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
