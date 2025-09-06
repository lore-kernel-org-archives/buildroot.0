Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6EACA0FED
	for <buildroot@archiver.kernel.org>; Sat,  6 Sep 2025 22:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8A1384193;
	Sat,  6 Sep 2025 22:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6khaKoIEBee; Sat,  6 Sep 2025 22:17:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1C3F840AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C3F840AF;
	Sat,  6 Sep 2025 22:17:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54870DCA
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 22:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B53A6170B
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 22:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0YaaVl472H6 for <buildroot@buildroot.org>;
 Sat,  6 Sep 2025 22:17:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B8516170A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B8516170A
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B8516170A
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 22:17:03 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-45dd513f4ecso16907875e9.3
 for <buildroot@buildroot.org>; Sat, 06 Sep 2025 15:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757197022; x=1757801822;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LdQwdQp2o7GvjchMJjXz5P8+RajMsSROL2dJREziu80=;
 b=OxKdyGepJY8M10D1oaukbZxSAtN41UGCtyg0bideep3Bht41qSK6cM5mtnd41uJAYj
 tgxZ7q18N+GqtZIr27MR7mVIKT8fp3nc1JKLB6jILLdoA8aK10TgFDbfWmeE4Yz0D1yr
 UcDFU3EpDB35R2Ih9W36ZyNn07oz3MtWzDfMdYErJRvRmuefOT+XNpuOFAKNg75PCeRv
 K4KaT6PTvwvmXowknO14tPGj9oD25wIHc5BWFeLc+uBIoPVC6M/EhmXimiwmx6/brAaM
 9ibYbxBXBnn9nJxoA3mxZ1Gjq0hfHnd0O9nU0kz73KjxbN9Oy4evWEIL43q+V5SbJMVo
 tBFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdHSGO1xICcb6x2xZbt1g8e55xyCruglEwbfF+Qy8uLhZJaS1yYocTt/XoiXviCnRbUjLDjq1oAZc=@buildroot.org
X-Gm-Message-State: AOJu0Yz3bBvxEdWJOaQMLz0S0W3mHFk+1cUitrt46vatJzaAYKiMopiu
 sZvVXvHPGgonIDhKxjlBJ1mYwnxTCmaEANgo1sebpTjMLNGPT1+aHXMIfsYS9Q+WpLxzwyXbZ/g
 TZUWES81c8Q==
X-Gm-Gg: ASbGnctlOW6d4AEbgvgYWgRjDPAfXYHVI4oWpclksfLrVYZK83lxX8b5lnAWXEsd5m9
 D9oiIyZ37mTNZJCEmTifttOVSeyhhNXvz4Gaz8QzwhqKKzmoHIS8h/SBoTfk6vgvOnQlqkBUeE+
 g+zeGseK5Gqlh4wZtdv4aVB3r3j3+Go4yoj351O9wneBSiVcqf02k6+tTnFdzxMXKeObhxUBR23
 7PKjphtMeVyY1OUv/89+TEhHEYITxLkNZc/dAWAY1aEu+dG7Zo9SEISC9X/zoG1xAigOOhTgYfk
 boJPYQ7E0sX6hKtGZRWSnMq/VLd32y2at7nfgnXB5ftt92Dv/nDscdXps4EA+X8C2W0zTVqrGdp
 okvq6SSvVUin5AdIIdOyBiYU21zvrWoneQj8QgeSG04Gky4Zc/bqL3P3W0TieGcu5anjeKsyAEO
 3YaHDp2VmzOBLL+BTDAYfNRD8z0Xsrq29yCHS6KX5PKTLEC0kuKlqlXHo0cnhS
X-Google-Smtp-Source: AGHT+IF84qYZsQwI2qSapaJadEpGEF0ng/W7GKNtiBwBeyJ8DX0QWCdX0VMLQ7oex4Xg0RgP/NX6qw==
X-Received: by 2002:a05:600c:548a:b0:45d:db33:fa0a with SMTP id
 5b1f17b1804b1-45dddee3772mr26783265e9.33.1757197021912; 
 Sat, 06 Sep 2025 15:17:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e740369f1esm2265658f8f.11.2025.09.06.15.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Sep 2025 15:17:01 -0700 (PDT)
Message-ID: <8c92dae4-f2f8-47c6-ba3c-79414815bc31@smile.fr>
Date: Sun, 7 Sep 2025 00:17:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
References: <20250811-php-lua-v3-1-f238174c6e4a@bootlin.com>
 <5120138b-60e2-40ba-9f17-ea421c56be14@smile.fr>
 <DCBLETOE9LO5.2XZ5QD1LFF31D@bootlin.com>
Content-Language: en-US
In-Reply-To: <DCBLETOE9LO5.2XZ5QD1LFF31D@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757197022; x=1757801822; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LdQwdQp2o7GvjchMJjXz5P8+RajMsSROL2dJREziu80=;
 b=ktspLBvhKwPltyvO7FiqmQRbiPU1Y5EgPLceR7SmXqnyzfE0aR/7IdpMcfHM4ECJcd
 ZsKmtCQ6m/6zuMhDMMkdLkaM15m+QqN/9EKOmdMt6JfzQgytk30R7CagsMNYHMBLVIy2
 eoWbGnyOdimtm6pP2tT3v835N50pyImsndoNI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ktspLBvh
Subject: Re: [Buildroot] [PATCH v3] package/php-lua: fix build with
 PHP8/GCC14
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

