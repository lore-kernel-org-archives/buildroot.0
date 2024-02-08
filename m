Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD866C48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 22:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 109A885132;
	Thu,  8 Feb 2024 22:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmmj8eDyBDUX; Thu,  8 Feb 2024 22:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9CE284D1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9CE284D1C;
	Thu,  8 Feb 2024 22:37:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4B61BF3CE
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 22:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 379714259F
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 22:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id olpY2FSun9nu for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 22:36:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8BD4D4225C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BD4D4225C
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BD4D4225C
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 22:36:55 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41065fe9f4dso416295e9.1
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 14:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707431814; x=1708036614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HDKIylUNG8VuMkfTjx0v0oI/R/EoA0ja6e21w1EDoGg=;
 b=nDJW2GlBbc+t08zU9m6OoXOaTqZomEZte5z6g5I5PgfjivRzskAauhz2SDrzDPL+Qu
 Xl1LKN2qR/aiw1U3+uFhN+09q1ES5zIEtxG+c96AmZl8yGs5nrJE5Xg92dpEakc4hRkJ
 sRk0Oz5V5B/wdCfFAN/dUsK9VV6LMnYTnp3/eaklRfraQaTrS8jb8tyi1XXSpTgfjq+F
 jVcX2H+tSGI7VGJbv1CHpKZpzpTNRJ9wWZeASb4qHKydLrtT55acVtxdm8xkn+ytKqcM
 +ur/tBU/w8bVoAN3caNUijdHdVK69u/oNhswXYtqNN1xatTHszP7yOpTfztNVaO6OlWa
 lRvQ==
X-Gm-Message-State: AOJu0YxOMa3YVFTVHUzq/VRQjbaNtyMf0aUMe8SkTc4wgB+tV2368dRM
 6Hdf/IHYR2Onaqp9kI8QOKUjS8JtndCRWWMaBL9ptvBiJEtfM749wI+Lx/5m0G0=
X-Google-Smtp-Source: AGHT+IH8ZzW0Od+wY3o0U2B4jt1W1mm1ZWXULMtCe9sBzHzzH5NXJARvhSop5L4FRah722crfdsgBA==
X-Received: by 2002:a5d:5912:0:b0:33b:2633:b527 with SMTP id
 v18-20020a5d5912000000b0033b2633b527mr628263wrd.20.1707431814158; 
 Thu, 08 Feb 2024 14:36:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVyDmlU7o1jIMHd69tJb/wNjAiFgEtpm/8mSU/463Zx6tQiHTizQnVvhkL4FP+lZGMqLui9U4cYrsCCV+0GD1TQSjRyQkdFgdH7CxMaIXwmF6zptkImh2XGPL9HfAD+UiV/yGLHy6JrEPwuxr74inM8u4xbRq6FNigGOl32Rt1aQ/9ZMEZDYXFBkNu2RgOh4mZDwQGloGVP1wCWqad89RS36QdpConx7Vx9l6Tk2YZ0WbAS
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a5d414c000000b0033af3a43e91sm321117wrq.46.2024.02.08.14.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 14:36:53 -0800 (PST)
Message-ID: <d1b5f5a0-8c85-425c-95f6-6504a6e9ceac@mind.be>
Date: Thu, 8 Feb 2024 23:36:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20240115-imx93-support-v5-0-c2c950104c58@armadeus.com>
 <20240115-imx93-support-v5-1-c2c950104c58@armadeus.com>
In-Reply-To: <20240115-imx93-support-v5-1-c2c950104c58@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707431814; x=1708036614; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HDKIylUNG8VuMkfTjx0v0oI/R/EoA0ja6e21w1EDoGg=;
 b=EToPsWUO4FHZ5+fPkBmY3gIq/e4m+7NmGpCBUbiVB6MfUVSsYJwQPYDne/R6+CjOe7
 27n8PCnDuLYdgPVTmp8bgMuCFerGwa9CVTQxKnfvO1xZvvbPMOL6VXsJZimq3DtrKx42
 La7Nhxg7rQwvxDsnYs8NdGBMP+Nsfq2RbE2+FrrGm64HQUkowiC1jGX87dzwoWpKOVZp
 nkqSiLEOjoL5fhQhnSW9Guaxozff6rTEHZMP1v45U2BV5SXz2WIAxP3bFciwm2ZP2ra3
 jDs+VfWhlNby/VlslcSbSDK4eN46+tROMeFEC0dusifNAApgl+jqBbTX/WW6CEHBBLnw
 h0BQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EToPsWUO
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

