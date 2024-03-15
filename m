Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884ACC54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7F1160F7E;
	Fri, 15 Mar 2024 19:21:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JYUOGimmeGrF; Fri, 15 Mar 2024 19:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60AA26065C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60AA26065C;
	Fri, 15 Mar 2024 19:21:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 693F01BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 635BB4192F
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vCoU6BxjvM4y for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:21:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 437E140399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 437E140399
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 437E140399
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:21:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33ecbe78c3fso1068741f8f.3
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 12:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710530501; x=1711135301;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6U3S2IxmtvpHcqO/HJkYttkzuo6+y4g9FJ+OuSoxMZk=;
 b=rNVjvpNUJPrE2KQnreCqMXWBEq2uLQQ7uQeIXXSKe0cHecnSRm6nlwpZ02LzAxdz4a
 KeVuUgb9NSYkc0lnmHfGRlmttYvfv5rDDqZmj0KNmfUV6pk29wH8BpzJTDcdWOZkP7yk
 +tfRls3HPEe1a4pVWpis4dGIUUbVZk8W2hEDxs8r2npBh1NCvPVgilEEZ0PSdGNcz9QJ
 CPETh4AFrMzN0cKHzA0YNOMK+EoByAnQGdrlKRomimWHVGrQigZaaTHFPpUBImBVev0c
 kjxiPSstDHyEwGoRSqljx/4n7dP+5GFecR+YkuwPz1bKHlAfT5wEuzZW/FnAE2lWj6Bk
 Kv0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbeNTvskMvZ6su6MBUikJRxtBoD2mXyzLYjBmHVlbl60PmNA+TbUe6N5qtKdFQ7KTB73HwgW1Y0q3c9ReocxdFTn0Y0B/vZg==
X-Gm-Message-State: AOJu0YxIY2d+IX2Wahf9UWHE/OAlKkkPB9n3/2zy1Qbsn01XizBHK11q
 eT8L8WZxQZWjV4Jfn4ozsIRXewwLFEVEpG+0qH2mPnxQTGEX7xgJQIkL/R/ppW84STlPx6zQsdr
 6
X-Google-Smtp-Source: AGHT+IELJlqBeQpPIxTjMtwQLLbOg8Hqnmw7ubesnSnbXnwAilYSHEiSZ2lf6oOXgQRgIW0dFDPGwA==
X-Received: by 2002:a5d:4577:0:b0:33e:cbe9:f9f8 with SMTP id
 a23-20020a5d4577000000b0033ecbe9f9f8mr3372997wrc.65.1710530501325; 
 Fri, 15 Mar 2024 12:21:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bq22-20020a5d5a16000000b0033ebf702e17sm1863302wrb.21.2024.03.15.12.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 12:21:40 -0700 (PDT)
Message-ID: <9aaca631-3166-4272-90ab-9acbca5ce503@mind.be>
Date: Fri, 15 Mar 2024 20:21:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20240315172416.29862-1-sebastien.szymanski@armadeus.com>
In-Reply-To: <20240315172416.29862-1-sebastien.szymanski@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710530501; x=1711135301; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6U3S2IxmtvpHcqO/HJkYttkzuo6+y4g9FJ+OuSoxMZk=;
 b=SAtLOANwe5ZBGdjN74ti4+IR/unLgLRo7VdtmapaKCGKvGuF6NjVcAXDvO4YYL2NxI
 Gf1voqlsqpb6dN0HC6eyDCF77Xhxe/TbRtJwwHT1FI3ccPw9BFKJ1FQoWh7384NDGTwB
 Qt3wgv356CFiRZjafA+J2qCwz2gY1zA3YeHfihem8JHc6rgYNM2i5GErAnSCiwzwhZZl
 W+kLnXJfsSLo/z7ZGktbOIWcs4Se3/mdSEFmp5/NlboVOJwApowmae+5Sx5dVe9kcQ9f
 wUQMB/zOoFqBzYg9zUDk/9MfzMb9Hdw1+58sYyvQTzivoQ/82E3F8OIhefqtI2Zfa1j9
 kHDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SAtLOANw
Subject: Re: [Buildroot] [PATCH 1/1] package/rt-tests: bump version to 2.6
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNS8wMy8yMDI0IDE4OjI0LCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBTaWdu
ZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1h
ZGV1cy5jb20+CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJu
b3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9ydC10ZXN0cy9ydC10ZXN0cy5oYXNoIHwgMiArLQo+ICAg
cGFja2FnZS9ydC10ZXN0cy9ydC10ZXN0cy5tayAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFzaCBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFz
aAo+IGluZGV4IGViMjhmNGQ0NDFhNi4uMDE3NDQ3YmNlNjY1IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvcnQtdGVzdHMvcnQtdGVzdHMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVz
dHMuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+ICAgIyBGcm9tIGh0dHBzOi8vbWlycm9ycy5lZGdl
Lmtlcm5lbC5vcmcvcHViL2xpbnV4L3V0aWxzL3J0LXRlc3RzL3NoYTI1NnN1bXMuYXNjCj4gLXNo
YTI1NiAgMmVkMmU0Yzk2NWM3ZjMzNmExNWQzMzU0ZGVjMDkwZTI3YTBiMWU5YWRhOTFhZTBiOWVm
MThiYmNiOTkzODc0ZSAgcnQtdGVzdHMtMi41LnRhci54ego+ICtzaGEyNTYgIDc2MWQxMGM0Yjdm
NWIyODQwMGYwYzMwMWZlMDE3MWVhYTc0ZjM0N2RmNjRjYjM1OTIxMDI1NGI4ZTZhZmYxOWYgIHJ0
LXRlc3RzLTIuNi50YXIueHoKPiAgICMgbG9jYWxseSBjb21wdXRlZCBoYXNoCj4gICBzaGEyNTYg
IGFiMTVmZDUyNmJkOGRkMThhOWU3N2ViYzEzOTY1NmJmNGQzM2U5N2ZjNzIzOGNkMTFiZjYwZTJi
OWI4NjY2YzYgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydC10ZXN0cy9ydC10ZXN0
cy5tayBiL3BhY2thZ2UvcnQtdGVzdHMvcnQtdGVzdHMubWsKPiBpbmRleCA4YWQ0MjE1ZWUxOTIu
LjRiMWFhMzE3OTY0NyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3J0LXRlc3RzL3J0LXRlc3RzLm1r
Cj4gKysrIGIvcGFja2FnZS9ydC10ZXN0cy9ydC10ZXN0cy5tawo+IEBAIC02LDcgKzYsNyBAQAo+
ICAgCj4gICBSVF9URVNUU19TSVRFID0gJChCUjJfS0VSTkVMX01JUlJPUikvbGludXgvdXRpbHMv
cnQtdGVzdHMKPiAgIFJUX1RFU1RTX1NPVVJDRSA9IHJ0LXRlc3RzLSQoUlRfVEVTVFNfVkVSU0lP
TikudGFyLnh6Cj4gLVJUX1RFU1RTX1ZFUlNJT04gPSAyLjUKPiArUlRfVEVTVFNfVkVSU0lPTiA9
IDIuNgo+ICAgUlRfVEVTVFNfTElDRU5TRSA9IEdQTC0yLjArCj4gICBSVF9URVNUU19MSUNFTlNF
X0ZJTEVTID0gQ09QWUlORwo+ICAgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
