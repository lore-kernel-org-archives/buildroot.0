Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A47ACA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 09:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE636822BC;
	Wed, 13 Aug 2025 09:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qh3Z1HR64yHh; Wed, 13 Aug 2025 09:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF8A182236
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF8A182236;
	Wed, 13 Aug 2025 09:28:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42366938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3380540173
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMpAMgTSOkc3 for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 09:28:17 +0000 (UTC)
X-Greylist: delayed 432 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 13 Aug 2025 09:28:16 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D0E6440134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0E6440134
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0E6440134
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:28:16 +0000 (UTC)
X-CSE-ConnectionGUID: HtNkF1scQwC3Hqu8UYSVhA==
X-CSE-MsgGUID: eM8/GpkqSwOKCARnLGjmiQ==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 11:21:01 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Aug 2025 11:21:02 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Wed, 13 Aug 2025 11:21:00 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 13 Aug 2025 11:20:59 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: b67XdkvMSWWdkVymrDK4mQ==
X-CSE-MsgGUID: EZuju6ngTjGpYkanMYmiyg==
X-IronPort-AV: E=Sophos;i="6.17,285,1747692000"; d="scan'208";a="319952852"
Date: Wed, 13 Aug 2025 11:20:59 +0200
To: Neal Frager <neal.frager@amd.com>
CC: <buildroot@buildroot.org>, <ibai.erkiaga-elorza@amd.com>,
 <luca.ceresoli@bootlin.com>, <brandon.maier@collins.com>, <ju.o@free.fr>,
 <thomas.petazzoni@bootlin.com>, <romain.naour@smile.fr>,
 <michal.simek@amd.com>, <romain.naour@gmail.com>
