Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B245CC6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 19:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D72741CD1;
	Sat, 17 Sep 2022 19:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D72741CD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUws8RFPHk7v; Sat, 17 Sep 2022 19:45:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FF9841949;
	Sat, 17 Sep 2022 19:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FF9841949
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDEC61BF96B
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9BB54011F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9BB54011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHsr3uTifhm2 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 19:45:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BB5740119
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BB5740119
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 19:45:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4C5FA1C0007;
 Sat, 17 Sep 2022 19:45:32 +0000 (UTC)
Date: Sat, 17 Sep 2022 21:45:30 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220917214530.36be736a@windsurf>
In-Reply-To: <20220917184224.2257865-1-peter@korsgaard.com>
References: <20220917184224.2257865-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663443932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QlsjytFxD4miPsOOuXNvjKjdfvJWOaSn73Npg8azYww=;
 b=kbXkmwFc7uxhw5W/deNUY3TSJmuj8TA/rJNxYPjRFN0T8e1ExcCbWHIYRkDyo24EwLD5Rt
 bDVcMczs9YAli23RHhfrk2FM7hIesJSctCcj1bJEnPwv1MhR20r1tuIDWnMNlBpbm55NB9
 3/QE3VVUW7XdIvHU3VCiznHKFOvSpUPk2qNbctSkWaYcM0IBVFtfuO6zd2Xjb7ifVzIsfI
 K1Vsm6oTMMYOGKufZHr3WFOAEcZFAw/xVEBWcuKNs++0mTxaUQxfWQ+wzRMc/rcLh9tTOp
 zmwjcjlaeHLeJzK1HXvb7S261VnrYhs89+9A0mDjRHSTjEHaO9pP7tUZskeznQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kbXkmwFc
Subject: Re: [Buildroot] [PATCH] package/libmdbx: drop explicit
 _REDISTRIBUTE = YES
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
Cc: Leonid Yuriev <leo@yuriev.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 17 Sep 2022 20:42:23 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> <pkg>_REDISTRIBUTE defaults to YES, so no need to explicitly set it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libmdbx/libmdbx.mk | 1 -
>  1 file changed, 1 deletion(-)

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
