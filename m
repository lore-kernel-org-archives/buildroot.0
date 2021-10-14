Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80485C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 17:17:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1D9061040
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 17:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1D9061040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 485FD608A2;
	Thu, 14 Oct 2021 17:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phF9G8JyxBgX; Thu, 14 Oct 2021 17:17:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8305607E3;
	Thu, 14 Oct 2021 17:17:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14BD01BF5A1
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 17:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04880405E2
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 17:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dsFEkfvrR7kd for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 17:17:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F356E40520
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 17:17:12 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E2A6E1C0009;
 Thu, 14 Oct 2021 17:17:10 +0000 (UTC)
Date: Thu, 14 Oct 2021 19:17:09 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211014191709.4c7aa1a9@bootlin.com>
In-Reply-To: <CAPi7W81+X=pB2npGSxx6QnAtaUvCT6-mC1ff2P9DsNpW-CROqQ@mail.gmail.com>
References: <20211014160824.2154396-1-fontaine.fabrice@gmail.com>
 <20211014184100.615d5d90@bootlin.com>
 <CAPi7W81+X=pB2npGSxx6QnAtaUvCT6-mC1ff2P9DsNpW-CROqQ@mail.gmail.com>
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxNCBPY3QgMjAyMSAxODo1MTo1NSArMDIwMApGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cgo+ID4gQWxzbyBpbiBjb2xsZWN0ZCBDb25m
aWcuaW4sICJkZXBlbmRzIG9uIiBuZWVkcyB0byBiZSBhZGRlZAo+ID4gYW5kIGl0cyByZWxhdGVk
IGNvbW1lbnQuICAKPiBOb3BlLCBjb2xsZWN0ZCBhbHJlYWR5IGRlcGVuZHMgb24gZHluYW1pYyBs
aWJyYXJ5IHNpbmNlIGNvbW1pdAo+IDk5NjBiOTU3YTYzZThmZGQxOTdkOWNlZjZlYTU1YjFiMDVj
NDBlYzMgc28gaXQncyBub3QgbmVlZGVkIHRvIGFkZAo+IHRoaXMgZGVwZW5kZW5jeSBhIHNlY29u
ZCB0aW1lLgo+IEknbGwgc2VuZCBhIHBhdGNoIHRvIGRyb3AgaXQgZnJvbSBCUjJfUEFDS0FHRV9D
T0xMRUNURF9OT1RJRllfRU1BSUwuCgpPay4KCkJlc3QgcmVnYXJkcywKSGVydsOpCgotLSAKSGVy
dsOpIENvZGluYSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
