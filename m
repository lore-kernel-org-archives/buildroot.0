Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3736DC001DF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9C62421EE;
	Fri, 28 Jul 2023 20:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C62421EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ys9dcrY-F-Xu; Fri, 28 Jul 2023 20:26:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE34E421E7;
	Fri, 28 Jul 2023 20:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE34E421E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C75571BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A03D984563
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A03D984563
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HResVqcuSXf6 for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:26:49 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81D5B84561
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D5B84561
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD5BFC0003;
 Fri, 28 Jul 2023 20:26:46 +0000 (UTC)
Date: Fri, 28 Jul 2023 22:26:45 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230728222645.6def9f22@windsurf>
In-Reply-To: <20230724172847.51864-1-ju.o@free.fr>
References: <20230724172847.51864-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690576006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Z3cuKDH5IEBQ4IO+GnfxuCzYZ2wzpSQzgMJbsnqkh8=;
 b=pv5eKXwIKC4g7rWUT3lCN8DTM0wlbQml5bQ5Mwh8PcN+nNqCK+c2aPHG6j8hIwmjhJ5H/T
 dqzNtAD1NFcOf5esuS/XP8IjZJsYTx2G16B586dX/5u3uLo7O8sF52htTKEgPoO+oEM6gs
 1ZaZGDG9e2SguhrkXJgr4YcMS2jBx4YF8fqoYRkFWZQotG3V3hJgshyyj8imXLdSRiGm/Y
 z9mnbeV9Ev9yrPaKahMSrpsMi2x6Mr6k8my8DlwVpmcKXsRKTuCgE0yXVVeNYrUJeYAoaB
 c6dMz+qCwfiHv1nKibCW+0gCZxdjEQtVOCvEt/f/wYcpCZzbRFLHgTyUSgsirA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pv5eKXwI
Subject: Re: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v47.0
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

On Mon, 24 Jul 2023 19:28:47 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/linux-rdma/rdma-core/releases/tag/v47.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit f359791 with commands:

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
