Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0A1E77372
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 12:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8231E83C6D;
	Sat, 30 Sep 2023 12:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8231E83C6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xIfRWa7zmBoz; Sat, 30 Sep 2023 12:38:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DE7983C72;
	Sat, 30 Sep 2023 12:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DE7983C72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EAB31BF3EB
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4787460DF0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4787460DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cy7a2Gljbnch for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 12:38:54 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFD5360D90
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFD5360D90
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6E37240004;
 Sat, 30 Sep 2023 12:38:49 +0000 (UTC)
Date: Sat, 30 Sep 2023 14:38:49 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230930143849.6ef63fe4@windsurf>
In-Reply-To: <20230626181531.2312002-2-james.hilliard1@gmail.com>
References: <20230626181531.2312002-1-james.hilliard1@gmail.com>
 <20230626181531.2312002-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696077531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZIpaYO+inOHc+s9iia58JsU6WinH1Ua00J0W5pPQM5E=;
 b=oY7vgeApGV1/R6aPpOVIJiIIK0T8l41UkSqqQNqXPF5XLy1GhOITSTSHOKDjA0pL0wpGt6
 41+mPqOkqdDaMEVTnLtzmoTMF4C5JhJP9v4GRSx+mqgOyDyVnduHElGluyTD/a7QBGnJmc
 9VzqV2KEyYPEh5JPOkQd+cePdjh/+r2LWmbmXLnhYfp4d1JnjC+OoZIxTb6m5PIjC9Q375
 SeFr2mxee8A4wJu4jfHaOvuQMeFYxFTo1sL9evTuha9AS3wnV3YH0DUPLFbznzT7y5VrAs
 qfjkWO4q5OCBLCxinQnxInO25XWde0YJSUOkVGYucV8yggScP3tJvqo7mGuncw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oY7vgeAp
Subject: Re: [Buildroot] [PATCH 2/5] package/python-pythran: bump to version
 0.13.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>, Michael Rommel <rommel@layer-7.net>,
 Samuel Martin <s.martin49@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 26 Jun 2023 12:15:28 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pythran/python-pythran.hash | 4 ++--
>  package/python-pythran/python-pythran.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

This was bumped separately in commit
cfde8aec04f67fd5d50c7fbd1ec73166fed0fbfb, so I've marked this patch as
not applicable.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
