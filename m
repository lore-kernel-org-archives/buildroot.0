Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F280C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 09:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA10560C22;
	Sun,  6 Feb 2022 09:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r108G5_OFQTb; Sun,  6 Feb 2022 09:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EAAD60759;
	Sun,  6 Feb 2022 09:30:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0434D1BF83C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDDEF60759
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXWA4Cinf_dX for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 09:30:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7546605EA
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 09:30:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id AA315200002;
 Sun,  6 Feb 2022 09:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644139841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/s4+aKXeTklmYKQfqC+T/5SqwP42zv47RebMdQxpZX4=;
 b=BGD8ojrSRNyyW2sbIZH4BgLbsBu5Wg1tlEquV1tUcNqInXFeYcFrQHViB9HT4P33dKRDYN
 appYrUNPgzw6eRbm9K06xiZoaFmSMfaH+1wcoTz9nllHleRc3WwoAoS9DhSINfnDYLoxE+
 C9FvAOZbWBETgFoTQ+TNyjDnrDiZYn7dXGrkXlx8dNK07qz2wvG29IL0hUunJcvmlNdBo0
 Evuk/R/eXSoGYDm1D2mPMe/24RXpta3kNyl/bnoep8jMN/RNQ7suCcuiGLN5nZpGsSsb2V
 IsuhwLDdH96TyUQSvOfQ84u/lT19BwQLmMwKp3EyQM6Ak8Yp3/RNvBgZBEmLMw==
Date: Sun, 6 Feb 2022 10:30:40 +0100
To: Pedro Aguilar <paguilar@paguilar.org>
Message-ID: <20220206103040.1704ef40@windsurf>
In-Reply-To: <20220206084334.1900252-1-paguilar@paguilar.org>
References: <20220206084334.1900252-1-paguilar@paguilar.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/guile: Guile 3.0.7 requires
 libiconv.
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

On Sun,  6 Feb 2022 09:43:34 +0100
Pedro Aguilar <paguilar@paguilar.org> wrote:

> This fixes the error reported in the daily results.
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

libiconv is normally needed only on toolchains that don't have
BR2_ENABLE_LOCALE. But the build failure of guile happens with glibc
toolchains, so it doesn't make much sense.

Are you sure that your analysis of the problem is correct? Could you
provide some more details?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
