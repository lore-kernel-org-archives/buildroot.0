Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997D9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 10:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2466B81344;
	Sun, 13 Feb 2022 10:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ah0mfr18l2g; Sun, 13 Feb 2022 10:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FA208130C;
	Sun, 13 Feb 2022 10:43:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA6C21BF2C9
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 10:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8D2E60769
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 10:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65Dq7EC-YW9U for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 10:43:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CFA060655
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 10:43:51 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id p9so8854725ejd.6
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 02:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=/UOTF6XLhqDblcwbOiY7wuOCfqqtzMSRJVdXU95Psag=;
 b=cKXVxQcxNRSpzlqQUNTBT728oq4CzWrLxnFHinsPtwAn+PDtyxNv8dCm4rlgxUmPpY
 eRJkeRkmo2tKf81CNLrIb/5+P5Mc36oc1yGlszijxzK2xL3N3pC/rcaZeRcNIzKct0Ha
 6rS5RwkvDlEZto+1tcrsUbVI26JHC6tl6Kan4E/p60QUJ4d9xsgPehka6phMGlNM3BX+
 TdO+EbKq/Id4mbKzwc/4MRJdKeTnrD6qv1NmvCdJgH8fMNwE5/kvLX5Qbzwe57OnA2im
 WoWJ4RLhmWze2+vChUUmmgBmeMoJrYlTFgYhoRzTwvoW9uLXdO8dheD6lJrLXK+fBbR7
 3K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/UOTF6XLhqDblcwbOiY7wuOCfqqtzMSRJVdXU95Psag=;
 b=iF95WXcE5czXks7ELwIzyWJOKi2ljg2bGVgmUkVO8KD4tiiMDgGqhn7xEOmvl3lBw+
 BSEdFSKcMMGXOvz+AmQL1DnIurniuYecXVFK8Kjh88UEHp4gVY6qDkTm38diPlXWdCNX
 87oc/vEikwJ89vA5pUC2gedAzranN5PoZw1K7N9dAY3lKfzsmN96WTYZXeOXGDR1TaEf
 Uwvw0gY58n9VlEh5SE3tWjPkW48IiW6RzI2KsGfZVmFKb3wsfjVyMSvvByrBmVHILJ+u
 YoFTLJkjoNtn3OV1cP1U1RgXAIc7M0svgCj+nx/94cOa5XVQnxEmQXSvEbFkxol0UchC
 adcA==
X-Gm-Message-State: AOAM530CNEtz4hlG9UrDXeeMlvcXyoSo2Z1R3lnE1kQdn9UKQpNkPjCQ
 1hYJ1f88SPs8zBzyhuyB4BHI7HmtMy33Sg==
X-Google-Smtp-Source: ABdhPJyVie2jiwnvjoazQTN3RpxNNuUHqz8y72b1F/FTxepXRZUmbFPL2mEhKwe4/elZiXbrp1EQdg==
X-Received: by 2002:a17:906:3b84:: with SMTP id
 u4mr4812149ejf.728.1644749029625; 
 Sun, 13 Feb 2022 02:43:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q10sm9523139ejn.3.2022.02.13.02.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 02:43:49 -0800 (PST)
Message-ID: <ecca2a8f-3515-f7f5-a698-89acedb64f22@mind.be>
Date: Sun, 13 Feb 2022 11:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>, buildroot@buildroot.org
References: <20220206074853.25887-1-kuzminov.sergey81@gmail.com>
 <fb84199d-9c72-d918-46ad-cd811ecbedc9@mind.be>
 <9441c983-821e-5f10-27f3-30d5705e365b@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <9441c983-821e-5f10-27f3-30d5705e365b@gmail.com>
