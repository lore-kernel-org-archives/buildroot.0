Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CDECA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 14:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE4FA40BD1;
	Wed, 10 Sep 2025 14:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2U06LgaLAv3x; Wed, 10 Sep 2025 14:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE45140C0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE45140C0B;
	Wed, 10 Sep 2025 14:03:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49A5D234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 14:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 475D840610
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 14:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sj_YXdRvhCfT for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 14:03:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D7364043A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D7364043A
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D7364043A
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 14:03:08 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id
 38308e7fff4ca-336af6356a5so54522831fa.3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757512987; x=1758117787;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yflgDeUnq6zTxUEYnC7S8MxxocnwVXVvfvrrHoDqdt4=;
 b=U8cLkQn79wgvdHNfBUoETz6kHcFsOxzJhFFlqyoPmrt1TcEX0BjCzgp3IILo54kKY8
 hoSnqFjtAojhJgRCLF9igviP9dXQPa9J+f2WaZ+SAa8mvd4kX9uRg2qjeviglQa9vJg5
 E+E1RrJaAuMcNw0F4V9xO1ksVXjuWr0Yc0vZ7s00LxBOK0K8JKWHrBxJ2JwXIV0llSsp
 1DGsIwLEonFqgexJiaCXVIhq8NintwWlPDFp5FEV8PILg7vZ6H1dO/LOmMeCJIM3bb7W
 RwaZvCoKc+GSa6H8YdySB8uFJgRDkDLBTQSBHrGQ/3IPdrsaBBRSOR9bFLvG/dXKVwPF
 eBfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ1TEIo/Uh8Y3PbFCaP8W0ShcHztUhC8oO934j5AGnHW2IAhzMkFjHaJx17w3x73Ci2f20eaNu3vE=@buildroot.org
X-Gm-Message-State: AOJu0Yyj0BzPV8HCkJ6v1WAbeB/WQbfszktOwSfdjnhWVQ+OLGxikh/T
 Svr26DjnnP0Nw53siiWdY6zkPWiw0Ue8YpJ8PLgOc7d6U+i7VxeGgxPe+f8fE7Xpbyk=
X-Gm-Gg: ASbGnctAX99dG3uGpB5SJLMY+0BgtO+1JubTURGQZWxhBIfrrBmhgBg4hdLlgEXB0CR
 zhfkZeZdzAqTSMxBkaYAye4h2REqug3cawRUeSe/VKTSmFK7tEEZst1L2OdpXRbQ9rfjDnT7D02
 Nn3PUBISm1yEUSmQe/dbKt9tFlmYf1D9XqhiODi9SgYoUs30K3Ypjs/74SD/gdFZ6dkFLHrRwIM
 AOV6iYHN3ZIDQ3cvDgtdioqfUgFE972pyLo4okPeX0AJF9UyqKLBiKYkK3jEk01zgU9/vd9h03l
 ECvi6mCef4aQZBVowfIUPuBFzaoWX6xbpwtWEXlM4W4pMV67kNeCerBHFNg1HWV11WYvX2cARPs
 A+o4Rnmh/by/+ykckT0LwiPRKncDa/0NwuFiI+/53NMUd/G/xF9F0DTs8eAfEVvlfT/3xjBR9nR
 tdwQebfgUBjw==
X-Google-Smtp-Source: AGHT+IEFgmEGlxuM/kvaCmQcyAF0rTfRkh6+tM4Fyw39ut1Z87KgIzsrFahVQKFgnuKIrCgmH3Sz7Q==
X-Received: by 2002:a2e:a58c:0:b0:337:e4cd:b2df with SMTP id
 38308e7fff4ca-33b54ee8c76mr54567021fa.20.1757512986377; 
 Wed, 10 Sep 2025 07:03:06 -0700 (PDT)
Received: from [10.5.90.80]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34701fcf491sm11960971fa.3.2025.09.10.07.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 07:03:05 -0700 (PDT)
Message-ID: <7f3c6f4b-0bae-4213-b880-b03e11c9d5b9@smile.fr>
Date: Wed, 10 Sep 2025 16:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <olteanv@gmail.com>, buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
References: <20250830173313.164981-1-olteanv@gmail.com>
 <20250830173313.164981-2-olteanv@gmail.com>
