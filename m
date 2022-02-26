Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AB7C433FE
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 10:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2960340018;
	Sat, 26 Feb 2022 10:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALshyY9YEtjU; Sat, 26 Feb 2022 10:32:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FDE1401A3;
	Sat, 26 Feb 2022 10:32:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 461871BF484
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34C838404E
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8X8r7nVDt7Yo for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 10:32:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C21BA8404A
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:32:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 74FE260004;
 Sat, 26 Feb 2022 10:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645871539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfjfgyTFWfDlwMXCn1ojKS86dVBvplOG4/sFBvDjMCU=;
 b=QhR96r6sRo1fl+5VUI7dAwhitSIEegf95Spzd4Lyx0+KNzfsLO3n5taAOZ5LDByjwsKlzk
 Ce+Rw9pbQRvypyNrTmqmKOccDpLsrjyMEhkfmwms5n9P0OVzg2ddeUpAJljGT93mC6GV+B
 YAC89FhuQ3I5F7HT04FtfAQQeoWF/86S18ZkBuWLuZbNImW0cBrKiS0XRK9vfvDYfMads6
 iVnwBMRo0mTgk5HUPEgMOGsTCIIrLGzNlt5yOgElO32p4OWkOqPjEeygDq+r4xpoKi9TBt
 15NoQnJ9YQJlI0i1IMSBKLpP/UA4gvLUkd3wMIm3AiSHgt8G9AssBJEpX6xypQ==
Date: Sat, 26 Feb 2022 11:32:18 +0100
To: Kamel Bouhara via buildroot <buildroot@buildroot.org>
Message-ID: <20220226113218.23e288ed@windsurf>
In-Reply-To: <20220225113400.802049-3-kamel.bouhara@bootlin.com>
References: <20220225113400.802049-1-kamel.bouhara@bootlin.com>
 <20220225113400.802049-3-kamel.bouhara@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/4] package/odb: add dependency on
 host-libodb
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kamel,

On Fri, 25 Feb 2022 12:33:58 +0100
Kamel Bouhara via buildroot <buildroot@buildroot.org> wrote:

> +# host-libodb is not needed to build host-odb, but it is needed to use
> +# the ODB compiler, as it install header files that are needed at
> +# runtime by the odb compiler.
> +HOST_ODB_DEPENDENCIES = host-libcutl host-libodb

You're in PATCH 2/4, and you're using host-libodb, which is only added
in PATCH 3/4. There is a patch ordering issue in your series.

> +ifeq ($(BR2_PACKAGE_BOOST),y)
> +HOST_ODB_DEPENDENCIES += host-boost host-libodb-boost

You're in PATCH 2/4, and you're using host-libodb-boost, which is only
added in PATCH 4/4, so there's another ordering issue in your series.

Also, the host-boost dependency here seems useless to me, as it's
implied by the host-libodb-boost dependency.

Also, why do you use ifeq ($(BR2_PACKAGE_BOOST),y) ? I think it would
be much more logical to use ifeq ($(BR2_PACKAGE_LIBODB_BOOST),y), no ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
