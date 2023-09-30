Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063F7E77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B228983DBC;
	Sat, 30 Sep 2023 13:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B228983DBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2oCr2vgI3xE; Sat, 30 Sep 2023 13:58:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F16383DB3;
	Sat, 30 Sep 2023 13:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F16383DB3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 680761BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 405C060A94
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 405C060A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EmOFZh9js67c for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:58:05 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3E1A60A74
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E1A60A74
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3248aa5cf4eso2500224f8f.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 06:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696082283; x=1696687083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t6zz+RISgzwPaCsABYGDrvnEOwtQdxO4UFs0WyHE+Y0=;
 b=b3muxERmmiP84Jc9tboirzfaSwWbt+lMNrTG4cwYc+765/mFHBj1ozMgUq+A5nRX3m
 4oUGebaHhJhjr1rATnk4WM8S/bHE1qaVXC+j2g0gneTvr8EpNfqk/9JdR/ZNzLzXU1oi
 AimVFeVqF7CYAn9hbxjl/fJBsBeaJPQYDunXYqBbloNFubo6k9PZWGP1AeO/G7/H4sIk
 HLF7mGWi4Hsr2+mMDrPdYIoR+qYqcw+Nbr9f1MuGJ+5iy2VWDFRdZbzKFbRsJAucBuNC
 iqFuZ/UU/qy6nZqDEpNKl+9KhYNR/nlEvHynY+koTxoZom99CCUiD7hAitsuprfVkhZp
 b26Q==
X-Gm-Message-State: AOJu0YwU57aw/OzttHL9/u9n0LcHg4pd9yfmoDJMtpMSRzsU6GRVHsFu
 24Kui/JXaNMUWJUYGi6CdFKkWg==
X-Google-Smtp-Source: AGHT+IFiK3+yb3TLZvUy9V84tdEY4lgvx1PZy/RCnWFHEJrvBZhMEjVJ2KtGiKwmk7GK3PXIv09XEA==
X-Received: by 2002:a5d:538f:0:b0:322:4892:17f with SMTP id
 d15-20020a5d538f000000b003224892017fmr6608704wrv.7.1696082282968; 
 Sat, 30 Sep 2023 06:58:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6?
 (2a01cb0404ad0b000ca75da681015ca6.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6])
 by smtp.gmail.com with ESMTPSA id
 z17-20020adfd0d1000000b00317a04131c5sm23674657wrh.57.2023.09.30.06.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 06:58:02 -0700 (PDT)
Message-ID: <fa5067b6-5068-ac89-a228-2e89903d5c5b@smile.fr>
Date: Sat, 30 Sep 2023 15:58:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: fr
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20230929214441.2090519-1-peter@korsgaard.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230929214441.2090519-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696082283; x=1696687083;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t6zz+RISgzwPaCsABYGDrvnEOwtQdxO4UFs0WyHE+Y0=;
 b=BCYN+39SR/lJQbHXU5frYQ/HO0TYYk7788O2cbxjKyTCbR5hYVKL2mocn6i7ccmFxT
 ElDaGur3GevuVwRK/R2o5VT+RnM2v9QAW0+VekaydRjANQuU7v0WBimqSl94Y22zgVQ+
 Iq0YkPtg5McAyF1j/CHv96oBO0zo8JYjrhR+QWudE029LxXQcKdrDwTuOBMGRuDy0W9h
 WbjuyqG4rBYrHe+jkwcOWvZolzmR6SZBvgktpPhF8Hl9BXYHKHhqpLCpoxRaUtzPA7bu
 FYOPyNPIfGqNHZavruPvNXDV0jqFr7ZTQLjhyVp9AfRvwa8Nc8Jbq+dwv5EkFft8n3+Q
 UTCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=BCYN+39S
