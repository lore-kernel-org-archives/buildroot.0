Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454CBC369C9
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 08:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28264118F;
	Fri, 18 Apr 2025 08:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_GbQrilxk1O; Fri, 18 Apr 2025 08:54:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25FA2409F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25FA2409F7;
	Fri, 18 Apr 2025 08:54:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE8DF69
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C37D640EC5
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYee6FgHYvP3 for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 08:54:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83FD8409F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83FD8409F7
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83FD8409F7
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:54:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 66974581B42
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:16:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1EAA432F5;
 Fri, 18 Apr 2025 08:16:22 +0000 (UTC)
Mime-Version: 1.0
Date: Fri, 18 Apr 2025 10:16:09 +0200
Message-Id: <D99M68VW627P.XO8V028YRCUZ@bootlin.com>
To: =?utf-8?b?Si4gTmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc: <buildroot@buildroot.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, =?utf-8?q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>, "Mahyar Koshkouei"
 <mahyar.koshkouei@gmail.com>, "Eric Le Bihan" <eric.le.bihan.dev@free.fr>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250106-fix_mpv-v2-1-85117ce7b16b@bootlin.com>
 <Z_1CAle9fM33Yd4c@probook>
In-Reply-To: <Z_1CAle9fM33Yd4c@probook>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeduieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvfevuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdfvhhhomhgrshcuuehonhhnvghfihhllhgvfdcuoehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtkedugfelfedutdehfefhhfeihfejleeifedvjeeuvddtvdelieduffegudduhfenucffohhmrghinhepsghuihhlughrohhothdrohhrghdpghhithhhuhgsrdgtohhmpdgsuhhilhguqdhshihsthgvmhdqughifhhfvghrvghntggvshdrmhgunecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehjrdhnvghushgthhgrvghfvghrsehgmhigrdhnvghtpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrp
 hgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrhhihrghrrdhkohhshhhkohhuvghisehgmhgrihhlrdgtohhmpdhrtghpthhtohepvghrihgtrdhlvgdrsghihhgrnhdruggvvhesfhhrvggvrdhfrh
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744964183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BsqSjd0JJjbtq3KMzFVx3oMUPxJ/0GmzwEILlSTX35k=;
 b=EhIRQxbymWaglsRvok5Rgw9Evqpq/OemJbUBQ8RzRDbtPl03Dr1Iw7A7P2Q2ncZcA4Hqu/
 UwzGq/oU2ucTr/0xkl3uOTjOMk4AVq+FmXQjap2LqzmC9JQC1fF9DrtjpItv2A963/8EpT
 rsYHUHJ2hJfBv+Q/m+LZab4jF6cYOFJvKxNsX8Bv+jmSjprLJ6BDRbtED6NbM/8LL3mqK7
 Pqq9L1hwwaR6NWuW/L0gjYWrd9Jy9BRhtLXFCgFHRg5trneepoNrTPRt5c7kEvPJLwjE/C
 JAofeKLtRn9G51qAvzln/UipmKr6XXOA12OLzwdnp5RX52iN28Y5hcMhs8d5Iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EhIRQxby
