Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF10FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74AB961040;
	Thu, 24 Mar 2022 21:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26ZMgbCwKQmq; Thu, 24 Mar 2022 21:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 893CA61054;
	Thu, 24 Mar 2022 21:43:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D29A1BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79E2A41C34
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWYwVJztWYZb for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:43:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98EA54154C
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:43:45 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id yy13so11825155ejb.2
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tUcggLh71MJ7eQlaSKqG4cOpVtGARNoqUAgrKWFLZs8=;
 b=OPR/wCCxU1dHm5p5HVkA0Uo9NNMFhzy63281EwU16m2UerUeEmtdZjHkh3TIRZzgp3
 iKe2cea7G5uS87pWiUR/UntYF2PIKHSyjtEE8cGKqn9HHkyG7tzqTvevof5whIRDkaxt
 0YLjJBz4RZ0qcQ7xtloUduXrQWDBTwR8vR4pTHqCDDE11LxRb1j8Ak8eVl7NbqGZtPNt
 5NcQNXRU7TiKB/i6sqjZSHExAjo6B3YwRZo9i3jheOE51rRKGi6lK1+qQ+FtoK4s2KpK
 +SOCniU3MEp/c21K8SDfkngswoOLUBmQmokkiwlBJ7XZX3qu5ycz6Cv8n7DVVImib4Tu
 Mqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tUcggLh71MJ7eQlaSKqG4cOpVtGARNoqUAgrKWFLZs8=;
 b=YEx050hdwLJmLsu9Bxm6+8M7hv8gLQhqgYRCcYiaYLqqNOKHI2q/I4Y/pKYgYBdRCe
 isOLo3lpUhVkccZaWhS4qWLx/CFPjHuGZoq3mCMdxpspvCQsNeVWSQfUuvOT1mnz10uF
 yOfeFH8H1lL/4SuR+UhBoVkHWmrbYCvWv+SGXO5t0+gEZX08EPagSL+Jak5Qt+qe4fr8
 aWjIw2XnWqvrvgx6zx2nirDUmRGo7iIaOaHMkb5zRMvKjZBgmjsyVINAEUnaTX99RZfP
 0296teRFIB2MjwvmI5Myrk1KINVNrfOasm+NqgnasgqaeP/K8h4iQ+fqmjZTBPtdlW/T
 bOnQ==
X-Gm-Message-State: AOAM533qCdiiqEvDfxD0I/ewfh6JQqwdy1Vg6S/zDoWeyToZ+64BaKVj
 SnrgUM64xKKFNCI+pBS5XKKyTQ==
X-Google-Smtp-Source: ABdhPJwRsHBCeNZMQ5wJbVr60PPs3ps25Dwp1LhWAhoFeRRiaZFSUxrbtCjsNnMHX8LXvOSiznqNdA==
X-Received: by 2002:a17:906:3ec7:b0:6d6:e52b:b with SMTP id
 d7-20020a1709063ec700b006d6e52b000bmr8220820ejj.521.1648158223754; 
 Thu, 24 Mar 2022 14:43:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 yy18-20020a170906dc1200b006d6e5c75029sm1565372ejb.187.2022.03.24.14.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 14:43:43 -0700 (PDT)
