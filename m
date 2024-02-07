Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161DEC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A653F40447;
	Wed,  7 Feb 2024 10:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mePJrijoM1l; Wed,  7 Feb 2024 10:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE4B940136
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE4B940136;
	Wed,  7 Feb 2024 10:39:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93EFA1BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 811458137C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ri0fU0RNObiJ for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:39:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36C0081352
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36C0081352
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36C0081352
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:39:43 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40fe79f1aaaso3844635e9.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 02:39:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707302381; x=1707907181;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MkFLOAzsaZyfP9HHn1/J+mDvVomIeUE9ardVHBDRqfc=;
 b=wvCMcE51/Z7aTPPuHI4xAG1Z722AZ5E3HEIE45mPJ7ZBEAXxYHoXu8K4reyRzumpYZ
 VApC7fT/oVqLQtIM0jBg27HNqOCXi6Hc9gteCWCDWMO4WZSB5qFuM6PuHT5ghdbmzUIZ
 mhCwDBdgA3nHIHxBdKP7jmZRibWtcHSsigyq8iCDElJABNWYANFqJ5LuX8CqaZh5zggI
 YcRTVaxw6DDHxcW9f+OEh9v3km88hO6DCufC17RdM0m+jlyYuV6HvzX+v5iqWaimbbN2
 +GZefKplcHoDNBI+XrKTQCdFnNVv8dH+V09kW1kNb7v6K2Vm+5BlcD85iyrEQspszLnD
 tX/w==
X-Gm-Message-State: AOJu0YxIMAKYfDzJCp1X8rEc4Bkzn4SeWHymvGSiFL9xT4WdEt7w+3MG
 rPmKvJsQuWYB96nIVIZnMNRopWOUzuLvhYgHdWpcLmij94+NSgfyDD1jGlHbqeE=
X-Google-Smtp-Source: AGHT+IEgmMYPI1t/Tx7Std1tvVusuCx4DIqhfoX70w3p2gSrsIhOCZ1txcWL8pi8nZidR4+mYaJ0Jg==
X-Received: by 2002:a05:600c:4f54:b0:40f:dc51:1882 with SMTP id
 m20-20020a05600c4f5400b0040fdc511882mr4279912wmq.8.1707302381165; 
 Wed, 07 Feb 2024 02:39:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtp5QseJx4hpjJ3WuP1imu1I+meP9eNg963BtY0WBd5Ff3a1fGPvH+uPS76UChu5z4w1e1GQRuLA668Hcr61ENuWzXOh5zG8y2W8FIbltUNYnvvWSQ/QhuI8OjAznhDM48Ip7I8neioL62ApovQZyPI1vQEXpAlFXKV1yTYVE6ZS7B0632pTOqYEmqIrCPRFxETkixNCH64qQgjMzNHtcuGkADYgOj1+hh7scZu90uDGHSIeo+tzUTqMOD/KFNFZWSuQPMS+wpyAKlA1HztIWQCUVAMHeWfHZeGvQmiVfA3BbLIZmmhq0DNfwyWPe0zk9nySA=
Received: from [192.168.17.126] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 fc16-20020a05600c525000b0040feb8c71a0sm4064763wmb.13.2024.02.07.02.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 02:39:40 -0800 (PST)
Message-ID: <aeb8affe-8741-4967-a7b6-5927e0aa139f@smile.fr>
Date: Wed, 7 Feb 2024 11:39:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
 <20231218081958.506691-11-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20231218081958.506691-11-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707302381; x=1707907181;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MkFLOAzsaZyfP9HHn1/J+mDvVomIeUE9ardVHBDRqfc=;
 b=iRDtlOl3xMvPLBNpfNXOtNSQD9lLlynQJltk8cpKF+95u5PAHwzd4UDPJQujpR1MKj
 BWKigrRnKxpSMCInhfmSlBRiYID+SoZVZnAGyyuSZPLeH2Qkker6Ufx81G5lvOQvb65K
 xRBG3iJ3+SDKjzT1erDhxYqznfMU8BUyTA9gPyKsuKW4eWxJQCg5LYxvuQnDY9vKiA50
 s65Gh9vQvWT8PptDzYhP9v2Lat9g5O1IaCMOkIVrca+treJg3ej6vwCNyF6Ko6jrGPA4
 D02TfE2Y+NRbXXQfS5rKyYGMk87S3NqgTq4SUe0J6Bc6WHXIOCJRLk2dkiFDjsA1ghQZ
 yUOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=iRDtlOl3
