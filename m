Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9181FC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 20:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28DCB419A9;
	Thu,  6 Oct 2022 20:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28DCB419A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0qcBsfzitYy; Thu,  6 Oct 2022 20:03:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1473B4193E;
	Thu,  6 Oct 2022 20:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1473B4193E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2E531BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C8F6813E7
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C8F6813E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZeSR99pg1f8 for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 20:03:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A122813E4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A122813E4
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 20:03:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 70F9D60002;
 Thu,  6 Oct 2022 20:03:36 +0000 (UTC)
Date: Thu, 6 Oct 2022 22:03:35 +0200
To: =?UTF-8?B?S8O2cnk=?= Maincent via buildroot <buildroot@buildroot.org>
Message-ID: <20221006220335.22132976@windsurf>
In-Reply-To: <20221005075815.305236-1-kory.maincent@bootlin.com>
References: <20221005075815.305236-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665086616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oqSQ5sV20EzpFcq9ZG7U//UiWo12lA5l8KzFrpu2Jg=;
 b=j3S3Iybc7LebqkqToYtvCNcehVctf28RPAjjpLXXfXRrSyJXzlkliA54SDRxVzgephP8Hy
 z2M+ASql8HUwYmLQiD0MTafd5VM9DHZh9pUn1Ajv3ptDMJj+ommnyMQJDKq+rBa+cAfQ4l
 xWU6x0GRxJwkOIS2KqdIPJvj7WfqOuROrS2hdfgEVhhXy+vt4S/2mxouCE8hM4Xl6bsX+Y
 x1fDZiHp+4v4KkngZ/vJ9EoBlNAbp9CVOZf9xw7qOh+CoWML8Qgvf/ntFo/wFB3UCaN+9B
 mXZ/PrJudU928q/XjKUWf2Ol0Bsy4hDMz2mr6v99o6/wUE7qW2zEpFuE2MFMwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j3S3Iybc
Subject: Re: [Buildroot] [PATCH 1/2] board/octavo/osd32mp1-red: update BSP
 components
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
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAgNSBPY3QgMjAyMiAwOTo1ODoxMyArMDIwMApLw7ZyeSBNYWluY2VudCB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEZyb206IEtvcnkgTWFp
bmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+Cj4gCj4gVXBkYXRlIGRlc2NyaXB0aW9u
Ogo+ICAgVEYtQSB0byB2Mi40LXN0bTMybXAtcjEKPiAgIFUtYm9vdCB0byB2ZXJzaW9uIHYyMDIw
LjEwLXN0bTMybXAtcjIuMQo+ICAgTGludXggdG8gdjUuMTAtc3RtMzJtcC1yMi4xCj4gCj4gVGhp
cyBwYXRjaCBhbHNvIHVwZGF0ZXMgVS1ib290IHRvIHRvIHVzZSBGSVAgaW1hZ2UuCj4gCj4gUmVm
ZXJlbmNlOgo+IAo+ICAgaHR0cHM6Ly9vY3Rhdm9zeXN0ZW1zLmNvbS9vY3Rhdm9fcHJvZHVjdHMv
b3NkMzJtcDEtcmVkLwo+IAo+IFRoZSBkZXZpY2UgdHJlZSBibG9icywgYW5kIHRoZSBVLWJvb3Qg
cGF0Y2hlcyBjb21lIGZyb20gT2N0YXZvIFN5c3RlbToKPiAKPiAgIGh0dHBzOi8vZ2l0aHViLmNv
bS9vY3Rhdm9zeXN0ZW1zL21ldGEtb2N0YXZvLW9zZDMybXAxCj4gCj4gU2lnbmVkLW9mZi1ieTog
S29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KCkkndmUgYXBwbGllZCBi
b3RoIHBhdGNoZXMsIGJ1dCB0byBiZSBob25lc3QsIEkgaGF0ZSBoYXZpbmcgdGhlc2UgaHVnZQpE
ZXZpY2UgVHJlZSBmaWxlcyBpbiBCdWlsZHJvb3QuLi4KClRob21hcwotLSAKVGhvbWFzIFBldGF6
em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcK
aHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
