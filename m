Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E3CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 22:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDDCA60B69;
	Tue, 28 Dec 2021 22:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eHajyRCQj73Q; Tue, 28 Dec 2021 22:05:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 525AF60B5B;
	Tue, 28 Dec 2021 22:05:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19B581BF3D4
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 063FD813D5
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 22:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N9MqbEa9HRmJ for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 22:05:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1036F813B2
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 22:05:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3C92B1C0003;
 Tue, 28 Dec 2021 22:05:14 +0000 (UTC)
Date: Tue, 28 Dec 2021 23:05:13 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211228230513.5ebc14e9@windsurf>
In-Reply-To: <20211014160824.2154396-1-fontaine.fabrice@gmail.com>
References: <20211014160824.2154396-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libdbi: needs dynamic library
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
Cc: =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxNCBPY3QgMjAyMSAxODowODoyNCArMDIwMApGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IGxpYmRiaSBuZWVkcyBkeW5hbWljIGxp
YnJhcnkgdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHJhaXNlZAo+IHNpbmNl
IHRoZSBhZGRpdGlvbiBvZiB0aGUgcGFja2FnZSBpbiBjb21taXQKPiBjNmFhYzZlYmRiYmQzODcz
MTEwYTllMTlkZTE5NTdlNDljYjkzNDRlOgo+IAo+IGRiaV9tYWluLmM6ODQ6MjogZXJyb3I6ICNl
cnJvciBubyBkeW5hbWljIGxvYWRpbmcgc3VwcG9ydAo+ICAgIDg0IHwgI2Vycm9yIG5vIGR5bmFt
aWMgbG9hZGluZyBzdXBwb3J0Cj4gICAgICAgfCAgXn5+fn4KPiAKPiBGaXhlczoKPiAgLSBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy85Y2Q1NmE2MjVjYmQ1MmIwYzA3MGUy
ZDQ2MmUwMmY1MTYxZDk2MzFkCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8
Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvbGliZGJpLWRyaXZl
cnMvQ29uZmlnLmluIHwgNCArKysrCj4gIHBhY2thZ2UvbGliZGJpL0NvbmZpZy5pbiAgICAgICAg
IHwgNCArKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpBcHBsaWVkIHRv
IG1hc3RlciwgYnV0IGFmdGVyIGFkZGluZyB0aGUgIUJSMl9TVEFUSUNfTElCUyBkZXBlbmRlbmN5
IHRvCmNvbGxlY3RkLCBhcyBzdWdnZXN0ZWQgYnkgSGVydsOpLiBJbmRlZWQsIHdlIHByZWZlciB0
byBkdXBsaWNhdGUgdGhvc2UKZGVwZW5kZW5jaWVzLCBpZiB0aGV5IHR1cm4gb3V0IHRvIGNoYW5n
ZSBhdCB0aGUgdG9wLWxldmVsCkJSMl9QQUNLQUdFX0NPTExFQ1REIG9wdGlvbi4KCkJlc3QgcmVn
YXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
