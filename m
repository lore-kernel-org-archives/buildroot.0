Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D7FCAC589
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 07:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C10016130A;
	Tue,  9 Sep 2025 07:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xb-OCvFvd7bI; Tue,  9 Sep 2025 07:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6B03612FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6B03612FA;
	Tue,  9 Sep 2025 07:47:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 321C5CA
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 07:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 244B4400A8
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 07:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCQDSslZ8ogV for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 07:47:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3ABE94086C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ABE94086C
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3ABE94086C
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 07:47:04 +0000 (UTC)
X-CSE-ConnectionGUID: /AfFMNU/SBOelmjGt3piEA==
X-CSE-MsgGUID: uDV7CuAyS/aGfy7k+iuoVA==
Received: from unknown (HELO opfedv3rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 09 Sep 2025 09:47:02 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2025 09:47:02 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58;
 Tue, 9 Sep 2025 09:47:00 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 09 Sep 2025 09:47:00 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: VGuCCQkzQkmVTOFC+XJzwA==
X-CSE-MsgGUID: 2871Lw+zRrWy4rpZMEYsHg==
X-IronPort-AV: E=Sophos;i="6.18,250,1751234400"; d="scan'208";a="330410954"
Date: Tue, 9 Sep 2025 09:47:00 +0200
To: Romain Naour <romain.naour@smile.fr>
CC: <buildroot@buildroot.org>, Christian Stewart <christian@aperture.us>
Message-ID: <aL/bdHOwN/ENpcOl@yd-6wlzhs3>
References: <cover.1751377540.git.yann.morin@orange.com>
 <d23125d705a0c24ca91071624d507392ecfe7b0d.1751377540.git.yann.morin@orange.com>
 <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX101.corporate.adroot.infra.ftgroup (10.115.26.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1757404025; x=1788940025;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=ys3I6rgcl0cKi7Rk7Y3OMmcUliVgaZhl0Cb2nWSwwHw=;
 b=YdexWeI8jxUTG4KeB39glfTGbFaj9Ej9HNEFoON2+lM6k5LKVF4tQ8T+
 P8sFJUW2g1/+CDZluyL72/isYsi3I1aIIo1y0maCoMSwVqWN6WTSPorld
 DxnVSm26R9c5u9ZtmCaGp75iBwjStojOco40krieNI4XhsXmlIkgzgrUR
 DHOqIMPqYGNbSj9nXq4GB8lOVlgrOuuO6FjJsJtPfqwCeZNKm66U1eBVq
 A3nJ5+F2lWkBkraft2MbNM+dsIUZ8qDoeWFF+WWQXZs63O+C4YPSvFVi4
 efodvc1AT1fUjHqAh7MV8xvB1NvV/C2m6+Y3t13lDzH3oiyQGqj7P3ZPA
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=YdexWeI8
Subject: Re: [Buildroot] [PATCH 1/4 v2] package/pkg-golang: simplify
 installing multiple binaries
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDI1LTA3LTA1IDIyOjUxICswMjAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDAxLzA3LzIwMjUgw6AgMTU6NDUsIHlhbm4ubW9yaW5Ab3JhbmdlLmNv
bSBhIMOpY3JpdMKgOgo+ID4gRnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9yYW5n
ZS5jb20+Cj4gPiBDdXJyZW50bHksIHdoZW4gYSBnb2xhbmcgcGFja2FnZSBkZWZpbmVzIG11bHRp
cGxlIF9CVUlMRF9UQVJHRVRTLCBpdCBoYXMKPiA+IHRvIGJhc2ljYWxseSByZXBlYXQgdGhlIHNh
bWUgbGlzdCBpbiBpdHMgX0lOU1RBTExfQklOUy4KWy0tU05JUC0tXQo+ID4gV2Ugbm93IGNvbnNp
ZGVyIHRoYXQgX0lOU1RBTExfQklOUyBpcyBhbiBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiBkZXRh
aWxzCj4gPiB0aGF0IHNob3VsZCBubyBsb25nZXIgYmUgZXhwb3NlZCB0byB0aGUgdXNlcnMsIHNv
IHdlIGRyb3AgaXQgZnJvbSB0aGUKPiA+IGRvY3VtZW50YXRpb247IHdlIHJlcGhyYXNlIHRoZSBj
b3JyZXNwb25kaW5nIHBhcnQgZm9yIF9CVUlMRF9UQVJHRVRTLgo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+Cj4gPiBDYzogQ2hyaXN0
aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4KPiBSZXZpZXdlZC1ieTogUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4gU2luY2UgaXQncyBhYm91dCBhIHBhY2th
Z2UgaW5mcmFzdHVjdHVyZSBjaGFuZ2UsIEkgcHJlZmVyIHdhaXQgZm9yIGEgc2Vjb25kIHJldmll
dy4KCldoYXQgYWJvdXQgdGhlIHN0YXR1cyBvZiB0aGlzIHNlcmllcz8gQ2hyaXN0aWFuIGhhcyBw
cm92aWRlZCBoaXMKUmV2aWV3ZWQtYnkgYSB3aGlsZSBiYWNrLi4uCgpSZWdhcmRzLApZYW5uIEUu
IE1PUklOLgoKLS0gCgouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS06zIXM
hSDMhcyFzIXMhSDMhcyFzIXMhSDMhcyFzIXMhSDMhcyFzIXMhSDMhcyFzIXMhSDMhcyFzIXMhSDM
hcyFzIXMhV/MhSDMhcyFzIXMhSDMhcyFzIXMhSDMhcyFzIXMhSDMhTotLS0tLS0tLS0tLS0tLS0t
LS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgICAgX18vICkgICB8
IC8iXCBBU0NJSSBSSUJCT04gfAp8ICAgICAgICAgICAgICAgICB8IFNvZnR3YXJlICBEZXNpZ25l
ciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKfCArMzMgNjM4LjQxMS4yNDUgJy0t
LS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAgICBgLS0sIHwgIFggIEFHQUlOU1QgICAgICB8CnwgeWFu
bi5tb3JpbiAoYXQpIG9yYW5nZS5jb20gICAgICAgICAgIHxfPSIgICAgLC0tJyB8IC8gXCBIVE1M
IE1BSUwgICAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS06X19fX19f
L19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KQ2UgbWVzc2FnZSBldCBzZXMgcGllY2VzIGpvaW50ZXMg
cGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNvbmZpZGVudGllbGxlcyBvdSBwcml2
aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jDQpwYXMgZXRyZSBkaWZmdXNlcywgZXhwbG9pdGVz
IG91IGNvcGllcyBzYW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBhdmV6IHJlY3UgY2UgbWVzc2Fn
ZSBwYXIgZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWduYWxlcg0KYSBsJ2V4cGVkaXRldXIgZXQgbGUg
ZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4gTGVzIG1lc3NhZ2VzIGVsZWN0
cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwNCk9yYW5nZSBkZWNsaW5l
IHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBldGUgYWx0ZXJlLCBkZWZvcm1l
IG91IGZhbHNpZmllLiBNZXJjaS4NCg0KVGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMg
bWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3JtYXRpb24gdGhhdCBt
YXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsNCnRoZXkgc2hvdWxkIG5vdCBiZSBkaXN0cmlidXRlZCwg
dXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLg0KSWYgeW91IGhhdmUgcmVjZWl2
ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxl
dGUgdGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMuDQpBcyBlbWFpbHMgbWF5IGJlIGFs
dGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0IGhhdmUgYmVlbiBt
b2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuDQpUaGFuayB5b3UuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
