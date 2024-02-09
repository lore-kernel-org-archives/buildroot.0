Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6CDC4828F
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 10:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E29E042232;
	Fri,  9 Feb 2024 10:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id quBejon0ppnz; Fri,  9 Feb 2024 10:25:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1D4041FE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1D4041FE7;
	Fri,  9 Feb 2024 10:25:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CEA71BF271
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 10:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85CC341BDE
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 10:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRsDBxhcp5Hm for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 10:25:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CA3B404DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CA3B404DF
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CA3B404DF
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 10:25:44 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a38291dbe65so90479566b.3
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 02:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707474343; x=1708079143;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sL0rFs080xQ5cOGl6V9h0z2ZgWoeBPDxcL67ybj0QHE=;
 b=wD8IvUislVOBBJcVMCvpaHQM7cHguc/8oXY7C/7Gy2YQeUAwe0coRth7hQ/0+BmLyP
 8Z0Y3MUVfEZDciIitBDOWNpOVyg71aJ8rpimOT5ar+/JEgnUT0evLBEIpYVMsRJpUV9E
 G+F6Lqk/2+vjrM0tB/mo1BaRcK/i3l5av8BDNha79GoDHghG8k6ylZuiJ9awJRwKcgFg
 aYgdiTuowo4QKY2n7eOry6VUo8fP/6nj4wRTYHzGZtmxhS/BjKFhFZnQpGcNDsm1HoXk
 Gw53oC+Pf8zWbCLVLl9wcAPUHUbNVZr2wdDRpgflcBU/285mKZxdhT7zrTiXqMS1DqNr
 KP3A==
X-Gm-Message-State: AOJu0Ywupvcv0C3I2KEUIb70Ulun4KIa1faINewsf9IkvOPRS0jGT3MR
 8kyw5S87LiqIQXGiXOYeVsjwP7paqLPshK9M6ttNbVxWPGmF9aqd+RXvpeRedT0=
X-Google-Smtp-Source: AGHT+IE72W8EdnObnDdP9z66hwYzzyMcdbL59YH/U3xRAmjSF43Y8pfCgIi0EXFryaPTFsPDco3I5g==
X-Received: by 2002:a17:906:a853:b0:a3c:7ab:a6ea with SMTP id
 dx19-20020a170906a85300b00a3c07aba6eamr22247ejb.57.1707474342764; 
 Fri, 09 Feb 2024 02:25:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWuiHuvphV4A0MSIpDdrfvtktngvSSd4TQUZbm+BrE/lm147LI7Puj2u1ktLkp6Kj2HCxSkiUofxr/uYq1lqIpC0qDVoWgkm5AlNuqAsqP3iqLxfIEmFKa3YqRo5IiZ/PfwkYKoNyBeG4xcE7CNSRHkLERlS00XtEg50aHdk8WkNIslhpoJ9Iizrqn3xG14ClzdEHrEyGnJw0Dw5wUV7ptKpWukXKot7sl4cgdCgVRj4IEK
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 fy15-20020a170906b7cf00b00a37ad2c72dasm606235ejb.183.2024.02.09.02.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 02:25:42 -0800 (PST)
Message-ID: <6211cb6a-632a-404a-94c8-998f499c7cf2@mind.be>
Date: Fri, 9 Feb 2024 11:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20240115-imx93-support-v5-0-c2c950104c58@armadeus.com>
 <20240115-imx93-support-v5-1-c2c950104c58@armadeus.com>
 <d1b5f5a0-8c85-425c-95f6-6504a6e9ceac@mind.be>
 <c7c54e8d-eda0-4331-9ef4-949f0c364fa5@armadeus.com>
