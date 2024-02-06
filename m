Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CBCC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE86A4158B;
	Tue,  6 Feb 2024 15:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE86A4158B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RkE2llt-dah9; Tue,  6 Feb 2024 15:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CA1441586;
	Tue,  6 Feb 2024 15:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CA1441586
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD0921BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B26BD41FAC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B26BD41FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LxRC-Q9QRsXz for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:21:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A314341F8C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A314341F8C
Received: by mail.gandi.net (Postfix) with ESMTPSA id D042AC0008;
 Tue,  6 Feb 2024 15:21:12 +0000 (UTC)
Date: Tue, 6 Feb 2024 16:21:12 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206162112.16152573@windsurf>
In-Reply-To: <20240110050813.1109654-1-james.hilliard1@gmail.com>
References: <20240110050813.1109654-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707232873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hFCAwgYHAARAT4iUTCGvPeqqYITf5IIYNIZiehFKIeE=;
 b=DbDx3kypSSEiVpO3UZ1Rji6dGZvZAHi5uMgC/CbGLMeCL9NYAjpzq2CZpq7Ao6ezpZvixy
 ezNvCzQ5v6/wIEzvpvy8lmFM/VFzFZI0EjO5nTuHkPhjkkRFGhw/PpKwivA+HifSbDs9Mo
 fCUarK4hZCugA89tA7sQqDBr0vzydE40I8P3P8nk/rv0H2PIJsWIJcpuQ+mkd41q+hhOCh
 vO0jDpj3KG9BYIjxCeSrl4VzWvDkve5IX/R5KwdIsSaQxzTyp/h94KjxeYPR8HpZL1Cr7v
 HQExgTUj1QmusNbxcW42mXcjrica6lJEaz/ySHRFt3AZGR/ecDhqY8xCjo7lCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DbDx3kyp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyhamcrest: bump to
 version 2.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 22:08:13 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from setuptools to hatchling pep517 build backend.
> 
> Drop no longer required python-setuptools runtime dependency.
> 
> Drop no longer required python-six runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pyhamcrest/Config.in              | 2 --
>  package/python-pyhamcrest/python-pyhamcrest.hash | 4 ++--
>  package/python-pyhamcrest/python-pyhamcrest.mk   | 9 ++++++---
>  3 files changed, 8 insertions(+), 7 deletions(-)

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
