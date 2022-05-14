Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B952C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 12:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D8758130D;
	Sat, 14 May 2022 12:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yrWGd9OwwuOx; Sat, 14 May 2022 12:37:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 126EE812E3;
	Sat, 14 May 2022 12:37:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C6811BF831
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 12:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4B02400AA
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 12:36:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHJatHzVXSNC for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 12:36:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F08CE40342
 for <buildroot@buildroot.org>; Sat, 14 May 2022 12:36:55 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d5so14598174wrb.6
 for <buildroot@buildroot.org>; Sat, 14 May 2022 05:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4S1T7sjWK4gHqRUXjMZsuxxWwEyPx07ja2iICnBGH7k=;
 b=iE5HAuGqIag/9j9U0vvNSGIlNO8bG1k7I50rGTFUFI868z8FqBmSOEaav8og+EH/Ic
 y8tpPobLRZnZ70iPO2O/DG7zd8Iyk73snmPFRmwSKDaETcNxKv37ZYRbPjcRRJuMQ7y9
 FdG4NbJTBh1XJuj4A22D3o+1a3REEtc+HIx2Jab04NwL73dFlmNmCcUjBgUjPmv9otZ5
 VGJ1z+T0Gro36hP052K9PuxFJZpUNkPuFKkMhoIpwfIJwOB/CSpD7MvKmxIoH29wihbY
 xQd/iOTVe7bglDDI3eCoaVs8r3szoN1drcVKImVRNfmAyKGKFEwIhcDauWV+BL14Y1PU
 gMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4S1T7sjWK4gHqRUXjMZsuxxWwEyPx07ja2iICnBGH7k=;
 b=rRcCnwPhxVvluYF46HXSe5e3mIKj1HwtCX4+ngIC3BCNCHthETy5ciMzwgDThs6cxL
 a+D1XohKJl0JuU16oNHEmCzw1kURXEBFEE8TXgY4yQ/ky4OmZWt4XE/PrKXMgCJlEVay
 Yqvto/nWSajyuIod5k2HL0a9IMgEpuJNz9lHA+nHbEGD39rfxkefxrOhnvbQg+syd4t4
 /VSdzp9nRcF23PmfI5KuzaWlKPjL7phFCALZ5c4v16ZHPC/17yjFgJwOYn3AurQc3g/L
 yR8W8PDbFRAZRgaxTNFZIXkIfB7jdl2gPpwzC1Id2IcFp5ILnLJ30IlL5d9NnS5q6PJa
 9heQ==
X-Gm-Message-State: AOAM5303Jv7IhuY/MkFhhQw8RV6yKamwNrgZVJHbbInXEe9mP8hL4tKM
 /fywpnRksO7rjy/XgCHw/Vo=
X-Google-Smtp-Source: ABdhPJypd+Sa5ETjHVS+4Tgqo161Qr7am5wsFUy3HG1eHyFoVFMrqYTgaf6ukAVnkoqmJ4RiHDIIJQ==
X-Received: by 2002:a5d:43d2:0:b0:20c:b986:a337 with SMTP id
 v18-20020a5d43d2000000b0020cb986a337mr7125132wrr.445.1652531813981; 
 Sat, 14 May 2022 05:36:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adf9dcb000000b0020c5253d8cbsm4580464wre.23.2022.05.14.05.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 05:36:53 -0700 (PDT)
