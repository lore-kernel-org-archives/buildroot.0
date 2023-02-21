Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095D7C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6F8D82813;
	Tue, 21 Feb 2023 08:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6F8D82813
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7jQQlj_mhB4; Tue, 21 Feb 2023 08:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D220082862;
	Tue, 21 Feb 2023 08:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D220082862
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C35581BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90BCE40A59
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90BCE40A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mrScpRPgrNSb for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:37:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E30940A04
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E30940A04
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:37:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E905E1C000A;
 Tue, 21 Feb 2023 08:37:56 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:37:56 +0100
To: Alexander Egorenkov <egorenar-dev@posteo.net>
Message-ID: <20230221093756.06a8f7c5@windsurf>
In-Reply-To: <20230218092943.2598-1-egorenar-dev@posteo.net>
References: <20230218092943.2598-1-egorenar-dev@posteo.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676968677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RFV2p0T/kTVb/pfrlM3Fdq9jg4EC2Ci4jfsSwlgFu4s=;
 b=XQD642NDPsJNcdlYbzK3dgER7uz+orRDTU0iVPRS0a6hfagBFGByZhXGh3Lv+Www7nLF+N
 tJW/qjd6N0c/wX896dG21Mn/yLNU4QzYvPxTKW3d5WF990o497WvtT4Cn3cZGmm3FplEj9
 DYVmZkIzcqw4X4KmCLReWmscLPbdbaWLspQJ5qTYtODEzUu1xzLUwG4MCzcjXBhQ1HgH0z
 2txT+2EfVSEzEwdHltqPTfNeIytA3X1vAvxdiWhdBfV+6SJMKqi4i3uPUZXWXyhIQ8VxiQ
 GEWbNIMWJF0lrymOdWSYX16GWMHEpv70chrrxPz2RQGcezl+MwXmYnzgPR1gfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XQD642ND
Subject: Re: [Buildroot] [PATCH 1/1] package/multipath-tools: fix path to
 kernel headers
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAxOCBGZWIgMjAyMyAwOToyOTo0MyArMDAwMApBbGV4YW5kZXIgRWdvcmVua292IDxl
Z29yZW5hci1kZXZAcG9zdGVvLm5ldD4gd3JvdGU6Cgo+IFdpdGggY2hhbmdlIDZiN2Q0N2JlM2Iy
MyAoIm11bHRpcGF0aC10b29sczogTWFrZWZpbGVzOiBzaW1wbGlmeSBjb2RlIGZvcgo+IGluY2x1
ZGUgZGlycyIpIHRoZSBNYWtlZmlsZSB2YXJpYWJsZSAnTElOVVhfSEVBREVSU19JTkNESVInIGhh
cyBiZWVuIHJlcGxhY2VkCj4gd2l0aCAna2VybmVsX2luY2RpcicuCj4gCj4gZnBpbl9oYW5kbGVy
cy5jOjM1NTozMjogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQg
b25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4KPiBmcGluX2hhbmRsZXJz
LmM6MzYwOjM3OiBlcnJvcjog4oCYRUxTX0RUQUdfTE5LX0lOVEVHUklUWeKAmSB1bmRlY2xhcmVk
IChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKPiAgIDM2MCB8ICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChkdGFnID09IEVMU19EVEFHX0xOS19JTlRFR1JJVFkpIHsKPiAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
PiBtYWtlWzJdOiAqKiogWy4uL01ha2VmaWxlLmluYzoxMTY6IGZwaW5faGFuZGxlcnMub10gRXJy
b3IgMQo+IAo+IEZpeGVzOiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9l
MGY1NmVmOTI0YzEzZDZiMTUzNWZkYzM1MGFkOGVjYzA2ZWEwYTU4Cj4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIEVnb3JlbmtvdiA8ZWdvcmVuYXItZGV2QHBvc3Rlby5uZXQ+Cj4gLS0tCj4gIHBh
Y2thZ2UvbXVsdGlwYXRoLXRvb2xzL211bHRpcGF0aC10b29scy5tayB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBsaWVkIHRvIG1hc3Rl
ciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