Message-ID: <aJxY+xaZhMFLzxX9@yd-6wlzhs3>
References: <20250813084354.2739722-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813084354.2739722-1-neal.frager@amd.com>
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX206.corporate.adroot.infra.ftgroup (10.115.27.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1755077297; x=1786613297;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=ihzd1khTCedse8jMpOaeJ9WJDH7XPrsPD2K/mJeRe3k=;
 b=qopv8l41DL3o+PPrZ9uW8aAtT7PQyBen+wkIOaYCaFSRSM1yKeDMU7iD
 tcSBpyPj8V8k3y5l6xXj58Aupjn0Otz5qFImMIdMtImPrkSuvCiNV4C65
 wZKTj4u7MfCe2xNnsCTonPLH/V16VF7pYmEv/s6P3FCmk8C89ymWGPLjd
 xG0XQ0Og4R6Z9pwgHCjErP02i/KZ81nqQOSZBtnB+O/YpNzb0HkEv08w9
 xas1zMCnPICNS2eJx5lHjfnhQLhoBj4al34Vhv5PD3eq62PE1k9o77y/u
 /EO6Vnp4KKE3Av3/rDgdXv03sBJF/CLweo34SBLYWjfrS0T8PvTpWu7t8
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=qopv8l41
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

TmVhbCwgQWxsLAoKT24gMjAyNS0wOC0xMyAwOTo0MyArMDEwMCwgTmVhbCBGcmFnZXIgdmlhIGJ1
aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gVGhpcyBwYXRjaCBhZGRzIGFuIGFyY2hpdGVjdHVyZSBj
cHUgZGVwZW5kZW5jeSB0byBlYWNoIGFwcGxpY2F0aW9uIHRvIG1ha2UKPiBzdXJlIHRoYXQgdXNl
cnMgY2FuIG9ubHkgYnVpbGQgYXBwbGljYXRpb25zIHdoaWNoIGFyZSBhcHBsaWNhYmxlIHRvIHRo
ZWlyCj4gdGFyZ2V0IGRldmljZSBmYW1pbHkuCj4gCj4gVGhlIHZlcnNhbF9wbG0gYW5kIHZlcnNh
bF9wc21mdyBhcHBsaWNhdGlvbnMgYXJlIHNwZWNpZmljIHRvIHZlcnNhbCBkZXZpY2VzCj4gd2hp
Y2ggYXJlIGJhc2VkIG9uIEJSMl9jb3J0ZXhfYTcyLgo+IAo+IFRoZSB6eW5xbXBfcG11ZncgYXBw
bGljYXRpb24gaXMgc3BlY2lmaWMgdG8genlucW1wIGRldmljZXMgd2hpY2ggYXJlIGJhc2VkIG9u
Cj4gQlIyX2NvcnRleF9hNTMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmVhbCBGcmFnZXIgPG5lYWwu
ZnJhZ2VyQGFtZC5jb20+Cj4gLS0tCj4gVjEtPlYyOgo+IC0gUmVwbGFjZWQgbmV3IGZhbWlseSB2
YXJpYW50IGNvbmZpZyBvcHRpb24gd2l0aCBhbiBhcmNoaXRlY3R1cmUgY3B1Cj4gICBkZXBlbmRl
bmN5LCBzbyBubyBuZXcgY29uZmlncyBhcmUgbmVlZGVkLgo+IC0gVXBkYXRlZCBwYXRjaCB0aXRs
ZSBhbmQgY29tbWl0IG1lc3NhZ2UgYWNjb3JkaW5nbHkuCj4gVjItPlYzOgo+IC0gQ2hhbmdlZCBw
YWNrYWdlIGRlcGVuZGVuY3kgdG8gb25seSBhcHBlYXIgaWYgdGhlIGNwdSBpcyBCUjJfY29ydGV4
X2E1Mwo+ICAgb3IgQlIyX2NvcnRleF9hNzIuIFRoaXMgd2F5LCB0aGUgeGlsaW54LWVtYmVkZGVk
c3cgcGFja2FnZSB3aWxsIG5vdAo+ICAgYXBwZWFyIHdpdGggemVybyBhcHBsaWNhdGlvbiBvcHRp
b25zIGlmIGFub3RoZXIgQlIyX2FhcmNoNjQgY3B1IGlzCj4gICBzZWxlY3RlZC4KPiAtLS0KPiAg
Ym9vdC94aWxpbngtZW1iZWRkZWRzdy9Db25maWcuaW4gfCA1ICsrKystCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9v
dC94aWxpbngtZW1iZWRkZWRzdy9Db25maWcuaW4gYi9ib290L3hpbGlueC1lbWJlZGRlZHN3L0Nv
bmZpZy5pbgo+IGluZGV4IDBkZDY0MzM2MDguLjk2ZTljYTJmYjAgMTAwNjQ0Cj4gLS0tIGEvYm9v
dC94aWxpbngtZW1iZWRkZWRzdy9Db25maWcuaW4KPiArKysgYi9ib290L3hpbGlueC1lbWJlZGRl
ZHN3L0NvbmZpZy5pbgo+IEBAIC01LDcgKzUsNyBAQCBjb21tZW50ICJ4aWxpbngtZW1iZWRkZWRz
dyBuZWVkcyBhIGJhcmUgbWV0YWwgdG9vbGNoYWluIGZvciB0dXBsZSBtaWNyb2JsYXplZWwtYgo+
ICAKPiAgbWVudWNvbmZpZyBCUjJfVEFSR0VUX1hJTElOWF9FTUJFRERFRFNXCj4gIAlib29sICJ4
aWxpbngtZW1iZWRkZWRzdyIKPiAtCWRlcGVuZHMgb24gQlIyX2FhcmNoNjQKPiArCWRlcGVuZHMg
b24gQlIyX2NvcnRleF9hNTMgfHwgQlIyX2NvcnRleF9hNzIKCk5vdGUgdGhhdCAoQlIyX2NvcnRl
eF9hNTMgfHwgQlIyX2NvcnRleF9hNzIpIGlzIG5vdCBhIHN1YnNldCBvZgpCUjJfYWFyY2g2NDsg
dGhleSBjYW4gZWFjaCBiZSBzZWxlY3Qgd2hlbiB0aGUgdGFyZ2V0IGlzIEJSMl9hcm0sCkJSMl9h
cm1lYiBvciBCUjJfYWFyY2g2NF9iZS4KClNvIGlmIHhpbGlueC1lbWJlZGRlZHN3IHJlYWxseSBp
cyBBQXJjaDY0LUxFLCB0aGVuIHlvdSBuZWVkIHRvIGtlZXAKdGhlIGRlcGVuZGVuY3kgb24gQlIy
X2FhcmNoNjQuIElmIGl0J3MgcmVhbGx5IGp1c3QgQUFyY2g2NCwgdGhlbiB5b3UgY2FuCnJlbGF4
IGl0IHdpdGggYSBkZXBlbmRlbmN5IG9uIEJSMl9BUkNIX0lTXzY0IChwbHVzIHRoZSBpbmRpdmlk
dWFsIENQVXMsCm9mIGNvdXJzZSkuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAgCWRlcGVu
ZHMgb24gQlIyX1RPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVAo+ICAJaGVscAo+ICAJICBC
dWlsZCBib290IGZpcm13YXJlIGFwcGxpY2F0aW9ucyBmcm9tIHNvdXJjZSBmb3IgWGlsaW54Cj4g
QEAgLTMwLDYgKzMwLDcgQEAgY29uZmlnIEJSMl9UQVJHRVRfWElMSU5YX0VNQkVEREVEU1dfVkVS
U0lPTgo+ICAKPiAgY29uZmlnIEJSMl9UQVJHRVRfWElMSU5YX0VNQkVEREVEU1dfVkVSU0FMX1BM
TQo+ICAJYm9vbCAidmVyc2FsIHBsbSIKPiArCWRlcGVuZHMgb24gQlIyX2NvcnRleF9hNzIKPiAg
CWhlbHAKPiAgCSAgQnVpbGQgdmVyc2FsIHBsbSBhcHBsaWNhdGlvbiBmcm9tIFhpbGlueC9lbWJl
ZGRlZHN3IHJlcG8uCj4gIAkgIElmIHNlbGVjdGVkLCB0aGUgeGlsaW54LXByZWJ1aWx0IHBhY2th
Z2Ugd2lsbCBub3QgaW5zdGFsbAo+IEBAIC00MCw2ICs0MSw3IEBAIGNvbmZpZyBCUjJfVEFSR0VU
X1hJTElOWF9FTUJFRERFRFNXX1ZFUlNBTF9QTE0KPiAgCj4gIGNvbmZpZyBCUjJfVEFSR0VUX1hJ
TElOWF9FTUJFRERFRFNXX1ZFUlNBTF9QU01GVwo+ICAJYm9vbCAidmVyc2FsIHBzbWZ3Igo+ICsJ
ZGVwZW5kcyBvbiBCUjJfY29ydGV4X2E3Mgo+ICAJaGVscAo+ICAJICBCdWlsZCB2ZXJzYWwgcHNt
ZncgYXBwbGljYXRpb24gZnJvbSBYaWxpbngvZW1iZWRkZWRzdyByZXBvLgo+ICAJICBJZiBzZWxl
Y3RlZCwgdGhlIHhpbGlueC1wcmVidWlsdCBwYWNrYWdlIHdpbGwgbm90IGluc3RhbGwKPiBAQCAt
NTAsNiArNTIsNyBAQCBjb25maWcgQlIyX1RBUkdFVF9YSUxJTlhfRU1CRURERURTV19WRVJTQUxf
UFNNRlcKPiAgCj4gIGNvbmZpZyBCUjJfVEFSR0VUX1hJTElOWF9FTUJFRERFRFNXX1pZTlFNUF9Q
TVVGVwo+ICAJYm9vbCAienlucW1wIHBtdWZ3Igo+ICsJZGVwZW5kcyBvbiBCUjJfY29ydGV4X2E1
Mwo+ICAJaGVscAo+ICAJICBCdWlsZCB6eW5xbXAgcG11ZncgYXBwbGljYXRpb24gZnJvbSBYaWxp
bngvZW1iZWRkZWRzdyByZXBvLgo+ICAJICBJZiBzZWxlY3RlZCwgdGhlIHhpbGlueC1wcmVidWls
dCBwYWNrYWdlIHdpbGwgbm90IGluc3RhbGwKPiAtLSAKPiAyLjI1LjEKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCgouLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS06zIXMhSDMhcyFzIXMhSDMhcyFzIXMhSDMhcyFzIXMhSDMhcyF
zIXMhSDMhcyFzIXMhSDMhcyFzIXMhSDMhcyFzIXMhV/MhSDMhcyFzIXMhSDMhcyFzIXMhSDMhcyF
zIXMhSDMhTotLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1l
IEVtYmVkZGVkIHwgICAgX18vICkgICB8IC8iXCBBU0NJSSBSSUJCT04gfAp8ICAgICAgICAgICAg
ICAgICB8IFNvZnR3YXJlICBEZXNpZ25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAg
IHwKfCArMzMgNjM4LjQxMS4yNDUgJy0tLS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAgICBgLS0sIHwg
IFggIEFHQUlOU1QgICAgICB8CnwgeWFubi5tb3JpbiAoYXQpIG9yYW5nZS5jb20gICAgICAgICAg
IHxfPSIgICAgLC0tJyB8IC8gXCBIVE1MIE1BSUwgICAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS06X19fX19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KQ2UgbWVzc2Fn
ZSBldCBzZXMgcGllY2VzIGpvaW50ZXMgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25z
IGNvbmZpZGVudGllbGxlcyBvdSBwcml2aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jDQpwYXMg
ZXRyZSBkaWZmdXNlcywgZXhwbG9pdGVzIG91IGNvcGllcyBzYW5zIGF1dG9yaXNhdGlvbi4gU2kg
dm91cyBhdmV6IHJlY3UgY2UgbWVzc2FnZSBwYXIgZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWduYWxl
cg0KYSBsJ2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9p
bnRlcy4gTGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0
ZXJhdGlvbiwNCk9yYW5nZSBkZWNsaW5lIHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1lc3Nh
Z2UgYSBldGUgYWx0ZXJlLCBkZWZvcm1lIG91IGZhbHNpZmllLiBNZXJjaS4NCg0KVGhpcyBtZXNz
YWdlIGFuZCBpdHMgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZp
bGVnZWQgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsNCnRoZXkgc2hv
dWxkIG5vdCBiZSBkaXN0cmlidXRlZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0
aW9uLg0KSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVu
dHMuDQpBcyBlbWFpbHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBt
ZXNzYWdlcyB0aGF0IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuDQpU
aGFuayB5b3UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
