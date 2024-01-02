Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E331C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FEF140A5D;
	Tue,  2 Jan 2024 21:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FEF140A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kin49aM7vcXl; Tue,  2 Jan 2024 21:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E65F40A6F;
	Tue,  2 Jan 2024 21:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E65F40A6F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5AC51BF311
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB2D9416BA
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB2D9416BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CDbtWniMqM7i for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:16:49 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E01BF416B2
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E01BF416B2
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a2331e7058aso1144347566b.2
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 13:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704230207; x=1704835007;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=odFoTJaPzJ+VaQgmG7st19KSf4n2gwCIs0inBL3Ue1s=;
 b=F+0L4Sh4gvTAYLXhykbisA2hR33KPHAghTWNb8XAazmZyJ/bjG6dK+/uqGaL82ynb6
 uZ54Y+g+oa1k9Tkz9chMzAgogiYr8vvPSIf8MsEgAKor/LovQaeEBSlFXOaa++qoB3ye
 Vuz+wqnkU9nkPyMkIWsLaI9qwDsZmwyaIbvbvoqJURO/ebT2KI09ofp0gk7mg9XkGDeT
 W0Q9eLu/hqECziW/TlSCuVF6otfQmIe1DGCH6dChWG9q4MxPPphs+JsUp/Nj2tq/pMzB
 H244XK390UlcHd6HsRcP9FTcfanikNCW5TU3v87CCJEIOKMQqtMms820UD0IFoAg3LTp
 evtA==
X-Gm-Message-State: AOJu0Yyl7EmPffsQCgFA5D4DGxWnNISIuhsiUlK0325lx2aGmbqv0gxM
 KULelM8tSK0SMeLGswULU9c=
X-Google-Smtp-Source: AGHT+IEXgYVhWi+UQzS9hukXU226SVL81nlmwpmQmXb7HXd71Q/OQOYMYk6Ua0BV0pvuISBUI2tSDg==
X-Received: by 2002:a17:906:6016:b0:a26:a0d9:10a7 with SMTP id
 o22-20020a170906601600b00a26a0d910a7mr3384442ejj.76.1704230206769; 
 Tue, 02 Jan 2024 13:16:46 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl.
 [31.11.218.106]) by smtp.googlemail.com with ESMTPSA id
 mf17-20020a1709071a5100b00a26aa5c5a60sm11827373ejc.19.2024.01.02.13.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jan 2024 13:16:46 -0800 (PST)
Message-ID: <611552f7-3f52-4a83-8a12-d473af0aeaf4@gmail.com>
Date: Tue, 2 Jan 2024 22:16:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240102104258.1375-1-zajec5@gmail.com>
 <20240102221419.2333bca4@windsurf>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20240102221419.2333bca4@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704230207; x=1704835007; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=odFoTJaPzJ+VaQgmG7st19KSf4n2gwCIs0inBL3Ue1s=;
 b=BCoL+VVMrjKzzSjsILV3EYc33cSFSHF9kZKmoUUmYbUl/Gij1A5VRLJkn/hxDZy71w
 BqCf7xgmRlwRq2ZvrhbhDwFDvvb0KD8x8i2kofzvxElgtixm2PBce0LDZEESx6PaKIoZ
 N3B525QplBD8X2PcG5DaZ2cFCpqp07U/Z8L9ceeYEoi2qS/QTJ7+jPDkIgczHH3pRKO1
 ksHi/1zGr219hf2JHBQ4GSxSYMhDxBxT5oSKsByxTQAISg+w+x0M/KB3S2GtlsHNlJbQ
 +K3pgqbQ5hW9DT543F4khqyPxiNJtW4CI3iz3ULVLoMfwG0MF7CP4hhcxl6YX1d7u5jI
 WbLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BCoL+VVM
