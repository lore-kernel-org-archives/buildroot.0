Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F15C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 21:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D73B400D2;
	Tue, 30 Apr 2024 21:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfSUauD-UPc6; Tue, 30 Apr 2024 21:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 329DE40179
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 329DE40179;
	Tue, 30 Apr 2024 21:42:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A9BE1BF2CF
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8795140179
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1bwMAWzYbCx for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 21:42:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72A11400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72A11400D2
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72A11400D2
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 21:42:55 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-347e635b1fcso4732107f8f.1
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 14:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714513373; x=1715118173;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t+YykbNVblJZcW9VIydoj4ycc+tTo2r8LHcTEe+Z8d0=;
 b=syATNxhXVAj4q6aVbYpopSmGJ8G1sC0rPM34GUC2D5VC1rGxbuZSbjxvj4N5nREMN6
 p6+VZu38FxUwt+VgvTIxYIyrvQhIYlLQaaHwCn8jOhFwdJ+YuxzIp9Ekx5OJRaTlzVEo
 JakrZYjqoOUjCii+Gzupw/GWQE3EFGAsCIEqPfcjvGUiJRPDZJYKGns7j6kDnOLZVHfd
 bonzrqJR83Cv35m9HR3avrltzY1l1u9wfVm23zBB5yywQ511rKFyuDXBo+QaoYpCc+pN
 JPc5zvRAR1yM7OPJQ6EIHCyYkFGp1tT0E1uyROsusbBjae49EdiVxIvxuk43gG7qThRT
 o2ow==
X-Gm-Message-State: AOJu0Yy/8B4ct/oRAChyOjnOx9OPILY6otXU36KiYiCwihP1U0TsuA/+
 nU0+t5fwG3dIvCvtSOrdJ1k93trOG6fwDu4K0p3f8XijBYU+g0mon6Rd6ZqimttPw+TFeal56pZ
 B
X-Google-Smtp-Source: AGHT+IEYi/gR/yejZwNDNzVqTLOlgkQxEBC5hTXqdz78ggjPjNgwxv27kEBK9IIQDASJPPfat2i/mw==
X-Received: by 2002:adf:a2d0:0:b0:34b:1f34:9c06 with SMTP id
 t16-20020adfa2d0000000b0034b1f349c06mr561656wra.24.1714513373116; 
 Tue, 30 Apr 2024 14:42:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 e26-20020adfa45a000000b0034dac7e5f7bsm1272000wra.50.2024.04.30.14.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 14:42:52 -0700 (PDT)
Message-ID: <c7a4b9f6-153d-4a34-a8d1-629db3c45e89@smile.fr>
Date: Tue, 30 Apr 2024 23:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240424123809.406447-1-romain.naour@smile.fr>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240424123809.406447-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714513373; x=1715118173;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t+YykbNVblJZcW9VIydoj4ycc+tTo2r8LHcTEe+Z8d0=;
 b=ssbmg1ZnZb0W4H72JOpuR/CsXfr/BbP1uRM6GvyVuFnJkyFJMawD6ikx6wEAfN48nv
 ZFuAL2N5ZRe4ks6jdOpGtkyKpNAP9mmDhiQqr+3OZcIIWvV+9F9vc72pwieuZeh7mK2n
 9wvYIL6w7r47KiPkBjTm9JoEZgesWFNtBFzVeAzzBFGqgHv3K5eCXxmfvso5meLO1i+w
 429frjcGC3j+kUJLftEajeyywOCMZU0VfwGDqSAzKrOrJYpw4V4l73H487cWZs3ndvAu
 RBnQoCgtXgWqOJzkrusQxrXBlEtnpGF/CQNlHaLPamtouIPoKpS5stMathA/daBd13rH
 SP4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ssbmg1Zn
Subject: Re: [Buildroot] [PATCH 1/2] configs/qemu_arm_{versatile,
 vexpress}_defconfig: update devicetree path
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

