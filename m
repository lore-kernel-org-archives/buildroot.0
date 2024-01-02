Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4FDC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11F87409E3;
	Tue,  2 Jan 2024 21:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11F87409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkS7EffRsfoO; Tue,  2 Jan 2024 21:14:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DBAE40A5D;
	Tue,  2 Jan 2024 21:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DBAE40A5D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 250241BF311
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1A80818CD
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1A80818CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QUC7qGemPkpV for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:14:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4413D818C4
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4413D818C4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F91E20003;
 Tue,  2 Jan 2024 21:14:20 +0000 (UTC)
Date: Tue, 2 Jan 2024 22:14:19 +0100
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <20240102221419.2333bca4@windsurf>
In-Reply-To: <20240102104258.1375-1-zajec5@gmail.com>
References: <20240102104258.1375-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704230060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hEsUvlnNHYQIaKNcc3bs2W6agZu31cj+OJt0uTDvNZ4=;
 b=lSBQwj4kyc8vWcrdb0OkgkfqOMuVJeEZ6L4Lf47rtwWxY4ph6PJs5I1KBMcgiSuJCFqjse
 UsTy3PtQf9EUoR/1DDShC2zClb2WcAdUNYE5hxsH9EW3EkNW+5ui+iNVKi/wJxm48V7bz2
 D8UiNBs/GQitKTrrBs+2hcZ/0qaa1XpWQPNmgzXjuQvs5Eerjdw4cA+sDQ2bW7BTZaOGd5
 igewhP17h+RGCn857NStA7OCHf1TqO0TWt4bvN34U+rSTs2frCK/03zt7lAErU6CrK+qQW
 4nkZtllyd5A3eANMXWUjesH6ynJDQNg+hBbIBIM5Ql6Dtxf2ziVGRtTJggqEjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lSBQwj4k
Subject: Re: [Buildroot] [PATCH] configs/broadcom_northstar_defconfig:
 adjust DTS paths
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
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFmYcWCLAoKT24gVHVlLCAgMiBKYW4gMjAyNCAxMTo0Mjo1OCArMDEwMApSYWZhxYIg
TWnFgmVja2kgPHphamVjNUBnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVj
a2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gU3RhcnRpbmcgd2l0aCBrZXJuZWwgcmVsZWFzZSB2
Ni41IEFSTSBEVFMgZmlsZXMgYXJlIHBsYWNlZCBpbiB2ZW5kb3IKPiBzdWJkaXJlY3RvcmllcyAo
TGludXggY29tbWl0IDcyNGJhNjc1MTUzMiAoIkFSTTogZHRzOiBNb3ZlIC5kdHMgZmlsZXMgdG8K
PiB2ZW5kb3Igc3ViLWRpcmVjdG9yaWVzIikpLgo+IAo+IFRoaXMgZml4ZXM6Cj4gbWFrZVszXTog
KioqIE5vIHJ1bGUgdG8gbWFrZSB0YXJnZXQgJ2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTQ3MDgtc21h
cnRyZy1zcjQwMGFjLmR0YicuICBTdG9wLgo+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6MTM4NDog
YmNtNDcwOC1zbWFydHJnLXNyNDAwYWMuZHRiXSBFcnJvciAyCj4gbWFrZVszXTogKioqIE5vIHJ1
bGUgdG8gbWFrZSB0YXJnZXQgJ2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTQ3MDk0LWx1eHVsLXh3ci0z
MTUwLXYxLmR0YicuICBTdG9wLgo+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6MTM4NDogYmNtNDcw
OTQtbHV4dWwteHdyLTMxNTAtdjEuZHRiXSBFcnJvciAyCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFm
YcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhhbmtzIGZvciB0aGUgcGF0Y2ghIEkg
d2FzIHdvbmRlcmluZyB3aGVuIGl0IGdvdCBicm9rZW4sIGFuZCB0aGlzIG1hZGUKYmUgcmVhbGl6
ZSB0aGF0IHRoaXMgZGVmY29uZmlnIGRvZXNuJ3QgZm9sbG93IGEgYmVzdCBwcmFjdGljZSB0aGF0
IHdlCm5vcm1hbGx5IGFwcGx5IHRvIGFsbCBvdXIgZGVmY29uZmlnczogdGhlIGtlcm5lbCB2ZXJz
aW9uIGJlaW5nIGJ1aWx0CnNob3VsZCBub3QgYmUgYSBtb3ZpbmcgdGFyZ2V0LCBidXQgYmUgZml4
ZWQgaW4gdGhlIGRlZmNvbmZpZy4KClNvLCBJJ3ZlIGFwcGxpZWQgeW91ciBwYXRjaCwgYnV0IGNv
dWxkIHlvdSBzdWJtaXQgYSBmb2xsb3ctdXAgcGF0Y2gKdGhhdCBzZXRzIGEgZml4ZWQga2VybmVs
IHZlcnNpb24sIGp1c3QgbGlrZSB3ZSBkbyBpbiBhbGwgZGVmY29uZmlncz8gSXQKYWxzbyBtZWFu
cyB0aGUga2VybmVsIGhlYWRlcnMgdmVyc2lvbiBvZiB0aGUgdG9vbGNoYWluIHNob3VsZCBiZSBm
aXhlZAooYWdhaW4sIEkgZW5jb3VyYWdlIHlvdSB0byBsb29rIGF0IHRoZSBudW1lcm91cyBvdGhl
ciBkZWZjb25maWdzIHdlCmhhdmUgZm9yIGV4YW1wbGVzIG9mIHRoaXMpLgoKVGhhbmtzIGEgbG90
IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGlu
CkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBz
Oi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
