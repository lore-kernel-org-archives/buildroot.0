Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2FAC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 15:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 978CE40590;
	Sun,  3 Apr 2022 15:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awRhUYwDyA8f; Sun,  3 Apr 2022 15:03:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68B934056C;
	Sun,  3 Apr 2022 15:03:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F6D81BF96B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E07A8188A
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxi2JgBNsHUC for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 15:03:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5378C81819
 for <buildroot@busybox.net>; Sun,  3 Apr 2022 15:03:51 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id q26so617232edc.7
 for <buildroot@busybox.net>; Sun, 03 Apr 2022 08:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=c4V0GUSKO4twzQ4RNLJlHCS+FNQV9EXfCILEWl2jDnI=;
 b=LgPJSogn3M6dWU/l+XTba0Ckg1zRMLeA/L4cj8/Dq+zyw7+1gdpAMO/6WGi5CeAKDf
 kdOCKEZOkb528poyzzX1n5ZAYs2iP8H1/vjDXndtpoccLcipo9GZq7hp9ldYWdUpsN3B
 mgfgLcpb4uBTvqhNYvCj4BI4JNxmo4RVDmgnLxqaTzUF6T/LcDQ0/nB3auc5m2YlxZTx
 jRddBsw+Q2+c9oPUuUsw136zk14UDLQWz8f4nwZvLQFUmEJKO7A5v0jpjhCabSjhtrxz
 W5Xibekwak4F0OIOIIBcXZix064FLT6OYWCp+oLqBixQ5XPqeLReNxd+O99B83ETO1qr
 nXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=c4V0GUSKO4twzQ4RNLJlHCS+FNQV9EXfCILEWl2jDnI=;
 b=2QignCq+7xy09wNhMqTF9c2e6leYl7yxH/rnxHPhaxsZa4KF8BiUAg+U/dnDyWVYS3
 QGWi3KvnQQxH2OA2RlvcT3KwDo6U+4NP2z73qhABah9NbhKPhJgvumTHSgAHRJepurgB
 Du9/QcC8zvoEd7Io7mVBiSASjhshv5e0oO9YoO8eu9hXTDMyTBrLFXKF19V4KZAUEoTz
 YzikgcayxtoGU2EDgohXtUMR1zb1cqrLtPQbrA3fLWmG/GWA719qYidDwdsLEXlsr4L5
 rWYX9Ic2b/PNT4NsH0QdOQO4qMZiu1Uo8IuBOB68+dCwXH/VR9QMQwJIKk+MiNAZF+9S
 GZxQ==
X-Gm-Message-State: AOAM532auTAG1a1HFmZuy2pwuyhvTiaQBRnu+vpYOLF43B4QHofG6ZZa
 C5oBMi9EQjTbKbqVpv5MS5ym9gOTpwOHog==
