Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE1BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FBEA409F8;
	Thu, 14 Apr 2022 19:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQg8rkamFiaf; Thu, 14 Apr 2022 19:37:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99C4A40993;
	Thu, 14 Apr 2022 19:37:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C47321BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C16D383EED
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fy9yG6CwwkMq for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:37:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB07583ED7
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:37:14 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ks6so11983909ejb.1
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=j4b7J3vfbOZy7gheHkH+g6en+LEMzP4/bpQZ6vGcYM4=;
 b=fdfJYhYlP1vdrku+22/0VaHu9X5FJ3x1/DzvOl43LT60LFAdtl9Wwl3U2JeXU0OKRr
 08zEnUh9Dp3EEaBtOfmyLUbmXfrvFFjwUBd7nMfSZ/FdN4IynY7hIXqRXHWMkbZt60Oi
 PEXc8ek/dMCXfQ/O30SJ0vZLPVsx6MptgGxnmhpKddL/A9PKDVkz+x92ZX27ZjRgKGkN
 0tSD5iKzxioJWpUkYfeqBc+f09qnh3+RB7ydQLrrIPKUw7Abdo8WNuY4W1UirpjhiCbT
 4p8tr2I44GiU/bPK9FANuuZAS2pkrQpp5HNvhdjZo8i7a8QPmd30rg0hEz1NdWwDz3Y9
 9TYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=j4b7J3vfbOZy7gheHkH+g6en+LEMzP4/bpQZ6vGcYM4=;
 b=xc+4MJ7BDWkwMJukC5VI8UJvHPZ/BvscRZWBMdauldBcJZePeTw9gm9f5kRoxHjUhC
 3jiDPZIm78Y67Mj6DwOPOsGctxHl0gTCceeIet3J3gUq8zwZ6J0p6dEV5fiSPPzsAtd+
 iFioBSxnTR6yaZvdC9guGcnEgqv39a0mLCbYD8MWZ8M1YKiST2mbAw1A7Pkp04ZbDWj9
 3R1yaRlmp128HafK2bdLECA5lcZxmzgMuiAp6DaLU99tm4gDHd9LIRGdKOrh6cIk+qQS
 ltTfb2WEnTjlhHMzYEscD5DIxUi1LAT4Rq7s/OIefhE6VzCb7mzgEK8cUepGg6cu/59p
 ge/Q==
X-Gm-Message-State: AOAM530Y1Xe8M4sIjja5K3mYfMLH+cIxrve1zuZT4CR6q5Lqja55zqTM
 aSdquaVequ7gzrkPElvED3MLgQh+wcC/6Q==
X-Google-Smtp-Source: ABdhPJxR/PCgySswzhqL3GUScZyd+tWpLhPOzBECLbRQu8iwxYBZ8LCND5gtkvIKDrYW0Lvg7Yy37A==
X-Received: by 2002:a17:906:5d08:b0:6da:b4ea:937 with SMTP id
 g8-20020a1709065d0800b006dab4ea0937mr3661337ejt.446.1649965032939; 
 Thu, 14 Apr 2022 12:37:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a170906284500b006cc551d6cabsm949257ejc.63.2022.04.14.12.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:37:12 -0700 (PDT)
Message-ID: <77af456f-b938-c409-d792-bd70447001af@mind.be>
Date: Thu, 14 Apr 2022 21:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
References: <20220407005107.202695-1-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220407005107.202695-1-joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH] package/zlib-ng: Conditionally enable
 Power8 option
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

