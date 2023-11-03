Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2133CC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 19:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E15740461;
	Fri,  3 Nov 2023 19:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E15740461
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VW9Ujf28YKaB; Fri,  3 Nov 2023 19:55:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C18A54047B;
	Fri,  3 Nov 2023 19:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C18A54047B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D6E701BF357
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD651416B9
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD651416B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A6uPNqpPfQIh for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 19:54:38 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D714416B4
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 19:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D714416B4
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6CC460005;
 Fri,  3 Nov 2023 19:54:35 +0000 (UTC)
Date: Fri, 3 Nov 2023 20:54:34 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231103205434.4ad2d880@windsurf>
In-Reply-To: <20231103184428.1029306-1-adam.duskett@amarulasolutions.com>
References: <20231103184428.1029306-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699041276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7pB882fYJCD5PobNdnGnObXD+MA+fgBcEIz6UdxUcQ=;
 b=LTvWzCPDtV5LRdxkHGaAPK6f/53IQJrbK+UjntaXHS6Mrgohrj7jq20H2HebpJRcP7zE2K
 d05aq/lBnM/Xflej6OiAK+uQJIaHEh3JEftBLJF67Y1RwFsk9oG9q9vOVoWFX/HyxEuA97
 opFSn1vcDbi4moTO+qvu5BANCpdoOtCCCZmC+Jc+i3ND/qktC1zvgKf/7n7AnwbctccSXc
 2FginjkzFydPUDrEXHNQK2ATV13XyNrdDtKXFSGH71rTCIXsIxYq356K73283k3SHEet8Y
 5ez4XIhqkiqjoMCdygVJ9XQYY1vWVSwsNl5Lj9hiUvQx/uh9MfykFpHHKKbL0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LTvWzCPD
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 4.2.7
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  3 Nov 2023 12:44:28 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

>  - Fixed a regression in Django 4.2 that caused a crash of QuerySet.aggregate()
>    with aggregates referencing expressions containing subqueries (#34798).
> 
>  - Restored, following a regression in Django 4.2, creating
>    varchar/text_pattern_ops indexes on CharField and TextField with
>    deterministic collations on PostgreSQL (#34932).
> 
> Tested on Fedora 39 with:
> ./support/testing/run-tests tests.package.test_python_django
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
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
