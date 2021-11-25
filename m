Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9574C433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 14:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F51282496;
	Thu, 25 Nov 2021 14:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erBpCIawJfEZ; Thu, 25 Nov 2021 14:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7705825DC;
	Thu, 25 Nov 2021 14:51:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2A211BF2BC
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 14:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E209E60764
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 14:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbL-gXCq4lTu for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 14:51:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D16456072C
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 14:51:16 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id x15so26668675edv.1
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 06:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=6TwPFYa1poQgdMqxN9Yl4VjRZpOUd4tKxrnMjwPTTrA=;
 b=JQ2gQGBLT/SFb/AtAzTRoAzuYLmRqC0X3OwjufnfLlsUt1IDaOgZIjzeX/IED2NLNB
 4Bp0mLxFEAbMCMLwwuQ6kiLr1uMZYmVRhnFcScKVJpvSGmFEo/qeu0T+FGTd76NhKyso
 RdI3N5O0DfKYnEzFxEenaCp8jpnMr3O0QP0jDTejALP+f02dFXiAktSh/OGEKkZj+f6K
 DCmsv5clHv4Srn7Iz2KZC5WvPIqid+HxsLHpqWgMmQNIV57vQztz3ZukilRw3TI6FqY8
 0FiJq2nwnjHdztQuSurgn9PpFfBuOLIDGeAF8Fnxy+xFmKV3ZUE4qDjn198JuxeYLqAf
 nnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6TwPFYa1poQgdMqxN9Yl4VjRZpOUd4tKxrnMjwPTTrA=;
 b=cZvt6II08WpyGUqnj/Yia9jW1lHGUT/0JPtvcCU3umeVaVPLuOfE3eHwk32/muzh8x
 2STHK8gSIFIg6HI5al23VA5MTUE3Rmq7rwmgD/LTxEZ/H4phQGFvxA4ontnoF4C3WsPO
 B4lz73wzFOXIpJyJgeKFwlObkR7NK6oAmRmaqGRkKpVlI7BKBKhMAo/4UxfOrUeja2zo
 9hvIG0TQNH4jP1o506q0AWG55Kin1riKAVtbYTM3JhMp/u/GUrU0+Ha3C38ePF0znNTL
 sbj37PJEphj+0pAdvA7SV+ek0qSuUufx3drnssSQBu6czH3GKTlgZjPBSqyoVz09SSxI
 m9SA==
X-Gm-Message-State: AOAM530ISRGyNe+G0dE2IzwIoIJNM9TooL5k/U8rGUU5AFP45w0yUUI8
 +VJrPgLT92AB1TyPpGlbRHnuzw==
X-Google-Smtp-Source: ABdhPJz3l23dGGWw1VMlambqNApKpBjSG7SWzbAVCWeXexJWIaWc6yH46lKJ1P2HPaHsu0JtDDuxFw==
X-Received: by 2002:a17:907:3c7:: with SMTP id
 su7mr32264869ejb.87.1637851874726; 
 Thu, 25 Nov 2021 06:51:14 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d18sm2013221edj.23.2021.11.25.06.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 06:51:13 -0800 (PST)
Message-ID: <c719dff6-f3c9-c2af-5692-e0810058639f@mind.be>
Date: Thu, 25 Nov 2021 15:51:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot <buildroot@buildroot.org>
References: <CAJPV9MrtNQVuADbYs1HWE89Hnnf7h=68tRZEQ6=0n8XPMPYb6g@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAJPV9MrtNQVuADbYs1HWE89Hnnf7h=68tRZEQ6=0n8XPMPYb6g@mail.gmail.com>
Subject: Re: [Buildroot] Package dependency
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

