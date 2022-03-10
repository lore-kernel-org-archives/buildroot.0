Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279E7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 13:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC7E140576;
	Thu, 10 Mar 2022 13:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ul4BnE2GL2jG; Thu, 10 Mar 2022 13:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 753764027F;
	Thu, 10 Mar 2022 13:30:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31A891BF386
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 13:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2067781414
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 13:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0s7uLyah36is for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 13:30:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD05B81412
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 13:30:05 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 829CB20011;
 Thu, 10 Mar 2022 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646919000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9f1JYtpZpB9dCdpufsjhpOMYOtAgDaYy+z4Of5pJ5fw=;
 b=W+9ouYEgJLQ9H1EoNRVEgu2ERxf4nBc2agtbayedhjIqZ/vCukusLL6swv28KVt9PnIdvV
 BGapPcTiBEzkBtlYDi97DPv+q+KaGuCwdKQWYFm1815LFaYOOZ1yeu5qkVUWxFqMq/0CVK
 NM8vqB6NuaIRA4pj7U+/jlm32b67xpZbjOOawjePak3/GoKqjH5lbYk6YCEu2QCygtu2T4
 c+TkVKKa0LZpLs45Q8VKf92V/dBRIXXg1UZsNx8TOlgvtWPp+spxy1Ao90qTSMlYzPMrby
 xZnwsv3FF735dQFs/gc78E/4BIH+SnM/1TfCOhujAk/9meraz/vOIFIOftB18A==
Date: Thu, 10 Mar 2022 14:28:36 +0100
To: buildroot@buildroot.org
Message-ID: <20220310142836.2c8e1787@fixe.home>
In-Reply-To: <20220310080745.16903-1-clement.leger@bootlin.com>
References: <20220310080745.16903-1-clement.leger@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 0/3] boot/optee-os: support new optee-os
 3.16.0 build dependencies
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
From: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgVGh1LCAxMCBNYXIgMjAyMiAwOTowNzo0MiArMDEwMCwKQ2zDqW1lbnQgTMOpZ2VyIDxjbGVt
ZW50LmxlZ2VyQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cgo+IE5ld2VyIHZlcnNpb25zIG9mIG9w
dGVlLW9zICg+PSAzLjE2LjApIHVzZXMgcHl0aG9uLWNyeXB0b2dyYXBoeSBpbnN0ZWFkCj4gb2Yg
cHl0aG9uLXB5Y3J5cHRvZG9tZXggdG8gYnVpbGQuIFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCB0
byBidWlsZAo+IGhvc3QtcHl0aG9uLWNyeXB0b2dyYXBoeSBhbmQgdXNlcyBpdCBpbiBvcHRlZS1v
cyBwYWNrYWdlIHRvIGJ1aWxkIHRoZQo+IDMuMTYuMCB2ZXJzaW9uLgo+IAo+IENsw6ltZW50IEzD
qWdlciAoMyk6Cj4gICBwYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFwaHk6IGVuYWJsZSBob3N0IHBh
Y2thZ2UKPiAgIGJvb3Qvb3B0ZWUtb3M6IGFkZCBzdXBwb3J0IHRvIGJ1aWxkIHdpdGggcHl0aG9u
LWNyeXB0b2dyYXBoeQo+ICAgYm9vdC9vcHRlZS1vczogYnVtcCB0byB2ZXJzaW9uIDMuMTYuMAo+
IAo+ICBib290L29wdGVlLW9zL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDEzICsrKysrKysrKysrLS0KPiAgYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMyArLS0KPiAgYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tayAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNyArKysrKystCj4gIHBhY2thZ2UvcHl0aG9uLWNyeXB0
b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rIHwgIDcgKysrKysrKwo+ICA0IGZpbGVzIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCgpBY3R1YWxseSwgYWxs
IG9wdGVlIHBhY2thZ2VzIG5lZWRzIHRvIGJlIHVwZGF0ZWQgdG8gMy4xNi4wLiBQbGVhc2UKaWdu
b3JlIHRoaXMgdmVyc2lvbi4gSSdsbCBzZW5kIGEgVjIgdXBkYXRpbmcgb3RoZXIgcGFja2FnZXMu
CgpUaGFua3MsCgotLSAKQ2zDqW1lbnQgTMOpZ2VyLApFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVs
IGVuZ2luZWVyIGF0IEJvb3RsaW4KaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
