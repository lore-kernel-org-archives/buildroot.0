Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA23EE49AE
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD83441685;
	Tue, 22 Aug 2023 20:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD83441685
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A38IuQ4PxApx; Tue, 22 Aug 2023 20:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D241340965;
	Tue, 22 Aug 2023 20:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D241340965
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2F21BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA96660A8C
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA96660A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iMi21-lbn7hh for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:09:43 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D37C60783
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D37C60783
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6AF97240005;
 Tue, 22 Aug 2023 20:09:40 +0000 (UTC)
Date: Tue, 22 Aug 2023 22:09:39 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230822220939.1b53eca1@windsurf>
In-Reply-To: <20230813172524.354647-1-giulio.benetti@benettiengineering.com>
References: <20230813172524.354647-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692734980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shXVXxZNv1boLOtyhpN1M2nHxrDUNCdZpyHy/jErURQ=;
 b=lhh3YZVIJx7uOG8/yMjmXkCd80vqlDMK/ZyAGUNWRjUvrJDgocw4LEdDgj3Vni0oef/ey7
 56WIDiI2Ln0h/W+QDWDRaqRVx6KfGaHtmwHdKHWWD+pGV+q3egNpJFjcCbye+r3zPoyiPl
 v90LQVxvBnk1mpfiiq49oufqEP5Mg8YhjLbHrtmbF9M0piThVDA3UBseSzSqQkJT3eiZUy
 2SxuTbo2LkVo4pouy0ahZpJEUDRbQ/TX8vHpYq4e1QEuBT9pSnef39ubONbw84a9ZTsJDf
 k9+YKe7xsdBYK0CxrDMXw7ktGqw5XwMV8sovNJqCuDnwzQebjBuxerge2iZbvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lhh3YZVI
Subject: Re: [Buildroot] [PATCH] package/ramspeed: disable package if
 affected from gcc bug 43744
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

On Sun, 13 Aug 2023 19:25:24 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This package is affected by gcc bug 43744 and I have not found a work
> around for it(i.e. the common -O0 we use or other), so let's disable it if
> gcc has such bug.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ab289769c5fea435934ed260d38e0a4fdd2ba72d
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/ramspeed/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks. FYI, gcc bug 43744 is marked as RESOLVED
FIXED in the gcc bug tracker
(https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43744), so if you don't
reopen it, nobody is ever going to look into it :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