Subject: Re: [Buildroot] [PATCH v3 10/11] configs/ti_am62x_sk_defconfig:
 bump U-Boot version to 2023.10
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAxOC8xMi8yMDIzIMOgIDA5OjE5LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFRoZSAyMDIzLjEwIHZlcnNpb24gb2YgVS1Cb290IGZvciB0aGUgYW02Mngtc2sg
Ym9hcmQgaGFzIGludHJvZHVjZWQgdHdvCj4gbWFqb3IgY2hhbmdlczoKPiAtIFRoZSBkZXZpY2Ug
dHJlZSBrMy1hbTYyNS1zay5kdGIgaXMgbm8gbG9uZ2VyIHNlYXJjaGVkIGluIC9ib290LCBidXQg
aW4KPiAgIC9ib290L2R0Yi90aS4gSGVuY2UsIHRoZSBkaXNhYmxpbmcgb2YgQlIyX0xJTlVYX0tF
Uk5FTF9JTlNUQUxMX1RBUkdFVAo+ICAgYW5kIHRoZSB1c2Ugb2YgZXh0bGludXguY29uZiBmb3Ig
dGhlIHByb3BlciBsb2FkaW5nIG9mIHRoZSBkZXZpY2UgdHJlZS4KPiAgIEZ1cnRoZXJtb3JlLCB0
aGUgcGFyYW1ldGVyIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUyB3YXMgdXNlZCB0bwo+ICAg
YXV0by1nZW5lcmF0ZSB0aGUgZXh0bGludXguY29uZiBmaWxlIHNvIHRoYXQgZGV2ZWxvcGVycyBj
YW4gY2hhbmdlIHRoZQo+ICAga2VybmVsIGxvYWRpbmcgb3B0aW9ucyBieSBtb2RpZnlpbmcgdGhl
IC5jb25maWcuCj4gLSBUaGUgdXNlIG9mIGJpbm1hbiBmb3IgYnVpbGRpbmcgaW1hZ2VzLgo+IAo+
IFRlc3RlZCBvbiBTSy1BTTYyQi1QMS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2No
aSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gCj4gLS0tCj4gCj4gQ2hh
bmdlcyBpbiB2MjoKPiAtIFVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UKPiAtIERyb3AgUHl0aG9u
IG9wdGlvbnMgcmVxdWlyZWQgYnkgYmlubWFuLgo+IC0gRW5hYmxlIEJSMl9UQVJHRVRfVElfSzNf
UjVfTE9BREVSX1VTRV9CSU5NQU4uIFRoaXMgb3B0aW9uIGF1dG9tYXRpY2FsbHkKPiAgIHNlbGVj
dHMgdGhlIFB5dGhvbiBtb2R1bGVzIHJlcXVpcmVkIGJ5IGJpbm1hbi4KPiAKPiAgYm9hcmQvdGkv
YW02Mngtc2svZ2VuaW1hZ2UuY2ZnICB8ICA3ICsrKystCj4gIGJvYXJkL3RpL2FtNjJ4LXNrL3Bv
c3QtYnVpbGQuc2ggfCA0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgYm9h
cmQvdGkvYW02Mngtc2svcG9zdC1pbWFnZS5zaCB8ICA1ICsrKysKPiAgY29uZmlncy90aV9hbTYy
eF9za19kZWZjb25maWcgICB8IDExICsrKysrLS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgNjcgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNzU1IGJvYXJkL3Rp
L2FtNjJ4LXNrL3Bvc3QtYnVpbGQuc2gKPiAgY3JlYXRlIG1vZGUgMTAwNzU1IGJvYXJkL3RpL2Ft
NjJ4LXNrL3Bvc3QtaW1hZ2Uuc2gKPiAKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvdGkvYW02Mngtc2sv
Z2VuaW1hZ2UuY2ZnIGIvYm9hcmQvdGkvYW02Mngtc2svZ2VuaW1hZ2UuY2ZnCj4gaW5kZXggMjYz
MDRmZTk4Zjk5Li4zOTgyMDlmNGQ4MzEgMTAwNjQ0Cj4gLS0tIGEvYm9hcmQvdGkvYW02Mngtc2sv
Z2VuaW1hZ2UuY2ZnCj4gKysrIGIvYm9hcmQvdGkvYW02Mngtc2svZ2VuaW1hZ2UuY2ZnCj4gQEAg
LTQsMTAgKzQsMTUgQEAgaW1hZ2UgYm9vdC52ZmF0IHsKPiAgCQkJInRpYm9vdDMuYmluIiwKPiAg
CQkJInRpc3BsLmJpbiIsCj4gIAkJCSJ1LWJvb3QuaW1nIiwKPiArCQkJImszLWFtNjI1LXNrLmR0
YiIsCj4gKwkJCSJJbWFnZSIKPiArCQl9Cj4gKwkJZmlsZSBleHRsaW51eC9leHRsaW51eC5jb25m
IHsKPiArCQkJaW1hZ2UgPSBleHRsaW51eC5jb25mCj4gIAkJfQo+ICAJfQo+ICAKPiAtCXNpemUg
PSAxNk0KPiArCXNpemUgPSA2NE0KPiAgfQo+ICAKPiAgaW1hZ2Ugc2RjYXJkLmltZyB7Cj4gZGlm
ZiAtLWdpdCBhL2JvYXJkL3RpL2FtNjJ4LXNrL3Bvc3QtYnVpbGQuc2ggYi9ib2FyZC90aS9hbTYy
eC1zay9wb3N0LWJ1aWxkLnNoCj4gbmV3IGZpbGUgbW9kZSAxMDA3NTUKPiBpbmRleCAwMDAwMDAw
MDAwMDAuLjBmMWY5OGVmMjE3YQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9ib2FyZC90aS9hbTYy
eC1zay9wb3N0LWJ1aWxkLnNoCj4gQEAgLTAsMCArMSw0OSBAQAo+ICsjIS9iaW4vc2ggLXgKPiAr
Cj4gKyMgZ2VuaW1hZ2Ugd2lsbCBuZWVkIHRvIGZpbmQgdGhlIGV4dGxpbnV4LmNvbmYKPiArIyBp
biB0aGUgYmluYXJpZXMgZGlyZWN0b3J5Cj4gKwo+ICtkaWUoKSB7Cj4gKyAgY2F0IDw8RU9GID4m
Mgo+ICtFcnJvcjogJEAKPiArCj4gK1VzYWdlOiAkezB9IC1jIDxjb25zb2xlPiAtciA8cm9vdD4g
Wy14IDxleHRyYS1hcmdzPl0KPiArRU9GCj4gKyAgZXhpdCAxCj4gK30KPiArCj4gK289J2M6cjp4
OicKPiArTz0nY29uc29sZToscm9vdDosZXh0cmEtYXJnczonCj4gK29wdHM9IiQoZ2V0b3B0IC1u
ICIkezAjIyovfSIgLW8gIiR7b30iIC1sICIke099IiAtLSAiJHtAfSIpIgo+ICtldmFsIHNldCAt
LSAiJHtvcHRzfSIKPiArd2hpbGUgWyAkeyN9IC1ndCAwIF07IGRvCj4gKyAgICBjYXNlICIkezF9
IiBpbgo+ICsgICAgKC1jfC0tY29uc29sZSkKPiArICAgICAgICBDT05TT0xFPSIkezJ9Ijsgc2hp
ZnQgMgo+ICsgICAgICAgIDs7Cj4gKyAgICAoLXJ8LS1yb290KQo+ICsgICAgICAgIFJPT1Q9IiR7
Mn0iOyBzaGlmdCAyCj4gKyAgICAgICAgOzsKPiArICAgICgteHwtLWV4dHJhLWFyZ3MpCj4gKyAg
ICAgICAgRVhUUkFfQVJHUz0iJHsyfSI7IHNoaWZ0IDIKPiArICAgICAgICA7Owo+ICsgICAgKC0t
KQo+ICsgICAgICAgIHNoaWZ0IDE7IGJyZWFrCj4gKyAgICAgICAgOzsKPiArICAgIGVzYWMKPiAr
ZG9uZQo+ICsKPiArWyAtbiAiJHtDT05TT0xFfSIgXSB8fCBkaWUgIk1pc3NpbmcgYXJndW1lbnQi
Cj4gK1sgLW4gIiR7Uk9PVH0iIF0gfHwgZGllICJNaXNzaW5nIGFyZ3VtZW50Igo+ICthcHBlbmQ9
ImNvbnNvbGU9JHtDT05TT0xFfSByb290PSR7Uk9PVH0gcncgcm9vdGZzdHlwZT1leHQ0IHJvb3R3
YWl0Igo+ICtpZiBbIC1uICIke0VYVFJBX0FSR1N9IiBdOyB0aGVuCj4gKyAgICBhcHBlbmQ9IiR7
YXBwZW5kfSAke0VYVFJBX0FSR1N9Igo+ICtmaQo+ICsKPiArbWtkaXIgLXAgIiR7QklOQVJJRVNf
RElSfSIKPiArY2F0IDw8LV9fSEVBREVSX0VPRiA+ICIke0JJTkFSSUVTX0RJUn0vZXh0bGludXgu
Y29uZiIKPiArCWxhYmVsIGFtNjJ4LXNrLWJ1aWxkcm9vdAo+ICsJICBrZXJuZWwgL0ltYWdlCj4g
KwkgIGZkdGRpciAvCj4gKwkgIGFwcGVuZCAke2FwcGVuZH0KPiArCV9fSEVBREVSX0VPRgo+IGRp
ZmYgLS1naXQgYS9ib2FyZC90aS9hbTYyeC1zay9wb3N0LWltYWdlLnNoIGIvYm9hcmQvdGkvYW02
Mngtc2svcG9zdC1pbWFnZS5zaAo+IG5ldyBmaWxlIG1vZGUgMTAwNzU1Cj4gaW5kZXggMDAwMDAw
MDAwMDAwLi4zNGY3MzJjMDkxYWQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYm9hcmQvdGkvYW02
Mngtc2svcG9zdC1pbWFnZS5zaAo+IEBAIC0wLDAgKzEsNSBAQAo+ICsjIS9iaW4vc2ggLXgKPiAr
Cj4gK0JPQVJEX0RJUj0iJChkaXJuYW1lICIkMCIpIgo+ICsKPiArc3VwcG9ydC9zY3JpcHRzL2dl
bmltYWdlLnNoIC1jICIke0JPQVJEX0RJUn0vZ2VuaW1hZ2UuY2ZnIgo+IGRpZmYgLS1naXQgYS9j
b25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZyBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29u
ZmlnCj4gaW5kZXggYjk4YTY4ZmYxNTNmLi4wZmI5YTJmMDI0NmMgMTAwNjQ0Cj4gLS0tIGEvY29u
Zmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPiArKysgYi9jb25maWdzL3RpX2FtNjJ4X3NrX2Rl
ZmNvbmZpZwo+IEBAIC0xLDExICsxLDExIEBACj4gIEJSMl9hYXJjaDY0PXkKPiAtQlIyX1JPT1RG
U19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+IC1CUjJf
Uk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL3RpL2FtNjJ4LXNrL2dlbmltYWdlLmNm
ZyIKPiArQlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0iYm9hcmQvdGkvYW02Mngtc2svcG9z
dC1idWlsZC5zaCIKPiArQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvdGkvYW02
Mngtc2svcG9zdC1pbWFnZS5zaCIKPiArQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyB0
dHlTMiwxMTUyMDBuOCAtciBQQVJUVVVJRD0wMDAwMDAwMC0wMiAteCBlYXJseWNvbj1uczE2NTUw
YSxtbWlvMzIsMHgwMjgwMDAwMCIKCkNhbiB0aGUgaGFyY29kZWQgUEFSVFVVSUQgYmUgYXZvaWRl
ZCBieSB1c2luZyB1dWlkZ2VuIGFzIGZvciBzb21lIG90aGVyIGRlZmNvbmZpZ3M/CgoKCj4gIEJS
Ml9MSU5VWF9LRVJORUw9eQo+ICBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09O
RklHPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gIEJSMl9MSU5VWF9LRVJO
RUxfSU5UUkVFX0RUU19OQU1FPSJ0aS9rMy1hbTYyNS1zayIKPiAtQlIyX0xJTlVYX0tFUk5FTF9J
TlNUQUxMX1RBUkdFVD15Cj4gIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFPXkKPiAgQlIyX1BB
Q0tBR0VfTElOVVhfRklSTVdBUkVfVElfV0wxOFhYPXkKPiAgQlIyX1RBUkdFVF9ST09URlNfRVhU
Mj15Cj4gQEAgLTIzLDExICsyMywxNCBAQCBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTj15Cj4g
IEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQ19BTTYyWD15Cj4gIEJSMl9UQVJHRVRfVElf
SzNfSU1BR0VfR0VOX1NFQ1RZUEVfR1A9eQo+ICBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUj15
Cj4gK0JSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0NVU1RPTV9WRVJTSU9OPXkKPiArQlIyX1RB
UkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjMuMTAiCgpNYXli
ZSB0aGUgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVIgdmVyc2lvbiBzaG91bGQgYmUgZml4ZWQg
aW4gdGhpcyBkZWZjb25maWcKYmVmb3JlIHlvdXIgdmVyc2lvbiBidW1wLiBJbmRkZWQgaXQgd291
bGQgYmUgYmV0dGVyIHRvIGZpeCB0aGUKQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9N
X1ZFUlNJT05fVkFMVUUgdG8gMjAyMi4xMCBldmVuIGlmIGl0J3MgdGhlCmRlZmF1bHQgb25lLgoK
Q2FyZSB0byB1cGRhdGUgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfTEFURVNUX1ZFUlNJT04g
dG8gMjAyNC4wMT8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAgQlIyX1RBUkdFVF9USV9LM19S
NV9MT0FERVJfQk9BUkRfREVGQ09ORklHPSJhbTYyeF9ldm1fcjUiCj4gK0JSMl9UQVJHRVRfVElf
SzNfUjVfTE9BREVSX1VTRV9CSU5NQU49eQo+ICBCUjJfVEFSR0VUX1VCT09UPXkKPiAgQlIyX1RB
UkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15Cj4gIEJSMl9UQVJHRVRfVUJPT1RfQ1VT
VE9NX1ZFUlNJT049eQo+IC1CUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIy
MDIyLjEwIgo+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIzLjEw
Igo+ICBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0iYW02MnhfZXZtX2E1MyIKPiAg
QlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQo+ICBCUjJfVEFSR0VUX1VCT09UX05FRURTX09Q
RU5TU0w9eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
