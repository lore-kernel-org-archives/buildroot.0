Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4016BC10F16
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 21:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A5E7400D2;
	Tue, 30 Apr 2024 21:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_SuzaP9IaLX; Tue, 30 Apr 2024 21:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 154AD40179
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 154AD40179;
	Tue, 30 Apr 2024 21:41:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9257C1BF2CF
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F12A40179
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVWOs9VPStkj for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 21:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64288400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64288400D2
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64288400D2
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 21:41:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34d7a32bdd3so767561f8f.0
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 14:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714513275; x=1715118075;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NsmyuWOO+CG0sN88EZs/LiKqFwc10L1taJRXZhrvoHc=;
 b=X0N/oCd5N4dLPPULKOz4B+ObF0qXai/VrS/kEfrFulmO65+hTaU2c2X5COpANodIJR
 YmuAXSuW/3XiJgGyB7+dxYH9TmAv8KvjhscBufPedgwwNHIJmx0JP8yc/OjIGF9IlYqT
 GhrpYWXlac/vkC+E77bzcjTnm41vJPLlEdqK9pwspPpGlQabhmMnFE9Z6lJWscuZUR+0
 eBKrulm4gVWBgDLdOqFmJtqSSjRPTXZgCvBnTXq9sjbogG7wxWLAxmRdRnzSmluv2Pog
 b1lE0rI4VFDzysQ1eGCuDYf1vsHhq9D/KLTdTPDgJn+gYJ6YTR/Gkp9XToa6CxVrls3o
 QOrA==
X-Gm-Message-State: AOJu0YzDPap8vUXeLsb96TsPDhDXwSKehmzp16bJV39dgmPFZ0dsaERp
 8Ne+VfZcGS+jmo8TQ9CHfcfwlshwNOoQttneuPOfhoUVdSJdy9yGW1VIv+2XC8xNdNhdpxw2ajY
 /
X-Google-Smtp-Source: AGHT+IGz8uBtxS2E1LLkUn4VQcvqrapaTLB9v08/13m799fWeVMXRFEj7CphVMS9tnEn6DHdy3XQbg==
X-Received: by 2002:adf:fd06:0:b0:34a:56e7:5cc4 with SMTP id
 e6-20020adffd06000000b0034a56e75cc4mr489335wrr.2.1714513275205; 
 Tue, 30 Apr 2024 14:41:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a056000184500b0034d1fe44278sm4792189wri.39.2024.04.30.14.41.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 14:41:14 -0700 (PDT)
Message-ID: <cf8d7018-75b3-4446-b452-aca634733d2a@smile.fr>
Date: Tue, 30 Apr 2024 23:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240424195943.527542-1-romain.naour@smile.fr>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240424195943.527542-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714513275; x=1715118075;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NsmyuWOO+CG0sN88EZs/LiKqFwc10L1taJRXZhrvoHc=;
 b=q24JmySk4XudCaVWU1aUWcpZQpDs6vEEooGhL3bt9ricWFqXgOlbW3yeKmo+4zLL5h
 KpsALiVtL7yXEGoMJ2L15ggH47J6Q2oeog1NzRJLAmaB5bz7QZbcn3tXiZJzHRIQ3ms9
 vbwHKflOJHe/HTWXkJPUpfD26HAZgSYHlFA9SPafa/lftOBD5nrdZlKjldHSoJbv3DaH
 C8uliLGqCQZwPdWnQmaEROE1X8xlXzEY0FiFqTvB8n8pYx5rurqpkgsiXJUCYJcKoBnR
 1ukplCMC4ps9Rc7TCAnt7ol9ku1kNQwQieQpiwnY6ppk7RVUWJQnToAsQhPeFUoxktR9
 wf4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=q24JmySk
Subject: Re: [Buildroot] [PATCH] support/testing: TestATFAllwinner: add
 missing openssl dependency
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

TGUgMjQvMDQvMjAyNCDDoCAyMTo1OSwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gVGhlIGNv
bW1pdCBbMV0gdXBkYXRlZCB0aGUgdS1ib290IHZlcnNpb24gd2l0aCB0aGUgb25lIHVzZWQgYnkK
PiBvcmFuZ2VwaV96ZXJvX3BsdXMyX2RlZmNvbmZpZyBidXQgdGhlIGRlcGVuZGVuY3kgb24gb3Bl
bnNzbAo+IHdhcyBmb3Jnb3R0ZW4uCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy82NzAzMjIxODY4Cj4gCj4gWzFdIGViMTYxNDhk
ZGRjNmJlMzliMGQ4NTAxODFjMjQ2MWZkYWJhMWVlNmYKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb21h
aW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiAtLS0KPiAgc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL2Jvb3QvdGVzdF9hdGYucHkgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9ib290L3Rlc3Rf
YXRmLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9hdGYucHkKPiBpbmRleCAz
NTI3MjVlNzIxLi5iMGU3Njk2ZTg2IDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9ib290L3Rlc3RfYXRmLnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVz
dF9hdGYucHkKPiBAQCAtMTksNiArMTksNyBAQCBjbGFzcyBUZXN0QVRGQWxsd2lubmVyKGluZnJh
LmJhc2V0ZXN0LkJSVGVzdCk6Cj4gICAgICAgICAgQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVS
U0lPTl9WQUxVRT0iMjAyMy4xMCIKPiAgICAgICAgICBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RF
RkNPTkZJRz0ib3JhbmdlcGlfemVyb19wbHVzMiIKPiAgICAgICAgICBCUjJfVEFSR0VUX1VCT09U
X05FRURTX0RUQz15Cj4gKyAgICAgICAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMPXkK
PiAgICAgICAgICBCUjJfVEFSR0VUX1VCT09UX05FRURTX1BZVEhPTjM9eQo+ICAgICAgICAgIEJS
Ml9UQVJHRVRfVUJPT1RfTkVFRFNfUFlMSUJGRFQ9eQo+ICAgICAgICAgIEJSMl9UQVJHRVRfVUJP
T1RfTkVFRFNfQVRGX0JMMzE9eQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
