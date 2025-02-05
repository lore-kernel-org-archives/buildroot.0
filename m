Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25E8C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 09:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 852D7415EB;
	Wed,  5 Feb 2025 09:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WErB-mL2jXYH; Wed,  5 Feb 2025 09:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A6EF41609
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A6EF41609;
	Wed,  5 Feb 2025 09:44:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C66D1CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE90A4130A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ro8PPsKfuntq for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 09:44:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B97EC41681
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B97EC41681
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B97EC41681
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:41:36 +0000 (UTC)
X-CSE-ConnectionGUID: r25N+mPHTs+aA642/KOscA==
X-CSE-MsgGUID: Zee04Tg7Sgexa+zD8Hv2lg==
Received: from unknown (HELO opfedv3rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 10:41:34 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Feb 2025 10:41:34 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 5 Feb 2025 10:41:32 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 05 Feb 2025 10:41:31 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: nBM+y863QPSJBBb0NA/pTg==
X-CSE-MsgGUID: G3yKWba1T5iFf20w4voDkQ==
X-IronPort-AV: E=Sophos;i="6.13,261,1732575600"; d="scan'208";a="253031600"
Date: Wed, 5 Feb 2025 10:41:31 +0100
To: Christian Stewart <christian@aperture.us>
Message-ID: <Z6MyS48IVKJ8vhsC@yd-6wlzhs3>
References: <20250204143227.1233163-1-fiona.klute@gmx.de>
 <CA+h8R2odWOyS=7=9LGGkBGHYENiLHtkj76_L2Zvq_PHOFYs9sA@mail.gmail.com>
 <527da78c-270f-4ec6-8a6e-1210456517a5@mind.be>
 <Z6MhhfrgmRrtMhrB@yd-6wlzhs3>
 <CA+h8R2qR95DDHn45tqUG57rSCRWpfWkVU2sd2GxpCDhkkzrr_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2qR95DDHn45tqUG57rSCRWpfWkVU2sd2GxpCDhkkzrr_w@mail.gmail.com>
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX102.corporate.adroot.infra.ftgroup (10.115.26.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738748498; x=1770284498;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=9/5dHQqtDJbNPneFGrypV9n+ogKkLt0XoMOmSsm2xvc=;
 b=jGIZvaZYLyqEhv8dmzvwYAVjUM12iwEWug7pIwg37EB2MOg5duUnYwS5
 BdDwQ9vm+wX217jG4FxsPA160elDjSWFOdVLpwCYUOqz/kATa/RoEbz7i
 cWfKytkqBeHAo5AoEzw9imNirV/+Q3NzsJ0dHo9eKzemJXs50c6ZfBtu5
 URsVPFNTRhqRhWa93qnH0wP0MlMnF0dctnWRZHnYR26wyEQs14S6N1SjZ
 aVs95q2Hp1jwWLiFZBsgwvfreby62aa6I9LJMU+Wa/s9bzH8qqEp5IZ2/
 7xqCdZ50icnqD66xpqIdOjtUkRAHwstcwPMnv7kWhaFgWx+eCke7qgNXQ
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=jGIZvaZY
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix build with
 toolchain without Gold linker
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
Cc: Thomas Perale <thomas.perale@mind.be>, Fiona Klute <fiona.klute@gmx.de>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hyaXN0aWFuLCBBbGwsCgpPbiAyMDI1LTAyLTA1IDAxOjIwIC0wODAwLCBDaHJpc3RpYW4gU3Rl
d2FydCBzcGFrZSB0aHVzbHk6Cj4gT24gV2VkLCBGZWIgNSwgMjAyNSwgMTI6MjnigK9BTSA8IFsx
XXlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4gd3JvdGU6Cj4gICBTbywgSSBndWVzcyB5b3Ugb25seSBh
Y3R1YWxseSBzdWdnZXN0ZWQgbW92aW5nIHNldHRpbmcgLWZ1c2UtbGQ9YmZkIGFuZAo+ICAgLVds
LC0tbm8tcGllIGZsYWdzIGludG8gcGtnLWdvbGFuZywgcmlnaHQ/Cj4gTXkgdGhpbmtpbmcgaXMg
dGhhdCB3ZSBhbHdheXMgd2FudCBHbyB0byBoYXZlIGZ1c2UtbGQgc2V0IHRvIHRoZSBjb3JyZWN0
ICJsZCIgd2UgYXJlIHVzaW5nLiBTbyBpdCBtYWtlcyBzZW5zZSB0byBzZXQgdGhpcyBpbgo+IHBr
Zy1nb2xhbmcuCj4gVGhpcyB3YXkgYW55IG5ldyBwYWNrYWdlcyB0aGF0IGhhdmUgZHluYW1pYyBs
aW5raW5nIChjZ28pIHdpbGwgYWxzbyBwaWNrIHVwIHRoZSBmaXggYXMgbmVlZGVkLgoKT0ssIHRo
YXQgaXMgZm9yIC1mdXNlLWxkPWJmZC4gVGhhdCBtYWtlcyBzZW5zZS4KCldoYXQgYWJvdXQgLVds
LC0tbm8tcGllLCB0aGVuPyBEb2VzIGl0IGFsc28gbWFrZSBzZW5zZSB0byBoYXZlIGluIHRoZQpp
bmZyYSBhcyB3ZWxsPwoKPiAgIFdoZW4gSSBpbml0aWFsbHkgbmVlZGVkIC1mdXNlLWxkPWJmZCBm
b3IgZmlsZWJlYXQsIEkgZGlkIG5vdCBmZWVsIHZlcnkKPiAgIGNvbmZpZGVudCB0aGF0IHdlIHNo
b3VsZCBkbyBpdCB1bmNvbmRpdGlvbmFsbHkuIEluZGVlZCwgbm9uZSBvZiB0aGUKPiAgIHtob3N0
LSx9Z29sYW5nLXBhY2thZ2UgcGFja2FnZXMgd2UgaGFkIGF0IHRoYXQgdGltZSBuZWVkZWQgaXQg
YXQgYWxsLiBTbwo+ICAgSSBjb25jbHVkZWQgdGhhdCBmaWxlYmVhdCB3YXMgc3BlY2lhbCAoaXQg
d2FzIGFscmVhZHkgc3BlY2lhbCBpbiBhIGZldwo+ICAgb3RoZXIgcmVzcGVjdHMsIHNvIG1laCku
Cj4gSXQgaXMganVzdCBiZWNhdXNlIGl0IHVzZXMgY2dvLCBvciBhbSBJIHdyb25nPwoKVEJILCBJ
IGp1c3QgYmFuZ2VkIG9uIGl0IHVudGlsIGl0IGJ1aWxkIGFuZCBydW4uIElmIGNnbyBpcyB0aGUg
cmVhc29uIHdlCm5lZWQgdG8gcGFzcyAtZnVzZS1sZD1iZmQsIHRoZW4gdGhhdCBzaG91bGQgYmUg
cGFydCBvZiB0aGUgY29uZGl0aW9uLApubz8gaS5lLiwgc29tZXRoaW5nIGxpa2UgKGluIHBrZy1n
b2xhbmcubWspOgoKICAgIGlmZXEgKCQkKEJSMl9QQUNLQUdFX0hPU1RfR09fVEFSR0VUX0NHT19M
SU5LSU5HX1NVUFBPUlRTKSx5KQogICAgaWZlcSAoJCQoQlIyX2FhcmNoNjQpLHkpCiAgICAkKDIp
X0VYVExERkxBR1MgKz0gLWZ1c2UtbGQ9YmZkCiAgICBlbmRpZiAgIyBBQXJjaDY0CiAgICBlbmRp
ZiAgIyBDR08gbGlua2luZwoKT3IgY2FuIHdlIGp1c3QgcGFzcyBpdCB1bmNvbmRpdGlvbmFsbHks
IGV2ZW4gaWYgaXQgaXMgYWN0dWFsbHkgbm90IGdvaW5nCnRvIGJlIHVzZWQ/IEkuZS4gZG8gd2Ug
bmVlZCBhbnkgY29uZGl0aW9uIGF0IGFsbCwgZXZlbSB0aGUgQUFyY2g2NCBvbmU/CgpJZiB3ZSB3
YW50IHRvIGludHJvZHVjZSB0aGF0IGFzc2lnbm1lbnQgaW4gdGhlIGluZnJhLCB3ZSBuZWVkIHRv
IGdldCBhcwptdWNoIGluc2lnaHRzIGFzIHBvc3NpYmxlIHRvIGV4cGxhaW4gaXQsIGFuZCB3ZSBu
ZWVkIHRvIGdldCBhZmZpcm1hdGl2ZQpzdGF0ZW1lbnRzIGFzIHRvIGhvdyB3ZSBzaG91bGQgc2V0
IGl0LgoKSSBndWVzcyBteSBwYXRjaCBhZGRpbmcgRk9PX0VYVExERkxBR1Mgd291bGQgbm90IGNo
YW5nZSwgYnV0IEZpb25hIHdpbGwKbmVlZCB0aGF0IGluZm8gaWYgc2hlIGlzIHRvIHJlc3BpbiBh
IGZpeCBmb3IgY29udGFpbmVyZCdzIGJ1aWxkIGZhaWx1cmUuCgpbLS1TTklQLS1dCj4gICBTdGls
bCwgSSBiZWxpZXZlIHRoZXJlIHNob3VsZCBiZSBhIHdheSBmb3IgcGFja2FnZXMgdG8gYmUgYWJs
ZSB0byBwYXNzCj4gICBhcmJpdHJhcnkgZXh0bGRmbGFncywgYW5kIHRodXMgdGhlIHZhcmlhYmxl
IHNob3VsZCBiZSBleHBvc2VkLgo+IFllcywgdGhhdCB2YXJpYWJsZSBzaG91bGQgYmUgZXhwb3Nl
ZCwgSSBhZ3JlZS4gSXQncyB1c2VmdWwgdG8gYmUgYWJsZSB0byBwYXNzIGV4dHJhIGxkIGZsYWdz
IGFzIG5lZWRlZC4KCkFDSywgdGhhbmtzIGZvciB0aGUgZmVlYmFjayEKClJlZ2FyZHMsCllhbm4g
RS4gTU9SSU4uCgotLSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9f
X19fX19fX19fXwouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS06ICAgICAg
IF8gICAgOi0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAgICBfXy8gKSAgIHwgLyJcIEFTQ0lJIFJJQkJPTiB8CnwgICAgICAgICAgICAg
ICAgIHwgU29mdHdhcmUgIERlc2lnbmVyIHwgIF8vIC0gLycgICB8IFwgLyBDQU1QQUlHTiAgICAg
fAp8ICszMyA2MzguNDExLjI0NSAnLS0tLS0tLS0tLS0tLS0tLS0tLS06IChfICAgIGAtLSwgfCAg
WCAgQUdBSU5TVCAgICAgIHwKfCB5YW5uLm1vcmluIChhdCkgb3JhbmdlLmNvbSAgICAgICAgICAg
fF89IiAgICAsLS0nIHwgLyBcIEhUTUwgTUFJTCAgICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLTpfX19fX18vX19fX186LS0tLS0tLS0tLS0tLS0tLS0tJwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpDZSBtZXNzYWdl
IGV0IHNlcyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50IGNvbnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMg
Y29uZmlkZW50aWVsbGVzIG91IHByaXZpbGVnaWVlcyBldCBuZSBkb2l2ZW50IGRvbmMNCnBhcyBl
dHJlIGRpZmZ1c2VzLCBleHBsb2l0ZXMgb3UgY29waWVzIHNhbnMgYXV0b3Jpc2F0aW9uLiBTaSB2
b3VzIGF2ZXogcmVjdSBjZSBtZXNzYWdlIHBhciBlcnJldXIsIHZldWlsbGV6IGxlIHNpZ25hbGVy
DQphIGwnZXhwZWRpdGV1ciBldCBsZSBkZXRydWlyZSBhaW5zaSBxdWUgbGVzIHBpZWNlcyBqb2lu
dGVzLiBMZXMgbWVzc2FnZXMgZWxlY3Ryb25pcXVlcyBldGFudCBzdXNjZXB0aWJsZXMgZCdhbHRl
cmF0aW9uLA0KT3JhbmdlIGRlY2xpbmUgdG91dGUgcmVzcG9uc2FiaWxpdGUgc2kgY2UgbWVzc2Fn
ZSBhIGV0ZSBhbHRlcmUsIGRlZm9ybWUgb3UgZmFsc2lmaWUuIE1lcmNpLg0KDQpUaGlzIG1lc3Nh
Z2UgYW5kIGl0cyBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmls
ZWdlZCBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBwcm90ZWN0ZWQgYnkgbGF3Ow0KdGhleSBzaG91
bGQgbm90IGJlIGRpc3RyaWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3aXRob3V0IGF1dGhvcmlzYXRp
b24uDQpJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90
aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSB0aGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50
cy4NCkFzIGVtYWlscyBtYXkgYmUgYWx0ZXJlZCwgT3JhbmdlIGlzIG5vdCBsaWFibGUgZm9yIG1l
c3NhZ2VzIHRoYXQgaGF2ZSBiZWVuIG1vZGlmaWVkLCBjaGFuZ2VkIG9yIGZhbHNpZmllZC4NClRo
YW5rIHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
