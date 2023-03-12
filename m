Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2499C74A4B
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CA8D41CA0;
	Sun, 12 Mar 2023 22:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CA8D41CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NelZM5oZtjtj; Sun, 12 Mar 2023 22:13:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8726041676;
	Sun, 12 Mar 2023 22:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8726041676
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AAF21BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01701607C1
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01701607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v1dkO3KVQcJI for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:13:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D458560B22
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D458560B22
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:13:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2C235240007;
 Sun, 12 Mar 2023 22:13:24 +0000 (UTC)
Date: Sun, 12 Mar 2023 23:13:23 +0100
To: Pedro Aguilar <paguilar@paguilar.org>
Message-ID: <20230312231323.55d64c41@windsurf>
In-Reply-To: <20230305165130.974432-1-paguilar@paguilar.org>
References: <20230305165130.974432-1-paguilar@paguilar.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678659204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hh4/mzv+5l0EO8V5GK0OFDfv8ZUoEHlgjOq2kFQ0H/8=;
 b=dbDUVQw8uuEwcy0UIyTin5UR2EAk5eHH/eAVxxdBrlurOez707+YhAd48LDdB1n4kFr6M4
 aUd5wPnskwATve41YiSDQla6bfE/w/RBmw7k7TiiN7q8m9RMBphdL1bfsQbFb6KTgot2t3
 HDhFjvkBaBZB18S2YTqFJilHtf+K3lkXwYFFM6TPcvOaPLM5ser5sPsZ6zkfFuxtMaLWl3
 D1UEM1pO4cU3XkeV8GbjCdY6wpZPmbNRiiBO7glcZc45FvxZNRuvi5WUUWUDZatSV6NDaT
 orsshILqvvT739Azo8epAkjvPxr48/HnUrwJelJuPHawuEofwDcoc9ms857HQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dbDUVQw8
Subject: Re: [Buildroot] [PATCH 1/1] package/guile: bump to version 3.0.9
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

On Sun,  5 Mar 2023 17:51:30 +0100
Pedro Aguilar <paguilar@paguilar.org> wrote:

> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> ---
>  package/guile/guile.hash | 2 +-
>  package/guile/guile.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
