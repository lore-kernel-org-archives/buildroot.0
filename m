Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9957C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 17:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E33941498;
	Mon, 11 Apr 2022 17:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YzXR2u8UF3Eh; Mon, 11 Apr 2022 17:03:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2B3F410CA;
	Mon, 11 Apr 2022 17:03:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 649491BF2E4
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 17:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 541B881BCF
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 17:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tzru5sZ82FVO for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 17:03:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6171A81A46
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 17:03:40 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z99so10649062ede.5
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=e0OEGLqHXrg53Fr3JPFW35dmXdrdvq0zHxgoIKZRSdI=;
 b=iPkaH78Wuh/6SdnFx0YWAyUxIR1Fs+SdDtL/47dFO4wKzKsGQl3tM+Ro1eeXceSwrm
 NbU/CWy5Na9Y5zM1b7pnVgJwBHYQEKh7UirW5JQOtPhDk51FDINwED+kXWsVF3cypA0L
 w3Ag9Qd7E8Y2uPuitUXrz4xI244V0g403QOrEK5IgRzuhlIVB6waKz9dWo7Kqh3gzXYS
 s4BoivpQKN8EKoLBTBZwJmXg+f9x5oedgziw0wjSm8a1XV9y2DqlI6XkUrixLB67opQn
 8OQ0BQCD2MOAI9nfr/93++fKMICgMeUczIENnbLcacRNAE5lQ1TOHC+OkI5y7sZIwght
 IFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=e0OEGLqHXrg53Fr3JPFW35dmXdrdvq0zHxgoIKZRSdI=;
 b=64fjl5ODpIrbVHYeFX2QpBkOKCGSWhHmp3P4bNqaqdLRgp+4BeJvNT/zLQ28VG8Fjq
 d7gjv8kIkD/H4QQYuHWsLYhcDiYb1pfuqjjdm2+nQ8B755jvs3RbQ4nk30P6h3v5qf0n
 y9EAGqfk+x09QXvTHOG9QfNeqAh/GH78Z6XRC8g+bZi9F4MU47NzH24XmTMj30sDCPrV
 gRrGYR3aN6X78+e1h8Nx6y5ZhXfeFtIXc9DG/9gS0wbJOIFbhE28uYrwhvy5AQY87oFV
 JXpqAeNvAyLVM8qUUw8Lnijt9CL5SuWGvbQO98Rttdq6RqCsBwbAf1aDgZ+uBVLwKMf8
 a9pw==
X-Gm-Message-State: AOAM531qoZQDDEY0Qm1U2iIT2LPiBn/pnpHqTsmMtRSlitAKNg1NiA0X
 Sq4VTfFmSO31dCWX8Oy5d6+Nqb/5XfZUBw==
X-Google-Smtp-Source: ABdhPJztHGNZAsPs3/i/FdsWjPezQfIRKmmX7YtfgGptwOwsmXj2wwMrGPWaM5EFpixzEmnHgax+5Q==
X-Received: by 2002:a50:ed0b:0:b0:41c:cf60:a882 with SMTP id
 j11-20020a50ed0b000000b0041ccf60a882mr34917312eds.12.1649696618604; 
 Mon, 11 Apr 2022 10:03:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm15459880edu.51.2022.04.11.10.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 10:03:38 -0700 (PDT)
Message-ID: <07cb544d-bc42-d774-08aa-67cecc96c1b0@mind.be>
Date: Mon, 11 Apr 2022 19:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org,
 Peter Korsgaard <peter@korsgaard.com>
References: <20220405185320.319C18361B@busybox.osuosl.org>
 <9ca9a86e-917a-ea5a-04bf-b9cd0e15aff5@othermo.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <9ca9a86e-917a-ea5a-04bf-b9cd0e15aff5@othermo.de>
Subject: Re: [Buildroot] [git commit] package/containerd: security bump to
 version 1.5.11
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

