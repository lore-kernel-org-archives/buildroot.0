Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CFAEE14DC
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 11:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57E4841BD5;
	Thu,  7 Sep 2023 11:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57E4841BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDtLHWCQgNJI; Thu,  7 Sep 2023 11:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53F5C41C3F;
	Thu,  7 Sep 2023 11:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F5C41C3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63C361BF41A
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 11:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4998C40529
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 11:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4998C40529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMKflR0xcTHy for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 11:02:59 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F51B40489
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 11:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F51B40489
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99c93638322so165748366b.1
 for <buildroot@buildroot.org>; Thu, 07 Sep 2023 04:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694084577; x=1694689377;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PxKxi5DVdiVzWYidhtyrWjuuiyj2L6NUi/F626Scgd0=;
 b=j6miv065YV1O4wDOYx3jYyPHtIAFfkAAjSBUabWZEiybviuYtvRg51uvi6Ctal4E8s
 qM2fHJ6ilLxuGwf/mVL6Bu19aWZyy3JgUYBL1M+6CWMkiVB/rP9Kdbz1NSLERN4pfPIH
 87ZFDEvoKD8CORqQyfRBqYqLMHJvOT5n6vxe52Jv6IXrggp6tdRCAkpCZRIP6KV04dgL
 KfuGCe2FgQm0D55B2k2owRJJaIyma5PtBrfMjOO4IKdi70VhQC1d9RgvpA+GYYvMKhp7
 VTHAMs0boDRvCbCp9fOPnrLJvvfrJ2TtvnFqrZKr3OcXEMzgJq19fYREJYnEHJg06prA
 +oNw==
X-Gm-Message-State: AOJu0YxDiC8Shb9bf4dT3niTIc70TmDm6+wqGGyUKAZXpi95/1jpLoJg
 p9buNKWub7rZJxygKMkGEnnYo4mN+tcnKtqJ6OAsQQ==
X-Google-Smtp-Source: AGHT+IF5pUo4GkdkZLtHxqsFk7OrJTTsy7vyuIMhoAvjzif8l35xqTPh5COC65u4R62iopEa3cR9MQ==
X-Received: by 2002:a17:907:2d92:b0:9a1:fed1:9b42 with SMTP id
 gt18-20020a1709072d9200b009a1fed19b42mr2826800ejc.23.1694084576861; 
 Thu, 07 Sep 2023 04:02:56 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 qc8-20020a170906d8a800b009944e955e19sm10213603ejb.30.2023.09.07.04.02.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 04:02:56 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so4169962a12.1
 for <buildroot@buildroot.org>; Thu, 07 Sep 2023 04:02:55 -0700 (PDT)
X-Received: by 2002:a05:6402:847:b0:51f:ef58:da87 with SMTP id
 b7-20020a056402084700b0051fef58da87mr3504732edz.2.1694084575395; Thu, 07 Sep
 2023 04:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <0a92454be5519ae93ca3c07770bc9cf8c0b6c19d.1694078576.git.stefan@agner.ch>
In-Reply-To: <0a92454be5519ae93ca3c07770bc9cf8c0b6c19d.1694078576.git.stefan@agner.ch>
Date: Thu, 7 Sep 2023 04:02:44 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pH5NmCnFq8aZ-SrzV38oQhg_S-+SMhaYF05tnJo_2V6Q@mail.gmail.com>
Message-ID: <CA+h8R2pH5NmCnFq8aZ-SrzV38oQhg_S-+SMhaYF05tnJo_2V6Q@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1694084577; x=1694689377; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PxKxi5DVdiVzWYidhtyrWjuuiyj2L6NUi/F626Scgd0=;
 b=apYlA04lQPZ/M5fSSamaK1foFDDMa8+oOANXCIRJfLSsGZG3pJ/LlDxvFC+QVxdPCP
 SkrvGaMvukSo0AQOs3SR9X5A9+WyDa2+efz2N8Ep7Csr+nICPscV/PjYnXJsD46lYu1C
 d6o2oUJyhaU87z2kLbVhDQLqqsJSaje95jH+NVNg544gSLf6jtOujoXfeRFgWL/epLlf
 Pi2EkwsaWJnpVB633/mZKr/28eoDFsEeqUV9uK0av9bg28tM1REcaRdgcfF67Gt7iWW8
 EjNqQ7t65fVyhytMrDPXe785syZwXwKKNUUWvVVZ0y9764AcRanhdI3P2Fg+bTiFlbH7
 7MRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=apYlA04l
