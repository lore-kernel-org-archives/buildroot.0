Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2999C76196
	for <buildroot@archiver.kernel.org>; Fri, 24 Mar 2023 10:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EBC9841AE;
	Fri, 24 Mar 2023 10:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EBC9841AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEPNwlvEERnl; Fri, 24 Mar 2023 10:09:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D32841AC;
	Fri, 24 Mar 2023 10:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89D32841AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DCAA1BF314
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 10:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D32160E63
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 10:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D32160E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FFs2BLbCoGU for <buildroot@lists.busybox.net>;
 Fri, 24 Mar 2023 10:09:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E123A60706
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E123A60706
 for <buildroot@buildroot.org>; Fri, 24 Mar 2023 10:09:49 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D7051E0010;
 Fri, 24 Mar 2023 10:09:47 +0000 (UTC)
Date: Fri, 24 Mar 2023 11:09:46 +0100
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20230324110946.5c275439@bootlin.com>
In-Reply-To: <20230324093307.1255640-1-luca.ceresoli@bootlin.com>
References: <20230324093307.1255640-1-luca.ceresoli@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679652588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8y9g1RyUgDw9h9xeVJjbcyaYhHp13339KEFYPQNA9c=;
 b=CfmN5azPAJVAtef+GruVPFGKNMoWxUNXXGvankMvyHR0ltxq3t2KrnYhWzbZrnq6+/5SVW
 zTNrqjy9pBXfQJnaKTW38lBBV8J5GmSVkK0rOeza5hD/7HGNasDDoIlMWnCy/thv9pgqoN
 xdxQzTMpdCxltrwyULwhPSalkry9/zuhgZy5GZ8zjrMmw5eUIRAawZ0acA9eQwnM8hQYW+
 3/s4l2S6ircpiDCsv5hb49Vz1GAmkHo8xsyBappakT/TP/Hptqm2sdrVDrs06m/fQrtIzg
 K5rARklmU4f4p2ZC3Sdiyq6VS3Eqk4BdHLqf0Vj8ZTEn2q+o9RF/AQDKsFQ2Ow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CfmN5azP
Subject: Re: [Buildroot] [PATCH] package/linux-tools: add USB tools (testusb
 and ffs-test)
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwKCk9uIEZyaSwgMjQgTWFyIDIwMjMgMTA6MzM6MDcgKzAxMDAKTHVjYSBDZXJlc29s
aSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4gd3JvdGU6Cgo+IEV4dGVuZCB0aGUgbGludXgt
dG9vbHMgcGFja2FnZSB0byBhbHNvIGJ1aWxkIHRoZSB1c2Vyc3BhY2UgVVNCIHRvb2xzLCB3aGlj
aAo+IGN1cnJlbnRseSBpbmNsdWRlIHRlc3R1c2IgYW5kIGZmcy10ZXN0Lgo+IAo+IFRoZXNlIHRv
b2xzIGFyZSBpbiB0aGUga2VybmVsIHRyZWUgc2luY2UgYSBsb25nIHRpbWUsIGJ1dCBhIE1ha2Vm
aWxlIHdhcwo+IGFkZGVkIG9ubHkgaW4gNS45IHRvIGFsbG93IGJ1aWxkaW5nIGluIHRoZSBzYW1l
IHdheSBhcyBvdGhlciB0b29scyBwcm92aWRlZAo+IHdpdGggdGhlIGtlcm5lbC4gSGVyZSB3ZSB1
c2UgdGhlIE1ha2VmaWxlIGFuZCB0aHVzIHZlcnNpb24gPj0gNS45IGlzCj4gcmVxdWlyZWQuIFN1
cHBvcnQgZm9yIG9sZGVyIGtlcm5lbHMgbWF5IGJlIGFkZGVkIGxhdGVyIGlmIG5lZWRlZC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29t
PgpbLi4uXQo+ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9UT09MU19VU0JUT09MU19U
RVNUVVNCKSwpCj4gK2RlZmluZSBVU0JUT09MU19JTlNUQUxMX1JFTU9WRV9URVNUVVNCCj4gKwkk
KFJNKSAtcmYgJChUQVJHRVRfRElSKS91c3IvYmluL3Rlc3R1c2IKCldoeSAtciA/Cgo+ICtlbmRl
Zgo+ICtlbmRpZgo+ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9UT09MU19VU0JUT09M
U19GRlNURVNUKSwpCj4gK2RlZmluZSBVU0JUT09MU19JTlNUQUxMX1JFTU9WRV9GRlNURVNUCj4g
KwkkKFJNKSAtcmYgJChUQVJHRVRfRElSKS91c3IvYmluL2Zmcy10ZXN0CgpTYW1lIGhlcmUKCj4g
K2VuZGVmCj4gK2VuZGlmCj4gKwoKT3RoZXJ3aXNlLCBsb29rcyBnb29kIGZvciBtZS4KClRoYW5r
cyBmb3IgdGhpcyBwYXRjaCwKSGVydsOpCgotLSAKSGVydsOpIENvZGluYSwgQm9vdGxpbgpFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
