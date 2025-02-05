Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B27C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDC314084A;
	Wed,  5 Feb 2025 11:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCBBTfx4WYDJ; Wed,  5 Feb 2025 11:58:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52163407A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52163407A7;
	Wed,  5 Feb 2025 11:58:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37211CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B55540779
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBFfSzRuoTkT for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:58:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79C714075C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79C714075C
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79C714075C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:58:05 +0000 (UTC)
X-CSE-ConnectionGUID: uTqTnNRfTYWvgzE3DHCGQQ==
X-CSE-MsgGUID: niwrPzEOTPa9CXphoWnW0g==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 12:58:03 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Feb 2025 12:58:03 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 5 Feb 2025 12:58:01 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 05 Feb 2025 12:58:00 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: x2QIRsz0R36RprC3kck/uQ==
X-CSE-MsgGUID: c1CXpAXVR5mKO9Kh9xyYFg==
X-IronPort-AV: E=Sophos;i="6.13,261,1732575600"; d="scan'208";a="247969741"
Date: Wed, 5 Feb 2025 12:58:00 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <Z6NSSKTVr43PjV+I@yd-6wlzhs3>
References: <20250205113531.4161633-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205113531.4161633-1-fiona.klute@gmx.de>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX206.corporate.adroot.infra.ftgroup (10.115.27.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738756686; x=1770292686;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=LzLLt766Im6mfSQO+cL1a+JCSuMli+l3XcgiE/UXzlo=;
 b=S4aznS90AUh72W4QXbtM8B3UlYjFiqNaeXwl102fetqJdBXwHBhK/S3G
 tGMQytoPVWLukwJ0qxA4v4VoezX42nRc39R+qL93nrgrFrS9wK+DIOsvJ
 XPBPbcl02I/O5Sb31ay6U77tREjTJ6XIYvLDVnHFDMQGPqD9KpKyQKx/y
 8gHKsCna3hr9qSDrJBt88QxrCfw8D40277EreKS72kpTTUe3jaeh/gxbD
 lgLSprs6U1ws4X5xIVMR0hf5Dmf+cbopxELI+qAsGGwDcoOx6tXeHmV8I
 yXHlfnl2fBTV8lLz0Rk/ijXclyVZ3Bto5qwF96xwehjUC8X8cNafoiL+/
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=S4aznS90
Subject: Re: [Buildroot] [PATCH v2 1/3] package/pkg-golang: allow packages
 to provide extldflags
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
Cc: Nathaniel Roach <nroach44@nroach44.id.au>,
 Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmlvbmEsIEFsbCwKClRoYW5rcyBmb3IgYWRvcHRpbmcgdGhpcyBwYXRjaCEgOi0pCgpPbiAyMDI1
LTAyLTA1IDEyOjM1ICswMTAwLCBGaW9uYSBLbHV0ZSBzcGFrZSB0aHVzbHk6Cj4gRnJvbTogIllh
bm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+Cj4gCj4gRm9yIHNvbWUgcGFja2Fn
ZXMsIGl0IG1heSBiZSBuZWNlc3NhcnkgdG8gcGFzcyBleHRyYSBleHRsZGZsYWdzLiBGb3IKPiBl
eGFtcGxlLCBzb21lIHBhY2thZ2VzIHdpbGwgbmVlZCB0byBiZSBhYmxlIHRvIHNwZWNpZnkgd2hh
dCBsZCB0byB1c2UsCj4gYW5kIHNvIHdpbGwgbmVlZCB0byBwYXNzIC1mdXNlLWxkPXtiZmQsZ29s
ZH0gYXMgZXh0bGRmbGFncy4KClRoZSByYXRpb25hbGUgaGFzIG5vdyBzbGlnaHRseSBjaGFuZ2Vk
LCBpbiBmYWN0OiBpdCBpcyBub3QgcGFja2FnZXMgdGhhdAp3aWxsIG5lZWQgdG8gYWRkIC1mdXNl
LWxkIGFueW9yZSwgYnV0IHRoZSBpbmZyYS4KClNvIG1heWJlIHdlIGNhbiByZXdyaXRlIHRoYXQg
Y29tbWl0IGxvZyBzbGlnaHRseToKCiAgICBDdXJyZW50bHksIG9ubHkgdGhlIC1zdGF0aWMgZXh0
bGRmbGFncyBtYXkgYmUgc2V0IGluIHRoZSBnb2xhbmctcGFja2FnZQogICAgaW5mcmEuIEhvd2V2
ZXIsIGluIHNvbWUgY2FzZXMsIGl0IG1pZ2h0IGJlIG5lY2Vzc2FyeSB0byBwYXNzIG90aGVyCiAg
ICBmbGFncywgZWl0aGVyIGJlY2F1c2UgdGhleSBhcmUgbmVlZGVkIG9uIGEgc3BlY2lmaWMgYXJj
aGl0ZWN0dXJlLCBvcgogICAgYSBzcGVjaWZpYyBDIGxpYnJhcnk7IHBhY2thZ2VzIG1heSBhbHNv
IGhhdmUgYSBuZWVkIHRvIGFwc3MKICAgIGFyYml0cmFyeSBsaW5rZXIgZmxhZ3Mgd2hlbiB0aGV5
IHVzZSBDR08gbGlua2luZy4KCiAgICBGb3IgZXhhbXBsZSwgb24gQUFyY2g2NCwgZ28gZm9yY2li
bHkgdXNlcyBsZC5nb2xkLCBidXQgaXQgaXMgbm90CiAgICBhdmFpbGFibGUgaW4gYWxsIHRvb2xj
aGFpbnMsIGFuZCBsZC5iZmQgd29ya3Mgbm93YWRheXMgKGZvbGxvd2luZwogICAgcGF0Y2gpOyBh
bm90aGVyIGNhc2UgaXMgbXVzbCwgd2hlcmUgUElFIGlzIG5vdCBzdXBwb3J0ZWQgd2l0aCBnby4K
CiAgICBJbnRyb2R1Y2UgRk9PX0VYVExERkxBR1MsIHdoaWNoIHdlIHVzZSB0byBzZXQgdGhvc2Ug
ZmxhZ3MsIGFuZCB0aGF0CiAgICBwYWNrYWdlcyBjYW4gc2V0IHRvIHBhc3Mgc3VjaCBmbGFncy4K
CiAgICBNaWdyYXRlIHRoZSBjdXJyZW50IHNldHRpbmcgb2YgLXN0YXRpYyB0byB1c2UgdGhhdCBu
ZXcgdmFyaWFibGUuCgpJIGd1ZXNzIGEgbWFpbnRhaW5lciBjYW4gdXBkYXRlIHRoZSBjb21taXQg
bG9nIHdpdGhvdXQgcmVxdWlyaW5nIGEKcmVzcGluLgoKVGhhbmtzIGFnYWluISDwn5GNCgpSZWdh
cmRzLApZYW5uIEUuIE1PUklOLgoKPiBJbnRyb2R1Y2UgRk9PX0VYVExERkxBR1MsIHRoYXQgcGFj
a2FnZXMgY2FuIHNldCB0byBwYXNzIHN1Y2ggZmxhZ3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogWWFu
biBFLiBNT1JJTiA8eWFubi5tb3JpbkBvcmFuZ2UuY29tPgo+IFRlc3RlZC1ieTogTmF0aGFuaWVs
IFJvYWNoIDxucm9hY2g0NEBucm9hY2g0NC5pZC5hdT4KPiBTaWduZWQtb2ZmLWJ5OiBGaW9uYSBL
bHV0ZSAoV0lXQSkgPGZpb25hLmtsdXRlQGdteC5kZT4KPiAtLS0KPiAgZG9jcy9tYW51YWwvYWRk
aW5nLXBhY2thZ2VzLWdvbGFuZy5hZG9jIHwgNiArKysrLS0KPiAgcGFja2FnZS9wa2ctZ29sYW5n
Lm1rICAgICAgICAgICAgICAgICAgIHwgNiArKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWFudWFs
L2FkZGluZy1wYWNrYWdlcy1nb2xhbmcuYWRvYyBiL2RvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdl
cy1nb2xhbmcuYWRvYwo+IGluZGV4IGFhMjU0MjY1OTEuLjZkZTA5MTZhODMgMTAwNjQ0Cj4gLS0t
IGEvZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2VzLWdvbGFuZy5hZG9jCj4gKysrIGIvZG9jcy9t
YW51YWwvYWRkaW5nLXBhY2thZ2VzLWdvbGFuZy5hZG9jCj4gQEAgLTg0LDggKzg0LDEwIEBAIHRo
ZXJlZm9yZSBvbmx5IHVzZSBhIGZldyBvZiB0aGVtLCBvciBub25lLgo+ICAgIGluZnJhc3RydWN0
dXJlIHdpbGwgYXV0b21hdGljYWxseSBnZW5lcmF0ZSBhIG1pbmltYWwgK2dvLm1vZCsgZmlsZQo+
ICAgIGluIHRoZSBwYWNrYWdlIHNvdXJjZSB0cmVlIGlmIGl0IGRvZXNuJ3QgZXhpc3QuCj4gIAo+
IC0qICtGT09fTERGTEFHUysgYW5kICtGT09fVEFHUysgY2FuIGJlIHVzZWQgdG8gcGFzcyByZXNw
ZWN0aXZlbHkgdGhlCj4gLSAgK0xERkxBR1MrIG9yIHRoZSArVEFHUysgdG8gdGhlICtnbysgYnVp
bGQgY29tbWFuZC4KPiArKiArRk9PX0xERkxBR1MrLCArRk9PX0VYVExERkxBR1MrLCBhbmQgK0ZP
T19UQUdTKyBjYW4gYmUgdXNlZCB0byBwYXNzCj4gKyAgcmVzcGVjdGl2ZWx5IHRoZSBnbyArTERG
TEFHUysgKHZpYSB0aGUgYC1sZGZsYWdzYCBjb21tYW5kIGxpbmUgZmxhZyksCj4gKyAgdGhlIGV4
dGVybmFsIGxpbmtlciBmbGFncyArRVhUTERGTEFHUysgKHZpYSB0aGUgYC1leHRsZGZsYWdzYAo+
ICsgIGNvbW1hbmQgbGluZSBmbGFnKSwgb3IgdGhlICtUQUdTKyB0byB0aGUgK2dvKyBidWlsZCBj
b21tYW5kLgo+ICAKPiAgKiArRk9PX0JVSUxEX1RBUkdFVFMrIGNhbiBiZSB1c2VkIHRvIHBhc3Mg
dGhlIGxpc3Qgb2YgdGFyZ2V0cyB0aGF0Cj4gICAgc2hvdWxkIGJlIGJ1aWx0LiBJZiArRk9PX0JV
SUxEX1RBUkdFVFMrIGlzIG5vdCBzcGVjaWZpZWQsIGl0Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cGtnLWdvbGFuZy5tayBiL3BhY2thZ2UvcGtnLWdvbGFuZy5tawo+IGluZGV4IDMzY2Y5YmZiMWEu
LmEzNDIxYWYyODggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wa2ctZ29sYW5nLm1rCj4gKysrIGIv
cGFja2FnZS9wa2ctZ29sYW5nLm1rCj4gQEAgLTExNCwxMCArMTE0LDE0IEBAIGlmbmRlZiAkKDIp
X0JVSUxEX0NNRFMKPiAgaWZlcSAoJCg0KSx0YXJnZXQpCj4gIAo+ICBpZmVxICgkKEJSMl9TVEFU
SUNfTElCUykseSkKPiAtJCgyKV9MREZMQUdTICs9IC1leHRsZGZsYWdzICctc3RhdGljJwo+ICsk
KDIpX0VYVExERkxBR1MgKz0gLXN0YXRpYwo+ICAkKDIpX1RBR1MgKz0gb3N1c2VyZ28gbmV0Z28K
PiAgZW5kaWYKPiAgCj4gK2lmbmVxICgkJCgkKDIpX0VYVExERkxBR1MpLCkKPiArJCgyKV9MREZM
QUdTICs9IC1leHRsZGZsYWdzICckJCgkKDIpX0VYVExERkxBR1MpJwo+ICtlbmRpZgo+ICsKPiAg
IyBCdWlsZCBwYWNrYWdlIGZvciB0YXJnZXQKPiAgZGVmaW5lICQoMilfQlVJTERfQ01EUwo+ICAJ
JCQoZm9yZWFjaCBkLCQkKCQoMilfQlVJTERfVEFSR0VUUyksXAo+IC0tIAo+IDIuNDcuMgo+IAoK
LS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX19fX18K
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tOiAgICAgICBfICAgIDotLS0t
LS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwg
ICAgX18vICkgICB8IC8iXCBBU0NJSSBSSUJCT04gfAp8ICAgICAgICAgICAgICAgICB8IFNvZnR3
YXJlICBEZXNpZ25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKfCArMzMgNjM4
LjQxMS4yNDUgJy0tLS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAgICBgLS0sIHwgIFggIEFHQUlOU1Qg
ICAgICB8CnwgeWFubi5tb3JpbiAoYXQpIG9yYW5nZS5jb20gICAgICAgICAgIHxfPSIgICAgLC0t
JyB8IC8gXCBIVE1MIE1BSUwgICAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS06X19fX19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KQ2UgbWVzc2FnZSBldCBzZXMgcGll
Y2VzIGpvaW50ZXMgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNvbmZpZGVudGll
bGxlcyBvdSBwcml2aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jDQpwYXMgZXRyZSBkaWZmdXNl
cywgZXhwbG9pdGVzIG91IGNvcGllcyBzYW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBhdmV6IHJl
Y3UgY2UgbWVzc2FnZSBwYXIgZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWduYWxlcg0KYSBsJ2V4cGVk
aXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4gTGVzIG1l
c3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwNCk9y
YW5nZSBkZWNsaW5lIHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBldGUgYWx0
ZXJlLCBkZWZvcm1lIG91IGZhbHNpZmllLiBNZXJjaS4NCg0KVGhpcyBtZXNzYWdlIGFuZCBpdHMg
YXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3Jt
YXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsNCnRoZXkgc2hvdWxkIG5vdCBiZSBk
aXN0cmlidXRlZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLg0KSWYgeW91
IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2Vu
ZGVyIGFuZCBkZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMuDQpBcyBlbWFp
bHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0
IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuDQpUaGFuayB5b3UuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
