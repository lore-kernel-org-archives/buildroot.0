Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52852C64ED6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF829405B8;
	Thu, 23 Feb 2023 22:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF829405B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z42RriIglJF6; Thu, 23 Feb 2023 22:13:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EC1740579;
	Thu, 23 Feb 2023 22:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EC1740579
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78CBB1BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4564560A82
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4564560A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gbOUWXBRZS8c for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:13:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6339B60792
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6339B60792
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:13:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 732BD1BF209;
 Thu, 23 Feb 2023 22:13:42 +0000 (UTC)
Date: Thu, 23 Feb 2023 23:13:41 +0100
To: Martin =?UTF-8?B?QsO2aA==?= via buildroot <buildroot@buildroot.org>
Message-ID: <20230223231341.4dcc6d21@windsurf>
In-Reply-To: <20230223201733.222573-1-contact@martb.dev>
References: <20230223201733.222573-1-contact@martb.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677190422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtrET/GLCgxM9oNQjPly8kBdV3KZvKFThMTVIN354iM=;
 b=DeG/CetMONEyvqhQhhxIO4wrfc4sgBESNLLaVWiOIRWKUvr31smrMvBGfY5VV5JrG441OX
 iZTg96dE3bBWYfI8Ep+HDW/CjYxlz30LJesmcDewn22Gcd/iKt2wc/9r2403fblhxa4+0s
 rR9G/KQYiM6WTH8zwHBWup6lX5J6U5autffB4LicpJQ4+2Ud6cava+GpnjA1ntfrmmrG3P
 zdSYzOVoIKFDUJUG6nq2kK6vyWJpC2OipOyGHXA3AwBsRyC486rICMxs/hnb3pxuzSYBez
 II2lCXMReZ3NEGafPkPfyd5yfO6yaN2Wy0/e+5zBumFOhMWaO1ePn9AsIJE4+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DeG/CetM
Subject: Re: [Buildroot] [PATCH 1/1] package/gr-osmosdr: add missing
 host-python-six dependency to python support
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