CgpPbiAxMS8wNC8yMDIyIDE0OjI4LCBNYXJjdXMgSG9mZm1hbm4gd3JvdGU6Cj4gSGkgUGV0ZXIs
Cj4gCj4gT24gMDUuMDQuMjIgMTk6MjgsIFBldGVyIEtvcnNnYWFyZCB3cm90ZToKPj4gY29tbWl0
OiAKPj4gaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD0yNjQy
ZWRiMGFmMDhmMDRmYjk4ZjRjYjVmODg4OTVmYWRlZDRiMzI1IAo+Pgo+PiBicmFuY2g6IGh0dHBz
Oi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9cmVmcy9oZWFkcy9tYXN0
ZXIKPj4KPj4gRml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZXM6Cj4+Cj4+IC0gQ1ZF
LTIwMjItMjM2NDg6IGNvbnRhaW5lcmQgQ1JJIHBsdWdpbjogSW5zZWN1cmUgaGFuZGxpbmcgb2Yg
aW1hZ2Ugdm9sdW1lcwo+PiAgICAKPj4gaHR0cHM6Ly9naXRodWIuY29tL2NvbnRhaW5lcmQvY29u
dGFpbmVyZC9zZWN1cml0eS9hZHZpc29yaWVzL0dIU0EtY3JwMi1xcnI1LThwcTcKPj4KPj4gLSBD
VkUtMjAyMi0yNDc2OTogRGVmYXVsdCBpbmhlcml0YWJsZSBjYXBhYmlsaXRpZXMgZm9yIGxpbnV4
IGNvbnRhaW5lcgo+PiDCoMKgIHNob3VsZCBiZSBlbXB0eQo+PiAgICAKPj4gaHR0cHM6Ly9naXRo
dWIuY29tL2NvbnRhaW5lcmQvY29udGFpbmVyZC9zZWN1cml0eS9hZHZpc29yaWVzL0dIU0EtYzlj
cC05Yzc1LTl2OGMKPj4KPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBr
b3JzZ2FhcmQuY29tPgo+PiAtLS0KPj4gwqAgcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQu
aGFzaCB8IDIgKy0KPj4gwqAgcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQubWvCoMKgIHwg
MiArLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLmhhc2gg
Cj4+IGIvcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaAo+PiBpbmRleCBkNWFhZmUy
ZTcwLi4yM2RhY2RlZDg4IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFp
bmVyZC5oYXNoCj4+ICsrKyBiL3BhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLmhhc2gKPj4g
QEAgLTEsMyArMSwzIEBACj4+IMKgICMgQ29tcHV0ZWQgbG9jYWxseQo+PiAtc2hhMjU2wqAgNDBj
OTc2N2FmM2U4N2YyYzM2YWRmMmY1NjNmMGE4Mzc0ZTgwYjMwYmQyYjdhYTgwMDU4Yzg1OTEyNDA2
Y2VmNCAgCj4+IGNvbnRhaW5lcmQtMS41LjkudGFyLmd6Cj4+ICtzaGEyNTbCoCA2YTI4OTQwNmMx
YzA1ODM3NjNlNWE5NzU0ZTMxYTFlY2VkNTVjZDVmMTYyYTdiYzJhM2EzMTVkNWViMDVjN2ExICAK
Pj4gY29udGFpbmVyZC0xLjUuMTEudGFyLmd6Cj4gCj4gSSBnZXQgYSBkaWZmZXJlbnQgaGFzaCBm
b3IgdGhpcyBkb3dubG9hZCwgYm90aCB3aXRoaW4gYnVpbGRyb290IGFzIHdlbGwgYXMgCj4gZG93
bmxvYWRpbmcgdGhlIGZpbGUgbWFudWFsbHkgZnJvbSBnaXRodWI6Cj4gCj4gRVJST1I6IGNvbnRh
aW5lcmQtMS41LjExLnRhci5neiBoYXMgd3Jvbmcgc2hhMjU2IGhhc2g6Cj4gRVJST1I6IGV4cGVj
dGVkOiA2YTI4OTQwNmMxYzA1ODM3NjNlNWE5NzU0ZTMxYTFlY2VkNTVjZDVmMTYyYTdiYzJhM2Ez
MTVkNWViMDVjN2ExCj4gRVJST1I6IGdvdMKgwqDCoMKgIDogMDJiNzlkNWUyYjA3YjVlNjRjZDI4
ZjFmZTg0Mzk1ZWUxMWVlZjk1ZmM0OWZkOTIzYTlhYjkzMDIyYjE0OGJlNgo+IEVSUk9SOiBJbmNv
bXBsZXRlIGRvd25sb2FkLCBvciBtYW4taW4tdGhlLW1pZGRsZSAoTUlUTSkgYXR0YWNrCj4gCj4g
Cj4gRGlkIHRoZSBmaWxlIGNoYW5nZSBpbiB0aGUgbWVhbnRpbWUgb3IgZGlkIHNvbWV0aGluZyBl
bHNlIGdvIHdyb25nIGhlcmU/CgogIEl0IGFsc28gZ29lcyB3cm9uZyBpbiB0aGUgYXV0b2J1aWxk
ZXJzICh0aGlzIG9uZSBvbiBtYXN0ZXIsIGJlZm9yZSBJIG1lcmdlZCAKdGhlIGJ1bXAgdG8gMS42
LjIpIFsxXQoKPiBTaG91bGQgc2VuZCBhIHBhdGNoIGNoYW5naW5nIHRoZSBoYXNoIHRvIAo+IDAy
Yjc5ZDVlMmIwN2I1ZTY0Y2QyOGYxZmU4NDM5NWVlMTFlZWY5NWZjNDlmZDkyM2E5YWI5MzAyMmIx
NDhiZTY/CgogIExldCdzIGZpcnN0IGFsbG93IFBldGVyIHRvIGNoZWNrIHdoYXQgZXhhY3RseSB3
ZW50IHdyb25nLiBIZSBzaG91bGQgaGF2ZSBhIApsb2NhbCBkb3dubG9hZCB3aXRoIHRoZSBoYXNo
IGhlIHB1c2hlZCBzbyBoZSBjYW4gY29tcGFyZSB3aGF0IGNoYW5nZWQuCgogIEkgbG9va2VkIGF0
IHRoZSBnaXRodWIgcmVwbywgYW5kIGl0IHNheXMgdGhhdCBpdCB3YXMgdGFnZ2VkIG9uIE1hcmNo
IDI0LCBpLmUuIApiZWZvcmUgUGV0ZXIgZGlkIHRoZSBidW1wIHRvIDEuNS4xMS4gU28gaXQgZG9l
c24ndCBsb29rIGxpa2UgdGhleSB1cGRhdGVkIHRoZSB0YWcuCgogIFJlZ2FyZHMsCiAgQXJub3V0
CgoKMV0gCmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2I1ZC9iNWRjZDU2
NDkwZTgwN2RiOWU5MmUzYmJiZDY3NTM3MzgxMzJkYjU3L2J1aWxkLWVuZC5sb2cKCj4gCj4gID4g
Wy4uLl0KPiAKPiBCZXN0LAo+IE1hcmN1cwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
