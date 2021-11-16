Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C7AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 14:26:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E63261C15
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 14:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E63261C15
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E18780F22;
	Tue, 16 Nov 2021 14:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXpi83jyHPuy; Tue, 16 Nov 2021 14:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B93280F2D;
	Tue, 16 Nov 2021 14:26:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C84C1BF378
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 14:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BACF607F0
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 14:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RX513v0rW3P8 for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 14:25:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9FAD607E9
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 14:25:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 68FE8E0003;
 Tue, 16 Nov 2021 14:25:53 +0000 (UTC)
Date: Tue, 16 Nov 2021 15:25:52 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20211116152552.0a9e32da@windsurf>
In-Reply-To: <CAJPV9MpFEQJk5otMfJkC0D2YNjLnanijNhHWSYT3ymtLYd2yeg@mail.gmail.com>
References: <CAJPV9MpFEQJk5otMfJkC0D2YNjLnanijNhHWSYT3ymtLYd2yeg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Running script after init
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6ksCgpPbiBUdWUsIDE2IE5vdiAyMDIxIDE0OjA4OjAyICswMjAwCkpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gQW55IGhpbnQg
d2hhdCB3b3VsZCBiZSB0aGUgcmlnaHQgcGxhY2UgaW4gYnVpbGRyb290Cj4gCj4gdXNlcnNwYWNl
IHRvIHB1dCBhbiBzY3JpcHQgYWZ0ZXIgdGhlIGluaXQgcHJvY2VzcyBpcyBvdmVyPwoKVGhlIGlu
aXQgcHJvY2VzcyBieSBpdHNlbGYgaXMgbmV2ZXIgb3ZlciwgaXQgY29udGludWVzIHRvIHJ1biB1
bnRpbCB5b3UKcmVib290IHlvdXIgc3lzdGVtLgoKQ291bGQgeW91IGNsYXJpZnkgeW91ciBxdWVz
dGlvbj8gWW91IHdhbnQgYSBzZXJ2aWNlIHRvIGJlIHN0YXJ0ZWQgYWZ0ZXIKYWxsIG90aGVyIHNl
cnZpY2VzPwoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBC
b290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
