Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743B1C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 009466129F;
	Wed, 22 Feb 2023 22:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 009466129F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjQG9vb3H4lm; Wed, 22 Feb 2023 22:22:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F58C616C3;
	Wed, 22 Feb 2023 22:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F58C616C3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5AA1BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39A52419D0
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39A52419D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvFc-XTJ7pKz for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:22:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D080A419C9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D080A419C9
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:22:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0AC571BF203;
 Wed, 22 Feb 2023 22:22:35 +0000 (UTC)
Date: Wed, 22 Feb 2023 23:22:35 +0100
To: =?UTF-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>
Message-ID: <20230222232235.076e7017@windsurf>
In-Reply-To: <20230201192157.1631613-1-nerv@dawncrow.de>
References: <20230201192157.1631613-1-nerv@dawncrow.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677104556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qOpkpICXcFop7fhP66uAVZe2rjGfq8H67FRcaANAIQ=;
 b=YnHCKPK2nVB8xlJ1qZlae/syfudSjA8galOICZ+eFsaIEn0PAgahO4pQ90P9FdfYkOG2TX
 9B4LB/yj+KlwY54RqWp/3/VTNRWtkAc2MkH1+C5e3lc2KLFdi4dnreqia53XHo2HMwYqMq
 LnOlqlMhe+cMHrTzqfhsYhQWPCSTHRowF0ruQBqiSLQsJe+0ODKqVptYsPTtB2FnmBNKd5
 ZBC/WNZbibveHUjrCUyTe4CKT4VECqxzir47XLGnHarZ3jFE9IpTd5mAHhmZzUo2ALiXFF
 1UprRFs1+Lum6JRHEag6+f9MxqGJuYX2DTVjUf7RKxEtSqO4JBRAZxRdv//I3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YnHCKPK2
Subject: Re: [Buildroot] [PATCH] package/wine: bump to version 8.0
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

T24gV2VkLCAgMSBGZWIgMjAyMyAyMDoyMTo1NyArMDEwMApBbmRyw6kgWndpbmcgPG5lcnZAZGF3
bmNyb3cuZGU+IHdyb3RlOgoKPiBNdWx0aXBsZSBsaWJyYXJ5IGNoZWNrcyBhcmUgb2Jzb2xldGUs
IGVpdGhlciBkdWUgdG8gcmVtb3ZhbCBvciBkdWUgdG8gYnVpbHQtaW4gc29sdXRpb25zLgo+IAo+
IExpY2Vuc2UgZmlsZSBjaGFuZ2VkIGR1ZSB0byB1cGRhdGUgb2YgY29weXJpZ2h0IHllYXIuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgo+IC0tLQo+
ICAuLi5hLWF2b2lkLW1wZzEyMy1mdW5jdGlvbnMtd2l0aC1zdWZmaXgucGF0Y2ggfCAyMSAtLS0t
LS0tLS0tLQo+ICAuLi5kLWF2b2lkLW1wZzEyMy1mdW5jdGlvbnMtd2l0aC1zdWZmaXgucGF0Y2gg
fCAyMSAtLS0tLS0tLS0tLQo+ICBwYWNrYWdlL3dpbmUvd2luZS5oYXNoICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNCArLS0KPiAgcGFja2FnZS93aW5lL3dpbmUubWsgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMzUgKystLS0tLS0tLS0tLS0tLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNzYgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3dpbmUvMDAwMS1sM2NvZGVjYS1hdm9pZC1tcGcxMjMtZnVuY3Rpb25zLXdpdGgtc3VmZml4
LnBhdGNoCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3dpbmUvMDAwMi1tcDNkbW9kLWF2
b2lkLW1wZzEyMy1mdW5jdGlvbnMtd2l0aC1zdWZmaXgucGF0Y2gKCkFwcGxpZWQgdG8gbmV4dCwg
dGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
