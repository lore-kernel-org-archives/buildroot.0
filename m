Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0968ECA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 11:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3B3960B7D;
	Wed, 10 Sep 2025 11:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeX90n8WgUYt; Wed, 10 Sep 2025 11:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2A0560D92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2A0560D92;
	Wed, 10 Sep 2025 11:48:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 348F910E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31F32412B4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Z0URt7woSzE for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 11:48:28 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 10 Sep 2025 11:48:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2EFCB412CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EFCB412CB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EFCB412CB
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:48:27 +0000 (UTC)
X-CSE-ConnectionGUID: 8vpOsH2nSACCillmzvKogw==
X-CSE-MsgGUID: mPJMBg+SQSqB5pb4hJ7mRQ==
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 10 Sep 2025 13:41:16 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Sep 2025 13:41:15 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58;
 Wed, 10 Sep 2025 13:41:14 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 10 Sep 2025 13:41:14 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: s4uYv1LGTra0jwPl/lOgdg==
X-CSE-MsgGUID: KCK4Vm1tRPGUJlNHZb13FQ==
X-IronPort-AV: E=Sophos;i="6.18,254,1751234400"; d="scan'208";a="331351566"
Date: Wed, 10 Sep 2025 13:41:14 +0200
To: Romain Naour <romain.naour@smile.fr>
CC: Christian Stewart <christian@aperture.us>, Buildroot Mailing List
 <buildroot@buildroot.org>
Message-ID: <aMFj2gv8Icxm+IDh@yd-6wlzhs3>
References: <cover.1751377540.git.yann.morin@orange.com>
 <d23125d705a0c24ca91071624d507392ecfe7b0d.1751377540.git.yann.morin@orange.com>
 <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr>
 <aL/bdHOwN/ENpcOl@yd-6wlzhs3>
 <CA+h8R2rxQ6Na-hG=BLZrNvL=Wu5bwur_8YeC3wNdFkjrKfsP4Q@mail.gmail.com>
 <69b87840-6431-412e-9f27-a8acb3112a7e@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69b87840-6431-412e-9f27-a8acb3112a7e@smile.fr>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX308.corporate.adroot.infra.ftgroup
 (10.115.27.13) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1757504909; x=1789040909;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=uVx9QEngiHJlv4It6qFCEimMlCZWqEfx9tm/uS6ASD8=;
 b=T7ZraG21ig+yJ78ogwY74APaRu4hGAAAKUe7Rdmb2eOCtKEipOyaioV/
 CHE7LgfjY/o+rDeRm3Jbb4JLBFLPrMS8CupIWkJMEj2PjPYmhkA0HqJ86
 2c/EhnwWZy7awgdIYade1IvCSROQZKbPahepOp4cuDyE5PNG/Do9a8JZ9
 q1eOFqq8POdWdVJ1uuG22SJf3kgR6esnC51XY7gC7ToyHOSTcXkFYgTen
 BzOkJ6b91kDFOfFaETtmie/9zGPuMaDJL1OS/h/13wdQQhXRf0RSvODOp
 TU8/Nh7SpyuJurmxCf7pq7ltW88Vt0hVcQgIss878kW+U8NC3Hk70tkuX
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=T7ZraG21
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

Um9tYWluLCBBbGwsCgpPbiAyMDI1LTA5LTEwIDEzOjE5ICswMjAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDA5LzA5LzIwMjUgw6AgMTk6NTYsIENocmlzdGlhbiBTdGV3YXJ0IGEg
w6ljcml0wqA6Cj4gPiBPbiBUdWUsIFNlcCA5LCAyMDI1LCAxMjo0N+KAr0FNIDx5YW5uLm1vcmlu
QG9yYW5nZS5jb20KPiA+IDxtYWlsdG86eWFubi5tb3JpbkBvcmFuZ2UuY29tPj4gd3JvdGU6Cj4g
PiA+IFdoYXQgYWJvdXQgdGhlIHN0YXR1cyBvZiB0aGlzIHNlcmllcz8gQ2hyaXN0aWFuIGhhcyBw
cm92aWRlZCBoaXMKPiA+ID4gUmV2aWV3ZWQtYnkgYSB3aGlsZSBiYWNrLi4uCj4gPiBJdCBzdGls
bCBsb29rcyBnb29kIHRvIG1lIQo+IFRoYW5rcyBmb3IgdGhlIHJlbWluZGVyIQo+IE5vdyB0aGUg
MjAyNS4wOCBpcyByZWxlYXNlIChhbmQgbmV4dCBtZXJnZWQgaW4gbWFzdGVyKSwgd2UgY2FuIGdv
IGFoZWFkLgo+IEJ0dywgSSByZXBsYWNlZCAyMDI1LjA4IGJ5IDIwMjUuMTEgaW4gdGhlIGxhc3Qg
Y29tbWl0LgoKSSBtaWdodCBoYXZlIGJlZW4gYSBsaXR0bGUgdGlueSB3ZWVueSBiaXQgdG9vIG9w
dGltaXN0aWMuIPCfmJwKCj4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRoYW5rcyEg8J+R
jQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAogICAgICAgICAgICAgICAgICAgICAgICAg
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
