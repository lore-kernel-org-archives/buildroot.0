Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C244CD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 17:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E22F814D5;
	Wed, 13 May 2026 17:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXkO3vnsGkmI; Wed, 13 May 2026 17:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C197F8146D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778692665;
	bh=cj0Vb/0mySAvEjxU5UYcOskksc+pKFSNLsxDXDTDbzw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kI2WqpdedKUZJgYEmCz0bhJwLbhyT6LabYBpuiBDQMxQYZI0/2blm9qehMJVT2WX9
	 ia9bVTMWfRfvcWqOeNSwRdUzRouvTEH4R7Y9nDetpe47NBUmzwYC6yeEKPSS1p+x74
	 7YPSKwj5blcvd00OZwhGdL454UKKMz7xktlaVcS4I9Rr0BN1kJ7/TS5TgKFryuIVbE
	 Q+U7j4nk1F0K2mnkgl7SN4rFdjwfDtxffQGx4GYnCjK0Fnh1GOTiwtlMhFMiqoemc2
	 XEn1taX8Ka3GoyRmmYpd4EsUfjQincV1VD+rPgFfFjitADqv+rWXjqbrnhsSQtWItG
	 IBZCFRpaCjZ8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C197F8146D;
	Wed, 13 May 2026 17:17:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 98FF636F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 17:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 969AC41A3B
 for <buildroot@buildroot.org>; Wed, 13 May 2026 17:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WY1TA02fSBfW for <buildroot@buildroot.org>;
 Wed, 13 May 2026 17:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FF4741A36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FF4741A36
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FF4741A36
 for <buildroot@buildroot.org>; Wed, 13 May 2026 17:17:43 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4893940bb5eso44577855e9.3
 for <buildroot@buildroot.org>; Wed, 13 May 2026 10:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778692661; x=1779297461;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5b5qzTsPD3gpbZfnk9DoLhUD1XfHYIMd/SWhlRP91Us=;
 b=s2jFDdgpc+9c/f8sDjEpOQHGC8Zfo1X5zoD+bmI9endQ/GlHaFX5n3isNh1I6h2nhV
 xgtD9uIG6Hcg2R6MQrf3DMN28lWBty0a14yMdrzTI9jDUoSe36rUlufpN+Lh3e5/Rl3i
 jM1wyGWYerHKFWnnMdcifsOrd+3viZrB1OlUn2JCuOVzBuIn5cg2ktu42VoRBihqCi4d
 WOKmj7VkX3DxoqTFsrSXZZ6UNnASnPJ4hLwD1ZT54lCIsJ0LYywudQWNIP1xCp73D+Q3
 aqqJdMdaYmaTcVfyAXzgWnrMtv0bCLgYgkquZc+uLyABDqDL/pb4KIIF1oBCKKZSm7JU
 k42g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+QkS3n9aoky0EW+dicz0BhBMD/y9Qt6DI7F2t8p6V3P4op6XOQnwKGJ7nSJigJVhgC2E4hsSh3Bho=@buildroot.org
X-Gm-Message-State: AOJu0YxI/qDyZGflifrrY9ifvTG5E60rHg1lK1+ltmYGAbgqj320eJYx
 RX+FA9iby+snZos2VM+0zgOiPVRKzCfLUFlbOhnLwcQ8xDg0y7QNZPcQd3oUTrk/CQQ=
X-Gm-Gg: Acq92OGtwcTB16lPuyMU0AnBUZT1zJOytU+LbsMmI3O4vHPFoFqVFguDJSee/a/0UQP
 YpxT2U6c4VVtxBsaeHa94hGbyO8Prm0Rjo6zL3MG1clpyxKXL/yD6cZ/tzQO/u9BebCtJj4v21/
 i2zmUExCwi55VBCqoTNsPOcCDZhZk9DhxdgcfPXEu6zFQe1GjB7OVbhjjKyP376uXMLUSgFV16j
 Lg92pGId59H1IJ9Kg+FjLvaFdbKjWS0TcI17pzrs4YnC5aZu+/HAJ/PyAaoemc3YIU+b4L+Hbeq
 ZINpY2y9M4MawDGF1+ox284nx5thTjqsW2XYQOF4y1mJdm3QuL8P1Cqi2dZLnWcqJDb4NFSfz7j
 Z9fPAek3ZD7bH57yFrs7WLfRsykHvj+CNZa0H2+bBbcHXeZctehYBVQsykQaKL2ja/lQ1Fe/bTN
 QMlG2Y93+YD/LN8LC5G1RrzcodJVNkMaPz9D4cqfIrspaC63PgmMAHxXVnaOCRWms5ADXVtgV/S
 MleluxbU253MC8Ll/YYaqJiyqGzQhhG4k20kHDsZtmbtO7He9+zbX7lzRUSRKVAdQ==
