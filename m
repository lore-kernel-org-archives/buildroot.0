Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5C3E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C58A080BC2;
	Wed,  8 Jan 2025 21:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTqUyrFHcOWo; Wed,  8 Jan 2025 21:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3A7E80BB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3A7E80BB3;
	Wed,  8 Jan 2025 21:45:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85ABD7AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72B7140272
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmsaW6ezqP0w for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:45:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 579CA4024F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 579CA4024F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 579CA4024F
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:45:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C72FC5FFAF;
 Wed,  8 Jan 2025 22:45:27 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36182])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Jan 2025 22:45:27 +0100
MIME-Version: 1.0
Date: Wed, 08 Jan 2025 22:45:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Christoph Muellner
 <christoph.muellner@theobroma-systems.com>
In-Reply-To: <20250107142109.1308899-1-vincent.stehle@arm.com>
References: <20250107142109.1308899-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <29fcdb83ef22ca11468675672a1ac675@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736372730;
 bh=KRvCx2JDjFmWNlaqYKQwnY7P2OHiW2dE+qBwLwVGjWI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ggjmxW99ocp2X1xVuDV888dl1VDd8LhrTTbhp/NBDGEelGqu7wE+hNAYxuvzaIxDa
 xtKWPPIgx8WEebMzOShGWPKC6tCsqlBkh0ZK/Yux+qWzi6/SpXrW0Flas3ebBUo87q
 vXWONAeIiwqj2NGQxTZ9kk/wqYNuYRaIFclRj1U7MjNAo/OojhsBlU7LAZvpndMMI8
 dJT9yg78V+oylTXoXvgYU33sh0fYx+oWT6Qjypx7xizBQpwnaBVfvrpgGHWcXpJ3sh
 EQi570ossmwLtqxedux84JtpOuIPQ0LXPpVGG+c+R4s+wfTIX/GduW6u+PghZkNxDY
 4LyOnX/zxAiKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ggjmxW99
Subject: Re: [Buildroot] [PATCH] boot/uboot: add support for embedded TEE in
 binary format
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDcvMDEvMjAyNSAxNToyMSwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IFdlIGNhbiBlbWJl
ZCBhIFRFRSBpbiBFTEYgZm9ybWF0IGludG8gVS1Cb290LCBidXQgdmVyc2lvbnMgb2YgT1AtVEVF
IAo+IHNpbmNlCj4gMy44LjAgbXVzdCBiZSBlbWJlZGRlZCBpbiBiaW5hcnkgZm9ybWF0LCBhcyB0
aGUgdGVlLmJpbiBjb250YWlucyAKPiBpbXBvcnRhbnQKPiBtZXRhLWRhdGEuIFsxXQo+IAo+IFVw
ZGF0ZSB0aGUgY29uZmlndXJhdGlvbiBtZW51IGFuZCB0aGUgTWFrZWZpbGUgdG8gYWxsb3cgc2Vs
ZWN0aW5nIHRvCj4gZW1iZWQgZWl0aGVyIHRlZS5lbGYgb3IgdGVlLmJpbi4KPiAKPiBCeSBkZWZh
dWx0LCBlbWJlZCB0aGUgVEVFIGluIEVMRiBmb3JtYXQgdG8gc3RheSBjb21wYXRpYmxlIHdpdGgg
Cj4gZXhpc3RpbmcKPiBjb25maWd1cmF0aW9ucy4KPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29t
L09QLVRFRS9vcHRlZV9vcy9pc3N1ZXMvNDU0Mgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQg
U3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogQ2hyaXN0b3BoIE11ZWxsbmVy
IDxjaHJpc3RvcGgubXVlbGxuZXJAdGhlb2Jyb21hLXN5c3RlbXMuY29tPgoKQXBwbGllZCB0byBt
YXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
