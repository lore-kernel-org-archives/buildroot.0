Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D02FC4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 19:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A83094197D;
	Fri, 14 Oct 2022 19:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A83094197D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id euX_p7OsENWU; Fri, 14 Oct 2022 19:30:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E81341975;
	Fri, 14 Oct 2022 19:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E81341975
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1DB91BF352
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 19:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDC2160B89
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 19:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDC2160B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G8HsvgMM4nzS for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 19:30:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA3FE60B88
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA3FE60B88
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 19:30:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:24db:412f:58ba:c302])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E3FF3780310;
 Fri, 14 Oct 2022 21:30:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 14 Oct 2022 21:30:21 +0200
Date: Fri, 14 Oct 2022 21:30:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: feedback@dallmeier.com
Message-ID: <20221014193021.GD2503@scaer>
References: <59335227-32d1-9d2f-ce9c-4a7a45ea913b@dallmeier.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59335227-32d1-9d2f-ce9c-4a7a45ea913b@dallmeier.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1665775824;
 bh=OTnm2+RddVRed/pjWUo23kw7ZVj+1drSPEUStUnlvf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jPGjcWslnagz1k/tWJOU11JwgMaqxK+MaQwmH+XqYi9s205wVv6utHs3aL6uI/XtC
 buzY3TkLLxBpjXJieXPN1tADhXQ+1sYLNjrFKPjRmUPATmdceieJaM1bsQTyNtRk4O
 HL+aTRG8F2yuhmuXOOzwiXkP3iUwnhgEyJgZF6ox6msYjOYIfKemsoc2BDqc4eJTRg
 iyyuO8Ze/tebZrTZj6E+UAKKLhJ7oU9P3R3fvNILsJ2KBwrtlmlSwb6SP9HwkJuli4
 MBKbK9DmCgeQ8D+cgoL1f369dTs5CEIQaQTRdFgpRN75rOxtx1zQ5Hh4FcGMYjwV01
 yq1DXXvyQ0IAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jPGjcWsl
