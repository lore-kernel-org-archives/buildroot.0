Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FECC433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 09:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B09C6405CE;
	Fri, 11 Mar 2022 09:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIEV2dmSUple; Fri, 11 Mar 2022 09:34:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EFD64059E;
	Fri, 11 Mar 2022 09:34:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 054D61BF39C
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 09:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3938405AE
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 09:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DZUKA3OObhtz for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 09:34:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FBEA4059E
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 09:34:12 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1EDA7200005;
 Fri, 11 Mar 2022 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646991251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YDScwy52vVVUlj0Fxf1Nnq9epIdBvWxJNwrLbXOFGag=;
 b=GdyO/1BUzfXJwT0KoqYQNLrStwJ/F+ynuOwIzNX0Cuo1ueKrXVka5VgMec0U+5aFg2woQq
 S+U/fun2onIB1gwzfuWInxYgXfE0YkKxFJ/31QkXeA3/g/leyZwH912D1s0wkoPLuLLCqm
 b+hE7/caJ87+8SHXxZlwh5ttG+d4mLgDhn99sEfWbcppQxXg3lYs4NG87uJCyHKX2BGryS
 xjBzg3CA+qlWQNJCa+nRUQAD55/wO2m6lIbsJ52v6r4+HS8MEU2Ix+6nAZj3wp7LAXFcIF
 r2xnKhn7bIBr7Unb01WGpUJYdxBZj9a7X6DNBLluzxbjmWNH7RyEVEbkc4CjvQ==
Date: Fri, 11 Mar 2022 10:32:46 +0100
To: buildroot@buildroot.org
Message-ID: <20220311103246.471185ee@fixe.home>
In-Reply-To: <20220310165735.1102802-1-clement.leger@bootlin.com>
References: <20220310165735.1102802-1-clement.leger@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 0/7] boot/optee-os: support new optee-os
 3.16.0 build dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgVGh1LCAxMCBNYXIgMjAyMiAxNzo1NzoyOCArMDEwMCwKQ2zDqW1lbnQgTMOpZ2VyIDxjbGVt
ZW50LmxlZ2VyQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cgo+IE5ld2VyIHZlcnNpb25zIG9mIG9w
dGVlLW9zICg+PSAzLjE2LjApIHVzZXMgcHl0aG9uLWNyeXB0b2dyYXBoeSBpbnN0ZWFkCj4gb2Yg
cHl0aG9uLXB5Y3J5cHRvZG9tZXggdG8gYnVpbGQuIFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCB0
byBidWlsZAo+IGhvc3QtcHl0aG9uLWNyeXB0b2dyYXBoeSBhbmQgdXNlcyBpdCBpbiBvcHRlZS1v
cyBwYWNrYWdlIHRvIGJ1aWxkIHRoZQo+IDMuMTYuMCB2ZXJzaW9uLiBBbHNvIGJ1bXAgb3B0ZWUt
Y2xpZW50LCBvcHRlZS1iZW5jaG1hcmssIG9wdGVlLWV4YW1wbGVzCj4gYW5kIG9wdGVlLXRlc3Qg
d2hpY2ggbmVlc3MgdG8gYmUgYWxpZ25lZCB3aXRoIG9wdGVlLW9zIHZlcnNpb24uCj4gCj4gLS0t
LQo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBCdW1wIG9wdGVlLWNsaWVudCwgb3B0ZWUtYmVuY2ht
YXJrLCBvcHRlZS1leGFtcGxlcyBhbmQgb3B0ZWUtdGVzdAo+IAo+IENsw6ltZW50IEzDqWdlciAo
NCk6Cj4gICBwYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFwaHk6IGVuYWJsZSBob3N0IHBhY2thZ2UK
PiAgIGJvb3Qvb3B0ZWUtb3M6IGFkZCBzdXBwb3J0IHRvIGJ1aWxkIHdpdGggcHl0aG9uLWNyeXB0
b2dyYXBoeQo+ICAgYm9vdC9vcHRlZS1vczogYnVtcCB0byB2ZXJzaW9uIDMuMTYuMAo+ICAgcGFj
a2FnZS9vcHRlZS10ZXN0OiBidW1wIHRvIHZlcnNpb24gMy4xNi4wCj4gCj4gRXRpZW5uZSBDYXJy
aWVyZSAoMyk6Cj4gICBwYWNrYWdlL29wdGVlLWV4YW1wbGVzOiBidW1wIHRvIHZlcnNpb24gMy4x
Ni4wCj4gICBwYWNrYWdlL29wdGVlLWNsaWVudDogYnVtcCB0byB2ZXJzaW9uIDMuMTYuMAo+ICAg
cGFja2FnZS9vcHRlZS1iZW5jaG1hcms6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjAKPiAKPiAgYm9v
dC9vcHRlZS1vcy9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysr
KysrKysrKy0tCj4gIGJvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaCAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KPiAgYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tayAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNyArKysrKystCj4gIHBhY2thZ2Uvb3B0ZWUtYmVuY2htYXJrL29wdGVl
LWJlbmNobWFyay5oYXNoICAgICAgIHwgIDQgKystLQo+ICBwYWNrYWdlL29wdGVlLWJlbmNobWFy
ay9vcHRlZS1iZW5jaG1hcmsubWsgICAgICAgICB8ICAyICstCj4gIHBhY2thZ2Uvb3B0ZWUtY2xp
ZW50L29wdGVlLWNsaWVudC5oYXNoICAgICAgICAgICAgIHwgIDQgKystLQo+ICBwYWNrYWdlL29w
dGVlLWNsaWVudC9vcHRlZS1jbGllbnQubWsgICAgICAgICAgICAgICB8ICAyICstCj4gIHBhY2th
Z2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMuaGFzaCAgICAgICAgIHwgIDQgKystLQo+
ICBwYWNrYWdlL29wdGVlLWV4YW1wbGVzL29wdGVlLWV4YW1wbGVzLm1rICAgICAgICAgICB8ICAy
ICstCj4gIHBhY2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0Lmhhc2ggICAgICAgICAgICAgICAg
IHwgIDQgKystLQo+ICBwYWNrYWdlL29wdGVlLXRlc3Qvb3B0ZWUtdGVzdC5tayAgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gIHBhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9weXRob24tY3J5
cHRvZ3JhcGh5Lm1rIHwgIDcgKysrKysrKwo+ICAxMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRp
b25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKClNhZGx5LCBJIHVzZWQgY29tbWl0cyBmcm9tIEV0
aWVubmUgQ2FycmllcmUgYXMgaW5pdGlhbCBjb21taXRzIG1lc3NhZ2VzCih1c2luZyAtYykuIEkg
ZGlkIG5vdCBub3RpY2VkIGl0IHJldXNlZCB0aGUgb3JpZ2luYWwgY29tbWl0IGF1dGhvci4KSSB3
aWxsIHJlc2VuZCBhIFYzIHdpdGggYXV0aG9yc2hpcCBmaXhlZCBwcm9wZXJseS4gU29ycnkgZm9y
IHRoZQppbmNvbnZlbmllbmNlLgoKLS0gCkNsw6ltZW50IEzDqWdlciwKRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlciBhdCBCb290bGluCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
