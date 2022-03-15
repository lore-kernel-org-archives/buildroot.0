Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B68C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 08:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12D94409D9;
	Tue, 15 Mar 2022 08:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeHBUchEXTpe; Tue, 15 Mar 2022 08:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D77040949;
	Tue, 15 Mar 2022 08:10:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35B871BF2A0
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 08:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F13740949
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 08:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mwtgv-lSidTi for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 08:10:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CF5F40525
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 08:10:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 72243100006;
 Tue, 15 Mar 2022 08:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647331843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tHwPOq1HCVH8bfkoHojShP7uQ5U2PFQCawOwlHmyNyY=;
 b=R5JdO5iGBAgebbi4BFqb4d2ZmHXWUjbai23Fj0XUw19R+QgXQN+kIzBmyCpB+lWgHVFxwQ
 wmxNJty5Lub3BhBdN/6xXlkTd4F4xAhLN+oRgF8zXExS8lU1ZdDwpeaW1dUiVspEa5jfE0
 OCm6725LAsmctKGy/ZO9i3upmUHDEp2vuejf0PM4jWV6xZeESaAmhttjst4eS0qOHllAaA
 dL5M3iU9DfZZ8jDinE3GeUyGFyJWZ8hyv1uZV225XxdMlBEI1FEH43WP2avjOLCZbXosyo
 HR+nO3XLj9t63a7yWCNnTPzYZUr0k1pTRa2tEur4lgWvcgvD1/bJLHD6n+D14Q==
Date: Tue, 15 Mar 2022 09:10:41 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220315091041.015209a9@windsurf>
In-Reply-To: <20220314203149.GW283544@scaer>
References: <20220314153111.1390512-1-clement.leger@bootlin.com>
 <20220314153111.1390512-3-clement.leger@bootlin.com>
 <20220314203149.GW283544@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 2/8] package/python-cryptography: enable
 host package
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxNCBNYXIgMjAyMiAyMTozMTo0OSArMDEwMAoiWWFubiBFLiBNT1JJTiIgPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gSSB0aGluayB0aGUgaG9zdCB2YXJpYW50IHNo
b3VsZCBhdXRvbWF0aWNhbGx5IGluaGVyaXQgdGhhdCBzZXR0aW5nIGZyb20KPiB0aGUgdGFyZ2V0
IHZhcmlhbnQuCj4gCj4gQWZ0ZXJhbGwsIGl0IHNlZW1zIHJlYXNvbmFibGUgdG8gZXhwZWN0IHRo
YXQgdGhlIGRvd25sb2FkIG9mIHRoZSBob3N0Cj4gYW5kIHRhcmdldCB2YXJpYW50cyBzaG91bGQg
dXN1YWxseSBiZSBleGFjdGx5IHRoZSBzYW1lLgoKSSBhZ3JlZSwgYnV0IEkgdGhvdWdodCB0aGlz
IHdhcyByZWFsbHkgdG9vIG11Y2ggb3V0c2lkZSBvZiB3aGF0IENsw6ltZW50CmlzIHRyeWluZyB0
byBhY2hpZXZlIGluIHRoaXMgcGF0Y2ggc2VyaWVzIChJIGhlbHBlZCBDbMOpbWVudCBpbnRlcm5h
bGx5CmJ5IHJldmlld2luZy9kaXNjdXNzaW5nIHRoaXMgcGF0Y2ggc2VyaWVzLCBhbmQgaW5kZWVk
IGlkZW50aWZpZWQgdGhlCmZhY3QgdGhhdCB0aG9zZSB2YXJpYWJsZXMgc2hvdWxkIGJlIGluaGVy
aXRlZCBiZXR3ZWVuIHRhcmdldC9ob3N0KS4KCkJ1dCBvZiBjb3Vyc2UgaWYgYXMgYSBtYWludGFp
bmVyIHlvdSB0aGluayB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IGlzCnJlYWxseSBuZWVkZWQgYXMg
YSBwcmUtcmVxdWlzaXRlIHRvIG1lcmdlIHRob3NlIHBhdGNoZXMsIHdlIGNhbiBhc2sKQ2zDqW1l
bnQgdG8gd29yayBvbiB0aGlzIDotKQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1v
d25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
