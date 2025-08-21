Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C67CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 309A4847C7;
	Thu, 21 Aug 2025 19:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qhq6OZa5mwf3; Thu, 21 Aug 2025 19:22:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 391D584745
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 391D584745;
	Thu, 21 Aug 2025 19:22:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E273225B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C956140D1C
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiWtZO9lBfma for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9CA240D31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9CA240D31
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9CA240D31
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1abf5466so9096905e9.0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804088; x=1756408888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XyuxXA0Hhi9GLET6h0XIcf0rUhrwdEf2vyL4R1MZ3xc=;
 b=xPocy5yzvld2gmOUbPQgUizox3JAF8qkLmNUJ23kraTwLj0GdEm3RpYnF4gIkbanGp
 bmYSNGd/Aylcy1kg95WyCVEU6OXNkY+dGV4BXuNli3blc9lvF0MmHi+N6BDLrNUcvvMS
 +pc1Z57bXdHGoK94Q43l5mLwBikuNSbuEWdiUqmlFuv3i+pb0wtjlLn1hR19nVkVXSC+
 eb9OF3stRGATLuB2yW0b68PZ+GA1ftTrfBzY3QmRL00E+IMQu89CbN2Yq1bZc0cOzORg
 pxAuyUT0Ba8IuYM2lVIaFiWzg2pIvvUCCxat5ZCBKXYhVxWC6gvwlaKVCP/IhnihvaVJ
 BTBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8Pe+u6Vr1EMCFajnOl+7jty7FExvCZ2MiBjZh0YiW51+KKLurbg8rycdpGkWTOo/8Qp+4rlDW/0s=@buildroot.org
X-Gm-Message-State: AOJu0YxUwyBaidzMDVg5f5kQTVRuYZkCJKiWkuPekxbdwFLVR3LNGwZ6
 Ft1QV1vo8iBZ5KzJQUhv00xihC2hbC1z6K9KqHE04KvXCselrxFHu/Y77VlXElw7P/YKNS0LZz3
 AhUm2lrw=
X-Gm-Gg: ASbGnctj+mEcyaVOxCNzLB79U8ZDZ6+Mf7LA+O+P8b0hmI0/CEX9/w9nMaMTnK4fUeu
 ln+XiYp8KTqbu2ExOcYX8mHSYlbP/Z292tqiSuqPLGbhu2oni+69JiRS3/ib+wlmiMqtEcozXgP
 wV567CK7gbRfOR8tauGN6qaAwLIAOLCgNXgUJ+z1byAHd9EA8UZbrPlzZ+J61lsa4IDk0lW6SUB
 HkBMH27wq4aXhw0y9aQtzg71gMynwZk6efd4fsf7pVS7jnoKq4HjdfI7nKFeoidz1M8N9W3Hxft
 ayVYdOlNv6plFhXknvXzc+LQbto0rs5caP2U7tEKgRXElzl9wwBKZf5XNgwWbv+7LWkEoT8MkS7
 /Yue8wgLLAwm3YET8omIZcuJv
X-Google-Smtp-Source: AGHT+IH6Kf106v/jihzVnMBG4RN+MqH5fG+bNeI2izgBBNDvFbh6qxjpKCjLZO+DNxuCLfQQXh6m+g==
X-Received: by 2002:a05:600c:c11b:b0:456:15be:d113 with SMTP id
 5b1f17b1804b1-45b4d793c18mr26086515e9.1.1755804087822; 
 Thu, 21 Aug 2025 12:21:27 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c5317abe83sm2319602f8f.40.2025.08.21.12.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:27 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:26 +0200
