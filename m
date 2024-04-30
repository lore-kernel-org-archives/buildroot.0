Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5FDC10F16
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 21:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AB3341564;
	Tue, 30 Apr 2024 21:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nN_0HDdYCuZ3; Tue, 30 Apr 2024 21:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3036A41578
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3036A41578;
	Tue, 30 Apr 2024 21:43:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEF3F1BF2CF
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC07541578
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFM-PAnMC6Fl for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 21:43:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79C594157A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79C594157A
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79C594157A
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 21:43:25 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41a1d2a7b81so1449885e9.0
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 14:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714513403; x=1715118203;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xKJSBF0tjTFbm8pjBiJ0xpV3y/TwWijXZTx0xMhFpbk=;
 b=hqOMjPWYFpEk+9KdLTOBV333Gz7oNID+K5WJOmAuM4nc54Y3bgkCoXq58x4SnXGitq
 5l2eHL0LY/0MZd4WatKkzxUAXFGjVeScM81JcdZw5eJTDSHIsVsYkNzYrwYiI8y8xKIf
 rV177vhGPG6O2bNjHR5LdHh62i8nk0L4unOr0XELZTQYgT3jsAComi5gQP4XbChHWWZ4
 SKMN0Sse13V3nzd1FdQ/8lpx4gsgeekXPbUIBb39vBMHnooZvvIzpGLyq001HyKoCmB5
 nQJ1JDRXZmblUVIgmtBraMP4QvDnK/ncnUXFnMN5aow6PiwDOHJuNlu5dZo7/yNazAyt
 SzkQ==
X-Gm-Message-State: AOJu0YzzVxwUpJkzbU/z/76NlVSmPUBMB/pLA6OaZDwPxu4tguc0G1HY
 eHNHovBSuyIX9rbVcHoW1/u/Bj1N2rxlCe1MyC688htETpSnsWK7O3ZBq57Fzzjd8uVcRw4NmjX
 b
X-Google-Smtp-Source: AGHT+IGOd3KU0rORRjDrAgn1GvI3zN2HPKT/4hT69Jl6gwAc5ztIU2CNEyJel6MFa/uHZfE2iFw4Jg==
X-Received: by 2002:a05:6000:1092:b0:34c:cae0:c989 with SMTP id
 y18-20020a056000109200b0034ccae0c989mr770159wrw.33.1714513403473; 
 Tue, 30 Apr 2024 14:43:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a5d64c1000000b0034d24477662sm2341913wri.8.2024.04.30.14.43.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 14:43:23 -0700 (PDT)
Message-ID: <8e7d8f0d-b74f-474c-a84e-1cf9ea1167b9@smile.fr>
Date: Tue, 30 Apr 2024 23:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240418101529.124290-1-romain.naour@smile.fr>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240418101529.124290-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714513403; x=1715118203;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xKJSBF0tjTFbm8pjBiJ0xpV3y/TwWijXZTx0xMhFpbk=;
 b=Km7Uad8658PyxPJ8kGB6hNyfIhy7He28bnWEN+grCl1Q2hr9uhKaQLUInnOsmyIPIS
 r9FXvSvDjJNTODdI1u1fC3th8nSlowFC1KnjpkNLJo/d79q6oyGBcO5rCxW1CRaOgvCC
 yUJcyTbC1bqyr5LLH+I7WG97QboazeZ+qxd0En1o3P8p9a+KfSKw44rEBi1h523xRHXL
 bwwJuK/nho4BReI2KWwt6jlw9SJA9nBo31QzFVXu+pWxt5qeMHv5SE3Jdf4gGERs1ojc
 gfee+9sqwsCBkBjV6ue29JyCL+2uiNzLhnz4MwQdYStY73zqlclS6ej3R2NP0dmr9xB1
 A5WQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Km7Uad86
