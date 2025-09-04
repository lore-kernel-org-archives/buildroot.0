Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE311CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 15:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93A23607F5;
	Thu,  4 Sep 2025 15:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UIBSY4NeTNt2; Thu,  4 Sep 2025 15:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C85076165D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C85076165D;
	Thu,  4 Sep 2025 15:12:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF7AA930
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 15:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 961FB426D4
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 15:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMSpc1zmiUBe for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 15:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FDAD426D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FDAD426D9
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FDAD426D9
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 15:12:19 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-55f6186cc17so1058055e87.2
 for <buildroot@buildroot.org>; Thu, 04 Sep 2025 08:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756998737; x=1757603537;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OK9mUHxgqUII8unDXbEY7zLziXGWZXzYTYihlYrVQdY=;
 b=MkeR++3oaa+fxuoyNk46n141cXtixgPtooVdYOAbjO1RkYUBi+rNLXap/tZeTpeKuI
 7aDmynA1S/+Gqxa1q5vQx0TjwvEaD7fXhtAH5aT9A1OnS9dXZgQmtYY+QjIppKulCr4+
 F0+mT8BQ32UaUGkcMFXEc3mf9ixJppVLUTdlvU64QkmCmLBW5+mHGBqLINivvk8jLSMq
 B9DPh14tzqScU8qCyvdmDmwYgRZLflUMJimbChQh8sxZNazN5pzqsWMVEXVcy+IFEtFF
 +o84P1YGNsrskyTzxqDo82GndQdkk1DNg+RAree82ZaypLkQkBGkrrtM6Q6bw2k5fo9K
 cwWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdA4KzkNuXXr9LHm7N5HCxxBnvTLFoGmbyVlA20mOmN4GwGrLZ3SdxDV/usd6Nn5uUNuFqtXxn4lA=@buildroot.org
X-Gm-Message-State: AOJu0YxspRo2bkUJtDpHIfciWU/6afEu3oHFEqw3aLAPhy+FepthOSal
 GvXJ1nXOhWGH29DqAmvGL9KyidVMHjQ4Bxh0MIAPxQGKlrMIEDo8XxYWrqIxc4xHOpTGuUe2Aaq
 69eWL
X-Gm-Gg: ASbGnctBe8r779UfXZEwnRfAqzIlrpbtnbsuN8GEeoKQ0uJPu9Hzdayz/wAnx7Ovn+S
 6VAuv2vMrfWTdkyJJUSlZoMO3b8lVLS78yEVEq3V+vPNIsxHYIfB2gkVeeaNMYqNJiZS5VKlTgH
 m7veqFItskaB42iQB3HhdFF+pGHXKb3ujcqWUByaUXAMzZmXjMr2IRI1DUv9ryeP6dJXwMYWMlC
 JjWUg8gIJzRFPLJjHZCsnQR47DRuh6IoobF0SKZa/k0rFxTWJ8RMRPOBYzbpG/4ln5JeE5UDvyE
 n+DWKwPO2E1AE7A2Hu+S6DapWrd4Z+L79FJqj4xO55gWfk/z/pMFW/lInFxr8MNS3zcVvhshLD1
 xnLjClvg0CXOEfQjxCBxYdnodA2mo9fIHDmk42NYoRVi0YSH9sBIsJrn5OObeG7lwj/NrtvfTDf
 l4/YNlM7s/QWsB
X-Google-Smtp-Source: AGHT+IEwx/ACVbvwowcqy4hu0/05D98dP54ekXxQLM9ulketg3gndtPgWq0OxVwr449blsqQ1x7oCQ==
X-Received: by 2002:a05:6512:6609:b0:55f:44b8:1ed8 with SMTP id
 2adb3069b0e04-55f709bf41amr5804452e87.57.1756998737061; 
 Thu, 04 Sep 2025 08:12:17 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad2c222sm1233386e87.130.2025.09.04.08.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 08:12:16 -0700 (PDT)
Message-ID: <245cbd37-11e2-4610-b85d-7fd6b8c4319d@smile.fr>
Date: Thu, 4 Sep 2025 17:12:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Cc: David Pierret <david.pierret@smile.fr>
References: <20250902134250.622347-1-elmehdi.younes@smile.fr>
 <20250903212121.5fa1d5f3@windsurf>
Content-Language: en-US
In-Reply-To: <20250903212121.5fa1d5f3@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756998737; x=1757603537; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OK9mUHxgqUII8unDXbEY7zLziXGWZXzYTYihlYrVQdY=;
 b=SlDSGG9KEYFABkxx50HOGssg3KPtMTdhorzBG/danoHB8V+r58XhPV/3mWz9pFJv/C
 si0OdTfyly3MWCmdSdF3KBCxF7uEhgRqLsK1xh9JtQEoOgurgJ5qsRcG2gpfYZRJ9Fia
 r/w6qrhyD2QqJnZwoXTTkLOIFOohHer2lnIAc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=SlDSGG9K
