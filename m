Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957D5C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 20:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 424A760AF4;
	Tue, 28 Feb 2023 20:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 424A760AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yThDEWQYEmwp; Tue, 28 Feb 2023 20:39:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 886CF60AED;
	Tue, 28 Feb 2023 20:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 886CF60AED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6DFE1BF293
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCFFC818A2
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCFFC818A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0AjpqpXTHzbx for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 20:38:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F294081839
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F294081839
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 20:38:56 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id g3so2240691wri.6
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 12:38:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677616735;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RyCwnpm22tCD7n+XwXxpgGqR2stsnbK+SYNFjNFMTq0=;
 b=UxarCKl1kjCaAvk1DC45e94Zg+xdvvEEOxWFuFOIsvRQ7x8C6hMqQBHVvB2EBCYfZM
 GFOODVOGwgaZ1ykvjLl55omfNkyUM+fVlmKsAGlI6B3KX9mUm/eFB8pLjEjoSpHJpicD
 ahiTslTjZMnTGDdWRc/Pgugbr0ECgmjoYEEu92SA6CN0l8FnoUFjqQ3ssLO/l5QntfUI
 IwZDBW3Pu7irOVOzbgzeZD9KBb21eBnGGfkq8uwmjDGW0bBIwPkxAD0F3PmwUg2tzEaE
 snnX8c8h/GAaLXNhfoMLQE0ySyHYz3PhKOGePD1/VjfszSqSNkPUm0ZQls9umCHX4UpE
 +K1g==
X-Gm-Message-State: AO0yUKWXNQeqEvfH8z4pV4AYq6xFvH74miZ8Y6iyBPviBBhme1O/ueSS
 jt5djW/02v8YHwFX0Awz0XsSToppWAPaSQ==
X-Google-Smtp-Source: AK7set8gDH2lBoxxSSKFEkjSIy2fUYAeiurq2iW9I8sDqCV4VBZiEJzLJa1I04wseZ9D1gvpFvULzg==
X-Received: by 2002:a05:6000:601:b0:2c5:4a22:937c with SMTP id
 bn1-20020a056000060100b002c54a22937cmr9650470wrb.27.1677616734876; 
 Tue, 28 Feb 2023 12:38:54 -0800 (PST)
Received: from ?IPV6:2a02:8070:4182:37a0:64cb:8203:42ee:ef04?
 ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a5d464c000000b002c71a32394dsm10782188wrs.64.2023.02.28.12.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 12:38:54 -0800 (PST)
Message-ID: <16816a3d-c62a-c1e9-9409-78541956b1ba@gmail.com>
Date: Tue, 28 Feb 2023 21:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: stephane gonauer <stephane.gonauer@6wind.com>
References: <20221224171920.11256-1-raphael.pavlidis@gmail.com>
 <20230222232157.380b6109@windsurf>
 <20230228130843.GC32199@carcass.dev.6wind.com>
 <CANqv2T3GWoqn6an34HQUW6njK2g=YZCqvoDMh-kfKooVacRMpA@mail.gmail.com>
 <886d6be9-94ba-2bc9-5583-4c9400bf3a76@gmail.com>
 <CANqv2T2r0sbnwdMinzdw7ryw9CUsx=jwCD0hvA3FT2mxVFQz8g@mail.gmail.com>
 <CANqv2T0Riojve2sNUNky28Vt8A=sMwVuZEsTZv66Zace1JnRWA@mail.gmail.com>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <CANqv2T0Riojve2sNUNky28Vt8A=sMwVuZEsTZv66Zace1JnRWA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677616735;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RyCwnpm22tCD7n+XwXxpgGqR2stsnbK+SYNFjNFMTq0=;
 b=fiqpaH9sVPs8QxM1zNIpJbPVTaCvJbhQypiKwQmFYCLDPsE36wROUf8d3RkYQWzhNk
 MOiD5cYzqPJEfd4aHMGuyGV/fpArokVYYhcjRHIPprOz6GFzj2U0yloByH6kKGAZxNJx
 jWvNoNlIcb2MQ3MipZxNetist5Hih8Fv/r/VQ5KuAbhQ6p/CNsdLiYGOh4jJ7K5jA+D0
 q9opvWCkU8l1BGFRj9QUxDutgoIkNc1Y2hLDgzE3FPmQXK62Rfmu2GVhQfKFyZheazqf
 yjcrCMp5nsO7xZi+GqSrscLXUM3SikigBRd244Jdn55nFPzF3urxpnZFP7DdXLfza0Ff
 NOig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fiqpaH9s
