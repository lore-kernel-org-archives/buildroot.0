Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AA8C4167B
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0EAA81765;
	Sun, 11 Dec 2022 13:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0EAA81765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9iYPU9UxdfS; Sun, 11 Dec 2022 13:22:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A93E81699;
	Sun, 11 Dec 2022 13:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A93E81699
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C954B1BF2BD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A240A81699
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A240A81699
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JvmGRqTWR_VN for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:22:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70464813E8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70464813E8
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:22:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 63E22240003;
 Sun, 11 Dec 2022 13:22:32 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:22:30 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221211142230.7e0e691d@windsurf>
In-Reply-To: <20221208202721.5592-1-fontaine.fabrice@gmail.com>
References: <20221208202721.5592-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670764952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KFzLFRZQHKGZIIW0WwebeWGgBO0FQzjgjB5gVlyMQzM=;
 b=M2sp7SWNmcFcF5s8r+R1clJHWsTg8lhdrNeAHsYmflEAq4HFu1I7hl41CIbCprb+tg+H80
 uNOh7nWC4JuVb3Sx6Hxptc1+PnLwvQL+c7ndAbwYeSiQlSo9yzGlPO55QSxbSKet6Xs/BO
 Lw68KKcPJwIJvpHTWqpCcqnt65k1fkaVBKiAVEfXhgu2Fhlh1aTG+JJWgdVIdHaKgfvedu
 JSwNtWMp3TA9ULrJycQPky4u5dtub2dscU0yZcbgM8NQkATK/T6Yd0i80BIut0ErJj8o6p
 bbs28oXff5kY0cDQI/sQQbyL4MXU9EeCWz8xdVrzeDpEnkCWgws+BR0chuyBLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M2sp7SWN
Subject: Re: [Buildroot] [PATCH 1/1] package/lttng-tools: bump to version
 2.13.8
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Dec 2022 21:27:21 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following build failure without NPTL thanks to
> https://github.com/lttng/lttng-tools/commit/27f2b8400c9db484cd195c4240c379e845b1413d
> which is raised since bump to version 2.13.2 in commit
> 8e5f2d0f8e8c04e98f8761f3cba683c56bbefc8c and
> https://github.com/lttng/lttng-tools/commit/014d7d3b5e9d69989bf776cffb6c21ff7e1d36ff:
> 
> In file included from thread.c:10:
> ../../src/common/compat/pthread.h: In function 'lttng_pthread_setname_np':
> ../../src/common/compat/pthread.h:63:27: error: 'LTTNG_UST_ABI_PROCNAME_LEN' undeclared (first use in this function)
>    63 |         if (strnlen(name, LTTNG_UST_ABI_PROCNAME_LEN) >= LTTNG_UST_ABI_PROCNAME_LEN) {
>       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> https://github.com/lttng/lttng-tools/blob/v2.13.8/ChangeLog
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bbc8d6621822bb5da7513331e69799ca25a03f66
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lttng-tools/lttng-tools.hash | 4 ++--
>  package/lttng-tools/lttng-tools.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