Subject: Re: [Buildroot] [PATCH 1/1] package/bat: fix build with GCC 15
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkxlIDAzLzA5LzIwMjUgw6AgMjE6MjEsIFRob21hcyBQZXRhenpvbmkgYSDDqWNyaXTCoDoKPiBP
biBUdWUsICAyIFNlcCAyMDI1IDE1OjQyOjUwICswMjAwCj4gRWwgTWVoZGkgWU9VTkVTIHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPgo+PiBCYXQgcHVsbHMg
aW4gdGhlIG9uaWcgY3JhdGUgKHZlcnNpb24gNi40LjApIHRocm91Z2ggc3ludGVjdCB3aXRoIHRo
ZQo+PiBkZWZhdWx0ICJyZWdleC1vbmlnIiBmZWF0dXJlLiBUaGlzIGNyYXRlIGRlcGVuZHMgb24g
dGhlIE9uaWd1cnVtYSBDCj4+IGxpYnJhcnkgKHZpYSBvbmlnX3N5cyksIHdoaWNoIGZhaWxzIHRv
IGJ1aWxkIHdpdGggR0NDIDE1IGR1ZSB0byBDMjMKPj4ga2V5d29yZCBjb25mbGljdHMuIE5ld2Vy
IHZlcnNpb25zIG9mIG9uaWcgZml4IHRoaXMgaXNzdWUsIGJ1dCBiYXQKPj4gY2Fubm90IGRpcmVj
dGx5IHVwZGF0ZSB0aGUgb25pZyB2ZXJzaW9uIGJlY2F1c2UgaXQgaXMgcGlubmVkIGJ5IHN5bnRl
Y3QuCj4+Cj4+IFRvIHJlc29sdmUgdGhlIGJ1aWxkIGZhaWx1cmUsIGFwcGx5IGEgcGF0Y2ggdGhh
dCByZXBsYWNlcyB0aGUKPj4gInJlZ2V4LW9uaWciIGZlYXR1cmUgd2l0aCAicmVnZXgtZmFuY3ki
IGluIGJhdCdzIG1pbmltYWwtYXBwbGljYXRpb24KPj4gZmVhdHVyZSBzZXQuIFRoaXMgc3dpdGNo
ZXMgYmF0IHRvIHVzZSB0aGUgcHVyZS1SdXN0IGZhbmN5LXJlZ2V4IGVuZ2luZQo+PiBpbnN0ZWFk
IG9mIE9uaWd1cnVtYSwgYXZvaWRpbmcgdGhlIHByb2JsZW1hdGljIG9uaWdfc3lzIGRlcGVuZGVu
Y3kuCj4+Cj4+IEZpeGVzOgo+Pgo+PiAgICBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0
Lz9yZWFzb249YmF0LSUKPj4KPj4gU2lnbmVkLW9mZi1ieTogRWwgTWVoZGkgWU9VTkVTIDxlbG1l
aGRpLnlvdW5lc0BzbWlsZS5mcj4KPj4gLS0tCj4+ICAgLi4uaWctYnktcmVnZXgtZmFuY3ktaW4t
bWluaW1hbC1hcHBsaWNhLnBhdGNoIHwgNDAgKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvYmF0LzAwMDEtUmVwbGFjZS1yZWdleC1vbmlnLWJ5LXJlZ2V4LWZhbmN5LWluLW1pbmltYWwt
YXBwbGljYS5wYXRjaAo+IFRlc3RlZC1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6
em9uaUBib290bGluLmNvbT4KPgo+IElmIHlvdSBmaXggdGhlIGF1dG9idWlsZC5idWlsZHJvb3Qu
bmV0IFVSTCBhbmQgY2xhcmlmeSB0aGUgIlVwc3RyZWFtOgo+IG5vdCBzdWJtaXR0ZWQiIHRhZyBp
biB0aGUgcGF0Y2gsIHRoaXMgaXMgZ29vZCB0byBnbyBmb3IgbWUgYXMgaXQgYWxsb3dzCj4gdG8g
Zml4IHRoZSBidWlsZCBpc3N1ZS4KPgo+IFRoYW5rcyEKCkRvbmUhIEkgc2VudCBhIHYyLgoKQmVz
dCByZWdhcmRzLAoKRWwgTWVoZGkKCj4gVGhvbWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
