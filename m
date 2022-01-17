Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CD9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 09:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD3F781462;
	Mon, 17 Jan 2022 09:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id coIm3SOw_JA5; Mon, 17 Jan 2022 09:04:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3FCB81460;
	Mon, 17 Jan 2022 09:04:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5919F1BF41A
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 09:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4707181460
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 09:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYQTR34vCbrO for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 09:04:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 464E78145F
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 09:04:35 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so22622303wmo.5
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 01:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bhN/BOKdUu0xc5n3mwJhXHiPO4OQS6FNQl7VYZShIKU=;
 b=VTouK4zInlrXPcHlM5/RhnPqRNWzEDrnKd53KJDT++TN0ogPBBqPL/56KooJweQ7io
 YG/NiUc0SB/Yr2ElonJxI9fStB8VqBrFtK8azSQzHbDx7dLR+RozP0ueqY7nqM+EfD7o
 uCZfPFc8YXcPnYfMqscYCGrLpvM/faPhNaVtpvuk/iLZCYjKrBT2+WBqfJS7jxBnBHBF
 cE34VtfSV1lQx0W+YiGmAzAvBVOicCrPOWxS0vE01TY1ffcJl/Nhh47Lr6B3JP2bsag3
 L0B+Cr4pCCM8n87nHngQPPpsVgwxIVDj8ydYjczT5HpFMJMfD7+Xv0qmltzEIrS0Ifns
 7jeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bhN/BOKdUu0xc5n3mwJhXHiPO4OQS6FNQl7VYZShIKU=;
 b=plmzLW6rvARKyKE+GZpYaUdAL6rfi/9A3EVQIci4H9n54FwJdt/rS/6eotJlUuxQhD
 HbmSnYkjpEuFQmaTWNzee9bBkvsxDkO7zzEhC0LtpefE5AT8J9bp3+4ifwOmRIHgANAr
 jtDoi6k1lBNhlswOFu3Qzx7s4t1UScpCx31YHPhFkskpHRa/a25/DRNGgB9sUWdpaI9F
 AJYen8xZvzIU0GyXWq5/38cPp1sWOqZz99enRJJem0xC42gkPIBqeQNcCoTpF8iyv0wp
 hlJ1cfhkns82kG/fpEKUt7MvRp2BFcDaO4rG6BTBx+1kcSH7Qlv/bgy9In22zM7gxtDU
 KO3g==
X-Gm-Message-State: AOAM532KAKoO+ZwofdtPXhp5cyyf9ocUf6cx3AJUqNFjVWGtMT/kkxgM
 phkKGks0U0qMywD1Sg+RHMMiHg==
X-Google-Smtp-Source: ABdhPJzRn8f2fKrZHakmOBZkdARjEAhAYvvH23IvJ3lfCPt9M8w5KBpX47DXH+8EaA5mRgS/lnsWzQ==
X-Received: by 2002:a5d:4087:: with SMTP id o7mr18449570wrp.189.1642410273401; 
 Mon, 17 Jan 2022 01:04:33 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id g12sm13119633wrm.109.2022.01.17.01.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 01:04:33 -0800 (PST)