Subject: Re: [Buildroot] [PATCH v4] configs/orangepi_zero_defconfig: switch
 to extlinux
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMy8wMi8yMDIyIDA2OjE0LCBTZXJnZXkgS3V6bWlub3Ygd3JvdGU6Cj4gSGkgQXJub3V0
LAo+IAo+IDEzLjAyLjIwMjIgMDE6MTEsIEFybm91dCBWYW5kZWNhcHBlbGxlOgo+Pgo+Pgo+PiBP
biAwNi8wMi8yMDIyIDA4OjQ4LCBTZXJnZXkgS3V6bWlub3Ygd3JvdGU6Cj4+PiBDaGFuZ2VzOgo+
Pj4gKiBFeGNsdWRlIEZBVCBwYXJ0aXRpb24sIGl0IGlzIG5vIGxvbmdlciBuZWVkZWQgZm9yIFUt
Qm9vdC4KPj4+ICogU3dpdGNoIHRoZSByb290ZnMgcGFydGl0aW9uIGZyb20gTUJSIHRvIEdQVCBm
b3IgcGFydGl0aW9uLXV1aWQgdG8gd29yay4KPj4+ICogU3dpdGNoIHRvIGV4dGxpbnV4LCB0aGlz
IGlzIGNvbnZlbmllbnQgZm9yIGRlYnVnZ2luZy4KPj4+ICogQ3JlYXRlIGNvbW1vbiBzY2VuYXJp
b3MgZm9yIG11bHRpcGxlIGJvYXJkcyB0byBjcmVhdGUgYW4gU0QgaW1hZ2U6IAo+Pj4gYm9hcmQv
b3JhbmdlcGkvY29tbW9uLgo+Pj4gKiBBZGQgQlIyX1RBUkdFVF9HRU5FUklDX1JFTU9VTlRfUk9P
VEZTX1JXPXksIHJlbW91bnQgcm9vdCBmaWxlc3lzdGVtIAo+Pj4gcmVhZC13cml0ZSBkdXJpbmcg
Ym9vdC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgS3V6bWlub3YgPGt1em1pbm92LnNl
cmdleTgxQGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gVjEtPlYyOgo+Pj4gKiBpbXByb3ZlZCBjb21t
aXQgbG9nCj4+PiAqIHJlbW92ZWQgY29tbWVudGVkIGxpbmUgaW4gZXh0bGludXguY29uZgo+Pj4g
KiByZW1vdmVkIG9uZSBib290IG9wdGlvbiBmcm9tIGV4dGxpbnV4LmNvbmYKPj4+Cj4+PiBWMi0+
VjM6Cj4+PiAqIGltcHJvdmVkIGNvbW1pdCBsb2cKPj4+ICogcmVtb3ZlZCBjb21tZW50IGZyb20g
Ym9hcmQvb3JhbmdlcGkvY29tbW9uL2dlbmltYWdlLmNmZwo+Pj4KPj4+IFYzLT5WNDoKPj4+ICog
Zml4ZWQgU2lnbmVkLW9mZi1ieSBwb3NpdGlvbgo+Pgo+PiDCoMKgSSB0aGluayBJJ20gZ29pbmcg
dG8gdXNlIHRoaXMgY29tbWl0IG1lc3NhZ2UgYXMgYW4gZXhhbXBsZSBmb3IgdGhlIAo+PiBkb2N1
bWVudGF0aW9uLi4uIFdlbGwsIGlmIEkgZXZlciBnZXQgYXJvdW5kIHRvIGl0IDotKQo+IAo+IEdp
dWxpbyBCZW5ldHRpIGhlbHBlZCBtZS4gVGhhbmtzIEdpdWxpby4KPiAKPj4gW3NuaXBdCj4+PiBk
aWZmIC0tZ2l0IGEvY29uZmlncy9vcmFuZ2VwaV96ZXJvX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvb3Jh
bmdlcGlfemVyb19kZWZjb25maWcKPj4+IGluZGV4IDVhYWExNTY2YzUuLjk2ZjBjM2Y2MDAgMTAw
NjQ0Cj4+PiAtLS0gYS9jb25maWdzL29yYW5nZXBpX3plcm9fZGVmY29uZmlnCj4+PiArKysgYi9j
b25maWdzL29yYW5nZXBpX3plcm9fZGVmY29uZmlnCj4+PiBAQCAtMjAsMTAgKzIwLDEzIEBAIEJS
Ml9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+Pj4gwqAgQlIyX0xJTlVYX0tFUk5FTF9JTlRS
RUVfRFRTX05BTUU9InN1bjhpLWgyLXBsdXMtb3JhbmdlcGktemVybyIKPj4+IEJSMl9MSU5VWF9L
RVJORUxfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJib2FyZC9vcmFuZ2VwaS9vcmFuZ2VwaS16ZXJv
L2xpbnV4LWV4dHJhcy5mcmFnbWVudCIgCj4+Pgo+Pj4gwqAgQlIyX0xJTlVYX0tFUk5FTF9ORUVE
U19IT1NUX09QRU5TU0w9eQo+Pj4gK0JSMl9MSU5VWF9LRVJORUxfSU5TVEFMTF9UQVJHRVQ9eQo+
Pj4gwqAgIyBGaWxlc3lzdGVtCj4+PiDCoCBCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKPj4+IMKg
IEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Cj4+PiArQlIyX1RBUkdFVF9ST09URlNfRVhUMl9T
SVpFPSI2M00iCj4+Cj4+IMKgwqBXaHk/IEluY3JlYXNlIGZyb20gNjBNIHRvIDYzTSBzZWVtcyBh
IGJpdCBvZGQuLi4KPj4KPj4gwqDCoEkgcmVtb3ZlZCB0aGlzLgo+IAo+IEluaXRpYWxseSwgNTEy
IE1CIHdhcyBpbiB0aGUgZ2VuaW1hZ2UuY2ZnIGNvbmZpZ3VyYXRpb24uIEJlYXV0aWZ1bGx5IG9i
dGFpbmVkIDEgCj4gTUIgKHUtYm9vdCkgKyA2MyBNQiAocm9vdGZzKSA9IDY0IE1CIChTRCBDYXJk
IEltYWdlKSA6KQoKICBBbiBTRCBjYXJkIGxhYmVsbGVkIGFzIDY0TUIgd291bGQgdHlwaWNhbGx5
IGhhdmUgYWJvdXQgNjAtNjJNQiBvZiBhY3R1YWwgCnNwYWNlLCB0aGUgcmVzdCBiZWluZyB1c2Vk
IGZvciBzcGFyZXMgZm9yIGJhZCBibG9ja3MuIFRoYXQncyB3aHkgd2UgdXNlIDYwTSBhcyAKdGhl
IGRlZmF1bHQuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPiAKPj4+ICtCUjJfVEFSR0VUX0dFTkVS
SUNfUkVNT1VOVF9ST09URlNfUlc9eQo+Pgo+PiDCoMKgV2UgZG9uJ3QgZG8gdGhpcyBmb3IgYW55
IG90aGVyIGRlZmNvbmZpZy4gSSByZW1vdmVkIHRoaXMuCj4+Cj4+Cj4+IMKgwqBBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgo+Pgo+PiDCoMKgUmVnYXJkcywKPj4gwqDCoEFybm91dAo+Pgo+Pgo+
Pj4gwqAgIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAo+Pj4gwqAgIyBCb290bG9h
ZGVyCj4+PiBAQCAtMzksMTYgKzQyLDEyIEBAIEJSMl9UQVJHRVRfVUJPT1RfU1BMPXkKPj4+IMKg
IEJSMl9UQVJHRVRfVUJPT1RfU1BMX05BTUU9InUtYm9vdC1zdW54aS13aXRoLXNwbC5iaW4iCj4+
PiDCoCAjIFJlcXVpcmVkIHRvb2xzIHRvIGNyZWF0ZSB0aGUgU0QgaW1hZ2UKPj4+IC1CUjJfUEFD
S0FHRV9IT1NUX1VCT09UX1RPT0xTPXkKPj4+IC1CUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xT
X0JPT1RfU0NSSVBUPXkKPj4+IC1CUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTX0JPT1RfU0NS
SVBUX1NPVVJDRT0iYm9hcmQvb3JhbmdlcGkvb3JhbmdlcGktemVyby9ib290LmNtZCIgCj4+Pgo+
Pj4gLUJSMl9QQUNLQUdFX0hPU1RfRE9TRlNUT09MUz15Cj4+PiDCoCBCUjJfUEFDS0FHRV9IT1NU
X0dFTklNQUdFPXkKPj4+IC1CUjJfUEFDS0FHRV9IT1NUX01UT09MUz15Cj4+PiDCoCAjIEltYWdl
Cj4+PiArQlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0iYm9hcmQvb3JhbmdlcGkvY29tbW9u
L3Bvc3QtYnVpbGQuc2giCj4+PiDCoCBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJzdXBw
b3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giCj4+PiAtQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdT
PSItYyBib2FyZC9vcmFuZ2VwaS9vcmFuZ2VwaS16ZXJvL2dlbmltYWdlLmNmZyIKPj4+ICtCUjJf
Uk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jICQoQklOQVJJRVNfRElSKS9nZW5pbWFnZS5jZmci
Cj4+PiDCoCAjIFdpcmVsZXNzIGRyaXZlciBhbmQgZmlybXdhcmUKPj4+IMKgIEJSMl9QQUNLQUdF
X1hSODE5X1hSQURJTz15Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