Message-ID: <20250821192127.24764-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816143431.50398-1-ju.o@free.fr>
References: <20250816143431.50398-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804088; x=1756408888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyuxXA0Hhi9GLET6h0XIcf0rUhrwdEf2vyL4R1MZ3xc=;
 b=Kgpf+lB51Wx1MmW2QLOC/cH5tCAqxT4CCTjDioCzZr7oGqbHGCxX2Z4daLHbEstxu/
 7E0afEVLgPvHvPIynUD5X2KXqDwg+xUMuZU1erJTdhTyiVtMajqEkdD/g1wme4b5gaUd
 X7flc2cdWHJJjqN6g8lBCO1C66GE2hjwjA45vSWGi3qRvfgMA1SAl5D25fa46mi+vTXT
 ICERc0ldd8o+UaHw5xNplft0mllBypVlaMUrIRHSx8X+VCQel3bPFlACgVTeWSUIaIaY
 UyFW/RsbUMIGyXlsZudX7B8Qdtwlm64zWK4OEJgNxkkQLAcA2BIje5nhWKRFeYlRNOm+
 8pWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Kgpf+lB5
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_msr_tools: fix
 test after bootlin toolchains update
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gU2luY2UgQnVpbGRyb290IGNvbW1pdCBbMV0gInVwZGF0ZSB0byBCb290
bGluIHRvb2xjaGFpbnMgMjAyNS4wOC0xIiwKPiB0aGUgdGVzdHMucGFja2FnZS50ZXN0X21zcl90
b29scyBmYWlscyB3aGVuIGJ1aWxkaW5nIGl0cyBLZXJuZWwgNS4xNS41NQo+IHdpdGggZ2NjIDE1
LjEuMC4KPiAKPiBUaGlzIGNvbW1pdCBmaXhlcyB0aGUgaXNzdWUgYnkgdXBkYXRpbmcgdGhlIHRl
c3QgS2VybmVsIHRvIHRoZSBsYXRlc3QKPiBMVFMgdmVyc2lvbiAoNi4xMi40MiBhdCB0aGUgdGlt
ZSBvZiB0aGlzIGNvbW1pdCkgd2hpY2ggaW5jbHVkZXMgdGhlCj4gZml4IGZvciBnY2MtMTUuIE5v
dGU6IHRoZSA1LjE1Lnkgc2VyaWVzIGRvZXMgbm90IGluY2x1ZGUgdGhpcyBmaXggZm9yCj4gdGhl
IHg4Nl82NCBhcmNoaXRlY3R1cmUsIHdoaWNoIGlzIHdoeSB0aGlzIGNvbW1pdCBzd2l0Y2hlcyB0
byA2LjEyLnkuCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vam9icy8xMDk4NDY4NjI5NAo+IAo+IFsxXSBodHRwczovL2dpdGxhYi5jb20v
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvOTQ3ZGJjOTJhMjBjNWFjZWE3ODgyMTY2
Y2FlNzg5M2U2ZWE2NjFlMQo+IAo+IENjOiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxl
QGxhcG9zdGUubmV0Pgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUu
ZnI+CgpBcHBsaWVkIHRvIDIwMjUuMDIueCAmIDIwMjUuMDUueC4gVGhhbmtzCgo+IC0tLQo+ICBz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X21zcl90b29scy5weSB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbXNyX3Rvb2xzLnB5IGIv
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9tc3JfdG9vbHMucHkKPiBpbmRleCA0
ZDYyNzQyYTVmLi5kMDk4YjI5YWEyIDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfbXNyX3Rvb2xzLnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9tc3JfdG9vbHMucHkKPiBAQCAtMTEsNyArMTEsNyBAQCBjbGFzcyBUZXN0
TXNyVG9vbHMoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPiAgICAgICAgICBCUjJfVE9PTENIQUlO
X0VYVEVSTkFMPXkKPiAgICAgICAgICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgICAgICAgICBCUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAtICAgICAgICBCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE1LjU1Igo+ICsgICAgICAgIEJSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMTIuNDIiCj4gICAgICAgICAgQlIyX0xJTlVYX0tF
Uk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15Cj4gICAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNU
T01fQ09ORklHX0ZJTEU9ImJvYXJkL3FlbXUveDg2XzY0L2xpbnV4LmNvbmZpZyIKPiAgICAgICAg
ICBCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0ie30iCj4gLS0gCj4gMi41
MC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
