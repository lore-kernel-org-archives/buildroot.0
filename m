Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A131C8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 13:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D01DD409EA;
	Mon,  7 Jul 2025 13:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5e7ZIACR4wP; Mon,  7 Jul 2025 13:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1F3440826
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1F3440826;
	Mon,  7 Jul 2025 13:47:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AAE315F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80E1A60A95
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bg-hUYegzftu for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 13:47:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5956A6070E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5956A6070E
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5956A6070E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:47:21 +0000 (UTC)
X-CSE-ConnectionGUID: xWyIz/ClRVyUOeg5vIWg0A==
X-CSE-MsgGUID: 01FXq9XZRo61B4cXg7psTg==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 15:47:20 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Jul 2025 15:47:19 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Mon, 7 Jul 2025 15:47:18 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 07 Jul 2025 15:47:17 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: 5VveESivQUuWmr8ghee/FQ==
X-CSE-MsgGUID: LQmkfL5rRIq1ovCQ70b0Ag==
X-IronPort-AV: E=Sophos;i="6.16,294,1744063200"; d="scan'208";a="310659081"
Date: Mon, 7 Jul 2025 15:47:17 +0200
To: Romain Naour <romain.naour@smile.fr>
CC: <buildroot@buildroot.org>, Christian Stewart <christian@aperture.us>
Message-ID: <aGvP5fs5j/0a9EZG@yd-6wlzhs3>
References: <cover.1751377540.git.yann.morin@orange.com>
 <d23125d705a0c24ca91071624d507392ecfe7b0d.1751377540.git.yann.morin@orange.com>
 <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX406.corporate.adroot.infra.ftgroup
 (10.115.27.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751896043; x=1783432043;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=RH8rff0YGCU6+O3FnzRMrtL+YHmafm/iFr/kF8ZxvDo=;
 b=oaGpyCrU0B2Ullh/bUja7CTtsZyXIFL9WMCtWruwOR2yZEClThfKEBRs
 EzsqDyqk45l5HVt0Xgq6wIGu9vNKsPYi5o4GRPP6OwOtx/WgE0qAlUAZO
 5PkY9znyLXy4xdbDJnKd9yr4lHLxOaf5kbUtyOVEfg1xDL0+olxPWWXLn
 GRHnNkHZHTWZFFC9uqv6gq1L2falFGa31YQBqQl8FfypiOnW6FlFdo6iW
 AimGYrBq7mF0aPBo1UG0TQ8B7iMBf7IK5bDS/GdW9N7V5JkZWDzJulwJc
 IKpFesYLAyBqgjjCYeTRPoTFcNn8AUhb0H+SBQJYgqyCndUDUKplwciL6
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=oaGpyCrU
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
bWUgbGlzdCBpbiBpdHMgX0lOU1RBTExfQklOUy4KTmljb2xhcyBCVUZGT04gPG5pY29sYXMuYnVm
Zm9uQG9yYW5nZS5jb20+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluQG9yYW5nZS5jb20+Cj4gPiBDYzogQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBh
cGVydHVyZS51cz4KPiBSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21p
bGUuZnI+Cj4gU2luY2UgaXQncyBhYm91dCBhIHBhY2thZ2UgaW5mcmFzdHVjdHVyZSBjaGFuZ2Us
IEkgcHJlZmVyIHdhaXQgZm9yIGEgc2Vjb25kIHJldmlldy4KClRoYW5rcyBmb3IgdGhlIHJldmll
dyEKClstLVNOSVAtLV0KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1nb2xhbmcubWsgYi9w
YWNrYWdlL3BrZy1nb2xhbmcubWsKPiA+IGluZGV4IGE0ZThiZDMwY2MuLmZmOGQyOGFhN2UgMTAw
NjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3BrZy1nb2xhbmcubWsKPiA+ICsrKyBiL3BhY2thZ2UvcGtn
LWdvbGFuZy5tawo+ID4gQEAgLTYxLDkgKzYxLDE2IEBAICQoMilfQlVJTERfVEFSR0VUUyA/PSAu
Cj4gPiAgIyBhZnRlciBlYWNoIGJ1aWxkIHRhcmdldCBidWlsZGluZyB0aGVtIChiZWxvdyBpbiA8
cGtnPl9CVUlMRF9DTURTKS4KPiA+ICBpZmVxICgkJCgkKDIpX0JVSUxEX1RBUkdFVFMpLC4pCj4g
PiAgJCgyKV9CSU5fTkFNRSA/PSAkJCgkKDIpX1JBV05BTUUpCj4gPiArJCgyKV9JTlNUQUxMX0JJ
TlMgPz0gJCQoJCgyKV9CSU5fTkFNRSkKPiA+ICtlbHNlIGlmZXEgKCQkKHdvcmRzICQkKCQoMilf
QlVJTERfVEFSR0VUUykpLDEpCj4gPiArJCgyKV9CSU5fTkFNRSA/PSAkJChub3RkaXIgJCQoJCgy
KV9CVUlMRF9UQVJHRVRTKSkKPiA+ICskKDIpX0lOU1RBTExfQklOUyA/PSAkJCgkKDIpX0JJTl9O
QU1FKQo+ID4gK2Vsc2UKPiA+ICtpZm5lcSAoJCQoJCgyKV9CSU5fTkFNRSksKQo+ID4gKyQkKGVy
cm9yICQoMSkgc2V0cyAkKDIpX0JJTl9OQU1FIHdoaWxlIHRoZXJlIGFyZSBtdWx0aXBsZSB0YXJn
ZXRzIGluICQoMilfQlVJTERfVEFSR0VUUykKPiA+ICtlbmRpZgo+ID4gKyQoMilfSU5TVEFMTF9C
SU5TID89ICQkKG5vdGRpciAkJCgkKDIpX0JVSUxEX1RBUkdFVFMpKQo+ID4gIGVuZGlmCj4gCj4g
SXMgb3VyIHRlc3RzdWl0ZSBpcyB0ZXN0aW5nIGVhY2ggdXNlIGNhc2U/CgpEZXBlbmRzOiBkbyB3
ZSBoYXZlIGF0IGxlYXN0IG9uZSBwYWNrYWdlIHRvIGNvdmVyIGVhY2ggY2FzZT8gOy0pCgpJJ2xs
IHRyeSB0byBkaWcgdGhhdCBpbiB0aGUgY29taW5nIGRheXMuCgpUaGFua3MgZm9yIHRoZSBmZWVk
YmFjay4gOi0pCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX19fX18KLi0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tOiAgICAgICBfICAgIDotLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlh
bm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgICAgX18vICkgICB8IC8iXCBBU0NJ
SSBSSUJCT04gfAp8ICAgICAgICAgICAgICAgICB8IFNvZnR3YXJlICBEZXNpZ25lciB8ICBfLyAt
IC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKfCArMzMgNjM4LjQxMS4yNDUgJy0tLS0tLS0tLS0t
LS0tLS0tLS0tOiAoXyAgICBgLS0sIHwgIFggIEFHQUlOU1QgICAgICB8CnwgeWFubi5tb3JpbiAo
YXQpIG9yYW5nZS5jb20gICAgICAgICAgIHxfPSIgICAgLC0tJyB8IC8gXCBIVE1MIE1BSUwgICAg
fAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS06X19fX19fL19fX19fOi0t
LS0tLS0tLS0tLS0tLS0tLScKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KQ2UgbWVzc2FnZSBldCBzZXMgcGllY2VzIGpvaW50ZXMgcGV1dmVudCBj
b250ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNvbmZpZGVudGllbGxlcyBvdSBwcml2aWxlZ2llZXMg
ZXQgbmUgZG9pdmVudCBkb25jDQpwYXMgZXRyZSBkaWZmdXNlcywgZXhwbG9pdGVzIG91IGNvcGll
cyBzYW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBhdmV6IHJlY3UgY2UgbWVzc2FnZSBwYXIgZXJy
ZXVyLCB2ZXVpbGxleiBsZSBzaWduYWxlcg0KYSBsJ2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUg
YWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4gTGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMg
ZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwNCk9yYW5nZSBkZWNsaW5lIHRvdXRlIHJl
c3BvbnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBldGUgYWx0ZXJlLCBkZWZvcm1lIG91IGZhbHNp
ZmllLiBNZXJjaS4NCg0KVGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMgbWF5IGNvbnRh
aW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJv
dGVjdGVkIGJ5IGxhdzsNCnRoZXkgc2hvdWxkIG5vdCBiZSBkaXN0cmlidXRlZCwgdXNlZCBvciBj
b3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLg0KSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBl
bWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhpcyBt
ZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMuDQpBcyBlbWFpbHMgbWF5IGJlIGFsdGVyZWQsIE9y
YW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0IGhhdmUgYmVlbiBtb2RpZmllZCwg
Y2hhbmdlZCBvciBmYWxzaWZpZWQuDQpUaGFuayB5b3UuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
