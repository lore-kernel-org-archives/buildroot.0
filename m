Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977CAEEB570
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 928EB41620;
	Fri,  8 Sep 2023 20:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 928EB41620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPBhTXgVrAJS; Fri,  8 Sep 2023 20:46:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E7441734;
	Fri,  8 Sep 2023 20:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95E7441734
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB7821BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3A7641620
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3A7641620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rA7wiOLxXsN for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:46:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80275415FD
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80275415FD
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6D3C1BF204;
 Fri,  8 Sep 2023 20:46:26 +0000 (UTC)
Date: Fri, 8 Sep 2023 22:46:25 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230908224625.069210f2@windsurf>
In-Reply-To: <20230905204634.2462368-1-james.hilliard1@gmail.com>
References: <20230905204634.2462368-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694205986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhNTwTm+q2AdyQzhbZ+m149WDx0wg+RhCk8re8LIzdM=;
 b=VW+9E8kDcmV3uqhBUaox89TJG+bCi+K98HXPk2eqquOPP/f45dE6+6nsfApelK03yn0tZq
 n09qhXa4R6T6N6SKuceDymfyZNqXAudLEcE37MaLAsRw8F57lmFWSO1PErPTbJf5zSp0HK
 aWhBixvlT3JWyTgl2yyv9CS7NxhjF22RhyMlaxlSrwuzkGeLajwk9dD5m/rp0O+Z0QSSI1
 yyOnN9J8QEbCVTaPyIMk8L280mn5K6XqkvDJIo9b6VCRpTTMMmhc43nWzQ3q5pjMcouVaQ
 nsvz2iFC6cP3slbaUIZ21Q4Ulj2/QjJAjxaan1mMzp2aQnTlccr1dezG6quioQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VW+9E8kD
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself as developer for
 all python packages
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

On Tue,  5 Sep 2023 14:46:34 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS | 71 +-----------------------------------------------------
>  1 file changed, 1 insertion(+), 70 deletions(-)

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
