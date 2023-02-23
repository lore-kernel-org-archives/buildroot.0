Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0E9C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9CEA403A4;
	Thu, 23 Feb 2023 22:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9CEA403A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AM9tSkqPPHaM; Thu, 23 Feb 2023 22:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0B21405A0;
	Thu, 23 Feb 2023 22:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0B21405A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C24EE1BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B70981437
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B70981437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jnq-TcCmYP4V for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:33:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70E9A81426
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70E9A81426
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:33:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F18D20002;
 Thu, 23 Feb 2023 22:33:32 +0000 (UTC)
Date: Thu, 23 Feb 2023 23:33:31 +0100
To: Martin =?UTF-8?B?QsO2aA==?= via buildroot <buildroot@buildroot.org>
Message-ID: <20230223233331.75b619b1@windsurf>
In-Reply-To: <20230223201817.224238-1-contact@martb.dev>
References: <20230223201817.224238-1-contact@martb.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677191612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3EtNSR+xfFG0TpCzhtm1JJQrgV433zj/Do5gmlf0Kw=;
 b=kI+3SUmiEHJ/n0+d5lhrsqtaURf5qRdOO7bG1Ekb3bAiILpQbfDp7oT9l2MKH+foNmgiP7
 i+GjT4I+/kW4APCCTByZz4ISJeP9mpuRODtUoFshbU9qMzP7v6FNIpp5OWpF1+iwcMXP+9
 vEjBnreoHIbXjGr2ZIkWkM2NlAbuWCF4yDgwQOgajhU6BDQ+2ZeAcTbnzmTcYdPes4CuQV
 g5KHTi/7yXBXYRcwf5pbPngWqsPpYgKj01PkuqBAIcJvXUdYcciRzBOjLpz7z3QT3lCpRa
 TkqqJla0pmpN5c2UMTs2Ir7ILFbnMA8sQCfGI/wMju9hILKVnH5bZJsJ7SnfzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kI+3SUmi
Subject: Re: [Buildroot] [PATCH 1/1] package/gr-osmosdr: add support for
 HACKRF receivers
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Martin =?UTF-8?B?QsO2aA==?= <contact@martb.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWFydGluLAoKT24gVGh1LCAyMyBGZWIgMjAyMyAyMToxODoxNyArMDEwMApNYXJ0aW4g
QsO2aCB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+ICtj
b25maWcgQlIyX1BBQ0tBR0VfR1JfT1NNT1NEUl9IQUNLUkYKPiArCWJvb2wgIk9zbW9jb20gSEFD
S1JGIHN1cHBvcnQiCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBQ0tSRgoKV2Ugd291bGQg
bm9ybWFsbHkgdXNlIGEgc2VsZWN0IEJSMl9QQUNLQUdFX0hBQ0tSRiBoZXJlLCB3aGljaCBtZWFu
cyB5b3UKaGF2ZSB0byByZXBsaWNhdGUgdGhlIGRlcGVuZHMgb24gZnJvbSBoYWNrcmY6CgogICAg
ICAgIGRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIGhhY2tyZgogICAgICAgIGRlcGVuZHMg
b24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIGhhY2tyZgogICAgICAgIGRlcGVuZHMgb24g
QlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85ICMgaGFja3JmCgphbmQgdGhlIGNvcnJlc3Bv
bmRpbmcgQ29uZmlnLmluIGNvbW1lbnQ6Cgpjb21tZW50ICJoYWNrcmYgc3VwcG9ydCBuZWVkcyBh
IHRvb2xjaGFpbiB3LyB0aHJlYWRzLCBkeW5hbWljIGxpYnJhcnksIGdjYyA+PSA0LjkiCiAgICAg
ICAgZGVwZW5kcyBvbiBCUjJfU1RBVElDX0xJQlMgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVB
RFMgfHwgXAogICAgICAgICAgICAgICAgIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOQoK
QmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQg
Q0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRy
YWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