Subject: Re: [Buildroot] [PATCH] configs/broadcom_northstar_defconfig:
 adjust DTS paths
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
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMi4wMS4yMDI0IDIyOjE0LCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+IE9uIFR1ZSwgIDIg
SmFuIDIwMjQgMTE6NDI6NTggKzAxMDAKPiBSYWZhxYIgTWnFgmVja2kgPHphamVjNUBnbWFpbC5j
b20+IHdyb3RlOgo+IAo+PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4+Cj4+IFN0YXJ0aW5nIHdpdGgga2VybmVsIHJlbGVhc2UgdjYuNSBBUk0gRFRTIGZpbGVzIGFy
ZSBwbGFjZWQgaW4gdmVuZG9yCj4+IHN1YmRpcmVjdG9yaWVzIChMaW51eCBjb21taXQgNzI0YmE2
NzUxNTMyICgiQVJNOiBkdHM6IE1vdmUgLmR0cyBmaWxlcyB0bwo+PiB2ZW5kb3Igc3ViLWRpcmVj
dG9yaWVzIikpLgo+Pgo+PiBUaGlzIGZpeGVzOgo+PiBtYWtlWzNdOiAqKiogTm8gcnVsZSB0byBt
YWtlIHRhcmdldCAnYXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwOC1zbWFydHJnLXNyNDAwYWMuZHRi
Jy4gIFN0b3AuCj4+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6MTM4NDogYmNtNDcwOC1zbWFydHJn
LXNyNDAwYWMuZHRiXSBFcnJvciAyCj4+IG1ha2VbM106ICoqKiBObyBydWxlIHRvIG1ha2UgdGFy
Z2V0ICdhcmNoL2FybS9ib290L2R0cy9iY200NzA5NC1sdXh1bC14d3ItMzE1MC12MS5kdGInLiAg
U3RvcC4KPj4gbWFrZVsyXTogKioqIFtNYWtlZmlsZToxMzg0OiBiY200NzA5NC1sdXh1bC14d3It
MzE1MC12MS5kdGJdIEVycm9yIDIKPj4KPj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tp
IDxyYWZhbEBtaWxlY2tpLnBsPgo+IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoISBJIHdhcyB3b25k
ZXJpbmcgd2hlbiBpdCBnb3QgYnJva2VuLCBhbmQgdGhpcyBtYWRlCj4gYmUgcmVhbGl6ZSB0aGF0
IHRoaXMgZGVmY29uZmlnIGRvZXNuJ3QgZm9sbG93IGEgYmVzdCBwcmFjdGljZSB0aGF0IHdlCj4g
bm9ybWFsbHkgYXBwbHkgdG8gYWxsIG91ciBkZWZjb25maWdzOiB0aGUga2VybmVsIHZlcnNpb24g
YmVpbmcgYnVpbHQKPiBzaG91bGQgbm90IGJlIGEgbW92aW5nIHRhcmdldCwgYnV0IGJlIGZpeGVk
IGluIHRoZSBkZWZjb25maWcuCj4gCj4gU28sIEkndmUgYXBwbGllZCB5b3VyIHBhdGNoLCBidXQg
Y291bGQgeW91IHN1Ym1pdCBhIGZvbGxvdy11cCBwYXRjaAo+IHRoYXQgc2V0cyBhIGZpeGVkIGtl
cm5lbCB2ZXJzaW9uLCBqdXN0IGxpa2Ugd2UgZG8gaW4gYWxsIGRlZmNvbmZpZ3M/IEl0Cj4gYWxz
byBtZWFucyB0aGUga2VybmVsIGhlYWRlcnMgdmVyc2lvbiBvZiB0aGUgdG9vbGNoYWluIHNob3Vs
ZCBiZSBmaXhlZAo+IChhZ2FpbiwgSSBlbmNvdXJhZ2UgeW91IHRvIGxvb2sgYXQgdGhlIG51bWVy
b3VzIG90aGVyIGRlZmNvbmZpZ3Mgd2UKPiBoYXZlIGZvciBleGFtcGxlcyBvZiB0aGlzKS4KCldp
bGwgZG8sIHRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgaXQgb3V0IQoKLS0gClJhZmHFgiBNacWCZWNr
aQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