TGUgMjQvMDQvMjAyNCDDoCAxNDozOCwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gVGhlIGxh
c3Qga2VybmVsIHZlcnNpb24gYnVtcCBicm9rZSBxZW11IEFSTSBkZWZjb25maWdzIFsxXSBzaW5j
ZQo+IGFsbCBkZXZpY2V0cmVlIHdoZXJlIG1vdmVkIHRvIHRvIHZlbmRvciBzdWItZGlyZWN0b3Jp
ZXMgaW4gNi41IFsyXS4KPiAKPiBbMV0gOTk4MmUwYjVhNiAoImNvbmZpZ3MvcWVtdTogdXBkYXRl
IGRlZmNvbmZpZ3MgdG8gTGludXggNi42LjE4IikKPiBbMl0gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lkPTcy
NGJhNjc1MTUzMjA1NWRiNzU5OTJmYzZhZTIxYzNlMzIyZTk0YTcKPiAKPiBGaXhlczoKPiBodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzY2NTUxMTk4ODgg
KHFlbXVfYXJtX3ZlcnNhdGlsZV9kZWZjb25maWcpCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy82NjU1MTE5ODkwIChxZW11X2FybV92ZXhwcmVzc19k
ZWZjb25maWcpCj4gCj4gUmVwb3J0ZWQtYnk6IFdhbGRlbWFyIEJyb2Rrb3JiIG9uIElSQwo+IENj
OiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+IC0tLQo+ICBjb25maWdzL3FlbXVf
YXJtX3ZlcnNhdGlsZV9kZWZjb25maWcgfCAyICstCj4gIGNvbmZpZ3MvcWVtdV9hcm1fdmV4cHJl
c3NfZGVmY29uZmlnICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9hcm1fdmVyc2F0
aWxlX2RlZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9hcm1fdmVyc2F0aWxlX2RlZmNvbmZpZwo+IGlu
ZGV4IDJjNzMwOTBkNWQuLmE0OGU0MzcyNzggMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9xZW11X2Fy
bV92ZXJzYXRpbGVfZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy9xZW11X2FybV92ZXJzYXRpbGVf
ZGVmY29uZmlnCj4gQEAgLTI0LDcgKzI0LDcgQEAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVS
U0lPTl9WQUxVRT0iNi42LjE4Igo+ICBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0idmVyc2F0
aWxlIgo+ICBCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0iYm9hcmQvcWVt
dS9hcm0tdmVyc2F0aWxlL2xpbnV4LmZyYWdtZW50Igo+ICBCUjJfTElOVVhfS0VSTkVMX0RUU19T
VVBQT1JUPXkKPiAtQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9InZlcnNhdGlsZS1w
YiIKPiArQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImFybS92ZXJzYXRpbGUtcGIi
Cj4gIAo+ICAjIGhvc3QtcWVtdSBmb3IgZ2l0bGFiIHRlc3RpbmcKPiAgQlIyX1BBQ0tBR0VfSE9T
VF9RRU1VPXkKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X2FybV92ZXhwcmVzc19kZWZjb25m
aWcgYi9jb25maWdzL3FlbXVfYXJtX3ZleHByZXNzX2RlZmNvbmZpZwo+IGluZGV4IDEyZWMzM2Vk
N2EuLjQzOWMyOTk3NTIgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9xZW11X2FybV92ZXhwcmVzc19k
ZWZjb25maWcKPiArKysgYi9jb25maWdzL3FlbXVfYXJtX3ZleHByZXNzX2RlZmNvbmZpZwo+IEBA
IC0yOCw3ICsyOCw3IEBAIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+ICBCUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjYuMTgiCj4gIEJSMl9MSU5VWF9L
RVJORUxfREVGQ09ORklHPSJ2ZXhwcmVzcyIKPiAgQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9S
VD15Cj4gLUJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJ2ZXhwcmVzcy12MnAtY2E5
Igo+ICtCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYXJtL3ZleHByZXNzLXYycC1j
YTkiCj4gIAo+ICAjIGhvc3QtcWVtdSBmb3IgZ2l0bGFiIHRlc3RpbmcKPiAgQlIyX1BBQ0tBR0Vf
SE9TVF9RRU1VPXkKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
