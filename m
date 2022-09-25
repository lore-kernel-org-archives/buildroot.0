Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28406C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 09:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF36860B03;
	Sun, 25 Sep 2022 09:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF36860B03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VqvVhrjlPzW; Sun, 25 Sep 2022 09:27:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D341260AEA;
	Sun, 25 Sep 2022 09:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D341260AEA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AB6D1BF5A9
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2667E60AEA
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2667E60AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C9v0L4Je8mPE for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 09:27:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E30FF606F5
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E30FF606F5
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 09:27:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 31BE1100002;
 Sun, 25 Sep 2022 09:27:17 +0000 (UTC)
Date: Sun, 25 Sep 2022 11:27:16 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Ignacy =?UTF-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Message-ID: <20220925112716.3b12a155@windsurf>
In-Reply-To: <20220925084943.sere4idtgtsuc4c6@zenon.in.qult.net>
References: <20220925084943.sere4idtgtsuc4c6@zenon.in.qult.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664098037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zy1UBViWuz6L/byr7I/A1shOAQN76pWiZi3F49jVmdY=;
 b=buVuPixomj2zxmjIezXN1wTnMSmh3PyENrm1lTgyFQwt1JNO4MR5HVcJpJ3PdunSC/EmPd
 kcO023qILbZ+f86ozhcy/oLE0+SGUlDLHh0OHp3yS5zIAM/Hmx9Cn9yYMnPwL1TYvC6D++
 Ky/IvvBXriyw9s74xXIBbVc2UC8M6qxx/Nl8uSsm4YMQHRG7peqQ1YDmvQo36DpGP1CnXD
 m3a2pSBU26NBog23un/wkfmZv/fY2KY0osVfwHBjbkdzcw57DtMGykJi5XpR8FQ1ZXAly/
 Ndk4lh1iWaKeP7r4uensRSe/WecdkZRIoRpD7+n13r2gxnpQ/BNiVsEEKXh++Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=buVuPixo
Subject: Re: [Buildroot] [PATCH v5] package/chartjs: bump to version 3.9.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSWduYWN5LAoKT24gU3VuLCAyNSBTZXAgMjAyMiAxMDo0OTo0MyArMDIwMApJZ25hY3kg
R2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+IHdyb3Rl
OgoKPiBodHRwczovL2dpdGh1Yi5jb20vY2hhcnRqcy9DaGFydC5qcy9yZWxlYXNlcy90YWcvdjMu
OS4xCj4gCj4gTGljZW5zZSBmaWxlIGhhcyB1cGRhdGVkIGNvcHlyaWdodCB5ZWFycyB0byAyMDE0
LTIwMjIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWduYWN5IEdhd8SZZHpraSA8aWduYWN5Lmdhd2Vk
emtpQGdyZWVuLWNvbW11bmljYXRpb25zLmZyPgoKVGhhbmtzLCBidXQgd2UgZG8gbm90IHdhbnQg
YSB2NTogeW91ciB2NCBoYXMgYWxyZWFkeSBiZWVuIGFwcGxpZWQgdG8KbWFzdGVyLiBXaGF0IHdl
IHdhbnQgaXMgYSBmaXgtdXAgcGF0Y2ggdGhhdCBhcHBsaWVzIG9uIHRvcCBvZiB3aGF0IGlzCmFs
cmVhZHkgaW4gQnVpbGRyb290IG1hc3Rlci4KCkFuZCBpbiB0aGUgY29tbWl0IGxvZyBmb3IgdGhp
cyBwYXRjaCwgcGxlYXNlIGFkZCBhIHJlZmVyZW5jZSB0byB0aGUKYXV0b2J1aWxkZXIgZmFpbHVy
ZSB0aGF0IGl0IGlzIGZpeGluZy4gVGhhbmtzIGEgbG90IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0
YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
