Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A356C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 11:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DF0E60A4F;
	Sun,  6 Jul 2025 11:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCWlM32fFmeC; Sun,  6 Jul 2025 11:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34CDF608BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34CDF608BE;
	Sun,  6 Jul 2025 11:41:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C32775B
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 11:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E5B96089A
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 11:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3X8k1FNmnulc for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 11:41:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E62AA608A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E62AA608A7
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E62AA608A7
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 11:41:25 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4539cd7990cso12158555e9.0
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 04:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751802084; x=1752406884;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7GMCks/FxT+5wbXsmow89KmUjTCqkLCcDd/2cZ0I+OE=;
 b=kOpMFkkgbSVMgqXKUMDcNqDgWSeDNAMfTwagmGPGsMEBtyfvhm/MswasUHNYss598n
 VE267GMHvQ2hPo8LKczCuWkQLKxMF5LjbpLHO1jx6WAQN3rexEGpk4l2qzu/7bTGEohe
 e7AdnCr7D73C/foUS11R4mLhOWvBnmqVzwG2ohPGgfgFZYwUsxpUPOBIZs1sXWRhi0W1
 91tBKCN2Suxei1NndGZ5Udu4SUJAtbd9fCyigM2LxGq9f6KAs/BU1Uqx+Uu8xL4QnXVs
 a0Dz9alEDjE5g85/cciFeMYp242Qg2tqqvkSb3oDiwesr3vDVI/Sn8MG8KBeqjHudMym
 s/4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV4yVq7pIoA64Ienft7AWcI8DHctZvOGSU1M8u0PxMkNq+tSSqV22zbunlN3hcasWxCkSBuPt2YD4=@buildroot.org
X-Gm-Message-State: AOJu0YyY17nbzBGXi4p+qii2nGaMTzYlXa9EhIfMqWwAKpNaB6N5XY3u
 HWXggOXwjE870qh6zl4YyaPkAfKAOU909pSrjG4/2rx+fMEH+gZMPXoWuhhZb8QnvNA=
X-Gm-Gg: ASbGnctoryJen8wC5AmBgCfoABXzQxDkg2LcKq7DrzpqniaB/fQYKma77Il2ftHV9TT
 StmxVxrFvzq4ccjBFarT1tlXC8SbparRFNu3ktQ7czuFamIu59pc00e8NFXdFjIANVDTUqvtt/L
 0IDSp6EptsL0nwS0a4NZKnYc4q0EKpSzhr3az1mCf0izrVleLP7biU+CyQKibdICxgAbBr/WhI5
 +xFbs+LHCNkKtR8060CKaNKp2VHxvQG6vH/l4B+lhUbj3Ylvh+ohVi810yoUL9MvVUu/saKnEAm
 Ox4nIqqaxPNW/kHKE2SKwcuaiu/CW3QvuWR5n0rXxfjU5EyC8CDVCwIy+IaN1tIjxVQehj5fqS+
 P+KAa5CoCiHiDpi9Xz30sAX5uvZZ1fDq3ketFeY9PcDHOyAyiy0UIcTXb7y1KI1FlonV2QGV4No
 rWDjfjDa92RFzj0SvpnCoglfED
X-Google-Smtp-Source: AGHT+IEw85vMYHg0xPOwL0phGzlZoLj+UPv9In65h9VL2+WEu2Gmys5HpS36RzoSFVPW4Gr/zLTDSg==
X-Received: by 2002:a05:600c:c087:b0:43d:174:2668 with SMTP id
 5b1f17b1804b1-454b929f080mr38680895e9.0.1751802083733; 
 Sun, 06 Jul 2025 04:41:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b96534sm7207675f8f.48.2025.07.06.04.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 04:41:23 -0700 (PDT)
