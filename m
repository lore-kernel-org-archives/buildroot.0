Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CC4C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 11:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA43183B8C;
	Sat, 29 Jul 2023 11:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA43183B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rW7yTrBdkV89; Sat, 29 Jul 2023 11:57:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34DE083B38;
	Sat, 29 Jul 2023 11:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34DE083B38
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2B61BF82C
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 11:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7980840182
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 11:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7980840182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NHG_nvRsV_UQ for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 11:57:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84854400C8
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 11:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84854400C8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1899F1C0004;
 Sat, 29 Jul 2023 11:57:48 +0000 (UTC)
Date: Sat, 29 Jul 2023 13:57:47 +0200
To: Maksim Kiselev <bigunclemax@gmail.com>
Message-ID: <20230729135747.24539c4b@windsurf>
In-Reply-To: <20230516082340.1375834-2-bigunclemax@gmail.com>
References: <20230516082340.1375834-1-bigunclemax@gmail.com>
 <20230516082340.1375834-2-bigunclemax@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690631869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqvtKio5qesWiL3gBxoC2gqFiLR/nR7mYddlx7tuinQ=;
 b=KtDP9uxq87plEsP//BnvcrNUbzEmLksWcVG9kkIK1uHxep63jP4JcFmuynWFz9l7/oK9+f
 Fiano9GKbWI6f6vtgQQEBaxaNcpX6hUPIplxAQVYznHUacWix2VEtTlhE90Y3nP1XSI2gP
 jQBrHM/3zT7qpUL5uXy3Be4Bdl9ha+zG1G7Kr9up1uUOUAxBlTZpJ+FIXJwl9crvu5tdSv
 SPErQB3T3RtcsQAiKx/mu3Q11ACtIVxc930xLYuFiWJq98b46eSi5OqUrsh3DrqkirINbW
 9miv9xhghlZonbmlBSa2ZLZbYyX1ZiqLVuMZJ66COtk9uFkq3Hp1Bs5LbOOseQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KtDP9uxq
Subject: Re: [Buildroot] [PATCH v1 2/2] package/fio: add optional libiscsi
 dependency
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
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 May 2023 11:23:40 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

> Since commit 247ef2a fio has optional libiscsi engine support
> 
> This patch enables fio iscsi support if BR2_PACKAGE_LIBISCSI
> was selected

As pkg-config is used by the configure script to detect how to
compile/link against libiscsi, I've added host-pkgconf to the
dependencies when BR2_PACKAGE_LIBISCSI=y. I also updated a bit the
commit log to explain why we don't pass --disable-libiscsi.

Applied with those changes, thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
