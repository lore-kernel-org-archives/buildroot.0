Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEF1C83030
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 19:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8D8B83B99;
	Sat,  5 Jul 2025 19:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISUQ2tAyuHs6; Sat,  5 Jul 2025 19:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C06083B81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C06083B81;
	Sat,  5 Jul 2025 19:26:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E64312E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 19:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64A7382193
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 19:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGGFqb_UfYzp for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 19:26:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 707EF83B5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 707EF83B5C
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 707EF83B5C
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 19:26:41 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so1436806f8f.2
 for <buildroot@buildroot.org>; Sat, 05 Jul 2025 12:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751743599; x=1752348399;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mq++PbSkMwlMtmIduWfB5pBtCx9Xd7NukdHdWhw93hk=;
 b=EL3KI/8giA6hL/tU2A4eW8h5Fg4nyOCewhxp0egY0gF1jTT1tBoxQmdU1rJ1JiTQpE
 lIfe67fahra4dzoifc7m/SdpNYISNYl1Om4JVaM3VJ6EE6HSv3S1mo1UYbm5zW1jwZ7S
 GItA49ljwEyPy3N1HXaX8ZSZBrhTgmaCdGnY5WsFrH49azBcAgVpMsKH8SbSWNQKqy49
 +rlW2DrliM6JsCCJ4Y8mmuZZ4J18SkgL0vgON+v1nAu/4fty8Khr8INMhU+qREbHYazl
 e1A+uCj8h7Du1SxczZS+FuG0xbalC9acZCBPS16hoCMOHhTlQ08+AoDI/4SXEc8hb0Ov
 35eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4CILSITR6n45XZ9HfhPM2dNyNDPaSb7D+g5qhKqcbIQTfzsH/wM03H/S1AbuI2DnJ4A/1YU1m/Xs=@buildroot.org
X-Gm-Message-State: AOJu0Yyb2sesqFwqlX15PmWkb6V96sNTjiCHogAfEWMBboH0gpiwhIox
 c6urrzTr+8DtvHlM6GA8Y8UedkGiB7iMkN8tW5q1hyw6RZz4q/W5IrXKBRApVP04Kq2S5PP3kTU
 oozug
X-Gm-Gg: ASbGnctylXI+zlmELKgORtZ1cRpDRm1DnWHwx0qoUCO0CAqswoezMBuJlOZ6OWoj9u3
 4ZLA0TnRjFAtsY2dtr/VxAOFTFaUk/VnK2Z+4QFu31YHl+3ZEqRcbsx4sUziwizRsnx+HTcV8y8
 HVRxRBoIMOLsxnZEwaI9xvQpeM5ZlE3k/fCKE4bOpcMLs9yf6JoBeQA6dqzBNKd1+Jv2/ghUP3K
 9qHZYe+OJTImcqgY6qazQ7iG28VKoEDtRaH5EiJoHtd5Gz1/oOgUgaZ8/E0Yw0K60W03tn1Bqf7
 /KuqIptWeD9hMd8nhIwK0bvmuMxjc2DihhTFQAFcn5uFid5lEro2/6CvBfYYAO3Damy5++AtMpg
 oT/31S8BC/pDnyVLKQKp252+fh+2/faPxfiAgjRh6llmJrYSX2pSZRW6iosjoGFHRXprRXXXxwf
 02oB0Lr4+VprPsBEtSySX9IZsr
X-Google-Smtp-Source: AGHT+IGhg8WCLDgWo7C9K93wr9ho7gtiWuWQKYhQUyzaS4I6v26o4NUopua3ASHeNFcWzmBY4QdqNg==
X-Received: by 2002:a05:6000:2b03:b0:3a0:b940:d479 with SMTP id
 ffacd0b85a97d-3b4966267f9mr3994106f8f.53.1751743599367; 
 Sat, 05 Jul 2025 12:26:39 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b472767a20sm5602873f8f.86.2025.07.05.12.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jul 2025 12:26:39 -0700 (PDT)
Message-ID: <85204389-b2b4-447e-af5b-2f7ec9d95afd@smile.fr>
Date: Sat, 5 Jul 2025 21:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20250619144837.1298990-1-alex.bennee@linaro.org>
 <20250619144837.1298990-4-alex.bennee@linaro.org>
Content-Language: fr
In-Reply-To: <20250619144837.1298990-4-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751743599; x=1752348399; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mq++PbSkMwlMtmIduWfB5pBtCx9Xd7NukdHdWhw93hk=;
 b=oMvDcvu4LCS/gAPhnJTnsyN1OfhgxDHKhhN5wgrjwHIHwioj/ETvFMuDHfp6rLqSsw
 4rAEc49F30GCkkQi6a2vg5GiLxVQTCiUNL+Z3l8VIpkQSHLOTpd8urJeOWTUhQkKRcwy
 hRdHDQ4PpVnAmt2P62G3ycr2UWw8QBa+9hJgw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=oMvDcvu4