Subject: Re: [Buildroot] [PATCH v4 1/1] package/shadow: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU3RlcGhhbmUsCgpPbiAyOC4wMi4yMyAxODoxMCwgc3RlcGhhbmUgZ29uYXVlciB3cm90ZToK
PiBIaSwKPiAKPiBJZiBteSBwcmV2aW91cyBlbWFpbCBpcyBub3QgY2xlYXIgOgo+IAo+IC0gcWVt
dV94ODZfNjRfZGVmY29uZmlnICsgQlIyX1BBQ0tBR0VfU0hBRE9XIC0+IHdvcmtzCj4gLSBxZW11
X3g4Nl82NF9kZWZjb25maWcgKyBCUjJfUEFDS0FHRV9TSEFET1cgICsgQlIyX1BBQ0tBR0VfTElO
VVhfUEFNCj4gLT4gZmFpbHMgYW5kIHRoZXJlIGlzIG5vICJzeXN0ZW0tYXV0aCIgZmlsZSBhbnl3
aGVyZSBpbiB0aGUgYnVpbGQKPiAtIHFlbXVfeDg2XzY0X2RlZmNvbmZpZyArIEJSMl9QQUNLQUdF
X1NIQURPVyAgKyBCUjJfUEFDS0FHRV9MSU5VWF9QQU0KPiArIEJSMl9JTklUX1NZU1RFTUQtPiBm
YWlscywgc3lzdGVtLWF1dGggaXMgbm90IGluIC9ldGMvcGFtLmQgaW4gdGhlCj4gdGFyZ2V0IGZv
bGRlci4gSSBkb24ndCBrbm93IHdoYXQgaGFwcGVuIGF0IHJ1bnRpbWUgKGJlY2F1c2UgSSBjYW5u
b3QKPiBsb2dpbikgIGluIHRoYXQgY2FzZSBJIGFsc28gZmluZAo+IHRhcmdldC91c3Ivc2hhcmUv
ZmFjdG9yeS9ldGMvcGFtLmQvc3lzdGVtLWF1dGgKClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRp
b24uCgo+IAo+IERvIHlvdSB0aGluayB3aXRoL3dpdGhvdXQgc3lzdGVtZCBjYXNlIHNob3VsZCBi
ZSBmaXhlZCBkaWZmZXJlbnRseSA/Cj4gSW4gYW55IGNhc2UgdGhlIG1pc3NpbmcgZmlsZSBzZWVt
cyB0byBiZSAvZXRjL3BhbS5kL3N5c3RlbS1hdXRoLgoKWWVzLCB0aGUgZmlsZSBpcyBwcmVzZW50
IHdpdGggc3lzdGVtZCwgYnV0IGl0IGlzIG5vdCBjb3BpZWQgZHVyaW5nIGJvb3QgCmJ5IHN5c3Rl
bWQtdG1wZmlsZXMuc2VydmljZS4KCj4gCj4gU3TDqXBoYW5lCj4gCltTTklQXQoKV291bGQgeW91
IGxpa2UgdG8gdGVsbCBtZSwgd2hpY2ggY29tbWFuZCB5b3UgYXJlIHVzaW5nIHdpdGggUUVNVT8g
SSAKd291bGQgbGlrZSB0byBjaGVjaywgd2hhdCBoYXBwZW5lZCAoaWYgSSBmaW5kIHRoZSB0aW1l
IHRvKS4KClRoYW5rcywKUmFwaGFlbCBQYXZsaWRpcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
