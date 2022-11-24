Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BF2C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 21:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36C8F4035D;
	Thu, 24 Nov 2022 21:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36C8F4035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3yEVcOO1JAMv; Thu, 24 Nov 2022 21:58:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B8F2402E5;
	Thu, 24 Nov 2022 21:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B8F2402E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67F421BF311
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 354F982257
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 354F982257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMj0yoqNQ8Ia for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 21:58:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12BC78214C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12BC78214C
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 21:58:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92D8FC0008;
 Thu, 24 Nov 2022 21:58:17 +0000 (UTC)
Date: Thu, 24 Nov 2022 22:58:16 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221124225816.3d2c6a95@windsurf>
In-Reply-To: <20220920133224.3290270-1-giulio.benetti@benettiengineering.com>
References: <20220920133224.3290270-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669327098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HDNlxRwkEac06EiMs3ITRTts2fEYGNtjkHXwN+DCkIQ=;
 b=PbbL70BMFvrzV4hx//loAQGmGUuhpPe31pyKJnzseOU+tbmp3M0+QB9t+wOoXji9ekkeES
 SVSLcvDlWOJllxWgF+FYLR7YvZlmtDjVYzkEi8s0Cq8RkcymWN4tT0guXozQQN81HFAU8F
 Yu3kVgBgLAa6tKN3R9itnWmtZd0EJaaDDeTBCBA0y5RmSYphS1a/gULPuOMM6LE//nNIK1
 +Lgp29EOKBbIsOU8rU0NMX69nyQBq5a5GCsrkbeLVhsgRpYicZombLutowN9ggLKQo8l6Q
 y8Xtj5C2aF+n+8TGeEaxvCbU+g04K2C+MYtpHvEMX8O1apJ7W6kGfwXAdFdL7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PbbL70BM
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure due
 to missing Linux options
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
Cc: Kris Bahnsen <kris@embeddedTS.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Sep 2022 15:32:24 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Enable Linux options depending on the bus has been chosen, so:
> 1) enable by default common Linux options:
> CONFIG_NET
> CONFIG_WIRELESS
> CONFIG_CFG80211
> CONFIG_CRC_ITU_T
> CONFIG_CRC7
> 2) enable for SDIO bus:
> CONFIG_MMC
> 3) enable for SPI bus:
> CONFIG_SPI
> 
> Fixes:
> http://autobuild.buildroot.net/results/d8c4f0f959dd2ec110db8a75980f13172c3c116c/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/wilc-driver/wilc-driver.mk | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

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