X-Received: by 2002:a05:600c:8b2b:b0:489:1d74:56d with SMTP id
 5b1f17b1804b1-48fc9a4db09mr69916285e9.29.1778692661394; 
 Wed, 13 May 2026 10:17:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fd62edfc4sm1820385e9.23.2026.05.13.10.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 10:17:41 -0700 (PDT)
Message-ID: <5bd5971c-17c5-4ebb-85d3-3944efb39a7c@smile.fr>
Date: Wed, 13 May 2026 19:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
 <20260512-virglrenderer-v5-5-1806e588eb59@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <20260512-virglrenderer-v5-5-1806e588eb59@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778692661; x=1779297461; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5b5qzTsPD3gpbZfnk9DoLhUD1XfHYIMd/SWhlRP91Us=;
 b=ZrpYA0nlqmmt+jpRYQaDrQyr4z1x8XmO0ANd6qzJ2iTIUUjROg6K28TLo/PCckfMLO
 YLEBKLaQ2YWp4I2wcz/tum5B5bxa9jQLBjazJIGPAZpEqDR+2ZoH6o+i6Jzn/4hY7kHl
 1jqGna9e6YvJbGUPh7LBMYvCkLmTQmdzww2DU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ZrpYA0nl
Subject: Re: [Buildroot] [PATCH RESEND v5 5/5] package/qemu: add
 virglrenderer support
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

