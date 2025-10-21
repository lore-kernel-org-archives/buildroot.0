Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A55CCD1A7
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 06:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F234052F;
	Tue, 21 Oct 2025 06:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48ZQ_0XvMi4h; Tue, 21 Oct 2025 06:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D39874055E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D39874055E;
	Tue, 21 Oct 2025 06:44:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7BDB43F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 06:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7A82403F7
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 06:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6ErOdXE9t4V for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 06:44:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BB89403EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BB89403EA
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BB89403EA
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 06:44:18 +0000 (UTC)
X-CSE-ConnectionGUID: KNoz4ebuSvykkisvBfaH0Q==
X-CSE-MsgGUID: +eubSCjbT1GpGxCMhBQzAQ==
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 21 Oct 2025 08:44:16 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Oct 2025 08:44:16 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.59;
 Tue, 21 Oct 2025 08:44:14 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 21 Oct 2025 08:44:13 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: NEuaqt/GRZe/3zALzdFx/Q==
X-CSE-MsgGUID: XEi2LWWQR4uoQzqY7AYE1Q==
X-IronPort-AV: E=Sophos;i="6.19,244,1754949600"; d="scan'208";a="347813058"
Date: Tue, 21 Oct 2025 08:44:13 +0200
To: James Hilliard <james.hilliard1@gmail.com>
CC: Christian Stewart <christian@aperture.us>, <buildroot@buildroot.org>
Message-ID: <aPcrvYrBo+D90ALa@yd-6wlzhs3>
References: <20251020225424.98853-1-james.hilliard1@gmail.com>
 <aPcNRwNOMOrNTLUB@yd-6wlzhs3>
 <CA+h8R2rkGCQeJbEvR6wHRX8q5s1D2EP2OXk9ieMr326TqTofaw@mail.gmail.com>
 <aPcb5J8rX6TuKsW2@yd-6wlzhs3>
 <CADvTj4p0B68BCMy60mmQf71DKhHq1vYGQpxFtEEou_PZXuTdew@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4p0B68BCMy60mmQf71DKhHq1vYGQpxFtEEou_PZXuTdew@mail.gmail.com>
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX203.corporate.adroot.infra.ftgroup (10.115.26.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1761029059; x=1792565059;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=SeVznZWQfpw8Qu2+ebIWg8xCprmimnoWPuddy57EGz0=;
 b=CpQGgEEpoyoIJv6E/C6O8VWQo3VhWNuWusZ8w4PVap8NBUUzvjGjvFRX
 9LEWWZqeqI7qtteyjCERLMV15Wn50WsPCtmXVmYLUsiPZM07Hiqb522CO
 cyvlKIe+EfqDn0NExgZrcwjharriUC2Piwo5IDuqe6qdzf90ZtdTafqpU
 XFyz4gWTfQc0HdF+wjBWIcCq7KJc2J6BHE422EAq6nwDAoPugWvqI3uQ4
 HgEJZDnpsHTYgG7Drx1ekks3VA1ws2CU+wJWnTB/B7Antr8g0exA8KOyA
 XB3ouCOZUn+nO3UIZzc6IX/VpyKQm+zH2js6OOUEsF8nFVsY9iRGCwKnY
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=CpQGgEEp
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

SmFtZXMsIEFsbCwKCk9uIDIwMjUtMTAtMjAgMjM6NDkgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBNb24sIE9jdCAyMCwgMjAyNSBhdCAxMTozNuKAr1BNIDx5YW5uLm1v
cmluQG9yYW5nZS5jb20+IHdyb3RlOgpbLS1TTklQLS1dCj4gVGhlIGlzc3VlIGlzIHRoYXQgaXQn
cyBleHBlY3RlZCBieSB1cHN0cmVhbSBnbyBwYWNrYWdlcyB0aGF0IGFsbAo+IGhhc2hlcyBhcmUg
Zm9yIGNhY2hlZCBnb3Byb3h5IHNvdXJjZXMsIG5vdCBkaXJlY3Qgc291cmNlcy4gU28KPiBkaXJl
Y3Qgc291cmNlcyBicmVha2luZyB3b3VsZG4ndCBldmVuIGJlIGNvbnNpZGVyZWQgYW4gaXNzdWUK
PiBieSBhbiB1cHN0cmVhbSBwYWNrYWdlIGFzIHRoZXkgYWx3YXlzIHVzZSBjYWNoZWQgc291cmNl
cy4KCkFjdHVhbGx5LCBzb21lIGRvIGNhcmU6CgogICAgaHR0cHM6Ly9naXRodWIuY29tL2VsYXN0
aWMvYmVhdHMvaXNzdWVzLzM2OTQ5Cgo+ID4gWy0tU05JUC0tXQo+ID4gPiBGV0lXIEkndmUgb3Zl
cnJpZGRlbiBpdCB0byAiZGlyZWN0IiBpbiBteSBvd24gQnVpbGRyb290IGJyYW5jaCBhcyBJCj4g
PiA+IHN0aWxsIHByZWZlciBmcm9tLUdpdCBzb3VyY2VzLgo+ID4gWWVzLCBJIGJlbGlldmUgdGhp
cyBzaG91bGQgYmUgdGhlIGRlZmF1bHQuCj4gVGhpcyB3aWxsIGJyZWFrIHBhY2thZ2UgZG93bmxv
YWRzLCBwYWNrYWdlIGRvd25sb2FkcyBlc3NlbnRpYWxseQo+IGFsd2F5cyB3b3JrIHdpdGggdGhl
IGNhY2hpbmcgZ29wcm94eSBiZWNhdXNlIHRoYXQncyB3aGF0IHRoZSBnbwo+IGVjb3N5c3RlbSBk
ZWNpZGVkIG9uIGZvciB0aGVpciBkZWZhdWx0LiBPdmVycmlkaW5nIHRoZSBnb2xhbmcgZGVmYXVs
dAo+IGNhdXNlcyBhIGxvdCBvZiBicmVha2FnZSBiZWNhdXNlIG9mIHRoaXMuCgpTdGF0aW5nICJh
IGxvdCIgaXMgYSBiaXQgb2YgYW4gZXhhZ2VyYXRpb246IGluIHRoZSBtYW55IHllYXJzIHdlIGhh
dmUKaGFkIHRoZSBnbyB2ZW5kb3JpbmcgaW4gQnVpbGRyb290LCB0YWlsc2NhbGUgaXMgdGhlIGZp
cnN0IHRoYXQgaXMKcmVwb3J0ZWQgdG8gYmUgY2F1c2luZyBhbiBhY3R1YWwgaXNzdWUgKEkgcmVt
ZW1iZXIgc29tZSBwcmV2aW91cyBpc3N1ZXMKdGhhdCB3ZXJlIGV2ZW50dWFsbHkgcmVzb2x2ZWQg
b25lIHdheSBvciB0aGUgb3RoZXIsIGJ1dCBub3QgYnkgdXNpbmcgYQpwcm94eSkuCgpTcGVha2lu
ZyBvZiB0aGF0OiBkbyBhbGwgdGhlIGdvIHBhY2thZ2VzIHdlIGhhdmUgaW4gQnVpbGRyb290IHN0
aWxsCmRvd25sb2FkIE9LIHdpdGggdGhpcyBjaGFuZ2UgYW5kIHdpdGhvdXQgdXNpbmcgcy5iLm8g
KGFuZCBvZiBjb3Vyc2UKd2l0aG91dCBhIGxvY2FsIGRsLyk/CgpbLS1TTklQLS1dCj4gPiBJbiB0
aGUgZW5kLCBpdCBzaG93cyB0aGF0IHVzaW5nIGEgZ29wcm94eSBpcyBub3QgYSBtYWdpYyBidWxs
ZXQgdG8gc29sdmUKPiA+IHZlbmRvcmluZyB3aGVuIHVwc3RyZWFtIGFuZCB0aGUgZ29wcm94eSBk
aXNhZ3JlZSBvbiB0aGUgY29udGVudCBvZiBhCj4gPiB2ZXJzaW9uLi4uCj4gVGhhdCdzIG5vdCB0
cnVlIGR1ZSB0byBhbGwgcGFja2FnZXMgZXhwZWN0aW5nIHRoZSBjYWNoZWQgZ29wcm94eSBzb3Vy
Y2VzCj4gdG8gYmUgdmFsaWQuIEZyb20gbXkgdW5kZXJzdGFuZGluZyBHT1BST1hZPWRpcmVjdCBp
cyBzaW1wbHkgbm90Cj4gcmVsaWFibGUgZW5vdWdoIGZvciBnbyBwcm9qZWN0cyB3aXRoIGxhcmdl
ciBkZXBlbmRlbmN5IHRyZWVzLgoKVGhhdCdzIHVuZm9ydHVuYXRlLCBhbmQgYWRkcyBhIGxheWVy
IG9mIHVuY2VydGFpbnR5IGluIHRoZSBtaXgsIGFsbG93aW5nCmZvciBzdXBwbHktY2hhaW4gYXR0
YWNrcyDDoC1sYSBOUE0gb3IgUHlQaSB0byBiZSBtYWRlIGFnYWluc3QgYSBnb3Byb3h5LgoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgX19fX19fX19fX19fCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLTogICAgICAgXyAgICA6LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8
IFJlYWwtVGltZSBFbWJlZGRlZCB8ICAgIF9fLyApICAgfCAvIlwgQVNDSUkgUklCQk9OIHwKfCAg
ICAgICAgICAgICAgICAgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCAgXy8gLSAvJyAgIHwgXCAvIENB
TVBBSUdOICAgICB8CnwgKzMzIDYzOC40MTEuMjQ1ICctLS0tLS0tLS0tLS0tLS0tLS0tLTogKF8g
ICAgYC0tLCB8ICBYICBBR0FJTlNUICAgICAgfAp8IHlhbm4ubW9yaW4gKGF0KSBvcmFuZ2UuY29t
ICAgICAgICAgICB8Xz0iICAgICwtLScgfCAvIFwgSFRNTCBNQUlMICAgIHwKJy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tOl9fX19fXy9fX19fXzotLS0tLS0tLS0tLS0tLS0t
LS0nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
CkNlIG1lc3NhZ2UgZXQgc2VzIHBpZWNlcyBqb2ludGVzIHBldXZlbnQgY29udGVuaXIgZGVzIGlu
Zm9ybWF0aW9ucyBjb25maWRlbnRpZWxsZXMgb3UgcHJpdmlsZWdpZWVzIGV0IG5lIGRvaXZlbnQg
ZG9uYw0KcGFzIGV0cmUgZGlmZnVzZXMsIGV4cGxvaXRlcyBvdSBjb3BpZXMgc2FucyBhdXRvcmlz
YXRpb24uIFNpIHZvdXMgYXZleiByZWN1IGNlIG1lc3NhZ2UgcGFyIGVycmV1ciwgdmV1aWxsZXog
bGUgc2lnbmFsZXINCmEgbCdleHBlZGl0ZXVyIGV0IGxlIGRldHJ1aXJlIGFpbnNpIHF1ZSBsZXMg
cGllY2VzIGpvaW50ZXMuIExlcyBtZXNzYWdlcyBlbGVjdHJvbmlxdWVzIGV0YW50IHN1c2NlcHRp
YmxlcyBkJ2FsdGVyYXRpb24sDQpPcmFuZ2UgZGVjbGluZSB0b3V0ZSByZXNwb25zYWJpbGl0ZSBz
aSBjZSBtZXNzYWdlIGEgZXRlIGFsdGVyZSwgZGVmb3JtZSBvdSBmYWxzaWZpZS4gTWVyY2kuDQoN
ClRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlh
bCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHByb3RlY3RlZCBieSBsYXc7
DQp0aGV5IHNob3VsZCBub3QgYmUgZGlzdHJpYnV0ZWQsIHVzZWQgb3IgY29waWVkIHdpdGhvdXQg
YXV0aG9yaXNhdGlvbi4NCklmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQgaXRz
IGF0dGFjaG1lbnRzLg0KQXMgZW1haWxzIG1heSBiZSBhbHRlcmVkLCBPcmFuZ2UgaXMgbm90IGxp
YWJsZSBmb3IgbWVzc2FnZXMgdGhhdCBoYXZlIGJlZW4gbW9kaWZpZWQsIGNoYW5nZWQgb3IgZmFs
c2lmaWVkLg0KVGhhbmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