CgpPbiAyNS8xMS8yMDIxIDEzOjI3LCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+IAo+ICAgICBI
aSBidWlsZHJvb3QgbGlzdCwKPiAKPiAgICAgSSdtIHdvcmtpbmcgb24gYSBwYWNrYWdlIGZvciBt
aW5pamFpbCB0aGF0Cj4gCj4gaGFzIGEgYnVpbGQgZGVwZW5kZW5jeSBvbiBsaWJjYXAuIEknbSBo
YXZpbmcKPiB0cm91YmxlcyB0byBzZXQgdGhlIGRlcGVuZGVuY3kgaW4gdGhlIHJlY2lwZSBhbmQK
PiBJIGZhaWwgdG8gZmluZCB3aGF0IGlzIHdyb25nLCBzbyBJIHdhbnQgdG8gYXNrIGZvciBoaW50
cy4KPiAKPiAgICAgQ3VycmVudCBDb25maWcuaW46Cj4gCj4gCj4gY29uZmlnIEJSMl9QQUNLQUdF
X01JTklKQUlMCj4gIMKgIMKgIMKgIMKgYm9vbCAibWluaWphaWwiCj4gIMKgIMKgIMKgIMKgc2Vs
ZWN0IEJSMl9QQUNLQUdFX0hPU1RfTElCQ0FQCj4gIMKgIMKgIMKgIMKgc2VsZWN0IEJSMl9QQUNL
QUdFX0xJQkNBUAo+ICDCoCDCoCDCoCDCoGhlbHAKPiAgwqAgwqAgwqAgwqAgwqBNaW5pamFpbCBp
cyBhIHNhbmRib3hpbmcgdG9vbCBtYWludGFpbmVkIGJ5IGdvb2dsZS4KPiAKPiBodHRwczovL2dv
b2dsZS5naXRodWIuaW8vbWluaWphaWwvCj4gCj4gICAgIEN1cnJlbnQgcmVjaXBlOgo+IAo+IAo+
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIwo+ICMgbWluaWphaWwKPiAjCj4gIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiAKPiBNSU5JSkFJTF9WRVJTSU9OID0gbGludXgtdjE3Cj4gTUlOSUpB
SUxfU09VUkNFID0gJChNSU5JSkFJTF9WRVJTSU9OKS50YXIuZ3oKPiBNSU5JSkFJTF9TSVRFID0g
Imh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvbWluaWphaWwvYXJjaGl2ZS9yZWZzL3RhZ3MiCj4g
TUlOSUpBSUxfTElDRU5TRSA9IEJTRC1TdHlsZQo+IE1JTklKQUlMX0xJQ0VOU0VfRklMRVMgPSBM
SUNFTlNFCj4gTUlOSUpBSUxfREVQRU5ERU5DWT1saWJjYXAgaG9zdC1saWJjYXAKCiAgVHJ5IE1J
TklKQUlMX0RFUEVOREVOQ0lFUy4KCiAgQWxzbywgb2YgY291cnNlLCBmb3JtYXR0aW5nIC0gdXNl
IGNoZWNrLXBhY2thZ2UuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IGRlZmluZSBNSU5JSkFJ
TF9CVUlMRF9DTURTCj4gIMKgwqDCoMKgwqDCoMKgKGNkICQoQEQpOyBcCj4gIMKgwqDCoMKgwqDC
oMKgJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgLUMgJChARCkvJChkKSBDQz0iJChUQVJHRVRf
Q0MpIikKPiBlbmRlZgo+IAo+IGRlZmluZSBNSU5JSkFJTF9JTlNUQUxMX1RBUkdFVF9DTURTCj4g
IMKgwqDCoMKgwqDCoMKgJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoQEQpL21pbmlqYWlsMCBcCj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCQoVEFSR0VUX0RJUikvdXNyL2Jpbi9taW5p
amFpbDAKPiAgwqDCoMKgwqDCoMKgwqAkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkvbGlibWlu
aWphaWxwcmVsb2FkLnNvIFwKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgJChUQVJH
RVRfRElSKS9saWIvbGlibWluaWphaWxwcmVsb2FkLnNvCj4gIMKgwqDCoMKgwqDCoMKgJChJTlNU
QUxMKSAtbSAwNzU1IC1EICQoQEQpL2xpYm1pbmlqYWlsLnNvIFwKPiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgJChUQVJHRVRfRElSKS9saWIvbGlibWluaWphaWwuc28KPiBlbmRlZgo+
IAo+ICQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCj4gCj4gICAgIFRoYW5rcyEKPiAKPiAgICAg
Sm9zw6kgUGVra2FyaW5lbi4KPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