SGVsbG8gQWxleGlzLCBBbGwsCgpMZSAyNS8wOC8yMDI1IMOgIDE2OjUzLCBBbGV4aXMgTG90aG9y
w6kgYSDDqWNyaXTCoDoKPiBIaSBSb21haW4sCj4gCj4gT24gU3VuIEF1ZyAyNCwgMjAyNSBhdCA1
OjM2IFBNIENFU1QsIFJvbWFpbiBOYW91ciB3cm90ZToKPj4gSGVsbG8gQWxleGlzLCBUaG9tYXMs
IEFsbCwKPj4KPj4gTGUgMTEvMDgvMjAyNSDDoCAwOTo1MiwgQWxleGlzIExvdGhvcsOpIHZpYSBi
dWlsZHJvb3QgYSDDqWNyaXTCoDoKPiAKPiBbLi4uXQo+IAo+Pj4gK0Zyb20gZGUxMDY4ZDYzNDUx
OWFiZjI0NjFkYWM5NDI3YjVmZjI0YjY2MDNhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPj4+
ICtGcm9tOiBNaWtoYWlsIEdhbGFuaW4gPG1pa2hhaWwuZ2FsYW5pbkB0ZWFtLmJ1bWJsZS5jb20+
Cj4+PiArRGF0ZTogVHVlLCAyNCBBdWcgMjAyMSAwODoyODo0NyArMDEwMAo+Pj4gK1N1YmplY3Q6
IFtQQVRDSF0gcGhwODogU2lnbmF0dXJlIG9mIHdyaXRlX3Byb3BlcnR5L3JlYWRfcHJvcGVydHkg
d2FzIGNoYW5nZWQKPj4+ICsgaW4gaHR0cHM6Ly9naXRodWIuY29tL3BocC9waHAtc3JjL2NvbW1p
dC85MWVmNDEyNGU1Ngo+Pj4gKwo+Pj4gK1Rha2VuIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL2Jh
ZG9vL3BocC1sdWEvcHVsbC84Cj4+PiArCj4+PiArVXBzdHJlYW06IG4vYQo+Pgo+PiBJIHVwZGF0
ZWQgdGhlIGxpbmsgZm9sbG93aW5nIFRob21hcydzIHJlcGx5IFsxXQo+Pgo+PiBbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjUwODEzMTI0MzUzLjQwMTVjNDY2QHdpbmRz
dXJmLwo+Pgo+PiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgo+IAo+IE15IGJhZCBmb3IgdGhl
IGFic2VuY2Ugb2YgcmVhY3Rpb24gb24gbXkgc2lkZSwgSSBoYXZlIGJlZW4gb2ZmIGZvciBhIGZl
dwo+IGRheXMsIGFuZCB0aGVuIHRyYXZlbGxpbmcgZm9yIGNvbmZlcmVuY2UuIFRoYW5rcyBmb3Ig
aGFuZGxpbmcgdGhpcyAhCgpObyBwcm9ibGVtLCB0aGFua3MgZm9yIHlvdXIgY29udHJpYnV0aW9u
IGluIHRoZSBmaXJzdCBwbGFjZS4KCkkgbm90aWNlZCBhIG5ldyBpc3N1ZSBpbiBHaXRsYWItQ0kg
dGhhdCBzZWVtcyByZWxhdGVkIHRvIHRoaXMgcGF0Y2ggWzFdCkluZGVlZCwgdGhlIGJhY2twb3J0
ZWQgY29tbWl0IFsyXSBpbnRyb2R1Y2UgYSBidWlsZCBpc3N1ZSB3aXRoIGx1YSA8IDUwMgppbnRl
cnByZXRlcnMgZHVlIHRvIHByb2JhYmx5IGEgY29weSBwYXN0IG9mIHRoaXMgbGluZSAodmFsIGlz
IG5vdCBkZWZpbmVkKToKCiAgbHVhX3B1c2hsc3RyaW5nKEwsIFpTVFJfVkFMKHZhbCksIFpTVFJf
TEVOKHZhbCkpOwoKSSBndWVzcywgd2UgaGF2ZSB0byByZXBsYWNlICJ2YWwiIGJ5ICJtZW1iZXIi
IHNpbmNlIFpTVFJfVkFMIG1hY3JvIHVzZXMgaW50ZXJuYWwKIih6c3RyKS0+dmFsIiAoI2RlZmlu
ZSBaU1RSX1ZBTCh6c3RyKSAgKHpzdHIpLT52YWwpIHRoYXQgc2VlbXMgb25seSBhdmFpbGFibGUg
aW4KIm1lbWJlciIuIEJ1dCBJIG1heSBiZSB3cm9uZy4uLgoKICBsdWFfcHVzaGxzdHJpbmcoTCwg
WlNUUl9WQUwobWVtYmVyKSwgWlNUUl9MRU4obWVtYmVyKSk7CgpXaXRoIHRoYXQgZml4ZWQsIFRl
c3RQaHBMdWFMdWFqaXQgcGFzcy4KCkNhbiB5b3UgaGF2ZSBhIGxvb2s/CgpbMV0gaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMTE3Njc3NDk0MQpbMl0g
aHR0cHM6Ly9naXRodWIuY29tL2JhZG9vL3BocC1sdWEvY29tbWl0L2RlMTA2OGQ2MzQ1MTlhYmYy
NDYxZGFjOTQyN2I1ZmYyNGI2NjAzYWYKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBBbGV4
aXMKPiAKPj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPj4KPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
