Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60469C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0500C4174F;
	Mon, 30 May 2022 21:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id USRa4AJ8VNGm; Mon, 30 May 2022 21:32:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C59704168B;
	Mon, 30 May 2022 21:32:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B2511BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A227416CC
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBLfGPE4jskX for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:32:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 071014168B
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:32:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0A5B3240006;
 Mon, 30 May 2022 21:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653946326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYBvlTnjng15G3v6WF364FAMkYsBT0H7++oYno9FcO8=;
 b=hNBtZRUNUUX77Bu80L16AVEJ6uiI7cjruNAOD0VkLCqD7oD7sTGViepQfHom9E9j0Gbv7A
 U9x2gMdf+JjtfcLfu3dsp+vrP3U2s1mF8mTstbCfwNF5jz6pM61YObwqWiJmTxb9HNbb/m
 78A0GHwWxBwpH0TvsRx9vo9vPsH+pLFrtHMxuJXyY2XWWy3p9s330FNC/JHFACcTb6AF6h
 YcUX6rE1Beqb4wUyRHla684Xz/lELOjktieQQB+EgPEbZGRcYHDFgj5SDfggckBsNivt90
 xNXVx5iHV1D6d6WW/Zksi6b98Bgyf9hcoArGzo/SoqeXJ7bXbeyhqwYpZ48jPw==
Date: Mon, 30 May 2022 23:32:05 +0200
To: Dimi Tomov <dimi@tpm.dev>
Message-ID: <20220530233205.6c401a4e@windsurf>
In-Reply-To: <20220530203001.574908-2-dimi@tpm.dev>
References: <20220508212014.629607-1-dimi@tpm.dev>
 <20220530203001.574908-1-dimi@tpm.dev>
 <20220530203001.574908-2-dimi@tpm.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] v2: Fix typo in the hash file and
 create path before using touch
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

Hello,

On Mon, 30 May 2022 23:30:01 +0300
Dimi Tomov <dimi@tpm.dev> wrote:

> From: Dimitar Tomov <dimi@tpm.dev>
> 
> Signed-off-by: Dimitar Tomov <dimi@tpm.dev>

This should be squashed into PATCH 1/2. Have a look at "git rebase -i"
(named "git interactive rebase") to squash your commits.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
