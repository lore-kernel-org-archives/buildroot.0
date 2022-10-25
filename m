Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DFCFA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 21:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2596960BAB;
	Tue, 25 Oct 2022 21:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2596960BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feH7mPyIy2ua; Tue, 25 Oct 2022 21:01:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 524FF60B73;
	Tue, 25 Oct 2022 21:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 524FF60B73
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FB241BF33A
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86C7B40264
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 21:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86C7B40264
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8f4H7TNCbYO for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 21:00:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2599D40263
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2599D40263
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 21:00:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F04371BF207;
 Tue, 25 Oct 2022 21:00:25 +0000 (UTC)
Date: Tue, 25 Oct 2022 23:00:24 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221025230024.3ab84f31@windsurf>
In-Reply-To: <20221025180603.886122-1-james.hilliard1@gmail.com>
References: <20221025180603.886122-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666731626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uYptKG4yrwrKUO+ZSMGr25sF0SM5cb56ibv3HxbEm0I=;
 b=PyL0fjERp1tlEiVWIqkt1vwvJC8haEAZTG14nbHqv4UEf8S3Kcm61A+f9SnaFzljcBSPjO
 d6ntzpTIxfOs8XeZjbkierk8oEL3GIHidzyEczjXGiQxixOGv2bV0QUM93xxjVdxxEWAXZ
 wkoqI+rL+m8Fcsa1AojWt9VcbmUGTrxdRZbxim6rgzpMEytX2ZG7vD6L8Q0q4t2Ag6yGTo
 mKNpKmrhEjuPSgRUbAeFyhx/5s1kRPYosW9vIDmEhf6RyPmfw2vwnbWbUp5gIu41d2In3x
 GyPGVqxz4AXdBP5bGe6FNfACmwMPmWV1Pn4QDEZ+boUoSVL14bE9UGNSLnQdlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PyL0fjER
Subject: Re: [Buildroot] [PATCH 1/1] package/zbar: fix python 3.11
 compatibility
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
Cc: Volkov Viacheslav <sv99@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyNSBPY3QgMjAyMiAxMjowNjowMyAtMDYwMApKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEFkZCBhIHBhdGNoIGZyb20gdXBzdHJlYW0g
cHVsbCByZXF1ZXN0IHRvIGZpeCBidWlsZCB3aXRoIHB5dGhvbiAzLjExLgo+IAo+IEZpeGVzOgo+
IHB5dGhvbi9lbnVtLmM6IEluIGZ1bmN0aW9uIOKAmGVudW1pdGVtX25ld+KAmToKPiBweXRob24v
ZW51bS5jOjU1OjI1OiBlcnJvcjogbHZhbHVlIHJlcXVpcmVkIGFzIGxlZnQgb3BlcmFuZCBvZiBh
c3NpZ25tZW50Cj4gICAgNTUgfCAgICAgUHlfU0laRSgmc2VsZi0+dmFsKSA9IFB5X1NJWkUobG9u
Z3ZhbCk7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gcHl0aG9uL2VudW0u
YzogSW4gZnVuY3Rpb24g4oCYemJhckVudW1JdGVtX05ld+KAmToKPiBweXRob24vZW51bS5jOjE0
NjoyNTogZXJyb3I6IGx2YWx1ZSByZXF1aXJlZCBhcyBsZWZ0IG9wZXJhbmQgb2YgYXNzaWdubWVu
dAo+ICAgMTQ2IHwgICAgIFB5X1NJWkUoJnNlbGYtPnZhbCkgPSBQeV9TSVpFKGxvbmd2YWwpOwo+
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IAo+IFNpZ25lZC1vZmYtYnk6IEph
bWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IC0tLQo+ICAuLi55dGhv
bi1lbnVtLWZpeC1idWlsZC1mb3ItUHl0aG9uLTMuMTEucGF0Y2ggfCA2MiArKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3piYXIvMDAwMS1weXRob24tZW51bS1maXgtYnVpbGQtZm9yLVB5dGhv
bi0zLjExLnBhdGNoCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
