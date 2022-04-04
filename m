Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D27BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC2EB409EA;
	Mon,  4 Apr 2022 20:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCrbOLkiDFa5; Mon,  4 Apr 2022 20:18:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FF5040354;
	Mon,  4 Apr 2022 20:18:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1672F1BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 058638275C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uCx9nNVzJcWY for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:18:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 159918274E
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:18:14 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b24so12452519edu.10
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 13:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dhy7QYCJ3xpep2DTM5qshg/fUarn5LOgz03sKVJ11SA=;
 b=TyZWua2Z7qD6HJs0JYEKri/kQHwe1CAFIIeLfjbmmR8FzsTGDgBLImxXtxj096Mqml
 uKutN9cdWch6Dud8SWf3611tq8cXCOvxT3bkrSUBRD2pmTLj9qHxMdqqihcMdLS/Iadk
 TosvJqbLtNd+TtNetLFLOolSYzz1HpXu3Kl1IoWhwGgo7rcwSs8vpMPCQNFejYv+dPNC
 2M+g+eEuL/gpIAVK+QuCxxyL4yEiyfHZzp0nebYeMK6qkI/gKvSwW9ahvfBnN5dWIbyy
 4q1eb+bm/Fh4PVG5CgzoorWVfKTc8jVcDZyYn5luDziA9RXAnwD71qjaiHVoKQpuIBAh
 yc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dhy7QYCJ3xpep2DTM5qshg/fUarn5LOgz03sKVJ11SA=;
 b=Nn6qKJDzY7D/zy9aiUYbBN2kgVzlzLO/JgDuh2vf1VOgfbh8D46gM+mlqdkxJME6Lu
 ZrTkVgkvoiXytElgEVtotXO9JxzmlCwBSgIPssyLRKDl6PsYtO5eNmbaylR5oG9ANOyA
 9BMitLnS8oG6g4AypA6W5PRjkwID7BLfrEoEmjBM6G4LBi9DoYfJFMCmnARcVBGp7K9D
 HGDqQqqdFs7fCYGRQAsSlq+QeQVUlyyMa23OT0vRDYpV7nC2rj+9LDF31/ustahcAQbb
 WZ+NTUOP92HvMXTff3WBAyeUzuzGzImgH0kebiaYh0WEmCtIkr3yloSrKti0tNUmu6ZP
 oWOA==
X-Gm-Message-State: AOAM532458hn92JE3ePiQDmJz5OtjQ/QXv6OO22wqZDQUxSY98PLk4or
 BO66Ad9Gc4WUEi5dYvOvo6ffHg==
X-Google-Smtp-Source: ABdhPJwAJ5tyiqlrrhUKZUPrMD1H2EoUb7gMjoozrJyqIYFJJcJFTRqeT+U2LgK1+WyIbR6eaYbriw==
X-Received: by 2002:a50:cc8d:0:b0:41c:b4f4:c874 with SMTP id
 q13-20020a50cc8d000000b0041cb4f4c874mr1990579edi.92.1649103492241; 
 Mon, 04 Apr 2022 13:18:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a50ff16000000b00410d029ea5csm5714792edu.96.2022.04.04.13.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 13:18:11 -0700 (PDT)
Message-ID: <5c018422-c775-95a8-8766-6381b55b97e4@mind.be>
Date: Mon, 4 Apr 2022 22:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220404163320.337038-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404163320.337038-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libcoap: fix build with libressl
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNC8wNC8yMDIyIDE4OjMzLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IEZpeCB0aGUg
Zm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgd2l0aCBsaWJyZXNzbCByYWlzZWQgc2luY2UgY29tbWl0
Cj4gOGIxNGY2YjQ5Yjk2MmQ0ZDhmNzEzNWQ4NWFmYTE1NjU4ZWE4Zjk0YjoKPiAKPiBzcmMvY29h
cF9vcGVuc3NsLmM6MTA3OjM6IGVycmV1cjogbm9tIGRlIHR5cGUgwqvCoEJJT19BRERSwqDCuyBp
bmNvbm51Cj4gICAgMTA3IHwgICBCSU9fQUREUiAqYmlvX2FkZHI7Cj4gICAgICAgIHwgICBefn5+
fn5+fgo+IAo+IEZpeGVzOgo+ICAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVz
dWx0cy8zMDAyMmU0MzdmMzQ5NDU5OTk0ZGNjZmI2MTI3NzNkNTI5ZDk3YTIwCj4gCj4gU2lnbmVk
LW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cgog
IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+
ICAgcGFja2FnZS9saWJjb2FwL2xpYmNvYXAubWsgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9s
aWJjb2FwL2xpYmNvYXAubWsgYi9wYWNrYWdlL2xpYmNvYXAvbGliY29hcC5tawo+IGluZGV4IDhh
ODVmZjNhMmUuLmVkY2MxYmJlZjggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJjb2FwL2xpYmNv
YXAubWsKPiArKysgYi9wYWNrYWdlL2xpYmNvYXAvbGliY29hcC5tawo+IEBAIC0xOCw3ICsxOCw3
IEBAIGlmZXEgKCQoQlIyX1BBQ0tBR0VfR05VVExTKSx5KQo+ICAgTElCQ09BUF9ERVBFTkRFTkNJ
RVMgKz0gZ251dGxzCj4gICBMSUJDT0FQX0NPTkZfT1BUUyArPSBcCj4gICAJLS1lbmFibGUtZHRs
cyAtLXdpdGgtZ251dGxzIC0td2l0aG91dC1tYmVkdGxzIC0td2l0aG91dC1vcGVuc3NsCj4gLWVs
c2UgaWZlcSAoJChCUjJfUEFDS0FHRV9PUEVOU1NMKSx5KQo+ICtlbHNlIGlmZXEgKCQoQlIyX1BB
Q0tBR0VfTElCT1BFTlNTTCkseSkKPiAgIExJQkNPQVBfREVQRU5ERU5DSUVTICs9IG9wZW5zc2wK
PiAgIExJQkNPQVBfQ09ORl9PUFRTICs9IFwKPiAgIAktLWVuYWJsZS1kdGxzIC0td2l0aG91dC1n
bnV0bHMgLS13aXRob3V0LW1iZWR0bHMgLS13aXRoLW9wZW5zc2wKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
