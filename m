Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B114CCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 05:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0C1360640;
	Tue, 21 Oct 2025 05:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyD_RoIHCH56; Tue, 21 Oct 2025 05:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E459060641
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E459060641;
	Tue, 21 Oct 2025 05:36:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72332277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50A6740546
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xV0xrG0VOaSb for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 05:36:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E52740486
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E52740486
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E52740486
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:36:40 +0000 (UTC)
X-CSE-ConnectionGUID: EjXz5rMVSNO4M2EE5hSalA==
X-CSE-MsgGUID: H7QpLJSDSve/HVhDJNljoQ==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 21 Oct 2025 07:36:37 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Oct 2025 07:36:38 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.59;
 Tue, 21 Oct 2025 07:36:36 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 21 Oct 2025 07:36:36 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: XIa/5D1ORk6kSpQwATcq1Q==
X-CSE-MsgGUID: 4ouqYAiqRnqElpNEPgzQ8A==
X-IronPort-AV: E=Sophos;i="6.19,244,1754949600"; d="scan'208";a="347880726"
Date: Tue, 21 Oct 2025 07:36:36 +0200
To: Christian Stewart <christian@aperture.us>
CC: James Hilliard <james.hilliard1@gmail.com>, <buildroot@buildroot.org>
Message-ID: <aPcb5J8rX6TuKsW2@yd-6wlzhs3>
References: <20251020225424.98853-1-james.hilliard1@gmail.com>
 <aPcNRwNOMOrNTLUB@yd-6wlzhs3>
 <CA+h8R2rkGCQeJbEvR6wHRX8q5s1D2EP2OXk9ieMr326TqTofaw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2rkGCQeJbEvR6wHRX8q5s1D2EP2OXk9ieMr326TqTofaw@mail.gmail.com>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX402.corporate.adroot.infra.ftgroup
 (10.115.26.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1761025000; x=1792561000;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=4n3PdPL8hEGGN8uqKlMzYliVKOsy4qHjFlPog7DvPhY=;
 b=RQ8yeiEab086ikuyKbti5gOGmTziL/DjMSXI9JQHEmMswLtMAAyEzMsR
 UiKGdJ1Nq6UOiVMxZ3rJU2V3UBonTKEtG84Yrvir2HUslFDc5wFgYlM/U
 ShjI2HrRfO05I41ClC6VjVipqkSg+dDm6xeSRq0In783VHKMFMFf69iR9
 6SDKOdkuzFJIC0T0JzxJmeZNhEdhzLnHRDr2347Vyae96KnPGDUllFnPm
 Zm7qHSj+HKOCXiUOf5dmgtOWlyAlbrqYhHuBKTKUMefV/Ahs/2iVZxJsA
 iNBAB+cSqQNEKOW5DieVsRESW20QO6X0KP3WRPsSG/FTOP0Nxru+ehE5T
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=RQ8yeiEa
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pkg-golang.mk: make GOPROXY
 configurable
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

Q2hyaXN0aWFuLCBBbGwsCgpPbiAyMDI1LTEwLTIwIDIyOjA5IC0wNzAwLCBDaHJpc3RpYW4gU3Rl
d2FydCBzcGFrZSB0aHVzbHk6Cj4gT24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgOTozNOKAr1BNIDx5
YW5uLm1vcmluQG9yYW5nZS5jb20+IHdyb3RlOgo+ID4gPiAtIEF2b2lkIHBhY2thZ2UgYnJlYWth
Z2VzIGR1ZSB0byBtaXNzaW5nIG1vZHVsZSBzb3VyY2VzCj4gPiBIb3cgY2FuIHNvdXJjZXMgYmUg
bWlzc2luZyB3aGVuIGZldGNoZWQgImRpcmVjdCJseT8KPiBXZSBoYWQgc2l0dWF0aW9ucyB3aGVy
ZSBHaXQgdGFncyB3ZXJlIGZvcmNlLXB1c2hlZCBwb3N0LWZhY3RvIGNhdXNpbmcgYnJlYWthZ2Vz
LgoKQnV0IHRoZW4gdXNpbmcgYSBnb3Byb3h5IGNvdWxkIGFsc28gY2F1c2UgYnJlYWthZ2UgaWYg
YSByZXZlcnNlCmRlcGVuZGVuY3kgdXNlZCAiZGlyZWN0IiB0byBmZXRjaCBzb3VyY2VzIGZyb20g
dXBzdHJlYW0gYWZ0ZXIgdGhleQpmb3JjZS1wdXNoZWQgdGhlIGdpdCB0YWcsIG5vPwoKRm9yIGV4
YW1wbGUsIGNvbnNpZGVyIHRoZSBmb2xsb3dpbmcgdGltZWxpbmU6CiAgKiBwYWNrYWdlIEEgdGFn
cyB2MQogICogcGFja2FnZSBCIHVzZXMgQS12MQogICogc29tZW9uZSBncmFicyBwYWNrYWdlIEIg
YW5kIHZlbmRvcnMgaXQgdXNpbmcgZ29wcm94eSA9PiBnb3Byb3h5CiAgICBjYWNoZXMgQS12MQog
ICogcGFja2FnZSBBIGZvcmNlLXB1c2hlcyB2MSAobGV0J3MgY2FsbCBpdCB2McK0KQogICogcGFj
a2FnZSBDIHVzZXMgQS12McK0IG5vdCB1c2luZyBhIGdvcHJveHkgKG9yIGEgZGlmZmVyZW50IG9u
ZSEpCiAgKiBzb21lb25lIGdyYWJzIHBhY2thZ2UgQyBhbmQgdmVuZG9ycyBpdCB1c2luZyBnb3By
b3h5ID0+IGdldHMgdGhlCiAgICB3cm9uZyBzb3VyY2VzLi4uCgpBbmQgYSBnbyBwYWNrYWdlIHVw
c3RyZWFtIGZvcmNlLXB1c2hpbmcgYSB0YWcgaXMgbm90IGRpZmZlcmVudCBmb3IKdXMgQnVpbGRy
b290IHRoYW4gYSBub24tZ28gcGFja2FnZSB1cHN0cmVhbSBmb3JjZS1wdXNoaW5nIGEgdGFnOiBp
biBhbnkKY2FzZSwgd2UgZW5kIHVwIGV4cGVjdGluZyBhIHNwZWNpZmljIGhhc2ggZm9yIGEgdGFy
YmFsbCwgYnV0IHRoYXQncyBub3QKd2hhdCB3ZSBnb3QsIGFuZCB3ZSBjYW4ndCBibGluZGx5IHVw
ZGF0ZSBvdXIgLmhhc2ggZmlsZSBiZWNhdXNlIG9sZGVyCnZlcnNpb25zIHdvdWxkIGJlIGNhY2hl
ZCBvbiBzLmIuby4gKG9yIHRoZSBvdGhlciB3YXkgYXJvdW5kIGZvciBvbGRlcgpidWlsZHJvb3Qg
dmVyc2lvbnMpLiBUaGUgb25seSBzbG9naHQgZGlmZmVyZW5jZSBpcyB0aGF0IGluIG9uZSBjYXNl
LCB3ZQpCdWlsZHJvb3QgYXJlIGRvaW5nIHRoZSBoYXNoIGNoZWNrLCB3aGlsZSBpbiB0aGUgb3Ro
ZXIsIHRoZSBnbyB0b29saW5nCmRvZXMgdGhlIGNoZWNrLi4uCgpTbywgdXNpbmcgYSBnb3Byb3h5
IGlzIG5vdCBhIHNpbHZlciBidWxsZXQ6IG9uIGF2ZXJhZ2UgaXQgd291bGQKaW50cm9kdWNlIGFz
IG1hbnkgaGFzaCBpc3N1ZXMgYXMgaXQgd291bGQgc29sdmUuLi4KClstLVNOSVAtLV0KPiBGV0lX
IEkndmUgb3ZlcnJpZGRlbiBpdCB0byAiZGlyZWN0IiBpbiBteSBvd24gQnVpbGRyb290IGJyYW5j
aCBhcyBJCj4gc3RpbGwgcHJlZmVyIGZyb20tR2l0IHNvdXJjZXMuCgpZZXMsIEkgYmVsaWV2ZSB0
aGlzIHNob3VsZCBiZSB0aGUgZGVmYXVsdC4gVXNpbmcgYSBub24tZGlyZWN0IGdvcHJveHkKY291
bGQgYmUgaW50ZXJlc3RpbmcgaW4gY29tcGFueSBuZXR3b3JrcyB0aGF0IGhhdmUgdGhlaXJlIG93
biBpbnRlcm5hbApnb3Byb3h5IHRoYXQgYWN0dWFseSBwcm94aWVzIHRvIHRoZSBvdXR0ZXIgaW50
ZXJuZXQgdGhhdCBpcyBvdGhlcndpc2UKZmlsdGVyZWQuCgo+ID4gPiAtIEJldHRlciBhbGlnbm1l
bnQgd2l0aCB1cHN0cmVhbSBHbyB0b29sY2hhaW4gZGVmYXVsdHMKPiA+ID4gLSBGYXN0ZXIgZG93
bmxvYWRzIHZpYSB0aGUgcHJveHkgY29tcGFyZWQgdG8gZGlyZWN0IEdpdCBjbG9uZXMKPiA+ID4g
LSBNYWludGFpbnMgcmVwcm9kdWNpYmxlIGJ1aWxkcyB0aHJvdWdoIEdvJ3MgbW9kdWxlIGNoZWNr
c3VtIHZhbGlkYXRpb24KPiA+Cj4gPiBJbiB0aGUgcGFzdCwgd2Ugb2JzZXJ2ZWQgdGhlIHJldmVy
c2U6IHRoZSBnb3Byb3h5IGhhZCBhIHN0YWxlIHZlcnNpb24KPiA+IHRoYXQgd2FzIG5vdCBtYXRj
aGluZyB0aGUgdXBzdHJlYW0gb25lLCBzbyB3aGVuIHdlIHRyaWVkIHRvIHZlbmRvciBhCj4gPiBw
YWNrYWdlLCB0aGUgaGFzaGVzIHdvdWxkIG5vdCBtYXRjaC4gVXNpbmcgImRpcmVjdCIgZml4ZWQg
dGhlIGlzc3VlCj4gPiAoc29ycnksIEkgY2FuJ3QgcmVtZW1iZXIgd2hhdCBwYWNrYWdlIHRoYXQg
d2FzLi4uKQo+IEkgdGhpbmsgaXQgd2FzIHRoZSBvdGhlciB3YXkgYXJvdW5kLCBHT1BST1hZIGhh
ZCB0aGUgc3RhbGUgdmVyc2lvbiB5ZXMsCj4gLi4uIGJ1dCB0aGUgZG93bnN0cmVhbSBkZXBlbmRl
bmNpZXMgb2Ygc2FpZCBwYWNrYWdlIGFsc28gZXhwZWN0ZWQgdGhlCj4gc3RhbGUgdmVyc2lvbi4K
CkFoLCBJIGRvIHJlbWVtYmVyIGFub3RoZXIgY2FzZSwgd2hlcmUgdGhlIGdvcHJveHkgaGFkIGEg
bmV3ZXIgdmVyc2lvbiwKYnV0IHRoZSByZXZlcnNlIGRlcGVuZGVuY2llcyBleHBlY3RlZCB0aGUg
c3RhbGUgb25lLiBCdXQgbXkgbWVtb3J5IGlzIGEKYml0IGZ1enp5IGFib3V0IHRoYXQuLi4KCklu
IHRoZSBlbmQsIGl0IHNob3dzIHRoYXQgdXNpbmcgYSBnb3Byb3h5IGlzIG5vdCBhIG1hZ2ljIGJ1
bGxldCB0byBzb2x2ZQp2ZW5kb3Jpbmcgd2hlbiB1cHN0cmVhbSBhbmQgdGhlIGdvcHJveHkgZGlz
YWdyZWUgb24gdGhlIGNvbnRlbnQgb2YgYQp2ZXJzaW9uLi4uCgpSZWdhcmRzLApZYW5uIEUuIE1P
UklOLgoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19f
X19fX18KLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tOiAgICAgICBfICAg
IDotLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgICAgX18vICkgICB8IC8iXCBBU0NJSSBSSUJCT04gfAp8ICAgICAgICAgICAgICAgICB8
IFNvZnR3YXJlICBEZXNpZ25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKfCAr
MzMgNjM4LjQxMS4yNDUgJy0tLS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAgICBgLS0sIHwgIFggIEFH
QUlOU1QgICAgICB8CnwgeWFubi5tb3JpbiAoYXQpIG9yYW5nZS5jb20gICAgICAgICAgIHxfPSIg
ICAgLC0tJyB8IC8gXCBIVE1MIE1BSUwgICAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS06X19fX19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KQ2UgbWVzc2FnZSBldCBz
ZXMgcGllY2VzIGpvaW50ZXMgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNvbmZp
ZGVudGllbGxlcyBvdSBwcml2aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jDQpwYXMgZXRyZSBk
aWZmdXNlcywgZXhwbG9pdGVzIG91IGNvcGllcyBzYW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBh
dmV6IHJlY3UgY2UgbWVzc2FnZSBwYXIgZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWduYWxlcg0KYSBs
J2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4g
TGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlv
biwNCk9yYW5nZSBkZWNsaW5lIHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBl
dGUgYWx0ZXJlLCBkZWZvcm1lIG91IGZhbHNpZmllLiBNZXJjaS4NCg0KVGhpcyBtZXNzYWdlIGFu
ZCBpdHMgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQg
aW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsNCnRoZXkgc2hvdWxkIG5v
dCBiZSBkaXN0cmlidXRlZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLg0K
SWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMuDQpB
cyBlbWFpbHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdl
cyB0aGF0IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuDQpUaGFuayB5
b3UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
