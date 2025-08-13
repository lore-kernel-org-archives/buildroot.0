Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE62CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 11:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFD636081E;
	Wed, 13 Aug 2025 11:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdGUoUTPNFiN; Wed, 13 Aug 2025 11:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B22A60826
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B22A60826;
	Wed, 13 Aug 2025 11:10:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F082938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 11:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2095A4005E
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 11:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2hsrgj1NN5C for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 11:10:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C13640078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C13640078
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C13640078
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 11:10:40 +0000 (UTC)
X-CSE-ConnectionGUID: Nq81D1ncQv6lyI+i5giG0Q==
X-CSE-MsgGUID: NbiLRBYMRIKZbHZSTkexFQ==
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 13:10:37 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Aug 2025 13:10:37 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Wed, 13 Aug 2025 13:10:36 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 13 Aug 2025 13:10:35 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: 0jCj8UooSEOOeP1eYRlztQ==
X-CSE-MsgGUID: 1KPlDNCoTpKqUCqduX8KnA==
X-IronPort-AV: E=Sophos;i="6.17,285,1747692000"; d="scan'208";a="321524655"
Date: Wed, 13 Aug 2025 13:10:35 +0200
To: "Frager, Neal" <neal.frager@amd.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Message-ID: <aJxyq8E0t+89Dxh2@yd-6wlzhs3>
References: <20250813084354.2739722-1-neal.frager@amd.com>
 <aJxY+xaZhMFLzxX9@yd-6wlzhs3> <20250813112755.63b17355@booty>
 <SA1PR12MB5615D78075169997FF3A7369F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
 <aJxiOiEp8IG2zdXX@yd-6wlzhs3>
 <SA1PR12MB561513AAF7E7C17AF954956BF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SA1PR12MB561513AAF7E7C17AF954956BF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX303.corporate.adroot.infra.ftgroup
 (10.115.26.12) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1755083440; x=1786619440;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=sPZGWukCCD02t3jmg8qq7kl9ckcL3m3IXWel/nuuHrg=;
 b=O0SzQYkSbcxyXbkkNp/930TKXmEs8jccf1C4rfYdEWHQYHU+KOSJpopP
 9L4UJXjjR1tuZJgN+syt6TgU9NUjCgnA17L8HAU63KpSH8TMDrG51EIpl
 QV226qeQ9nMVc1zyXD84E0KG1nHmK5SQVeMLTUi1QHq/6tetn9j6u1NIU
 RrCMsWdZL66xU0e/DOYgYqurBKOZ+GnGkdrnWt0yLQzDjeVf75h7Gjwjg
 eEUVmBXThWLINhJn1kv+bzJNsMCRaFltUK4tGgYWRXGPr5pClUg/wE5kJ
 13nvpv/2VsDHaQAPYLYFstnYSHSHIuqau+dyFw5q98pqdRLBHEYLNzulz
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=O0SzQYkS
Subject: Re: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
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