Message-ID: <c139bb91-1e00-64b9-0b2e-bb2f57e85a99@smile.fr>
Date: Mon, 17 Jan 2022 10:04:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1616963387.git.yann.morin.1998@free.fr>
 <d41046d49bd9db1ccc30dea7d1f4d8c2310d3536.1616963387.git.yann.morin.1998@free.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <d41046d49bd9db1ccc30dea7d1f4d8c2310d3536.1616963387.git.yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/3] legacy: increase the duration during
 whih we keep legacy symbols
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMjgvMDMvMjAyMSDDoCAyMjozMCwgWWFubiBFLiBNT1JJTiBh
IMOpY3JpdMKgOgo+IE91ciBMVFMgaXMgb25seSBvbmUteWVhciBsb25nIChhY3R1YWxseSwgbW9y
ZSBsaWtlIDEzIG1vcG50aHMpLCB3aGljaAo+IGlzIHN0aWxsIHNlZW4gYXMgdG9vIHNob3J0IGJ5
IHNvbWUsIHdobyBkbyBub3QgaGF2ZSB0aGUgYmFuZHdpZHRoLAo+IHdpbGxpbmduZXNzLCBhbmQv
b3IgY2FwYWJpbGl0eSB0byB1cGRhdGUgb25jZSBhIHllYXIuCj4gCj4gQXMgc3VjaCwgdGhlIDIt
eWVhciByZXRlbnRpb24gZ3VhcmFudGVlIGZvciB0aGUgbGVnYWN5IHN5bWJvbHMsIGlzCj4gb2Z0
ZW4gbm90IGVub3VnaCwgYW5kIHBlb3BsZSBtaXNzIG9uIHRoZW0gd2hlbiBldmVudHVhbGx5IG1p
Z3JhdGluZy4KPiAKPiBGdXJ0aGVybW9yZSwgdGhlIGN1eXN0b21zIHNvIGZhciBoYXMgYmVlbiB0
byBkcm9wIHRoZSBzeW1ib2xzIG9ubHkgYWZ0ZXIKPiBhIDUteWVhciBwZXJpb2QgaGFzIGVsYXBz
ZWQ6Cj4gICAgIGYyODliMWIzNmY1YyAgbGVnYWN5OiBkcm9wIG9wdGlvbnMgcmVtb3ZlZCBtb3Jl
IHRoYW4gNSB5ZWFycyBhZ28gbm93Cj4gICAgIGE1MmUxMDZiYmQwOCAgbGVnYWN5OiByZW1vdmUg
b3B0aW9ucyBtYWRlIGxlZ2FjeSA1IHllYXJzIGFnbwo+ICAgICBhN2Y0OWE5NjkzZDcgIENvbmZp
Zy5pbi5sZWdhY3k6IGRyb3AgMjAxMy4wMiBlbnRyaWVzCj4gCj4gU28sIG1ha2UgdGhlIGN1c3Rv
bXMgdGhlIG5ldyBydWxlOiBpbmNyZWFzZSB0aGUgcmV0ZW5ldGlvbiBwZXJpb2QgdG8gNQo+IHll
YXJzLgoKSSdtIGF3YXJlIG9mIHNvbWUgcHJvamVjdHMgdXNpbmcgYW4gb3V0IG9mIGRhdGUgQnVp
bGRyb290IHZlcnNpb24gZnJvbSAyMDEyIGFuZAoyMDE2LiBCdXQgc3dpdGNoaW5nIGJldHdlZW4g
QnVpbGRyb290IDIwMTIgdG8gQnVpbGRyb290IDIwMjIgcmVxdWlyZXMgYSBjb21wbGV0ZQpyZXdv
cmssIG5vdCBqdXN0IHVwZGF0aW5nIHRoZSBCdWlsZHJvb3QgZGVmY29uZmlnIHRvIHJlbW92ZSBs
ZWdhY3kgb3B0aW9uLgoKSXMgcmVhbGx5IGEgYmVuZWZpdCB0byByZW1vdmUgdGhlc2VzIGxlZ2Fj
eSBjb25maWcgPwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFJlcG9ydGVkLWJ5OiBUaG9t
YXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+IC0tLQo+ICBDb25m
aWcuaW4ubGVnYWN5IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvQ29uZmlnLmluLmxlZ2FjeSBiL0NvbmZpZy5p
bi5sZWdhY3kKPiBpbmRleCA4ZWJiYzRjMjk1Li45NjdiNjdlMDNlIDEwMDY0NAo+IC0tLSBhL0Nv
bmZpZy5pbi5sZWdhY3kKPiArKysgYi9Db25maWcuaW4ubGVnYWN5Cj4gQEAgLTYsNyArNiw3IEBA
Cj4gICMgVGhpcyB3aWxsIG1ha2UgdGhlIHRyYW5zaXRpb24gZm9yIHRoZSB1c2VyIG1vcmUgY29u
dmVuaWVudC4KPiAgIwo+ICAjIFdoZW4gYWRkaW5nIGxlZ2FjeSBzeW1ib2xzIHRvIHRoaXMgZmls
ZSwgYWRkIHRoZW0gdG8gdGhlIGZyb250LiBUaGUgb2xkZXN0Cj4gLSMgc3ltYm9scyB3aWxsIGJl
IHJlbW92ZWQgYWdhaW4gYWZ0ZXIgYWJvdXQgdHdvIHllYXJzLgo+ICsjIHN5bWJvbHMgd2lsbCBi
ZSByZW1vdmVkIGFnYWluIGFmdGVyIGF0IGxlYXN0IGZpdmUgeWVhcnMuCj4gICMKPiAgIyBUaGUg
c3ltYm9sIHNob3VsZCBiZSBjb3BpZWQgYXMtaXMgZnJvbSB0aGUgcGxhY2Ugd2hlcmUgaXQgd2Fz
IHByZXZpb3VzbHkKPiAgIyBkZWZpbmVkLCBidXQgdGhlIGhlbHAgdGV4dCBzaG91bGQgYmUgcmVt
b3ZlZCBvciByZXBsYWNlZCB3aXRoIHNvbWV0aGluZyB0aGF0Cj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