In-Reply-To: <c7c54e8d-eda0-4331-9ef4-949f0c364fa5@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707474343; x=1708079143; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sL0rFs080xQ5cOGl6V9h0z2ZgWoeBPDxcL67ybj0QHE=;
 b=E7gDK6j2a9loxKso1k0d5CUtBmNR424YdXkI+U48UGcRyB+M6+tZgDAl7s4bHQPcO0
 CpnlB8qCiuzPald72LAWPE22CqrFiS/5PW0B5uRz4rP0YXjx8WYqNlGvBp8kphZHt1ka
 MEYjssKk+kCfMiXeN8/zQ11aPNENLQIaQvxBtG0JrBzJ7Y4m9fE+KB6+BAu1myVOtu4D
 bXT8UyVyfe/9TOyicCqVh0oMI3b9TfNwa+79tvCrtBWIpOQ3HxpcHg/FYkgkRO9g1CNX
 Kz6xAm5U4dz1u60VjltpchDnyc+j0b6W+6Dp6YgR77gBzDtOr2ZjxD1/ysUBjRgfflFZ
 UH0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E7gDK6j2
Subject: Re: [Buildroot] [PATCH v5 1/3] package/freescale-imx: add i.MX91
 and i.MX93 SoC support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOS8wMi8yMDI0IDEwOjI5LCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBIaSBB
