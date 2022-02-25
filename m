Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4327C433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 21:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E9A684C28;
	Fri, 25 Feb 2022 21:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D2gBbPPeJtMW; Fri, 25 Feb 2022 21:52:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6681684C25;
	Fri, 25 Feb 2022 21:52:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38D951BF3A9
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 21:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2720640AC6
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 21:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A597bChtB7NH for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 21:52:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFD3740385
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 21:52:50 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d17so6336354wrc.9
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 13:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=65Pt+//BUuoflna20fUwSecvBRyv3ffJpH3fd4bcH9M=;
 b=nqr18dFDzQC9YuBewhizvDGUirjGRDRIFBO6Zr6IOMGdmeWgwbNTgVfxY+4ULYM/dX
 NwvGCLr/6JwpsgKuTJ3VcrDXpzXOaIS0274CtLT2mhKFpvCy3wV9tozNkVSM6Cl2fjQo
 PDaAjUNDlkQqMSyRrhZDFfInduDZThlUBFIgnjCoApFU8NnA3R7jLgWnusvBTXBe18Ut
 PeUJhkfqnAKtT2dG8pocndrZLoWuKd0uSQd4B5hwxbDWpRe11bUbYtpd2zlKHAG/u5wi
 zUfH+kNAL/vmdnvYwb1X2p2TAoQWpO2dLbWI9RxJwfJEGYgH6ocVk8sNq8qEjmw+Peb5
 drIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=65Pt+//BUuoflna20fUwSecvBRyv3ffJpH3fd4bcH9M=;
 b=je6AVjASPdZPXwXQBndDtm2lshQdHXg6bszAH/KHIw9e5V20n8Dxgj/I2oPHeNpqWq
 7Ca9xKH9ZaGI3+hgcSIrwiw0wpNRcT29+v+oiqmdplklGYPyrXzHsxQgNSi2LLaY2oT+
 7QViTD8nNES3wvTAhsINcjW9FtGZmAaf8s+9xSgcwCnZ97R7BVVkKvDDm5jWS52Gz9K1
 w7NLdKg8wfHvBwPilXLOaHQ14NCQ07Thg9r7RiEE4s6ic7144eSNiNCoPuJULgl56YBj
 vHjjiRVyrk0ny/n+0M+loxYeRTS+qzo8s8cHNysT4b5Dz1TkPn8bow6IeOE+079A6I39
 MurQ==
X-Gm-Message-State: AOAM533k0txxPtzP5rJwzBwVAoKE5f2aUyoLH8FtB+hS9KDKJO3FaVqk
 YuWnnnVTqr3WH0TApZOsrK8n8pv3RtM=
X-Google-Smtp-Source: ABdhPJyasEoWB/I7WdlzhOULXuzAQAOvo1afUPJdn53HfG0+4AdhCmnmsce0zaE4f0s8GaCWmO0RVw==
X-Received: by 2002:a5d:4ccd:0:b0:1ed:a139:708f with SMTP id
 c13-20020a5d4ccd000000b001eda139708fmr7326890wrt.672.1645825967318; 
 Fri, 25 Feb 2022 13:52:47 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 m10-20020adfe94a000000b001ef57f562ccsm3360481wrn.51.2022.02.25.13.52.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:52:46 -0800 (PST)