ICBIaSBTZcyBYmFzdGllbiwKCiAgSXQncyBubyBmdW4gdGhhdCBJIHN0aWxsIGhhdmUgcXVlc3Rp
b25zIG9uIHY1LCBidXQgdW5mb3J0dW5hdGVseS4uLgoKT24gMDgvMDIvMjAyNCAxMzo1NCwgU8Op
YmFzdGllbiBTenltYW5za2kgd3JvdGU6Cj4gVGhpcyBjb21taXQgYWRkcyBpLk1YOTEgYW5kIGku
TVg5MyBzdXBwb3J0IHRvIEJ1aWxkcm9vdC4KPiBodHRwczovL3d3dy5ueHAuY29tL3Byb2R1Y3Rz
L3Byb2Nlc3NvcnMtYW5kLW1pY3JvY29udHJvbGxlcnMvYXJtLXByb2Nlc3NvcnMvaS1teC1hcHBs
aWNhdGlvbnMtcHJvY2Vzc29ycy9pLW14LTktcHJvY2Vzc29yczpJTVg5LVBST0NFU1NPUlMKPiAK
PiBUaGVyZSBpcyBubyBpLk1YOTUgc29mdHdhcmUgcHJvdmlkZWQgYnkgTlhQIGF0IHRoZSBtb21l
bnQgdGhhdCdzIHdoeQo+IGkuTVg5NSBpcyBsZWZ0IGJlaGluZC4KPiAKPiBBZGFwdCBwYWNrYWdl
IGZpcm13YXJlLWlteCBmb3IgdGhlIExQUERSNCBmaXJ3bWFyZXMgYmluYXJpZXMuCj4gCj4gUmV2
aWV3ZWQtYnk6IEdhcnkgQmlzc29uIDxiaXNzb24uZ2FyeUBnbWFpbC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMu
Y29tPgoKW3NuaXBdCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9GUkVFU0NBTEVfSU1YX1BMQVRGT1JN
X0lNWDkxCj4gKwlib29sICJpbXg5MSIKPiArCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9GUkVFU0NB
TEVfSU1YX1BMQVRGT1JNX0lNWDkzCj4gKwlib29sICJpbXg5MyIKPiArCj4gK2VuZGNob2ljZQo+
ICsKPiArY2hvaWNlCj4gKwlwcm9tcHQgImkuTVggU2lsaWNvbiBSZXZpc2lvbiIKPiArCWRlZmF1
bHQgQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV9JTVg5MUExIFwKPiArCQlpZiBC
UjJfUEFDS0FHRV9GUkVFU0NBTEVfSU1YX1BMQVRGT1JNX0lNWDkxCj4gKwlkZWZhdWx0IEJSMl9Q
QUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOTNBMSBcCj4gKwkJaWYgQlIyX1BBQ0tB
R0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV9JTVg5Mwo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9GUkVFU0NBTEVfSU1YX1BMQVRGT1JNX0lNWDkxIHx8IFwKPiArCQlCUjJfUEFDS0FHRV9GUkVF
U0NBTEVfSU1YX1BMQVRGT1JNX0lNWDkzCj4gKwloZWxwCj4gKwkgIFNvbWUgcGFja2FnZXMgcmVs
YXRlZCB0byB0aGUgc2VsZWN0ZWQgaS5NWCBwbGF0Zm9ybSBuZWVkIHRvIGtub3cgdGhlCj4gKwkg
IHNpbGljb24gcmV2aXNpb24gb2YgdGhlIHBsYXRmb3JtIHRoZXkgd2lsbCBydW4gb24uCj4gKwkg
IElmIHlvdSBkb24ndCBrbm93LCBsZWF2ZSB0aGUgZGVmYXVsdCB2YWx1ZS4KPiArCj4gKwkgIE5v
dGUgLSBtaXNtYXRjaGVzIG1heSByZXN1bHQgaW4gYSBmYWlsdXJlIHRvIGJvb3QhCgogIFRoaXMg
c2VudGVuY2UgY29uZmxpY3RzIHdpdGggIklmIHlvdSBkb24ndCBrbm93LCBsZWF2ZSB0aGUgZGVm
YXVsdCB2YWx1ZSIuLi4gClNvIEkgdGhpbmsgdGhhdCAiSWYgeW91IGRvbid0IGtub3ciIHNlbnRl
bmNlIHNob3VsZCBiZSBkcm9wcGVkLgoKPiArCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9GUkVFU0NB
TEVfSU1YX1BMQVRGT1JNX0lNWDkxQTEKPiArCWJvb2wgImlteDkxYTEiCj4gKwlkZXBlbmRzIG9u
IEJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOTEKCiAgU2luY2UgZm9yIElN
WDkxIHRoZXJlIGlzIG9ubHkgb25lIG9wdGlvbiwgSSB0aGluayBpdCBtYWtlcyBtb3JlIHNlbnNl
IHRvIG5vdCAKb2ZmZXIgYSBjaG9pY2UgZm9yIHRoaXMuIEp1c3QgYWx3YXlzIHVzZSB0aGlzIG9u
ZSBmb3IgdGhlIElNWDkxLiBXZSBjYW4gc3RpbGwgCmFkZCBpdCBiYWNrIGlmIHRoZXJlIGV2ZXIg
dHVybnMgb3V0IHRvIGJlIGFuIGlteDkxYTIuCgo+ICsKPiArY29uZmlnIEJSMl9QQUNLQUdFX0ZS
RUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOTNBMAo+ICsJYm9vbCAiaW14OTNhMCIKPiArCWRlcGVu
ZHMgb24gQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV9JTVg5Mwo+ICsKPiArY29u
ZmlnIEJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOTNBMQo+ICsJYm9vbCAi
aW14OTNhMSIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9S
TV9JTVg5Mwo+ICsKPiAgIGVuZGNob2ljZQo+ICAgCgpbc25pcF0KPiBAQCAtODksNiArOTUsOSBA
QCBjb25maWcgQlIyX1BBQ0tBR0VfRklSTVdBUkVfSU1YX0REUl9WRVJTSU9OCj4gICAJIyB1bmNv
bmRpdGlvbmFsbHkgdXNlIEhXIHZlcnNpb24gMjAxODEwIHdoZW4gRERSMy9ERFI0IHdhcwo+ICAg
CSMgc2VsZWN0ZWQKPiAgIAlkZWZhdWx0ICIyMDE4MTAiIGlmIEJSMl9QQUNLQUdFX0ZJUk1XQVJF
X0lNWF9ERFIzIHx8IEJSMl9QQUNLQUdFX0ZJUk1XQVJFX0lNWF9ERFI0Cj4gKwlkZWZhdWx0ICJ2
MjAyMjAxIiBpZiBcCgogIEZvciB0aGUgdGltZSBiZWluZywgdGhlcmUgaXMgb25seSBvbmUgdmVy
c2lvbiBmb3IgdGhlIElNWDkxLzMuIFNvIGl0IG1ha2VzIG5vIApzZW5zZSB0byBnaXZlIGFuIG9w
dGlvbiBmb3IgaXQuIChJbiBmYWN0LCB0aGlzIHJlYWxseSBzaG91bGQgaGF2ZSBiZWVuIGEgY2hv
aWNlIAppbnN0ZWFkIG9mIGEgc3RyaW5nIG9wdGlvbiBiZWNhdXNlIHRoZXJlIGFyZSBvbmx5IGEg
Zml4ZWQgc2V0IG9mIG9wdGlvbnMuLi4gQnV0IAp0aGF0J3MgYSBzZXBhcmF0ZSB0b3BpYy4pCgog
IEJ5IHRoZSB3YXksIGRvIHRoZXNlIFNvQ3MgdXNlIHRoZSBwbGFpbiAyMDIwMDYgdmVyc2lvbiBm
b3IgRERSNCBsaWtlIHRoZSBvdGhlciAKU29Dcz8gQW5kIGRvIHRoZXkgYWxzbyBzdXBwb3J0IERE
UjM/Cgo+ICsJCUJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOTEgfHwgXAo+
ICsJCUJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOTMKPiAgIAloZWxwCj4g
ICAJICBVc2UgYSBzcGVjaWZpYyB2ZXJzaW9uIG9mIHRoZSBpbXggZGRyIGJpbmFyaWVzLiBMZWF2
aW5nIHRoaXMKPiAgIAkgIGZpZWxkIGVtcHR5IHdpbGwgc2VsZWN0IHRoZSBkZWZhdWx0IHZlcnNp
b24uCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgvZmly
bXdhcmUtaW14Lm1rIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJtd2Fy
ZS1pbXgubWsKPiBpbmRleCA2NmVmOGMzOTMwYmUuLjFmMzZmOTE3Y2RjOCAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5tawo+ICsr
KyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgvZmlybXdhcmUtaW14Lm1rCj4g
QEAgLTQ4LDYgKzQ4LDMwIEBAIGVuZGlmCj4gICBpZmVxICgkKEJSMl9QQUNLQUdFX0ZJUk1XQVJF
X0lNWF9MUEREUjQpLHkpCj4gICBGSVJNV0FSRV9JTVhfRERSRldfRElSID0gJChARCkvZmlybXdh
cmUvZGRyL3N5bm9wc3lzCj4gICAKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9GUkVFU0NBTEVfSU1Y
X1BMQVRGT1JNX0lNWDkxKSQoQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV9JTVg5
MykseSkKCiAgVG8gbWFrZSB0aGUgY29uZGl0aW9ucyBtb3JlIHN5bW1ldHJpY2FsL3JlZ3VsYXIs
IHBlcmhhcHMgaXQncyBiZXR0ZXIgdG8gY3JlYXRlIAphIG5ldyBCUjJfUEFDS0FHRV9GSVJNV0FS
RV9JTVhfTFBERFI0X0lNWDlYIG9wdGlvbiBhbmQgZW5jb2RlIHRoZSBwbGF0Zm9ybSAKY29uZGl0
aW9ucyB0aGVyZS4gVGhlIHByb21wdCB3b3VsZCBiZSB0aGUgc2FtZSBmb3IgCkJSMl9QQUNLQUdF
X0ZJUk1XQVJFX0lNWF9MUEREUjQgYW5kIGZvciBCUjJfUEFDS0FHRV9GSVJNV0FSRV9JTVhfTFBE
RFI0X0lNWDlYIAooImxwZGRyNCIgZm9yIGJvdGgpLiAgQnV0IHBlcmhhcHMgSSdtIG92ZXJ0aGlu
a2luZyB0aGluZ3MuCgo+ICtkZWZpbmUgRklSTVdBUkVfSU1YX0lOU1RBTExfSU1BR0VfRERSX0ZX
Cj4gKwkjIENyZWF0ZSBwYWRkZWQgdmVyc2lvbnMgb2YgbHBkZHI0X3tkLGl9bWVtX3sxLDJ9ZF8q
IGFuZCBnZW5lcmF0ZSBscGRkcjRfZncuYmluLgo+ICsJIyBscGRkcjRfZncuYmluIGlzIG5lZWRl
ZCB3aGVuIGdlbmVyYXRpbmcgaW14OS1ib290LXNkLmJpbgo+ICsJIyB3aGljaCBpcyBkb25lIGlu
IHBvc3QtaW1hZ2Ugc2NyaXB0Lgo+ICsJJChjYWxsIEZJUk1XQVJFX0lNWF9QUkVQQVJFX0REUl9G
VywgXAo+ICsJCWxwZGRyNF9pbWVtXzFkJChGSVJNV0FSRV9JTVhfRERSX1ZFUlNJT05fU1VGRklY
KSwKPiArCQlscGRkcjRfZG1lbV8xZCQoRklSTVdBUkVfSU1YX0REUl9WRVJTSU9OX1NVRkZJWCks
CgogIFNvIHRoZSB2MjAyMjAxIGNvdWxkIGJlIGhhcmRjb2RlZCBoZXJlLgoKPiArCQlscGRkcjRf
MWRfZncpCj4gKwkkKGNhbGwgRklSTVdBUkVfSU1YX1BSRVBBUkVfRERSX0ZXLCBcCj4gKwkJbHBk
ZHI0X2ltZW1fMmQkKEZJUk1XQVJFX0lNWF9ERFJfVkVSU0lPTl9TVUZGSVgpLAo+ICsJCWxwZGRy
NF9kbWVtXzJkJChGSVJNV0FSRV9JTVhfRERSX1ZFUlNJT05fU1VGRklYKSwKPiArCQlscGRkcjRf
MmRfZncpCj4gKwljYXQgJChGSVJNV0FSRV9JTVhfRERSRldfRElSKS9scGRkcjRfMWRfZncuYmlu
IFwKPiArCQkkKEZJUk1XQVJFX0lNWF9ERFJGV19ESVIpL2xwZGRyNF8yZF9mdy5iaW4gPiBcCj4g
KwkJJChCSU5BUklFU19ESVIpL2xwZGRyNF9mdy5iaW4KPiArCWxuIC1zZiAkKEJJTkFSSUVTX0RJ
UikvbHBkZHI0X2Z3LmJpbiAkKEJJTkFSSUVTX0RJUikvZGRyX2Z3LmJpbgo+ICsKPiArCSMgVS1C
b290IHN1cHBvcnRzIGNyZWF0aW9uIG9mIHRoZSBjb21iaW5lZCBmbGFzaC5iaW4gaW1hZ2UuIFRv
IG1ha2UKPiArCSMgc3VyZSB0aGF0IFUtQm9vdCBjYW4gYWNjZXNzIGFsbCBhdmFpbGFibGUgZmls
ZXMgY29weSB0aGVtIHRvCj4gKwkjIHRoZSBiaW5hcnkgZGlyLgo+ICsJY3AgJChGSVJNV0FSRV9J
TVhfRERSRldfRElSKS9scGRkcjQqLmJpbiAkKEJJTkFSSUVTX0RJUikvCgogIFdlIG5vdyBoYXZl
IDMgaW5zdGFuY2VzIG9mIHRoaXMgZXhhY3Qgc2FtZSBjb2RlIGJsb2NrIHdpdGggb25seSB0aGUg
ZmlsZSBuYW1lcyAKdGhhdCBkaWZmZXIsIHNvIHBlcmhhcHMgaXQncyB0aW1lIHRvIGZhY3RvciB0
aGlzIGludG8gYSBzZWNvbmQgaGVscGVyIGZ1bmN0aW9uLiAKT3IgYmV0dGVyLCBkZWZpbmUgYSBm
ZXcgYXV4aWxpYXJ5IHZhcmlhYmxlcyBGSVJNV0FSRV9JTVhfRERSRldfSU1FTV8xRCwgCkZJUk1X
QVJFX0lNWF9ERFJGV19ETUVNXzFEIGV0YyB0aGF0IGFyZSBzZXQgZm9yIGVhY2ggdmFyaWFudCwg
YW5kIHRoZW4gb25lIApkZWZpbml0aW9uIG9mIEZJUk1XQVJFX0lNWF9JTlNUQUxMX0lNQUdFX0RE
Ul9GVyB0aGF0IHVzZXMgdGhvc2UgdmFyaWFibGVzLgoKICBJZiB0aGF0IHNvdW5kcyB0b28gY29t
cGxleCwgZG9uJ3Qgd29ycnksIGl0J3MganVzdCBhICJuaWNlaWZpY2F0aW9uIiBzbyBub3QgCnJl
YWxseSBuZWNlc3NhcnkgdG8gZG8uCgogIEluIGZhY3QsIHRoZSBvbmx5IG9mIG15IGNvbW1lbnRz
IGFib3ZlIHRoYXQgaXMgcmVhbGx5IGltcG9ydGFudCBpcyBkcm9wcGluZyAKQlIyX1BBQ0tBR0Vf
RlJFRVNDQUxFX0lNWF9QTEFURk9STV9JTVg5MUExLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAr
ZW5kZWYKPiArZWxzZQo+ICAgZGVmaW5lIEZJUk1XQVJFX0lNWF9JTlNUQUxMX0lNQUdFX0REUl9G
Vwo+ICAgCSMgQ3JlYXRlIHBhZGRlZCB2ZXJzaW9ucyBvZiBscGRkcjRfcG11XyogYW5kIGdlbmVy
YXRlIGxwZGRyNF9wbXVfdHJhaW5fZncuYmluLgo+ICAgCSMgbHBkZHI0X3BtdV90cmFpbl9mdy5i
aW4gaXMgbmVlZGVkIHdoZW4gZ2VuZXJhdGluZyBpbXg4LWJvb3Qtc2QuYmluCj4gQEAgLTcxLDYg
Kzk1LDcgQEAgZGVmaW5lIEZJUk1XQVJFX0lNWF9JTlNUQUxMX0lNQUdFX0REUl9GVwo+ICAgCWNw
ICQoRklSTVdBUkVfSU1YX0REUkZXX0RJUikvbHBkZHI0Ki5iaW4gJChCSU5BUklFU19ESVIpLwo+
ICAgZW5kZWYKPiAgIGVuZGlmCj4gK2VuZGlmCj4gICAKPiAgIGlmZXEgKCQoQlIyX1BBQ0tBR0Vf
RklSTVdBUkVfSU1YX0REUjQpLHkpCj4gICBGSVJNV0FSRV9JTVhfRERSRldfRElSID0gJChARCkv
ZmlybXdhcmUvZGRyL3N5bm9wc3lzCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