X-Google-Smtp-Source: ABdhPJzZF7XorV07otTDm5IrM2IvGO41ezN0sDlXayUcp0wNBEEUPaMGLJ+Wx0SuLkXbs1hGnG1NQg==
X-Received: by 2002:a05:6402:1749:b0:419:325b:f8c with SMTP id
 v9-20020a056402174900b00419325b0f8cmr29543711edx.386.1648998229581; 
 Sun, 03 Apr 2022 08:03:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425?
 (ptr-9fplejof7ird5pjql2d.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a170906435700b006b0e62bee84sm3303592ejm.115.2022.04.03.08.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 08:03:49 -0700 (PDT)
Message-ID: <5e890c81-6982-120e-5fbc-a201f3483411@mind.be>
Date: Sun, 3 Apr 2022 17:03:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220330073152.1804932-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220330073152.1804932-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/luaexpt: bump to version 1.4.0
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

CgpPbiAzMC8wMy8yMDIyIDA5OjMxLCBGcmFuY29pcyBQZXJyYWQgd3JvdGU6Cj4gbW92ZWQgdW5k
ZXIgdGhlIGhhdCBvZiBodHRwczovL2dpdGh1Yi5jb20vbHVuYXJtb2R1bGVzCj4gCj4gcmVtb3Zl
IHVwc3RyZWFtIHBhdGNoCj4gCj4gZGlmZiBMSUNFTlNFOgo+IC1UaGUgTUlUIExpY2Vuc2UgKE1J
VCkKPiAtQ29weXJpZ2h0IChjKSAyMDEzIFRvbcOhcyBHdWlzYXNvbGEKPiArQ29weXJpZ2h0IChD
KSAyMDAzLTIwMDcgVGhlIEtlcGxlciBQcm9qZWN0LCAyMDEzLTIwMjIgTWF0dGhldyBXaWxkCj4g
Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5v
cmc+CgogIEFwcGxpZWQgdG8gbWFzdGVyIGFmdGVyIGZpeGluZyB0aGUgdHlwbyBpbiB0aGUgc3Vi
amVjdCwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAgIC4uLi8wMDAxLXJl
c3RvcmUtZ2V0Y3VycmVudGJ5dGVjb3VudC5wYXRjaCAgICB8IDQwIC0tLS0tLS0tLS0tLS0tLS0t
LS0KPiAgIHBhY2thZ2UvbHVhZXhwYXQvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICB8ICAy
ICstCj4gICBwYWNrYWdlL2x1YWV4cGF0L2x1YWV4cGF0Lmhhc2ggICAgICAgICAgICAgICAgfCAg
NCArLQo+ICAgcGFja2FnZS9sdWFleHBhdC9sdWFleHBhdC5tayAgICAgICAgICAgICAgICAgIHwg
IDMgKy0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMo
LSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2x1YWV4cGF0LzAwMDEtcmVzdG9yZS1n
ZXRjdXJyZW50Ynl0ZWNvdW50LnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhZXhw
YXQvMDAwMS1yZXN0b3JlLWdldGN1cnJlbnRieXRlY291bnQucGF0Y2ggYi9wYWNrYWdlL2x1YWV4
cGF0LzAwMDEtcmVzdG9yZS1nZXRjdXJyZW50Ynl0ZWNvdW50LnBhdGNoCj4gZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggNmNmMjE5MjY3Li4wMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdl
L2x1YWV4cGF0LzAwMDEtcmVzdG9yZS1nZXRjdXJyZW50Ynl0ZWNvdW50LnBhdGNoCj4gKysrIC9k
ZXYvbnVsbAo+IEBAIC0xLDQwICswLDAgQEAKPiAtRnJvbSA3N2NiNjkxZjc4MTkxODkwOGRmZTM0
Nzg1ZjAwYTVmZjc1ZDVjYzIwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IC1Gcm9tOiBGcmFu
Y29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4KPiAtRGF0ZTogU2F0LCAxNiBG
ZWIgMjAxOSAxNTo1NjowMCArMDEwMAo+IC1TdWJqZWN0OiBbUEFUQ0hdIHJlc3RvcmUgZ2V0Y3Vy
cmVudGJ5dGVjb3VudAo+IC0KPiAtc2VlIGh0dHBzOi8vZ2l0aHViLmNvbS90b21hc2d1aXNhc29s
YS9sdWFleHBhdC9pc3N1ZXMvMwo+IC0KPiAtRmV0Y2ggZnJvbTogaHR0cHM6Ly9naXRodWIuY29t
L3RvbWFzZ3Vpc2Fzb2xhL2x1YWV4cGF0L2NvbW1pdC8wOTI2ZjJkNzA1MTA5YjdkMzViNzIxMzQ0
MjY0YjM5YzExNjllMGRlCj4gLQo+IC1TaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZy
YW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4KPiAtLS0tCj4gLSBzcmMvbHhwbGliLmMgfCA3ICsrKysr
KysKPiAtIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAtCj4gLWRpZmYgLS1naXQg
YS9sdWFleHBhdC0xLjMuMy9zcmMvbHhwbGliLmMgYi9sdWFleHBhdC0xLjMuMy9zcmMvbHhwbGli
LmMKPiAtaW5kZXggNzcyNjkxMy4uMzViZWMzYyAxMDA2NDQKPiAtLS0tIGEvbHVhZXhwYXQtMS4z
LjMvc3JjL2x4cGxpYi5jCj4gLSsrKyBiL2x1YWV4cGF0LTEuMy4zL3NyYy9seHBsaWIuYwo+IC1A
QCAtNTM4LDExICs1MzgsMTggQEAgc3RhdGljIGludCBseHBfc3RvcCAobHVhX1N0YXRlICpMKSB7
Cj4gLSAgIHJldHVybiAxOwo+IC0gfQo+IC0KPiAtK3N0YXRpYyBpbnQgbHhwX2dldGN1cnJlbnRi
eXRlY291bnQgKGx1YV9TdGF0ZSogTCkgewo+IC0rICBseHBfdXNlcmRhdGEgKnhwdSA9IGNoZWNr
cGFyc2VyKEwsIDEpOwo+IC0rICBsdWFfcHVzaGludGVnZXIoTCwgWE1MX0dldEN1cnJlbnRCeXRl
Q291bnQoeHB1LT5wYXJzZXIpKTsKPiAtKyAgcmV0dXJuIDE7Cj4gLSt9Cj4gLSsKPiAtIHN0YXRp
YyBjb25zdCBsdWFMX1JlZyBseHBfbWV0aHNbXSA9IHsKPiAtICAgeyJwYXJzZSIsIGx4cF9wYXJz
ZX0sCj4gLSAgIHsiY2xvc2UiLCBseHBfY2xvc2V9LAo+IC0gICB7Il9fZ2MiLCBwYXJzZXJfZ2N9
LAo+IC0gICB7InBvcyIsIGx4cF9wb3N9LAo+IC0rICB7ImdldGN1cnJlbnRieXRlY291bnQiLCBs
eHBfZ2V0Y3VycmVudGJ5dGVjb3VudH0sCj4gLSAgIHsic2V0ZW5jb2RpbmciLCBseHBfc2V0ZW5j
b2Rpbmd9LAo+IC0gICB7ImdldGNhbGxiYWNrcyIsIGdldGNhbGxiYWNrc30sCj4gLSAgIHsiZ2V0
YmFzZSIsIGdldGJhc2V9LAo+IC0tLQo+IC0yLjE3LjEKPiAtCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbHVhZXhwYXQvQ29uZmlnLmluIGIvcGFja2FnZS9sdWFleHBhdC9Db25maWcuaW4KPiBpbmRl
eCAyMzIyZGM0MzAuLjI1YjA2NzQ2MCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1YWV4cGF0L0Nv
bmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbHVhZXhwYXQvQ29uZmlnLmluCj4gQEAgLTQsNCArNCw0
IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MVUFFWFBBVAo+ICAgCWhlbHAKPiAgIAkgIEx1YUV4cGF0
IGlzIGEgU0FYIFhNTCBwYXJzZXIgYmFzZWQgb24gdGhlIEV4cGF0IGxpYnJhcnkuCj4gICAKPiAt
CSAgaHR0cDovL3d3dy5rZXBsZXJwcm9qZWN0Lm9yZy9sdWFleHBhdC8KPiArCSAgaHR0cHM6Ly9s
dW5hcm1vZHVsZXMuZ2l0aHViLmlvL2x1YWV4cGF0Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVh
ZXhwYXQvbHVhZXhwYXQuaGFzaCBiL3BhY2thZ2UvbHVhZXhwYXQvbHVhZXhwYXQuaGFzaAo+IGlu
ZGV4IGRkMWNmNDBlNS4uZmJmYjYyM2ZjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbHVhZXhwYXQv
bHVhZXhwYXQuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbHVhZXhwYXQvbHVhZXhwYXQuaGFzaAo+IEBA
IC0xLDMgKzEsMyBAQAo+ICAgIyBjb21wdXRlZCBieSBsdWFyb2Nrcy9idWlsZHJvb3QKPiAtc2hh
MjU2IGI1NTkwOGZjZDdkZjQ5MGE1OWFhYjI1Mjg0NDYwYWRkODI4M2YxYzZiOTRhYjU4NDkwMGZl
M2U0OTc3NTE3MmEgIGx1YWV4cGF0LTEuMy4zLTEuc3JjLnJvY2sKPiAtc2hhMjU2IDdmNWNiMGMx
NzUwYmFiY2JiMDk2MzdiN2YwZmYzNDk3MmQ1MWNmMjNiN2Y0MTNiZWY5MDJiNDdhYTY1ZmViY2Qg
IGx1YWV4cGF0LTEuMy4zL0xJQ0VOU0UKPiArc2hhMjU2ICBiZWU4OGRkYzEwNjNmNDljNTY4NWI3
NWI2Njk2ZThkZjA2MDdhMzg4NDMyY2JjYjE4OWNkMGI4MjkxZDk1NmFhICBsdWFleHBhdC0xLjQu
MC0xLnNyYy5yb2NrCj4gK3NoYTI1NiAgN2U2YTcyN2U1YjU3Y2NhNzEzYTJmMjYzM2YwNWQ3ZTBj
YzFlMjYxY2M2YTc2MTNiYmUyNjZlNjI1YjJmMTRkYSAgbHVhZXhwYXQvTElDRU5TRQo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2x1YWV4cGF0L2x1YWV4cGF0Lm1rIGIvcGFja2FnZS9sdWFleHBhdC9s
dWFleHBhdC5tawo+IGluZGV4IDhjODZiMjRmMi4uYzE3NmZiOGMxIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbHVhZXhwYXQvbHVhZXhwYXQubWsKPiArKysgYi9wYWNrYWdlL2x1YWV4cGF0L2x1YWV4
cGF0Lm1rCj4gQEAgLTQsNyArNCw4IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ICAgCj4gLUxVQUVYUEFUX1ZFUlNJT04gPSAxLjMuMy0xCj4gK0xVQUVYUEFUX1ZFUlNJT04g
PSAxLjQuMC0xCj4gK0xVQUVYUEFUX1NVQkRJUiA9IGx1YWV4cGF0Cj4gICBMVUFFWFBBVF9MSUNF
TlNFID0gTUlUCj4gICBMVUFFWFBBVF9MSUNFTlNFX0ZJTEVTID0gJChMVUFFWFBBVF9TVUJESVIp
L0xJQ0VOU0UKPiAgIExVQUVYUEFUX0RFUEVOREVOQ0lFUyA9IGV4cGF0Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