Subject: Re: [Buildroot] [PATCH] package/docker-engine: bump version to
 v24.0.6
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiBUaHUsIFNlcCA3LCAyMDIzIGF0IDI6MjPigK9BTSBTdGVmYW4gQWduZXIgPHN0ZWZh
bkBhZ25lci5jaD4gd3JvdGU6Cj4KPiBCdWcgZml4ZXMgaW4gY29udGFpbmVyZCBzdG9yYWdlIGJh
Y2tlbmQgYW5kIERvY2tlciBpdHNlbGYgYW5kIGEgc2luZ2xlCj4gbmV3IHdhcm5pbmcgYWJvdXQg
b2xkIERvY2tlciBpbWFnZSBmb3JtYXQgZGVwcmVjYXRpb24uCj4KPiBodHRwczovL2dpdGh1Yi5j
b20vbW9ieS9tb2J5L3JlbGVhc2VzL3RhZy92MjQuMC42Cj4KPiBTaWduZWQtb2ZmLWJ5OiBTdGVm
YW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KPiAtLS0KPiAgcGFja2FnZS9kb2NrZXItZW5naW5l
L2RvY2tlci1lbmdpbmUuaGFzaCB8IDIgKy0KPiAgcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tl
ci1lbmdpbmUubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2Rv
Y2tlci1lbmdpbmUuaGFzaCBiL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhh
c2gKPiBpbmRleCAwNjE5OTk0NjRlLi43YThiMTdkM2YzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
ZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhhc2gKPiArKysgYi9wYWNrYWdlL2RvY2tlci1l
bmdpbmUvZG9ja2VyLWVuZ2luZS5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gICMgTG9jYWxseSBj
YWxjdWxhdGVkCj4gLXNoYTI1NiAgODM3ZDdkNjY3ZmI2NDUwOGJmNmU1M2NiNTkxNWI0YjVlZjM1
NjU5OTI5NGZmZGQ1Y2E4Njc4MTY4MjMwY2IzOCAgZG9ja2VyLWVuZ2luZS0yNC4wLjUudGFyLmd6
Cj4gK3NoYTI1NiAgMjlhOGVlNTRlOWVhMDA4YjQwZWViY2E0MmRlYzhiNjdhYjI1N2ViOGFjMTc1
ZjY3ZTc5YzExMGU0MTg3ZDdkMiAgZG9ja2VyLWVuZ2luZS0yNC4wLjYudGFyLmd6Cj4gIHNoYTI1
NiAgN2M4Nzg3MzI5MWYyODk3MTNhYzVkZjQ4YjFmMjAxMGViNjk2Mzc1MmJiZDZiNTMwNDE2YWI5
OWZjMzc5MTRhOCAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2RvY2tlci1lbmdpbmUv
ZG9ja2VyLWVuZ2luZS5tayBiL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLm1r
Cj4gaW5kZXggMjJjZDJjNThlZC4uYThmNDcyNTRhNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Rv
Y2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5tawo+ICsrKyBiL3BhY2thZ2UvZG9ja2VyLWVuZ2lu
ZS9kb2NrZXItZW5naW5lLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPgo+IC1ET0NLRVJfRU5HSU5FX1ZFUlNJT04gPSAyNC4wLjUKPiArRE9DS0VS
X0VOR0lORV9WRVJTSU9OID0gMjQuMC42CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIFN0ZXdhcnQg
PGNocmlzdGlhbkBhcGVydHVyZS51cz4KClRoYW5rcyEKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
