Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815F7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 15:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2321B60BB0;
	Sun, 20 Feb 2022 15:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uVjHFiDkO2-W; Sun, 20 Feb 2022 15:10:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38AAC60BAA;
	Sun, 20 Feb 2022 15:10:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E15F31BF303
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 15:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEC4840183
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 15:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g09XVbBT3bed for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 15:10:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A65C3400C1
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 15:10:34 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id o34so8137009wms.1
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 07:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=FgiYE+JCNDO2llS2deeA5rrEx4eMiNWnP7nToHjuH1s=;
 b=AAqM+fQodXsupdLh926y2XxnhQmeGGXtKorm4R2BylxPlhzE5STHClp4gGhG8JRKmj
 Ou3Eg9fycpMBFlUThJJinoP36WQgmltVfmJssBMCVDgh+YYYj8vV1WxGruKcUQBwOHS/
 uQ9wYzeiohHlydM9mxBxHvDaKhUHI+wWRdl6ESwNGi20gPctYBOSqIcMRYqWd2LrPFT/
 F4w37Z42DQE1g5vUFsIcAhhGSmhkHVe3pKbtzJDVZZcYRsc1kMLrOuuq3SAn9uwSoUhw
 REFCqKEvWTar6mfXEwVz8IcRyG0rFHxAy1uDus+c9LVTouBiUcboCCjvTGGLtLGUw3nM
 GsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FgiYE+JCNDO2llS2deeA5rrEx4eMiNWnP7nToHjuH1s=;
 b=Uz2UIap5rui3rpDfPFjjDBtfCeTc4IZuiqjIRvc9Py/YPlig2rMTRHjlaszKm/lIpi
 zy/2OZ2Lk+/KqztwgoVz6QiQfY9pGMT+SavgaEOE3xe8q7re5jG3dUO33//ZHLinMpIg
 IzD+DfKmaHMRZFxOvP+aoJqkARE6hwO8eOEDwXjoS4hFzovSEPnF5VXj565F4a4GMBuq
 G7/k/rMS6Sx0c6J6tWf5bIXHFVlKfwYBU1yrCR6u3o9Um2aip0fqmtWFAiVjgoQdYDtl
 r7uqa99h5eGi1gW+DZ0WBrX8X2jXgcdvFtCfR97dxQRHvRlNZqSB5ZD57h8nkEtPCOsZ
 ckrA==
X-Gm-Message-State: AOAM531Pkl8KS9C71XiaKXdO1fp6hJ7IpLWEoFBQXXYmrI2bOw8mqaEe
 nGFfhoHEGfKLZUz6A0DnovI=
X-Google-Smtp-Source: ABdhPJw3+DtVPeDYBfAZlKRnq9zdLSiQXnyw54H62kSxGL4BDq78LfeYfy+PEIdLU2LdH0RFTDuE0w==
X-Received: by 2002:a1c:29c3:0:b0:350:9797:b38f with SMTP id
 p186-20020a1c29c3000000b003509797b38fmr17952745wmp.22.1645369832715; 
 Sun, 20 Feb 2022 07:10:32 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id z7sm4886803wml.40.2022.02.20.07.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 07:10:32 -0800 (PST)