CgpPbiAwNy8wNC8yMDIyIDAyOjUxLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4gemxpYi1uZydzIGJ1
aWxkIHN5c3RlbSBkb2VzIG5vdCBjb3JyZWN0bHkgZGV0ZWN0IGlmIGl0IHN1cHBvcnRzIHRoZQo+
IFBvd2VyOCBmZWF0dXJlLiBGb3JjZSBpdCBvZmYgdG8gZml4IGJ1aWxkaW5nIGZvciBjb25maWd1
cmF0aW9ucyB0aGF0Cj4gZG9uJ3Qgc3VwcG9ydCB0aGUgdmVjdG9yIGJ1aWx0aW4gZnVuY3Rpb25z
Lgo+IAo+IEZvciBleGFtcGxlLCBidWlsZGluZyBmb3IgQlIyX3Bvd2VycGNfNjAxOgo+IAo+ICAg
IHdhcm5pbmc6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHZlY194bOKAmTsg
ZGlkIHlvdSBtZWFuCj4gICDigJh2ZWNfcmzigJk/IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xh
cmF0aW9uXQo+ICAgICA5MyB8ICAgICAgICAgICAgIHZidWYgPSB2ZWNfeGwoMCwgKHVuc2lnbmVk
IGNoYXIgKikgYnVmKTsKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1z
LmlkLmF1PgoKICBJJ3ZlIGFkZGVkIGEgcmVmZXJlbmNlIHRvIHRoZSBjb21taXQgd2hlcmUgdGhp
cyBsb2dpYyB3YXMgcmVtb3ZlZCBhbmQgYXBwbGllZCAKdG8gbWFzdGVyLCB0aGFua3MuCgogIFJl
Z2FyZHMsCiAgQXJub3V0Cgo+IAo+IC0tLQo+ICAgWyAgMyVdIEJ1aWxkaW5nIEMgb2JqZWN0IENN
YWtlRmlsZXMvemxpYi5kaXIvYXJjaC9wb3dlci9hZGxlcjMyX3Bvd2VyOC5jLm8KPiAgIGJ1aWxk
X3BwYzYwMV9nbGliYy9ob3N0L2Jpbi9wb3dlcnBjLWJ1aWxkcm9vdC1saW51eC1nbnUtZ2NjCj4g
ICAtLXN5c3Jvb3Q9L2hvbWUvam9lbC9kZXYvYnVpbGRyb290L2J1aWxkX3BwYzYwMV9nbGliYy9o
b3N0L3Bvd2VycGMtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290Cj4gICAtREhBVkVfQlVJTFRJ
Tl9DVFogLURIQVZFX0JVSUxUSU5fQ1RaTEwgLURIQVZFX1BPU0lYX01FTUFMSUdOCj4gICAtREhB
VkVfVklTSUJJTElUWV9ISURERU4gLURIQVZFX1ZJU0lCSUxJVFlfSU5URVJOQUwgLURQT1dFUjgK
PiAgIC1EUE9XRVI4X1ZTWF9BRExFUjMyIC1EUE9XRVI4X1ZTWF9TTElERUhBU0ggLURQT1dFUl9G
RUFUVVJFUwo+ICAgLURXSVRIX0daRklMRU9QIC1EWkxJQl9DT01QQVQgLURaTElCX0RMTCAtRF9M
QVJHRUZJTEU2NF9TT1VSQ0U9MQo+ICAgLURfX1VTRV9MQVJHRUZJTEU2NAo+ICAgLUkvaG9tZS9q
b2VsL2Rldi9idWlsZHJvb3QvYnVpbGRfcHBjNjAxX2dsaWJjL2J1aWxkL3psaWItbmctMi4wLjYK
PiAgIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZG
U0VUX0JJVFM9NjQgLU9zCj4gICAtZzAgLURfRk9SVElGWV9TT1VSQ0U9MSAtV2FsbCAtV25vLWlt
cGxpY2l0LWZhbGx0aHJvdWdoICAtRE5ERUJVRyAtZlBJQwo+ICAgLWZuby1zZW1hbnRpYy1pbnRl
cnBvc2l0aW9uIC1zdGQ9Yzk5IC1tY3B1PXBvd2VyOCAtZm5vLWx0byAtbwo+ICAgQ01ha2VGaWxl
cy96bGliLmRpci9hcmNoL3Bvd2VyL2FkbGVyMzJfcG93ZXI4LmMubyAtYwo+ICAgYnVpbGRfcHBj
NjAxX2dsaWJjL2J1aWxkL3psaWItbmctMi4wLjYvYXJjaC9wb3dlci9hZGxlcjMyX3Bvd2VyOC5j
Cj4gICBidWlsZF9wcGM2MDFfZ2xpYmMvYnVpbGQvemxpYi1uZy0yLjAuNi9hcmNoL3Bvd2VyL2Fk
bGVyMzJfcG93ZXI4LmM6IEluIGZ1bmN0aW9uIOKAmGFkbGVyMzJfcG93ZXI44oCZOgo+ICAgYnVp
bGRfcHBjNjAxX2dsaWJjL2J1aWxkL3psaWItbmctMi4wLjYvYXJjaC9wb3dlci9hZGxlcjMyX3Bv
d2VyOC5jOjkzOjIwOgo+ICAgd2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rp
b24g4oCYdmVjX3hs4oCZOyBkaWQgeW91IG1lYW4KPiAgIOKAmHZlY19ybOKAmT8gWy1XaW1wbGlj
aXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICAgIDkzIHwgICAgICAgICAgICAgdmJ1ZiA9IHZl
Y194bCgwLCAodW5zaWduZWQgY2hhciAqKSBidWYpOwo+ICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICBefn5+fn4KPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgdmVjX3JsCj4gCj4gU2ln
bmVkLW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPiAtLS0KPiAgIHBhY2th
Z2UvemxpYi1uZy96bGliLW5nLm1rIHwgNyArKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvemxpYi1uZy96bGliLW5nLm1r
IGIvcGFja2FnZS96bGliLW5nL3psaWItbmcubWsKPiBpbmRleCBmYjQ5N2I4YzExZDAuLmRkMTcy
M2FjODY3MiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3psaWItbmcvemxpYi1uZy5tawo+ICsrKyBi
L3BhY2thZ2UvemxpYi1uZy96bGliLW5nLm1rCj4gQEAgLTIzLDQgKzIzLDExIEBAIGlmZXEgKCQo
QlIyX2FybSkseSkKPiAgIFpMSUJfTkdfQ09ORl9PUFRTICs9IC1EV0lUSF9BQ0xFPTEgLURXSVRI
X05FT049MQo+ICAgZW5kaWYKPiAgIAo+ICtpZmVxICgkKEJSMl9wb3dlcnBjX3Bvd2VyOCkseSkK
PiArWkxJQl9OR19DT05GX09QVFMgKz0gLURXSVRIX1BPV0VSOD1PTgo+ICtlbHNlCj4gK1pMSUJf
TkdfQ09ORl9PUFRTICs9IC1EV0lUSF9QT1dFUjg9T0ZGCj4gK2VuZGlmCj4gKwo+ICsKPiAgICQo
ZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