TmVhbCwgQWxsLAoKT24gMjAyNS0wOC0xMyAxMDoyOCArMDAwMCwgRnJhZ2VyLCBOZWFsIHNwYWtl
IHRodXNseToKWy0tU05JUC0tXQo+ID4gV2hlbiB0aGUgZGVwZW5kZW5jeSBpcyBub3QgdHJpY3Zp
YWwsIEkgdGhpbmsgaXQgaXMgZ29vZCB0byBpbnRyb2R1Y2UgYW4KPiA+IGludGVybWVkaWF0ZSBz
eW1ib2w6Cj4gPiAgICBjb25maWcgQlIyX1RBUkdFVF9YSUxJTlhfRU1CRURERURTV19BUkNIX1NV
UFBPUlRTClstLVNOSVAtLV0KPiBJIHNlZSB5b3VyIHBvaW50LCBidXQgZG9uJ3QgeW91IHRoaW5r
IGFkZGluZyBhbm90aGVyIHN5bWJvbCBpcyBzdGlsbAo+IGEgYml0IG92ZXJraWxsPyAgVGhlIGRl
cGVuZGVuY2llcyBhcmUgc3RpbGwgb25seSAzIGxpbmVzIGFuZCBhcmUgcmF0aGVyCj4gc3RyYWln
aHQgZm9yd2FyZC4KClRoaXMgd291bGQgbm90IGJlIHVuaGVhcmQgb2YsIHRoZXJlIGFscmVhZHkg
YXJlIGEgZmV3IHBhY2thZ2VzIHdpdGggdmVyeQpmZXcgYXJjaCBkZXBlbmRlbmNpZXMsIGJ1dCB0
aGF0IHN0aWxsIGhhdmUgYSBkZWRpY2F0ZWQgc3ltYm9sLCBzZWUgZm9yCmV4YW1wbGUgKHNvbWUg
YXJlIG1vcmUgaW50ZXJlc3RpbmcsIGFzIHRoZXkgZG8gaGF2ZSBjb21tZW50cyBmb3IgZWFjaApk
ZXBlbmRlbmN5IHRoZXkgY2FycnkpOgogIC0gYmF5ZXIycmdiLW5lb24KICAtIGJpdGNvaW4KICAt
IGJwZnRyYWNlCiAgLSBkcGRrCiAgLSBob3N0LWZsdXR0ZXItc2RrLWJpbgogIC0gKGhvc3QtKWdk
YgogIC0gZ3RraW9zdHJlYW0KICAtIC4uLiBhbmQgc28gb24uLi4KCk5vdGUgdGhhdCB3ZSB1c3Vh
bGx5IGRvIHRoYXQgZm9yIGxpYnJhcmllcywgc28gdGhhdCBpdCBpcyBlYXNpZXIgdG8KaW5oZXJp
dCB0aGVpciBkZXBlbmRlbmNpZXMgaW4gc2VsZWN0aW5nIHBhY2thZ2VzLCBidXQgb2YgdGhlIGFi
b3ZlLApvbmx5IHR3byBhcmUgbGlicmFyaWVzLgoKQnV0IG1haW50YWluZXJzIHdpbGwgaGF2ZSB0
byBkZWNpZGUgd2hhdCB0aGV5IHdhbnQuIDstKQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0t
IAoKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tOsyFzIUgzIXMhcyFzIUg
zIXMhcyFzIUgzIXMhcyFzIUgzIXMhcyFzIUgzIXMhcyFzIUgzIXMhcyFzIUgzIXMhcyFzIVfzIUg
zIXMhcyFzIUgzIXMhcyFzIUgzIXMhcyFzIUgzIU6LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5u
IEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8ICAgIF9fLyApICAgfCAvIlwgQVNDSUkg
UklCQk9OIHwKfCAgICAgICAgICAgICAgICAgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCAgXy8gLSAv
JyAgIHwgXCAvIENBTVBBSUdOICAgICB8CnwgKzMzIDYzOC40MTEuMjQ1ICctLS0tLS0tLS0tLS0t
LS0tLS0tLTogKF8gICAgYC0tLCB8ICBYICBBR0FJTlNUICAgICAgfAp8IHlhbm4ubW9yaW4gKGF0
KSBvcmFuZ2UuY29tICAgICAgICAgICB8Xz0iICAgICwtLScgfCAvIFwgSFRNTCBNQUlMICAgIHwK
Jy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tOl9fX19fXy9fX19fXzotLS0t
LS0tLS0tLS0tLS0tLS0nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCkNlIG1lc3NhZ2UgZXQgc2VzIHBpZWNlcyBqb2ludGVzIHBldXZlbnQgY29u
dGVuaXIgZGVzIGluZm9ybWF0aW9ucyBjb25maWRlbnRpZWxsZXMgb3UgcHJpdmlsZWdpZWVzIGV0
IG5lIGRvaXZlbnQgZG9uYw0KcGFzIGV0cmUgZGlmZnVzZXMsIGV4cGxvaXRlcyBvdSBjb3BpZXMg
c2FucyBhdXRvcmlzYXRpb24uIFNpIHZvdXMgYXZleiByZWN1IGNlIG1lc3NhZ2UgcGFyIGVycmV1
ciwgdmV1aWxsZXogbGUgc2lnbmFsZXINCmEgbCdleHBlZGl0ZXVyIGV0IGxlIGRldHJ1aXJlIGFp
bnNpIHF1ZSBsZXMgcGllY2VzIGpvaW50ZXMuIExlcyBtZXNzYWdlcyBlbGVjdHJvbmlxdWVzIGV0
YW50IHN1c2NlcHRpYmxlcyBkJ2FsdGVyYXRpb24sDQpPcmFuZ2UgZGVjbGluZSB0b3V0ZSByZXNw
b25zYWJpbGl0ZSBzaSBjZSBtZXNzYWdlIGEgZXRlIGFsdGVyZSwgZGVmb3JtZSBvdSBmYWxzaWZp
ZS4gTWVyY2kuDQoNClRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzIG1heSBjb250YWlu
IGNvbmZpZGVudGlhbCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHByb3Rl
Y3RlZCBieSBsYXc7DQp0aGV5IHNob3VsZCBub3QgYmUgZGlzdHJpYnV0ZWQsIHVzZWQgb3IgY29w
aWVkIHdpdGhvdXQgYXV0aG9yaXNhdGlvbi4NCklmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgbWVz
c2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzLg0KQXMgZW1haWxzIG1heSBiZSBhbHRlcmVkLCBPcmFu
Z2UgaXMgbm90IGxpYWJsZSBmb3IgbWVzc2FnZXMgdGhhdCBoYXZlIGJlZW4gbW9kaWZpZWQsIGNo
YW5nZWQgb3IgZmFsc2lmaWVkLg0KVGhhbmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