Subject: Re: [Buildroot] [PATCH v2] package/mpv: switch to meson from waf
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uIEFwciAxNCwgMjAyNSBhdCA3OjEyIFBNIENFU1QsIEouIE5ldXNjaMOkZmVyIHdyb3Rl
Ogo+IEhlbGxvIFRob21hcywKPgo+IE9uIE1vbiwgSmFuIDA2LCAyMDI1IGF0IDEyOjIzOjQ5QU0g
KzAxMDAsIFRob21hcyBCb25uZWZpbGxlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+IFNpbmNlIGNv
bW1pdCBmZDU2MjMxNSwgd2hpY2ggdXBkYXRlZCB3YWYgdG8gdjIuMS4xLCBCdWlsZHJvb3QgaGFz
Cj4+IGVuY291bnRlcmVkIGlzc3VlcyBidWlsZGluZyBtcHYsIGxpa2VseSBkdWUgdG8gYW4gb3V0
ZGF0ZWQgdmVyc2lvbiBvZgo+PiB0aGUgd2FmIGJ1aWxkIHN5c3RlbS4KPj4KPj4gU3RhcnRpbmcg
d2l0aCBtcHYgdjAuMzUsIG1lc29uIHdhcyBpbnRyb2R1Y2VkIGFzIGFuIGFsdGVybmF0aXZlIHRv
IHdhZiwKPj4gYW5kIGluIG1wdiB2MC4zNywgd2FmIHdhcyBjb21wbGV0ZWx5IHJlbW92ZWQuCj4+
Cj4+IFRoaXMgY29tbWl0IHVwZGF0ZXMgdGhlIG1wdiBtYWtlZmlsZSB0byB1c2UgbWVzb24sIHJl
c29sdmluZyB0aGUgYnVpbGQKPj4gaXNzdWVzIGFuZCBzaW1wbGlmeWluZyBmdXR1cmUgdXBkYXRl
cyB0byBuZXdlciB2ZXJzaW9ucyBvZiBtcHYuCj4+Cj4+IEFsbCBvcHRpb25zIHByZXZpb3VzbHkg
dXNlZCBmb3IgV2FmIGhhdmUgYmVlbiB0cmFuc2xhdGVkIHRvIHRoZSBuZXcKPj4gYnVpbGQgc3lz
dGVtIGJ5IHJlcGxhY2luZyBgLS1kaXNhYmxlLWZlYXR1cmVgIHdpdGggYC1EZmVhdHVyZT1kaXNh
YmxlZGAKPj4gKGFuZCBzaW1pbGFybHkgZm9yIGVuYWJsaW5nIGZlYXR1cmVzKS4gU29tZSBmZWF0
dXJlcyBoYXZlIHNwZWNpYWwKPj4gaGFuZGxpbmc6Cj4+Cj4+IC0gVGhlIGAvdXNyYCBwcmVmaXgg
aXMgYXV0b21hdGljYWxseSBwYXNzZWQgdG8gbWVzb24gcGFja2FnZXMgYnkKPj4gICBkZWZhdWx0
Lgo+PiAtIFRoZSBBbmRyb2lkIGZlYXR1cmUgImhhcyBiZWVuIHJlbW92ZWQgc2luY2UgbWVzb24g
Y2FuIGRldGVjdCBpZiBhCj4+ICAgbWFjaGluZSBpcyBBbmRyb2lkIlsxXS4KPj4gLSBUaGUgYGxp
Ym1wdmAgcGFyYW1ldGVyIGhhcyBiZWVuIGVuYWJsZWQgaW4gdGhlIG1ha2VmaWxlIGFzIGBsaWJt
cHZgCj4+ICAgbXVzdCBiZSBidWlsdCBieSBkZWZhdWx0IHdpdGggbXB2Lgo+PiAtIE1lc29uIHBh
Y2thZ2VzIGF1dG9tYXRpY2FsbHkgc2V0IHdoZXRoZXIgdGhlIGxpYnJhcnkgc2hvdWxkIGJlIGJ1
aWx0Cj4+ICAgc3RhdGljYWxseSB1c2luZyB0aGUgYGRlZmF1bHRfbGlicmFyeWAgbWVzb24gcGFy
YW1ldGVyLgo+PiAtIE1lc29uIGF1dG9tYXRpY2FsbHkgZGV0ZWN0cyB0aGUgcHJlc2VuY2Ugb2Yg
YGxpYmF0b21pY2AgYW5kIHBhc3NlcyB0aGUKPj4gICBjb3JyZWN0IGFyZ3VtZW50IHRvIHRoZSBs
aW5rZXIuIEhvd2V2ZXIsIGl0IGlzIHBvc3NpYmxlIHRvIHNldCB0aGUKPj4gICBgc3RkYXRvbWlj
YCBtZXNvbiBwYXJhbWV0ZXIgdG8gc3BlY2lmeSB3aGV0aGVyIGBsaWJhdG9taWNgIG11c3Qgb3IK
Pj4gICBtdXN0IG5vdCBiZSB1c2VkLgo+Pgo+PiBGaXhlczoKPj4gICAgIGh0dHBzOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy82OGQ0MjQ0MWZjMGRhMzRlMWJmMmE0MjQ3NzI2ZjVm
NGVjM2I4ZTc3Lwo+Pgo+PiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9tcHYtcGxheWVyL21wdi9i
bG9iLzE0MGVjMjFjODlkNjcxZDM5Mjg3N2E3ZjNiOTFkNjdlN2Q3YjkyMzkvRE9DUy9idWlsZC1z
eXN0ZW0tZGlmZmVyZW5jZXMubWQ/cGxhaW49MSNMNDgKPj4KPj4gU2lnbmVkLW9mZi1ieTogVGhv
bWFzIEJvbm5lZmlsbGUgPHRob21hcy5ib25uZWZpbGxlQGJvb3RsaW4uY29tPgo+Cj4gSSdtIHRy
eWluZyB0byB1c2UgdGhpcyBwYXRjaCBvbiB0b3Agb2YgY3VycmVudCBtYXN0ZXIgKDIwMjUuMDIt
MjY4LWc2MzdlZWFkNzU1KQo+IGFuZCB0aGVyZSBzZWVtcyB0byBiZSBhIG1pbm9yIGluY29tcGF0
aWJpbGl0eToKPgo+IG91dHB1dC9idWlsZC9tcHYtMC4zNS4xL21lc29uLmJ1aWxkOjE6MDogRVJS
T1I6IE9wdGlvbiAiYnVpbGQtZGF0ZSIgdmFsdWUgZGlzYWJsZWQgaXMgbm90IGJvb2xlYW4gKHRy
dWUgb3IgZmFsc2UpLgo+Cj4+ICtNUFZfQ09ORl9PUFRTICs9IC1EYnVpbGQtZGF0ZT1kaXNhYmxl
ZAo+Cj4gV2l0aCB0aGF0IGNoYW5nZWQgdG8gLURidWlsZC1kYXRlPWZhbHNlOgo+Cj4gVGVzdGVk
LWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0Pgo+Cj4gVGhhbmtzIQoKSGVsbG8s
CkluZGVlZCwgd2hlbiBidWlsZGluZyB3aXRoIEJSMl9SRVBST0RVQ0lCTEUgdGhlIGJ1aWxkIGNy
YXNoZWQsIHRoYW5rIHlvdQpmb3IgeW91ciBmZWVkYmFjayAhCgpJJ2xsIHNlbmQgYSB2Mywgc29v
bi4KClJlZ2FyZHMsClRob21hcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