SGVsbG8gSm9zZXBoLCBBbGwsCgpMZSAxMi8wNS8yMDI2IMOgIDIxOjM2LCBKb3NlcGggS29ndXQg
YSDDqWNyaXTCoDoKPiBBZGQgb3B0aW9uYWwgdmlyZ2xyZW5kZXJlciBzdXBwb3J0LCBhbG9uZyB3
aXRoIGVuYWJsaW5nIE9wZW5HTCB3aGVuCj4gbmVjZXNzYXJ5Lgo+IAo+IGh0dHBzOi8vcWVtdS5y
ZWFkdGhlZG9jcy5pby9lbi92MTAuMC4zL3N5c3RlbS9kZXZpY2VzL3ZpcnRpby1ncHUuaHRtbCN2
aXJ0aW8tZ3B1LXZpcmdscmVuZGVyZXIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3NlcGggS29ndXQg
PGpvc2VwaC5rb2d1dEBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvcWVtdS9Db25maWcuaW4g
fCAxNyArKysrKysrKysrKysrKysrKwo+ICBwYWNrYWdlL3FlbXUvcWVtdS5tayAgIHwgIDcgKysr
KysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9xZW11L0NvbmZpZy5pbiBiL3BhY2thZ2UvcWVtdS9Db25maWcuaW4KPiBpbmRl
eCBlNGU4ZWIzYjYzLi41OTliY2IxMWJiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcWVtdS9Db25m
aWcuaW4KPiArKysgYi9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCj4gQEAgLTEzMCw2ICsxMzAsMjMg
QEAgY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfT1BFTkdMCj4gIGNvbW1lbnQgIk9wZW5HTCBzdXBw
b3J0IG5lZWRzIGFuIE9wZW5HTCBhbmQvb3IgT3BlbkdMIEVHTCBiYWNrZW5kIgo+ICAJZGVwZW5k
cyBvbiAhKEJSMl9QQUNLQUdFX0hBU19MSUJFR0wgfHwgQlIyX1BBQ0tBR0VfSEFTX0xJQkdMKQo+
ICAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfVklSR0xSRU5ERVJFUgo+ICsJYm9vbCAiRW5h
YmxlIHZpcmdscmVuZGVyZXIiCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19MSUJFR0wg
fHwgQlIyX1BBQ0tBR0VfSEFTX0xJQkdMCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVV9PUEVO
R0wKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9WSVJHTFJFTkRFUkVSCgpBbGwgdGhpcyBlZmZvcnQg
dG8gYnVpbGQgdmlyZ2xyZW5kZXJlciB3aXRob3V0IGVnbCBvciBnbCB0byB1c2UgaXQgKHNlbGVj
dCBpdCkKdW5kZXIgYW4gb3B0aW9uIHRoYXQgZGVwZW5kcyBvbiBlZ2wgb3IgZ2w/CgpJJ2xsIGhh
dmUgYSBzZWNvbmQgbG9vay4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+ICsJaGVscAo+ICsJICBT
YXkgJ3knIHRvIGVuYWJsZSB2aXJnbHJlbmRlcmVyLCBlbmFibGluZyBHTCBhbmQgVnVsa2FuCj4g
KwkgIHBhc3N0aHJvdWdoIGZyb20gdGhlIGhvc3QgdG8gdGhlIGd1ZXN0IHRocm91Z2ggdmlydGlv
LWdwdS4KPiArCSAgVGhpcyBlbmFibGVzIHRoZSBndWVzdCB0byBoYXZlIGFjY2VsZXJhdGVkIEdM
IGFuZC9vciBWdWxrYW4uCj4gKwo+ICsJICBSdW4gcWVtdSB3aXRoIGAtZGV2aWNlIHZpcnRpby1n
cHUtZ2xgCj4gKwo+ICsJICBodHRwczovL3FlbXUucmVhZHRoZWRvY3MuaW8vZW4vdjEwLjAuMy9z
eXN0ZW0vZGV2aWNlcy92aXJ0aW8tZ3B1Lmh0bWwjdmlydGlvLWdwdS12aXJnbHJlbmRlcmVyCj4g
Kwo+ICtjb21tZW50ICJ2aXJnbHJlbmRlcmVyIG5lZWRzIE9wZW5HTCBhY2NlbGVyYXRlZCBkaXNw
bGF5IGZyb250ZW5kIHN1cHBvcnQiCj4gKwlkZXBlbmRzIG9uICEoQlIyX1BBQ0tBR0VfSEFTX0xJ
QkVHTCB8fCBCUjJfUEFDS0FHRV9IQVNfTElCR0wpCj4gKwo+ICBjb25maWcgQlIyX1BBQ0tBR0Vf
UUVNVV9GRFQKPiAgCWJvb2wgIkVuYWJsZSBGRFQiCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfRFRD
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWVtdS9xZW11Lm1rIGIvcGFja2FnZS9xZW11L3FlbXUu
bWsKPiBpbmRleCA5Yjc4MDc5N2ZhLi5lMjUwMTI4ZGZhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
cWVtdS9xZW11Lm1rCj4gKysrIGIvcGFja2FnZS9xZW11L3FlbXUubWsKPiBAQCAtMjgxLDYgKzI4
MSwxMyBAQCBlbHNlCj4gIFFFTVVfT1BUUyArPSAtLWRpc2FibGUtb3BlbmdsCj4gIGVuZGlmCj4g
IAo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1FFTVVfVklSR0xSRU5ERVJFUikseSkKPiArUUVNVV9P
UFRTICs9IC0tZW5hYmxlLXZpcmdscmVuZGVyZXIKPiArUUVNVV9ERVBFTkRFTkNJRVMgKz0gdmly
Z2xyZW5kZXJlcgo+ICtlbHNlCj4gK1FFTVVfT1BUUyArPSAtLWRpc2FibGUtdmlyZ2xyZW5kZXJl
cgo+ICtlbmRpZgo+ICsKPiAgaWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLHkpCj4gIFFFTVVfT1BU
UyArPSAtLXN0YXRpYwo+ICBlbmRpZgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
