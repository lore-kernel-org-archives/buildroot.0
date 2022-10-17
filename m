Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E388CC433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 21:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7990E60F7B;
	Mon, 17 Oct 2022 21:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7990E60F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id isTeRHBV_BzH; Mon, 17 Oct 2022 21:13:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2A7960BBE;
	Mon, 17 Oct 2022 21:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2A7960BBE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A82E81BF291
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 21:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E5B6417B3
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 21:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E5B6417B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MFVZ-n1RpERA for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 21:13:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 038B541702
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 038B541702
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 21:13:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0BB57FF808;
 Mon, 17 Oct 2022 21:13:08 +0000 (UTC)
Date: Mon, 17 Oct 2022 23:13:08 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221017231308.04f97bda@windsurf>
In-Reply-To: <20221017172918.1737004-1-peter@korsgaard.com>
References: <20221017172918.1737004-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666041189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62TbBwPo5d8q6kElStQc8GITEMJrDqPJgm7VnJKys5A=;
 b=oaZ6JrxKDNc3hgB0oueUAguJKE1QbkQjqbMmqz7Xs0t0izEamfnCQeuoQTMy3AWFAhjYCH
 BR2CN5OKplqVywzeO7dagQTDkBadJPfudrOlSoeqmswHJ568IDFWhcNC8RA/r72a4XE+3Z
 TeuR0pN5N+1hglEyJvT6tz7jYN3+WWEOgDkavxE8s+nEEZG7w8ixRpDLnR0Zl/DeQERMXm
 pgSbuiLEUltOquGbgo3EKZCj3fd4AOoAUY5kdi3SXQVLC5/tM3357LcAippRvL+/lxjPw1
 oh5me/uE6zvLWLIClaMUu4B6HW5LwIPBGRpsCPb6gKDCCMx24DMtOp9CYoPXOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oaZ6JrxK
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 version 4.0.8
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
Cc: Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Oct 2022 19:29:17 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2022-36359: Potential reflected file download vulnerability in
>   FileResponse (4.0.7)
>   https://www.djangoproject.com/weblog/2022/aug/03/security-releases/
> 
> - CVE-2022-41323: Potential denial-of-service vulnerability in
>   internationalized URLs (4.0.8)
>   https://www.djangoproject.com/weblog/2022/oct/04/security-releases/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
