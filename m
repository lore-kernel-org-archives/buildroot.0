Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCC8C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 17:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBA19607A7;
	Sat,  8 Feb 2025 17:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DINYX-enlIeG; Sat,  8 Feb 2025 17:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6DA560764
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6DA560764;
	Sat,  8 Feb 2025 17:50:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85F0012B
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69BDB80E94
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8bDp8IuC_Dp for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 17:50:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6125780E7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6125780E7A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6125780E7A
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:50:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 24304B00548;
 Sat,  8 Feb 2025 18:50:21 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:58680])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Feb 2025 18:50:21 +0100
MIME-Version: 1.0
Date: Sat, 08 Feb 2025 18:50:21 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20250208153929.197344-1-thomas.petazzoni@bootlin.com>
References: <20250208153929.197344-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <463b86cabade2c5b11aed9ba35ed2631@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739037023;
 bh=MlRDogEk1/rY5T5KaYLbZeWP22OlWkEJRLRzPaVYeDI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W4NLxwYpZLQ6dlfjiuk/dl/M7fHht9dQmsLKr4W3yVunF14jQlvT5s1uCmyvCxDjW
 1CoJtyxthXPHuQiKk7iXGlWJKCv1sIQRDri0fgy+j7LXg68Anq8rlSS7g0K7bKZjtU
 8vFsUO2RzDLP3c3VBirz8tY/f1hTetDeeYfb2WdWvIqHvGKiUhm7dWJCgM6QsAzTY3
 gESLmTUGJSMH7e284UkPL0ofqOjxQHx92eB2YU0E7AzevhhKyQPA7jza9zMax0DWRJ
 BaHir7vUSXPqAIPECKyjOIA3juIrQZXXev4QGJS43sJXgwJh8gzqqopn0LTineZnHD
 HX75Y4llFK8jQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=W4NLxwYp
Subject: Re: [Buildroot] [PATCH] package/busybox: disable
 CONFIG_FEATURE_IP_LINK_CAN if headers < 4.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/02/2025 16:39, Thomas Petazzoni wrote:
> Since the recent bump of Busybox to 1.37.0 in commit
> ed84e971c36b43f564df881d86ac459bb5b7dad0, the build fails on
> configurations with old kernel headers. Indeed, the new
> CONFIG_FEATURE_IP_LINK_CAN Busybox option uses IFLA_CAN_TERMINATION,
> which was only introduced in Linux 4.11.
> 
> This commit addresses this issue by disabling
> CONFIG_FEATURE_IP_LINK_CAN if the headers are not old enough.
> 
> Fixes:
> 
>   https://gitlab.com/kubu93/buildroot/-/jobs/9059854451
> 
> Fixes: ed84e971c36b43f564df881d86ac459bb5b7dad0 ("package/busybox bump 
> version to 1.37.0")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
