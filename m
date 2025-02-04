Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B57BC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 12:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B736C81355;
	Tue,  4 Feb 2025 12:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrtGdd0Xgbyh; Tue,  4 Feb 2025 12:13:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A38E78135D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A38E78135D;
	Tue,  4 Feb 2025 12:13:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6931D185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 12:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 587E7402C2
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 12:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l88r4RufgrCG for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 12:13:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 961B9402BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 961B9402BE
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 961B9402BE
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 12:13:27 +0000 (UTC)
X-CSE-ConnectionGUID: 8/tndn9NQ2GlbvbGJnoPdA==
X-CSE-MsgGUID: 9ZgudWP8QryeM7xde9VWPA==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 13:13:25 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Feb 2025 13:13:24 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 4 Feb 2025 13:13:22 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 04 Feb 2025 13:13:21 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: /1FeaH8NSGe6z+drgY0pnA==
X-CSE-MsgGUID: 9NsnR3eSS4i4Ei0PYnKDgA==
X-IronPort-AV: E=Sophos;i="6.13,258,1732575600"; d="scan'208";a="247490529"
Date: Tue, 4 Feb 2025 13:13:21 +0100
To: Fiona Klute <fiona.klute@gmx.de>
CC: <buildroot@buildroot.org>, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
Message-ID: <Z6IEYRiU1IklParS@yd-6wlzhs3>
References: <20250203120130.2332720-1-fiona.klute@gmx.de>
 <Z6GzCbcs9k0Rul1a@yd-6wlzhs3>
 <c3a16cbe-ae5b-4b68-9713-0fe3bf5888d4@gmx.de>
 <Z6H2W96MX4oQFoOx@yd-6wlzhs3>
 <bb9a665e-47aa-48e7-ae56-a50999bcc0f3@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb9a665e-47aa-48e7-ae56-a50999bcc0f3@gmx.de>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX108.corporate.adroot.infra.ftgroup (10.115.27.5)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738671207; x=1770207207;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=x4ITJvJcG1fsNUkFXiBP6570vQs4khWCEJjhtqQ04dQ=;
 b=cYhA4J2P8QRI/J2k1a5p2kPrUYynqGjQ/BrZG084X3LWJFELUM/e0/Rq
 +Gqrc7u3FAVPhOjc4Ei5CU9eTCuArv3XHGwNDd4OSdTIOhbd2MYa2P1XV
 vRQuFS10C3usnd/DHoJTKgDVQL6wG+uFdVLEeNrFj3wJHuOea3efCoiAT
 +eZ8L6UgyzWeAgnnWogvsdzdjB3oDREnHt44EHjDmdfFsUeB4OO8Yhg+z
 +bPErpAx2wG+n8E7Q03k9a0eJ2tsQDPXZJzV4vpuPjaaVo8VcFV12aug1
 E7XON8GyURV+So3CCmST02FRGZdOQNYThSskAk58IcGuYuLNa9/6Sa8fM
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=cYhA4J2P
Subject: Re: [Buildroot] [PATCH 1/1] package/go/go-src: stop forcing
 binutils-gold dependency on aarch64
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