Message-ID: <9784ecae-1f26-427b-88d3-819ca40ff944@smile.fr>
Date: Sun, 6 Jul 2025 13:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Steve deRosier <derosier@cal-sierra.com>, Bernd Kuhls <bernd@kuhls.net>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20250618-virglrenderer-upstream-v1-0-57525ac8406e@gmail.com>
 <20250618-virglrenderer-upstream-v1-3-57525ac8406e@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <20250618-virglrenderer-upstream-v1-3-57525ac8406e@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751802084; x=1752406884; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7GMCks/FxT+5wbXsmow89KmUjTCqkLCcDd/2cZ0I+OE=;
 b=I/zG1XU9nyNeLO/QueyoR2L+jWvrTnU6bVMDbGEmOFNk9iY/L/Luguwzeoa9lwkODF
 BlWXEx6h3tPSga2Jq0KqlEndJFE/yYZlHF6VT3N/WmwME+QJC7dYcCUmOJWEbacbNPwH
 /t3oQraR6rWE581Nm46mUxVexBella5lyzEUU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=I/zG1XU9
Subject: Re: [Buildroot] [PATCH 3/3] package/qemu: add virglrenderer support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zZXBoLCBBbGwsCgpMZSAxOS8wNi8yMDI1IMOgIDAyOjU5LCBKb3NlcGggS29ndXQg
YSDDqWNyaXTCoDoKPiBBZGQgb3B0aW9uYWwgdmlyZ2xyZW5kZXJlciBzdXBwb3J0Lgo+IAo+IFRo
aXMgZmVhdHVyZSBpc24ndCB2ZXJ5IHVzZWZ1bCB3aXRoIG9wZW5nbCBkaXNhYmxlZCwgc28gZW5h
YmxlIHRoYXQKPiB0b28uCj4gCj4gaHR0cHM6Ly93d3cucWVtdS5vcmcvZG9jcy9tYXN0ZXIvc3lz
dGVtL2RldmljZXMvdmlydGlvLWdwdS5odG1sI3ZpcnRpby1ncHUtdmlyZ2xyZW5kZXJlcgoKSXMg
aG9zdC1xZW11IHBhY2thZ2UgY291bGQgdXNlIHZpcmdscmVuZGVyZXIgKGhvc3QtdmlyZ2xyZW5k
ZXJlcik/Cihwcm9iYWJseSBub3QgZHVlIHRvIGhvc3QtbWVzYSkKCj4gCj4gU2lnbmVkLW9mZi1i
eTogSm9zZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRAZ21haWwuY29tPgo+IC0tLQo+ICBwYWNrYWdl
L3FlbXUvQ29uZmlnLmluIHwgMTIgKysrKysrKysrKysrCj4gIHBhY2thZ2UvcWVtdS9xZW11Lm1r
ICAgfCAgOCArKysrKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L0NvbmZpZy5pbiBiL3Bh
Y2thZ2UvcWVtdS9Db25maWcuaW4KPiBpbmRleCAyZDE1YWIxZWE5Yzc4ODk5MzllM2ZhNGM1MzJm
MzQwM2MyNmVkYWVkLi4zMzRmMWRjZjVmNjhhMmIzYzVlNzJiNGU2N2U2OGY5NGFjNjY1ZTMzIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvcWVtdS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3FlbXUv
Q29uZmlnLmluCj4gQEAgLTEwMCw2ICsxMDAsMTggQEAgY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVf
U0RMCj4gIAkgIFNheSAneScgdG8gZW5hYmxlIHRoZSBTREwgZnJvbnRlbmQsIHRoYXQgaXMsIGEg
Z3JhcGhpY2FsCj4gIAkgIHdpbmRvdyBwcmVzZW50aW5nIHRoZSBWTSdzIGRpc3BsYXkuCj4gIAo+
ICtjb21tZW50ICJPcGVuR0wgYW5kIHZpcmdscmVuZGVyZXIgbmVlZCBhbiBPcGVuR0wgYW5kL29y
IE9wZW5HTCBFR0wgYmFja2VuZCIKPiArCWRlcGVuZHMgb24gIShCUjJfUEFDS0FHRV9IQVNfTElC
RUdMIHx8IEJSMl9QQUNLQUdFX0hBU0xJQkdMKQoKcy9CUjJfUEFDS0FHRV9IQVNMSUJHTC9CUjJf
UEFDS0FHRV9IQVNfTElCR0wvCgo+ICsKPiArY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfVklSR0xS
RU5ERVJFUgo+ICsJYm9vbCAiRW5hYmxlIHZpcmdscmVuZGVyZXIiCj4gKwlkZXBlbmRzIG9uIEJS
Ml9QQUNLQUdFX0hBU19MSUJFR0wgfHwgQlIyX1BBQ0tBR0VfSEFTX0xJQkdMICMgdmlyZ2xyZW5k
ZXJlcgo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1ZJUkdMUkVOREVSRVIKPiArCWhlbHAKPiArCSAg
U2F5ICd5JyB0byBlbmFibGUgdmlyZ2xyZW5kZXJlciwgZW5hYmxpbmcgR0wgYW5kCj4gKwkgIFZ1
bGthbiBwYXNzdGhyb3VnaCBmcm9tIHRoZSBob3N0IHRvIHRoZSBndWVzdAo+ICsJICB0aHJvdWdo
IHZpcnRpby1ncHUuCj4gKwo+ICBjb25maWcgQlIyX1BBQ0tBR0VfUUVNVV9GRFQKPiAgCWJvb2wg
IkVuYWJsZSBGRFQiCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfRFRDCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcWVtdS9xZW11Lm1rIGIvcGFja2FnZS9xZW11L3FlbXUubWsKPiBpbmRleCBmZGM4NTkx
ZTU0NmFiNmI5NmZkYjAyYjM3NDJiNzVmNTg3YmUyMzlmLi40MjIxZTAyN2MwNzkyNGY2ODEzNTkx
Nzk2OTI3NDM0MjBmZmFhMzhlIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4g
KysrIGIvcGFja2FnZS9xZW11L3FlbXUubWsKPiBAQCAtMjYxLDYgKzI2MSwxMyBAQCBlbHNlCj4g
IFFFTVVfT1BUUyArPSAtLWRpc2FibGUtdXNiLXJlZGlyCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgk
KEJSMl9QQUNLQUdFX1FFTVVfVklSR0xSRU5ERVJFUikseSkKPiArUUVNVV9PUFRTICs9IC0tZW5h
YmxlLXZpcmdscmVuZGVyZXIgLS1lbmFibGUtb3BlbmdsCgpJJ20gd29uZGVyaW5nIChJIHdvdWxk
IHByZWZlcikgaWYgd2UgbmVlZCBhIHNlcGFyYXRlIG9wdGlvbiB0byBlbmFibGUgb3BlbmdsCnN1
cHBvcnQgaW4gUWVtdS4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiArUUVNVV9ERVBFTkRFTkNJ
RVMgKz0gdmlyZ2xyZW5kZXJlciBsaWJlcG94eQo+ICtlbHNlCj4gK1FFTVVfT1BUUyArPSAtLWRp
c2FibGUtdmlyZ2xyZW5kZXJlciAtLWRpc2FibGUtb3BlbmdsCj4gK2VuZGlmCj4gKwo+ICBpZmVx
ICgkKEJSMl9TVEFUSUNfTElCUykseSkKPiAgUUVNVV9PUFRTICs9IC0tc3RhdGljCj4gIGVuZGlm
Cj4gQEAgLTMxMCw3ICszMTcsNiBAQCBkZWZpbmUgUUVNVV9DT05GSUdVUkVfQ01EUwo+ICAJCQkt
LWRpc2FibGUtbWVtYmFycmllciBcCj4gIAkJCS0tZGlzYWJsZS1tcGF0aCBcCj4gIAkJCS0tZGlz
YWJsZS1uZXRtYXAgXAo+IC0JCQktLWRpc2FibGUtb3BlbmdsIFwKPiAgCQkJLS1kaXNhYmxlLW9z
cyBcCj4gIAkJCS0tZGlzYWJsZS1wYSBcCj4gIAkJCS0tZGlzYWJsZS1wbHVnaW5zIFwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