SGVsbG8gTWFydGluLAoKT24gVGh1LCAyMyBGZWIgMjAyMyAyMToxNzozMyArMDEwMApNYXJ0aW4g
QsO2aCB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IE9z
bW9zZHIgZmFpbGVkIHRvIGJ1aWxkIGRvY3Mgd2hlbiBweXRob24gc3VwcG9ydCBpcyBlbmFibGVk
Lgo+IFsgNDElXSBDb3B5aW5nIG9zbW9zZHIgZG9jc3RyaW5nIHRlbXBsYXRlcyBhcyBweWJpbmQg
aGVhZGVycyAuLi4KPiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6Cj4gICBGaWxl
ICIvaG9tZS9tYXJ0Yi9TY2hyZWlidGlzY2gvRGlzY29TQVQvc2F0b3Mvb3V0cHV0L2J1aWxkL2dy
LW9zbW9zZHItMC4yLjQvZG9jcy9kb3h5Z2VuL3VwZGF0ZV9weWRvYy5weSIsIGxpbmUgMjIsIGlu
IDxtb2R1bGU+Cj4gICAgIGZyb20gZG94eXhtbCBpbXBvcnQgRG94eUluZGV4LCBEb3h5Q2xhc3Ms
IERveHlGcmllbmQsIERveHlGdW5jdGlvbiwgRG94eUZpbGUKPiAgIEZpbGUgIi9ob21lL21hcnRi
L1NjaHJlaWJ0aXNjaC9EaXNjb1NBVC9zYXRvcy9vdXRwdXQvYnVpbGQvZ3Itb3Ntb3Nkci0wLjIu
NC9kb2NzL2RveHlnZW4vZG94eXhtbC9fX2luaXRfXy5weSIsIGxpbmUgNjksIGluIDxtb2R1bGU+
Cj4gICAgIGZyb20gLmRveHlpbmRleCBpbXBvcnQgRG94eUluZGV4LCBEb3h5RnVuY3Rpb24sIERv
eHlQYXJhbSwgRG94eUNsYXNzLCBEb3h5RmlsZSwgRG94eU5hbWVzcGFjZSwgRG94eUdyb3VwLCBE
b3h5RnJpZW5kLCBEb3h5T3RoZXIKPiAgIEZpbGUgIi9ob21lL21hcnRiL1NjaHJlaWJ0aXNjaC9E
aXNjb1NBVC9zYXRvcy9vdXRwdXQvYnVpbGQvZ3Itb3Ntb3Nkci0wLjIuNC9kb2NzL2RveHlnZW4v
ZG94eXhtbC9kb3h5aW5kZXgucHkiLCBsaW5lIDMxLCBpbiA8bW9kdWxlPgo+ICAgICBmcm9tIC5n
ZW5lcmF0ZWQgaW1wb3J0IGluZGV4Cj4gICBGaWxlICIvaG9tZS9tYXJ0Yi9TY2hyZWlidGlzY2gv
RGlzY29TQVQvc2F0b3Mvb3V0cHV0L2J1aWxkL2dyLW9zbW9zZHItMC4yLjQvZG9jcy9kb3h5Z2Vu
L2RveHl4bWwvZ2VuZXJhdGVkL2luZGV4LnB5IiwgbGluZSAxMywgaW4gPG1vZHVsZT4KPiAgICAg
ZnJvbSAuIGltcG9ydCBjb21wb3VuZAo+ICAgRmlsZSAiL2hvbWUvbWFydGIvU2NocmVpYnRpc2No
L0Rpc2NvU0FUL3NhdG9zL291dHB1dC9idWlsZC9nci1vc21vc2RyLTAuMi40L2RvY3MvZG94eWdl
bi9kb3h5eG1sL2dlbmVyYXRlZC9jb21wb3VuZC5weSIsIGxpbmUgMTUsIGluIDxtb2R1bGU+Cj4g
ICAgIGZyb20gLiBpbXBvcnQgY29tcG91bmRzdXBlciBhcyBzdXBlcm1vZAo+ICAgRmlsZSAiL2hv
bWUvbWFydGIvU2NocmVpYnRpc2NoL0Rpc2NvU0FUL3NhdG9zL291dHB1dC9idWlsZC9nci1vc21v
c2RyLTAuMi40L2RvY3MvZG94eWdlbi9kb3h5eG1sL2dlbmVyYXRlZC9jb21wb3VuZHN1cGVyLnB5
IiwgbGluZSAxNSwgaW4gPG1vZHVsZT4KPiAgICAgaW1wb3J0IHNpeAo+IE1vZHVsZU5vdEZvdW5k
RXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAnc2l4Jwo+IG1ha2VbMl06ICoqKiBbcHl0aG9uL2JpbmRp
bmdzL0NNYWtlRmlsZXMvb3Ntb3Nkcl9kb2NzdHJpbmdzLmRpci9idWlsZC5tYWtlOjczOiBweXRo
b24vYmluZGluZ3MvZG9jc3RyaW5nX3N0YXR1c10gRmVobGVyIDEKPiBtYWtlWzFdOiAqKiogW0NN
YWtlRmlsZXMvTWFrZWZpbGUyOjMzMjogcHl0aG9uL2JpbmRpbmdzL0NNYWtlRmlsZXMvb3Ntb3Nk
cl9kb2NzdHJpbmdzLmRpci9hbGxdIEZlaGxlciAyCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFydGlu
IELDtmggPGNvbnRhY3RAbWFydGIuZGV2PgoKSXMgdGhlcmUgcG90ZW50aWFsbHkgYSB3YXkgdG8g
ZGlzYWJsZSBidWlsZGluZyBkb2N1bWVudGF0aW9uIGluc3RlYWQ/Ck9mIGNvdXJzZSwgYWRkaW5n
IGhvc3QtcHl0aG9uLXNpeCBpbiB0aGUgZGVwZW5kZW5jaWVzIGlzIG5vdCBhIGh1Z2UKZGVhbCwg
YnV0IHdlIHJlYWxseSBkb24ndCBjYXJlIGFib3V0IGJ1aWxkaW5nIGRvY3VtZW50YXRpb24gaW4g
dGhlCmNvbnRleHQgb2YgQnVpbGRyb290LgoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
