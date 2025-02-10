Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C6EC02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 22:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BB9782164;
	Mon, 10 Feb 2025 22:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDSL3GDusZJr; Mon, 10 Feb 2025 22:32:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C94682165
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C94682165;
	Mon, 10 Feb 2025 22:32:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D5F9C2
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 22:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5186360E2C
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 22:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pykc8hFNyTjO for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 22:32:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3931B60E1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3931B60E1E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3931B60E1E
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 22:32:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38dc660b56cso3775713f8f.0
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 14:32:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739226764; x=1739831564;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nlMZ/mkOtnIW2sw8j0hnBT9hpSqMJwQzoWscCMlHHSU=;
 b=PYl//vUzBLtQqWzL+QZCwPzPjUyctbjSEM2DD8hcJfVYMW7/xsZ9Rc4NyC+F+9qha0
 L7cHoYL6gvwU/i4sO8qmVvexuxNCmj/jEf9YBOg/wnZj79ElWwWTia8gTVCPFST/9vS4
 0zXbMefCSe5AYRIF6h+RC2WFvWjoezYUIzHqRtz4es07cH5mEUL+uBIcwOihcVXg1PdI
 RKbJr5tPg+Gcpv1iTH/c5w3y60UUgTHD1SHnmv3FJLA253pbBAWETwJmZfVBDgoKqAQO
 GJIRQd/mAgeSCeK34CuIX5HrPNXkaDwNHPnroYx+EH2Ds6MSBSA+adIIMuwofNgqPwpe
 nKlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvbZhj2cgHfjCBtn2i0xKw1tM5RvYXYzyAT37x9Mw52fknIDAnFeOG4P/dWDB0mxBkWc9Pd0IwDNU=@buildroot.org
X-Gm-Message-State: AOJu0YydjQR0lgIqjZwxNdc7xSl/KzJyHmc09h0c1yATmh971yyTCGir
 Ilmq5h0fKVxqA65NtWDR5JiC9icXXX8/sHGGF8ukSt6QPfPDCdC4nEfYubin+9c=
X-Gm-Gg: ASbGncv1cza8LN/Ku93FNMgtI5br0b7JN0pglQqkweFgfTyA4pTPUk4D2H9lyBDMNlL
 +5577HcKeKr1rBJcAo0GUxAXomCea9wWMK3fUBJ7lnR1knr3nSXot4f0MhUX4TKVFPR7XJYmfaj
 fL3eRxECG1RrtF6wxL5++WrB75TsAzHVGNW03L/Mdm9DvxsWUeCMmwnsnoHEEZSJqm54wtGZEKy
 cIPCwQVwbnKZDCRMllOjx9zE33HtiWnUyd8d4i8FOH5oXb8nqmRAYqy4gO/dJvJBenp99VskYLA
 q5ase4ZiZzYXLjoQ2FVOOBdUShCq8ByZxXboby/LSrfuTTjZ3SSl68LEdhC+5z1xgu17X1Tml1c
 fm5t+geXPPb08a22TdSAtycY5nhRB2DnLDYKjdFj29lHGGbq1gmg=
X-Google-Smtp-Source: AGHT+IHYBaQ0FK2yJJQyaj9Jwt4vmh4nPBYG8uCUtcky4CcmRW6vUIWcbjkQiilG/XgQDkNb2yjtqg==
X-Received: by 2002:a5d:6d87:0:b0:38d:d93b:5899 with SMTP id
 ffacd0b85a97d-38dd93b5a82mr6541825f8f.21.1739226764280; 
 Mon, 10 Feb 2025 14:32:44 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc6b89ef5sm11506835f8f.31.2025.02.10.14.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:32:43 -0800 (PST)
Message-ID: <f638ed96-aa7b-46af-8c5a-1ca9763e41f7@smile.fr>
Date: Mon, 10 Feb 2025 23:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250209112915.401359-1-bernd@kuhls.net>
Content-Language: fr, en-US
In-Reply-To: <20250209112915.401359-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739226764; x=1739831564; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nlMZ/mkOtnIW2sw8j0hnBT9hpSqMJwQzoWscCMlHHSU=;
 b=14loalx67IC1k22lE4xoOcAIMGZdgqfLUhfZNKu76AXWOv9j+tEC0hsK+u3QQ5I5d+
 rZA1CfAiKJ1lNmVRiZ50/sFrhlg+KfYzo1rndpt9ujvrz9zU9HVeULumguMk2UFOyEnG
 ypE0z/hGrk3JrHX8rl9WDFxIvFM4YfN3DW6/c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=14loalx6
