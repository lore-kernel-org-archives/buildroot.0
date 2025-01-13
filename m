Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38433C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 17:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C45DF40611;
	Mon, 13 Jan 2025 17:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLfd9n6Fq3xZ; Mon, 13 Jan 2025 17:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B044940620
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B044940620;
	Mon, 13 Jan 2025 17:37:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13355940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 17:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E88EE8101B
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 17:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYjmhMLtiahQ for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 17:37:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 110DC80FD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 110DC80FD8
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 110DC80FD8
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 17:37:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9A371424;
 Mon, 13 Jan 2025 09:37:46 -0800 (PST)
Received: from debian (unknown [10.57.4.250])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7B0E3F673;
 Mon, 13 Jan 2025 09:37:17 -0800 (PST)
Date: Mon, 13 Jan 2025 18:37:14 +0100
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,
 =?utf-8?B?w4l0aWVubmUgQ2FycmnDqHJl?= <etienne.carriere@foss.st.com>
Message-ID: <Z4VPSgfJCfSCixaw@debian>
Mail-Followup-To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 =?utf-8?B?w4l0aWVubmUgQ2FycmnDqHJl?= <etienne.carriere@foss.st.com>
References: <20241220151531.59770-1-vincent.stehle@arm.com>
 <b5403f615bdbba4f0571fdefc5d16849@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5403f615bdbba4f0571fdefc5d16849@free.fr>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: Re: [Buildroot] [PATCH] boot/optee-os: add custom version option
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

T24gV2VkLCBKYW4gMDgsIDIwMjUgYXQgMTA6NTE6MzZQTSArMDEwMCwgSnVsaWVuIE9saXZhaW4g
d3JvdGU6Cj4gSGkgVmluY2VudCwgw4l0aWVubmUsCj4gCj4gT24gMjAvMTIvMjAyNCAxNjoxNSwg
VmluY2VudCBTdGVobMOpIHdyb3RlOgo+ID4gQWRkIGN1c3RvbSB2ZXJzaW9uIG9wdGlvbiwgdG8g
ZW5hYmxlIGVhc2lseSBzcGVjaWZ5aW5nIGFuIG9mZmljaWFsCj4gPiBPUC1URUUKPiA+IHZlcnNp
b24gdG8gdXNlLgo+ID4gVGhpcyBpcyBzaW1pbGFyIHRvIHdoYXQgaXMgZG9uZSBpbiBvdGhlciBw
YWNrYWdlcywgc3VjaCBhcyBsaW51eCwgdWJvb3QKPiA+IG9yCj4gPiBhcm0tdHJ1c3RlZC1maXJt
d2FyZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0
ZWhsZUBhcm0uY29tPgo+ID4gQ2M6IMOJdGllbm5lIENhcnJpw6hyZSA8ZXRpZW5uZS5jYXJyaWVy
ZUBmb3NzLnN0LmNvbT4KPiAKPiBJIGFwcGxpZWQgdGhpcyBwYXRjaCB0byBtYXN0ZXIsIHRoYW5r
cy4KCkhpIEp1bGllbiwKClRoYW5rcyBmb3IgaGFuZGxpbmcgdGhpcyBwYXRjaC4KCj4gRG8geW91
IHRoaW5rIHRoZSBzYW1lIGxvZ2ljIHNob3VsZCBhbHNvIGJlIGFkZGVkIHRvIHRoZSBvcHRlZS1j
bGllbnQsCj4gb3B0ZWUtZXhhbXBsZXMgYW5kIG9wdGVlLXRlc3QgcGFja2FnZXM/Cj4gCj4gSSBj
dXJyZW50bHkgYmVsaWV2ZSBzby4KCkdvb2QgaWRlYSEKCkkgdGhpbmsgd2UgY291bGQgZXZlbiBo
YXZlIGFuIGFkZGl0aW9uYWwgb3B0aW9uIGluIHRob3NlIHBhY2thZ2VzIHRvIHNwZWNpZnkKInNh
bWUgdmVyc2lvbiBhcyBvcHRlZS1vcyIsIHNpbWlsYXJseSB0byBCUjJfS0VSTkVMX0hFQURFUlNf
QVNfS0VSTkVMLgoKQmVzdCByZWdhcmRzLApWaW5jZW50LgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4g
Cj4gSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