Content-Language: fr
In-Reply-To: <20250830173313.164981-2-olteanv@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757512987; x=1758117787; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yflgDeUnq6zTxUEYnC7S8MxxocnwVXVvfvrrHoDqdt4=;
 b=p4C456/3qQIXCxd9iXrmtagSm/goGkKbvhg7WTrE2cOozjavVYrWM9gilGfUfNNGtU
 AJngapUHqUPGt5io8DoZUdXqd89YwCHSXfQrgkncIhfokScX1ytXcQXzJfwMTcr0RLuC
 IDdJ2tLjfR28147d0fARrWvY9VEKpQtDPFYFA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=p4C456/3
Subject: Re: [Buildroot] [PATCH v4 1/2] package/qoriq-restool: new package
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

SGVsbG8gVmxhZGltaXIsIFZpbmNlbnQsCgpMZSAzMC8wOC8yMDI1IMOgIDE5OjMzLCBWbGFkaW1p
ciBPbHRlYW4gYSDDqWNyaXTCoDoKPiBJbnRyb2R1Y2UgYSBwYWNrYWdlIGZvciB0aGUgcmVzdG9v
bCBwcm9ncmFtLCB3aGljaCBwZXJtaXRzIHRoZSB1c2VyIHRvCj4gbW9kaWZ5IHRoZSBuZXR3b3Jr
IGNvbmZpZ3VyYXRpb24gb2YgdGhlIERQQUEyIHN1YnN5c3RlbSBhbmQgY3JlYXRlIG9uZQo+IHRo
YXQgaXMgYWRlcXVhdGUgdG8gdGhlaXIgdXNlIGNhc2UuCj4gCj4gV2UgaW50ZWdyYXRlIHRoZSBt
YXN0ZXIgYnJhbmNoLCB3aGljaCBpcyBlZmZlY3RpdmVseSB0aGUKPiBsZi02LjEyLjIwLTIuMC4w
IHJlbGVhc2UgdGFnLCBwbHVzIHNvbWUgZXh0cmEgZml4dXBzIHNwZWNpZmljYWxseSBtYWRlCj4g
Zm9yIHRoZSBCdWlsZHJvb3QgaW50ZWdyYXRpb246Cj4gLSBjb21taXQgYjQ0NzQ4ZWQwYmIzICgi
QXZvaWQgdXNlIG9mIG5vbi1wb3J0YWJsZSBfX1dPUkRTSVpFIHdoZW4KPiAgIGRlZmluaW5nIEJJ
VFNfUEVSX0xPTkciKQo+IC0gY29tbWl0IGI0YTczNGYzNTEyYiAoInJlc3Rvb2w6IGZpeCBmb3Jt
YXQgc3RyaW5nIGZvciA2NCBiaXQgdGltZV90IGluCj4gICBwYXJzZV9vYmpfY29tbWFuZCgpIikK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBPbHRlYW4gPG9sdGVhbnZAZ21haWwuY29tPgo+
IFJldmlld2VkLWJ5OiBWaW5jZW50IEphcmRpbiA8dmphcmRpbkBmcmVlLmZyPgo+IC0tLQo+IHYz
LT52NDoKPiAtIGludGVncmF0ZSB1cHN0cmVhbSBwYXRjaGVzIHdoaWNoIGZpeCBtdXNsIGJ1aWxk
cyBhbmQgNjQtYml0IHRpbWVfdCBvbgo+ICAgMzItYml0Cj4gLSBmaXggX0xJQ0VOU0VfRklMRVMg
dmFyaWFibGUgKGl0IGlzIG5hbWVkIExJQ0VOU0UsIG5vdCBDT1BZSU5HKSBhbmQgaXRzCj4gICBo
YXNoCj4gdjItPnYzOiBpbnRlZ3JhdGUgdXBzdHJlYW0gYSBwYXRjaCB3aGljaCBmaXhlcyAzMi1i
aXQgYnVpbGRzCj4gdjEtPnYyOiBpbnRlZ3JhdGUgdXBzdHJlYW0gYSBwYXRjaCBmcm9tIFZpbmNl
bnQgd2hpY2ggYXZvaWRzIGJ1aWxkaW5nCj4gICAgICAgICBtYW4gcGFnZXMKPiAKPiAgREVWRUxP
UEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9Db25m
aWcuaW4gICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9xb3JpcS1yZXN0
b29sL0NvbmZpZy5pbiAgICAgICAgICB8IDIyICsrKysrKysrKysrKysrKysrKysrKwo+ICBwYWNr
YWdlL3FvcmlxLXJlc3Rvb2wvcW9yaXEtcmVzdG9vbC5oYXNoIHwgIDMgKysrCj4gIHBhY2thZ2Uv
cW9yaXEtcmVzdG9vbC9xb3JpcS1yZXN0b29sLm1rICAgfCAyNSArKysrKysrKysrKysrKysrKysr
KysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3FvcmlxLXJlc3Rvb2wvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3FvcmlxLXJlc3Rvb2wvcW9yaXEtcmVzdG9vbC5oYXNoCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3FvcmlxLXJlc3Rvb2wvcW9yaXEtcmVzdG9vbC5tawo+IAo+IGRp
ZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IDg3YTI2YjQzODg4ZC4u
Y2Q0NmNlYzkyODI0IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJT
Cj4gQEAgLTM0MzUsNiArMzQzNSw3IEBAIEY6CXBhY2thZ2UvcW9yaXEtZGRyLXBoeS1iaW5hcnkv
Cj4gIEY6CXBhY2thZ2UvcW9yaXEtZmlybXdhcmUtaW5waGkvCj4gIEY6CXBhY2thZ2UvcW9yaXEt
bWMtYmluYXJ5Lwo+ICBGOglwYWNrYWdlL3FvcmlxLW1jLXV0aWxzLwo+ICtGOglwYWNrYWdlL3Fv
cmlxLXJlc3Rvb2wvCj4gIAo+ICBOOglWb2xrb3YgVmlhY2hlc2xhdiA8c3Y5OUBpbmJveC5ydT4K
PiAgRjoJcGFja2FnZS92NGwyZ3JhYi8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4g
Yi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDFjNGRjZjJjNzU3Ni4uZDQ2NzhkN2YwZTJiIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4K
PiBAQCAtNTk3LDYgKzU5Nyw3IEBAIGVuZG1lbnUKPiAgCXNvdXJjZSAicGFja2FnZS9wcnUtc29m
dHdhcmUtc3VwcG9ydC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcHVsc2V2aWV3L0Nv
bmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9xb3JpcS1jYWRlbmNlLWRwLWZpcm13YXJlL0Nv
bmZpZy5pbiIKPiArCXNvdXJjZSAicGFja2FnZS9xb3JpcS1yZXN0b29sL0NvbmZpZy5pbiIKPiAg
CXNvdXJjZSAicGFja2FnZS9yYXNwaS1ncGlvL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2Fn
ZS9yZG1hLWNvcmUvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3JlYWQtZWRpZC9Db25m
aWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcW9yaXEtcmVzdG9vbC9Db25maWcuaW4gYi9w
YWNrYWdlL3FvcmlxLXJlc3Rvb2wvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLmRiZTA5MzRkNGRkMwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9w
YWNrYWdlL3FvcmlxLXJlc3Rvb2wvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwyMiBAQAo+ICtjb25m
aWcgQlIyX1BBQ0tBR0VfUU9SSVFfUkVTVE9PTAo+ICsJYm9vbCAicW9yaXEtcmVzdG9vbCIKCklz
IHRoaXMgc29mdHdhcmUgY2FuIGJlIHVzZWQgaW4gb3RoZXIgcGxhdGVmb3JtIHRoYW4gdGhlIGFh
cmNoNjQgTlhQIExBWUVSU0NBUEUgPwpJZiBub3QsIHdlIG1heSB3YW50IHRvIHNlbGVjdCB0aGlz
IHBhY2thZ2Ugb25seSBmb3IgQlIyX2FhcmNoNjQuClRoZSBRb3JJUSBEUEFBMiBmc2wtbWMgYnVz
IGRyaXZlciBzZWVtcyB0byBiZSBsaW1pdGVkIHRvIE5YUCBTb0NzLgpZb2N0byBkZWZpbmUgYSBD
T01QQVRJQkxFX01BQ0hJTkUgPSAiKHFvcmlxLWFybTY0KSIgdG8gdGFyZ2V0IG9ubHkgYWFyY2g2
NC4KCk90aGVyd2lzZSBxb3JpcS1yZXN0b29sIHdpbGwgYmUgYnVpbHQgZm9yIGFsbCBhcmNoaXRl
Y3R1cmVzIHN1cHBvcnRlZCBieSBCdWlsZHJvb3QuCihTYW1lIHF1ZXN0aW9uIGFib3V0IG90aGVy
IHFvcmlxIHBhY2thZ2VzPykKCldoYXQgYWJvdXQgZHRjIG9yIGJhc2ggZGVwZW5kZWN5ID8KaHR0
cHM6Ly9naXRodWIuY29tL0ZyZWVzY2FsZS9tZXRhLWZyZWVzY2FsZS9ibG9iL21hc3Rlci9yZWNp
cGVzLWRwYWEyL3Jlc3Rvb2wvcmVzdG9vbF9naXQuYmIjTDE5CgpCZXN0IHJlZ2FyZHMsClJvbWFp
bgoKCj4gKwloZWxwCj4gKwkgIFRoZSBEUEFBMiBhcmNoaXRlY3R1cmUgaW4gTGF5ZXJzY2FwZSBT
b0NzIGNvbnNpc3RzIG9mCj4gKwkgIG5ldHdvcmtpbmcgcmVzb3VyY2VzIHRoYXQgY2FuIGJlIGFz
c2VtYmxlZCBpbnRvIHZhcmlvdXMKPiArCSAgbnVnZ2V0cyBvZiBmdW5jdGlvbmFsaXR5LCBjYWxs
ZWQgIm9iamVjdHMiIChEUE1BQywgRFBOSSwKPiArCSAgRFBETVVYLCBEUFNXIGV0YyksIGJ5IHRo
ZSBNYW5hZ2VtZW50IENvbXBsZXggKE1DKSBmaXJtd2FyZS4KPiArCj4gKwkgIFRoZSBNQyBmaXJt
d2FyZSByZWFkcyBhIGZpbGUgY2FsbGVkIERhdGEgUGF0aCBMYXlvdXQgKERQTCkKPiArCSAgd2hp
Y2ggZGVzY3JpYmVzIHRoZSBzZXQgb2YgbmV0d29ya2luZyBvYmplY3RzIGl0IHNob3VsZAo+ICsJ
ICBjcmVhdGUgc3RhdGljYWxseSwgYXQgYm9vdCB0aW1lLgo+ICsKPiArCSAgVGhlIHJlc3Rvb2wg
cHJvZ3JhbSBpcyBhYmxlIHRvIHRhbGsgdG8gdGhlIE1hbmFnZW1lbnQKPiArCSAgQ29tcGxleCBh
dCBydW50aW1lIGFuZCBwZXJtaXRzIHRoZSBkeW5hbWljIHJlY29uZmlndXJhdGlvbgo+ICsJICBv
ZiBuZXR3b3JraW5nIG9iamVjdHMsIGFzIHdlbGwgYXMgc2F2aW5nIHRoZSBjdXJyZW50Cj4gKwkg
IGNvbmZpZ3VyYXRpb24gaW50byBhIG5ldyBEUEwgZmlsZS4gV2l0aG91dCB0aGUgcmVzdG9vbAo+
ICsJICBwcm9ncmFtLCB0aGUgb25seSBwb3NzaWJsZSBuZXR3b3JraW5nIGNvbmZpZ3VyYXRpb24g
aXMKPiArCSAgdGhhdCBzcGVjaWZpZWQgaW4gdGhlIGJvb3QtdGltZSBEUEwgZmlsZS4KPiArCj4g
KwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9ueHAtcW9yaXEvcmVzdG9vbAo+ICsJICAjIHNpZ24gaW4g
cmVxdWlyZWQKPiArCSAgaHR0cHM6Ly93d3cubnhwLmNvbS93ZWJhcHAvRG93bmxvYWQ/Y29sQ29k
ZT1EUEFBMlVNCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcW9yaXEtcmVzdG9vbC9xb3JpcS1yZXN0
b29sLmhhc2ggYi9wYWNrYWdlL3FvcmlxLXJlc3Rvb2wvcW9yaXEtcmVzdG9vbC5oYXNoCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjcyYTM0NDczZjIxZQo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3FvcmlxLXJlc3Rvb2wvcW9yaXEtcmVzdG9vbC5o
YXNoCj4gQEAgLTAsMCArMSwzIEBACj4gKyMgTG9jYWxseSBjYWxjdWxhdGVkCj4gK3NoYTI1NiAg
Mjg3OWYxNGM5ZGQ4MTBlOTJkNGM1MWM3ZjFhM2U2NzA1YTVhNTg1YzI0NDVlNTA3ZjYzZTM5ODcy
YWM2MjM3ZCAgcW9yaXEtcmVzdG9vbC1sZi02LjEyLjIwLTIuMC4wLTMtZ2I0NDc0OGUudGFyLmd6
Cj4gK3NoYTI1NiAgZGRjNzk0YTc1ZjExYzNiZDAxMDE1ZjE2Yjk3NzYwNjRhODk0MDE1ZTdhMTYw
MzU0MTI4M2NjYmMyZTFjM2E0MCAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Fvcmlx
LXJlc3Rvb2wvcW9yaXEtcmVzdG9vbC5tayBiL3BhY2thZ2UvcW9yaXEtcmVzdG9vbC9xb3JpcS1y
ZXN0b29sLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjUy
YTYyMmY3MGUwMwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3FvcmlxLXJlc3Rvb2wv
cW9yaXEtcmVzdG9vbC5tawo+IEBAIC0wLDAgKzEsMjUgQEAKPiArIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiArIwo+ICsjIHFvcmlxLXJlc3Rvb2wKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICsKPiArUU9SSVFfUkVTVE9PTF9WRVJTSU9OID0gbGYtNi4xMi4yMC0yLjAuMC0zLWdi
NDQ3NDhlCj4gK1FPUklRX1JFU1RPT0xfU0lURSA9ICQoY2FsbCBnaXRodWIsbnhwLXFvcmlxLHJl
c3Rvb2wsJChRT1JJUV9SRVNUT09MX1ZFUlNJT04pKQo+ICtRT1JJUV9SRVNUT09MX0xJQ0VOU0Ug
PSBCU0QtMy1DbGF1c2Ugb3IgR1BMLTIuMC1vci1sYXRlcgo+ICtRT1JJUV9SRVNUT09MX0xJQ0VO
U0VfRklMRVMgPSBMSUNFTlNFCj4gKwo+ICtRT1JJUV9SRVNUT09MX01BS0VfT1BUUyA9IFwKPiAr
CUNDPSIkKFRBUkdFVF9DQykiIFwKPiArCUNST1NTX0NPTVBJTEU9IiQoVEFSR0VUX0NST1NTKSIK
PiArCj4gK2RlZmluZSBRT1JJUV9SRVNUT09MX0JVSUxEX0NNRFMKPiArCWNkICQoQEQpICYmICQo
VEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpICQoUU9SSVFfUkVTVE9PTF9NQUtFX09QVFMpCj4gK2Vu
ZGVmCj4gKwo+ICtkZWZpbmUgUU9SSVFfUkVTVE9PTF9JTlNUQUxMX1RBUkdFVF9DTURTCj4gKwkk
KFRBUkdFVF9NQUtFX0VOVikgTUFOUEFHRT0iIiAkKE1BS0UpIC1DICQoQEQpIERFU1RESVI9JChU
QVJHRVRfRElSKSBcCj4gKwkJcHJlZml4PS91c3IgaW5zdGFsbAo+ICtlbmRlZgo+ICsKPiArJChl
dmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