Subject: Re: [Buildroot] [PATCH] package/dhcpcd: Fix kconfig option for
 privilege separation
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW5kcmVhcywgQWxsLAoKT24gMjAyMi0xMC0xNCAxMToxMCArMDIwMCwgZmVlZGJhY2stLS0gdmlh
IGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gSGkgYWxsLAo+IAo+IHdlIGFyZSBub3Qgc3VyZSBp
ZiB0aGlzIGlzIGV2ZW4gYSBidWcsIGJ1dCBCUjJfUEFDS0FHRV9ESENQQ0RfRU5BQkxFX1BSSVZT
RVAgaXMgbm90IHNlbGVjdGFibGUgdmlhICdtZW51Y29uZmlnJyB3aXRob3V0IHNldHRpbmcgYQo+
IHN0cmluZyBmb3IgdGhlIGJvb2wgdmFsdWUuCgpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLgoK
VGhhdCB3YXMgb24gcHVycG9zZSB0aGF0IHRoaXMgd2FzIG5vdCBzZWxlY3RhYmxlLCBzZWUgdGhl
IGNvbW1pdCBsb2cKdGhhdCBpbnRyb2R1Y2VkIHRoZSBvcHRpb24sIDIwZGQ5NDUzZjMyYyAocGFj
a2FnZS9kaGNwY2Q6IGFkZApCUjJfUEFDS0FHRV9ESENQQ0RfRU5BQkxFX1BSSVZTRVApLCB3aGlj
aCByZWZlcnJlZCB0bzoKCiAgICBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
YnVpbGRyb290L3BhdGNoLzIwMjEwMzAzMDkxOTA0LjQ2NzcwNi0xLWZvbnRhaW5lLmZhYnJpY2VA
Z21haWwuY29tCgp3aGljaCBiYXNpY2FsbHkgc2FpZCAocGFyYXBocmFzaW5nKToKCiAgICBGb3Ig
c3VjaCBjb21wbGV4IGNvbmRpdGlvbnMsIGl0IGlzIGVhc2llciB0byBpbnRyb2R1Y2UgYSBLY29u
ZmlnCiAgICBzeW1ib2wsIHJhdGhlciB0aGFuIHdyaXRlIGNvbXBsZXggTWFrZWZpbGUgY29kZSBp
biB0aGUgLm1rIGZpbGUuCgpJbmRlZWQsIGJlZm9yZSAyMGRkOTQ1M2YzMmMsIHRoZXJlIHdlcmUg
cXVpdGUgYSBmZXcgcmVwZXRpdGl2ZSBjb2RlCmJsb2NrcyB0byBoYW5kbGUgZWFjaCBvZiB0aGVt
LCBzZWUgY29tbWl0IGQ0MTI1MzlkYmNhMiAocGFja2FnZS9kaGNwY2Q6CmRpc2FibGUgcHJpdnNl
cCBvbiBvbGRlciBrZXJuZWxzKS4KCkNhbiB5b3UgZXhwbGFpbiB3aHkgeW91J2Qgd2FudCB0byBl
eHBsaWNpdGx5IGRpc2FibGUgcHJpdmlsZWdlCnNlcGFyYXRpb24gaW4gZGhjcGNkPwoKPiAtLS0g
YS9wYWNrYWdlL2RoY3BjZC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2RoY3BjZC9Db25maWcu
aW4KPiBAQCAtMTIsNyArMTIsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfREhDUENECj4gwqBpZiBC
UjJfUEFDS0FHRV9ESENQQ0QKPiDCoAo+IMKgY29uZmlnIEJSMl9QQUNLQUdFX0RIQ1BDRF9FTkFC
TEVfUFJJVlNFUAo+IC3CoMKgwqDCoMKgwqAgYm9vbAo+ICvCoMKgwqDCoMKgwqAgYm9vbCAiZW5h
YmxlIHByaXZpbGVnZSBzZXBhcmF0aW9uIgo+IMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQgeQo+IMKg
wqDCoMKgwqDCoMKgIGRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPiDCoMKgwqDCoMKgwqDCoCAjIEF1
ZGl0IGhlYWRlcnMgd2VyZSBvbmx5IGFkZGVkIGluIHJlY2VudCBrZXJuZWxzIGZvciBzb21lIGFy
Y2hlcwo+IAo+IEJlc3QgcmVnYXJkcywKPiBBbmRyZWFzCgo+IDxodG1sPgoKUGxlYXNlLCBhdm9p
ZCBodG1sIG1haWw7IG91ciBwYXRjaHdvcmsgZGlkIG5vdCBldmVuIGNhdGNoIGl0OgogICAgaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0LwoKTmV4dCB0
aW1lLCBwbGVhc2UgdXNlICJnaXQgc2VuZC1lbWFpbCIsIHdoaWNoIHNlbmRzIHBhdGNoZXMgaW4g
YSBmb3JtYXQKcmVhZHkgdG8gYmUgZGlnZXN0ZWQgdG8gYmUgYXBwbGllZCBlYXNpbHkuCgpSZWdh
cmRzLApZYW5uIEUuIE1PUklOLgoKPiAgIDxoZWFkPgo+ICAgICA8bWV0YSBodHRwLWVxdWl2PSJD
b250ZW50LVR5cGUiIGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+Cj4gICA8L2hl
YWQ+Cj4gICA8Ym9keT4KPiAgICAgPGZvbnQgZmFjZT0ibW9ub3NwYWNlIj5IaSBhbGwsPGJyPgo+
ICAgICAgIDxicj4KPiAgICAgICB3ZSBhcmUgbm90IHN1cmUgaWYgdGhpcyBpcyBldmVuIGEgYnVn
LCBidXQKPiAgICAgICBCUjJfUEFDS0FHRV9ESENQQ0RfRU5BQkxFX1BSSVZTRVAgaXMgbm90IHNl
bGVjdGFibGUgdmlhCj4gICAgICAgJ21lbnVjb25maWcnIHdpdGhvdXQgc2V0dGluZyBhIHN0cmlu
ZyBmb3IgdGhlIGJvb2wgdmFsdWUuPGJyPgo+ICAgICAgIDxicj4KPiAgICAgICAtLS0gYS9wYWNr
YWdlL2RoY3BjZC9Db25maWcuaW48YnI+Cj4gICAgICAgKysrIGIvcGFja2FnZS9kaGNwY2QvQ29u
ZmlnLmluPGJyPgo+ICAgICAgIEBAIC0xMiw3ICsxMiw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9E
SENQQ0Q8YnI+Cj4gICAgICAgwqBpZiBCUjJfUEFDS0FHRV9ESENQQ0Q8YnI+Cj4gICAgICAgwqA8
YnI+Cj4gICAgICAgwqBjb25maWcgQlIyX1BBQ0tBR0VfREhDUENEX0VOQUJMRV9QUklWU0VQPGJy
Pgo+ICAgICAgIC3CoMKgwqDCoMKgwqAgYm9vbDxicj4KPiAgICAgICArwqDCoMKgwqDCoMKgIGJv
b2wgImVuYWJsZSBwcml2aWxlZ2Ugc2VwYXJhdGlvbiI8YnI+Cj4gICAgICAgwqDCoMKgwqDCoMKg
wqAgZGVmYXVsdCB5PGJyPgo+ICAgICAgIMKgwqDCoMKgwqDCoMKgIGRlcGVuZHMgb24gQlIyX1VT
RV9NTVU8YnI+Cj4gICAgICAgwqDCoMKgwqDCoMKgwqAgIyBBdWRpdCBoZWFkZXJzIHdlcmUgb25s
eSBhZGRlZCBpbiByZWNlbnQga2VybmVscyBmb3Igc29tZQo+ICAgICAgIGFyY2hlczxicj4KPiAg
ICAgICA8YnI+Cj4gICAgICAgQmVzdCByZWdhcmRzLDxicj4KPiAgICAgICBBbmRyZWFzPGJyPgo+
ICAgICAgIDxicj4KPiAgICAgPC9mb250Pgo+ICAgPC9ib2R5Pgo+IDwvaHRtbD4KCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgotLSAKLi0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVND
SUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0
d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwK
fCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAg
IHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwg
Xy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
