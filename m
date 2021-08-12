Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F8AC4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:18:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46BDF6108C
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46BDF6108C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6C404078B;
	Thu, 12 Aug 2021 21:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6OoJxXSJkWzV; Thu, 12 Aug 2021 21:18:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D5A04078C;
	Thu, 12 Aug 2021 21:18:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE25D1BF36A
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC8BB4023D
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFKgzcuOXqiG for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:18:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A92CA40233
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:18:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 014A6FF807;
 Thu, 12 Aug 2021 21:18:40 +0000 (UTC)
Date: Thu, 12 Aug 2021 23:18:39 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210812231839.1043a66b@windsurf>
In-Reply-To: <20210810162447.425862-1-fontaine.fabrice@gmail.com>
References: <20210810162447.425862-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xenomai: fix build on arc and
 riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gRmFicmljZSwKCk9uIFR1ZSwgMTAgQXVnIDIwMjEgMTg6MjQ6NDcgKzAyMDAKRmFicmlj
ZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgoKPiBGaXggdGhl
IGZvbGxvd2luZyBidWlsZCBmYWlsdXJlcyBvbiBhcmMgYW5kIHJpc2N2MzI6Cj4gCj4gbGF0ZW5j
eS5jOiBJbiBmdW5jdGlvbiAnZGlzcGxheSc6Cj4gbGF0ZW5jeS5jOjMyNjoyMTogZXJyb3I6IGZv
cm1hdCAnJWxkJyBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUgJ2xvbmcgaW50JywgYnV0IGFyZ3Vt
ZW50IDIgaGFzIHR5cGUgJ3RpbWVfdCcge2FrYSAnbG9uZyBsb25nIGludCd9IFstV2Vycm9yPWZv
cm1hdD1dCj4gICAzMjYgfCAgICAgICAgICgiUlRUfCAgJS4ybGQ6JS4ybGQ6JS4ybGQgICglcywg
JUxkIHVzIHBlcmlvZCwgIgo+ICAgICAgIHwgICAgICAgICAgICAgICAgIH5+fn5eCj4gICAgICAg
fCAgICAgICAgICAgICAgICAgICAgIHwKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgbG9u
ZyBpbnQKPiAgICAgICB8ICAgICAgICAgICAgICAgICAlLjJsbGQKPiAgIDMyNyB8ICAgICAgICAg
ICJwcmlvcml0eSAlZClcbiIsIGR0IC8gMzYwMCwKPiAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIH5+fn5+fn5+fgo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfAo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGltZV90IHtha2Eg
bG9uZyBsb25nIGludH0KPiAKPiBhbHRlbmN5LmM6IEluIGZ1bmN0aW9uIOKAmGRpc3BsYXnigJk6
Cj4gYWx0ZW5jeS5jOjI2MjoyMTogZXJyb3I6IGZvcm1hdCDigJglbGTigJkgZXhwZWN0cyBhcmd1
bWVudCBvZiB0eXBlIOKAmGxvbmcgaW504oCZLCBidXQgYXJndW1lbnQgMiBoYXMgdHlwZSDigJh0
aW1lX3TigJkge2FrYSDigJhsb25nIGxvbmcgaW504oCZfSBbLVdlcnJvcj1mb3JtYXQ9XQo+ICAg
MjYyIHwgICAgICAgICAoIlJUVHwgICUuMmxkOiUuMmxkOiUuMmxkICAoJXMsICVMZCB1cyBwZXJp
b2QsICIKPiAgICAgICB8ICAgICAgICAgICAgICAgICB+fn5+Xgo+ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICB8Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgIGxvbmcgaW50Cj4gICAg
ICAgfCAgICAgICAgICAgICAgICAgJS4ybGxkCj4gICAyNjMgfCAgICAgICAgICAicHJpb3JpdHkg
JWQpXG4iLCBkdCAvIDM2MDAsCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB+
fn5+fn5+fn4KPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRpbWVfdCB7YWthIGxvbmcgbG9uZyBp
bnR9Cj4gCj4gRml4ZXM6Cj4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3Vs
dHMvNDQ4ZWZlMjJlOGZlMDU4YTFiMzU0YTNjMTI0ODc0ZTMwYjljZTEzOAo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+IC0t
LQo+ICAuLi4yLUFkZC1kaXNhYmxlLWRlbW8tdGVzdHN1aXRlLW9wdGlvbnMucGF0Y2ggfCA5NCAr
KysrKysrKysrKysrKysrKysrCj4gIHBhY2thZ2UveGVub21haS94ZW5vbWFpLm1rICAgICAgICAg
ICAgICAgICAgICB8ICA3ICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTAwIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UveGVub21haS8zLjAu
MTAvMDAwMi1BZGQtZGlzYWJsZS1kZW1vLXRlc3RzdWl0ZS1vcHRpb25zLnBhdGNoCgpJIGhhdmUg
YXBwbGllZCBidXQsIGNvdWxkIHlvdSAoMSkgc3VibWl0IHRoaXMgcGF0Y2ggdXBzdHJlYW0gYW5k
ICgyKQpyZXBvcnQgdGhlIGlzc3VlIHVwc3RyZWFtIHNvIHRoYXQgdGhleSBmaXggaXQ/CgpUaGFu
a3MgYSBsb3QsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
