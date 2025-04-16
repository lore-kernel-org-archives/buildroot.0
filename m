Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6DCC369BD
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 13:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD88C8384B;
	Wed, 16 Apr 2025 13:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4m658evGReOl; Wed, 16 Apr 2025 13:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 120D48215B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 120D48215B;
	Wed, 16 Apr 2025 13:37:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E339DE
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 13:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32AF582D7C
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 13:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bc27mRPvnZKR for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 13:37:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D58E81289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D58E81289
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D58E81289
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 13:37:51 +0000 (UTC)
X-CSE-ConnectionGUID: 8QtkJs5fQXyXi3ajxU7bfw==
X-CSE-MsgGUID: 9N9H/TbSStquigEk2fNLdQ==
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 15:37:48 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Apr 2025 15:37:48 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 16 Apr 2025 15:37:47 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 16 Apr 2025 15:37:46 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: ATkIarAKRo2gEo3ciKBSzg==
X-CSE-MsgGUID: dr9SzxshQwKZPDQCRvXtzw==
X-IronPort-AV: E=Sophos;i="6.15,216,1739833200"; d="scan'208";a="276479771"
Date: Wed, 16 Apr 2025 15:37:46 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
CC: <buildroot@buildroot.org>, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Z/+yqlFNPKso+OCb@yd-6wlzhs3>
References: <20250414150721.4300-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250414150721.4300-1-tianyuanhao3@163.com>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX105.corporate.adroot.infra.ftgroup (10.115.27.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1744810672; x=1776346672;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=EfSdneHDKIqemi2FSu+zV+Jx6uihEjL6t6HBt5aPup8=;
 b=COCQjbZ4vEHvi6orEnQuo9G4RyejWpwMg1cbRYPVkCmeIl6pd6d/ub7r
 NG9JMEjt4DhLe8vfTgonqJz4W6EbQtbAlRHXY7QFY93Z0odIjSRACKUPg
 TWN9tTVqypGvVyfCjWo6iPBuxTSrUOFvKWOALc/rpHYe4T/v3CNYuJFt0
 aD3X3nHytDLRsiQDrXDfZ4M8fz1YfU1U85YtrEIz+qXjfcuYEFICV92WB
 GDjVCUyKHBY5BRnkwn5R7hGJ86Kf8Z7tSLnQOXOE7gcA2dkRy81RmA/p3
 KTBRgvwwEqBwzNfN/vvrk1XX2k2XnCUgE+7SLm0S2tnA2Eic/XLELsoiS
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=COCQjbZ4
Subject: Re: [Buildroot] [PATCH v2 1/1] package/tailscale: install systemd
 service files
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

WXVhbmhhbywgQWxsLAoKT24gMjAyNS0wNC0xNCAwODowNyAtMDcwMCwgVElBTiBZdWFuaGFvIHNw
YWtlIHRodXNseToKPiBTaWduZWQtb2ZmLWJ5OiBUSUFOIFl1YW5oYW8gPHRpYW55dWFuaGFvM0Ax
NjMuY29tPgo+IENjOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4K
PiBDYzogWWFubiBFLiBNT1JJTiA8eWFubi5tb3JpbkBvcmFuZ2UuY29tPgo+IAo+IC0tLQo+IENo
YW5nZXMgdjEgLT4gdjI6Cj4gICAtIFJlbW92ZSB1bnRlc3RlZCBUQUlMU0NBTEVfSU5TVEFMTF9J
TklUX09QRU5SQwo+ICAgLSBDaGFuZ2UgZGVmYXVsdCBzZXJ2aWNlIGZpbGVzIHRvIHVzZSAvYmlu
IGluc3RlYWQgb2YgL3NiaW4KClRoYXQncyBhbiBvcHRpb24sIHRvby4gSSBmaW5kIGl0IG5vdCB2
ZXJ5IG5pY2UgdG8gc2VkIHRoZSBmaWxlOyBJIHRoaW5rCml0IHdvdWxkIGJlIGJldHRlciB0byBj
YXJyeSBhIHBhdGNoIHRoYXQgcGF0Y2hlcyB0aGUgc2VydmljZSBmaWxlLCBhcyBpdAppcyBwcm92
aWRlZCBpbiB0aGUgc291cmNlIHRyZWUgYW5kIG5vdCBnZW5lcmF0ZWQgYXQgYnVpbGQuCgpZZXQs
IEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gZG8gdGhlIHN5bWxpbmsgaW4gc2Jpbi4uLiBBcyBJIHNh
aWQgaW4gbXkKZWFybGllciByZXBseSB0b2RheSwgdGhlIGxvY2F0aW9uIG9mIHRoZSBleGVjdXRh
YmxlIGlzIGFuIGFydGlmYWN0IG9mCnRoZSBsaW1pdGF0aW9ucyBvZiB0aGUgQnVpbGRyb290IGdv
bGFuZy1wYWNrYWdlIGluZnJhc3RydWN0dXJlLCBzbyBpdAppcyBvbmx5IGZpdHRpbmcgdGhhdCB3
ZSBkbyB3b3JrYXJvdW5kIHRoaXMgd2l0aCBhIHN5bWxpbmsuCgpOb3RlOiBpdCBzaG91bGQgYmUg
cmVsYXRpdmVseSBlYXN5IGluIEJ1aWxkcm9vdCB0byBhZGQgc3VwcG9ydCBmb3IKcHJvdmlkaW5n
IHRoZSBsb2NhdGlvbiBvZiBpbmRpdmlkdWFsIGJpbmFyaWVzIGluc3RhbGxlZCBieSBhIGdvbGFu
ZwpwYWNrYWdlLiBJbmRlZWQsIGdvbGFuZyBwYWNrYWdlIHVzdWFsbHkgaW5zdGFsbCB2ZXJ5IGZl
dyBleGVjdXRhYmxlcywKdXN1YWxseSBqdXN0IG9uZTsgd2hlbiB0aGV5IGluc3RhbGwgbXVsdGlw
bGUsIGl0J3MganVzdCBhIGhhbmRmdWwgb2YKdGhlbSwgYW5kIHRoZXkgbW9zdGx5IGFsd2F5cyBn
byBpbnRvIC91c3IvYmluLy4gRm9yIHRoZSB2ZXJ5IGZldyB0aGF0Cm5lZWQgdG8gZ28gaW4gL3Vz
ci9zYmluLCB0aGVuIHRoaXMgY2FuIGJlIG92ZXJyaWRkZW4gaW4gdGhlIHBhY2thZ2UgLm1rOwpt
YXliZSBzb21ldGhpbmcgbGlrZToKCiAgICBUQUlMU0NBTEVfQklORElSX3RhaWxzY2FsZWQgPSAv
dXNyL3NiaW4KCmFuZCB0aGVuIGluIHRoZSBnb2xhbmctcGFja2FnZSBpbmZyYToKCiAgICAxNjQg
ZGVmaW5lICQoMilfSU5TVEFMTF9UQVJHRVRfQ01EUwogICAgMTY1IMK7ICAgICAgICQkKGZvcmVh
Y2ggZCwkJCgkKDIpX0lOU1RBTExfQklOUyksXAogICAgMTY2IMK7ICAgICAgIMK7ICAgICAgICQk
KElOU1RBTEwpIC1EIC1tIDA3NTUgJCQoQEQpL2Jpbi8kJChkKSAkJChUQVJHRVRfRElSKSQob3Ig
JCQoJCgyKV9CSU5ESVJfJCQoZCkpLC91c3IvYmluKS8kJChkKQogICAgMTY3IMK7ICAgICAgICkK
ICAgIDE2OCBlbmRlZgoKKEkgZG9uJ3QgdGhpbmsgYSBzaW1pbGFyIGZlYXR1cmUgd291bGQgYmUg
bmVlZGVkIGZvciBob3N0IHBhY2thZ2VzLApiZWNhdXNlIHdlIGRvbid0IGNhcmUgYWJvdXQgYmlu
IHZzLiBzYmluIGZvciB0aG9zZS4pCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX19fX18KLi0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tOiAgICAgICBfICAgIDotLS0tLS0tLS0tLS0t
LS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgICAgX18vICkg
ICB8IC8iXCBBU0NJSSBSSUJCT04gfAp8ICAgICAgICAgICAgICAgICB8IFNvZnR3YXJlICBEZXNp
Z25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKfCArMzMgNjM4LjQxMS4yNDUg
Jy0tLS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAgICBgLS0sIHwgIFggIEFHQUlOU1QgICAgICB8Cnwg
eWFubi5tb3JpbiAoYXQpIG9yYW5nZS5jb20gICAgICAgICAgIHxfPSIgICAgLC0tJyB8IC8gXCBI
VE1MIE1BSUwgICAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS06X19f
X19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KQ2UgbWVzc2FnZSBldCBzZXMgcGllY2VzIGpvaW50
ZXMgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNvbmZpZGVudGllbGxlcyBvdSBw
cml2aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jDQpwYXMgZXRyZSBkaWZmdXNlcywgZXhwbG9p
dGVzIG91IGNvcGllcyBzYW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBhdmV6IHJlY3UgY2UgbWVz
c2FnZSBwYXIgZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWduYWxlcg0KYSBsJ2V4cGVkaXRldXIgZXQg
bGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4gTGVzIG1lc3NhZ2VzIGVs
ZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwNCk9yYW5nZSBkZWNs
aW5lIHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBldGUgYWx0ZXJlLCBkZWZv
cm1lIG91IGZhbHNpZmllLiBNZXJjaS4NCg0KVGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVu
dHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3JtYXRpb24gdGhh
dCBtYXkgYmUgcHJvdGVjdGVkIGJ5IGxhdzsNCnRoZXkgc2hvdWxkIG5vdCBiZSBkaXN0cmlidXRl
ZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLg0KSWYgeW91IGhhdmUgcmVj
ZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBk
ZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMuDQpBcyBlbWFpbHMgbWF5IGJl
IGFsdGVyZWQsIE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0IGhhdmUgYmVl
biBtb2RpZmllZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuDQpUaGFuayB5b3UuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
