Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CF2C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87B8A4187D;
	Thu, 14 Apr 2022 19:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eh_Cz8QA-CSv; Thu, 14 Apr 2022 19:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E6DA41875;
	Thu, 14 Apr 2022 19:34:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83FF01BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70BA640993
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYUqhWnuIxgi for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:34:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 438B140142
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:34:24 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id p15so11921535ejc.7
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=to6Qoo1iH94h+dhR6FN1beW2k9Mix/OIWAQLkAGLWeg=;
 b=YVkmplMTQB0+QXcvmvdUuNHiWNUz+ohFxjmIpoV8gVwCWYZL3bdBrpw/Dc+aWAVS25
 uDeRw8aatxZjCEMDY/YRFJIkiJ/1HxBMGlvm/zTtkBKilOC5xZxTOXNpaiGTIz4MiJ+c
 PHX9myVH/WRwsJ3cNwgcw/LN//FBVfnU4+e+tUzPEGpk8bOGeS6a7J/y30YEW4veep8r
 jSO519Fme8lgky0Stan9FyBGPRutxKTooZZYer9QHQ8IizrdCnyMYfvd10gd9eneXfDf
 6sQl1BP4WyHUxkHPTfFNzfv6jS4XN5Q2faJxwh35QWCVZBDtA7wwvlj/Ulbobj5vOXkd
 5ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=to6Qoo1iH94h+dhR6FN1beW2k9Mix/OIWAQLkAGLWeg=;
 b=JDbU9mffxXTd3FGBV1YjI9WRuSnTP6nHVonBSitTmnuEeakJ9Gl1tRB5/pGfiDGmxo
 8JvGBIhgSLxRJleOt9HA/7PdcxU4kxlVopzKLnG8ifE+9jpXLC4TsYnAuBpEcWtExC9V
 5Ym9OEuRznvEI6yOhHCtIoTfqz/ckLOlXz9b/MEN6txP0vVoiK6a71c5GULVUsDJZneQ
 VpACzS3c2Kk1vBXDrb/avKlWlGgkOsXZ5bZ+u/8JPZpVCBzcPTwvEOkQg2FXrT3zqqfn
 hYOXIhSNxT11baUY/dxYjMWWnKZ1CrYEird4MmVDWA01ZJybL7wyh+q1UyItWM9P/jIM
 vm7g==
X-Gm-Message-State: AOAM531iE3dWEU6X6V226vlm5TatJmBqEMtKsQ7B4gfUXmo2u2ZEL1rA
 W+HAUj9cV4hzGo7Uga3WqHy2Qw==
X-Google-Smtp-Source: ABdhPJyWTlYB7ueYxwpypJEzJ+la5CuiXbyHKKDl99WcikwxPtd6UCNFOKUFF3PE6+3TRkAykZRZ+Q==
X-Received: by 2002:a17:906:9c09:b0:6e8:89e7:9807 with SMTP id
 ff9-20020a1709069c0900b006e889e79807mr3608097ejc.473.1649964863286; 
 Thu, 14 Apr 2022 12:34:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a17090654cd00b006e0db351d01sm944091ejp.124.2022.04.14.12.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:34:22 -0700 (PDT)