Subject: Re: [Buildroot] [PATCH 1/1] package/libcdio: needs host-pkgconf
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

SGVsbG8gQmVybmQsCgpMZSAwOS8wMi8yMDI1IMOgIDEyOjI5LCBCZXJuZCBLdWhscyBhIMOpY3Jp
dMKgOgo+IFdpdGggY29tbWl0Cj4gaHR0cHM6Ly9naXRodWIuY29tL2xpYmNkaW8vbGliY2Rpby9j
b21taXQvMWY5NDY2NGY3NjZlZjY2Yjk5MmUxYzUzYTVlODE3YTM3OTg4ZDg5NAo+IHVwc3RyZWFt
IGFkZGVkIGEgbWFuZGF0b3J5IGRlcGVuZGVuY3kgdG8gcGtnY29uZiBpbiB2ZXJzaW9uIDIuMS4x
LgoKQWN0dWFsbHksIGhvc3QtcGtnY29uZiBzZWVtcyBtaXNzaW5nIHNpbmNlIGl0IHdhcyBhZGRl
ZCBpbnRvIEJ1aWxkcm9vdC4KCmh0dHBzOi8vZ2l0aHViLmNvbS9saWJjZGlvL2xpYmNkaW8vY29t
bWl0LzE0NmJiYTllMWVmYzAyZmVjMmNkZWM2OGZhYjNiMDMzYWRiNTkwZDEKCmh0dHBzOi8vc3Jj
LmZlZG9yYXByb2plY3Qub3JnL3JwbXMvbGliY2Rpby9ibG9iL3Jhd2hpZGUvZi9saWJjZGlvLnNw
ZWMjXzIwCgpodHRwczovL3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9ycG1zL2xpYmNkaW8vYmxvYi81
ZThiMjFhZjIzMWYyMjM3ZTZmNjY3NTk1NTZlYmU4ZTNlODE0OTNiL2YvbGliY2Rpby5zcGVjI18x
NAoKPiAKPiBCdWlsZHJvb3QgYnVtcGVkIGxpYmNkaW8gd2l0aCA5MjBmNDViZDI0NDE2NmM4NDAx
ZGQwNWUwNTRmYzg5NGViYTE0M2JmLAo+IGEgYmFja3BvcnQgaXMgbm90IG5lZWRlZC4KClNvIGEg
YmFja3BvcnQgc2VlbXMgcmVxdWlyZWQgaW5zdGVhZC4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gLS0tCj4g
IHBhY2thZ2UvbGliY2Rpby9saWJjZGlvLm1rIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmNkaW8vbGliY2Rpby5tayBi
L3BhY2thZ2UvbGliY2Rpby9saWJjZGlvLm1rCj4gaW5kZXggYjg0YWUyNzc1OS4uZDRiMjc3YTE1
YiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmNkaW8vbGliY2Rpby5tawo+ICsrKyBiL3BhY2th
Z2UvbGliY2Rpby9saWJjZGlvLm1rCj4gQEAgLTEyLDYgKzEyLDcgQEAgTElCQ0RJT19MSUNFTlNF
ID0gR1BMLTMuMCsKPiAgTElCQ0RJT19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICBMSUJDRElP
X0NQRV9JRF9WRU5ET1IgPSBnbnUKPiAgTElCQ0RJT19DT05GX09QVFMgPSAtLWRpc2FibGUtZXhh
bXBsZS1wcm9ncyAtLWRpc2FibGUtY2RkYgo+ICtMSUJDRElPX0RFUEVOREVOQ0lFUyA9IGhvc3Qt
cGtnY29uZgo+ICAKPiAgaWZlcSAoJChCUjJfRU5BQkxFX0xPQ0FMRSksKQo+ICBMSUJDRElPX0RF
UEVOREVOQ0lFUyArPSBsaWJpY29udgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
