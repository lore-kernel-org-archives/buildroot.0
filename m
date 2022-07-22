Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3109CCA473
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4691B423CF;
	Fri, 22 Jul 2022 21:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4691B423CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dLPiE9npLZmA; Fri, 22 Jul 2022 21:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B575422E2;
	Fri, 22 Jul 2022 21:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B575422E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D68F11BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF01E819D2
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF01E819D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Otd-7GtMA1SE for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:17:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B607819CC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B607819CC
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:17:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1DCA6240003;
 Fri, 22 Jul 2022 21:17:17 +0000 (UTC)
Date: Fri, 22 Jul 2022 23:17:17 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20220722231717.64292580@windsurf>
In-Reply-To: <20220614110211.706283-1-raphael.melotte@mind.be>
References: <20220614110211.706283-1-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658524639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJpPvf56QUeEH60aPbLPwmX7pCuuPXtxtDgtRJtJtic=;
 b=Te2ifPHZfQ+cJsChdR31zB4T4zrFmEZliubT8rBYbIFxr7JsE3fKOtnjoH6SqDqclWSt2q
 vhkw1xImqx66INYFQBugFm7uFQ372ieYcwFpwcC55y58ZWa7Qz5T2T+XfttI3796oq2nsX
 WZG74EJA8t1AI/RKYxMs6npSG440pJX9kd2nGGuJkcGaEsAJ29vskwdtRr7ESRz8NfB7sK
 8OTYNISRxOHwFq9nh0CRTMkzdzpvCPOg2ml+7WWqXycPs9/EWN9xpuvxG/2myQDknveiqF
 cLDFx+mWL6Er0B3NP/gbPHGrZUfdP1tyR6k6eIjLT0B/Wqe3ad/2EEWUg0Zy1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Te2ifPHZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rsa: bump to version 4.8
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxNCBKdW4gMjAyMiAxMzowMjowOSArMDIwMApSYXBoYcOrbCBNw6lsb3R0ZSA8cmFw
aGFlbC5tZWxvdHRlQG1pbmQuYmU+IHdyb3RlOgoKPiBXaGlsZSBhdCBpdCwgdXBkYXRlIHRoZSBp
bmRlbnRhdGlvbiBvZiB0aGUgbGljZW5zZSBoYXNoICh0d28gc3BhY2VzKS4KPiAKPiBDaGFuZ2Vs
b2c6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3N5YnJlbnN0dXZlbC9weXRob24tcnNhL2Jsb2IvbWFp
bi9DSEFOR0VMT0cubWQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFw
aGFlbC5tZWxvdHRlQG1pbmQuYmU+Cj4gLS0tCj4gIHBhY2thZ2UvcHl0aG9uLXJzYS9weXRob24t
cnNhLmhhc2ggfCA0ICsrLS0KPiAgcGFja2FnZS9weXRob24tcnNhL3B5dGhvbi1yc2EubWsgICB8
IDQgKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpv
bmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