Message-ID: <1d553e59-8cca-fb85-0792-dbb2ff813880@mind.be>
Date: Thu, 14 Apr 2022 21:34:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20220406211034.3672-1-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220406211034.3672-1-dariobin@libero.it>
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: fix host-qemu compilation
 with recent GCC
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wNC8yMDIyIDIzOjEwLCBEYXJpbyBCaW5hY2NoaSB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IEZpeGVzOgo+IGNjMTogZXJyb3I6IOKAmC1mY2YtcHJvdGVjdGlvbuKAmSBpcyBub3QgY29t
cGF0aWJsZSB3aXRoIHRoaXMgdGFyZ2V0Cj4gCj4gVGhlIG5ldyBVYnVudHUgR0NDIHBhY2thZ2Vz
IChlLmcuIFVidW50dSAxMS4yLjAtN3VidW50dTIsIDExLjIuMCkgdHVybgo+IG9uIOKAmC1mY2Yt
cHJvdGVjdGlvbuKAmSBnbG9iYWxseSwgd2hpY2ggY2F1c2VzIGEgYnVpbGQgZmFpbHVyZSBpbiB0
aGUgeDg2Cj4gcmVhbG1vZGUgY29kZS4gVHVybiBpdCBvZmYgZXhwbGljaXRseSBvbiBjb21waWxl
cnMgdGhhdCB1bmRlcnN0YW5kIHRoaXMKPiBvcHRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFy
aW8gQmluYWNjaGkgPGRhcmlvYmluQGxpYmVyby5pdD4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBC
aW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CgogIFR3byBTb2Ig
aXMgYSBiaXQgZXhhZ2dlcmF0ZWQgOi0pCgo+IC0tLQo+ICAgLi4uYWJsZS1mY2YtcHJvdGVjdGlv
bi1vbi1tYXJjaC00ODYtbTE2LnBhdGNoIHwgNDkgKysrKysrKysrKysrKysrKysrKwo+ICAgMSBm
aWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3FlbXUvMDAwMi1idWlsZC1kaXNhYmxlLWZjZi1wcm90ZWN0aW9uLW9uLW1hcmNoLTQ4Ni1t
MTYucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11LzAwMDItYnVpbGQtZGlzYWJs
ZS1mY2YtcHJvdGVjdGlvbi1vbi1tYXJjaC00ODYtbTE2LnBhdGNoIGIvcGFja2FnZS9xZW11LzAw
MDItYnVpbGQtZGlzYWJsZS1mY2YtcHJvdGVjdGlvbi1vbi1tYXJjaC00ODYtbTE2LnBhdGNoCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi43YTg0MWZjYjYwCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcWVtdS8wMDAyLWJ1aWxkLWRpc2FibGUtZmNmLXBy
b3RlY3Rpb24tb24tbWFyY2gtNDg2LW0xNi5wYXRjaAo+IEBAIC0wLDAgKzEsNDkgQEAKPiArRnJv
bSA5NTg0ZDNkMDBhNDU0ZjQ3YjAzNDE0NjUxNDJiY2YwNzM1ZDczNGFlIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQo+ICtGcm9tOiBDaHJpc3RpYW4gRWhyaGFyZHQgPGNocmlzdGlhbi5laHJoYXJk
dEBjYW5vbmljYWwuY29tPgo+ICtEYXRlOiBXZWQsIDIzIE1hciAyMDIyIDEwOjA3OjEzICswMTAw
Cj4gK1N1YmplY3Q6IFtQQVRDSF0gYnVpbGQ6IGRpc2FibGUgZmNmLXByb3RlY3Rpb24gb24gLW1h
cmNoPTQ4NiAtbTE2Cj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4dC9w
bGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4g
Kwo+ICtTb21lIG9mIHRoZSByb21zIGJ1aWxkIHdpdGggLW1hcmNoPWk0ODYgLW0xNiB3aGljaCBp
cyBpbmNvbXBhdGlibGUKPiArd2l0aCAtZmNmLXByb3RlY3Rpb24uIFRoYXQgaW4gdHVybiBpcyBj
YW4gYmUgc2V0IGJ5IGRlZmF1bHQsIGZvcgo+ICtleGFtcGxlIGluIFVidW50dSBbMV0uCj4gK1Ro
YXQgY2F1c2VzOgo+ICsgY2MxOiBlcnJvcjog4oCYLWZjZi1wcm90ZWN0aW9u4oCZIGlzIG5vdCBj
b21wYXRpYmxlIHdpdGggdGhpcyB0YXJnZXQKPiArCj4gK1RoaXMgd29uJ3Qgd29yayBvbiAtbWFy
Y2g9aTQ4NiAtbTE2IGFuZCBubyBtYXR0ZXIgaWYgc2V0IG9yIG5vdCB3ZSBjYW4KPiArb3ZlcnJp
ZGUgaXQgdG8gIm5vbmUiIGlmIHRoZSBvcHRpb24gaXMga25vd24gdG8gdGhlIGNvbXBpbGVyIHRv
IGJlCj4gK2FibGUgdG8gYnVpbGQgcmVsaWFibHkuCj4gKwo+ICtGaXhlczogaHR0cHM6Ly9naXRs
YWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vaXNzdWVzLzg4OQo+ICsKPiArWzFdOiBodHRwczov
L3dpa2kudWJ1bnR1LmNvbS9Ub29sQ2hhaW4vQ29tcGlsZXJGbGFncyNBLWZjZi1wcm90ZWN0aW9u
Cj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gRWhyaGFyZHQgPGNocmlzdGlhbi5laHJo
YXJkdEBjYW5vbmljYWwuY29tPgo+ICtSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPGY0YnVnQGFtc2F0Lm9yZz4KPiArUmV2aWV3ZWQtYnk6IFRob21hcyBIdXRoIDx0aHV0aEBy
ZWRoYXQuY29tPgo+ICtNZXNzYWdlLUlkOiA8MjAyMjAzMjMwOTA3MTMuMTAwMjU4OC0xLWNocmlz
dGlhbi5laHJoYXJkdEBjYW5vbmljYWwuY29tPgo+ICtTaWduZWQtb2ZmLWJ5OiBQYW9sbyBCb256
aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgoKICBBbmQgaGVyZSB5b3VyIFNvYiB3YXMgbWlzc2lu
ZyEgSSB0b29rIHRoZSBsaWJlcnR5IG9mIGFkZGluZyBpdC4KCiAgQXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gKy0tLQo+ICsgcGMtYmlvcy9vcHRpb25y
b20vTWFrZWZpbGUgfCA0ICsrKysKPiArIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykK
PiArCj4gK2RpZmYgLS1naXQgYS9wYy1iaW9zL29wdGlvbnJvbS9NYWtlZmlsZSBiL3BjLWJpb3Mv
b3B0aW9ucm9tL01ha2VmaWxlCj4gK2luZGV4IDVkNTVkMjVhY2NhMi4uZjFlZjg5ODA3MzU1IDEw
MDY0NAo+ICstLS0gYS9wYy1iaW9zL29wdGlvbnJvbS9NYWtlZmlsZQo+ICsrKysgYi9wYy1iaW9z
L29wdGlvbnJvbS9NYWtlZmlsZQo+ICtAQCAtMTQsNiArMTQsMTAgQEAgY2Mtb3B0aW9uID0gJChp
ZiAkKHNoZWxsICQoQ0MpICQxIC1jIC1vIC9kZXYvbnVsbCAteGMgL2Rldi9udWxsID4vZGV2L251
bGwgMj4mMQo+ICsKPiArIG92ZXJyaWRlIENGTEFHUyArPSAtbWFyY2g9aTQ4NiAtV2FsbAo+ICsK
PiArKyMgSWYgLWZjZi1wcm90ZWN0aW9uIGlzIGVuYWJsZWQgaW4gZmxhZ3Mgb3IgY29tcGlsZXIg
ZGVmYXVsdHMgdGhhdCB3aWxsCj4gKysjIGNvbmZsaWN0IHdpdGggLW1hcmNoPWk0ODYKPiArK292
ZXJyaWRlIENGTEFHUyArPSAkKGNhbGwgY2Mtb3B0aW9uLCAtZmNmLXByb3RlY3Rpb249bm9uZSkK
PiArKwo+ICsgIyBGbGFncyBmb3IgZGVwZW5kZW5jeSBnZW5lcmF0aW9uCj4gKyBvdmVycmlkZSBD
UFBGTEFHUyArPSAtTU1EIC1NUCAtTVQgJEAgLU1GICQoQEQpLyQoKkYpLmQKPiArCj4gKy0tCj4g
KzIuMzIuMAo+ICsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
