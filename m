Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC60FC001DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 20:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6315341EF0;
	Fri,  4 Aug 2023 20:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6315341EF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BG0qZpYxOniG; Fri,  4 Aug 2023 20:19:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC9E41F09;
	Fri,  4 Aug 2023 20:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CC9E41F09
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4297A1BF328
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 20:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64549606F5
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 20:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64549606F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HfL4V-uh1O4n for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 20:19:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4284160FA2
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 20:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4284160FA2
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE908FF803;
 Fri,  4 Aug 2023 20:19:14 +0000 (UTC)
Date: Fri, 4 Aug 2023 22:19:13 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230804221913.39bd846d@windsurf>
In-Reply-To: <20230803213814.1282751-1-romain.naour@gmail.com>
References: <20230803213814.1282751-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691180356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCSiH330IRiP7cT0CSENGhc5ScNfZcT0e4BE0c2rn2U=;
 b=hxd10YUuIvphKC8PFgizDSdE9gQmlEii6f3qqH5JI56PxTCYTJvLfaKUYz1VrL6he1VtLb
 TgWwZkKA3DhuC9jLFQVsU8HTnIS+1OELFSY8FCxsztENX/v8iTl9rChfgHEGCRnA17dLO8
 zfT2sh3Axnppn3fLt5RtxEKBu2XcEEwF+mwvEQRArJlZvlwiIKPAv2yeGTTDermoLyeURT
 KUZR2H0j0icZnqhyQuyY+EMF8FkRQ23KoW+ci3l+Nozjxbm8auen9iLp79HWryAsVmv65s
 rmLM1GLIrj49YSbaWo1tngp1rMcotLZCJOvKaavG8mJ/+B8Tbuf1XMMeLpy2kQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hxd10YUu
Subject: Re: [Buildroot] [PATCH] configs/qemu_ppc64*: remove binutils
 version from defconfigs
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
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAgMyBBdWcgMjAyMyAyMzozODoxNCArMDIwMApSb21haW4gTmFvdXIgPHJvbWFpbi5u
YW91ckBnbWFpbC5jb20+IHdyb3RlOgoKPiBCdWlsZHJvb3QgMjAyMi4wNSB1c2UgYmludXRpbHMg
Mi4zNyBieSBkZWZhdWx0LCBidXQgdGhlIGJpbnV0aWxzCj4gdmVyc2lvbiB3YXMgZG93bmdyYWRl
ZCB0byB0aGUgcHJldmlvdXMgYmludXRpbHMgdmVyc2lvbiBpbiBxZW11X3BwYzY0Kgo+IGRlZmNv
bmZpZ3MgZHVlIHRvIGEgYnVnIGluIGJpbnV0aWxzIDIuMzcgWzFdLgo+IAo+IExhdGVyIHdoZW4g
YmludXRpbHMgMi4zNiBoYXMgYmVlbiByZW1vdmVkIHRoZSBiaW51dGlscyB2ZXJzaW9uIGhhcwo+
IGJlZW4gdXBkYXRlZCB0byAyLjM4IChldmVuIHRob3VnaCBpdCB3YXMgYWxyZWFkeSB0aGUgZGVm
YXVsdCB2ZXJzaW9uCj4gc2VsZWN0ZWQgYnkgQnVpbGRyb290IGF0IHRoYXQgdGltZSkgWzJdLgo+
IAo+IFNpbmNlIHRoZW4sIHNldmVyYWwgYmludXRpbHMgcmVsZWFzZSBoYXMgYmVlbiBhZGRlZCBh
bmQgdGhlIGJpbnV0aWxzCj4gdmVyc2lvbiAyLjM4IGhhcyBiZWVuIHJlbW92ZWQgcmVjZW50bHkg
WzNdLgo+IAo+IFNpbmNlIHRoZSBpbml0aWFsIGJ1ZyBpcyBnb25lIHdpdGggdGhlIHJlbW92YWwg
b2YgYmludXRpbHMgMi4zNywKPiB3ZSBjYW4gc2FmZWx5IHJlbW92ZSB0aGUgYmludXRpbHMgdmVy
c2lvbiBmcm9tIHFlbXVfcHBjNjQgZGVmY29uZmlncy4KPiAKPiBbMV0gMWUyZmU4NjBmM2EyNjFm
Yzg3NzU5MWMwNTY4MDhkNmZiMzBlMjVkNAo+IFsyXSBlNDYxYzlhZGM4MmE4ODlkZWI2ZTI1OWNl
ODExMTkzY2I4ZDAwZjM2Cj4gWzNdIDEzOTFjOTlkNjI3ZDI3YzU1YmVjOTkwNzJiM2FlNGQ3OGJl
MDJjNzQKPiAKPiBGaXhlczoKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy90b29s
Y2hhaW5zLWJ1aWxkZXIvLS9qb2JzLzQ3OTgwNDczNzMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb21h
aW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gQ2M6IEPDqWRyaWMgTGUgR29hdGVy
IDxjbGdAa2FvZC5vcmc+Cj4gQ2M6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Cj4gLS0t
Cj4gIGNvbmZpZ3MvcWVtdV9wcGM2NF9lNTUwMF9kZWZjb25maWcgICAgICB8IDEgLQo+ICBjb25m
aWdzL3FlbXVfcHBjNjRfcHNlcmllc19kZWZjb25maWcgICAgfCAxIC0KPiAgY29uZmlncy9xZW11
X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnIHwgMSAtCj4gIGNvbmZpZ3MvcWVtdV9wcGM2NGxl
X3BzZXJpZXNfZGVmY29uZmlnICB8IDEgLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDQgZGVsZXRpb25z
KC0pCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6
b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpo
dHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