Message-ID: <e59b1624-6a7e-69c2-5e36-a1f54fd53e81@gmail.com>
Date: Fri, 25 Feb 2022 22:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220224154118.220408-1-romain.naour@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220224154118.220408-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/pkg-python: use
 SETUPTOOLS_USE_DISTUTILS=stdlib
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjQvMDIvMjAyMiDDoCAxNjo0MSwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gLXNoOiBp
cHl0aG9uOiBub3QgZm91bmQKPiAKPiBpcHl0aG9uIHVzZSBhIHdyb25nIHNoZWJhbmcgb24gdGhl
IHRhcmdldDoKPiAKPiAgIyBoZWFkIC1uIDEgL3Vzci9iaW4vaXB5dGhvbgo+ICAjIS9ob21lL2t1
YnUvYnVpbGRyb290L3Rlc3RzdWl0ZS1tYXN0ZXIvVGVzdElQeXRob25QeTMvaG9zdC9iaW4vcHl0
aG9uCj4gCj4gVGhlIGlzc3VlIGNvbWUgZnJvbSBweXRob24zLXNldHVwdG9vbHMgNjAuMC4wIHRo
YXQgY2hhbmdlZAo+IFNFVFVQVE9PTFNfVVNFX0RJU1RVVElMUyBkZWZhdWx0IHZhbHVlIGZyb20g
c3RkbGliIHRvIGxvY2FsIFsxXSB0byB1c2UKPiBpdHMgbG9jYWwgY29weSBvZiBkaXN0dXRpbHMu
IFRoaXMgaXMgYWN0dWFsbHkgYSAiYnJlYWtpbmciIGNoYW5nZSBbMl0uCj4gCj4gV2UgaGF2ZSB0
byBvdmVycmlkZSBTRVRVUFRPT0xTX1VTRV9ESVNUVVRJTFMgdG8gdGhlIHByZXZpb3VzIHZhbHVl
Cj4gInN0ZGxpYiIgdG8gZml4ZXMgdGhlIGlzc3VlLgo+IAo+IFdoaWxlIGF0IGl0LCB1c2UgZGlz
dHV0aWxzIGZyb20gc3RkbGliIGZvciB0aGUgaG9zdC4KPiAKPiBGaXhlczoKPiBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzIwODg2ODQwOTEKPiAKPiBb
MV0gaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvc2V0dXB0b29scy9jb21taXQvYjZmY2JiZDAwY2I2
ZDU2MDdjOTI3MmRlYzQ1MmE1MDQ1N2JkYjI5Mgo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vcHlw
YS9zZXR1cHRvb2xzL2Jsb2IvdjYwLjAuMC9DSEFOR0VTLnJzdCNicmVha2luZy1jaGFuZ2VzCgpJ
IG5vdGljZWQgdGhhdCBRZW11IGluY2x1ZGVkIGEgd29ya2Fyb3VuZCBmb3Igc2V0dXB0b29scyA+
PSA2MDoKCmh0dHBzOi8vZ2l0LnFlbXUub3JnLz9wPXFlbXUuZ2l0O2E9Y29tbWl0ZGlmZjtoPTc2
MmMyODBkNWYzYzE3YTIzOTIwNGE3Mzg1NWQ4Nzc4ZjZkYzIxMTMKCkJlc3QgcmVnYXJkcywKUm9t
YWluCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWls
LmNvbT4KPiBDYzogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4g
LS0tCj4gIHBhY2thZ2UvcGtnLXB5dGhvbi5tayB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLXB5dGhvbi5tayBi
L3BhY2thZ2UvcGtnLXB5dGhvbi5tawo+IGluZGV4IGI4ZGM5Y2Q5ZTUuLmU4MWExYTMxMDIgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9wa2ctcHl0aG9uLm1rCj4gKysrIGIvcGFja2FnZS9wa2ctcHl0
aG9uLm1rCj4gQEAgLTQwLDYgKzQwLDcgQEAgUEtHX1BZVEhPTl9ESVNUVVRJTFNfRU5WID0gXAo+
ICAJTERTSEFSRUQ9IiQoVEFSR0VUX0NST1NTKWdjYyAtc2hhcmVkIiBcCj4gIAlQWVRIT05QQVRI
PSIkKFBZVEhPTjNfUEFUSCkiIFwKPiAgCVBZVEhPTk5PVVNFUlNJVEU9MSBcCj4gKwlTRVRVUFRP
T0xTX1VTRV9ESVNUVVRJTFM9c3RkbGliIFwKPiAgCV9QWVRIT05fSE9TVF9QTEFURk9STT0iJChQ
S0dfUFlUSE9OX0hPU1RfUExBVEZPUk0pIiBcCj4gIAlfUFlUSE9OX1BST0pFQ1RfQkFTRT0iJChQ
WVRIT04zX0RJUikiIFwKPiAgCV9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FPSIkKFBLR19QWVRI
T05fU1lTQ09ORklHREFUQV9OQU1FKSIgXAo+IEBAIC02Miw2ICs2Myw3IEBAIFBLR19QWVRIT05f
RElTVFVUSUxTX0lOU1RBTExfU1RBR0lOR19PUFRTID0gXAo+ICBIT1NUX1BLR19QWVRIT05fRElT
VFVUSUxTX0VOViA9IFwKPiAgCVBBVEg9JChCUl9QQVRIKSBcCj4gIAlQWVRIT05OT1VTRVJTSVRF
PTEgXAo+ICsJU0VUVVBUT09MU19VU0VfRElTVFVUSUxTPXN0ZGxpYiBcCj4gIAkkKEhPU1RfQ09O
RklHVVJFX09QVFMpCj4gIAo+ICBIT1NUX1BLR19QWVRIT05fRElTVFVUSUxTX0lOU1RBTExfT1BU
UyA9IFwKPiBAQCAtNzYsNiArNzgsNyBAQCBQS0dfUFlUSE9OX1NFVFVQVE9PTFNfRU5WID0gXAo+
ICAJJChUQVJHRVRfQ09ORklHVVJFX09QVFMpIFwKPiAgCVBZVEhPTlBBVEg9IiQoUFlUSE9OM19Q
QVRIKSIgXAo+ICAJUFlUSE9OTk9VU0VSU0lURT0xIFwKPiArCVNFVFVQVE9PTFNfVVNFX0RJU1RV
VElMUz1zdGRsaWIgXAo+ICAJX3B5dGhvbl9zeXNyb290PSQoU1RBR0lOR19ESVIpIFwKPiAgCV9w
eXRob25fcHJlZml4PS91c3IgXAo+ICAJX3B5dGhvbl9leGVjX3ByZWZpeD0vdXNyCj4gQEAgLTk2
LDYgKzk5LDcgQEAgUEtHX1BZVEhPTl9TRVRVUFRPT0xTX0lOU1RBTExfU1RBR0lOR19PUFRTID0g
XAo+ICBIT1NUX1BLR19QWVRIT05fU0VUVVBUT09MU19FTlYgPSBcCj4gIAlQQVRIPSQoQlJfUEFU
SCkgXAo+ICAJUFlUSE9OTk9VU0VSU0lURT0xIFwKPiArCVNFVFVQVE9PTFNfVVNFX0RJU1RVVElM
Uz1zdGRsaWIgXAo+ICAJJChIT1NUX0NPTkZJR1VSRV9PUFRTKQo+ICAKPiAgSE9TVF9QS0dfUFlU
SE9OX1NFVFVQVE9PTFNfSU5TVEFMTF9PUFRTID0gXAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
