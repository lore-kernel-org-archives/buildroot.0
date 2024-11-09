Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01608D5E374
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 21:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9291D60736;
	Sat,  9 Nov 2024 21:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHMk06fbLvCR; Sat,  9 Nov 2024 21:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0F3260757
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0F3260757;
	Sat,  9 Nov 2024 21:20:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F082ED92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 21:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBE4840429
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 21:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7bJPAeHU2fJ for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 21:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3F7F40424
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3F7F40424
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3F7F40424
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 21:20:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4D61C13F8A7;
 Sat,  9 Nov 2024 22:20:49 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41454])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Nov 2024 22:20:49 +0100
MIME-Version: 1.0
Date: Sat, 09 Nov 2024 22:20:49 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <CADvTj4pPXyLTmRwaN_XROg4ZRDaN-_ag7uHStzP9PH+jf8GPrg@mail.gmail.com>
References: <20240818235602.1867361-1-james.hilliard1@gmail.com>
 <f801ef73029a96970d99d8298afe78c1@free.fr>
 <CADvTj4pPXyLTmRwaN_XROg4ZRDaN-_ag7uHStzP9PH+jf8GPrg@mail.gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3a2ffbd005d1eed6a9a87f66d883cc19@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731187250;
 bh=znPOI101Lwm7/OC+N6moaqdSsKTN3pJxDN6FhaSqdAI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R/hFtkxWGHvR490+GIQ87KsalbFH8q3q3GjH6NXs3Cmf91hY0J97/MJ/2sxExEO+q
 9gcYDpjju68uZ32IbHZdPd/ZK4jtWE/4V+QGqjTlFASNzOwEBIF0UtSXs9nn4FQOKh
 Wrml5Jyob0H5JjBB2tAjvqD3nZQZ+MCVZx894h4xK2CpwQiKJ0SClPNiUIebav8n6N
 E9EFFUBHnsArdvFExMmqYNuJ9gmqiT1ZkTHZcfceaaEobeP957VmFlmCjOMH6of6/1
 VY1dEzOUOzyVD2COaAJvqT+A8nRz1ZBanYBWuQQpvqY6MO0mOo5bjeYL8f6AQpTGEJ
 YBOdkpoFeKEXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R/hFtkxW
Subject: Re: [Buildroot] [PATCH 1/1] package/uefisettings: new package
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

SGkgSmFtZXMsCgpPbiAwOS8xMS8yMDI0IDIxOjUyLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBP
biBTYXQsIE5vdiA5LCAyMDI0IGF0IDE6MjnigK9QTSBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVl
LmZyPiB3cm90ZToKPj4gCj4+IEhpIEphbWVzLAo+PiAKPj4gV2hpbGUgcnVubmluZyBhIHRlc3Qt
cGtnIG9uIHRoaXMgcGFja2FnZSwgaXQgc2VlbXMgYWxsCj4+IDMyLWJpdCBidWlsZHMgYXJlIGZh
aWxpbmcuIFNlZToKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL3Bp
cGVsaW5lcy8xNTM0ODk3MjI1Cj4+IAo+PiBEb2VzIHRoaXMgcGFja2FnZSBuZWVkcyBhICJkZXBl
bmRzIG9uIEJSMl9BUkNIX0lTXzY0Ij8KPj4gQ2FuIHlvdSBoYXZlIGEgbG9vayBwbGVhc2U/Cj4g
Cj4gWWVhaCwgYmFzZWQgb24gdGhvc2UgZXJyb3JzIGl0IGxvb2tzIGxpa2UgaXQgZG9lcywgc2hv
dWxkIEkgcmVzcGluCj4gdGhlIHBhdGNoIG9yIGRvIHlvdSB3YW50IHRvIGp1c3QgYWRkIGl0IHdo
ZW4gYXBwbHlpbmc/CgpTaW5jZSB5b3UgY29uZmlybSB0aGUgImRlcGVuZHMgb24gQlIyX0FSQ0hf
SVNfNjQiIGlzIGVub3VnaCwKSSdsbCBqdXN0IGFkZCBpdCBteXNlbGYuCgpCZXN0IHJlZ2FyZHMs
CgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
