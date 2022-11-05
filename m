Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBB6C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 775BC60AB0;
	Sat,  5 Nov 2022 22:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 775BC60AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6L0_LG3C51n; Sat,  5 Nov 2022 22:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98919607F6;
	Sat,  5 Nov 2022 22:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98919607F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 021B41BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD885408D1
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD885408D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P51GLGAH9RWP for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:04:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86258408CB
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86258408CB
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:04:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A0D6710000A;
 Sat,  5 Nov 2022 22:04:26 +0000 (UTC)
Date: Sat, 5 Nov 2022 23:04:24 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221105230424.753eaf3a@windsurf>
In-Reply-To: <20221105215718.647971-1-fontaine.fabrice@gmail.com>
References: <20221105215718.647971-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667685867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrYeWRk4J1F5a4vzmyQ9xv+0lb3s1zkc+1555EOjbvM=;
 b=kNh+/uBxnZAeiqT+2xVGvkYEfn4kV6MHVVij6nbg1cADI/gWTrgy9FXlaYW4Wmle/B9f0E
 gULjc+4MLmKDTLuDRQwBbfFyVZ4F750GBF4nqegDtV1TMRF8PL0Y4GJE4c0s26d9nf2GEp
 NzctkSuouhFZiFFQPB3d4JRyZffUZ6xULLX0XHRxlN7FF6tOS2mCYJFQR6EnxIrq9XCZBK
 dtS6FeooF5ZBjyKzW2CDln0Gp/vELiVB7Ee6M9dKrlK8OmcApGePLgvpbik/hGa0mtrh8H
 9gtIoiLY1zaufUfo+piaFKHN7Tnct4qAyN/GFtbEDVZYaDi9UANfneKcUymGUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kNh+/uBx
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: perf needs threads
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Nov 2022 22:57:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised (at least) since linux 4.0 and
> https://github.com/torvalds/linux/commit/459a3df76c99124fd222586be7f10f862547e7a9:
> 
>   CC      /home/autobuild/autobuild/instance-2/output-1/build/linux-6.0.1/tools/perf/builtin-bench.o
> In file included from builtin-bench.c:22:
> bench/bench.h:66:10: fatal error: pthread.h: No such file or directory
>    66 | #include <pthread.h>
>       |          ^~~~~~~~~~~
> 
> Fies:
>  - http://autobuild.buildroot.org/results/b6abd641f528101e74f9af33e54ccefe0731148f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/linux-tools/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

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