Message-ID: <9e895f60-6a7d-c40b-3106-56d8f4aa3946@gmail.com>
Date: Sun, 20 Feb 2022 16:10:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220217094048.2756293-1-fontaine.fabrice@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220217094048.2756293-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/luasyslog: bump to version 2.2.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKCkxlIDE3LzAyLzIwMjIgw6AgMTA6NDAsIEZhYnJpY2UgRm9udGFpbmUg
YSDDqWNyaXTCoDoKPiBUaGlzIGJ1bXAgY29udGFpbnMgYSBzaW5nbGUgY29tbWl0IHdoaWNoIGZp
eGVzIHRoZSBmb2xsb3dpbmcgYnVpbGQKPiBmYWlsdXJlIHdpdGggTHVhIDUuNCByYWlzZWQgc2lu
Y2UgY29tbWl0Cj4gNGY5YTU2NTkwMjNjNjZmYzE2NmRlMjhmZDM5YTZjOTdhOTQ5MDY2NzoKPiAK
PiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gbHN5c2xvZy5jOjExOgo+IGNvbXBhdC01LjMuaDo0MDI6
NDogZXJyb3I6ICNlcnJvciAidW5zdXBwb3J0ZWQgTHVhIHZlcnNpb24gKGkuZS4gbm90IEx1YSA1
LjEsIDUuMiwgb3IgNS4zKSIKPiAgIDQwMiB8ICMgIGVycm9yICJ1bnN1cHBvcnRlZCBMdWEgdmVy
c2lvbiAoaS5lLiBub3QgTHVhIDUuMSwgNS4yLCBvciA1LjMpIgo+ICAgICAgIHwgICAgXn5+fn4K
PiAKPiBBbHNvIHVwZGF0ZSBpbmRlbnRhdGlvbiBpbiBoYXNoIGZpbGUgKHR3byBzcGFjZXMpCj4g
Cj4gRml4ZXM6Cj4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZGYy
YWFiY2YyYWUwN2NhZDY2Yjg2OWVjNGFjNzY3MDJkMmMzMmRjNQoKSXQgYWxzbyBmaXhlcyB0aGUg
bHVhc3lzbG9nIHRlc3Q6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC8tL2pvYnMvMjA4ODY4MzkwMwoKcnVudGltZSB0ZXN0ZWQgd2l0aCB0ZXN0cy5wYWNrYWdlLnRl
c3RfbHVhc3lzbG9nLlRlc3RMdWFMdWFzeXNsb2cKClJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIg
PHJvbWFpbi5uYW91ckBnbWFpbC5jb20+ClRlc3RlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4u
bmFvdXJAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+IC0tLQo+
ICBwYWNrYWdlL2x1YXN5c2xvZy9sdWFzeXNsb2cuaGFzaCB8IDQgKystLQo+ICBwYWNrYWdlL2x1
YXN5c2xvZy9sdWFzeXNsb2cubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhc3lz
bG9nL2x1YXN5c2xvZy5oYXNoIGIvcGFja2FnZS9sdWFzeXNsb2cvbHVhc3lzbG9nLmhhc2gKPiBp
bmRleCBiY2I2YTdlMDI1Li4xZTJhNWRkZWM1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbHVhc3lz
bG9nL2x1YXN5c2xvZy5oYXNoCj4gKysrIGIvcGFja2FnZS9sdWFzeXNsb2cvbHVhc3lzbG9nLmhh
c2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgIyBMb2NhbGx5IGNvbXB1dGVkCj4gLXNoYTI1NiA3Zjdk
YWQ2NDExNzQwN2YyNDg0ZmY1YjUzZTkwODA0ZjkyM2E5OWZjYmRlNTg3MmU1NGY2YWJhNTNmNDgy
ZGEwICBsdWFzeXNsb2ctMi4yLjAudGFyLmd6Cj4gLXNoYTI1NiA4MzM0NTc5MzhmNTE1NWU2NWRh
YmRhMTJhNWM5ZDRiNmZkN2ZiOTJkZDdlYWQ1ODRjMWMzMGNmYjBjODRhZGY0ICBDT1BZSU5HCj4g
K3NoYTI1NiAgYjFiMTljYTE0MjEzMGY5M2MzZjhmMmU4NTMwM2ZmNTBjYzZmNGVkNGFhNTJiODU2
OTE3NmFlNTZlM2RjM2Y0MyAgbHVhc3lzbG9nLTIuMi4xLnRhci5nego+ICtzaGEyNTYgIDgzMzQ1
NzkzOGY1MTU1ZTY1ZGFiZGExMmE1YzlkNGI2ZmQ3ZmI5MmRkN2VhZDU4NGMxYzMwY2ZiMGM4NGFk
ZjQgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdWFzeXNsb2cvbHVhc3lzbG9nLm1r
IGIvcGFja2FnZS9sdWFzeXNsb2cvbHVhc3lzbG9nLm1rCj4gaW5kZXggMDQ5ZTA2OGExMy4uOTcy
ZDRjNWE3ZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1YXN5c2xvZy9sdWFzeXNsb2cubWsKPiAr
KysgYi9wYWNrYWdlL2x1YXN5c2xvZy9sdWFzeXNsb2cubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAg
Iwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtTFVBU1lTTE9HX1ZFUlNJT04gPSAy
LjIuMAo+ICtMVUFTWVNMT0dfVkVSU0lPTiA9IDIuMi4xCj4gIExVQVNZU0xPR19TSVRFID0gJChj
YWxsIGdpdGh1YixudGQsbHVhc3lzbG9nLCQoTFVBU1lTTE9HX1ZFUlNJT04pKQo+ICBMVUFTWVNM
T0dfREVQRU5ERU5DSUVTID0gaG9zdC1sdWFyb2NrcyBsdWFpbnRlcnByZXRlcgo+ICBMVUFTWVNM
T0dfTElDRU5TRSA9IE1JVAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