cm5vdXQsCj4gCj4gT24gMi84LzI0IDIzOjM2LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToK
Pj4gwqDCoEhpIFNlzIFiYXN0aWVuLAo+Pgo+PiDCoMKgSXQncyBubyBmdW4gdGhhdCBJIHN0aWxs
IGhhdmUgcXVlc3Rpb25zIG9uIHY1LCBidXQgdW5mb3J0dW5hdGVseS4uLgoKICBJJ2xsIHNlZSB0
aGlzIHdlZWtlbmQgaWYgSSBjYW4gbWVyZ2UgdjUgd2l0aCB0aGUgZmVlZGJhY2sgeW91IGdpdmUg
YmVsb3cuIApVbmxlc3MgeW91IHNlbmQgYSB2NiBiZWZvcmUgdGhhdCBvZiBjb3Vyc2UhCgpbc25p
cF0KPj4+ICsKPj4+ICtjb25maWcgQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV9J
TVg5MUExCj4+PiArwqDCoMKgIGJvb2wgImlteDkxYTEiCj4+PiArwqDCoMKgIGRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV9JTVg5MQo+Pgo+PiDCoMKgU2luY2Ug
Zm9yIElNWDkxIHRoZXJlIGlzIG9ubHkgb25lIG9wdGlvbiwgSSB0aGluayBpdCBtYWtlcyBtb3Jl
IHNlbnNlIHRvIG5vdCAKPj4gb2ZmZXIgYSBjaG9pY2UgZm9yIHRoaXMuIEp1c3QgYWx3YXlzIHVz
ZSB0aGlzIG9uZSBmb3IgdGhlIElNWDkxLiBXZSBjYW4gc3RpbGwgCj4+IGFkZCBpdCBiYWNrIGlm
IHRoZXJlIGV2ZXIgdHVybnMgb3V0IHRvIGJlIGFuIGlteDkxYTIuCgogIFRoaXMgaXMgYWN0dWFs
bHkgdGhlIG1haW4gdGhpbmcgSSB3YW50ZWQgY29uZmlybWF0aW9uIGFib3V0IGZyb20geW91Li4u
IERvIHlvdSAKYWdyZWUgdGhhdCB3ZSBvbmx5IG5lZWQgdGhlIHJldmlzaW9uIG9wdGlvbiBmb3Ig
SU1YOTMsIG5vdCBmb3IgSU1YOTE/Cgo+Pgo+Pj4gKwo+Pj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9G
UkVFU0NBTEVfSU1YX1BMQVRGT1JNX0lNWDkzQTAKPj4+ICvCoMKgwqAgYm9vbCAiaW14OTNhMCIK
Pj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9GUkVFU0NBTEVfSU1YX1BMQVRGT1JN
X0lNWDkzCj4+PiArCj4+PiArY29uZmlnIEJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZP
Uk1fSU1YOTNBMQo+Pj4gK8KgwqDCoCBib29sICJpbXg5M2ExIgo+Pj4gK8KgwqDCoCBkZXBlbmRz
IG9uIEJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOTMKPj4+ICsKPj4+IMKg
IGVuZGNob2ljZQo+Pgo+PiBbc25pcF0KPj4+IEBAIC04OSw2ICs5NSw5IEBAIGNvbmZpZyBCUjJf
UEFDS0FHRV9GSVJNV0FSRV9JTVhfRERSX1ZFUlNJT04KPj4+IMKgwqDCoMKgwqAgIyB1bmNvbmRp
dGlvbmFsbHkgdXNlIEhXIHZlcnNpb24gMjAxODEwIHdoZW4gRERSMy9ERFI0IHdhcwo+Pj4gwqDC
oMKgwqDCoCAjIHNlbGVjdGVkCj4+PiDCoMKgwqDCoMKgIGRlZmF1bHQgIjIwMTgxMCIgaWYgQlIy
X1BBQ0tBR0VfRklSTVdBUkVfSU1YX0REUjMgfHwgCj4+PiBCUjJfUEFDS0FHRV9GSVJNV0FSRV9J
TVhfRERSNAo+Pj4gK8KgwqDCoCBkZWZhdWx0ICJ2MjAyMjAxIiBpZiBcCj4+Cj4+IMKgwqBGb3Ig
dGhlIHRpbWUgYmVpbmcsIHRoZXJlIGlzIG9ubHkgb25lIHZlcnNpb24gZm9yIHRoZSBJTVg5MS8z
LiBTbyBpdCBtYWtlcyAKPj4gbm8gc2Vuc2UgdG8gZ2l2ZSBhbiBvcHRpb24gZm9yIGl0LiAoSW4g
ZmFjdCwgdGhpcyByZWFsbHkgc2hvdWxkIGhhdmUgYmVlbiBhIAo+PiBjaG9pY2UgaW5zdGVhZCBv
ZiBhIHN0cmluZyBvcHRpb24gYmVjYXVzZSB0aGVyZSBhcmUgb25seSBhIGZpeGVkIHNldCBvZiAK
Pj4gb3B0aW9ucy4uLiBCdXQgdGhhdCdzIGEgc2VwYXJhdGUgdG9waWMuKQo+Pgo+PiDCoMKgQnkg
dGhlIHdheSwgZG8gdGhlc2UgU29DcyB1c2UgdGhlIHBsYWluIDIwMjAwNiB2ZXJzaW9uIGZvciBE
RFI0IGxpa2UgdGhlIAo+PiBvdGhlciBTb0NzPyBBbmQgZG8gdGhleSBhbHNvIHN1cHBvcnQgRERS
Mz8KPiAKPiBUaGUgaS5NWDl7MSwzfSBTb0NzIGRvbid0IHN1cHBvcnQgRERSNCBhbmQgRERSMy4u
LiBPbmx5IExQRERSNCBvciBMUEREUjRYLCBoZW5jZSAKPiBteSBjaGFuZ2VzIGJlbG93IEJSMl9Q
QUNLQUdFX0ZJUk1XQVJFX0lNWF9ERFJ7Myw0fSBvcHRpb25zLgoKICBPaCwgSSBtaXNzZWQgdGhh
dC4gU28gZm9yIElNWDkgdGhlcmUgaXMgbm8gYWN0dWFsIGNob2ljZSwgaXQncyBhbHdheXMgTFBE
RFI0IAooYmVjYXVzZSB3ZSBoYXZlIG5vIExQRERSNFggb3B0aW9uIGF0IHRoZSBtb21lbnQsIGFu
ZCB0aGVyZSBhbHNvIGRvZXNuJ3Qgc2VlbSB0byAKYmUgYW55IGZpcm13YXJlIGZvciBpdC4uLik/
CgoKPj4+ICvCoMKgwqDCoMKgwqDCoCBCUjJfUEFDS0FHRV9GUkVFU0NBTEVfSU1YX1BMQVRGT1JN
X0lNWDkxIHx8IFwKPj4+ICvCoMKgwqDCoMKgwqDCoCBCUjJfUEFDS0FHRV9GUkVFU0NBTEVfSU1Y
X1BMQVRGT1JNX0lNWDkzCj4+PiDCoMKgwqDCoMKgIGhlbHAKPj4+IMKgwqDCoMKgwqDCoMKgIFVz
ZSBhIHNwZWNpZmljIHZlcnNpb24gb2YgdGhlIGlteCBkZHIgYmluYXJpZXMuIExlYXZpbmcgdGhp
cwo+Pj4gwqDCoMKgwqDCoMKgwqAgZmllbGQgZW1wdHkgd2lsbCBzZWxlY3QgdGhlIGRlZmF1bHQg
dmVyc2lvbi4KPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUt
aW14L2Zpcm13YXJlLWlteC5tayAKPj4+IGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJl
LWlteC9maXJtd2FyZS1pbXgubWsKPj4+IGluZGV4IDY2ZWY4YzM5MzBiZS4uMWYzNmY5MTdjZGM4
IDEwMDY0NAo+Pj4gLS0tIGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJt
d2FyZS1pbXgubWsKPj4+ICsrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgv
ZmlybXdhcmUtaW14Lm1rCj4+PiBAQCAtNDgsNiArNDgsMzAgQEAgZW5kaWYKPj4+IMKgIGlmZXEg
KCQoQlIyX1BBQ0tBR0VfRklSTVdBUkVfSU1YX0xQRERSNCkseSkKPj4+IMKgIEZJUk1XQVJFX0lN
WF9ERFJGV19ESVIgPSAkKEBEKS9maXJtd2FyZS9kZHIvc3lub3BzeXMKPj4+ICtpZmVxIAo+Pj4g
KCQoQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV9JTVg5MSkkKEJSMl9QQUNLQUdF
X0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOTMpLHkpCj4+Cj4+IMKgwqBUbyBtYWtlIHRoZSBj
b25kaXRpb25zIG1vcmUgc3ltbWV0cmljYWwvcmVndWxhciwgcGVyaGFwcyBpdCdzIGJldHRlciB0
byAKPj4gY3JlYXRlIGEgbmV3IEJSMl9QQUNLQUdFX0ZJUk1XQVJFX0lNWF9MUEREUjRfSU1YOVgg
b3B0aW9uIGFuZCBlbmNvZGUgdGhlIAo+PiBwbGF0Zm9ybSBjb25kaXRpb25zIHRoZXJlLiBUaGUg
cHJvbXB0IHdvdWxkIGJlIHRoZSBzYW1lIGZvciAKPj4gQlIyX1BBQ0tBR0VfRklSTVdBUkVfSU1Y
X0xQRERSNCBhbmQgZm9yIEJSMl9QQUNLQUdFX0ZJUk1XQVJFX0lNWF9MUEREUjRfSU1YOVggCj4+
ICgibHBkZHI0IiBmb3IgYm90aCkuwqAgQnV0IHBlcmhhcHMgSSdtIG92ZXJ0aGlua2luZyB0aGlu
Z3MuCj4gCj4gSSBkb24ndCBzZWUgdGhlIGJlbmVmaXRzIHRvIGRvIHNvLiBBbHNvLCBpLk1YOTUg
c3VwcG9ydHMgTFBQRFI1LgoKICBCdXQgdGhlcmUgYWxzbyBkb2Vzbid0IHNlZW0gdG8gYmUgZmly
bXdhcmUgZm9yIExQRERSNT8KCj4+PiArZGVmaW5lIEZJUk1XQVJFX0lNWF9JTlNUQUxMX0lNQUdF
X0REUl9GVwo+Pj4gK8KgwqDCoCAjIENyZWF0ZSBwYWRkZWQgdmVyc2lvbnMgb2YgbHBkZHI0X3tk
LGl9bWVtX3sxLDJ9ZF8qIGFuZCBnZW5lcmF0ZSAKPj4+IGxwZGRyNF9mdy5iaW4uCj4+PiArwqDC
oMKgICMgbHBkZHI0X2Z3LmJpbiBpcyBuZWVkZWQgd2hlbiBnZW5lcmF0aW5nIGlteDktYm9vdC1z
ZC5iaW4KPj4+ICvCoMKgwqAgIyB3aGljaCBpcyBkb25lIGluIHBvc3QtaW1hZ2Ugc2NyaXB0Lgo+
Pj4gK8KgwqDCoCAkKGNhbGwgRklSTVdBUkVfSU1YX1BSRVBBUkVfRERSX0ZXLCBcCj4+PiArwqDC
oMKgwqDCoMKgwqAgbHBkZHI0X2ltZW1fMWQkKEZJUk1XQVJFX0lNWF9ERFJfVkVSU0lPTl9TVUZG
SVgpLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIGxwZGRyNF9kbWVtXzFkJChGSVJNV0FSRV9JTVhfRERS
X1ZFUlNJT05fU1VGRklYKSwKPj4KPj4gwqDCoFNvIHRoZSB2MjAyMjAxIGNvdWxkIGJlIGhhcmRj
b2RlZCBoZXJlLgo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgIGxwZGRyNF8xZF9mdykKPj4+ICvCoMKg
wqAgJChjYWxsIEZJUk1XQVJFX0lNWF9QUkVQQVJFX0REUl9GVywgXAo+Pj4gK8KgwqDCoMKgwqDC
oMKgIGxwZGRyNF9pbWVtXzJkJChGSVJNV0FSRV9JTVhfRERSX1ZFUlNJT05fU1VGRklYKSwKPj4+
ICvCoMKgwqDCoMKgwqDCoCBscGRkcjRfZG1lbV8yZCQoRklSTVdBUkVfSU1YX0REUl9WRVJTSU9O
X1NVRkZJWCksCj4+PiArwqDCoMKgwqDCoMKgwqAgbHBkZHI0XzJkX2Z3KQo+Pj4gK8KgwqDCoCBj
YXQgJChGSVJNV0FSRV9JTVhfRERSRldfRElSKS9scGRkcjRfMWRfZncuYmluIFwKPj4+ICvCoMKg
wqDCoMKgwqDCoCAkKEZJUk1XQVJFX0lNWF9ERFJGV19ESVIpL2xwZGRyNF8yZF9mdy5iaW4gPiBc
Cj4+PiArwqDCoMKgwqDCoMKgwqAgJChCSU5BUklFU19ESVIpL2xwZGRyNF9mdy5iaW4KPj4+ICvC
oMKgwqAgbG4gLXNmICQoQklOQVJJRVNfRElSKS9scGRkcjRfZncuYmluICQoQklOQVJJRVNfRElS
KS9kZHJfZncuYmluCj4+PiArCj4+PiArwqDCoMKgICMgVS1Cb290IHN1cHBvcnRzIGNyZWF0aW9u
IG9mIHRoZSBjb21iaW5lZCBmbGFzaC5iaW4gaW1hZ2UuIFRvIG1ha2UKPj4+ICvCoMKgwqAgIyBz
dXJlIHRoYXQgVS1Cb290IGNhbiBhY2Nlc3MgYWxsIGF2YWlsYWJsZSBmaWxlcyBjb3B5IHRoZW0g
dG8KPj4+ICvCoMKgwqAgIyB0aGUgYmluYXJ5IGRpci4KPj4+ICvCoMKgwqAgY3AgJChGSVJNV0FS
RV9JTVhfRERSRldfRElSKS9scGRkcjQqLmJpbiAkKEJJTkFSSUVTX0RJUikvCj4+Cj4+IMKgwqBX
ZSBub3cgaGF2ZSAzIGluc3RhbmNlcyBvZiB0aGlzIGV4YWN0IHNhbWUgY29kZSBibG9jayB3aXRo
IG9ubHkgdGhlIGZpbGUgCj4+IG5hbWVzIHRoYXQgZGlmZmVyLCBzbyBwZXJoYXBzIGl0J3MgdGlt
ZSB0byBmYWN0b3IgdGhpcyBpbnRvIGEgc2Vjb25kIGhlbHBlciAKPj4gZnVuY3Rpb24uIE9yIGJl
dHRlciwgZGVmaW5lIGEgZmV3IGF1eGlsaWFyeSB2YXJpYWJsZXMgCj4+IEZJUk1XQVJFX0lNWF9E
RFJGV19JTUVNXzFELCBGSVJNV0FSRV9JTVhfRERSRldfRE1FTV8xRCBldGMgdGhhdCBhcmUgc2V0
IGZvciAKPj4gZWFjaCB2YXJpYW50LCBhbmQgdGhlbiBvbmUgZGVmaW5pdGlvbiBvZiBGSVJNV0FS
RV9JTVhfSU5TVEFMTF9JTUFHRV9ERFJfRlcgCj4+IHRoYXQgdXNlcyB0aG9zZSB2YXJpYWJsZXMu
Cj4+Cj4+IMKgwqBJZiB0aGF0IHNvdW5kcyB0b28gY29tcGxleCwgZG9uJ3Qgd29ycnksIGl0J3Mg
anVzdCBhICJuaWNlaWZpY2F0aW9uIiBzbyBub3QgCj4+IHJlYWxseSBuZWNlc3NhcnkgdG8gZG8u
Cj4gCj4gVGhpcyBzaG91bGQgZG9uZSBiZSBpbiBhIHNlcGFyYXRlZCBwYXRjaCwgcmlnaHQgPwoK
ICBZZXMsIEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gbWVyZ2UgdGhpcyBzZXJpZXMgcHJldHR5IG11
Y2ggYXMgaXMgKGV4Y2VwdCBmb3IgCmRyb3BwaW5nIElNWDkxQTEpLCBhbmQgdGhlbiBkbyBhIHJl
ZmFjdG9yaW5nIHBhdGNoIHNlcGVyYXRlbHkuCgogIEkgYWN0dWFsbHkgaGF2ZSBhIGJ1bmNoIG1v
cmUgcmVmYWN0b3JpbmcgaWRlYXMsIHNvIHBlcmhhcHMgaXQncyBiZXR0ZXIgaWYgSSAKbWFrZSBh
IFBvQyBwYXRjaCBvZiBteSBpZGVhcyBhbmQgeW91IGZpeCB1cCBhbGwgdGhlIG1pc3Rha2VzIEkg
bWFrZSBpbiBpdD8KCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPiAKPj4KPj4gwqDCoEluIGZhY3Qs
IHRoZSBvbmx5IG9mIG15IGNvbW1lbnRzIGFib3ZlIHRoYXQgaXMgcmVhbGx5IGltcG9ydGFudCBp
cyBkcm9wcGluZyAKPj4gQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV9JTVg5MUEx
Lgo+IAo+IG9rICEKPiAKPiBSZWdhcmRzLAo+IAo+Pgo+PiDCoMKgUmVnYXJkcywKPj4gwqDCoEFy
bm91dAo+Pgo+Pj4gK2VuZGVmCj4+PiArZWxzZQo+Pj4gwqAgZGVmaW5lIEZJUk1XQVJFX0lNWF9J
TlNUQUxMX0lNQUdFX0REUl9GVwo+Pj4gwqDCoMKgwqDCoCAjIENyZWF0ZSBwYWRkZWQgdmVyc2lv
bnMgb2YgbHBkZHI0X3BtdV8qIGFuZCBnZW5lcmF0ZSAKPj4+IGxwZGRyNF9wbXVfdHJhaW5fZncu
YmluLgo+Pj4gwqDCoMKgwqDCoCAjIGxwZGRyNF9wbXVfdHJhaW5fZncuYmluIGlzIG5lZWRlZCB3
aGVuIGdlbmVyYXRpbmcgaW14OC1ib290LXNkLmJpbgo+Pj4gQEAgLTcxLDYgKzk1LDcgQEAgZGVm
aW5lIEZJUk1XQVJFX0lNWF9JTlNUQUxMX0lNQUdFX0REUl9GVwo+Pj4gwqDCoMKgwqDCoCBjcCAk
KEZJUk1XQVJFX0lNWF9ERFJGV19ESVIpL2xwZGRyNCouYmluICQoQklOQVJJRVNfRElSKS8KPj4+
IMKgIGVuZGVmCj4+PiDCoCBlbmRpZgo+Pj4gK2VuZGlmCj4+PiDCoCBpZmVxICgkKEJSMl9QQUNL
QUdFX0ZJUk1XQVJFX0lNWF9ERFI0KSx5KQo+Pj4gwqAgRklSTVdBUkVfSU1YX0REUkZXX0RJUiA9
ICQoQEQpL2Zpcm13YXJlL2Rkci9zeW5vcHN5cwo+Pj4KPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
