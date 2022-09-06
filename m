Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20923ECAAD5
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 12:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACC9940BC4;
	Tue,  6 Sep 2022 12:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACC9940BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjCNSCJVv2YY; Tue,  6 Sep 2022 12:03:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E760740BD1;
	Tue,  6 Sep 2022 12:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E760740BD1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5051BF366
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 12:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33770404B5
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 12:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33770404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LlD0k6zdXVp7 for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 12:03:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0131400DD
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0131400DD
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 12:03:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso7286999wmr.3
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 05:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JwqHi3jSLNSCvOjlcvryb4p9jqP8lPqKmLWmsrtlXyI=;
 b=6qP7mQUJBTQeCfTPAzlhooRgbZeKLSxUAO7YMRlUpPi+07++6oZJ37pgtfsrgU+k3m
 KJK7+MRVUf+6rvLgzR46kbyAyW1Ux2QkZtUc/FTCjzghpw3PcX/tEjdj2a/ffnJZLm7P
 AoBd96gPjkfHHctVKvsMbnTc7E7VFNaPh2JXJZ141N1LOCRjKKxykQ2IsFoYnZXsu1Hv
 Dq1i4s4SBWnLxjMog7shBtNbP2jJ9vfwcVh7pQa+Q2wHeks7q3AlWk+FDjs9M0fo+FLx
 XSw6bw0wAqAQntDgJZrkGmCl/BJmxekgX58qVDCzN9Jfj5p7zydTN6TAYgz7G1ElwflH
 +TRQ==
X-Gm-Message-State: ACgBeo1P4ANqLlb7TBQEFzi9a/3lxZtqGp1qJHcru3XSVlNzljMhpOuo
 BcTxptGGhVpvXTgvbQCTpJOtNg==
X-Google-Smtp-Source: AA6agR6Y2JMYgIIoR+Yt+GhqkMAhrNA1iup/oR7lC1BGiz2qiJC7TmHuSYAdXVud34//SS00OWYRog==
X-Received: by 2002:a7b:c8c1:0:b0:3a5:bb57:e7a9 with SMTP id
 f1-20020a7bc8c1000000b003a5bb57e7a9mr13589246wml.18.1662465794087; 
 Tue, 06 Sep 2022 05:03:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a05600c0a4800b003a5f3f5883dsm23814315wmq.17.2022.09.06.05.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 05:03:13 -0700 (PDT)
Message-ID: <aeb0044d-d77e-ff3e-fc38-599feec17807@smile.fr>
Date: Tue, 6 Sep 2022 14:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>, Joel Stanley <joel@jms.id.au>
References: <20220904144233.2795176-1-romain.naour@gmail.com>
 <20220906102546.GW1490660@scaer> <20220906104200.GX1490660@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220906104200.GX1490660@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=JwqHi3jSLNSCvOjlcvryb4p9jqP8lPqKmLWmsrtlXyI=;
 b=FhHYswNtwvoUTWwvSFUFy7n146DurnDH+Bz6PXJk9JfDijXLSvon9FPBmSwg+FCZ+V
 HU+2HNaEWvRfZihc77avFg/DLnHebEYgplIUkcm4NpAelPXxsbAtf10evW7ZcjSpqn2h
 PaiwwBD7V1oL5jHWCdr08UEw+sk4YSVHvnW7bBeevTJiKhIXhPsZahJK8ERuNs8PZznj
 0xEIT/B+Hnu9HY4igSP3/agPP4nooX8bMsopBdWBbglScSNbgDW1InTEKtH2uEcJ7iuM
 YpHVrktB6cNl+7yANxiNuREWFV16SXO/wBDJAeeZkXcvlPekCBIaogXOU8tbljGPvKxC
 /m7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=FhHYswNt
Subject: Re: [Buildroot] [PATCH for-next] configs: remove uClibc config
 options
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDYvMDkvMjAyMiDDoCAxMjo0MiwgWWFubiBFLiBNT1JJTiBhIMOpY3JpdMKgOgo+IFJvbWFp
biwgQWxsLAo+IAo+IE9uIDIwMjItMDktMDYgMTI6MjUgKzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bh
a2UgdGh1c2x5Ogo+PiArSm9lbCBmb3IgUFBDIGlzc3Vlcywgc2VlIGJlbG93Li4uCj4gCj4gRm9y
IHJlYWwgdGhpcyB0aW1lLi4uIEpvZWwsIGNvdWxkIHlvdSBzZWUgYmVsb3csIHRoZXJlJ3MgYSBx
dWVzdGlvbgo+IGFib3V0IHBwYzY0OiB3ZSByZW1vdmVkIGJpbnV0aWxzIDIuMzYgcmVjZW50bHks
IHNvIGFsbCBkZWZjb25maWdzIHRoYXQKPiB5b3UgY2hhbmdlZCBpbiAxOTM1NDdmZGE0NjcgYXJl
IGFmZmVjdGVkLgo+IAo+PiBPbiAyMDIyLTA5LTA0IDE2OjQyICswMjAwLCBSb21haW4gTmFvdXIg
c3Bha2UgdGh1c2x5Ogo+ICBbLS1TTklQLS1dCj4+IFRoZXJlIGFyZSBzdGlsbCBhIGZldyBidWls
ZCBmYWlsdXJlczoKPj4gICAgIGh0dHBzOi8vZ2l0bGFiLmNvbS95bW9yaW4vYnVpbGRyb290Ly0v
am9icy8yOTg0NzQ0MzU2Cj4+ICAgICBodHRwczovL2dpdGxhYi5jb20veW1vcmluL2J1aWxkcm9v
dC8tL2pvYnMvMjk4NDc0NDM1Nwo+PiAgICAgaHR0cHM6Ly9naXRsYWIuY29tL3ltb3Jpbi9idWls
ZHJvb3QvLS9qb2JzLzI5ODQ3NDQzNTkKPj4gICAgIGh0dHBzOi8vZ2l0bGFiLmNvbS95bW9yaW4v
YnVpbGRyb290Ly0vam9icy8yOTg0NzQ0MzYyCj4+ICAgICAtLT4gTWlzc2luZzogQlIyX0JJTlVU
SUxTX1ZFUlNJT05fMl8zNl9YPXkKPj4gICAgIC0tPiBhbGwgb24gcHBjNjQgb3IgcHBjNjRsZQo+
PiBUaGUgYmludXRpbHMgb25lLCBob3dldmVyLCBpcyBub3QgZHVlIHRvIHRoZSBzd2l0Y2ggdG8g
Z2xpYmMuIFdlIHNpbXBseQo+PiByZW1vdmVkIGJpbnV0aWxzIDIuMzYueCBlYXJsaWVyIGluIEF1
Z3VzdC4uLiBXaGF0IHNob3VsZCB3ZSBkbz8gSm9lbCwKPj4gYW55IGlkZWE/CgpGaXhlczoKK0pv
ZWwgaW4gQ2MKCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBN
T1JJTi4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