Subject: Re: [Buildroot] [PATCH 3/3] package/qemu: introduce kvm and tcg
 system options
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

SGVsbG8gQWxleCwgQWxsLAoKTGUgMTkvMDYvMjAyNSDDoCAxNjo0OCwgQWxleCBCZW5uw6llIGEg
w6ljcml0wqA6Cj4gV2hlbiBidWlsZGluZyBzeXN0ZW0gYmluYXJpZXMgeW91IG1heSBub3QgZXZl
biB3YW50IFRDRyBzdXBwb3J0IGlmIHlvdQo+IGFyZSBvbmx5IGludGVuZGluZyB0byB1c2UgS1ZN
LiBQcm92aWRlIHRoZSBvcHRpb25zIHNvIHRoZSB1c2VyIGNhbgo+IHNlbGVjdCBvbmx5IHdoYXQg
dGhleSBuZWVkLgo+IAo+IFdpdGggb25seSBLVk0gc2VsZWN0ZWQgdGhlIFFFTVUgYnVpbGQgd2ls
bCBnZW5lcmFsbHkgb25seSBidWlsZCB0aGUKPiBiaW5hcnkgZm9yIHlvdXIgdGFyZ2V0IHN5c3Rl
bS4gSXQgYWxzbyBpbXBsaWVzIHlvdSBjYW5ub3Qgc2VsZWN0Cj4gYWRkaXRpb25hbCB0YXJnZXRz
IHVubGVzcyB5b3UgZW5hYmxlIHVzZXItbW9kZSBvciBUQ0cgc3VwcG9ydCBmb3IKPiBzeXN0ZW0u
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3Jn
Pgo+IC0tLQo+ICBwYWNrYWdlL3FlbXUvQ29uZmlnLmluIHwgMjMgKysrKysrKysrKysrKysrKysr
LS0tLS0KPiAgcGFja2FnZS9xZW11L3FlbXUubWsgICB8IDEzICsrKysrKysrKysrKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluIGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbgo+
IGluZGV4IDJkMTVhYjFlYTkuLmFmMjE4NTgzZmUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9xZW11
L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvcWVtdS9Db25maWcuaW4KPiBAQCAtNTksNiArNTks
MjAgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNCj4gIAo+ICBpZiBCUjJfUEFDS0FH
RV9RRU1VX1NZU1RFTQo+ICAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNX0tWTQo+
ICsgICAgICAgYm9vbCAiRW5hYmxlIEtWTSBzeXN0ZW0gdmlydHVhbGlzYXRpb24iCj4gKyAgICAg
ICBkZWZhdWx0IHkKPiArICAgICAgIGhlbHAKPiArICAgICAgICAgU2F5ICd5JyBoZXJlIHRvIGVu
YWJsZSBhIFFFTVUgd2l0aCBLVk0gZW5hYmxlZC4gSWYgdW5zdXJlLCBzYXkgJ3knCgpQbGVhc2Us
IHVzZSAuL3V0aWxzL2NoZWNrLXBhY2thZ2UgcGFja2FnZS9xZW11LyogdG8gY2hlY2sgY29kaW5n
IHN0eWxlIGlzc3VlLgoKPiArCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTV9UQ0cK
PiArICAgICAgIGJvb2wgIkVuYWJsZSBUQ0cgc3lzdGVtIGVtdWxhdGlvbiIKPiArICAgICAgIGRl
ZmF1bHQgbgoKVGhpcyBpcyB0aGUgZGVmYXVsdCwgeW91IGNhbiByZW1vdmUgImRlZmF1bHQgbiIg
aGVyZS4KCj4gKyAgICAgICBoZWxwCj4gKyAgICAgICAgIFNheSAneScgaGVyZSB0byBlbmFibGUg
UUVNVSBiaW5hcnlzIHdoaWNoIGNhbiBlbXVsYXRlIGZvcmllZ24KCnR5cG9zOiBiaW5hcnlzLCBm
b3JpZWduCgo+ICsgICAgICAgICBhcmNoaXRlY3R1cmVzIHVzaW5nIHRoZSBUQ0cgSklULgo+ICsK
PiArCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9RRU1VX0JMT0JTCj4gIAlib29sICJJbnN0YWxsIGJp
bmFyeSBibG9icyIKPiAgCWRlZmF1bHQgeQo+IEBAIC0xMzAsMTIgKzE0NCwxMSBAQCBjb25maWcg
QlIyX1BBQ0tBR0VfUUVNVV9MSU5VWF9VU0VSCj4gIAo+ICBjb25maWcgQlIyX1BBQ0tBR0VfUUVN
VV9DSE9PU0VfVEFSR0VUUwo+ICAJYm9vbCAiU2VsZWN0IGluZGl2aWR1YWwgZW11bGF0b3IgdGFy
Z2V0cyIKPiAtCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0gfHwgQlIyX1BBQ0tB
R0VfUUVNVV9MSU5VWF9VU0VSCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVN
X1RDRyB8fCBCUjJfUEFDS0FHRV9RRU1VX0xJTlVYX1VTRVIKCk1heWJlIHdlIHNob3VsZCBrZWVw
IFRDRyBieSBkZWZhdWx0LiBleGlzdGluZyBkZWZjb25maWcgd2lsbCBub3cgbG9vc2UKcWVtdS1z
eXN0ZW0tJEFSQ0ggdGhhdCB3ZXJlIGluc3RhbGxlZCBiZWZvcmUgdGhpcyBwYXRjaC4KCj4gIAlo
ZWxwCj4gLQkgIEJ5IGRlZmF1bHQsIGFsbCB0YXJnZXRzIChzeXN0ZW0gYW5kL29yIHVzZXIsIHN1
YmplY3QgdG8gdGhlCj4gLQkgIGNvcnJlc3BvbmRpbmcgb3B0aW9ucywgYWJvdmUpIGFyZSBidWls
dC4gSWYgeW91IG9ubHkgbmVlZCBhCj4gLQkgIHN1YnNldCBvZiB0aGUgZW11bGF0ZWQgdGFyZ2V0
cywgc2F5ICd5JyBoZXJlIGFuZCBlbmFibGUgYXQKPiAtCSAgbGVhc3Qgb25lIHRhcmdldCwgYmVs
b3cuCj4gKwkgIEJ5IGRlZmF1bHQsIGFsbCB0YXJnZXRzIHN5c3RlbSB0YXJnZXRzIGFyZSBidWls
dCB3aGVuIFRDRyBpcwo+ICsJICBlbmFibGVkLiBJZiB5b3Ugb25seSBuZWVkIGEgc3Vic2V0IG9m
IHRoZSBlbXVsYXRlZCB0YXJnZXRzLAo+ICsJICBzYXkgJ3knIGhlcmUgYW5kIGVuYWJsZSBhdCBs
ZWFzdCBvbmUgdGFyZ2V0LCBiZWxvdy4KPiAgCj4gIGlmIEJSMl9QQUNLQUdFX1FFTVVfQ0hPT1NF
X1RBUkdFVFMKPiAgCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWVtdS9xZW11Lm1rIGIvcGFja2Fn
ZS9xZW11L3FlbXUubWsKPiBpbmRleCBmZGM4NTkxZTU0Li4xOTcwM2JhM2UzIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4gKysrIGIvcGFja2FnZS9xZW11L3FlbXUubWsKPiBA
QCAtNDgsNiArNDgsMTkgQEAgUUVNVV9WQVJTID0gTElCVE9PTD0kKEhPU1RfRElSKS9iaW4vbGli
dG9vbAo+ICBpZmVxICgkKEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNKSx5KQo+ICBRRU1VX0RFUEVO
REVOQ0lFUyArPSBwaXhtYW4KPiAgUUVNVV9PUFRTICs9IC0tZW5hYmxlLXN5c3RlbQo+ICsKPiAr
aWZlcSAoJChCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTV9LVk0pLCB5KQo+ICtRRU1VX09QVFMgKz0g
LS1lbmFibGUta3ZtCj4gK2Vsc2UKPiArUUVNVV9PUFRTICs9IC0tZGlzYWJsZS1rdm0KPiArZW5k
aWYKCi0tZW5hYmxlLWt2bSBpcyBhbHJlYWR5IHByZXNlbnQgaXMgUUVNVV9DT05GSUdVUkVfQ01E
UywgeW91IGNhbiByZW1vdmUgaXQuCgo+ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9RRU1VX1NZ
U1RFTV9UQ0cpLCB5KQo+ICtRRU1VX09QVFMgKz0gLS1lbmFibGUtdGNnCj4gK2Vsc2UKPiArUUVN
VV9PUFRTICs9IC0tZGlzYWJsZS10Y2cKPiArZW5kaWYKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoK
PiArCj4gIFFFTVVfVEFSR0VUX0xJU1RfJChCUjJfUEFDS0FHRV9RRU1VX1RBUkdFVF9BQVJDSDY0
KSArPSBhYXJjaDY0LXNvZnRtbXUKPiAgUUVNVV9UQVJHRVRfTElTVF8kKEJSMl9QQUNLQUdFX1FF
TVVfVEFSR0VUX0FMUEhBKSArPSBhbHBoYS1zb2Z0bW11Cj4gIFFFTVVfVEFSR0VUX0xJU1RfJChC
UjJfUEFDS0FHRV9RRU1VX1RBUkdFVF9BUk0pICs9IGFybS1zb2Z0bW11CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