Message-ID: <9c7a1a58-eb12-bbf7-74c0-c11a245c87e1@mind.be>
Date: Thu, 24 Mar 2022 22:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220316182440.17393-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220316182440.17393-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/qt5base: fix eglconvenience
 compile (missing QList include)
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
Cc: Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNi8wMy8yMDIyIDE5OjI0LCBQZXRlciBTZWlkZXJlciB3cm90ZToKPiAtIGFkZCAwMDA4
LWVnbGNvbnZlbmllbmNlLWFkZC1taXNzaW5nLVFMaXN0LWluY2x1ZGUucGF0Y2ggdG8gZml4Cj4g
ICAgZWdsY29udmVuaWVuY2UgY29tcGlsZSAobWlzc2luZyBRTGlzdCBpbmNsdWRlKQo+IAo+IEZp
eGVzOgo+IAo+ICAgIHFlZ2xjb252ZW5pZW5jZS5jcHA6NDE4OjIzOiBlcnJvcjogdmFyaWFibGUg
4oCYUUxpc3Q8UUJ5dGVBcnJheT4gZXh0ZW5zaW9uc+KAmSBoYXMgaW5pdGlhbGl6ZXIgYnV0IGlu
Y29tcGxldGUgdHlwZQo+ICAgICAgNDE4IHwgICAgIFFMaXN0PFFCeXRlQXJyYXk+IGV4dGVuc2lv
bnMgPQo+ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn4KPiAgICBx
ZWdsY29udmVuaWVuY2UuY3BwOjQyMDo2NTogZXJyb3I6IGludmFsaWQgdXNlIG9mIGluY29tcGxl
dGUgdHlwZSDigJhjbGFzcyBRTGlzdDxRQnl0ZUFycmF5PuKAmQo+ICAgICAgNDIwIHwgICAgICAg
ICAgICAgKGVnbFF1ZXJ5U3RyaW5nKGRpc3BsYXksIEVHTF9FWFRFTlNJT05TKSkpLnNwbGl0KCcg
Jyk7Cj4gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRl
cmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KPiAtLS0KPiAgIC4uLm9udmVuaWVuY2UtYWRkLW1pc3Np
bmctUUxpc3QtaW5jbHVkZS5wYXRjaCB8IDM3ICsrKysrKysrKysrKysrKysrKysKPiAgIDEgZmls
ZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9xdDUvcXQ1YmFzZS8wMDA4LWVnbGNvbnZlbmllbmNlLWFkZC1taXNzaW5nLVFMaXN0LWluY2x1
ZGUucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xdDUvcXQ1YmFzZS8wMDA4LWVnbGNv
bnZlbmllbmNlLWFkZC1taXNzaW5nLVFMaXN0LWluY2x1ZGUucGF0Y2ggYi9wYWNrYWdlL3F0NS9x
dDViYXNlLzAwMDgtZWdsY29udmVuaWVuY2UtYWRkLW1pc3NpbmctUUxpc3QtaW5jbHVkZS5wYXRj
aAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYzcxMjcyOTFlNAo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3F0NS9xdDViYXNlLzAwMDgtZWdsY29udmVu
aWVuY2UtYWRkLW1pc3NpbmctUUxpc3QtaW5jbHVkZS5wYXRjaAoKICBUaGVyZSB3YXMgYWxyZWFk
eSBhIHBhdGNoIDAwMDguIEhvd2V2ZXIsIEkgbWVyZ2VkIGFub3RoZXIgY29tbWl0IHRoYXQgcmVt
b3ZlZCAKcGF0Y2ggMDAwNiwgYW5kIHJlbnVtYmVyZWQgdGhlbSwgc28gbm8geW91ciBwYXRjaCBp
cyAwMDA4IDotKQoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFy
bm91dAoKCj4gQEAgLTAsMCArMSwzNyBAQAo+ICtGcm9tIGY2ODFmNDI4NDc3ODEyZTU0NDg0ZjYz
MWIwZGEzMzJjYzJlMDBlYWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IFBldGVy
IFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KPiArRGF0ZTogV2VkLCAxNiBNYXIgMjAyMiAx
OTowODo1NSArMDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIGVnbGNvbnZlbmllbmNlOiBhZGQgbWlz
c2luZyBRTGlzdCBpbmNsdWRlCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTog
dGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4
Yml0Cj4gKwo+ICtGaXhlczoKPiArCj4gKyAgcWVnbGNvbnZlbmllbmNlLmNwcDo0MTg6MjM6IGVy
cm9yOiB2YXJpYWJsZSDigJhRTGlzdDxRQnl0ZUFycmF5PiBleHRlbnNpb25z4oCZIGhhcyBpbml0
aWFsaXplciBidXQgaW5jb21wbGV0ZSB0eXBlCj4gKyAgICA0MTggfCAgICAgUUxpc3Q8UUJ5dGVB
cnJheT4gZXh0ZW5zaW9ucyA9Cj4gKyAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fgo+ICsgIHFlZ2xjb252ZW5pZW5jZS5jcHA6NDIwOjY1OiBlcnJvcjogaW52YWxpZCB1
c2Ugb2YgaW5jb21wbGV0ZSB0eXBlIOKAmGNsYXNzIFFMaXN0PFFCeXRlQXJyYXk+4oCZCj4gKyAg
ICA0MjAgfCAgICAgICAgICAgICAoZWdsUXVlcnlTdHJpbmcoZGlzcGxheSwgRUdMX0VYVEVOU0lP
TlMpKSkuc3BsaXQoJyAnKTsKPiArICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gKwo+ICtTaWduZWQtb2Zm
LWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Cj4gKy0tLQo+ICsgc3JjL3Bs
YXRmb3Jtc3VwcG9ydC9lZ2xjb252ZW5pZW5jZS9xZWdsY29udmVuaWVuY2UuY3BwIHwgMSArCj4g
KyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiArCj4gK2RpZmYgLS1naXQgYS9zcmMv
cGxhdGZvcm1zdXBwb3J0L2VnbGNvbnZlbmllbmNlL3FlZ2xjb252ZW5pZW5jZS5jcHAgYi9zcmMv
cGxhdGZvcm1zdXBwb3J0L2VnbGNvbnZlbmllbmNlL3FlZ2xjb252ZW5pZW5jZS5jcHAKPiAraW5k
ZXggNTMwM2QzN2MuLmRhY2VlYjhiIDEwMDY0NAo+ICstLS0gYS9zcmMvcGxhdGZvcm1zdXBwb3J0
L2VnbGNvbnZlbmllbmNlL3FlZ2xjb252ZW5pZW5jZS5jcHAKPiArKysrIGIvc3JjL3BsYXRmb3Jt
c3VwcG9ydC9lZ2xjb252ZW5pZW5jZS9xZWdsY29udmVuaWVuY2UuY3BwCj4gK0BAIC0zOCw2ICsz
OCw3IEBACj4gKyAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwo+ICsKPiArICNpbmNsdWRlIDxRQnl0ZUFy
cmF5Pgo+ICsrI2luY2x1ZGUgPFFMaXN0Pgo+ICsgI2luY2x1ZGUgPFFPcGVuR0xDb250ZXh0Pgo+
ICsKPiArICNpZmRlZiBRX09TX0xJTlVYCj4gKy0tCj4gKzIuMzUuMQo+ICsKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