RmlvbmEsIEFsbCwKCk9uIDIwMjUtMDItMDQgMTI6MzcgKzAxMDAsIEZpb25hIEtsdXRlIHNwYWtl
IHRodXNseToKPiBBY2NvcmRpbmcgdG8gdGhlIGRpc2N1c3Npb24gaW4gdGhlIEdvIGlzc3VlLCB0
aGVyZSB3YXMgYW5vdGhlciBidWcgdGhhdAo+IGdvdCBmaXhlZCB3aXRoIDIuNDEuCj4gaHR0cHM6
Ly9naXRodWIuY29tL2dvbGFuZy9nby9pc3N1ZXMvMjIwNDAjaXNzdWVjb21tZW50LTE0MzAxMTA0
MDAKClllcywgdGhhdCdzIGV4YWN0bHkgd2h5IEkgbmVlZGVkIHRvIHBhc3MgLWZ1c2UtbGQ9YmZk
IGZvciBmaWxlYmVhdCBidXQKbm90IGZvciBhcm0uCgo+IEFtIDA0LjAyLjI1IHVtIDEyOjEzIHNj
aHJpZWIgeWFubi5tb3JpbkBvcmFuZ2UuY29tOgpbLS1TTklQLS1dCj4gPiBTbywgcGFja2FnZXMg
dGhhdCBuZWVkIHRvIHNwZWNpZnkgIi1mdXNlLWxkPWJmZCIgd291bGQgZG8gc28KPiA+IHVuY29u
ZGl0aW9uYWx5LCBqdXN0IG1heWJlIGZvciB0aGUgQUFyY2g2NCBjYXNlLCB3aGljaCBpcyB0aGUg
b25seSBvbmUgSQo+ID4ga25vdyBjYW4gY2F1c2UgdGhlIGJ1aWxkIGZhaWx1cmUgKG5vdCBhbGwg
cGFja2FnZXMgaGF2ZSB0aGUgaXNzdWUsIGFzCj4gPiBjYW4gYmUgZXhwbGFtcGxpZmllZCBieSB0
aGUgZmFjdCB0aGF0IHdlIGhhdmUgbm8gc3VjaCBmYWlsdXJlcyBpbiB0aGUKPiA+IGF1dG9idWls
ZGVycykuCj4gSSBsaWtlIHRoYXQgYXBwcm9hY2gsIGJ1dCBhcyBtZW50aW9uZWQgYWJvdmUgdGhl
IHRvb2xjaGFpbnMgd2lsbCBoYXZlIHRvCj4gYmUgYSBiaXQgbW9yZSByZWNlbnQuCgoyLjM2IHdv
cmtlZCBmb3IgbWUsIGF0IGxlYXN0LiBCdXQgdW5sZXNzIHRoZSB0b29sY2hhaW5zIGhhdmUgdG8g
YmUgbGVzcwp0aGFuIGEgeWVhciBvbGQsIEkgdGhpbmsgaXQgaXMgT0sgdG8gcmVxdWlyZSB0aGF0
LgoKQnV0IG5vdywgYXMgeW91IG1lbnRpb25lZCBbMF0sIGlmIGdvbGQgZ2V0cyBkcm9wcGVkLCB0
aGVuIEknZCBleHBlY3QKbmV3ZXIgYmludXRpbHMgdG8gbm8gbG9uZ2VyIGluc3RhbGwgbGQuYmZk
IGVpdGhlciAoYmVjYXVzZSB0aGVyZSdkIGJlCm9ubHkgb25seSBsaW5rZXIgbGVmdCkuIFNvIHdl
J2QgYmUgYmFjayB0byB0aGUgY2FzZSBvZiBvbGQgdG9vbGNoYWlucywKd2hlcmUgZ29sZCBkaWQg
bm90IHlldCBleGlzdCwgYW5kIHRodXMgbGQuYmZkIGRpZCBub3QgZXhpc3QgZWl0aGVyLgoKU28s
IGlmIHdlIG5lZWQgdG8gYmUgZnV0dXJlIHByb29mLCB0aGVuIHdlIG5lZWQgdG8gZGVzaWduIGEg
c29sdXRpb24KdGhhdCB3b3JrcyBpbiBhbGwgY2FzZXM7CiAgLSBvbGQgdG9vbGNoYWlucyB3aGVy
ZSBnb2xkIGRpZCBub3QgZXhpc3QsIGFuZCB3aGVyZSBsZC5iZmQgZGlkIG5vdAogICAgZXhpc3Qs
IG8gaXQncyBqdXN0ICdsZDsnOwogICAtIHRvb2xjaGFpbnMgd2hlcmUgYmludXRpbHMgd2FzIC9j
b25maWd1cmUtZCB3aXRoIC0tZGlzYWJsZS1nb2xkLAogICAgc28gaXQncyBqdXN0ICdsZCc7CiAg
LSB0b29sY2hhaW5zIHdoZXJlIGdvbGQgZXhpc3RzLCBhbmQgaGFzIGJvdGggbGQuYmZkIGFuZCBs
ZC5nb2xkLCBhbmQKICAgIHdoZXJlIHdlIHdhbnQgdG8gdXNlICdsZC5iZmQnOwogIC0gZnV0dXJl
IHRvb2xjaGFpbnMgd2hlcmUgZ29sZCBubyBsb25nZXIgZXhpc3RzLCBzbyBpdCdzIGFnYWluIGp1
c3QKICAgICdsZCcuCgpbMF0gaHR0cHM6Ly9naXRodWIuY29tL2dvbGFuZy9nby9pc3N1ZXMvMjIw
NDAjaXNzdWVjb21tZW50LTI2MzA4NDg3NzcKCj4gV2hhdCdzIG9kZCBpcyB0aGF0IG15IHRlc3Qg
YnVpbGQgZmFpbGVkLiBBcyB5b3UgY2FuIHNlZSwgd2l0aCB5b3VyIHBhdGNoCj4gc2V0dGluZyBD
T05UQUlORVJEX0VYVExERkxBR1MgKz0gLWZ1c2UtbGQ9YmZkIHdvcmtzIHRvIHVzZSBsZC5iZmQs
IGJ1dAo+IGNvbmZ1c2luZ2x5IHRoZXJlJ3MgYW4gZXJyb3IgdGhhdCBkaWRuJ3QgYXBwZWFyIHdo
ZW4gcGF0Y2hpbmcgR286ClstLVNOSVAtLV0KPiAvaG9tZS9maW9uYS9kZXZlbG9wbWVudC9idWls
ZHJvb3Qvb3V0cHV0L3JldnBpL2hvc3QvbGliL2djYy9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1t
dXNsLzEzLjMuMC8uLi8uLi8uLi8uLi9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1tdXNsL2Jpbi9s
ZC5iZmQ6Cj4gcmVhZC1vbmx5IHNlZ21lbnQgaGFzIGR5bmFtaWMgcmVsb2NhdGlvbnMKPiBjb2xs
ZWN0MjogRmVobGVyOiBsZCBnYWIgMSBhbHMgRW5kZS1TdGF0dXMgenVyw7xjawo+IAo+IEFueSBp
ZGVhcz8gSXMgdGhlIGRpZmZlcmVudCBvcmRlciBvZiBhcmd1bWVudHMgbWVzc2luZyB0aGluZ3Mg
dXA/CgpPcmRlcmluZyBvZiBhcmdzIHNob3VsZCBub3QgbWF0dGVyOiB0aGUgbGF0dGVyIHNob3Vs
ZCB3aW4uCgpNYXliZSB5b3UgY2FuIHJlcXVpZXIgdmVyYm9zZSBvdXRwdXQ6CgogICAgRk9PX0VY
VExERkxBR1MgPSAtZnVzZS1sZD1iZmQgLVdsLC0tdmVyYm9zZSAtdgoKT3RoZXJ3aXNlLCBubyBp
ZGVhLCBhcyBJIGFtIG5vdCBhIGdvIGd1eS4uLiBJIGp1c3QgaGFkIHRvIGZpZGRsZSB3aXRoCmZp
bGViZWF0IGEgZmV3IHllYXJzIGJhY2ssIG1hbmFnZWQgdG8gZ2V0IGl0IGZhbGwgaW4gcGxhY2Ug
d2l0aCB0aGUKcmVmZXJlbmNlZCBjaGFuZ2UsIGJ1dCBvdGhlciB0aGFuIHRoYXQsIEkgYW0ganVz
dCBhIG1vbmtleSB0eXBpbmcgb24gYQprZXlib2FyZCBpbiB0aGlzIGdvIGxhbmQuIDstKQoKUmVn
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