Subject: Re: [Buildroot] [PATCH-2023.08.x] package/{glibc,
 localedef}: security bump to 2.37-43
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAyOS8wOS8yMDIzIMOgIDIzOjQ0LCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlczoKPiAKPiBDVkUt
MjAyMy0yNTEzOTogV2hlbiB0aGUgcHJpbnRmIGZhbWlseSBvZiBmdW5jdGlvbnMgaXMgY2FsbGVk
IHdpdGggYQo+IGZvcm1hdCBzcGVjaWZpZXIgdGhhdCB1c2VzIGFuIDxhcG9zdHJvcGhlPiAoZW5h
YmxlIGdyb3VwaW5nKSBhbmQgYQo+IG1pbmltdW0gd2lkdGggc3BlY2lmaWVyLCB0aGUgcmVzdWx0
aW5nIG91dHB1dCBjb3VsZCBiZSBsYXJnZXIgdGhhbgo+IHJlYXNvbmFibHkgZXhwZWN0ZWQgYnkg
YSBjYWxsZXIgdGhhdCBjb21wdXRlZCBhIHRpZ2h0IGJvdW5kIG9uIHRoZQo+IGJ1ZmZlciBzaXpl
LiAgVGhlIHJlc3VsdGluZyBsYXJnZXIgdGhhbiBleHBlY3RlZCBvdXRwdXQgY291bGQgcmVzdWx0
Cj4gaW4gYSBidWZmZXIgb3ZlcmZsb3cgaW4gdGhlIHByaW50ZiBmYW1pbHkgb2YgZnVuY3Rpb25z
Lgo+IAo+IENWRS0yMDIzLTQ1Mjc6IElmIHRoZSBzeXN0ZW0gaXMgY29uZmlndXJlZCBpbiBuby1h
YWFhIG1vZGUgdmlhCj4gL2V0Yy9yZXNvbHYuY29uZiwgZ2V0YWRkcmluZm8gaXMgY2FsbGVkIGZv
ciB0aGUgQUZfVU5TUEVDIGFkZHJlc3MKPiBmYW1pbHksIGFuZCBhIEROUyByZXNwb25zZSBpcyBy
ZWNlaXZlZCBvdmVyIFRDUCB0aGF0IGlzIGxhcmdlciB0aGFuCj4gMjA0OCBieXRlcywgZ2V0YWRk
cmluZm8gbWF5IHBvdGVudGlhbGx5IGRpc2Nsb3NlIHN0YWNrIGNvbnRlbnRzIHZpYQo+IHRoZSBy
ZXR1cm5lZCBhZGRyZXNzIGRhdGEsIG9yIGNyYXNoLgo+IAo+IENWRS0yMDIzLTQ4MDY6IFdoZW4g
YW4gTlNTIHBsdWdpbiBvbmx5IGltcGxlbWVudHMgdGhlCj4gX2dldGhvc3RieW5hbWUyX3IgYW5k
IF9nZXRjYW5vbm5hbWVfciBjYWxsYmFja3MsIGdldGFkZHJpbmZvIGNvdWxkIHVzZQo+IG1lbW9y
eSB0aGF0IHdhcyBmcmVlZCBkdXJpbmcgYnVmZmVyIHJlc2l6aW5nLCBwb3RlbnRpYWxseSBjYXVz
aW5nIGEKPiBjcmFzaCBvciByZWFkIG9yIHdyaXRlIHRvIGFyYml0cmFyeSBtZW1vcnkuCj4gCj4g
Q1ZFLTIwMjMtNTE1NjogVGhlIGZpeCBmb3IgQ1ZFLTIwMjMtNDgwNiBpbnRyb2R1Y2VkIGEgbWVt
b3J5IGxlYWsgd2hlbgo+IGFuIGFwcGxpY2F0aW9uIGNhbGxzIGdldGFkZHJpbmZvIGZvciBBRl9J
TkVUNiB3aXRoIEFJX0NBTk9OTkFNRSwKPiBBSV9BTEwgYW5kIEFJX1Y0TUFQUEVEIGZsYWdzIHNl
dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5j
b20+CgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpC
ZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAtLS0KPiAgcGFja2FnZS9nbGliYy9nbGliYy5oYXNoICAg
ICAgIHwgMiArLQo+ICBwYWNrYWdlL2dsaWJjL2dsaWJjLm1rICAgICAgICAgfCAyICstCj4gIHBh
Y2thZ2UvbG9jYWxlZGVmL2xvY2FsZWRlZi5tayB8IDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
Z2xpYmMvZ2xpYmMuaGFzaCBiL3BhY2thZ2UvZ2xpYmMvZ2xpYmMuaGFzaAo+IGluZGV4IDQ1M2Fh
ZGFlMTEuLmFiMzEwNDk4YjggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nbGliYy9nbGliYy5oYXNo
Cj4gKysrIGIvcGFja2FnZS9nbGliYy9nbGliYy5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gICMg
TG9jYWxseSBjYWxjdWxhdGVkIChmZXRjaGVkIGZyb20gR2l0aHViKQo+IC1zaGEyNTYgIDBmOGJm
YWQwYjg1M2EwYzZlMWRkMWMzMjU0YTMwYjU4ZDRjNzA1MDg3MGZlMmIwZGE5MGFkNDBmNGQ0NTBj
ZTIgIGdsaWJjLTIuMzctMi1nOWY4NTEzZGM2NDExOWE0MjRiMzEyZGI5N2NlZjVkODdkMzc2ZGVm
YS50YXIuZ3oKPiArc2hhMjU2ICA3MTI5ZGZhZGVhMjllOGYyMDg2NTE4NmE3ZmRlYzNkYzNlNjVk
MDU1YTgxZGM4ZmMzOTkxODk0OTFiYmE0OTNjICBnbGliYy0yLjM3LTQzLWc5NGVmNzAxMzY1ODdj
NDBhMzU3Zjc3NTY3Nzk5N2M3NTNiM2RlNTZjLnRhci5nego+ICAKPiAgIyBIYXNoZXMgZm9yIGxp
Y2Vuc2UgZmlsZXMKPiAgc2hhMjU2ICA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2
NzVhZmI1MTRkNGU2OGE0MDQwMTA1MjFiODgwNjQzICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZ2xpYmMvZ2xpYmMubWsgYi9wYWNrYWdlL2dsaWJjL2dsaWJjLm1rCj4gaW5kZXggNzll
NmM3NmNiNC4uNjY2ZDllNGE4YyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dsaWJjL2dsaWJjLm1r
Cj4gKysrIGIvcGFja2FnZS9nbGliYy9nbGliYy5tawo+IEBAIC03LDcgKzcsNyBAQAo+ICAjIEdl
bmVyYXRlIHZlcnNpb24gc3RyaW5nIHVzaW5nOgo+ICAjICAgZ2l0IGRlc2NyaWJlIC0tbWF0Y2gg
J2dsaWJjLSonIC0tYWJicmV2PTQwIG9yaWdpbi9yZWxlYXNlL01BSk9SLk1JTk9SL21hc3RlciB8
IGN1dCAtZCAnLScgLWYgMi0KPiAgIyBXaGVuIHVwZGF0aW5nIHRoZSB2ZXJzaW9uLCBwbGVhc2Ug
YWxzbyB1cGRhdGUgbG9jYWxlZGVmCj4gLUdMSUJDX1ZFUlNJT04gPSAyLjM3LTItZzlmODUxM2Rj
NjQxMTlhNDI0YjMxMmRiOTdjZWY1ZDg3ZDM3NmRlZmEKPiArR0xJQkNfVkVSU0lPTiA9IDIuMzct
NDMtZzk0ZWY3MDEzNjU4N2M0MGEzNTdmNzc1Njc3OTk3Yzc1M2IzZGU1NmMKPiAgIyBVcHN0cmVh
bSBkb2Vzbid0IG9mZmljaWFsbHkgcHJvdmlkZSBhbiBodHRwcyBkb3dubG9hZCBsaW5rLgo+ICAj
IFRoZXJlIGlzIG9uZSAoaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvZ2xpYmMuZ2l0KSBidXQg
aXQncyBub3QgcmVsaWFibGUsCj4gICMgc29tZXRpbWVzIHRoZSBjb25uZWN0aW9uIHRpbWVzIG91
dC4gU28gdXNlIGFuIHVub2ZmaWNpYWwgZ2l0aHViIG1pcnJvci4KPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9sb2NhbGVkZWYvbG9jYWxlZGVmLm1rIGIvcGFja2FnZS9sb2NhbGVkZWYvbG9jYWxlZGVm
Lm1rCj4gaW5kZXggNmY4YjE3MDUxNi4uZDM2ODEyMWExYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L2xvY2FsZWRlZi9sb2NhbGVkZWYubWsKPiArKysgYi9wYWNrYWdlL2xvY2FsZWRlZi9sb2NhbGVk
ZWYubWsKPiBAQCAtNyw3ICs3LDcgQEAKPiAgIyBVc2UgdGhlIHNhbWUgVkVSU0lPTiBhbmQgU0lU
RSBhcyB0YXJnZXQgZ2xpYmMKPiAgIyBBcyBpbiBnbGliYy5taywgZ2VuZXJhdGUgdmVyc2lvbiBz
dHJpbmcgdXNpbmc6Cj4gICMgICBnaXQgZGVzY3JpYmUgLS1tYXRjaCAnZ2xpYmMtKicgLS1hYmJy
ZXY9NDAgb3JpZ2luL3JlbGVhc2UvTUFKT1IuTUlOT1IvbWFzdGVyIHwgY3V0IC1kICctJyAtZiAy
LQo+IC1MT0NBTEVERUZfVkVSU0lPTiA9IDIuMzctMi1nOWY4NTEzZGM2NDExOWE0MjRiMzEyZGI5
N2NlZjVkODdkMzc2ZGVmYQo+ICtMT0NBTEVERUZfVkVSU0lPTiA9IDIuMzctNDMtZzk0ZWY3MDEz
NjU4N2M0MGEzNTdmNzc1Njc3OTk3Yzc1M2IzZGU1NmMKPiAgTE9DQUxFREVGX1NPVVJDRSA9IGds
aWJjLSQoTE9DQUxFREVGX1ZFUlNJT04pLnRhci5nego+ICBMT0NBTEVERUZfU0lURSA9ICQoY2Fs
bCBnaXRodWIsYm1pbm9yLGdsaWJjLCQoTE9DQUxFREVGX1ZFUlNJT04pKQo+ICBIT1NUX0xPQ0FM
RURFRl9ETF9TVUJESVIgPSBnbGliYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
