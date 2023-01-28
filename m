Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B15C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04A7540583;
	Sat, 28 Jan 2023 21:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04A7540583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFkNNftxU8rJ; Sat, 28 Jan 2023 21:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46E51404B9;
	Sat, 28 Jan 2023 21:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46E51404B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C0EF1BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64BC7410CB
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64BC7410CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DaFO7lVFGAWC for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:55:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC2F8408D0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC2F8408D0
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:55:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0EBCE1BF203;
 Sat, 28 Jan 2023 21:55:43 +0000 (UTC)
Date: Sat, 28 Jan 2023 22:55:43 +0100
To: Petr Vorel <pevik@seznam.cz>
Message-ID: <20230128225543.16657dc4@windsurf>
In-Reply-To: <20230127223256.132401-1-pevik@seznam.cz>
References: <20230127223256.132401-1-pevik@seznam.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674942945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nVJP7Ls3C2KZJwB8haC43b5NJKyyXPK6ASSNMPbzyCA=;
 b=H6p9BQZe/tLoTN7dtIzf94LLJ1D/WjQGGOYHBwYrCDY/0UmaIVkeUnktd7fnRVVePtxbxg
 OQe50BvDHXv42LsYNVQ+e4qdjeGSJfI1c0zUyoau0dunXSPfzzHZMXxWhy+p9pK4hU/q/e
 1ocNIMtzSWo+1a50luTqU+x+uBpjfL1nov+iCb+Z/tW8MyISADlSBwajuODlP+Lu47PhhL
 FaduDhiEo0kal/Hp0U3/qxZa/GvjFhvQhuN1iRYDK4NZMJkw0NVJES6vhKkOZZkgzhHa9I
 9wxDPviouKn+OkWGhqzlAx1LmPXeSW7mV858qpd4jlr3FEsZosITGewNrdTzkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H6p9BQZe
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20230127
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

Hello Petr,

On Fri, 27 Jan 2023 23:32:56 +0100
Petr Vorel <pevik@seznam.cz> wrote:

> From: Petr Vorel <petr.vorel@gmail.com>
> 
> Remove musl related sysinfo.h patch. This Buildroot specific workaround
> is not needed any more (kernel got fixed in a85cbe6159ff ("uapi: move
> constants from <linux/kernel.h> to <linux/const.h>") in v5.11, some time
> took to rebuilt Buildroot toolchains, but even that was more than year
> ago).

Sorry, but this explanation is not entirely clear to me. Do you mean
that only toolchains with kernel headers >= 5.11 will no longer have
the problem? We definitely need to support toolchains that have kernel
headers < 5.11.

> NOTE: I'd like to add /opt/ltp/runltp-ng (tools/runltp-ng/runltp-ng in
> source, from [1]) symlink to /usr/bin (that should be trivial).
> The tool should have only Python 3.6+ (no external modules so far)
> and while we (LTP upstream developers) would recommend to not use it on
> SUT (guest), where LTP is being run, but on host, we agreed to put
> runltp-ng on both sides SUT (target package) and on host (host package).
> But whole thing might take me more time thus posting updated package
> without it.

In the context of Buildroot, I guess it makes sense to be able to start
the LTP test suite directly on the target, so indeed it would make
sense to have runltp-ng on the target. However, you could also have a
host package to install runltp-ng on the host for those who want to run
it on their machine, and control the execution of the tests on their
target.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
