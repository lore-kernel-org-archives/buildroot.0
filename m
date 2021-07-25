Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB044C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:39:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8486660231
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8486660231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D6306060E;
	Sun, 25 Jul 2021 21:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFQhXLtciFcQ; Sun, 25 Jul 2021 21:39:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D53605B3;
	Sun, 25 Jul 2021 21:39:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B73BE1BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6A67832FF
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r_E-5g0QPyxb for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:39:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 917E9831A2
 for <buildroot@busybox.net>; Sun, 25 Jul 2021 21:39:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5A685200003;
 Sun, 25 Jul 2021 21:39:00 +0000 (UTC)
Date: Sun, 25 Jul 2021 23:38:59 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210725233859.723427e2@windsurf>
In-Reply-To: <20210331185001.24790-1-ps.report@gmx.net>
References: <20210331185001.24790-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/haveged: bump version to 1.9.14
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net, Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Wed, 31 Mar 2021 20:50:01 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - change clock_gettime option from yes/no style to disable/enable one
>   (still omitting the explicit disable to keep the configure logic
>   defaulting to yes in case no rdtsc is available)
> 
> - change to set all available configure options:
> 
>   * '--enable-daemon': previous default
> 
>   * '--disable-diagnostic': previous default
> 
>   * '-disable-init': do not install init files as buildroot ships its
>     own sysv/systemd init files
> 
>   * '--disable-nistest': disable tests, previous default
> 
>   * '--disable-enttest': new option, disable tests
> 
>   * '--disable-olt': previous default was yes, disable builtin test
> 
>   * '--enable-tune': previous default
> 
> - add patch to fix uclibc compile (disable dependency on sys/auxv.h
>   introduced with upstream commit [1])
> 
> Changelog ([2]):
> 
>   - made enttest configurable
>   - havegecmd.c - new command added to close the communication socket
>     [Werner Fink]
> 
> [1] https://github.com/jirka-h/haveged/commit/26d35af198da01220ba4f7a1b987f17012476c00
> [2] https://github.com/jirka-h/haveged/releases/tag/v1.9.14
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Thanks, I have applied to master.

> +# '--disable-init' as buildroot ships its own sysv/systemd init files

For the systemd case, we actually prefer to use upstream-provided unit
files in general. Do you think you could have a look at using
--enable-init in the systemd case ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
