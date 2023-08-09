Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E84C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 466E941B93;
	Wed,  9 Aug 2023 17:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 466E941B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sUpAdrGElMJ7; Wed,  9 Aug 2023 17:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC612402B7;
	Wed,  9 Aug 2023 17:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC612402B7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BC0C1BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35C5183A47
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35C5183A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bSLq6BnYrm8s for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:40:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E93AF83A9E
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E93AF83A9E
Received: by mail.gandi.net (Postfix) with ESMTPSA id C48FCC0006;
 Wed,  9 Aug 2023 17:40:33 +0000 (UTC)
Date: Wed, 9 Aug 2023 19:40:32 +0200
To: =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez via buildroot <buildroot@buildroot.org>
Message-ID: <20230809194032.5f6a0ec6@windsurf>
In-Reply-To: <20230809075623.306089-1-clement.ramirez@bootlin.com>
References: <20230809075623.306089-1-clement.ramirez@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691602834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N4sYLGYTwT3+VuuB0E0h7NGukMIA1J9IBPvD5Wtkzlc=;
 b=nZja3EWJmnQgy95gsGOevTLVizsm6K2u6DcK5ltxm4kAnY695sqbOyzdUGGeyJw1Mzi06u
 3Ymp331Bb27OIApZk82nI8UCnV+UWFznXT4n9B6xHPYA15oUgWk5raGcUQNNKECeZ15bIF
 XW9xib/5OxKgi6wfKAdW9kcjCH/4/S2EzXfeeLlWZ5BEwQqvOcgwVSrTF29ETr29oM0qOD
 p6oCQZ4UoYWlAQyBpXmCt8gtvwhL1IeJww9/831CoE8fMoI6z32mNvugipzbe++RY2kYQy
 Ry+aO3PZ25umKY9BrzNdii1n8sA/W69HEwskCGIZSZlE9MbO5JVg8VIgw51arQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nZja3EWJ
Subject: Re: [Buildroot] [PATCH 1/1] package/composer: add
 COMPOSER_CPE_ID_VENDOR
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
Cc: =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAgOSBBdWcgMjAyMyAwOTo1NjoyMyArMDIwMApDbMOpbWVudCBSYW1pcmV6IHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gY3BlOjIuMzphOmdl
dGNvbXBvc2VyOmNvbXBvc2VyIGlzIGEgdmFsaWQgaWRlbnRpZmllciBmb3IKPiB0aGlzIHBhY2th
Z2U6Cj4gaHR0cHM6Ly9udmQubmlzdC5nb3YvcHJvZHVjdHMvY3BlL3NlYXJjaC9yZXN1bHRzP25h
bWluZ0Zvcm1hdD0yLjMma2V5d29yZD1nZXRjb21wb3Nlcgo+IAo+IFNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IFJhbWlyZXogPGNsZW1lbnQucmFtaXJlekBib290bGluLmNvbT4KPiAtLS0KPiAgcGFj
a2FnZS9jb21wb3Nlci9jb21wb3Nlci5tayB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQ
ZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