Subject: Re: [Buildroot] [PATCH] package/openssh: add libxcrypt optional
 dependency for sshd
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTgvMDQvMjAyNCDDoCAxMjoxNSwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gV2hlbiBn
bGliYyB3YXMgYnVtcGVkIHRvIHZlcnNpb24gMi4zOSBpbiBjb21taXQKPiBiNTY4MGY1M2Q2MGFj
ZjhmZjYwMTAwODJmODczNDM4YTM5YmQ1ZDk3IGl0IHJlbW92ZWQgdGhlIGRlcHJlY2F0ZWQKPiBs
aWJjcnlwdCBzdXBwb3J0Lgo+IAo+IEFzIGdsaWJjJ3MgbGliY3J5cHQgd2FzIHByb3ZpZGluZyBz
c2hkJ3MgbGliY3J5cHQgZGVwZW5kZW5jeSB0aGlzIGJyb2tlCj4gdGhlIHNzaGQgcGFzc3dvcmQg
YXV0aGVudGlmaWNhdGlvbiBhdCBydW50aW1lIHVzaW5nIGdsaWJjIHZlcnNpb24gMi4zOS4KPiAK
PiAgICMgc3NocGFzcyAtcCB0ZXN0cHdkIHNzaCAtb1N0cmljdEhvc3RLZXlDaGVja2luZz1ubyBs
b2NhbGhvc3QgL2Jpbi90cnVlCj4gICBQZXJtaXNzaW9uIGRlbmllZCwgcGxlYXNlIHRyeSBhZ2Fp
bi4KPiAKPiBXaXRob3V0IGxpYmNyeXB0LCBPcGVuU1NIID49IDYuMiBmYWxsIGJhY2sgdG8gdXNp
bmcgb3BlbnNzbCdzIERFU19jcnlwdAo+IGZ1bmN0aW9uIG9uIHBsYXRvcm1zIHRoYXQgZG9uJ3Qg
aGF2ZSBhIG5hdGl2ZSBjcnlwdCgpIGZ1bmN0aW9uIFsxXS4KPiAKPiBOb3RlIHRoYXQgREVTX2Ny
eXB0IGlzIGRlcHJlY2F0ZWQgc2luY2Ugb3BlbnNzbCAzLjAgWzJdIFszXS4KPiAKPiAiVXNlIG9m
IHRoZSBsb3cgbGV2ZWwgREVTIGZ1bmN0aW9ucyBoYXMgYmVlbiBpbmZvcm1hbGx5IGRpc2NvdXJh
Z2VkIGZvciBhCj4gIGxvbmcgdGltZS4gV2Ugbm93IGZvcm1hbGx5IGRlcHJlY2F0ZSB0aGVtLgo+
IAo+ICBBcHBsaWNhdGlvbnMgc2hvdWxkIGluc3RlYWQgdXNlIHRoZSBFVlAgQVBJcywgZS5nLiBF
VlBfRW5jcnlwdEluaXRfZXgsCj4gIEVWUF9FbmNyeXB0VXBkYXRlLCBFVlBfRW5jcnlwdEZpbmFs
X2V4LCBhbmQgdGhlIGVxdWl2YWxlbnRseSBuYW1lZCBkZWNyeXB0Cj4gIGZ1bmN0aW9ucy4iCj4g
Cj4gQWxzbyBERVNfY3J5cHQgaXMgcHJvdmlkZWQgYnkgb3BlbnNzbCBvbmx5IGlmCj4gQlIyX1BB
Q0tBR0VfTElCT1BFTlNTTF9FTkFCTEVfREVTIGlzIGVuYWJsZWQuIE90aGVyd2lzZSBjcnlwdCgp
IGlzCj4gbmV2ZXIgZGVmaW5lZDoKPiAKPiAgIHNkLWNvbXBhdC5hKHhjcnlwdC5vKTogaW4gZnVu
Y3Rpb24gYHhjcnlwdCc6Cj4gICB4Y3J5cHQuYzooLnRleHQrMHg0OCk6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYGNyeXB0Jwo+IAo+IEl0J3Mgbm90IGNsZWFyIHdoeSB0aGUgcGFzc3dvcmQgYXV0
aGVudGlmaWNhdGlvbiBmYWlsIHdpdGggb3BlbnNzbCdzCj4gREVTX2NyeXB0IGJ1dCBzaW5jZSBp
dCdzIGRlcHJlY2F0ZWQgd2UgdXNlIGxpYnhjcnlwdCB0byBwcm92aWRlCj4gYSB3b3JraW5nIGNy
eXB0KCkgZnVuY3Rpb24gZm9yIGdsaWJjIGJhc2VkIHRvb2xjaGFpbnMuCj4gCj4gWzFdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuc3NoL29wZW5zc2gtcG9ydGFibGUvYmxvYi9WXzlfNy9vcGVuYnNk
LWNvbXBhdC94Y3J5cHQuYyNMNTcKPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5zc2wvb3Bl
bnNzbC9jb21taXQvYzZmZWM4MWI4ODEzMWQwOGMxMDIyNTA0Y2NmNmVmZmE5NTQ5N2FmYgo+IFsz
XSBodHRwczovL3d3dy5vcGVuc3NsLm9yZy9kb2NzL21hbjMuMi9tYW4zL0RFU19jcnlwdC5odG1s
Cj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vam9icy82NjIzNDAyMTQ3Cj4gCj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21h
aW4ubmFvdXJAc21pbGUuZnI+Cj4gLS0tCj4gIHBhY2thZ2Uvb3BlbnNzaC9Db25maWcuaW4gIHwg
MSArCj4gIHBhY2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rIHwgNSArKysrKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zc2gv
Q29uZmlnLmluIGIvcGFja2FnZS9vcGVuc3NoL0NvbmZpZy5pbgo+IGluZGV4IDA4ZDNjN2QzOTEu
LjI1ODQzNDQ3YTcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9vcGVuc3NoL0NvbmZpZy5pbgo+ICsr
KyBiL3BhY2thZ2Uvb3BlbnNzaC9Db25maWcuaW4KPiBAQCAtMjIsNiArMjIsNyBAQCBjb25maWcg
QlIyX1BBQ0tBR0VfT1BFTlNTSF9DTElFTlQKPiAgY29uZmlnIEJSMl9QQUNLQUdFX09QRU5TU0hf
U0VSVkVSCj4gIAlib29sICJzZXJ2ZXIiCj4gIAlkZWZhdWx0IHkKPiArCXNlbGVjdCBCUjJfUEFD
S0FHRV9MSUJYQ1JZUFQgaWYgQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDCj4gIAloZWxwCj4gIAkg
IFNlcnZlciBwcm9ncmFtczogc3NoZCwgc2Z0cC1zZXJ2ZXIKPiAgCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rIGIvcGFja2FnZS9vcGVuc3NoL29wZW5zc2gubWsKPiBp
bmRleCBmMGI0OTk1OTBhLi5kN2Y0ZGI1OWNhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvb3BlbnNz
aC9vcGVuc3NoLm1rCj4gKysrIGIvcGFja2FnZS9vcGVuc3NoL29wZW5zc2gubWsKPiBAQCAtNDUs
NiArNDUsMTEgQEAgZW5kaWYKPiAgCj4gIE9QRU5TU0hfREVQRU5ERU5DSUVTID0gaG9zdC1wa2dj
b25mIHpsaWIgb3BlbnNzbAo+ICAKPiArIyBjcnlwdCgpIGluIGxpYmNyeXB0IG9ubHkgcmVxdWly
ZWQgZm9yIHNzaGQuCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfT1BFTlNTSF9TRVJWRVIpJChCUjJf
UEFDS0FHRV9MSUJYQ1JZUFQpLHl5KQo+ICtPUEVOU1NIX0RFUEVOREVOQ0lFUyArPSBsaWJ4Y3J5
cHQKPiArZW5kaWYKPiArCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfQ1JZUFRPREVWX0xJTlVYKSx5
KQo+ICBPUEVOU1NIX0RFUEVOREVOQ0lFUyArPSBjcnlwdG9kZXYtbGludXgKPiAgT1BFTlNTSF9D
T05GX09QVFMgKz0gLS13aXRoLXNzbC1lbmdpbmUKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3Mu
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
