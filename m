Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0827CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 17:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C8C840A04;
	Thu, 10 Feb 2022 17:31:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KyfWfY5sFs71; Thu, 10 Feb 2022 17:31:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF750409D0;
	Thu, 10 Feb 2022 17:31:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45E651BF228
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 17:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41CE5409D0
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 17:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZDqf-sMm7uN for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 17:31:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:101:465::110])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B66ED409BE
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 17:31:49 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4JvkM720Kpz9sm3
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 18:31:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1644514304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CLHKVqo5ub8haAAlbqXTzeiCRSxvlyw9v0nL9rWbZpQ=;
 b=sSgFmh3Qew+AagvP1gVHn6jmei/NDlP4czsubep4QFcXNv6xK31TW6ki0xcWCJWz6De1++
 7irNgXJXZqIofl63NG1MhUHMYaTmRZBvBQl0CLugg2mDdDJ5tqtdMiQqCcewofNjQuN4Fh
 Ev1UnMgPvO/JefH1o2PWJCXELxBeLzhIrgYQ3CPrUfuY2TWkLdasGlzTwkhUTyiLgFAoFJ
 9ZPLve8oOhb1mm+gvNGqQczHD7NA+ErRF2qCGuXeer16z9pifu5Q572VU0hr9PmiJ7adVz
 KY6wCewCAdXGnMb+YvlHvdEYM7wSNgBJ/ko+H7bZlMQDd1+HDnXxPRrptgf1mA==
Message-ID: <9be8fa8f-44d8-6025-3161-dd1818d9c323@othermo.de>
Date: Thu, 10 Feb 2022 18:31:38 +0100
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220209165213.4498-1-peter@korsgaard.com>
 <20220209213312.GE2249818@scaer>
 <2cba2cd6-ca70-6336-f2fe-60649a0f1a0d@mind.be>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <2cba2cd6-ca70-6336-f2fe-60649a0f1a0d@mind.be>
Subject: Re: [Buildroot] [PATCH 000/107] Drop python 2.7
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsIQoKT24gMTAuMDIuMjIgMTg6MTUsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgpb
Li4uXQo+IAo+IAo+IFRoZSBvbmVzIGluIGdzdDEtZGV2dG9vbHMubWsgYW5kIG9tbmlvcmIubWsg
bG9vayBpbXBvcnRhbnQsIHRoZSByZXN0IGlzIAo+IGp1c3QgY2xlYW51cC4gcXQ1d2ViZW5naW5l
IGlzIGFsc28gYSBiaXQgd29ycmlzb21lLi4uCj4gCj4gQWxzbywgc29tZSBjbGVhbnVwcyB0aGF0
IEkgdGhpbmsgYXJlIG5lZWRlZDoKPiAtIGdldCByaWQgb2YgSE9TVF9QWVRIT05fRk9PX05FRURT
X0hPU1RfUFlUSE9OCj4gLSBzeW1saW5rICQoSE9TVF9ESVIpL2Jpbi9weXRob24gdG8gcHl0aG9u
MywgYW5kIGdldCByaWQgb2YgdGhlIAo+IHdvcmthcm91bmRzIGluIGUuZy4gbm9kZWpzCgpUaGlz
IGxhc3QgYml0IHdvdWxkIGFjdHVhbGx5IHN1cGVyc2VkZSB0aGUgcGF0Y2ggSSBzZW5kIHllc3Rl
cmRheSA6LSkKCmh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9w
YXRjaC8yMDIyMDIwOTIxNDMwNS4zMTQyNzItMS1tYXJjdXMuaG9mZm1hbm5Ab3RoZXJtby5kZS8K
Cj4gCj4gCj4gIMKgUmVnYXJkcywKPiAgwqBBcm5vdXQKCkJlc3QsCk1hcmN1cwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
