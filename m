Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2EBC07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 331F940BF6;
	Mon, 26 Sep 2022 12:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 331F940BF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7gF67hIanqdC; Mon, 26 Sep 2022 12:03:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B95A40BED;
	Mon, 26 Sep 2022 12:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B95A40BED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E4A31BF3F7
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79E82812B7
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79E82812B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fn0emRMYAPoO for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:03:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 045C7812A7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 045C7812A7
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:03:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 390EEC0006;
 Mon, 26 Sep 2022 12:03:34 +0000 (UTC)
Date: Mon, 26 Sep 2022 14:03:33 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Message-ID: <20220926140333.3719371b@windsurf>
In-Reply-To: <20220925132218.3848758-1-clg@kaod.org>
References: <20220925132218.3848758-1-clg@kaod.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664193815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YfQXEla8hfSvoitaTaWwAByaMxbLaGr6LzR6pvC3h84=;
 b=n0hKuOWWxUyglDlg11XiG/u/vVYHuwYqycp6OSlcA5eKRvlGpVv9ddJhj0g6QJPxcCM+fr
 OuwW0876HlFeG8I9mne7SNrokdvnnOWBQfsPNlWsbL6MWBAQlb9eCUzgfQ4pgKzvU73usv
 TeCBruVLHVs8/FlFFys5Yusxg5V5ahqRS50DsUR5Y8JXKMUZu+sHGq3dyHibcCyRwx17C7
 /+kKLCparU4P1AZWibnMdKkkclkFcmy1Ldrd9S8aYAlnx7aY13ao0HOhA9AdcFCmcbh4jV
 41byXryazTVW88LyLFG3LoojZ4XNhehUMEyOcfMdRjjzOwuJWv51Y51hf8Z9rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n0hKuOWW
Subject: Re: [Buildroot] [PATCH] configs/aspeed_ast2600evb: Set
 BR2_ARM_FPU_VFPV4D16
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
Cc: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAyNSBTZXAgMjAyMiAxNToyMjoxOCArMDIwMApDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPiB3cm90ZToKCj4gVGhlIGZlYXR1cmVzIG9mIHRoZSBDb3J0ZXggQTcgQ1BVIG9u
IHRoZSBBc3BlZWQgQVNUMjYwMCBBMyBTb0MgYXJlIDoKPiAKPiAgIGhhbGYgdGh1bWIgZmFzdG11
bHQgdmZwIGVkc3AgdmZwdjMgdmZwdjNkMTYgdGxzIHZmcHY0IGlkaXZhIGlkaXZ0IGxwYWUgZXZ0
c3RybQo+IAo+IHRoZSB2ZnB2M2QxNiBmZWF0dXJlIGJpdCBpcyBjb21tb24gdG8gYm90aCB2ZnB2
MyBhbmQgdmZwdjQuCj4gCj4gRHJvcCBCUjJfQVJNX0ZQVV9WRlBWNCB3aGljaCBhY3RpdmF0ZXMg
dGhlIHVzZSBvZiB2cGZkMzIgKGFuZCBicmVha3MKPiB1c2VyIHNwYWNlKS4gU2V0IEJSMl9BUk1f
RlBVX1ZGUFY0RDE2IGluc3RlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0
ZXIgPGNsZ0BrYW9kLm9yZz4KPiAtLS0KPiAgY29uZmlncy9hc3BlZWRfYXN0MjYwMGV2Yl9kZWZj
b25maWcgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6
em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcK
aHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