Message-ID: <e2817957-ded6-1873-c027-c912af2e45e0@gmail.com>
Date: Sat, 14 May 2022 14:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, buildroot@buildroot.org
References: <20220514055312.2038383-1-clg@kaod.org>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220514055312.2038383-1-clg@kaod.org>
Subject: Re: [Buildroot] [PATCH] configs/qemu_ppc64le_powernv8: use linux
 kernel 5.17.7 and binutils 2.36.1
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAxNC8wNS8yMDIyIMOgIDA3OjUzLCBDw6lkcmljIExlIEdvYXRlciBhIMOpY3Jp
dMKgOgo+IHBwYzY0IG9yIHBvd2VybnYgTGludXggZGVmY29uZmlnIGZhaWwgdG8gYnVpbGQgd2l0
aCBnY2MgMTEgYW5kL29yCj4gYmludXRpbHMgMi4zNyBbMV0gOgo+IAo+ICAgQ0MgICAgICBrZXJu
ZWwva2V4ZWNfZmlsZS5vCj4gICBDYW5ub3QgZmluZCBzeW1ib2wgZm9yIHNlY3Rpb24gMTA6IC50
ZXh0LnVubGlrZWx5Lgo+ICAga2VybmVsL2tleGVjX2ZpbGUubzogZmFpbGVkCj4gCj4gUGF0Y2hl
cyBoYXZlIGJlZW4gc2VudCB1cHN0cmVhbSBhbmQgc2hvdWxkIHJlYWNoIExpbnV4IDUuMTguIFVu
dGlsCj4gdGhlbiwgYnVtcCBrZXJuZWwgdmVyc2lvbiB0byB0aGUgbGF0ZXN0IHN1cHBvcnRlZCBp
biBidWlsZHJvb3QgYW5kCj4gbGltaXQgYmludXRpbHMgdG8gMi4zNi4xIHdoaWNoIGRvZXNuJ3Qg
cmFpc2UgdGhlIGlzc3VlLgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vbGludXhwcGMvaXNz
dWVzL2lzc3Vlcy8zODgKClRoaXMgYWxzbyBmaXhlcyBxZW11IHBwYzY0IGRlZmNvbmZpZ3MgdGVz
dCBpbiBnaXRsYWI6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2pvYnMvMjQ0NTc5Mzg5MQpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QvLS9qb2JzLzI0NDU3OTM4OTIKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVp
bGRyb290Ly0vam9icy8yNDQ1NzkzODkzCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUg
R29hdGVyIDxjbGdAa2FvZC5vcmc+Cj4gLS0tCj4gIGNvbmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2Vy
bnY4X2RlZmNvbmZpZyB8IDUgKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3BwYzY0bGVf
cG93ZXJudjhfZGVmY29uZmlnIGIvY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29u
ZmlnCj4gaW5kZXggYTc4NDY5NWRkZjA2Li44ZGU0Y2Y1MTg5YjUgMTAwNjQ0Cj4gLS0tIGEvY29u
Zmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy9xZW11
X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnCj4gQEAgLTMsNiArMyw3IEBAIEJSMl9wb3dlcnBj
NjRsZT15Cj4gIEJSMl9wb3dlcnBjX3Bvd2VyOD15Cj4gIAo+ICAjIFN5c3RlbQo+ICtCUjJfQklO
VVRJTFNfVkVSU0lPTl8yXzM2X1g9eQoKSGF2ZSB5b3UgY29uc2lkZXJlZCBhZGRpbmcgdGhlIHBh
dGNoIGluIGJvYXJkL3FlbXUvcHBjNjQtKi9wYXRjaGVzL2xpbnV4IGluc3RlYWQKb2YgZG93bmdy
YWRpbmcgYmludXRpbHMgdmVyc2lvbj8KCk90aGVyIHBwYzY0IGRlZmNvbmZpZyBkb2Vzbid0IHNl
ZW1zIHRvIHRyaWdnZXIgdGhpcyBpc3N1ZToKZnJlZXNjYWxlX3QxMDQwZDRyZGJfZGVmY29uZmln
OkJSMl9wb3dlcnBjNjQ9eQpmcmVlc2NhbGVfdDIwODBfcWRzX3JkYl9kZWZjb25maWc6QlIyX3Bv
d2VycGM2ND15CnFlbXVfcHBjNjRfZTU1MDBfZGVmY29uZmlnOkJSMl9wb3dlcnBjNjQ9eQoKQmVz
dCByZWdhcmRzLApSb21haW4KCgo+ICBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0iaHZj
MCIKPiAgQlIyX1NZU1RFTV9ESENQPSJldGgwIgo+ICAKPiBAQCAtMTUsMTIgKzE2LDEyIEBAIEJS
Ml9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3FlbXUvcG9zdC1pbWFnZS5zaCIKPiAg
QlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSIkKEJSMl9ERUZDT05GSUcpIgo+ICAKPiAgIyBM
aW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsCj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVB
REVSU19DVVNUT01fNV8xNT15Cj4gK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNU
T01fNV8xNz15Cj4gIAo+ICAjIEtlcm5lbAo+ICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgQlIyX0xJ
TlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZF
UlNJT05fVkFMVUU9IjUuMTUuMTgiCj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05f
VkFMVUU9IjUuMTcuNyIKPiAgQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9InBvd2VybnYiCj4g
IEJSMl9MSU5VWF9LRVJORUxfVk1MSU5VWD15Cj4gIAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
