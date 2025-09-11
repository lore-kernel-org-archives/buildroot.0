Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DC3CAC583
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 05:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 695E4842CA;
	Thu, 11 Sep 2025 05:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7tNw_TawxBt; Thu, 11 Sep 2025 05:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ED2D8430B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ED2D8430B;
	Thu, 11 Sep 2025 05:22:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E997E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 05:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24C69613D0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 05:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFZ4_fuI5k7C for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 05:22:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 417BD607B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 417BD607B5
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 417BD607B5
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 05:22:30 +0000 (UTC)
X-CSE-ConnectionGUID: DMK3qLf9SwGBlg6vMwlHuw==
X-CSE-MsgGUID: c5VPBSpjSciSrEWF2vLlrQ==
Received: from unknown (HELO opfedv3rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 11 Sep 2025 07:22:27 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Sep 2025 07:22:28 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58;
 Thu, 11 Sep 2025 07:22:26 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 11 Sep 2025 07:22:26 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: mXBqZxDQSeWqUtC6v0IkNg==
X-CSE-MsgGUID: es4j5jcUSk+MKcu5nM8cYg==
X-IronPort-AV: E=Sophos;i="6.18,256,1751234400"; d="scan'208";a="331767815"
Date: Thu, 11 Sep 2025 07:22:26 +0200
To: Christian Stewart <christian@aperture.us>
CC: Romain Naour <romain.naour@smile.fr>, Buildroot Mailing List
 <buildroot@buildroot.org>
Message-ID: <aMJckp9XB0PrC3w3@yd-6wlzhs3>
References: <cover.1751377540.git.yann.morin@orange.com>
 <d23125d705a0c24ca91071624d507392ecfe7b0d.1751377540.git.yann.morin@orange.com>
 <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr>
 <aL/bdHOwN/ENpcOl@yd-6wlzhs3>
 <CA+h8R2rxQ6Na-hG=BLZrNvL=Wu5bwur_8YeC3wNdFkjrKfsP4Q@mail.gmail.com>
 <69b87840-6431-412e-9f27-a8acb3112a7e@smile.fr>
 <aMFj2gv8Icxm+IDh@yd-6wlzhs3>
 <CA+h8R2prwcPxD-8QF+hYg0zAj22zT_Guo3LcXXFStpR8E82zXA@mail.gmail.com>
 <CA+h8R2ojX40fLh2SQmfGRXsTNO4PzNke=eaa7p+S7Rzg0fo_rA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2ojX40fLh2SQmfGRXsTNO4PzNke=eaa7p+S7Rzg0fo_rA@mail.gmail.com>
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX207.corporate.adroot.infra.ftgroup (10.115.27.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1757568151; x=1789104151;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=LSjKwr1acbBwLpVz41u+Zy6zOokqZ1e8niDkBewPfus=;
 b=mzxTMfJ+rYGNkb3Va6z2nTbsWJ1mpOkSSAFeuEolw6qEjFMSg/01xcXA
 FGCqdWNrJw/5IEAMos549BhiPor74qBu4ADez6Gr/u1l7SPymP+F7kpIb
 6umG06j037Bx7MT3LPlVNmNywZzewWakQpUY+W0DCkgCUaaZpP3ykNMDN
 SD8kCx7ZWYigIt8VKHI+sRK4U72p+zbxqJ9yPOP73QIpwz3fkXKdSm/Oo
 CrUSmWZ8aXTwmpoVYDgb1U7B/drTWXO32gHH/P99W3x7PxOQc1YKq/WSQ
 d5bMP3NXAevfPx1PogQSTogl1U0ycn+eKha8hZS71ewx5kfWQCVXtm/z7
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=mzxTMfJ+
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

Q2hyaXN0aWFuLCBBbGwsCgpPbiAyMDI1LTA5LTEwIDEyOjEzIC0wNzAwLCBDaHJpc3RpYW4gU3Rl
d2FydCBzcGFrZSB0aHVzbHk6Cj4gT24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMTI6MDfigK9QTSBD
aHJpc3RpYW4gU3Rld2FydAo+IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgpbLS1TTklQ
LS1dCj4gPiBOb3cgdGhhdCB0aGlzIGlzIG1lcmdlZCwgaG93IGRvIEkgcmVuYW1lIGEgYnVpbGQg
YmluYXJ5IGJlZm9yZSBpbnN0YWxsaW5nPwo+ID4gSGVyZSdzIGFuIGV4YW1wbGU6Cj4gPiBodHRw
czovL2dpdGh1Yi5jb20vc2tpZmZvcy9idWlsZHJvb3QvYmxvYi9za2lmZi9wYWNrYWdlL2dlbnVp
bmV0b29scy1pbWcvZ2VudWluZXRvb2xzLWltZy5tawo+IE9oLCBJIGd1ZXNzIHdlIGNhbiBzdGls
bCBqdXN0IHNldCBCSU5fTkFNRS4gSWdub3JlIQoKIDEuIFllcywgeW91IGNhbiBzdGlsbCBzZXQg
Rk9PX0JJTl9OQU1FIHdoZW4gdGhlcmUgaXMgYSBzaW5nbGUgYmluYXJ5IHRvCiAgICBpbnN0YWxs
OyBxdW90aW5nIHRoZSBtYW51YWw6CgogICAgKiBGT09fQlVJTERfVEFSR0VUUyBpcyAnLicuIElu
IHRoaXMgY2FzZSwgd2UgYXNzdW1lIG9ubHkgb25lIGJpbmFyeQogICAgICB3aWxsIGJlIGJ1aWx0
IGFuZCBpbnN0YWxsZWQsIGFuZCBieSBkZWZhdWx0IHdlIG5hbWUgaXQgYWZ0ZXIgdGhlCiAgICAg
IHBhY2thZ2UgbmFtZTsgaWYgdGhhdCBpcyBub3QgYXBwcm9wcmlhdGUsIHRoZSBuYW1lIG9mIHRo
ZSBiaW5hcnkKICAgICAgY2FuIGJlIG92ZXJyaWRkZW4gdXNpbmcgRk9PX0JJTl9OQU1FLgoKICAg
ICogRk9PX0JVSUxEX1RBUkdFVFMgaXMgbm90ICcuJy4gSW4gdGhpcyBjYXNlLCBpdCBpcyBpbnRl
cnByZXRlZCBhcyBhCiAgICAgIHNwYWNlLXNlcGFyYXRlZCBsaXN0IFsuLi5dLiBJZiBGT09fQlVJ
TERfVEFSR0VUUyBjb250YWlucyBvbmx5IG9uZQogICAgICB0YXJnZXQsIHRoZW4gaXQgaXMgcG9z
c2libGUgdG8gb3ZlcnJpZGUgdGhlIGJ1aWx0IGFuZCBpbnN0YWxsZWQKICAgICAgYmluYXJ5IGJ5
IHNldHRpbmcgRk9PX0JJTl9OQU1FLCBhcyBhYm92ZTsgWy4uLl0KCiAyLiBVbmxlc3MgSSdtIG1p
c3Rha2VuLCB0aGUgYmluYXJ5IHlvdXIgcGFja2FnZSBpbnN0YWxscyBpcyBuYW1lZCBhZnRlcgog
ICAgdGhlIHBhY2thZ2UsIHNvIHlvdSBzaG91bGQgbm90IGV2ZW4gbmVlZCB0byBzcGVjaWZ5IGl0
LCBhcyB0aGlzIGlzCiAgICB0aGUgZGVmYXVsdCAoYW5kIGFscmVhZHkgd2FzIHByaW9yIHRvIHRo
aXMgc2VyaWVzKTsgaS5lLiB0aGVyZQogICAgc2hvdWxkIGJlIG5vIG5lZWQgZm9yICh0aGUgc2Ft
ZSB3YXkgeW91IGRpZCBub3Qgc3BlY2lmeSBpdCBmb3IgdGhlCiAgICB0YXJnZXQgdmFyaWFudCk6
CiAgICAgICAgSE9TVF9HRU5VSU5FVE9PTFNfSU1HX0JJTl9OQU1FID0gZ2VudWluZXRvb2xzLWlt
ZwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgX19fX19fX19fX19fCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLTogICAgICAgXyAgICA6LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8ICAgIF9fLyApICAgfCAvIlwgQVNDSUkgUklCQk9O
IHwKfCAgICAgICAgICAgICAgICAgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCAgXy8gLSAvJyAgIHwg
XCAvIENBTVBBSUdOICAgICB8CnwgKzMzIDYzOC40MTEuMjQ1ICctLS0tLS0tLS0tLS0tLS0tLS0t
LTogKF8gICAgYC0tLCB8ICBYICBBR0FJTlNUICAgICAgfAp8IHlhbm4ubW9yaW4gKGF0KSBvcmFu
Z2UuY29tICAgICAgICAgICB8Xz0iICAgICwtLScgfCAvIFwgSFRNTCBNQUlMICAgIHwKJy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tOl9fX19fXy9fX19fXzotLS0tLS0tLS0t
LS0tLS0tLS0nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCkNlIG1lc3NhZ2UgZXQgc2VzIHBpZWNlcyBqb2ludGVzIHBldXZlbnQgY29udGVuaXIg
ZGVzIGluZm9ybWF0aW9ucyBjb25maWRlbnRpZWxsZXMgb3UgcHJpdmlsZWdpZWVzIGV0IG5lIGRv
aXZlbnQgZG9uYw0KcGFzIGV0cmUgZGlmZnVzZXMsIGV4cGxvaXRlcyBvdSBjb3BpZXMgc2FucyBh
dXRvcmlzYXRpb24uIFNpIHZvdXMgYXZleiByZWN1IGNlIG1lc3NhZ2UgcGFyIGVycmV1ciwgdmV1
aWxsZXogbGUgc2lnbmFsZXINCmEgbCdleHBlZGl0ZXVyIGV0IGxlIGRldHJ1aXJlIGFpbnNpIHF1
ZSBsZXMgcGllY2VzIGpvaW50ZXMuIExlcyBtZXNzYWdlcyBlbGVjdHJvbmlxdWVzIGV0YW50IHN1
c2NlcHRpYmxlcyBkJ2FsdGVyYXRpb24sDQpPcmFuZ2UgZGVjbGluZSB0b3V0ZSByZXNwb25zYWJp
bGl0ZSBzaSBjZSBtZXNzYWdlIGEgZXRlIGFsdGVyZSwgZGVmb3JtZSBvdSBmYWxzaWZpZS4gTWVy
Y2kuDQoNClRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZp
ZGVudGlhbCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHByb3RlY3RlZCBi
eSBsYXc7DQp0aGV5IHNob3VsZCBub3QgYmUgZGlzdHJpYnV0ZWQsIHVzZWQgb3IgY29waWVkIHdp
dGhvdXQgYXV0aG9yaXNhdGlvbi4NCklmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4g
ZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBh
bmQgaXRzIGF0dGFjaG1lbnRzLg0KQXMgZW1haWxzIG1heSBiZSBhbHRlcmVkLCBPcmFuZ2UgaXMg
bm90IGxpYWJsZSBmb3IgbWVzc2FnZXMgdGhhdCBoYXZlIGJlZW4gbW9kaWZpZWQsIGNoYW5nZWQg
b3IgZmFsc2lmaWVkLg0KVGhhbmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
