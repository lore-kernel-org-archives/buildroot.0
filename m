Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524F9C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 09:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE60941E8B;
	Fri, 10 Nov 2023 09:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE60941E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ruhhZtTVQgzF; Fri, 10 Nov 2023 09:46:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 122DB41E8E;
	Fri, 10 Nov 2023 09:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 122DB41E8E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76B701BF97F
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 09:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F47260F4E
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 09:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F47260F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYhxQOVXXWBb for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 09:46:40 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9528D60759
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 09:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9528D60759
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 10:46:34 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Nov 2023 10:46:32 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 10:46:31 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Fri, 10 Nov 2023 10:46:30 +0100
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.03,291,1694728800"; d="scan'208";a="65232523"
Date: Fri, 10 Nov 2023 10:46:30 +0100
To: Jon Henrik =?utf-8?Q?Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Message-ID: <ZU379oHV4pCxnXmH@tl-lnx-nyma7486-2>
References: <20231109142009.3490104-1-jonhenrik@qbee.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109142009.3490104-1-jonhenrik@qbee.io>
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX607.corporate.adroot.infra.ftgroup
 (10.115.27.31) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1699609600; x=1731145600;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=2OlPoRQc43A1YxYkJ2EBqzBzuIUl8FAIf4wRKf1ETLo=;
 b=KssNv8A5lHfxxG+XGbSG/i6WS7ajmKbQD7n7Q1T6E1RubvzrufWN4SkO
 Ka+0vinfEho0j2AXMGoBstIayiTz7TnhsQUCfO2BkfNNa/LDn++gIMXwt
 hsSKVMha0AYjBOl/8djKYngOJ75AAEKWJMzV3cVOxL8Mfm+zAdac4YGhy
 aleVf/ssPl1p/moyNS7kiQxnphWXQciLPaBHm7tgnV7TEMVzYF0m7ZF+X
 2ZlyhfrRuPD/ebO4VCd8xSWfYLWmxc78IdWbyTC8rJ/0DcfeQDskK8Nq2
 RQaHym1CXVm+e0VsBNLP71fQnDQfk4tiHJblCFB7gVuWcNbA6uBE4EzHA
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=KssNv8A5
Subject: Re: [Buildroot] [PATCH 0/1] Regarding review of qbee-agent patch
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9uLCBBbGwsCgpPbiAyMDIzLTExLTA5IDE1OjIwICswMTAwLCBKb24gSGVucmlrIEJqw7hybnN0
YWQgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gTGljZW5zZSBmaWxlOgo+IFRoZSB0YXJi
YWxsIGluIHVzZSBkb2VzIG5vdCBjb250YWluIGEgbGljZW5zZSBmaWxlLiBJJ20gZmFpcmx5IG5l
dyB0bwo+IHRoZSBidWlsZHJvb3QgcHJvamVjdCBhbmQgaGF2ZSB1c2VkIGEgbG90IG9mIGV4aXN0
aW5nIHBhY2thZ2UgaW1wbGVtZW50YXRpb25zCj4gYXMgaW5zcGlyYXRpb24uIElzIGEgbGljZW5z
ZSBmaWxlIHJlcXVpcmVkIHdoZW4gdXNpbmcgYSBnZW5lcmFsIGxpY2Vuc2UgCj4gbGlrZSBBcGFj
aGUgMi4wPwoKWWVzLCB3ZSB3YW50IHRvIHBvaW50IHRvIHRoZSBsaXZlbnNlIGZpbGUuIElmIHlv
dSBidWlsZCBmcm9tIHRoZSBnbwpzb3VyY2VzIGFzIHRoZXkgYXJlIG9uIGdpdGh1YiwgeW91J2xs
IHRoZW4gYmUgYWJsZSB0byB1c2UgdGhlIExJQ0VOU0UKZmlsZSBwcmVzZW50IHRoZXJlLgoKWW91
IHdpbGwgYWxzbyBuZWVkIHRvIHByb3ZpZGUgYSBoYXNoIChpbiB0aGUgLmhhc2ggZmlsZSkgZm9y
IHRoZSBsaWNlbnNlCmZpbGUsIHNvIHRoYXQgaXQgaXMgY2hlY2tlZCB3aGVuIHJ1bm5pbmcgIm1h
a2UgbGVnYWwtaW5mbyIuIElmIHRoZQpsaWNlbnNlIGNoYW5nZXMsIHRoZW4gdGhlIExJQ0VOU0Ug
ZmlsZSB3aWxsIG5vIGxvbmdlciBtYXRjaCB0aGUgZXhwZWN0ZWQKaGFzaCwgYW5kIHdlIHdpbGwg
bm90aWNlIGFuZCBiZSBhYmxlIHRvIHJlYmlvZXcgdGhlIG5ldyBsaWNlbnNpbmcgdGVybXMuCgo+
IFN0YXRpYyBiaW5hcmllczoKPiBUaGUgYmluYXJpZXMgYXJlIHN0YXRpY2FsbHkgYnVpbHQgd2l0
aCBhIHB1YmxpYyBwYXJ0IG9mIGEgc2lnbmluZyBrZXkKPiBhcyBwYXJ0IG9mIHRoZSBjb21waWxl
IHRpbWUgYXJndW1lbnRzLiBUaGlzIHB1YmxpYyBrZXkgaXMgdXNlZCB0byB2ZXJpZnkKPiBkb3du
bG9hZGVkIHN0YXRpYyBydW50aW1lIGJpbmFyaWVzIGZyb20gdGhlIHFiZWUuaW8gU2FhUyBwbGF0
Zm9ybSB3aGljaAo+IGlzIHNpZ25lZCB3aXRoIHRoZSBwcm9kdWN0aW9uIHNpZ25pbmcga2V5LgoK
PiBDdXJyZW50bHkgb25seSBhcm1zIGFuZCBpbnRlbHMKPiBhcmUgc3VwcG9ydGVkLAoKSWYgdGhl
cmUgYXJlIGRlcGVuZGVuY2llcyBvbiB0aGUgdGFnZXQgYXJjaCwgdGhlbiB5b3UgbXVzdCBhZGQg
dGhhdCBpbgp0aGUgQ29uZmlnLmluOgoKICAgIGNvbmZpZyBvbiBCUjJfUEFDS0FHRV9RQkVFX0FH
RU5UX0FSQ0hfU1VQUE9SVFMKICAgICAgICBib29sCiAgICAgICAgZGVmYXVsdCB5IGlmIEJSMl9h
cm0KICAgICAgICBkZWZhdWx0IGkgaWYgQlIyX3g4Nl82NAogICAgICAgIGFuZCBzbyBvbi4uLgoK
ICAgIGNvbmZpZyBCUjJfUEFDS0FHRV9RQkVFX0FHRU5UCiAgICAgICAgYm9vbCAicWJlZS1hZ2Vu
dCIKICAgICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1FCRUVfQUdFTlRfQVJDSF9TVVBQT1JU
UwoKPiBidXQgdGhpcyB3aWxsIGNoYW5nZSB3aXRoIGZ1dHVyZSByZWxlYXNlcyB3aGVyZSB0aGUK
PiBkZXBlbmRlbmN5IG9uIGRvd25sb2FkZWQgc3RhdGljIHJ1bnRpbWUgYmluYXJpZXMgd2lsbCBi
ZSByZW1vdmVkLgoKSSBob3BlIEkgcHJvdmlkZWQgZW5vdWdoIGZlZWRiYWNrIGFuZCBzdWdnZXN0
aW9uIGFib3V0IHRoYXQgaW4gdGhlCnJldmlldyBvZiB0aGUgcGF0Y2guCgo+IFFCRUVfQUdFTlRf
R09BUkNIIHZzLiBHT19HT0FSQ0g6Cj4gSSBjaGFuZ2VkIHRoaXMgZHVlIHRvIGVycm9ycyBwcm9k
dWNlZCBieSB0aGUgY2hlY2stcGFja2FnZSB1dGlsaXR5Ogo+IFdpdGggR09fR09BUkNIOgo+ICQg
dXRpbHMvZG9ja2VyLXJ1biBtYWtlIGNoZWNrLXBhY2thZ2UKPiBwYWNrYWdlL3FiZWUtYWdlbnQv
cWJlZS1hZ2VudC5tazoxMjogcG9zc2libGUgdHlwbzogR09fR09BUkNIIC0+ICpRQkVFX0FHRU5U
Kgo+IHBhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lm1rOjE0OiBwb3NzaWJsZSB0eXBvOiBH
T19HT0FSQ0ggLT4gKlFCRUVfQUdFTlQqCj4gcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQu
bWs6MTY6IHBvc3NpYmxlIHR5cG86IEdPX0dPQVJDSCAtPiAqUUJFRV9BR0VOVCoKPiBwYWNrYWdl
L3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5tazoxODogcG9zc2libGUgdHlwbzogR09fR09BUkNIIC0+
ICpRQkVFX0FHRU5UKgoKV2hhdCB0aG9tYXMgbWVhbnQsIHdhcyB0byBhY3R1YWxseSBkaXJlY3Rs
eSB1c2UgJChHT19HT0FSQ0gpLCBsaWtlIHNvOgoKICAgICQoSU5TVEFMTCkgLW0gMDc1NSAkKEBE
KS9xYmVlLWFnZW50LSQoR09fR09BUkNIKSAkKFRBUkdFVF9ESVIpL3Vzci9iaW4vcWJlZS1hZ2Vu
dAoKQnV0IHRoaXMgaXMgbm90IGdvaW5nIHRvIGJlIG5lZWRlZCB3aGVuIHlvdSBzd2l0Y2ggdGhl
IHBhY2thZ2UgdG8gdXNlCnRoZSBnb2xhbmctcGFja2FnZSBpbmZyYSB0byBidWlsZCBmcm9tIHNv
dXJjZS4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IFRoYW5rIHlvdSBhZ2FpbiBmb3IgeW91
ciBmZWVkYmFjay4gCj4gCj4gV2l0aCBraW5kIHJlZ2FyZHMsCj4gCj4gSm9uIEhlbnJpayBCasO4
cm5zdGFkCj4gCj4gCj4gSm9uIEhlbnJpayBCasO4cm5zdGFkICgxKToKPiAgIHBhY2thZ2UvcWJl
ZS1hZ2VudDogbmV3IHBhY2thZ2UKPiAKPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAzICsrKwo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgIHwgIDEg
Kwo+ICBwYWNrYWdlL3FiZWUtYWdlbnQvQ29uZmlnLmluICAgICAgIHwgMTcgKysrKysrKysrKysr
Cj4gIHBhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2ggfCAgMiArKwo+ICBwYWNrYWdl
L3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5tayAgIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9xYmVlLWFnZW50L0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsKPiAKPiAtLSAKPiAyLjI1LjEKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX19fX18KLi0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tOiAgICAgICBfICAgIDotLS0tLS0tLS0tLS0tLS0t
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
